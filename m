Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF237C0EC;
	Wed,  7 Oct 2026 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404621; cv=none; b=IIGpxPeDqy5n0lG2YO0y+SVSZuOQXHrXcDDwObCFmjHDSV5Ok/TTIRkJYgy3SRUQAJCoOG5YjG9bkAKcBwgvUYj1KvVG7y+p88ddVHVQrLinv+ilJ8tB2VjVtxs0O16mhyo4YEd8UJ/CCmiUI3xWL21uBCXf145+oBIO8curj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404621; c=relaxed/simple;
	bh=k5rmK8638fN+53Ue60YF8rsPuqw5rAeAe5qpIHHvRNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fx7ZF9nRUYPUXKWXOSEsh2TjLjMWpMQRpSIsijBnVDktgsmBW0ThBJi5KrKWXjSSTwy+JOX9U7PjH47E3ZYXOK9uIVtmWXmJ2o3SW8su54tJW7aM6SU1XRCo0gUFiHSLMcDbZ+dYh7/D0z6IBF8+p7TYAuBOZxnlycJ3WX5TOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8RcSFVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8RcSFVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BBE1F000FF;
	Wed,  7 Oct 2026 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791404620;
	bh=xhLP80GXVtS6CE3RvF7MHseUyKQXwhqc65xg2C8JDq8=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=j8RcSFVTqWJYNtcD5cHQrg/tBRXhIiK0v0z6JiB9gxdGY8hdAmF1jYl8QxNOeIRuX
	 9ypyelNNLYJNylDJIA2yqEtxUKGahYoeGYRv6U4Qza8frbpi26hhxKj7yOqbnf9V1+
	 xv2WDRFBRkIOGQYDuprqK0tbidn0CWNR4Vj6oSFsjiavyl9WrEapvnsJUP3yRveVi+
	 s4hDL3jy57ZALN+qPx2U5NXiastyEfGt+ly9IxDmwveWmVHhkK9dQ17bNpp5l1hliZ
	 hNqji7Xy4ZjNECzFan8mf70UD2A2PaLygusmXZTreARPxn+qgXyuV0pI6eSwBL4VaB
	 3Hk12uTt6NfEQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D9780CE0D79; Wed,  7 Oct 2026 13:23:39 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:23:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT RFC PULL] Fix double dereference in TP_printk() in usb mtu3
Message-ID: <84064d39-6f44-4b4b-98f8-895a0294a3cf@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Linus,

Please pull this urgent fix for a tracing splat in usb mtu3, which is a
pre-existing bug that can corrupt tracing output, but which was exposed
this cycle by additional checking that was added to the tracing subsystem.

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/usb-mtu3.2026.10.06a
  # HEAD: cfb3293c4573289f11f913611f530ea6b1926d67: usb: mtu3: Fix double dereference in TP_printk (2026-09-29 17:26:50 -0700)

----------------------------------------------------------------
usb: mtu3: Fix a double-dereference splat in TP_printk

This splat is reporting a double-dereference that can result in garbage
traces being dumped due to the possibility of the TP_printk() being
executed without the benefit of main memory being present.  The fix is to
move the extra dereference from TP_printk() time to TP_fast_assign() time.

----------------------------------------------------------------
Vladimir Murzin (1):
      usb: mtu3: Fix double dereference in TP_printk

 drivers/usb/mtu3/mtu3_trace.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

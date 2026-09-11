Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0194AEBFC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150583; cv=none; b=UVezQn4FqPCwbzhelk64IdgkLa/PO6C+TjEnjwTy9eprx/yFTMtWF5hgaDzg+FLGOgZwHRhQz8wmtbkyd/r9WeWUBnKT0bLz+Fz1tR6KPj3I+I3d4SFrCZaHpln0MbWrhrcgeQvhCYR2TVBA7bi8TZEgz/13tnTFfjW1nRQ3KfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150583; c=relaxed/simple;
	bh=7ro2pE3u1riMhANQCJdihA9BGA1wIj4E7MHaErE/2kI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=V/lOHTn872aitovB8v4j17hiL9aUxe+JBIOSYd/6QoxnCHdd55lPgtKGw2I9xEJBU1Epkpk3iMPqUxYuRgZMDC20K2VtwaV3Yy/OX8txpjXFX+ZKdDJCPFZmFNy7NWdMRUGmMAqbX7q4GQzPaVbZBDaQXmqJ++RLvEnL9Boo9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWiM2aBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWiM2aBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0491F008AB;
	Fri, 11 Sep 2026 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150570;
	bh=LhELnr2rFNek0pOOslIV9nnQKN7vIKo6BwdAORpnRjg=;
	h=Date:From:To:Cc:Subject:References;
	b=LWiM2aBh6hZ9lG4jFEnBhvZsAuq+L3rwhKTHTIDNold916Yl2XCCdCij7UdzqZzok
	 F1xpyP0/HILFrkcY5f3p3CfvKFMNSQbl72pavrUxK3y31KtzLxhGHMxuVKV3EkOopu
	 GnqkDILnEnceq7zaNY27Kgy3RSLZHsF0tKG2d+vtJ91E/QH5kXwH5qxtbBf2+okhHE
	 o3Jb5pC8cQg/+60FpnWXYl2QR3widaRbehlYye1tL3FLCDqW7Wwb53gS4mrGrLoft8
	 KbNoOss9/wTBEKyHcNqYjeqfyJFleKekHMqsvnFezF79EROEHhdhRe4nGFiC/p8cLx
	 bzsygn6f0Jglg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x55oZ-0000000954Z-4906;
	Fri, 11 Sep 2026 14:17:31 -0400
Message-ID: <20260911181731.813962582@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 11 Sep 2026 14:16:54 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Karl Mehltretter <kmehltretter@gmail.com>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 18/20] tracing: Fix ring_buffer_read_page_size() kernel-doc
References: <20260911181636.485043797@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Karl Mehltretter <kmehltretter@gmail.com>

ring_buffer_read_page_size() takes a parameter named rpage, but its
kernel-doc describes page. As a result, kernel-doc reports rpage as
undescribed and page as an excess parameter description.

Rename the documentation entry to match the function.

Link: https://patch.msgid.link/20260909062917.89482-1-kmehltretter@gmail.com
Fixes: dae8dda341d2 ("tracing: Fix subbuf resize races with trace_pipe_raw readers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c03a555a6ba..0e30c7bd6045 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7384,7 +7384,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_read_page_data);
 
 /**
  * ring_buffer_read_page_size - get size of the read page.
- * @page:  the page to get the size from
+ * @rpage:  the page to get the size from
  *
  * Returns size of the page in bytes.
  */
-- 
2.53.0

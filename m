Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204F231A55E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794373; cv=none; b=kLqA7K/vIhlB/PRhICTraPoBblBlRWqsMS3Z0er2nEx3ywig3Ql0rPcYCruWBWvGz4gR7e0Q3Xzy+z6r1yqFMdhYIZ3BYnxx0YAcAeT/WnSeEo8uSZ2CwsglvdECqV8aemyUMNgB79ebvQsbbG0MA37eSjdSSaR9buIRfoqakOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794373; c=relaxed/simple;
	bh=4C6+eNV44v1WMlKvjnadDWGayvPIl/ifklp40+OWWR0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nr81DBcb2y2OBqAKipqC5n3h+5AdWyBH5jSIBOqxVZFBocHvtND22MTV4/aTaceflLWElJB6FG6rgZZiXmKHbsyslWrHgT9+D00brXDMrq/aQgdEys/+lgWwLhkEzGZ9SUCrWSJADHBIO/gteNbU379p4qFHs1yQBRsUIJt0Os4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckrsK2MN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckrsK2MN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A31F0089B;
	Mon, 12 Oct 2026 08:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794371;
	bh=wVAZKf1WgTDugj/by+guOQ75mp9U2OQ+yA5vNeODNbM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ckrsK2MNZPwQpbPfWLSS3y0LbgqVoNWiIZ2GWZQIhuTTiB/rC9xwKTiIdlaRyJFkU
	 SqLmg9+N2DsLIgIhyvRuyhvQu3yd9QUWmGFsoOn7IRA/uM6+HFRHrhV7t32kJt/2N5
	 rWrVuk973GnJ7gmuieUXTKg1Cr2ZkQgScr8r0m+wcJBpIV7xjxXnd0w725OI53FOBh
	 zs+b2l15TpB7u7W+lRyF53cpOt4r1W6qBlrLSwJrExSU9O64sSR8jpFrytV0aNrJUI
	 a6dEv5HDQDu3PXRioSv8uVdLp7RDVGnJ8yp7Sa1A8YloQY89JMxZfTmDykqzenW4Gz
	 HJUxXRoe24Ggg==
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>, 
 Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20261011123440.768054-1-nickolai@csail.mit.edu>
References: <20261011123440.768054-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v2] exit: fix lost-update race on the child_subreaper
 bitfields
Message-Id: <20261012-thema-notizen-umfragen-cffa61c6724f@brauner>
Date: Mon, 12 Oct 2026 10:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Sun, 11 Oct 2026 08:34:39 -0400, Nickolai Zeldovich wrote:
> is_child_subreaper, has_child_subreaper, autoreap and, with
> CONFIG_POSIX_TIMERS=y, timer_create_restore_ids are 1-bit fields that
> share one memory location in struct signal_struct.  A store to any of
> them is a read-modify-write of the whole word, and three of the stores
> run without a common lock:
> 
>   - PR_SET_CHILD_SUBREAPER writes me->signal->is_child_subreaper with
>     no lock held.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] exit: fix lost-update race on the child_subreaper bitfields
      https://git.kernel.org/vfs/vfs/c/56d5dcb2d6d5


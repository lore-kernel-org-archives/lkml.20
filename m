Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351577;
	b=RTVfBMxAl5M86sR+GpaZv59ElrgbLdAVXkLsUg8YH1DHbO7UX1gW2OSJMRJbT+onKlgB
	 mauSaKr53APUXYZO1MHZSbPptbOww/Fq56Qh9RBKovS7g+5jntMdmpjsVtAKJ9YjVthjg
	 UKcns4On7+ZpMamW76bNGDmXTds1w1HGemt/A7pHGKKocfkTydE+RdVgzS/j095ymZz9v
	 0UESaOtwiF9C2SfvEjLZSElvFtkLUE0GgrRa2zAgqP7annbsJxW6xDTxnzKXbBZJr8vjI
	 mep4OLpLfS/GyAgvFKAYIXGtXXyAcMydIji/zff+sdaPQU5d4JFTzCGm2JACDmn0tjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351577;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KkxotD1wD6foVjYR2Bpi4d6Lv4CK6kLaSFBOfUoryjw=;
	b=USpS3k6dNYIw75Ii1tirbD55elnwpTM/HK+Wik90gs3ZU2EKkhO1n3eO21AdgWGXvB4p
	 0Yi2RYqNSzvqYGhoKCUepR1q73zbVdKKtbTyIbTqQ8HUy4PcI+pFCHm26Jvmnl/mXW0BR
	 VuME9Zdn6IrAYLRSDD7YWzOZedu95SvUt7TOZSn9kGxcnVq4vhDiAuRrHBf3Awf58pTYq
	 9KeBPmO24P7owCToNiyuc1WdAQBtNl85VSjgyy0Kd2VjOmMD2NQ3K1cea25e4rZEa+C6q
	 zXbHbpFZoi+HL22PEVvO1wd/8Q+Hi7h3bb8k9KCeoo/1NdimZ9znzJDei2h4y1OxdBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=a7RQT89L;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC2B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC2B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=a7RQT89L
Received: from cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id 1BD191C0253;
	Fri, 30 Oct 2026 10:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1793351575;
	bh=xlehuRukHUr3q3Q4REfyP01kXXOrLzKq5OuFCj1ZV1c=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=a7RQT89Lm08Qfhee6msSdYaTnm8CGAhAL31b/2OvDJsPOgz/7PvMLgOMCVIbXlja1
	 0uRbuDy5ZTqEp3Jm9ozitRHsghvvL0Y+jPEHvbVx5/we2zKa9Z/0y1BJuY5pVeZ9Jx
	 +Oqpg0tMdlcNLhJAzjtY10ZjdHRyMpK3gI9uOLjE=
Date: Fri, 30 Oct 2026 10:12:53 +0100
From: Renzo Davoli <renzo@cs.unibo.it>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] PTRACE_SET_SYSCALL_INFO: add support for seccomp
 syscall skipping
Message-ID: <auRflWy1m79nKiLc@cs.unibo.it>
References: <20261020152945.575664-1-renzo@cs.unibo.it>
 <atzlc9tg2MTdnRtj@cs.unibo.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atzlc9tg2MTdnRtj@cs.unibo.it>

On Sat, Oct 24, 2026 at 07:05:55PM +0200, Renzo Davoli wrote:
> On Tue, Oct 20, 2026 at 05:29:40PM +0200, Renzo Davoli wrote:
> > prerequisite-patch-id: abdd0fc0973bc3845ae7bfe84d855a7213ccd3d7

This prerequisite-patch-id is no longer valid.

The prerequisite patch "powerpc/syscall: Return the preset value of
skipped syscalls" is now at v3:
https://lore.kernel.org/lkml/20261030084926.1068384-1-renzo@cs.unibo.it/

the new patch-id(s) are:
[PATCH v3 1/2] powerpc/syscall: Remove TIF_SYSCALL_RET
  55e7bbbc0c0ed582cdcb72dc4f611335e680ee0e
[PATCH v3 2/2] powerpc/syscall: Return the preset value of skipped
  e324a2aebf21084c59b25ddf5421df35fc803f69

This series still applies and builds on top of v3, so no new
version is needed.

Best regards
  renzo

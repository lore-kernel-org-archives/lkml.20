Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839158;
	b=XaGRnoFVKC8UYxmZHGhhzVevwPymNcnaPRh8xkgDQaNmDEW2db8U4e8hVMWQvn9CeogA
	 wnKhNRr/afc834zzJbFRJBNxXfp8tYakMElVDfbDsj2ggsFrRen/5KLyzevXIy5ZyhdQP
	 nNCPAUN4ik97vyplKFmXoJ9TTM1FKOTqjf3uojZ0lQ9ESOJtLG1N/TN4nIjWpXDwNHd6C
	 P1z1vwcuj4thqfaKQmNiuFQzv3AYnd+u2X6AXCyX7N0zWjLdC5jNRiu2SYz1Pq6AwDjt/
	 Yc9UqGE08SUVW9g1j+uDYWCOyzyMy1lINVmGYeQCMb0OsGTpQ7+N+cWNfzeqAsmfWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839158;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3tsuMG36yW2/wCTC0oKqM0f6Cdxqx1im/se83C0BA1A=;
	b=rMo6ILqGiC4QhafnpMhPFw25yCVzzm4n441iazMoKk8TzER4VJqBZqj5Yg1vUaMrxByb
	 a6xtsF1bT2W+leIou7fSvTq2SYlV2/SBlVpTYuKjyl+/C3xCMiVE+vX9AxX04rQdK4NJ3
	 5V4mJH6CDRymy/ZC3UvyXQ/KcY94bam4EZsRyw/asEsZ0duWU+PfE3To979TlWI06qu4L
	 uc04RLfdupfX+NNVAVeNr0HQCyXnVIra7bKS5dbCuTru0aoQWemJBG18n252VxeyqG5Jv
	 qJI9VVIuzQ9PIpF7OaDt4gBR/S/IgzSkjIg13NCeR+P6TqzPhtbvLl2BjnW3kgKo1Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=H7aHhzDm;
	arc=none smtp.remote-ip=95.215.58.31
Received: from mta1.migadu.com (out-31.mta1.migadu.com [95.215.58.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9B606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE9B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=H7aHhzDm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/GTg9hL5xuUl9myEXN9GO4riPpvpZqScq4U+gn+DN4w=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794839155; v=1; x=1795443955;
 b=H7aHhzDmNuOVbrR2uVic9KsMcERt/ih2Cx4FkJPaLyaUVTsSxiKfM+jb7bUyCJfEJUP4SUhj
 Uh5Utmc2dMUQOXnm1rpI0s06K3T5CADKRgAQRdhFvgHvjNhzCmXnmEn09IXAOjrLB/Ne7D6BJwT
 rkMYssG9Hi13ChX/HTEM7KGKIiziAPyHZAJaM5tEhmAw9hqNwDLWg9FQ6Z7NQq9tXflndT1WGe9
 lWptL9r7rEPR50QwUJ0Afvy6mFnlYCgD3OTmReLeuoud8pAGFpUDm6t8s2CYfOBOQPhSlMXocFe
 JH2QHfUgdm3rZVWelcrcgjRBOu3bTQrEF4cfzk54ZbG0Q==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f3254909706c970a;
	Mon, 16 Nov 2026 14:25:55 +0000
X-Mizu-Trace-ID: f3254909706c970a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 22:25:46 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
Message-ID: <avsSapW0-wS_gEsz@wyuan.org>
References: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
 <476202a2-26a7-4b6b-a7d5-ba8e586371bb@hust.edu.cn>
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
In-Reply-To: <476202a2-26a7-4b6b-a7d5-ba8e586371bb@hust.edu.cn>

On Mon, Nov 16, 2026 at 10:20:46PM +0800, Dongliang Mu wrote:
> 
> On 11/9/26 5:28 PM, Weijie Yuan wrote:
> > Update the translation of two files:
> > 
> > 1) maintainer/configure-git.rst
> > 2) maintainer/pull-requests.rst
> > 
> > I only update the first one in v1. However, I find a reference of
> > pull-requests.rst in configure-git.rst is in English, while we've had a
> > Chinese one. So, update both this time.
> > 
> > Note that there're warm tips from checkpatch,
> > 
> > checkpatch.pl: :6: WARNING: 'Link:' should be followed by a public http(s) link
> > checkpatch.pl: Documentation/translations/zh_CN/maintainer/pull-requests.rst:118: WARNING: Do not use whitespace before Signed-off-by:
> > 
> > .. which are caused by a 'Link:' in the commit message and a sample Sob
> > trailer.
> > 
> > ---
> > Changes in v3:
> > - Put "update to commit section" at the end of commit message in both.
> > - Rebase to d48723711bae (Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux, 2026-11-06)
> >    Alex's docs-next HEAD now.
> > - Link to v2: https://patch.msgid.link/20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org
> > 
> > Changes in v2:
> > - Remove the SPDX identifier, see details and reasons in the thread of v1.
> > - Add a new translation.
> > - Link to v1: https://patch.msgid.link/20260823-configure-git-v1-1-3c65eefcc585@wyuan.org
> > 
> > To: Alex Shi <alexs@kernel.org>
> > To: Yanteng Si <si.yanteng@linux.dev>
> > To: Dongliang Mu <dzm91@hust.edu.cn>
> > To: Jonathan Corbet <corbet@lwn.net>
> > To: Shuah Khan <skhan@linuxfoundation.org>
> > To: Randy Dunlap <rdunlap@infradead.org>
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > 
> > ---
> > Weijie Yuan (2):
> >        docs/zh_CN: sync maintainer/configure-git with upstream
> >        docs/zh_CN: improve maintainer/pull-requests translation
> > 
> >   .../zh_CN/maintainer/configure-git.rst             |  48 ++------
> >   .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
> >   2 files changed, 77 insertions(+), 98 deletions(-)
> > 
> > Range-diff versus v2:
> 
> You need to tell your agent to forget about the range-diff.

Sorry, I realized immediately that I forgot to change my template for b4
cover letter after sending out this. Now deleted.

--- a/.b4-cover-template
+++ b/.b4-cover-template
@@ -4,8 +4,6 @@ ${cover}
 ${shortlog}
 
 ${diffstat}
-
-${range_diff}
 ---
 base-commit: ${base_commit}
 change-id: ${change_id}

Thanks.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804331;
	b=zyHLGv7u0+oRjSLdxcuSVi2uDckCNgbUx5dLCjGERiR6ihgeCde8zxmvCflygYjfVZZS
	 ycTADyMCergobYqndOMRhsTbKmUGwfQimcUlGtSIoxxAkjUcxvuIsWP2DCmKnCb8CnOuc
	 /OER6Rk+n6dPyCCUmdzAxLDRN9kKe/kcnShWMUlb8imfx1SxA4AAjt4PmhhMa1kEpfvEM
	 uoTCpTwk/OFbAZ8hb5+5aPO+Zvw3FVjCd37coO07cCg/ndyC6PPXQEpesyCYzhCF1MohE
	 YPYORoWVh8+NH1fnxnq6/o8ODtKRSY0KKCcN0j9/7nECBU/8vxhNF7ynbx6ZoQOF4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804331;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vSlxbr4GF5WlUvrPQl/wTkSFn8CEifE58HoPh8KxRvg=;
	b=q5LRA60UULgqENpIBgokE6tLVLlgNWChpUV1fIQ7HvSqGy0Cz/NFJ152hEgY+dBbJxsy
	 FTgFAlUR32TzZZMc2R4IOBAmQT05kiWtajcrJXvl4cO3c/XvdnLsRv/LPf8FobHclxEs7
	 P+F/8BSmVnEuyRrbq+ZZbHnZc0GZy/J0Vj6FCeCymbqRfRd70GqQFvFfwbws5BriQ7Slp
	 fct4PDDdxjlLHSdkPQyIvtXNQx4mHhrRPE0Cgg+UtfK+UV69BIpGBoOl80Q1GMzb3+X6O
	 3PRIsAHWtAP2ENB17ZKmVru/hFlsxF+AzagtZRJKlP7OIi8KjcND1JZ3yxCPHuZgdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=C2POBDOK;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F2606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253F2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=C2POBDOK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jn/8vTEJX1I2SwihyhQq3RXByamjm0Fz9Z+/g9/Qa7s=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793804326; v=1; x=1794409126;
 b=C2POBDOKvdsDrIiMpJ4cb/4qb3WSTWh7VlzJdzUbGrpAHPGXhgJuDa9wsFA18JWNrvjM+BC2
 M3i2y8PoY8mjZqA5n3UktgtHZwJwyTct2zoZpiz1T5KWdelUfRFhx60G2coXV3K4RwrMBQzvkut
 5hpWsAD6fS7xRPPVQcvkd/fJn4PcqI1pJp1xE0TJvwVCFClA/dsxpjV5nJB/ELShtyGQz7ILbgK
 EuspWr6xQLShBDVcpm+quHbUUShRYxw3vUXcu8NNjNPJBTykQr4gsooLwtcwz1lqdf/kOzdyoQz
 iNOa1T4of13WXrKR+JJEeIrJ+jiVqQHXS68wnbeiPv4Gg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8fb22803a417594f;
	Wed, 04 Nov 2026 14:58:45 +0000
X-Mizu-Trace-ID: 8fb22803a417594f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 22:58:36 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: =?iso-8859-1?Q?R=E9nich_Bon_=B4Ciri=B4c?= <renich@evalinux.com>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
Message-ID: <autIHApRGasgTCXO@wyuan.org>
References: <20260920073144.546566-1-renich@evalinux.com>
 <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>
 <autEFEW15g5I0oVT@wyuan.org>
 <a4e6c559-5e7a-4c7e-8475-6f1970d8f3bc@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4e6c559-5e7a-4c7e-8475-6f1970d8f3bc@hust.edu.cn>

On Wed, Nov 04, 2026 at 10:46:19PM +0800, Dongliang Mu wrote:
> 
> On 11/4/26 10:41 PM, Weijie Yuan wrote:
> > On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
> > > On 9/20/26 3:31 PM, Rénich Bon ´Ciri´c wrote:
> > > > Commit 03e23b18c720 ("net: Move XFRM documentation into its own
> > > > subdirectory") relocated Documentation/networking/xfrm_proc.rst to
> > > > Documentation/networking/xfrm/xfrm_proc.rst.
> > > > 
> > > > The Simplified Chinese translation was not updated accordingly,
> > > > leaving its :Original: tag pointing to a nonexistent file and causing
> > > > tools/docs/documentation-file-ref-check to report an invalid reference.
> > > > 
> > > > Update the :Original: path to point to the new location.
> > > > 
> > > > Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
> > > > Signed-off-by: Rénich Bon ´Ciri´c <renich@evalinux.com>
> > > Hi Rénich Bon ´Ciri,
> > > 
> > > I have proposed a patchset to revise all the inconsistency between the path
> > > of Chinese translation and English documentation and these invalid original
> > > fields.
> > > 
> > > Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
> > > networking/xfrm/xfrm_proc.rst translation
> > > 
> > > https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/
> > Ah, I haven't had a chance to look carefully at your series yet. Then
> > this patch can be discarded in what's-cooking.
> 
> Haha, what's-cooking is really a good place for me to catch up all my
> missing patches.

Thank you!

https://buding.wyuan.org/ is an experimental dashboard for us which is
made weeks ago, but obviously it is very rough. So now I feel that
what's cooking is somehow enough for us, as it seems more robust than
web app. ;-)

> It seems all patches are reviewed, but some are waiting for the authors to
> revise.

Yes, thanks for your work!

Oh, btw two of my rerolled series are waiting for your review, but I
think they are both good to go, while I'm certainly biased. ;-)

* Weijie Yuan 2026-09-05
  [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Needs review.
  source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>

* Weijie Yuan 2026-08-23
  [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
  [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
  [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
  [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
  [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
  [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide

  Needs review.
  source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>

They are revised per your guidance.

Thanks!

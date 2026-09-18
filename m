Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D413A6405
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717740; cv=none; b=h9JLzzN5URltzJ9+WCz5lNmgI50a7H2gIPRV/n/v8THbxra57W1TvA2kDecL5ImVnqnYu0JCTEgv2QzsCT7PVsba+3FYmqe1vLnhjrERCif+fVrKlglAygFMWmUhKSwjn2pl1DeFNNij06vbhG1W59rhJVcyt8VXdzbBEq85xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717740; c=relaxed/simple;
	bh=o5pm3GYaGUF+3Y9lkTpazTM4AJYDdcCW8ONSi4MWHJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=f5hil+SBBil/4IZj5sSnCXnSmciNcYUwlbveKyERo5QIKYOcuqa6QBST6bImIM71YUhDYEyhFogFt0Q6pcnVBMReQF/fnvxsKxpLoSE6Uj93YSJ31ZOVy18HEMY5YZ5+xbW7AJieUYM1Ea4IwgaNoQgoSvG/SI+wG3VVBBr6Yxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZA4IVbSo; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZA4IVbSo"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260918074849euoutp017909730857fdc82e1fa72fe5c3ab93a8~WWsr6W5Hs2179021790euoutp01k
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:48:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260918074849euoutp017909730857fdc82e1fa72fe5c3ab93a8~WWsr6W5Hs2179021790euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789717729;
	bh=9LRBFHkYxsMPHxldhSoBfcRMe67HegoQO3fxwKGAgho=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZA4IVbSokPWcxbEovDrM9dv0tHKT+oK6CJcM5gMAOcDFDCFv+nN/bGAGSRAUY/SxA
	 vsV46J8vI/rQCeWpuHIgeiiLastztygUel2sybT5fHV5vK8B+9naw4xtYHx1q2p0CY
	 cLQjz77i+qCb3CMLPbYym39iG17CJQHQ9zR0rHyE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260918074849eucas1p2f59ebb5edcf83292cd71fac7d0733896~WWsrk-7kH2296122961eucas1p2O;
	Fri, 18 Sep 2026 07:48:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918074848eusmtip187731a913ef6f63bbe35f6c4ba5f178b~WWsrFBHrg2379023790eusmtip1m;
	Fri, 18 Sep 2026 07:48:48 +0000 (GMT)
Message-ID: <e67609e4-6875-4759-bbe2-b94a1690309b@samsung.com>
Date: Fri, 18 Sep 2026 09:48:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: BUG kernel 6.12.19 defautl_swiotlb_limit() returns wrong value
 for CONFIG_SWIOTLB_DYNAMIC=y effects atm only under XEN dom0
To: James Dingwall <james@dingwall.me.uk>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Andreas Greve <andreas.greve@a-greve.de>
Cc: iommu@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aqzcLJQCCmqpdxz3@dingwall.me.uk>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918074849eucas1p2f59ebb5edcf83292cd71fac7d0733896
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48
X-EPHeader: CA
X-CMS-RootMailID: 20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48
References: <CGME20260918063741eucas1p290cc7d0360de73b3d07a23316a238b48@eucas1p2.samsung.com>
	<aqzcLJQCCmqpdxz3@dingwall.me.uk>

On 18.09.2026 08:37, James Dingwall wrote:
> I've been having a problem with a Dell HBA330 SCSI controller (mpt3sas)
> when booting under Xen and CONFIG_SWIOTLB_DYNAMIC=y is set.  I had a
> similar issue with a megaraid_sas card that I previously posted about:
>
> https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html
>
> In that case we rebuilt the kernel with CONFIG_SWIOTLB_DYNAMIC=n.
> While investigating the current problem I came across a patch that was
> posted on the xen-devel list:
>
> https://protect2.fireeye.com/v1/url?k=202f9c3b-7fb4525f-202e1774-000babda0201-d2724d878716e4ba&q=1&e=538195f2-f8bd-499e-8576-5e3d7c8ebca6&u=https%3A%2F%2Flists.xen.org%2Farchives%2Fhtml%2Fxen-devel%2F2025-05%2Fmsg00991.html
>
> I have applied that to the Ubuntu 7.0.0-31 kernel sources which has
> resolved the controller initialisation error I was encountering and the
> system now boots as expected.
>
> [    3.921136] mpt3sas_cm0: no suitable DMA mask for 0000:03:00.0
> [    3.921275] mpt3sas_cm0: failure at drivers/scsi/mpt3sas/mpt3sas_scsih.c:13610/_scsih_probe()!
>
> I've included the patch below, I don't have the author's real address
> for the s-o-b.  I'm able to test alternative fixes if there are any
> issues with this one.


https://lore.kernel.org/xen-devel/93625976-e8af-4c39-90fb-45c926d420fd@a-greve.de/


Andreas: could You send Your fix with a bit more elaborated description and to the
proper recipients (hint: use scripts/get_maintainer.pl tool), so it can be reviewed
and potentially applied?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


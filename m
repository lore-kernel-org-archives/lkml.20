Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817215;
	b=aJ9T3dSusuYdxYoHJNbSrmWMdPP+KrMeZZyAL8zU+9cLD36cfG4UmVmaC4sE3+48uK1p
	 9AiT19Mql47rRBbbY8Ggg/9dzEV2QhnMDQ8idPB8K4a2KDFp/gVk6tlQn6mu0bCYfyzjg
	 rP3n5UtGLHQUIbXn4arCmsY0RQhSXT2GS4H3u5gLPzBV3Nmct0VUGbYbT7XWk1UoC6lO2
	 xktvqKVNy27W7osMCllkjtAhQYnDjTDG1jLMFTElmUCtvkC76WGn1rze4UBwTtvU0juVk
	 xvtr8Us26Go0WbpgzjvEsL/KLFhm424kHONaTIag98EhbbGKspHTQTygw7L3T0NCQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817215;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=1t/7T0faC2SM19oIUCWuL5pucy0UjfML+/dd6L6UdM0=;
	b=OC/XkWKy9aArUVFhRbfQnjGXTNXBr3kHa1Y1vFFMNk5oPYyCBrVoIum2LBC8UIO45e3C
	 yZ7e5NXifpJ4iKnIBFRq+6QxhdLvVFqyLzk2ABbqWiw1r7oVShk3Pjuk+O4oo4gmk3AWP
	 sVz4wm8x/d9W65WlDU20eGjYnaUUHnuXJ8PzqnUcybt3PCRuXP+VoyPAaOWQoDS5zGOHv
	 4y4FpOebGl5Mls5ywcyrdD2uf/bId8MwJb2L1Jf80YHZwhpGP/yk5QnN9lmrtKUhjBmyd
	 pZAsRad1BbdBsLsWTyWTIDmjlclaUMIIcxM1SB788n7E1m9G0JVHPMv3VmWRjQ9dXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E231606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E231606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4H2JQg2145685
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 10:33:34 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hqp80r782-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:33:34 -0800 (PST)
Received: from twshared15328.03.snb1.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 4 Nov 2026 18:33:31 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id B110D2E743740;
	Wed,  4 Nov 2026 10:33:17 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Sasha Levin <sashal@kernel.org>
CC: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
In-Reply-To: <20261104121816.3726177-1-sashal@kernel.org>
References: <20261104090332.GB30750@lst.de>
 <20261104121816.3726177-1-sashal@kernel.org>
Subject: Re: [PATCH v2] nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for
 KIOXIA XG10d
Message-ID: <179381719771.2628530.5898616470784941042.b4-ty@kernel.org>
Date: Wed, 4 Nov 2026 10:33:17 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-FB-Internal: Safe
X-Authority-Analysis: v=2.4 cv=YPkKWhGx c=1 sm=1 tr=0 ts=6aeb7a7e cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=VwQbUJbxAAAA:8 a=OU0u9AfXHRIHD09MzroA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XKTGYu3O-jSfzNMsTnPSTEhH-RuBRKjr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MyBTYWx0ZWRfX/6R+PhHIMzks
 SzAgxbZ4qo1LQWwTT5zDeViNrMh3AXCrPsLkKB7JpoyVwH5pfDNG9EFp+1M5FYUuLTUvyUwR4XY
 fOoo5OsYPDS33bWUmdOhbHs89eLyga4=
X-Proofpoint-GUID: XKTGYu3O-jSfzNMsTnPSTEhH-RuBRKjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MyBTYWx0ZWRfXx9CTbqOUbE6H
 YdfooRmooe1qXQHYozZrQbGMVDyGTWjd05FZmprRqoSmvb6fNrhgbP+zO70Q9q4RQhhv4kOVxmg
 f+9l2J0aEJlnkR8rMbpTgWHWgk9D516+RKy1C6jtZUdnB1aoxqgD1MoyZgOwegroBeY3smZ9tQD
 pwkFjwIioSii9LNG+RkKeFBAd2bk2mIPdF42517jjQIPebQCYqmRopQCj7/sPKRhXmGMHmDEPpr
 la6vH7W9ZT4Gdri5Dfcn0DXc04B/dYQmlfLJnT+RdfCNhCfqVVi8lOf0nKlAVChW3124rqs1pZ6
 jA0Eet9bTAVr2dPMrnZe+F68Ks77xbzuUJ2HS9SQMUK/r0ia66oVPFUr6+RunWWSyqs1TN6nDFK
 4FqI6HEOLohb6rBGfunXPHB5h3oVHfzwkLKI+7wE3UYR3tuKX8Veu1OQz+GTmVfTFFuDkh4FuMK
 hACGBMowp0nzF8ol7SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01


On Wed, 04 Nov 2026 07:18:16 -0500, Sasha Levin wrote:
> The KIOXIA XG10d reads past the end of a PRP list that completely fills
> a 256 byte small pool block. When that block is the last one in its
> dmapool page, the read lands on the next page, which usually isn't
> mapped. The IOMMU faults it and the controller craps itself:
> 
>   arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0001:09:00.0 sid: 0x20900 ssid: 0x0 iova: 0xff7fe000 ipa: 0x0
>   nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0xffff
> 
> [...]

Applied, thanks!

[1/1] nvme-pci: add NVME_QUIRK_DMAPOOL_ALIGN_512 for KIOXIA XG10d
      commit: d99ba2df0ea5273752787eed10f4c7d1db2f5dfb

Best regards,
-- 
Keith Busch <kbusch@kernel.org>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891509;
	b=AdIxj/zn3wR2vvxMXzeqmezRFYMXqL0yuuHc/9toY/kOKqoNWRMnCeInTe++xNRvC806
	 Pl6P6gQVJUT9ArdIQOg+zPMhOaLpTS0pY1RqFO9WOhQxcZZ1cuayTBxqiysSotK/G9w4e
	 UZRpCTY1QbE2cXeeEJs/DgG9dBKN9NxvRWUUMmLpnBCuNWOaQIeAUTkm05f+p+KgMDOhz
	 dEEDyREGU38drZVxlULZS8/EYgH3kgD4yg0QF+LTRWqX7F7yLhHfxNXRIX6CmpshE+yMM
	 yW8NZpwvNKHKQ3GGlYgPHwA9ZgxWqAeVabF/Uf7r4m+i2EzopM2FSxLElusYsfgMyNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891509;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=UZ8DsvYdOYu4YnthJODg6wuyHI70zGW4VvxoRcZW9ng=;
	b=lNNKITLsPdaDbbJIzmTEkPDPbvYe/HyyfSmkdFaVyUC8HbszeiScKOcvdB4tflUJZ2S4
	 OJzDUVaTixtCF+U7x5AEqTNePZfCeHfSsWA7AiZkkzsJO7p/zjToqClrybfmcjRbGBc3O
	 OapSff8DSpsqq34vVfdJ/Jz17Cr20ITKbaIrZQd6ElVtbu/4aohfOyE10G9Kj7JJCnxL/
	 jKMssVNasBJERCYMwT3/xqLTvut+Y1EDNBc1KiZ2vhF+o39GaVi8ImNH3PA85g9QNJSyF
	 OwZH8Dpo8rpkjocVzBAZTCNda8e6Qm0lVIeV891AQPZwyzc8CPRrPrMi4OGM2xe2DdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5761606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5761606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5ETCTo4156153
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:11:48 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrbck69d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:11:47 -0800 (PST)
Received: from twshared91271.16.frc2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 15:11:46 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id 92C122E7EC6F2;
	Thu,  5 Nov 2026 07:11:31 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>
In-Reply-To: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
References: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
Subject: Re: [PATCH] nvmet: drop the redundant auth check in
 nvmet_parse_io_cmd()
Message-ID: <179389149159.2132554.6031206055539117690.b4-ty@kernel.org>
Date: Thu, 5 Nov 2026 07:11:31 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX6RTsV7Qp54Tr
 xPhg7eAUVdaO4+8ihk2J0VzxSEWlr75kaLyJigL8umGrrBO6RgORfBC8FSeEoo0uHASeScoiEnK
 p9qvKsfux3xMGCRuJSHQ0Y0ED2hwEUGtu41VMuZ9EPQds5p8roOaVJPeU2GgW8g+BeaXRDPNMPd
 1YCeGEMpaqTUmSIfhkIYQ0ALgfw44ASN7efVAPnoDGBFSDpfuap5Oh9dJcQPDrK/hJiGNaCGvIx
 7DdYVAkGf2nVL4fi/Pmpwfwz0fXbgub4lTFEvOINN2pyI/BBL37DL71jwEm225HFSvy1hNukOiM
 7opphE5gzcUuDe+XLGuWDKsWDG8lk5g/bmLqHoXW4npACLSmwlEhKb4cWw8CYee2iC914VDjKs7
 ly+EmSkOi/VyJSUqSCuMQRQnJXR35+/ewrsee4RgjOg3psORMWx/dHqc7kzORigeWlM05qgHoB8
 kYbWx8hzTftyf5qeeBg==
X-Proofpoint-ORIG-GUID: sO51Ah5XkNTyPJqWgqz1KiLFw65Kuw6C
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aec9cb4 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=cjythY3byQ-Lh-OW6DMA:9 a=QEXdDO2ut3YA:10
 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: sO51Ah5XkNTyPJqWgqz1KiLFw65Kuw6C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX1isdbv2v2n5a
 TtPUtIzadeKlvqqbFBhWKNtWOQNB3+M8sNnjXlNom9ACt3hd6jhvRnEFH6/8gdABVNMvY3cgH28
 Jxx8wH3nNqe5KQKLMtAzGafoAdaxviQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01


On Wed, 04 Nov 2026 21:14:46 +0800, shao.mingyin@zte.com.cn wrote:
> nvmet_parse_io_cmd() calls nvmet_check_auth_status() and then
> nvmet_check_ctrl_status(), which performs the same check again.  The
> first call cannot fail either: this path only handles commands from I/O
> queues, and nvmet_check_auth_status() returns true unconditionally for
> qid > 0.  Drop the duplicate.
> 
> No functional change.
> 
> [...]

Applied, thanks!

[1/1] nvmet: drop the redundant auth check in nvmet_parse_io_cmd()
      commit: f96d1722e5861375c47c315117d900ef103ab331

Best regards,
-- 
Keith Busch <kbusch@kernel.org>


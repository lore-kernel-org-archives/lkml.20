Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842224;
	b=DI5TI5II2ARni//nbkseO7F8TMLsisAyi8VSkuq1WX53x/U3duGryWJLXK6sJ0aQeq7S
	 DyxLnIQgacvx1m+wq8RZHUWjUPkmVbauDfhr0WaZoblg+d6iJRahmO62H3BV0aJSu0+Qf
	 CKdYMk1MBb0w5oyPoM4okX459cl5wrknDSvWeq3UIcd90vYfqlgFzCQpDbs4yu7gEvLGL
	 I5Egg/+7ju2tgmjJlFIEaIFaw/6LD0CL1LlUQ9/+EqbDo1uXgoqwryKvQ2xKkN8iv7RY2
	 qfkAf2phIAmumvm3ZciHZUK81R3AqvooqDJJW2v0tV5BaNN6LE2R2J5Mk43wjY8kEIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842224;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=/zlLFbbw70FmmMU5YwAZUhTdFqzqLjECMTWQsCYZR+8=;
	b=DvQ6g2X+kO3QdK/wwHBFjP0fI2/4zE36bBiDeOWCov4Ii9Wh1OSMkjOdFXvNA7/5ovYR
	 HcM5vpK1iQVp8hiYi1l7rcoduQ4XKL7thJ8QWBW8mlQw9dkSm0p0IElNJn8mLhp8+s6DM
	 VjuLUBXPkju2LP2y1cIxV9hzW0PyLFLrz6LIE9kQDKZpZoUK6boeMCKMjqbgHDKowvGfq
	 of5lvwTZxsu3H9D+xKrU4sqwTYwS4Q4tKtzUNfnsAQWkiEq6LJJLChS0rzhbn5s4LKrrS
	 cSwOwUfFycS9BCXMMetExFWckbxOOwfhOrNjRDavkX+njl8bRCKnoqKkfBssJzk6iLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D4606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8D4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0fcL2119921
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:03 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxnmcsfts-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:03 -0800 (PST)
Received: from twshared77744.15.frc2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 15:17:00 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id F1E6F2F083071;
	Mon, 16 Nov 2026 07:16:48 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <hare@kernel.org>, <hare@suse.de>, <hch@lst.de>, <kch@nvidia.com>,
        <sagi@grimberg.me>, Sreeraj S Kurup <sreekuttan2156239@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-nvme@lists.infradead.org>
In-Reply-To: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
References: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
Subject: Re: [PATCH v4] nvmet: clean up DH group state on initialization
 failure
Message-ID: <179484220897.249619.16009819575182400523.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 07:16:48 -0800
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
X-Proofpoint-ORIG-GUID: S_wyrCBPkYGtzeqoHxCZC0_xgS1AKtBq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfX6hGdoAGchcaH
 6+hgkLEdplNx9O07GznEPO7XcwQVTHVD/RfjwnpTyLWSeV7RqI1EhM3mPtHjZlYa9viOXYGWScn
 DiD15U+H5EWk9PSK2Qah7LDTZDYAetQ=
X-Proofpoint-GUID: S_wyrCBPkYGtzeqoHxCZC0_xgS1AKtBq
X-Authority-Analysis: v=2.4 cv=EMKTQFZC c=1 sm=1 tr=0 ts=6afb1e6f cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=VwQbUJbxAAAA:8 a=8o7LMmOxS-Ld041RKNUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2MCBTYWx0ZWRfX+DOXLTiAawYg
 IMGIRA6PPmClS5Ge6VXRZUESw1JLWLDzuv+9R7Qyx+cGZbPs0FlSzel/mOTzuI8I/lNKMlXCM/t
 16sk+7N0t9QIZ5+MhLMPq7VHUdMYp5+JvpBJa4XwxCQBawsvoupxorgV/4uLAMhI0aSu6I/yqOO
 SdWg5WDFhLauIzadZiVrpnQUpPY2g8Z7drY1/SD5ce18uw2m3r7V8+xDkRhAvt8IC1cSv79I670
 HCCLsfPzqchQpGYJx8P98kE9rmOBO08GrOD8yh/wKWStXSmS1qKsOKVSOKTSOeF77849a5Exki7
 PjPoKZ1sEvfGxcsN0Yf3H8Z53sSdlDisRVuPQTlf3UNXAHTgF7ZiAEHbaTo8YW1yTKV/m8oH0Gt
 UX7PtAVG+b1cAaz3ieTAlUhxuIhvSWtw4+Bba73m6rx/SmfY7PnvR/DRHZUbI2cg0XDeDLxyv/5
 i4QSXgJWEz7bzGk830Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01

On Tue, 10 Nov 2026 11:35:02 +0000, Sreeraj S Kurup wrote:
> nvmet_setup_dhgroup() leaves the DH transform and group ID
> initialized when private-key generation, public-key allocation,
> or public-key generation fails.
> 
> A subsequent invocation with the same DH group incorrectly
> returns success because the existing transform and group ID
> are treated as proof of successful initialization.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/1] nvmet: clean up DH group state on initialization failure
      commit: 920cd269c9228c5f51a8bbd65575010890797afa
--
Keith Busch <kbusch@kernel.org>


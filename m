Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990607;
	b=hrBhqBG2lsUHz1K/zcLDPcChxycarEDOCDkvfLGH/BW38zsKw8uDRt941QTbrlFehKtN
	 T9LNv3rTACovRVSZFHcIvcTJax1nKFW1PkO6iB3Ysov3Hi3oibtPS4N1OxfO0BF9f/K0E
	 g+dfGTyCxF6x/UNKw4mk+MvKstccH7P9bjLhVNyr2++034Y5VPIrnxi7EEuofaKG1MnJ8
	 RaETzzNDMSIfCMGTN/wP2qVU2JMmMeEEKrH6JaizF2zywu+Ds/d2MY4ZLAGZ5jloByuxU
	 c3xCkkRnvB6Z+iEIg/4tSEg+HTbMUy+jUaQt/04I5n7hr5UUTQjZyZYMpTEXvfSKSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990607;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=7cDWiUbcFlhnKGjqNM2nYKV6Y4p9T6n4qbUjHUCHRdQ=;
	b=02j8pPYoA1kcPL0Y0TYtGpz0kOd//6eqNkoXrluvrIKXT+uUNnTw73Yhlv9X2X55pYgO
	 IKSpLtS1QZMBJFUX9woFgbe9OgwYCyI1FT2HXcvN60ZQ0K3tVqNp7HzK1fk5P4BY9Sw7W
	 G2OajjS1XpncP2vS9lkgAjFydunyamXMAnkEDqSvRikIy36/xdxPk6AyFXmaH49X/WImo
	 RgZd5+kV8u9uufE8UOxLkYkpvdc1T9eTHyje7thOHvPNyOkzXIaOqTkIefbHs99+dLdGo
	 N9BGNVpE1vU/nnnWklelHV+iIw46wav9e+6jvXmsQDxM+JtLOZH1jAEluXvKPLmAL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02312606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02312606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6IdlXl3508106
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 10:43:25 -0800
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r36bbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:25 -0800 (PST)
Received: from twshared98006.17.frc2.facebook.com (2620:10d:c0a8:1b::8e35) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 18:43:24 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id CD7B42E8EFD4D;
	Fri,  6 Nov 2026 10:43:07 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>,
        <linux-nvme@lists.infradead.org>, <shao.mingyin@zte.com.cn>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
In-Reply-To: <20261106230013815Squ68I1R3ds7pODmhHTwr@zte.com.cn>
References: <20261106230013815Squ68I1R3ds7pODmhHTwr@zte.com.cn>
Subject: Re: [PATCH v2 0/2] nvmet: fix stale log page data and a ZNS
 Identify error
Message-ID: <179399058783.513959.1663411821731805278.b4-ty@kernel.org>
Date: Fri, 6 Nov 2026 10:43:07 -0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX7rdnBzailh8e
 OPWmoTfCLAd8sq/AWWRcv/5TA2NN4gcRMBVykrUYplTaWrx3BiPjcduqIJygnDcUJVF/Nb2eDa6
 RqtOzfSxnjRVDVdhKLZOcSEkuQWiwOiRWgJ+7MT/FnVVLDa8qXkyOZrsL+QpCP2k6XZ6sicbyT4
 TTy6Rd9Afhr5O19b0HLGdSoykzD/vmTFCaX9cDfllU0wRxwzv7khPNZNM52u0R3lpujpmnKvf//
 j3axsBQCV92GspI2RunIRff8ZMn8oNEOZ/jP6jSwsxcd/Q1euPz/C1EiXPpLWrd9W+VU32+nV5+
 cxdrH88GkSfglwKmfo2aloRVh+bL4HQ4OfwuICuHY45tCfPxMxn24B9vDIPojnsqyppVxGSm/qn
 cvZq5oYZK/JCWFOVTLWTUs6wi0T1gT5faOVDiL/mJJsyjxIkHw8J/URLCf8EL4skEyS9HGRjYdr
 +mwEGlh6i2tCKpKOC8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NCBTYWx0ZWRfX6zu1QKZi/xT6
 6RSwAv08O+ypBRNZvxZmBkqNXTNPEpDCtRppMTpDPjXSmEeWqdrvkKOj2JyumR9DtZ/SYQm29pn
 Ecq3cf5PxHt0JyzfFPKOdQAckzjZYDQ=
X-Proofpoint-ORIG-GUID: HYX10FUZDv_wZAVvLsaIIH9oGM06b5-8
X-Authority-Analysis: v=2.4 cv=N468hG9B c=1 sm=1 tr=0 ts=6aee1fcd cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=1RTuLK3dAAAA:8 a=VwQbUJbxAAAA:8 a=W_VHsVsul2iShNWWr0sA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: HYX10FUZDv_wZAVvLsaIIH9oGM06b5-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01

On Fri, 6 Nov 2026 23:00:13 +0800 (CST), shao.mingyin@zte.com.cn wrote:
> This is v2 of the two-patch series.  Patch 1 now follows Christoph's
> suggestion to zero the whole transfer buffer instead of only the unused
> tail, and both commit messages are shorter.
> 
> Patch 1 zeroes the entire Get Log Page transfer buffer before filling
> it, so a host that requests more bytes than the fixed structure no
> longer receives stale kernel memory.  The Error log also clamps its
> ring walk to the requested length instead of relying on a zeroed tail.
> Patch 2 returns the namespace lookup error for a ZNS Identify on a
> missing namespace instead of overwriting it with a successful copy.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/2] nvmet: zero the entire Get Log Page transfer buffer
      commit: ad606ae5635b68e324005aaa06421be752619dab
[2/2] nvmet: zns: return the namespace lookup error for Identify
      commit: 687f3014afcd5826fa3d8f40b445f647b5a379b6
--
Keith Busch <kbusch@kernel.org>


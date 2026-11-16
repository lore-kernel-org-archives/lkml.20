Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845931;
	b=ZwAy1W/fAnYZbuxXsTZW+sy5BOESS8PGjRf5fWxOKJ4g+vKBd9Q9p3tc2Kly6BqY3ySg
	 Cksp/O2Mb3rOohcRWFsrHU3OcaPWHYb4Aix20/pZwNj4FG5+0HXwO+H3DLhB4eS48SqNJ
	 HdVOp7DqfFDsJIGcHOQNtE4mODRZrmqP7XYRZ4+QaYZzda1MiMZ8fDjzkdCqCKcaJrtci
	 vrNcZ24uPxPmY6uOagHnMiClpdQHJLnwcANabNY04rCu9mzVf5o/DL2kU8GKyqzH0nosN
	 fYE6+uzYDD3DhFlLA+Hx4DwYLjluYQeNNmCiNxWgYcYf8L8567IATAtyGrQuMM5fpJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845931;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-FB-Internal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=2/Ptu2/zmuklqy6bzoMqM+lQ4eEViV98DmCxF38tMdk=;
	b=3lgWRbEmprqKf3ZJ1Q+dkQCae7deD0ngB9jET/atsCHuU2CsVxHwCOtDsrE7BxU0+s6w
	 NlP8i15eYQx3XeEcd9JRHYOJATLf4mQ+Kan9I0eZlQjtlrhpC0nsytrYBX96G6heLWKHV
	 78SoBpL0YOWi0jvi2tZptrqPlYRBVkJMWnHebaMLZ5Pfg+N1vnDZfTHmNMeJDxKN2wQ58
	 wqodhGEluMi9CmXcKC+3qEvYkQTtDMuK0cpqDMqY9EWLqq3se1U4cEhybAOGIZ8J5J45x
	 EQ5l/BRC03O/EJZ+kE09C0YnU+0U8Stt/6ZQCctbTFTb2/77ixEYaEQaSyJcufG9Ksw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=meta.com;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D106606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D106606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIguv2345161
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:50 -0800
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxp8hjfdw-14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:18:49 -0800 (PST)
Received: from twshared76683.17.frc2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 16 Nov 2026 16:18:41 +0000
Received: from devbig197.nha3.facebook.com (localhost [IPv6:::1])
	by devbig197.nha3.facebook.com (Postfix) with ESMTP id A0AAF2F08A7B9;
	Mon, 16 Nov 2026 08:18:29 -0800 (PST)
From: Keith Busch <kbusch@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi
 Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
        Martin
 Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
CC: Martin Belanger <martin.nvme.dev@gmail.com>,
        <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Martin
 Belanger <martin.belanger@dell.com>, <stable@vger.kernel.org>
In-Reply-To: <20261112-nvme-tcp-live-ctrlrec-v3-0-49760bd9eaa8@gmail.com>
References: <20261112-nvme-tcp-live-ctrlrec-v3-0-49760bd9eaa8@gmail.com>
Subject: Re: [PATCH v3 0/3] nvme-tcp: consume TLS records without
 application data on a live queue
Message-ID: <179484590965.648177.17811082474327168521.b4-ty@kernel.org>
Date: Mon, 16 Nov 2026 08:18:29 -0800
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
X-Proofpoint-ORIG-GUID: pS6gLQY80Q9-y2XgBJwmBPGFcRvw21Hv
X-Proofpoint-GUID: pS6gLQY80Q9-y2XgBJwmBPGFcRvw21Hv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX0WXTq8CKk8X9
 nrlEvyW6j7VTwaiYlkbKZlcePNnpQCFsffX+GMJxVCyd2tnhT+8cS3uxLWL7NsERprdDDmdLnow
 mBoFheQHfykGTsnVc4b4HB2doozf5MxygWnTGL7XyQpkiUZs9IzYL6mEb6bJq1aze3EO5hyuEXg
 3oz8Ej1BsQYvZ8GsngjAbLC9UXEBbrK78YLgiFFVKPMfO1DMSOmvbJJneNrDHrOrg7Vi09K/piE
 v/ErauJffkWd2FJ8CsLRhBIyI3dnRlnIXd22sOM5Q7hGlmAQLfcjo/LQ9NpFGwUIWd9p2NpfdQI
 ybK9IRVArBF87sEgajM/c8kDraKxWIZTDnICHc8l5CgR66HvIz3ijVf8I1YwMPNORIV64J6ca72
 R3SidAboLYQYrkDSVKGH9ZgzbTiXf7QPPCkJu5a68OZcGocInaZfMbCvx78Ez8DzFkHyHG917Z7
 5pvUa3/vmdlvC4UJgEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX9iwVUUn3G9q3
 r5T06fwNGorDuKdXfjshm0dz7JDDUbPxk2hzR45P4YauPEILcadLE54U3cnNsAy8bHst4BqMTL2
 9z8TiqkIB749yS4Hc1FWEabsVo2fl2I=
X-Authority-Analysis: v=2.4 cv=J+4/fwnS c=1 sm=1 tr=0 ts=6afb2ce9 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=VwQbUJbxAAAA:8 a=LpAHWP_P3Tk2c61k-qoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01

On Thu, 12 Nov 2026 16:13:33 -0500, Martin Belanger via B4 Relay wrote:
> After the TLS handshake, a peer may send records that carry no
> application data: a NewSessionTicket, a KeyUpdate or an alert.
> tls_sw_read_sock() cannot pass such a record to nvme_tcp_recv_skb().
> It returns -EINVAL and leaves the record at the head of the receive
> queue. Since commit 288cfa187208 ("nvme-tcp: start error recovery when
> read_sock fails"), nvme-tcp then starts error recovery, and the
> controller reconnects.
> 
> [...]

Thanks, applied to nvme-7.4.

[1/3] nvme-tcp: use an aligned buffer for the TLS record type
      commit: 1193566c35ead643e954ff8356bb54b1cd78378a
[2/3] nvme-tcp: move the TLS record read loop into a helper
      commit: 76afef5e29221e68f9a19df767f94b092c31e974
[3/3] nvme-tcp: consume TLS records without application data
      commit: 687e743e4089b2a854982b321cb2d681ae5d6136
--
Keith Busch <kbusch@kernel.org>


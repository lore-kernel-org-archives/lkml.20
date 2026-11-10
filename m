Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304695;
	b=mhdepP2R2XVfyKEwZX6btlJsdT6oVvKnRPhdGP5uiboPcG7ZLNhcPHuTX0T6VxyrM+ca
	 r9AL2VQwyv77QrIT4g6hdaXfErsvQQjxylCOsr99Ka04cD7W/qsEEFsBVbHE7bv3ZkSN/
	 T0WLv7dXox8f7kAmX6/NyARkFGzMt+JaHHIiMpBFW1PGh/auKLMoTcOfDUFJxQegnxp8s
	 suAv5Tl2RQwai205y90X9TBzL4y1rHf/sBV+ZMjQkYrm33I5/oCuUgXXclSHAx6r8HKfG
	 rpxr70hNWKSIqpXJ7hDxf5CEb1mxX8iNm5y3kUM+RxnEYHKlSpooOTraXyKMhzqRp9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
	b=AUHQLFBdAWo4kEbxZpsvUlXOEMFMArtTkYUMlJgpklGWyZBR7D1oC9+YL8NDbihhd9s5
	 Nk9hNuchdxkvsG/ou6kTxET87ahfh9W2iE9vZ5XrToabhjwwr0Zqk7nK7RPwlmH2SfpuU
	 dRVQZeN1FJPncywjhiUuloRJHpeHEcUgzDElcA7g3mlZp3rgC0NBbt5oQDqSHcvwuT7Cs
	 ciBTpS+8XDbxjwMkVp84PvhSoOW2y2fypYlMHUTEfbGJ+pKLhZNwD2o0klhHHyhvG7DAa
	 7rel7NPg34VC513bcHeEb7/LyHAqZHmvF18d/iFiaBIqk6zJB8aPFkUULDhxjvmTJbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC417606A330
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC417606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lG1u2240852
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=st+FkmjgxRkO2p5uixOrBU
	L2Qow9wwEX9/ybZqtET0c=; b=RaHFHGUn5JcunHYUUobWtAI3ki0W6U5NK0DwIm
	0MI0WtYdI/A5FEwVWqOHRMBT/xsdu+r2z12mlZ2WvzzXjMShZ14Cryd0kEj0pgZn
	eRkUhEbrHJfd1YvXYZyQxHiNaA+d6HKgofBS3P5eoEv2DiB599+K9Qq/gadW7Zzs
	9ccAT9ZTLYPh8sYTNBoS2A+12rpMxUk2jU8HpnjYzuHelRfHIsIT/VVfHMOXnuUz
	zYrSrsTsNfUvnYwhiuGWLYnctuQh68t3307hEnsgguttJMtm0wahzX7L1bqsJQDj
	lzBbmMSozRDLVZ5A1IkI5rAuwUNQBJ+oT6I3f4OdQPOphEbw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1emh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:58:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1792112c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304693; x=1794909493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=Mhs05U7TVFnffqRWKGhCr4j8nfECnDRZ0hXvEpSiooyuVm56xL9AtoxV57E7wdZW4i
         rUqJVqO1s5Q0oxUePUHF/pryuCkvoTuBeBY9WEs2VWeQT6al95+5Zo4jbr9NlTok7AjM
         8G0hOHHN24PEiGQPkSp4NVpI35levKn/t+VPtqGe/l8qrgv85pWlxUxmnqr/l0HGZgfR
         ciYLY/0MoWaVDygt48sFJqM44cc5cy+BrknIYryoZTw0yMfK8LLCIzcfvrQuzF3ltuCX
         ebisP8YDNj3G79YU1HLi39Sgjm7zSn2IuSPV9uXmcisOPovs9FLUKRPV1CXVCvBGXM+t
         mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304693; x=1794909493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=WOGVpouW6cNRH9FkprvhtY62s4ORmTOyBVwQOsZleiTjcqVWUB8+ctLWTYy2EUAQOT
         HDNkw7gq9hUWd2ZXF5FF9ye0ls8BIH4lV53e+hqz0r1S3daR3Kkasn35AAay2nWm6IBJ
         lF26I5wCYu7Scg83gsoq5wh48c+9YjYm5szH0vIQYzJG3AIZX0SN77hE2HIWH74I3yen
         0zUZM7u+WFhCRMkc6nDtGMpN3Tv6PLK2rKYwfaj57QfEoiOIHtU2u3Wd1gwTkhYUc4af
         FeVOwdkGPl6q+zlFAGK98u89HsJLxjphnpq2ZRBKt2Lo37spz37QAmBbiW/iJi3wswpq
         t+AA==
X-Forwarded-Encrypted: i=1; AL+hErGV0J/dHlmQzRSNYIfqOL0r5clmUPBpXc/jNKYe+UHC6CZ7/EvBYrfVcdft7MQgsB55VFIR2xuE+31fjh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89wlTgkYft4O9ytgyxUmABLbJPnZv4+/VqHdmQDKMjkrVTUSf+
	Hky9cbdFpq60VDugRV+z/keV3xcftvhv63XbcxSAbk7/jSA2g2KPRlpSTDCiSvx+oK2O+aXXSnU
	4+yF9VrOR6CM/VFaeb13DKSrOk+zfbww5FzxecUh9IV7uqiSIxeQB64Je66wRaHlOuuY=
X-Gm-Gg: AYBFou3IGml1F9O+J78pXYydkUTzM1Bx/Azih/NW4Ws3jkNDiQQTF11S+E75ffhYURK
	rWXLZ88vYzo/vEXNb+R/i/PfZUqHjQ2A6sSyy9g0d2wZcoi8wQuXy87BWVlb8Moe7AajJPRLcB0
	qOPEPpMBl7xvSLb+OYrL2soR+BzMY5xexxdWi3POB01ws6ratvujyK22yn9zZkYHDAg4GhIFaUx
	/JXoaHXJ8SBkzvwHv/KXXazp0P7+mgie8sQYkZOFCqjhVH8OMUBYFXJKEBcSzWmoU6CxnbaSo/l
	YpU8xU52pg21a0PkufH5F5KTXvBj/Ikh3NL6gO/NuD1Q56secqQfq2HSbc0/kBdaolB7GNzXIaK
	vN7l4Ri+tpR15JXpUK3KDdUgaZL8lZiEhwbqI4PvF81YcfSmDH4vh2/KuQnqqlm8QVquCiimEr8
	rBrd4Y7w==
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008453c88.13.1794304693005;
        Tue, 10 Nov 2026 01:58:13 -0800 (PST)
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008418c88.13.1794304692520;
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Fix issues exposed during decoder seek
Date: Tue, 10 Nov 2026 15:27:12 +0530
Message-Id: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHjq8moC/3WNQQ6CMBBFr0JmbUlbBIMr7mEIgXYqVaHagUZDu
 LsF124mefn/v1mA0FskOCcLeAyWrBsjyEMCqm/HKzKrI4PkshA8E8zYd6NRNYR4Z9K0pcyLrDu
 WOcTJ02PMd92l/jHN3Q3VtDm2Rm9pcv6z/wti6/1RB8E4Uwa14UoWJ8TKEaWvuX0oNwxpPFCv6
 /oFlu3qs8EAAAA=
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1413;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OoTEOWQbdE3NB0Daasfn0CVEElbzqxziQTEV4sVvvLk=;
 b=g/hV9z9s2R8N3SVEnJu74ymiGkSDFaugKOJVWe6P9etdbWT85UnQ5WMFuiHquXDkIevC8lWdG
 oiww5YXr4oECgEGH45EtFxB5CLSteZYvc/b5XnBYT5rdcW2ED4SzDhs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: i1IUk5qznHNFWRGks2f6hfHhW0GbjSXi
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2eab5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXx3HWIlyAy7yp
 C/+vCoUlPccYejMR5DyNAl7RMi2p0rUkjp7brnTu4IwvKWelgeq/zAE/uXkdXIc3xYNOWsjUvtr
 JUhWkOnRTrL7kvPvsnyQaGo+IXTXYIDnJuxGHBTRDiMfU87S7qoyuQtFxZpwLMP4kM+dnD8nB6X
 YR3KSDb1fC4Ve2AT46L/Wgl6Z2xPDydJfnhzomdZk+v4eftIn/fYVXAGvwkOwu183/0KeMIBrN2
 sukIyFxXZKO9sNiI0gTwsbqoMoT2ORLYf1cAzH0h7jzIHh/lg8eQDf1hdhx/bWYbqaBcx0rlgSc
 ZaAzaaRF2U+FMUDmmYaAZMZQMOf/JHKgG/mlORiEH5vRSuzTKNvGcOU5gru+QraKzjRHMq0toFH
 E7jq43Ye8rTBZfCA9VlFBOnl16JpG1FVtEgUk2BMtFACAILy0s32N+nOfT0PoxjyZVdWQNLEYYQ
 ewCvrLFqMH+J+AyKPJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX6WzzEFPpgCLM
 14AaWC1+frvLzc3ZDI6+uq9Cy9D9AhSnwQMWh7t5STKBuJMo2frLhQAzrcumhU/1e8xJxjIN19O
 4rdd5j7pyk5UJyIIgSxImlciiv8fDco=
X-Proofpoint-GUID: i1IUk5qznHNFWRGks2f6hfHhW0GbjSXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 21 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391591;
	b=5Ee4PThMohC1lkZ9GWmeXk09q2xkjtuayHVKFz4bbx0+Ozyt7Z3Txmapvz3MfjY01icp
	 uRJIEQ8C/U09BzANHSH9eweQkjcoiZhGZTwKVtQCHXgX1Mxi0EyHrHVO/gpyuzqimuBK5
	 ruunqgAUDikGK3zR8z9KXtu3Q/Acbg8EqXJAqalGAvC2gIBwKgQb9lJa8Su5ZcdVGkwPZ
	 Mu49OrlS/EEvmPeZzgMFCLTkbr0Qs0L3+wo32JbsQiqLltDOooSYH46Jqry2Fk9qm+8Xn
	 JiMO1Y7vPeQFkk9F5O7yS2NqWqPlKpJX6gl53OG2dVMYqriGhpeYvN6H/zAn0wLWODw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
	b=L85gsxZiAVqSf1ZGMe9msS6rF2Sqy2OBfueSwsmL30IUnLRBYMCRbOIk4kGXZp3wOGvg
	 NUdj9Y7r18/hWRgS1d2ld7pLKVLBIR7sl+aCFrRx5RaU6QzOnZBRRqGDhpYs6+LYeIVeQ
	 oLuOTd+h2FdM3G9vWADbkEIi/AnUXZF3BGuuolwat/GkCVC5RGSGhTsXMB46pqUfEJNM7
	 04nVtqhs3XsIpz2u6mhMsWzbvWdF1dKyps8COgFBZ2S4b+TYMA584fUq280sh4ow+9/3r
	 6cGab3vHnF7R1uP0diWnTGvbB0ji3vlR8qnqtRPzEFZ/OLVgpoXDO4zmzfou+I1dvQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkAnpcqH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B786606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B786606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Phw7tl0q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hkAnpcqH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhk5W487205
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2kPCKs/RDRmqxYkAxTLufS
	Jm8JbuEsv1KYBJrRSxuuM=; b=Phw7tl0qbHAoMn2kPxpTmKvydreYwgw3+m+fcZ
	ybZV3NGFNM9zmBMopNsSXRGLe3Cn+E/dSouR8S6FL69jUMi8eEk5lR0fw8xdU3V0
	ZA7tGEwTqqlR1HwVQgHX6pS+KV8jZREu/1g6TJ3PNFgayjgyeNyaKmniomr7ztlO
	LoncEcUGJhygPoLnAP9kBJ4KAn0bCx6qoYPMXHGXP9wrMSyY8yqsy+hKFOKKUzHB
	n9A0aO6+I1YYw2VITCfi+sSKqFkIitV9vqos3VvmrF3FH3X9qE24XBkeQ1GRSKwP
	5VkhEqrOu9WliLE3eRGC2TP/Y/h5+8Q5syJ9B3Xvc468uA/Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s7095d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:19:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so1436716eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391588; x=1793996388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=hkAnpcqHxLgx/ra7LAJkcBfPoKPLcCyr1BQhHGfG0rmkEtSu/WQxii3o9xI6bj5J9P
         BZTOEB9uidKcdmnqiHxiRNjhMUnhZebgwOKO0A4xISkgIQMiKL9d237M94PHsO3vwR4P
         T9hJWlU3D+5LxwzEW63dSv09hOUsKKxjKYscS66A+BMmMIZq8QwvxP/bTGR/XFv+9fXQ
         +rMBxHtAQOTFHTAsfO2+8+cSs1j7APo6Fwu6tZIVU3BjKG+SQnH7QAqzDu3pCJ7JRLm/
         Y7BR4Bo4SCK1Czi5VMUhMGvGqrx4iNo52UlWIETjo/B0c75oWUwQYfI5At/wFLHwT2g5
         N9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391588; x=1793996388;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2kPCKs/RDRmqxYkAxTLufSJm8JbuEsv1KYBJrRSxuuM=;
        b=v3fSOILPEU+8gBZ0TafMxyAyNXPt19Y+5FnKgPKXRnTNDBUZpgHozNi2dI5O0lq+MV
         TkIydq76NKJPmnwZQFmdwToTqCGfVL7M2PElwZ2ILtpF8hNI/WYAaY8g/IUR0S9IPR/I
         0H7uOIq+U3Ey3iXIfRadpTvNjKB827GpCriOU26p4Kh5AgDdTebGV7Uy+rwdaVwmlBi3
         e2C6x8GKLpkFYDnHOGQF1+99xDo10KnKexW5sP8+h+VXjbNeo6t7MPwRAEM7FNBLkaIk
         xkgz/GIzqkNEJ2imxyL380updINB4hoA7eBc5O9vRwzCk3EYUeZmBygnP7/XMwdcvJKm
         izJw==
X-Forwarded-Encrypted: i=1; AKwUvBwXH8Xr9FksYPRbq8GwhA9E6E42RgcyYeqioKvwNy4LP7SOaDcqPf10CTZS4ctv6eeC/1MX6O4huf6BPsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ+CS8decJvOoifG76MylwOqc1U2I2X4YzE5p/qGodZg7LzVjC
	5GjVci8oFCUphjmvtVb/MOWC+WYzVvELmVVqxQ7W6o68JlfgsKlztevGd+OA44CWw2kBYH6DR7B
	YUr9N8KcXGc1QNB3nIrj47O/Gh3xFR2Q1fOTRHouNh/r7if4ScEzVkWsN+THlgamWH4Q=
X-Gm-Gg: AYBFou17KdSHI6y4+0Y/U9mk6F+/MysvWi0/MVhMVdaOCayN+BeYbIEhi8GsWiG8zKg
	X4I6AVTlJmhKWuGIFW0QD9sm47VeTHjjUUYGpPOFAO0Xj5maZQILsoepmFbvNpd3NY4zfe/bgbs
	jYmwbzfAVbErL+BlaSpiZERn5MX/aNbbU2sCklsUQwhWETJ5GX5uzoRI2EJgxPqnSl6tWRBykG6
	yzMrWYGNj7F7lH9C195Mcm0889Z0Ho/70ZQTsd3Ldbdh5X2O3EDe/vAU9GP2M5+MKZfVLXCFf/a
	Ceq6uj1TLTWhjoe25bfbsEKBFgeVWDpYGpGftkzxDsAiAW4xM2vV6JgvZHLkSKyVhcqzpWqmwtZ
	LrlA/XEfPYml2ILwgrUtsyFbgQ7FsJe0EsRGLuWLSjy/iHYwG30Rpx44NmjZ4qZMeWh2Bq3+XZr
	RDgYoa2g==
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314834eec.15.1793391588339;
        Fri, 30 Oct 2026 13:19:48 -0700 (PDT)
X-Received: by 2002:a05:7300:26a8:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a30032646mr9314808eec.15.1793391587769;
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:19:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 0/3] media: iris: Fix issues exposed during decoder seek
Date: Sat, 31 Oct 2026 01:49:08 +0530
Message-Id: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIALz75GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2ND3bTMiviU1OT44tTUbF2jtERLI1Mz4yQTS1MloJaColSgPNi46Fg
 Iv7g0KSs1uQRkhlJtLQDdVyLWcAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1148;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=aBpCigvip3vzlaPahoVHpAyPFq0Wo97KNuqvQOgjQfk=;
 b=WAWWtyA7FK3dH+XMZfC4EzKghm7UFBxlf22+Btw+plZW7u+k8PJUulRWyGCo6s2xX4m3Dic2j
 BzCSCVu7mB6Dz9sgXn5B9YyIHZBBkcf9CBiVVM6qIbz5nnYdpfgqd3L
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=cooOAF4i c=1 sm=1 tr=0 ts=6ae4fbe5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: q7eN-leOzwyBuK2TgIzCLY8ciRfXLAdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX82ruHXSQz/TX
 Rigd9ucJJlDLpnBfYs+YbsU0ByfghvvEJ0N2wThcpn4Q2xd4Y0oZv78GsvXY9UwMVeAELSijt2c
 cdRzSHLBH0WDFLfrTMRL5HwlbBE1Jg3tfbtW1mSOWDNbu+PigoyFcJx0ZiVPYnA8pg5k+GhEIsi
 8rzmBkS7K8LzoihAkIPnqwb/rAyb1t03wiHQ48rpEOsu0BV4H8YLJe6xhxchWNE1wECkdGsHiAz
 wOQ+BCILXGtNM6eDF2QiTM7UUUX+wRACwjC/edOgbmQ5Jq/Q+BSdWYN7i/VQepMIf0rF56C3JVI
 oZI13/2U4YQ1SQLspl9MVx9LPt6WtioeZliOvOi1gv1P75Qyd6oZrlRhQSKWb3UZoMk2JiZ2lBt
 tHzsULAJZTNpVqkYwIJJKMxv04Qk3crKmd+xBaSmOx9hkVisk/qlUtM+ZzTfU7RVcT7A/w0Qe/I
 xsjjBd4NoOfE01IrQsA==
X-Proofpoint-GUID: q7eN-leOzwyBuK2TgIzCLY8ciRfXLAdz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX0BH1CpO7Ozc9
 CqVZPBfhFLxaOvNVnxpZ21ApwJoP/RKcHTidcTt+PWhspjQqdr2hXqSJiUu8N494l1LeQyZBQXi
 KaVec4/rtpp58wZrgs1BYfCEaaVw0jA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300080

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         |  2 --
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  5 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746214;
	b=MSq61HL/CohQDE01t1PIN1pCgrmKKnylapBOGbkH6PnmsEEADA41bnGV+Nww733bY3dY
	 GBJHsJth569/7lF1yab0jIcEaG6bFXBnBWctTuSb2R2/a3O/fFfBcz1PFLrqnXPlyF2A1
	 RhFgAN+5smVt5F1XdYCwsYO9maWl5sS/v9TXgj1KziVrOIoPSv0TherN87/MlMtRzmhBF
	 2r5rGbE0FJ3bYL8gSAxOLhHk0LDMwtq1f9fwyI/kYRUTCbszmvgPqwtjR7P6abQV4EUJ7
	 rzgZz8G7g2Jda2JGS1Tu424e1UkBfESUdaqogB5SQhMsfb7qYs9lWnW6GuNyLCmaTNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
	b=wIraQNNOu2/3UiaE5mKbwPXYcpWPuJvIj0AR73Qj+KUGjHiEB181RUBLH1WkpsyQOR+Z
	 bxkpPnMc/AjJnbJrsYbSBy6qnRiQfoUp3RbdgaUVrb3Vu7NLG/Sh+OzURHdbP34cDFrPW
	 KynB8kph8SC+2Rxk9gofC+dPMySlmadjs/Jpn/Own4xFfZ6ZixrpaF9TJ0xsULUVilDsb
	 MRafVk5nUgTlxCjXn1qr+gcJ8wqFTGz1Mx4z+5vuMw/QOB3LPo2U+gdajn3zn1dEIyXWt
	 utK5kRGFSJZLdCwED9kxAcZgkQg/PoRlWx21o6z21rqZlDufKn8U2OPsZl3kANp/NZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hJ/LqxFH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=km6f9JYe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C76606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C76606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ/LqxFH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=km6f9JYe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FAvt2067851
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zizJUYpF90I
	cu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=; b=hJ/LqxFHflNTHadd//qNX5plcNF
	qo+hG3Jl0Hv2usG9aarPvOGXDkQS7QbJjC29isFGxQTMGuDurPIOM2X0zyil74fq
	G82o6puo5002gvp7InM5G9aKCVpou5uL4CVJtOmzQfjIOqzoik8nLlcWvpewIHkc
	bMw6wQJBLOy/glPuKuvO08FIUytOQc4LMwzHBrHdpEuSola/UZyWNVUjejm17hjS
	zx3kwHB11uU6qV60qM7pd5vhHI+yPx9gBidMnn5xVHJcTy4xjXwEyMfFs2+Re+aX
	CTahl/YpUyxOSQg+se2V+hLKTuQaDNG137LZHJxWf7kFU6qc74rpQl+zyXA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw3c4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so478498a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746212; x=1793351012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
        b=km6f9JYeKqUfE1bcKSAFQIquIjtXfqbs+/JUeq00uvY1peM26NCXF+5jbX0ibUc9uN
         eZCxcn6jhBrLQQZPyxR+4cxPfZbC9ChSjdBBWJEH1obcRD163RVgees3DtQbZWP4PbYP
         X4ONsPFoHlqDeDuUttWqzSx+bMMTSxOU3vj5RaBiIQNsqLO8NtMA5irb7NhAnvfW27j9
         p/SLxwQsGRotprr+lN8LvYDfT5kbc2eEj/hMG44W9ponHYgmvoVxsqp1ycx9086KxSRm
         vFSJbp6eMmNYhbxbL1FdeBJFZHESaS1zxRzjED+9fnR6gH72BvgYSssVkGS7amrITY/a
         +xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746212; x=1793351012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zizJUYpF90Icu7Caq4ljSkAipD1RKR/iCocUSeqdLk0=;
        b=hEJRw/B/pwwKBitqfHVibrZDPsUg1n2lt4GzLodQUfetRTfU1f20ijO4bUUnUx3+lp
         W3WHUnKMJ72N4X78635jdAPGbdtBI1LY5QR8mhD9B5Rz9UVTQKWy6D5gR1DBAbAmojHD
         crm0nn6h7w6WUBIvJE2Ah2RqwVjC0FJZwkwC+Aiicm4PJKgR9P7Z+/ucaFdEVP/bMd5A
         xd5lp0B2nwBnW0BblzJaPC5fbdYsoF2xEOcNmjUdO1JrzHawH9PWdyXHxX0sjuEjtm5c
         p1Fen85R9MeJPjSgR7IeHFSbSRTVW+b/wsI2y5SvZ+rXQEQp1Mhdr1yY/Qm8xStHJr1U
         LftQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3XyYKzv2AWqCUGQ8JIb4X0d/8IWXhx0Gn6fSCgvG+3+pYSl/YgoNLAv3oiRqA7GfAaRVXh6rQQVbSwQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEQEUkjQ1uOMkBnjSPbskJNmNavxa0mDyJfSuOrcPZK62wiC5A
	dnbMhIRKVgrHYtWyhbf38Fk7sf1Ok5hpzrIqCA97LOEodnHBiU8qc2BpH/jHKWhGBaGYGQ0AEUE
	/fNAnvhacK65HiZrtazTNVry6bGIN0ekvNKUJc1oAtUgJXurYLID7dZTXdxJ/UvFFHn8=
X-Gm-Gg: AYBFou0F4cFaKpV6rdAsc1JNejwVRDKitNtC83N54S1mOs53qkoOsbS597gwvVZoFWE
	L6LbF7z35lU+M+nZRS6J1Wh6jMfkhAVOiwV42EzzLwXbM3nx+iU7GUth9VFFgRz5VZZKK7RqXJy
	N8N6DH4bBwKf7lm6vafK6oPNORetaqRpiMEbKzJRr6NrHcCWBNY62AWC+kgioN33VxRSOsLYhJi
	GRMMiGkZ+81yhbl1/Sw5nrRyPejozBOJA8zOXM8iyPQRlnyxC23xmZtbM0M8zXblTn0GdITcvTk
	9etJ83XupDGaN8yQ3A3CExZwFkGHA/25L3bOSxbSOALdu1WnjMoBhzMZRPe+RG0m3uye307d9Xp
	m0UosHMnlexwe10x0F2Y6qtf/ClIanBTBDQ==
X-Received: by 2002:a05:6300:618d:b0:3e2:91f1:3878 with SMTP id adf61e73a8af0-3e359a416efmr1359344637.10.1792746212358;
        Fri, 23 Oct 2026 02:03:32 -0700 (PDT)
X-Received: by 2002:a05:6300:618d:b0:3e2:91f1:3878 with SMTP id adf61e73a8af0-3e359a416efmr1359311637.10.1792746211896;
        Fri, 23 Oct 2026 02:03:31 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:31 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: qcom: sc8280xp: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:05 +0530
Message-Id: <20261023090308.2898683-4-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GB7cjN7tfrKJYBYGvgv3u_HRCktIkFfP
X-Proofpoint-ORIG-GUID: GB7cjN7tfrKJYBYGvgv3u_HRCktIkFfP
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb22e5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PKVKsYk1ooiKBYXMgQMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXyXYbyOo5dRde
 ffJl2iLVnHXuYs5CMRrqmKwEcKIcAogvu2arfAuvOmRXRyq1xRagv1fXBuDQhI6vLiEcG3beN1A
 JJu4PEcUliOd/dT2zeUwxJc6/U/eYqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXxOyX+QA10QQp
 22sD/vcbbin6sBDaXh/pLiID7XEnWKGAddTI1QOPKUrsQ9amSF5TZRAnMlZnzib+v705SvGHTqE
 OQmYMsic/RlFrHFvRs99XapVeM2k1bMIp3WZIv56V8+CNj8PpxXSlEUbNo+eLnBI6vrufioj2+c
 XqQlPVLhPjtpG8rAzPxedleLWaQv/KXUkwMlsp+5WJCuyaHFa6xARbtQgHkizpvAsc9bhFm9GQe
 rRIJu8UchW/nU1ttipoxYtQ3+644siKuoX2+K4O76WqBdc3IKRKKWzdeujWFgdVuasObARyEIQc
 osO6Z9HvOmiIA0Em4yNw8j7uGIiZD02j3PvEAkaUyuSoCSOhTpXSrWsllzVHBRkT+hDAQeW1COZ
 Iob4AaPnHLu8sJ40mOBtCRHfZT2VpYOmaGQgOS1tVCkmZMsx5d4UX5Z4+zExTrWENqwZTVFGZR9
 0Nq2nOTq+diOUOYW/4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from sc8280xp device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..3a26377aac5c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6279,12 +6279,6 @@ compute-cb@8 {
 						iommus = <&apps_smmu 0x3188 0x0420>;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x318b 0x0420>;
-					};
-
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1


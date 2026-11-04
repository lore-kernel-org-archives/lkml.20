Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769524;
	b=5sIr+JAnjk65nciNvhCfJxnkT23EjyT+3oOj+45KI/EUZ3Zh0YbN0yZ2/Y1q0H+w4BUF
	 eYJWs/wQcqCBhz1THTslry/kGyyMkx4djrgSSLhnS6gkwRvlsHHIBCa0On54MqfuLyVhU
	 KGRFdAac7jeM2NrRmJ+LiIDFfGoGz3sDg/uOnWdjuwqjKH6QMrylg46+34UirmuoqweTU
	 E8uJa6ZepjQtM8y4fGw0+ivCRqGuRXXnHKrJbxlZxKMtV3sZAetvY+lRqVyOJjfjMyC4F
	 uqLhjzUnYsSWH+IqgdK+R8rgVeBqCWYIJqGaiYoHpdL3h/Br6t6Sb1afU2KbMBwh6jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=;
	b=KoElPvYatQ/Sii8JSMBoe5JetVOTAL/WKwHo+CCXaWbBXNmD5/yG9+DeAfFBOhBBsffH
	 lfeTuDUMeVh5ZGwqdygPlYfE0WPHK8mRa0wfTKFrDkFs3OtAdiyHs4lTT948xQbwnWMFB
	 c8xaRJp5LBI8PZ6SFAmg/H6dI9eI6FFeipu5N97iHuwxNzh1g6Cd2/e4cGoFyz2Tr5s3M
	 ED7sWMWNorVSNLp5mj/Acu1GDVtVVtLrOHHgOvJktiXI4Q9ONZNdhOBxY0AYAw9Vh6gvB
	 FWyLzBqYZDlvIoVSMHKxnr1z30Wlf4yl65ssN7AW0dCr6FxEKOVOB7RhRdh46clTnYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kthFtGq7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1BHEiVo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2A606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F2A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kthFtGq7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1BHEiVo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RRxG230701
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1O
	zEwCWkgU=; b=kthFtGq7PVeynKAu00mftuwBtzX5H8t2MQTBXmDOB/Cm9116Fyz
	YKE4VBrQbdvKr0q94yvnOYo6aVTwBc9rJShCDQN9rL1IWRttyrKa+HtaaITwAC3K
	LbsTeVrTlS+1Pd4saul3cTJQkxpJwgplBzIJEt17J3VecRqqb2qMjh1c+YuPZhrP
	Xe3sOSeHqdBOHbRh76mOYQiW5KkCmMa4EWrELOgHjJ66SBwlCBvekH95uA/tb2VX
	STZi+RA7KtkHdSxhCelV7M+hVMZACbN6pYlS2oO0v9krBNWJ/yPvxRJb8sr64kWA
	COr+BFZOMywkog0EKBN/h0RStBhI9l9gXEw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypk8ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:18:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85d502ea62cso424704a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769522; x=1794374322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=;
        b=e1BHEiVokmj6NnEP2ON3+mo4zC6sy1iVmsIEtO90HraGiGS+1uul/KxJaI5aoe1oPx
         Y5AO9M9l2YVdxoX65plzLd8dITBeMdiCLtjAibiL3lGJ7KTw7EuCtxBz4eBeuAfUWd78
         F6c+v0StdQk71lSHh9incT1RMnQaFREW/IIviB0pCjvce4N7idqj8NJVOHvSunb6Pi5A
         lk0j9n+6Mzoa3VBKFLN6WJe6BCgW9xZZ2n8s9IcfNNX0cZ5bZAryhuuXt6BtnAqyzwnV
         RgiUKFlg/A9sd4dhJnZsZPRYRp2YXiVBiLj+2DOGpLmrd6KTVWOIRiHk+D1HdW+hQraR
         m3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769522; x=1794374322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=;
        b=2Mea5uFqfn5jLG7bSrprLpkS17ZjLo4HYslgsrcu+eWCth1gXxz4lCiI56rtVk/CI7
         Walv0iHmzu0kMLi12NSx9T6YWRcZEa/3wFe3FRtNrxTyMTf+CL2rh06nuOqHfGpbma1O
         4fx1KA98DGPhI23EzIlNTaekQm+Ho/JpPBRl/2q1OzJMiCVLpttskrrmZX16NZ9PHr2n
         vL3EYJ4jL772XtVKxpR62myRBOKqNbgL6d7tJpOyLRc6lnzFNBj5pJ2a556cu0NRkj+X
         ykzUffv3SRhmVG34jjeqkDL6sSXCJ7gg79/h0LybwzPW4bNWMt8ufLckFT+qyKQE7b+c
         QpLw==
X-Forwarded-Encrypted: i=1; AKwUvBzUejmlA39+xIuzIevYbhkDOClJY31xAg9LK9ICx9eBVOGFVeNJRZrEn3RS383hMYeorpws7sAYKUT/ozY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OmoVb4BEspXOYBa8HbOtZrbwQskKej0T98WH8p7zEXjGTa0pz
	nZbjLlbCmLYoTj0CZcosseCoEQwEtxJWoAwuLemVO1Y9oFWzE3da9zM+LMxyCWPVvNU9VRdYFBK
	PA3ryDkcZYtAuste8O5siERU6ozNYTto9RzSuvGFjEEWgMczqQeFQSQ5pnWJkkJPEu6g=
X-Gm-Gg: AYBFou0KRwahtXFSF90y6UhvjeTcSh4sDMTKxgEl4zwbZX3pFVf+3vAceZc+4RUl83G
	M14vUk8XAXLsHLOb896dd8+k/zUnfRz//+49/E8wr/b9f5QxS0u0I2flKoEZgBWGtqdlNkmH/FZ
	wVZyynAtUJPTnOuo3YIINhYdaWYyb/lZuSgRuDAjUC/ClFhSRw+nxzU3yzLRphiHVIL6gAU7YSo
	oE6dyuum4DOYky3d3jQMtW/82O7lMuhmArT/KCGpt34Ws+fXVKzkdASay8Hh3zm05/RWJgqH2m0
	x1bN6W/K/89+q2jGYiKtPQaguqqGeLnWDouM8bguVCkK5Vj0Ggo0x14QO3ahnCRNmo1CF14yR2N
	65efergPO5rRBuOt3H7ppfTBhncuy8PQfQkivjIi0dvjOmiKs5V7rwbz0XSHhhb1dosl6SNCyWb
	FxMeriIVFnxUPE+16pMiQil9OA0XjVA5Hu0XTE
X-Received: by 2002:a05:6830:4392:b0:81f:da91:c984 with SMTP id 46e09a7af769-85d364470d8mr12320475a34.11.1793769521692;
        Tue, 03 Nov 2026 21:18:41 -0800 (PST)
X-Received: by 2002:a05:6830:4392:b0:81f:da91:c984 with SMTP id 46e09a7af769-85d364470d8mr12320469a34.11.1793769521305;
        Tue, 03 Nov 2026 21:18:41 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e1f2f0sm1097317a34.17.2026.11.03.21.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:18:41 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
Date: Tue,  3 Nov 2026 21:18:38 -0800
Message-Id: <20261104051838.2912931-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX12NgTt6Xm1FB
 coeo2N9oFfY8tTo6A5SKe5+hmk61tP9fXxKaGlreyRKan3l9hOM9uQxhvUnEORZlxXMSjgSCagy
 HT/Q/uuktMakiX+WVRWBlmqacWJ+e0A=
X-Proofpoint-ORIG-GUID: mLbv0fllH3Pw71I6FKIVLxJtd8HyYvex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX2msnPtnVwXgE
 lfYURaXajB47VFzkFESjXRIIsBCrCeNDNHBxtJjF7OlzKhHRVqhQzqPdN0yWQ+FPOi2Vg/vbxw3
 +5diRrDrGexfmlKyowxbMyURPK8BSIoXJnFYPtszRlqUzr0W9d3juJbLAnBU7nkBcsQD7y2uSng
 3BTwOUHEwHnHsEJUb0Yl+ikYrrdSozhsybqn9G0Btr7NvE/MIQiVhLqsXOMKt/9IAh87RRx+QGu
 L32EGbzb7Il2OL0OQmUEnXRpyQD7kiy+Nxh0dlDlErLMYux310EJmS5FTRWlhaH2jkgzSmTxf/M
 UdCWTmoqpz4lJKl4DgG6gnlxpLWE+fxZ4HPBb+da72zLBr4MtnRe2pweVPo1fTNVouNk/k/e4BH
 4Pw9m5KOCG8lop78e4pQuoLtdX3zJMntVKQKEqA9hembxdz1kbnIzSABsHm+2DilSsb0PcBHsMb
 1+xB2l3zPtUbtzzGo+Q==
X-Proofpoint-GUID: mLbv0fllH3Pw71I6FKIVLxJtd8HyYvex
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeac032 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VKJZL0GhgKsj1iBI1lIA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

The Surface Laptop 8th Edition (13.8") has the same broken WCN7850
rfkill input as the Surface Laptop 7, so Wi-Fi stays hard blocked.
Add it to the broken rfkill table.

Tested on a Surface Laptop 8th Edition (13.8").

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- Fix missing comma after the new table entry (reported by kernel test robot)
- Link to v1: https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com

 drivers/net/wireless/ath/ath12k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..c0e7503c71de 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -87,6 +87,7 @@ static const struct ath12k_core_broken_rfkill_table {
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" },
 	{ /* Sentinel */ }
 };
 
-- 
2.34.1


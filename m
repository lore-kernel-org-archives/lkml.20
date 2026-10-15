Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDE51CF79
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058159; cv=none; b=ogMMZFsxVq1mjKCQyLG0TyT1UaPmGKPc527/VuPiN0B1Uftj7Rsorzh7zhwycBSTGHg+RqJCPeWUtlPuqS3SmXWOrG9uVQlWFLhiKC+uSeqF/oEPdg3FnSiEJBW4EicpwtPYKkSqsxU8P2wTLow9Gk68SddYSTBIr+o0BlwPaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058159; c=relaxed/simple;
	bh=nYlBV17a7zQ2gNkqaJ9HZTgoGYakOVEI5vUxNQl7BmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z5yist0UEUYOZF7tIue1ZwDPZcram9ov3LGTt5zGuJMfnVLKCfk1UYmg76UKG0R2Xadb9EYYgVbEDxjQYbO4cq6VKy0gT8O/NODHQDNH/jvx7Nm1eLHsa9dBcPxCfNdd07Ap/VR+Z9msVArbXaM4rCuwC/IWlL34Ub+CCN0Kwb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtvpRQRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKLdi+mD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtvpRQRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKLdi+mD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgvg1955846
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3908TNGS/Fbid8O9aG8W/Z9neo+p4WxNDs4awgMTsZY=; b=NtvpRQRV3zMD1Wnj
	MQ1jNi0+qyrJ4B+5UiyBkgCXckrV7gwDSIQwWtBww4L7c2BXDaHxTStxqY4DuPl6
	QTljd/lpVul9jptk7w/CAjieNNoQNLkY6+qH9bSe8lEjr0Z2yflHiKUAp4xMV1zu
	jJ2Y/V3MTNMFSFesI9dbs7s5rah+iHOqlZ08fybU5ylotR41al3kKzXnn5eLO15y
	KwsLj/nmQTIdTX2p9sRqiZRD5XfYHnmRWsrDY7hSvmhU3TkU3s9GjEWbYldZHZaX
	zM40DC5droPw5uF+2HctocBzADwSRTOaXSOMeSHZQ7pZhIw+hvoTyZsWCYbPQFMP
	CAz/Vg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet83m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1291909a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058150; x=1792662950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3908TNGS/Fbid8O9aG8W/Z9neo+p4WxNDs4awgMTsZY=;
        b=RKLdi+mDaR+l6c56V78mQtz5viHK2AW7Reuk/5EJtyxEwCFtQtY6cYU6ktUOZhH1DS
         gSAgc148FCQyZC72mgcqxzlHBXeQrmljz5jgzjgbtAus7NgULF3pyUIQrLtcrQ5T1h3i
         vJbuIfI45kFg2sXt+hNpWcTvvLxg9ptS89joFk4v6ekI+1F45GcysPLd2J0rP+vPObgZ
         4HFJjdm8ZP9y2SlFddZX+tLUQE3TzONGJVkALPgJ13YqlSYclZfMxzbUy9ajmDRfCmwe
         hT+NCk9hLjLZpA1+bMjYHFccXSmgYh1Cq3W1+jOGZkAJkB93eY/jVELNrLxuveAWubll
         WnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058150; x=1792662950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3908TNGS/Fbid8O9aG8W/Z9neo+p4WxNDs4awgMTsZY=;
        b=rM+gGkBzpZP+w2RUavxioYHHz4bL5oWvUNooJiWZDgoFsCvgrm/dN6IEE9+yR5/m6d
         iiXDp6MnGf6sMtrjHOCG4m1mzzlbfQDHY6CsvV8e+DHV62Sq53UVVry67ets0u1xud/2
         cOgll2bLbJbeJPQOlhMDkNNPG1yZVwnOuNI393jztOkI93GMy4adMjSc2rfAwKQr99hz
         A+TC6FRwNzQhxKuN32RhvrRKtCANOGiCqWNOoQmNt3OSRMP8vjtDoIM3enJllsGOJyKs
         sRYrdJcDQr1IWJqU99b0dO2+ZDjWQEEcgszyVpe8HuGNVvSLSuxp2hnV0bgsdPiwXj3F
         ob0g==
X-Forwarded-Encrypted: i=1; AKwUvBwcW91VP8IPLaGl+/VXLKNvQJS6fVffCzFDOgwDsh192mqJLQ/Ka+NJaZGhONUb1Ox4fe4fTfsdsImWQeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA/4V2AMq9b8WqzJzjeqJno1HcRSUjUEOC5pOfWGpDAVvMTlge
	SOX695+iMOiXu4KMdedNrtWHFKsRotPK1M2YK8mHLRxoXFXW2a6CeA7dzq/Vp0us8GjP2zmScm2
	2kPCRGdyN3NjWQssaYjTs69NLWjJpLAXiNvhVe9P6FwHNEE7Mjt3uxl/1zDSPWF4fRes=
X-Gm-Gg: AYBFou2zBotc0fXFbFXEnMV9eATaF+6CVyr6ee8iGY3srgCBJM9bPh2WJYYLEiiTYmA
	xFj/wwlrPs4Z13lB8pbDMfc/6AAJQwQG2bN23W7dJBXdQ0pYHu23Evvj2Oy+ThBPQ2rDnzCtv8+
	QWKb92i/+1fNIi9QzCOULkxOYa5H0lkMtEwQYy+W9cjVqTwtXypMyyGAC8a1zDTIH1Hm6x44w0n
	j13FD5v8eG1hwDM5QAnrrdK5ipDpGhkVtpLijf7IVxwKzi0J/TI95bisdpLuYfXOZLRwg3wf4c9
	SpOEDAOqOV836dc1cuhsbhLVzk9j7rEZTqUFNycPxGSCAbAKFgS1MJmfqPv6LqWpelRb21sI9k8
	+e1dnQOwFwsFKdtn2KaFnwJdO3RQtqprV3OPX
X-Received: by 2002:a17:90b:224e:b0:3ab:1323:1012 with SMTP id 98e67ed59e1d1-3ab3a32ff26mr15341696a91.1.1792058149957;
        Thu, 15 Oct 2026 02:55:49 -0700 (PDT)
X-Received: by 2002:a17:90b:224e:b0:3ab:1323:1012 with SMTP id 98e67ed59e1d1-3ab3a32ff26mr15341678a91.1.1792058149496;
        Thu, 15 Oct 2026 02:55:49 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:49 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:36 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=773;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=nYlBV17a7zQ2gNkqaJ9HZTgoGYakOVEI5vUxNQl7BmU=;
 b=xKwEhtw640KnplPAh4JHoBl6zznJSNbgZXyWUctSaqIaqoH9diG5TctCAoJ5z1lqXBRcUdnNX
 Y8jduOCXNW5C0/vvpyERB+FJbM/hk0rWkKAxEZ+k+NfL9kUrfac8DKR
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a327 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XnyjAcVTDvzBGVIe-PdS-etjFfJBTn0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX4WcLDikXlrRc
 BvYiebIhrbvStDwo+5Doh0C1u4Vd0wHhp+4LLJOFxF8hRGvaJBMTI+olIbJP2a+exIf6ddVxDzZ
 /J7qqfYojetVflHzoUEwLc9q0bD6JjUKlq5jTzFipS+YvQjVHM5wAjxwQMgK744qM6kQx1r/mDo
 rKa87ihyz9MESfgQ/adbAJQOYw8B0aIdqg8DMmmBA9sxBQKCqTaCnts/tS9qMZem797sCspCvXj
 hRwSNMZOxpisUe8T/l9tNZWFULW6aKzf8lmfkokn6ffuO7Epez4u/EGpQL+WeAXCqXLktmVUGgI
 fbLwJTBt2KZ1wt0902MPCmzeR4U0gYCuiFxZN/gIiBc8xYZcNSZSBkPlbXn3fiOMplvNmi9+EJ0
 Qbve6yMWjTuHPLuktbOJYBwCkHX4vohdOAQ8sJAJNQYI3VeNpSDBOQcXZZYIWbpqpshubzetkFv
 4BOlhZPfK5HA5HN8Ptg==
X-Proofpoint-GUID: XnyjAcVTDvzBGVIe-PdS-etjFfJBTn0G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX68xB5jb8WgWl
 bBDmGPGz/+UoUDOn0j6Pz5beNoYgnaEecsBaU6hTCJ3CGx92tCZ7Trl7p56ND4i3PCMU6dEmC8S
 hAtb3eC/CYe9Zflui4JKNzkF/kLaF1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 22eeacd7aecd..3bf7baa2bc82 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1017,6 +1017,14 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1


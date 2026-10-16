Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10DC422523
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142025; cv=none; b=aa9YMxnhC2ZF9mdhw0qS12vjEvSADsrFn/1RXNGMIgovYInBtoExOF5vNZImgZFKmYbOiRBn+/yQtSSDjAJ/3j35KTKnd90ejM3uRrzdPzny5s/ZViycbv93ia8xm8xRQPygYlxUb/hq5gr+RkD8xWr7zVSauXPLgH/KT77JGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142025; c=relaxed/simple;
	bh=7q9agbgpzQxOyX+M44hAZTyBMqFZNk98vDVwI1A0EKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBxkiPcWDs91LycuFp3wYD72SKWmL4eqsIaHboAH/V/v9C47w8adNHHJSe3tnlR5ME0aGpLN8u3zj1BQ2ci8Q2f7pnSnE23Px+4h5GbQp34y4TnDI8GXR+Zhb2e2NGBgx/GnjmT2MNGHr9mLEwnatVCL5NetIh7l3M6ItQgV4k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLiVwYC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH40EfmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLiVwYC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH40EfmR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8leHP1218634
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+z
	fEwnScU4=; b=LLiVwYC810WoivBfVxXkpAGkJKvB4YUVUKfQOhI9naBmYJ7ieQM
	9TODIjAzwsDKHhildK6BAw5to0HHkdzWQakdNrVwc+uzV5dU5+WvFj1iD27RhrgA
	8CrYAwFV+sE1WB39iHLBkXtXI3YxcUvxdeC6IULm80B8EKu4rheMK5gEzBKDJgTR
	fNTR0WUnse7qeSAlcB5iqngtoBcM1Ns8mcrcE/W7A8HXMFGt1bYONWXTO3L6bXKR
	CDQAIs/XtNrZhPHaayBX6s7CIGIcUF+wZvhdZZDN0B0iPF/RCQurdNw/tSU6fen0
	iG5uLb3Hh2qo1IqE2QoqJtOVjXsRJBO7qrg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seagpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so801310eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142021; x=1792746821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+zfEwnScU4=;
        b=LH40EfmR2xVkgNQVDmb7p3K3qwmDMb3LtCe89bypF/NsulJ2D7d7Vu+NvgQzl11NRd
         SqZT1iYPSNKIv12YpzfL99bM/VyDNiSwYriyD/M2Kaex2WDi109EfDjWjhwAcafJjwS8
         5DBcxpNk5yIixImU5kJKbUlzh95f3AR0QC2eyq99IbgqPFRN2u0DUOkOmadFxoPg0DLh
         yg82hBCPnv/M1l8jEFl9Nl166VT4fPcCFibS7ZhbnaSkrohIaCBBSKkeTGzxxPxIuIXx
         Ehqqi3G9NIuKJ+cbqds9oZ4x3AouAtnGhsAOyfOYJzE8zoWdr++gtNHCWKTFThDQLT+1
         q8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142021; x=1792746821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcVpAEASL7gGTutXPUb9lMspPQldyH8a6+zfEwnScU4=;
        b=09plfIaZSZ0MOe3RKJP9kCqMxw9CPzcB1ZW+GFue4UkUL64hpr5qYs3wIbpwuMnKjj
         LTlXVWQwS5MPSt+x4cW+OX6z5pSaZD0fBh1QM0JNKvvXc+mcT/Eos6vZ7EnDTD3P6+xj
         8oKAJS1VKJ8C5wnXG4UsiUIic4MBIDN/GEZdWQpHBIHFx+S/2iale6ymLBpSgoiZPPWG
         bb5n/NSH+ljV9glnTUIEYcLT0d5EzDtUCUZokesnhAv6f3Q2oezC8AT4dffe756WGuu0
         qoRyqRlpcsaaDXFfhgq0u5A6f4I0GjgmiG3e+wObH6qOJu/5ymHVtTuTfpNwTprKDVkH
         NCOg==
X-Forwarded-Encrypted: i=1; AKwUvBwVOkvntej2xc6tE2W7KFqlIC/vQnZDJH09VqeJYDDA9/S42fQQTJNQdpDolcJCbhMZYXL7vgBHBOHR0D8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhpWTuY8Gzao0U9jkZXoZflG+DxARHNYnygydIDuTKX9zt/Qvc
	6RDJuXbpABt0nEf3oOAqRVsXFGxanCpQRhwEUpD2QTxN35lJXR5bDmDuhoEugscow3nV7SL8jsW
	lRndhquYwXrm5reKqO3buaML14C4vjjSIVSfv5jE3WOivi5PULucIx8slgT6eFG6RGYw=
X-Gm-Gg: AYBFou2njsL3MuE8pZR+UHUaoAS/TolgZCH25g4t00bhSHCWLh7Sg8gtytnTDyy4YaA
	G+Ci/sLwJBUIf0CzS0K/7RP1Ohp2VWoA2MFiklVNDchBkj2RzFoycm0Im1rg0XOhnjhfSk14d+5
	N7ESTNe+XzsCDh50nJDqCb6Y2z2oPhWhQ4sZhir5EUlAhz5OPeqpzLQ0G2HVO8KDb7QuNeOWs9N
	TPc7ToAPWIqLbiyWEDNK6deRn1p+0YmdjRWH11GiXiTODvH7PXfzREB6dTqcrGAsc5Tk1+UWIMc
	frOZUsi4hMEhtotM/Wi3vw4cFrFuzvAOm7a6kIpGPfhUjNA48HBdYtJQAxRplW0I2umvDkxqa0N
	LqbCOhbyJxeNtZwcCYqkgphLjrkhMQ8XSVZcOgPyd54fQb7Fc
X-Received: by 2002:a05:7301:6181:10b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3602e2ac972mr3055239eec.13.1792142021148;
        Fri, 16 Oct 2026 02:13:41 -0700 (PDT)
X-Received: by 2002:a05:7301:6181:10b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3602e2ac972mr3055186eec.13.1792142019999;
        Fri, 16 Oct 2026 02:13:39 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm6195378eec.2.2026.10.16.02.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:39 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 1/1] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Fri, 16 Oct 2026 02:13:36 -0700
Message-ID: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXyIVkmJllvQ78
 Xj0ZPHBXHXM9EKc7E0tMpoeKmRYBZHR0eIqoWTuPvECIbZxpgKTQbohvVodrKPmvZnwnVpgfIhT
 sPXmqfxs225T9+2hiqMazYP7zKvzFE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX5g4wie25znhL
 rmZM9GbstvL8xfCZE9ov4aoOsbdHglgYrQs1608dWOyluRsIKtf0LOfQHL60OS5I0PcT9gA3Ct+
 EF9OsLuPaX4WwJKpZXE42GE5vhG4qsKaTiyRZUP9kmZA4+hmIQvJ5OhW15u2w+aJnw0hNWP1Ekc
 28+R4s4d5ERH+O0LU3FKbktxWqdux/TUGb2zWoyI0bHBEKhgEuZjI3AZpsixTwDd+OT8TPn3J1j
 yJjCcecQyfq3bb3X7HwO6BuFNhCiEf0hQZQc57GsBYr8GfuR/mkTTe37Lfi1eOxHs6/eJdeFZUw
 mfe0lY0I8MpdOMgqYm17kX321+COa7HB9kpFLAvjpiT6qxzFCoKnluLlnBcYSBvusf1ss4qmVi5
 VcwOaMDR4i1uBECdbclWDpV0AJPQMkCF8d4mkIV71yiwfDXs1ELFDBUJN8ZVtPhUC9Mwj9GIsnk
 Zwp/9QrAYKPqMR/MviA==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1eac6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5sioUILVtsypdmoVIHwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: bfqepRmcEamJ68_3LEZlZdscm00V0T-t
X-Proofpoint-GUID: bfqepRmcEamJ68_3LEZlZdscm00V0T-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Without this bit setting, USB2 HS device cannot be reset after it is
runtime resumed. For example, after:

  echo on > /sys/bus/usb/devices/1-1/power/control

PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
"port_wait_reset: err = -16".

Set snps,resume-hs-terminations on all Glymur USB controllers. This
makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269ae6e10ea..023a8448449c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5544,6 +5544,7 @@ usb_0: usb@a600000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5620,6 +5621,7 @@ usb_1: usb@a800000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5696,6 +5698,7 @@ usb_2: usb@a000000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			usb-role-switch;
 			wakeup-source;
@@ -5783,6 +5786,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			maximum-speed = "high-speed";
 
@@ -5858,6 +5862,7 @@ usb_mp: usb@a400000 {
 			tx-fifo-resize;
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
+			snps,resume-hs-terminations;
 
 			dr_mode = "host";
 			wakeup-source;
-- 
2.43.0


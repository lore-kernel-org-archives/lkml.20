Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915523;
	b=yCuZV6v8w2nUcNMVZSPtv766nXkK//j4xdhuAtwD7A7ImfqLoaGCpOwykRMw4lRaoXk1
	 pNMkTwEqA5yfJzqNY5YbEcVMWloXX1U2rtdU0UpwDvbPdLEkiAQ3OT579dS7bN1Q0aK9x
	 61AOp9iiOMleIyLtM5cpLXNif3k6yY3VIHfGoO2Wom838Xbl2GwCiUxttMrytu8u34agW
	 RqPyYqfBt5iOQZo43vUouPSRr+kswtmHA6YuCMZWpxn9coiQ29RZbLgvvG2xLte+UZ1t0
	 YDzyaGB6XcVDIHv3gN+++by30hXj5VvlEJ2WqLIWniiVja1XjkaXEO41nQ/VYzH0KCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
	b=Vf/16ln6+woyokS5gQL05KHCVFTTFGXrhkjTxxYpJAdch/fYVynxscqrXgWOWe+0uLiQ
	 q1M5wWKdUrvMtdtHbVm9ae1giviDGwDEJIhIt7QVKJMktlgpmJWvog0Ptu0313lfeOHiD
	 xXcBJ65F/bCuAGEi7pkiEPYquD9x/+WI/0bwOjrl7C33F0pqNj/LxnqJ1CAVf1KONT5c7
	 Pd0xfGp/jlw/DxDzIl7ZeoxXk6MrhVYhSt4u4Pl3tiEV+H87rF3ugqvdS0ghsgSRW/6lD
	 YHZOl2lEBrzfaESUCYXy1LhQe3S0yLLqcJOYGfEQ+mMuF/nEGlnCDFwAqPAR3rkSuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7E8lEmv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12248606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12248606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvKapnRn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7E8lEmv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8WNMX3407488
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRT
	W9cIpfZo=; b=TvKapnRnBm+Q2P+N44+Ns1WvXwN1Ob8vW3mebXZxLXqpwLbo+S5
	fTWeRMmTdRJLIEYY8CqBB/5FxeYQcDc6Zx1cXp4zYrgjZM6KR3wDfT2pen1NihuA
	/VubIkhW92t1DjOT9PqgSozn7eV/jmaJML78BKOuES7oZFHcF+3V+JdJ3BwNkToW
	EM2D2dxYT/wx72qTK3bsZ+UgjQ6poaDcsys6tZGN6c0OWQcv8mHzNUB8Hcc+LTtF
	dixJuXFi0t6LB4ybHf3ioQuGtm0I7ZpYkHB5bUKA0mJ2OuwWbB3XVJRilv1HkAcy
	Gxpn631FrGm2wngerzOItOp2pn/nUptHyxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htjvw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:38:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2566748a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915520; x=1795520320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=T7E8lEmvlSs6iXqV1KzqIsA4zhylfoJ07xAcUwJQp4hQ0R4PRbBUWbm3GSMxHac++B
         P822vpFnk6v1SN7a5uIsCMLg+ROVmFw15G/of/DrkK2pA+jpuFljEtc0QopbUFrTJn5k
         gDRJ4i+dmKPtk1sY41ppryIruTQ8EVZk6MW4HpOBaEwDO4tvLgfAlwkVPujF7lY6uDbU
         KGXJCKk23V5ZOordgKrqW4WVDvxZt7jikPbELibrdhQGPtThtUq9tyOA3buWXW/NqGJ7
         Qhy7QO2OarWSk2ib+GFv0LGSqLGasofPberrI1S3rKA5AeM7X7lm8BsPlQfdlMKxBZU2
         27GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915520; x=1795520320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQvQ2XC64f8xZtkViw8OYspDjMnnUYT6pRTW9cIpfZo=;
        b=rzQUNPc8/fFIRwaWYYZa5jx+kdZ0e+mgiyU6ziZvavnR/7lUdyx8v6sHfkOpIn9uc/
         PPqoTqXVY4GE2JOvUqFkttmjdQ+qmHsruOjq0mtNTwWEAKrkJhATG5CbU/cP4CXhgsLc
         OM3UvDzU7iKHeX+jgcIoCQOJd/KEycMPQsALMU80u8KYhfMGvW0W6Sm8H8XkZcqdS6lj
         wqvPE+TzeL5stjlGBnRirFWdV/QTO9/8sVUJxkfHxHzY7AAuALzAi5A53iR5QgATVkHE
         Y/2ZYmcnRl4iqleazTmNRBXIiMc1bqTrd0Yra8keGxzHwlGFQYMCqCEjRaH6JpWmianK
         WGgA==
X-Forwarded-Encrypted: i=1; AL+hErGoUtEVlRM8aaGTupY4MBbKjSJ2+lFfyGnQJlahjpt9Mb5QI4C1qAwaO5+LY/5KSXDVto41aYtotmz2NhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IxJ4phL0+ndTDsFe7Wkkl1hyCIDIsXwAgrNskMEVmL7cHn/gw
	3VouQ0fGzxixDBIIWEApWAa81sXTx8LUzS7LGV3oTUnXVwpo707EtTEUCckU2u2ThFKILBj1GqF
	EMs8tO7eM2o/PNcPMn4wdVOaj12o7xQAqAt7G3o6If9es9QxY5gW7rEVs0kKwslHlt24=
X-Gm-Gg: AYBFou1maIb21o+3vze/fXeEKO6TllV1j9HWqfKX4vouYV/EAC59/8W76eKSxh4sEHA
	xOJNZvNuA6GAf/rqVnECEdyf6Wp8YbpWdy1QhBxhs4lc1+7L4UyDHb7qp2skxnAWr+LS3o2Rzgo
	ugl2YEuw4vGeuAXyW2jkGZ4Mp/JstAMMrCnQLeqhOkGbjbByFTZ0hSKgFsqfmX51Hmfchw4LB8v
	YoPSSJsMq9fv4BoT1skvlUsfXKYcY3ZZEDQKL1Dbm8yz0ycY8u+eFI7SsXg/klQuH1RWixKHHH7
	T9cQ9loas8SDed+NG/dXrm+lTv0A4gndca8KZOZ64zOx3+F/h5TT2221MSJEDbJ8Cs8E3jc0Pdi
	lUu0yDZGQ2uHxZM2a8GyJI9TUDVBCtCg6AZ2mZ/7uSuMTTFuu0RZ+FI4OuDUn1TTyOaGftgeoQu
	vYrok=
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849386637.60.1794915520505;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
X-Received: by 2002:a05:6a20:d80d:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3f7a85c3a5bmr12849361637.60.1794915520037;
        Tue, 17 Nov 2026 03:38:40 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm5886985a12.8.2026.11.17.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:38:39 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, 26rote@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: glymur: Add mode-switch to the USB controllers
Date: Tue, 17 Nov 2026 17:08:34 +0530
Message-ID: <20261117113834.925310-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfXz0BptpYCflkD
 CicKRn8F+EZY3qj0hiOD5KcxexFRWI+mPq0d8OQqkJFQxS+YYiAwYrUO1leIKty/Ryy2uKONEwk
 SIkiOnWVj/bQ4s2lUK/XjAYy1aHd/lI=
X-Proofpoint-ORIG-GUID: TXzVDankhHrbkBxBvV7Vk8rW_BYvtFIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX3AjE8QEtw8HO
 l6VDpznbG8RiYLv7TfvkrlOOnhXcSilrGICQGg1vR6mTdsoteW1V0lJ0ucdTcTwkCiPCbzAIiL5
 AndDFj2TpZNEHhj9YovI8HLRAXeUOuNtd4dOqbK8IvfvmD/vEzQTx7i8y99XBbqZz4vt3GJ5cJw
 09adbimac3rbLTDMGCGpnc7o5T3NR+FyE3XQ2k4SqCWLBuoRA6h40/mmUwczCQJyqzweXNyS103
 GEJ3ekcXrUDlp2txyMmMARa09p5eHP4qZWAhWzhaSRB5xch8i/byP6LElCMcvMwpGHgxKc5Hzkr
 +gzu6zP2HfuE6BjGHKCOnBKTzPRMTSNbJt0H3PI1TQ+flDq1DiUK/O5TyVL88CbnmE8nWxo2X3d
 LTeud4N/uaaRIhLIsyUhDkxFEnDxHCApYGktzRT7/V5ypuuSUinGSix3yWvtgY8d4Az4P2P1BZF
 WHLLR4QmfX3rEfXTO5w==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc3cc1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-rp_c-N0KskbNC3IIIMA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: TXzVDankhHrbkBxBvV7Vk8rW_BYvtFIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Add mode-switch to the USB controllers as well, so that
they get the Type-C mode, move to the UTMI clock first and keep their
USB 2.0 ports working.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
Depends on Joonhoe Kim's dwc3 mode-switch series, which adds the
mode-switch binding and registers the controller as a Type-C mux in
dwc3-qcom. Without it, pmic_glink_altmode defers its probe
indefinitely:
https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

 arch/arm64/boot/dts/qcom/glymur.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..e9469bb7a832 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4998,6 +4998,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5088,6 +5089,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
@@ -5178,6 +5180,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0


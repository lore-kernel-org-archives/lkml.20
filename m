Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C249E14E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860105; cv=none; b=HKdvaF2G0W7NTUi8c5ZaWmlWSxwaGePiHEQB/YWsk7DczlP1O0XrHkPpIPO5aqXg+/mZW3TLiZtNFKvJy57qvIgTAuTTVz/lEdPzX52Ylxw01bSkGhWZumzxntCfUBNfnpUyX/MkOaXbhwE7wZoDPde1bQIUXZd5D/ZPsppBAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860105; c=relaxed/simple;
	bh=ITSshaCesLL9A/oJmGtCMcJUZxPz9xZuhttKLebAg48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I+qFUbQ0hpPcI6R/OifJAJUIbDpkiUDUYrc/JKiqTt6cmT0utAcVobGGarGqdHQKrZ6sUn4IsJ2mpDH0SBrViqJ3mpYZmfgQcM6Q8wUM8GGweXskINZeH4M6zQRTxzrR1P/KAqSFNTu3RxgBByRA2PVZXwFyqANfSh7ncmH1Drg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG2Nr8Mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhSH0gYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG2Nr8Mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhSH0gYK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNn11933065
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FuGN+Vgz5EAUSxZS4ALKIW
	lpxou3EH/JM3OuCR9DI9M=; b=AG2Nr8MhNbeFh2zr/46dZOL5fe3rESGmPnghoZ
	IRUXKP0JaWNlrh6Zeaf6foYxcjHcjqIG0unv1XjQK4QiUmlLsWW/AS8bsePCwl59
	wCdllQJAOMtaJ1eWP02dAbX8SnV6kPYFIFk5nVNesfEf8pjK6kXwSxxZRAWsVQ2I
	CoQOuzj06r8XTeYcvOk9ue5Qx2FRhVKJwfs2AHgVE5b862m7affLFgzYeFYbCUTZ
	ULP4Z3r7ncihwcA4z3RaFGmxfwMWiO7nFm4Ys2BzjhsuiawoNq4A0mdUfEjoPwrP
	hYI8st7D0k2XVpgcKS78SHQkmSUEOYJgW36ecpS1sXMYB68Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfsmr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:08:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86261e66700so4948751b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790860101; x=1791464901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuGN+Vgz5EAUSxZS4ALKIWlpxou3EH/JM3OuCR9DI9M=;
        b=RhSH0gYKFaXGXFGOKZEFX1CE41CUcvMYn9taYjqhJqOB+6spvuUUNShWAo0eJ9gf/2
         v84sYWtRz7i1p3FbZSQtopL/JKW1pVFnoWxQoVQpAraG5o82dzwFbMzGXdre+XQJGgV9
         Fo+3S/xBOW/W9pqCDmo2REUJshS9hrLJQTnzanCscijtxKxvPF6vt9qaiqpiAPyIJ83R
         t1E/K0fb473hi17Z7DhpvOCzmclJs9E2bR8ojowdQQkdry7++H6HgfXNVCAzwGmQqnyc
         4I00HqBij7l1pCvWAR+mJQqllGSRu3rqRxmAhJI73FmW4QBO0eARBSsqEMuYwkYfCZTo
         1ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860101; x=1791464901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuGN+Vgz5EAUSxZS4ALKIWlpxou3EH/JM3OuCR9DI9M=;
        b=wNkmLyinwV/lX3fu+1YEPLzbAAvjAY6Hfe5QoAhUSrO39dTCn6I1+M6pyyqDWi1YG6
         wwS6aXXtPiWqjilp/LnU6aeF92kpCzvukaPtDQzNNHYRzZd1i4kMV6H4Z3neBWBT5Bm2
         QKxcNOWysPqEog62wyjd6RjgY+bOCR0p7TdcZ+S1xEMWyS+h5zAVc3O1RGzzpcOfo/M3
         7i7T7X+xpj2RGtDNXeOvgv2eynAUFCcmveluV/jIIulzOwCPENz00IbctFA4tVIqv2nc
         Zv+WUiXI08oRIEu+q/M18bswBJc5NmvS6XDRJAisBWm5vDTuZYabZh9Sh5G8C3H+eTeB
         x3UA==
X-Forwarded-Encrypted: i=1; AKwUvBzmJ5vQJtHF98wfou83a4TUmYZipWKLeqbcKGMH8AQGg/801+477YdsAUDT2kJCgvW5F4NI4NKmRHyN4bQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUKWTVu1R0WdOoPmer/qKBpzXmJ9prrg3Hr8G4mcOo4BSFEcCd
	DM1IMPllE7w21QvpzjaVLIP625C5V2CtNOm8LkOc4CGcM0zLrDIctL7UOzN3JiwPf2DRyl4/LcX
	bH+dSeELJHXgLU8yRm7yb7cXu6bs/w2U0imNNhFzfmUuOtWnFbZKjbZgR2Lk6r/7MGZg=
X-Gm-Gg: AYBFou1vWk1Xp5gIB1giF2S0BTiiUi3MfVB1NBP9AMx1FyNlRLV+t+8DWSIh4MYof6t
	XALSvPl5LJ9/uHBEC1khwurJLsfqLK4aP8H1yqmWPO+RYKeo4l6rNVEI5QW6MOaoBxx0lrZmnGE
	twrMlzrOIbrvWKioUHWGi4aYvFIPfBkFxeDYJ8LlfnhIhOdsEh6eRiV6avaXtF6iGrBcRlJc+yj
	FXxKLt7BM9Vo1g8G6gKnMrLHLI4lmEDQLGxeW1wGyEzF1eaolxNXdcf4WB0C7DiPgDiPEZ1Tc3N
	0EvHK1GFipDv5U+Wm94kyXKx6L5auQizP+oBad62BQqe3iWH9vVsUR3EI599Ct70++AjQjp7AtM
	WvVmK9yRlvzdjKpypgg==
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a07d with SMTP id d2e1a72fcca58-8880adda0femr1863714b3a.29.1790860101039;
        Thu, 01 Oct 2026 06:08:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a07d with SMTP id d2e1a72fcca58-8880adda0femr1863690b3a.29.1790860100420;
        Thu, 01 Oct 2026 06:08:20 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888198cebafsm1037468b3a.52.2026.10.01.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:08:20 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:37:53 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAChbvmoC/yXMSw6CMBAA0KuQWTvJFBOIXsW46GeKY7BjWiASw
 t2punybt0HhLFzg2myQeZEimirMqQH/sGlglFANLbUdXQxh5mEe7aQZNUbUhIFHu+JLk/WKgc5
 9Fzy53hmoxztzlM/vv93/LrN7sp++Kez7AV6bFfeBAAAA
X-Change-ID: 20260910-regulator-off-on-delay-monaco-d0376dc0b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790860096; l=1883;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=ITSshaCesLL9A/oJmGtCMcJUZxPz9xZuhttKLebAg48=;
 b=8Gz8SbPEYErUal571ILel5P3NlX0KZjkSmjBzbIeuV8hZ5JubQfZs5EUm2yc2iavGeW0LTd9T
 hdbrBPC7q8AB8p74vD68tjlFY8oTaVH7JFl9YIW89ZmGG+CubVuxbmM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX6NyKfedYCeJ7
 Avr4zOhHL1awJhrcp6C7+H1PkUDw4ubsgAebFx35xH94Tunvbd5UKBb8PctBcPnBk0d0z+Ar6g/
 fpBZe4+GyJFjha9O+m8Qz7MgD7Uf6uk=
X-Proofpoint-GUID: 74ZKq-cCwhcPTy7g2H7RZiHqnPEGiBMJ
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe5b46 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xt4dusijb_yHOFS2GB8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 74ZKq-cCwhcPTy7g2H7RZiHqnPEGiBMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX0xEktaQAuC4B
 NuJKxfCwD/ZMtxM4buu99Tg5Lg1RdnfiWOK0NBkqB+TFDonZWFH9GDQl6H1zD90eTaDaAdpMlAg
 xM6BoRKZQGTmhKx3mmCFdmaYZOYQb2bCnqvn/GGmouvUTExDQ4YBRWoU0MKikfXS0RzE3GcQXpL
 GfMDAkMea4lBhMv7Q4X4/dy1W5orXZypmpZgnXhXpPitWaLpS/A8r/rskgw9xdoBT2sQXk08IxT
 14NcJ7GVXmu+i4keY0RWIRkxNr1kriAaDpjyPZ6D0dScLg4eW0/o+aOC9kTa/MC47r1HbaP5DRt
 xrldbOxMWHokA6LJW9NBDL8HzUBMX0H3TqgostEVQwZZ/OlSRlzOyjZ5DM97/06vYX5EQyqGeQl
 KE8CHFxz5VUDX7kN058t0ANnX1I621NCfI223kxGQ0FWUjxlmWETlf/A5s8U5A0NdPH4IlwWrBD
 9SEdd+zHjmT89slgGGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010052

UFS on the Monaco EVK can fail to initialize after probe deferral when
vreg_l8a is re-enabled before the supply has fully stabilized. This is
caused by the increased discharge and recharge time introduced by
additional board-level capacitance in the shared power supply design.

Add the hardware-required off-on-delay and enable-ramp-delay for
vreg_l8a to ensure proper power sequencing and reliable UFS
initialization across re-probe scenarios.

Additionally, set qcom,regulator-off-debounce-delay-us so that quick
disable/enable bounces across probe-defer retries don't power-cycle
the rail in hardware at all, rather than needing to wait out the full
off-on delay on every retry.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Depends on the regulator/binding series adding
qcom,regulator-off-debounce-delay-us support, posted at:
https://lore.kernel.org/all/20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..80f8e34d6ce0 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -240,6 +240,9 @@ vreg_l8a: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-off-on-delay-us = <10000>;
+			regulator-enable-ramp-delay = <10000>;
+			qcom,regulator-off-debounce-delay-us = <15000>;
 		};
 
 		vreg_l9a: ldo9 {

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260910-regulator-off-on-delay-monaco-d0376dc0b7b1

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


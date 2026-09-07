Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B614582E7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775680; cv=none; b=vCj5COUrq9aFGrzfbw5Pt7KcoZreXs3Rwa15k9GGB8QBCwpLn4gOUtM5HQQYdXGs4XuQ8yxlzwi2+wQlXIPGImVXW6071VC20pjg4idcOk6oRGjDR/tTPcYQhRDFYQL8kDZeyxsdPltQ1e9EByOXdbIYnE+tteynz3G1c2RZoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775680; c=relaxed/simple;
	bh=ED/CiQaDnuIxltwLFiZ2V5Iyv6pQX6q2vdep3Y0gx5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oHieHYggkKTYEPyuo53eQQQ2F9CF3Gc+2aQdD6+DS7ROtv25iGqde0qpvb7shiwA8wABgayztPOm379PmHqN5R+4uPlElO16WeI/R0vs712XvQYIcsoqtSzSE53e90MtPwFo5uJfD4MTlw0h4+sIeiBah4fToyqlU/q1M7fMCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYblqDQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SF8Q7qzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYblqDQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SF8Q7qzM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bNHl648712
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q5vYoXwna2Xtnz+6OFS0aG
	A7QRjoJeAtRfwx8K7EOfg=; b=ZYblqDQ1fvMq8ip6Kp02oC2rasq2cXotd2bbzU
	32TuXvTh57OfGw8/xp/heW/tUFWEYV9oSBbMWAcsEYlQMcBkLQz5gfPHGwXeCKpC
	7vBtv31wbs2hzfMVJu8DDiwWs2yBytFcpVbcAa5tyHChjwwcM3uO3Qc15DEZrvB6
	SahiOVrknsDx62gfKVNcCGUIDO3Ifm77lFLzRVLDvnqUIa1RonqzXaiFLkLmxK2j
	VBV4E8ZHVCDkVEI/UhM5h5H1t7iN3crQHAMOn2lTczztfme+xKS+XbrHBrpy+z/F
	W0aTHdJ4SXnnjcNoj5EZPsHZxTxYULtKRfnNniziM4pXOtow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8urj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:07:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4100624a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775677; x=1789380477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q5vYoXwna2Xtnz+6OFS0aGA7QRjoJeAtRfwx8K7EOfg=;
        b=SF8Q7qzML9dl+6M3h13rB6JWutWgtcHT0s2xDdxOLdYPVxljM3nbZOL7HWDSzHvSOW
         rsD0usM6SRKMzP30fcmbp3fANsUc6o8hA8bYKpvf0MvNVPhADKOj0KgW8g3TbpwTq7ya
         soQf7CIUgq0HuzuomICeZum+tA4cb9nVHeg9U81fBfKvu1vovUDG0Emc+rC7xDn9J9H1
         yIkgAH8DSN+e9PUwcyszLmCW0sw+0HhDE4Y5XIsrqCDKGPn/QASArVCpLsXnagXWWW0n
         byDvG6BaPwVHxpTezooj3q9DYDhFf+8H37FhRpgylfPKWWIa8/UsQ2+ZB0tBglJEyGX3
         zcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775677; x=1789380477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q5vYoXwna2Xtnz+6OFS0aGA7QRjoJeAtRfwx8K7EOfg=;
        b=Xkzrjv030jC6gridzofMaaQRx61rZ09BXnLJ3mSosdW50kM2xY0Lxiskf6CYTj81Jc
         rn/QTrQhE4aLI7/GTbxAwbGL2O3xsiVGrE6QKiXY0DuYxfzfN0Cv9FshWYLVUwpWcsOP
         Jy7/yiWsMCi/DwPsY5Od/Wv3HQmBftYAUVxc2fVpAKb3IE60urC+FjWVSGD80M0sKY4b
         kOKYQE0AFP2uLWiYtBuBz8214wr0ojUkqxJZqM3zxowGKOD+j930l27uMbdnizS1cQju
         tiRrjU7vJJZRBtsl+DrtCjHFe8IoCGfa2jwHVAUGvR1KCNb/FG/2bjcQDzmTA+0JMwYT
         +D4g==
X-Forwarded-Encrypted: i=1; AKwUvBxb48MOoG21HfXEf8f6ZONsLaWkSQiLO22iF6Gb6u49zh9DplP0sPO2vLSXJGT84q4Q8ebGNKcn2izENBo=@vger.kernel.org
X-Gm-Message-State: AFuF++nZgjcW7iijwT0ng3M8Hl3GJU51wDdCN9LWis/wIwF6Pe2aIoaD
	HSUBu5oPSXtcKBywYhaOPsjJoVtDkEOq7cuj1zZ4yxw2NbQSloP0rjIPvMNEfVEXZPnTDysJfkW
	RcoQU352+t2FpP+bPIA8cS1U5X49PESggNqchdNIX8+JHeXNfnMHUAVSaYtP2mk+M6Lc=
X-Gm-Gg: AYBFou0LcVqh8Im6O7z/BQABOKjWdO4M+767gavqp49sx7ZUx5PQtpHY0g+mYh3Qwmi
	B6RO2B++Kx+mGtuqYJT/D9MQ2X/5MBz8ERd2V+i5+UW1u4KSi6tybqAyTbOJvwwR6IqvGMpJrl+
	EPkJ8iCYE9c3blqxmYLElgKACNCSkVl6sp3KmzJ0LAE3SJPCva5MQEszTbXP5RxSVWu0L77Tzwy
	+aiSg/ysQ47Tsp37DW7irGHfQ/RWiZuQd/X3AtHlDfAsRcz1sv8FtVu2ggLivoD65sl2dfMpjaO
	ZQG25o56Q6AG44o6hBEqiPjN7lsnL1BEqDD9rD/eqp1xZWLPdruYk0dzdH7+ibwphKfIyPQOMLn
	QZcFl7ieRkAHHDMdtPYi/vmwAe7kLI0g=
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr34849120a91.0.1788775676827;
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr34849051a91.0.1788775676384;
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:07:56 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/6] Add CCI and CAMSS support for Glymur
Date: Mon, 07 Sep 2026 15:37:43 +0530
Message-Id: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+MnmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNz3fScytzSovjkxNzi4viUkmJdcyNDA1OjZAMLEwszJaC2gqLUtMw
 KsJHRsRB+UWphKdDkEqhgbS0Ap8yyPXcAAAA=
X-Change-ID: 20260907-glymur_camss_dts-721052c08486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2327;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ED/CiQaDnuIxltwLFiZ2V5Iyv6pQX6q2vdep3Y0gx5Q=;
 b=a1h2zv9isKpVtJmklFLCU6Z1VmLt/f7spBslU+YpAVv2v9g427DbtMegTcywfwNHqK1AsNX4L
 TEw6rulaokYCLPn1R3is19H7GCZkqn76MP7pDvKS96yGlH1MpV2GDFS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: eGRVJDduZ7A2SmbtaYp5wOwpGhxPJsgF
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e8cfd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R5umFiV8t45MmT4L2-QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: eGRVJDduZ7A2SmbtaYp5wOwpGhxPJsgF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX1+BPIsX9uFhj
 3vHjBbq0ukQAtoiwcBqIcTq8C1yBfWIbd8Fy8P7bV3YnHO8ZN/sVm8brr5UqPBf/eL4iXWYQ31N
 ruIRNitvKsV7qLVFp00PgaXOMLJQd5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX9lTsMIuHLWr6
 U959OJmYvMh4wduew+NkZnrve1hX8MRbDNbm3NwBwP/szkeHPzMbcfQa/b2OG5ei238J5dtUsYH
 WOmN1ks8KL09X43oCI9pZVyhw79f94ySmSPJj7Aea6Q2ShnBEtfGofxij/wBvcuSMeTG7ztAu7M
 E/Rswr4ZA8E6OBYGxYC8FVTVfbULrbSzL3VGAn9YPmlPLstvTjanxPZ7I61BUrA7PfDIJnWvfBs
 z7z3m8tYG9i+LL/V7zubNYCF51vMLV7RSabZUYDIlTfnVuRyRplfCImyedOf+xYsVotmKYC3WHx
 kPKxsTEEjulcCNwk0s9AfmPLWWMcjW0z8ox1fwp81gkcoRLUab4tZsO65eAvLLtY6VYu2my3iC0
 NFa7hzIDUKbNDYwqtCDWM97s6GMfnMMXiuQFbJuP1TLtjnbw+rq574A+M27cpMMBsnK+liQFH82
 BbwGoqV5FyAUCVRsH2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070110

This series adds the camera device tree support for the Qualcomm
Glymur SoC and enables it on the Glymur CRD board, which adds CCI
support and enables the OV08X40 sensor via CSIPHY4.

This series has been tested using the following commands with OV08X40 sensor.
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"ov08x40 6-0036":0[fmt:SGRBG10_1X10/3856x2416 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy4":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -l '"msm_csiphy4":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video0

Depends-on: https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com
---
Internally reviewed by Konrad Dybcio:
1. [patch 1] Remove stray blank line above CAMSS node; keep blank line
   between last property and first subnode
2. [patch 2] Use preferred phandle list format for CCI: foo = <&bar>, <&xyz>
3. [patch 4] Replace qcom,pm8008 with correct qcom,pm8010-i2c compatible;
4. [patch 5] Move csiphy4 port@0 endpoint to SoC DTSI; reference by
   label in board DTSI
5. [patch 5] Reference camss_csiphy4_ep by label instead of redefining inline.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Jishnu Prakash (1):
      arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

Nihal Kumar Gupta (5):
      arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes for Glymur
      arm64: dts: qcom: glymur: Add CCI definitions for Glymur
      arm64: dts: qcom: glymur: Add camera MCLK pinctrl
      arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: defconfig: Enable OV08X40 camera sensor driver

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 133 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 560 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig             |   1 +
 3 files changed, 694 insertions(+)
---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-glymur_camss_dts-721052c08486

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


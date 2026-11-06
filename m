Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956871;
	b=UFMZjit7HHRleDwu34mgXhMZ+YLT3xByJBEWxydiDZyob/L0ugkr9DbXXRDuUGsNZQIW
	 rSsDFKXl3WYku6gp9lJOAv2Xw5x059qnmUKkrSAMA3xRHH1ECLpOHE+mKKAtcWofsAZCH
	 +MbiiOwZwc1uSNExmMoos6vNU5zl4uML4iMWSMLSpm1rznHArbbtRz3Y+N1q1jgfh2Usp
	 UW0FfV4F19mJ1SrZKSrP9/xud2/ycEvyKysucG4H49rmumdaKbgDKYSMTDzevdTLAVebN
	 x11T3BanVW6FHmFLh9lXANihzNoLEMmwrprosoyCy5Jq0vq6wE0OaY0Q4o+plbM2yAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
	b=KRx4Rgegm+D56Zglr49+G3LBLJn46YpfKVmy/fUBGP4QFJRaCn2ZILcaix7BIzbehaPA
	 Ea/G0TQBvKGlnSWa83naiE92QpX0Vw4M5Mr/VgSxBYwP8iqgWXqWKiplaMKzcHcCbA+BD
	 z5SvTNvw8o0dNALJQoBJ/RJ3FGhIBopPC+qqBW2Id8Sws8r1DFAGImPxoAh/qqbOgYZ1K
	 /dI45HE0KGBUyjPUYWgGrM53NikXXa6tBTJZpIDL97s4Jb51UkXBGIeoJNGWYcuqdHJal
	 3KU3LPI8Ypio1rhCF/kIi2PLVPc4d1RldDsypRSJ+HfB58ISMLAcMgt4WiBvsJFyB9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIJo5AEt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJKcbclh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E2606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B92E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIJo5AEt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJKcbclh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R6ev3243858
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5hQnecWNJmeaMurl3qe1G9
	byYeEYjJwb9QtLiWxSMlI=; b=GIJo5AEtOljS2m1KHnlY0NzLnOIAG8ee3YxeGc
	jIzZb6X+rXZRHs9TWalzxNUC9RGP+VvC1l5g+OXLnFlcjlZaCL8Y/8Ir9SkF3lSu
	MxcdOyak/xSAD3xQp9ztfmQnuaCv2vNxvLekwvD6Y/hl0e5ee9d4E1gsGn6YetXE
	xBM89pT5LSuAvdm1ykfqN4HIPWFY+O7raXI/Hltb9bhQutwdAPyVlhvUT11nyZdo
	wIpVKMYu6JNYV9wZ0A6JF08rzV0NNm3XowvMNpt0gMbWdvk9t452ffeSmylnhakE
	csMqVWsEtUmwaFJngq7rjtdI2QGNAa7+EKOwXeipVjBRKgKg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa21wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso642665eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956869; x=1794561669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
        b=HJKcbclhg721kThs3iUKHc6TWodx2VfZDGVaHS33ezkGC3gYIK3KLDy2lm86gO0IE7
         WB+vG06GvQcKezQkhirCvBGV2IYu7Bm8AOSHl5Yg32Kj/xLzEFVKobsbSvS6w76GAVPO
         EBskofq1PmyUx31Koe2P2D3kZkpsLgI0m1jGVQF0zQudVFHrnqkKtScjNg3cPhACiQHu
         mtnzV58x8HpQzVSlIma6ldo3R56YInOj6vBGQ8EhO7sUXPcUULYKB52LJo67KfTg+CyD
         O1Z6tuQWcKRh7d6XZs3RjNl2gO9VCeB+slzvWxEnBD5jKzdogpDEJToSm4Lk42xU8agm
         Yl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956869; x=1794561669;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hQnecWNJmeaMurl3qe1G9byYeEYjJwb9QtLiWxSMlI=;
        b=HcDpID2k8Pn8vWPWFHwrgJbZXwwQ5Tjeu3faus9iY4rZbks/gXZwlj3ESnHh4l1Y8v
         +e8VL4dx9ds5JvbPDu7+8HwamD839Gu2Y5A9NGrMJJmS1ua7bnYmLnMAyAVUFLsuOWuL
         VEOIzqrwwAbpH553BC24EnfrU7mvTDUomefhvFVhqLwGcfgQrDgleVqLe1bzsDGBj9vM
         QNfxmZC3jfWK4TK4Uzxi8Bum8jNnMoXOgmZ/PkE4jbyad3aStBmZutpGVwbUtBpEZ0IN
         WA1HW4Fj+an9uG5z4dBy8r4BiF2yuqH1bCtV5DBj/SCpUVdCrFeyJEa6WcSPLYebrEld
         RlCQ==
X-Forwarded-Encrypted: i=1; AL+hErFh+tqmvkX591law9KGDzu0tBJnYfcZdCBOLfFmgASBu+x/KZX/TABMBo5BJl5+jzEF5P0FdxvHrT3P4XA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GtlJapiZh5Pw1ypUphGN96GniwGwBlM/DNCzmA+hU3d3mUM4s
	nUF9WsfPmET7/tStpjGTIqk6URKrVbpY0fro+ITnVqazl0EQCMbXHggYK5FIQzgLYoUJUQk3I7s
	QHrDUYsxwRT3LZzt7CENYrgViACZE2X7G7oHXC7qvQT2YS89+USdPBTTM76dltgqbNzo=
X-Gm-Gg: AYBFou046NfcSEDxIK80JBmCKaGDCuVmjwNThBwOsLGWfIlC39lUBbT5gObnkp+1Im2
	Ws2gzuit08U7dLL9PpuEqp92NQFc7XaVXtukZUdo0mpBTF42GcGq+1WOk2sCKHSqRWdh/cfkUPl
	TGc64ErWQ1iHpqZdUgF4DDlT2oN3gXPCtGQRcXXdVPoZysaDn/eNKFXnLAa/T+05Q6h1IL0NKE/
	4KBqzRVBSXvhElGX5njl6xe0Bu4xFcsteFw2Z2LLfaQJ0fPCEpAooJhx8msiR0mmWMUsG9tFc2C
	kQOhNuwoJdLo/zcbWlF7cMtAKcP5WV7kmK1ueA7H7oAuyBAG393Ig8MpfYHczP3CH4S3mDBOPmW
	tAIT97oydQ9zPPvXly6CADXltSqmuPAzh8p3BZkA4wCS5wgm+2yhQgALrkfux2+vURARkEKHPi1
	3V/9ezrmZCa6Q1nb+UVlSQ9NJKYl7I5K7rko4dpRLdNDhcNxW+Q4p/0d3xDCfkVK3CsBckr/MSD
	DPcnQ==
X-Received: by 2002:a05:7301:1509:b0:368:9553:f2da with SMTP id 5a478bee46e88-36f76b12203mr2418990eec.31.1793956869044;
        Fri, 06 Nov 2026 01:21:09 -0800 (PST)
X-Received: by 2002:a05:7301:1509:b0:368:9553:f2da with SMTP id 5a478bee46e88-36f76b12203mr2418938eec.31.1793956868257;
        Fri, 06 Nov 2026 01:21:08 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:07 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v8 00/11] Enable mutliple peripherals in IPQ5210
Date: Fri, 06 Nov 2026 14:50:49 +0530
Message-Id: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPGb7WoC/42R226jMBBAfyXieQfNGN+Iqqr/Ue2Db7TeNNBiy
 jap8u9r6JYiNUh9ADw253gu70UKfQyp2O/eiz6MMcWuzYH+tSvco2kfAkSf44Ihk6hQAmrwQ4K
 gK7SWKaeYLfLPz31o4tssuv/9Effh5TX7ho/NwpoUwHXHYxz2uza8DTA5iVBM/DGkZObb9rub+
 QCpgugcjAwQqJaWUR2YcHTXpVS+vJqnSVbm1+1VAUoSqAUjXRJnVHEFBKPpjc/PH9OWbf6eTGv
 aHwoJc+19+wAjZZPSQmg02nLd/FSQa6Wa58xKpVjFJTA49OdTOg9dUx6681P3Nx3iFdvU0ceYh
 q4/zZMaaW7p/6Goz6HkxBAaFzQLxJ0n/001m0a2okks9NRoixKt1AGZkBt0taJZtdB5Bah4sFR
 RU2m2QfM1zRc6r0CKIMlQHlyDG7T4outV3bkGEJoHYaxAy7doudDzLD9pOXWtdjw4LSX3eoNWK
 5rYQucsQCnrKy+11+La3ZfL5R+hAKKoaQMAAA==
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c05 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OAVUEJiqWiMpwp8HbvkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX+CqZ1SAkS4YO
 9tQ1+wPasQHzUZFIj8XFgQ9jpmLpK1bG0D0ksZp6Q0+9mOOEFHYd/z+D3reba/fXCyN1iSTEyA2
 HkhprBNBwv1MZyOwiDxLIG+KZhVehnk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX+kELGeR8UiKz
 NBhMMFcq1siYFNCYya+JiDKWSQnt3PcHmAV0LQ6aTy7bhgAu0NoEBqtRKd4n1SP62rhCUTdHL1k
 xSfop6JQjSn8W0/nY2kxZRk3Jy44wzW6DQJyoESOmipDMGb4FxWQV1BifJc2pgIJqoLD3AswhKC
 DNIKnrVxEAGd3bPM+5t1EclnLrbj341TbYTPMfk50acfG+160MbFtyZYp0akbc+rp5slAhRgmLj
 ijj+IIcQm3b1qjz+ca0xc0lrH3MCkIwpYrijkoD+gAU7ftIm4iwVMESX3Ok1Ltg+19J3r2El+U5
 7SOMdKwY8n4CvKgr4WuATADte5eiZL2IRG839pe4yDAPuyl1Uv5/FqgsgrgVW7uMeQqsJy1v+qi
 MOfjYaNwpOtCpYRUVtXUP3JwbopIyzWmM+S2M4tPZlKDNCaPG2u9pzk4Nfjn4erW5cwmvZHwbSa
 uWR3Q71mvVNQbnmsf3g==
X-Proofpoint-GUID: a9Qq6EH7U7KUNUAZmVn_6c5irzj_iibu
X-Proofpoint-ORIG-GUID: a9Qq6EH7U7KUNUAZmVn_6c5irzj_iibu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v8:
- Fix pcie0 & pcie1 nodes' ranges property
- s/wps/WPS/
- s/cpu-sleep-c3/cpu-sleep-0/
- Moved ICE out from sdhci to a separate node
- Keep pwm@1941010 enabled
- Combine i2c pin defines into one node
- Add opp tables fro spi and i2c
- Pick R-b
- Link to v7: https://lore.kernel.org/r/20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com

Changes in v7:
- In 'Add nodes for multiple peripherals' patch (it has R-B Konrad)
	* Reduce critical temperature by about five degrees per recent
	  calibration updates
	* Fix placement of 'efuse@a4000' node
- Move 'spi-{rx,tx}-bus-width = 4' to rdp504-common.dtsi instead of
  rdp504-nand.dts
- Change 'reg' details in spi@1a80000 from 32 to 64 bit
- Add #address-cells = <1>; and #size-cells = <0>; to spi0 & spi1 nodes
- Fix incorrect placement of rng@4c3000 node
- Link to v6: https://lore.kernel.org/r/20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com

Changes in v6:
- Didn't touch the existing patch as it has R-b
- Add DT changes to enable more devices. Not sure if these can be squashed
  into a single patch. Please let me know, will squash if that is
  preferrable. Following were added
	Random number generator
	SPI node definitions
	I2C definitions
	PWM block
	Download mode support
	ICE support for sdhci
	C3 CPU idle state
	Support for WPS button
- New compatibles used are documented in
	https://lore.kernel.org/linux-arm-msm/20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com/
	https://lore.kernel.org/linux-arm-msm/20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com/
- Link to v5: https://lore.kernel.org/r/20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com

Changes in v5:
- Pick one R-b Konrad
- Do not remove ipq5210-rdp504.dtb from arch/arm64/boot/dts/qcom/Makefile
  and add it in a subsequent patch. Instead, move the ipq5210-rdp504.dts
  nodes to ipq5210-rdp504.dtb-common.dtsi and include common dtsi in rdp504
  dts file and introduce rdp504-nand dts in the 3rd patch
- No code changes
- Link to v4: https://lore.kernel.org/r/20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com

Changes in v4:
- Fix following sashiko comments
	- Add #include <dt-bindings/thermal/thermal.h> to dtsi file for
	  THERMAL_NO_LIMIT definition
	- Change tsens interrupt from edge to level
	- Remove ipq5210-rdp504.dtb from Makefile in the second patch to
	  avoid build break and add it back in the 3rd patch
- Dependency related sashiko comments ignored as they are addressed in the
  prerequisite patch information
- Link to v3: https://lore.kernel.org/r/20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com

Changes in v3:
- Address v2 comments
	- Introduce RDP504 common dtsi and two board specific dts files one
	  for NAND and one for eMMC
	- Move 'dr_mode' to board file instead of SoC file
	- Dropped 'polling-delay-passive = 0' and 'polling-delay = 0'
	- Use THERMAL_NO_LIMIT in 'cooling-device'
	- '\n' before status = okay
- Removed 'num-lanes' from pcie0 & pcie1 nodes
- Link to v2: https://lore.kernel.org/r/20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com

Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (11):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Introduce RDP504 common DT file
      arm64: dts: qcom: ipq5210: Introduce RDP504 NAND variant DT file
      arm64: dts: qcom: ipq5210: Add support for WPS button
      arm64: dts: qcom: ipq5210: Add C3 CPU idle state
      arm64: dts: qcom: ipq5210: Add ICE support to SDHCI
      arm64: dts: qcom: ipq5210: Enable download mode support
      arm64: dts: qcom: ipq5210: Enable the PWM block
      arm64: dts: qcom: ipq5210: Add I2C nodes
      arm64: dts: qcom: ipq5210: Add SPI node definitions
      arm64: dts: qcom: ipq5210: Add random number generator node

 arch/arm64/boot/dts/qcom/Makefile                  |   2 +-
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 256 +++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  64 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 749 ++++++++++++++++++++-
 5 files changed, 1020 insertions(+), 68 deletions(-)
---
base-commit: cae1456a7b596c7d21d86fc17216e6996f26da3d
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20261008-rng-v1-1-785580a8b48f@oss.qualcomm.com>
prerequisite-patch-id: 08aa18faecd4f3588cfd01f3330eadb1a76dcd13
prerequisite-message-id: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 72e661bc72d8535e1dabc144e81978bc5161c3f5

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


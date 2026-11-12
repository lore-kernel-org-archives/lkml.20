Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458191;
	b=shqCNOT0p2YfotsQRnnMhSqm/JiUVfu6w6qriUpQFCrKInRfSZDjacQWU9aZz0Agno9r
	 Psh79uJ+8XjY0uHmQzgS+9et18PnbN9BzHuJAcilRbiPYqOS9k3KGQTiY0ZysYZqUoeU3
	 A0V1N0k6ekCR55QBb0UN7KVRN2/rRa43WfRkyrSNSdXheQ+ck8+WCiUY5FM34XdHMTKxe
	 alcJOzQuPo/bOkNsenL8cD9hvATuKbc+hKwGbAwlTWoeaJ6jsSHU1+44g4lwB7nXKhew3
	 M2Dp8x0HzWrueTxmcgYiUISl/7bcqslPyxzsWJszFiDP14Ug4PBY5v3V6a9EBAa70KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
	b=bAd6dGda7Gu+F4n9v4T5xjwxAGOHDIyuTo8VqFlE4L7Mk9LyS7TN/BQWOq94diM/MLSk
	 MyNjE/5AK32wYVhcrpErzblUsnoA9C3vuNN1XaeKoSoHh9fgL+RkRnCbRGrF6mmaOgxlJ
	 xjPykt3QsP7qJcZhRcUk1tBGZ9dwj1ikx/V4j/FgtKEmlICLbUM1+mPxXfuyTW5e0Rg9W
	 D12o2+EHwqjbdLGfrCBn7cv4Yo87U16LJacSUrvhn049sfwINejVKzi20AyXkfeak9RbM
	 r9FGpqRxrrqSbHZLroRMwCVHm5eyICS8WvoysjDqUGCxZd71aU2gJ8SZWYuNyI8ZKww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A458606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A458606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ns+d5HWL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P74aSqQc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zd5F3061536
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lyC5qj4Ry53YUg++hgJJ/B
	hVmj+JSw6oRJbx5/GvGnQ=; b=ns+d5HWLXtp1kuxb4QbwAYmVXKAzLeXlKBB2Cd
	b49/K3RSx2v2/RodiYVAfrXSS5fXrncu+KnUNVpy94fsKw9UGqyWD2qrbYXWueXX
	u/5ImCYAXWZe70Izjd+LpOSpvpjdhL9FZCBsmqF7HplxtL1jWJpVMqLjcdwch4a9
	wX0x8MpkU9wFhkJmxM2tY2vETOWVSTlxF2jceZoM2cgN5fEGXuoYDk1s6ED5tfaI
	aqdCKSuKPSQD7CP1xAtxOgl4nU43yMpcgIs1oo/DuV8ttoYq5RpT5P6W9YauplAB
	st851Be2ck+T8YyCBNx16VlH05XBqcrYEux1NDONIwvPyB2Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m393u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so327077eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458188; x=1795062988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=P74aSqQcJcrIy/etpHrTn1Pez41gErW7sTU/PjXFz/GUIS9WIKgY/UW7ezvge32nwi
         O4Hxz1SkSP5fjYQsnEWNyVFMQMwepDl7hfDvi0teSmeRiovSB2wtCm8AOEFJSEYvf0rH
         uxBIRXRD/0F3ZtssWtknzwjibEGz9pbl9Zf9hCB1bACU9T9fDzlNDOgR+VKm/RUnztX4
         vIdqLzxvOhhtPEexadRTDWo1CKEiddZ/GCsEdV/uDGiwlYVP9Xnc/k2rMNydGZJ8JuUI
         lNYWToZFoi+mQV5vg8LO+APmKeFl0lAEe4meMds/ax2IrNMkk3wGtABsuzUQM7VeyKgc
         kaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458188; x=1795062988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lyC5qj4Ry53YUg++hgJJ/BhVmj+JSw6oRJbx5/GvGnQ=;
        b=ruugF9Tr6tY+5zauVFX0tVoYd3LZujLcFL4VT8i06bAws4RjiWw0PWSkQmx33X3TUx
         SlERxyHG8t3n2n69J+mYiDjoDOv0SD79Fktlhte9i5OStzc0HkUV8y1S/rnlQ2DZs+fn
         NXe2fiSNFRnrOMMSNFC7qim7shBvkLDbJkpbe1ig5kpKXIKcUfeLPsPC8Pz6zXO3dHeI
         cgWUd/tj4C6lVJOp96P59WARXlrqWDwafY0ufdKlhGNr0Iz58QcPlaJnVo3krBf97ypj
         owvyyBPooHfNIzksIPEFD6gODAp7S/0jbvYkBzjZdW3JlhxnzeF0zO3TX5uHuQx9mtY4
         ctKg==
X-Forwarded-Encrypted: i=1; AL+hErEPewdhvPGLAfqv0gyVNsnhW7CywufZLYixjjXFpZpg9BBGKS3m1e7yAWGBaJYq0+H6Cg/WtdwarefVSbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Op7ES7iRjHkmHl1/ecX5SKOSO6bfyeH6LgmspujDiQwhwzQvu
	vZ9cLbI9vF6MWoIiL+qfmEzG4EDBDqmA8KVV47H0cuhQveUX2sMECtho+MmburtInEU3Ddh59mD
	752vkC++hldpHOEE4GFBwdZom4S3t3b//7+NOY/ESVOEwqc8c3Hmakvn4ANxBrebq924=
X-Gm-Gg: AYBFou1KY/wfY3rnGDy8bIXF34MykVCnrq4Y97/jPs2KcMFp498qeENrXxr26zWE2j9
	fC9fIsGJxYyNcQ4sosFNi91uPZUYFJdxcCOt6s+sFSc5CIs1+uSPFmXOMFLzd+Q9fSZ4pdMwm9m
	MbZ7dUiAMeSAJN5KLsJBD4pfwR+uFDoQsQKb4dSOpEe7kRb8WNLBrjl07JTvaOWPXgvfYvrtuex
	ReihiVgXMann0btM7ZzZmhICu02s9pOVF8m51TFL6nOkxZJkUMRSsqjye5VsbxWfEfsXboRrDmF
	QRmF20y2OVlVoUK7LkD8JH9VEFlZ4TvCjggjzSiv4zoTFrQAANtngWAFHjI2nC4H1uuZ5O9UnQE
	W2HYqTh7YIDHCzydNEXlbaz7tathUQDb3DlWTQmKKSwyUG5AK1BFhPkp7MlNntNVUZe5t5lgoIZ
	vqFwYcf+zEpIG28uechPd8QQxan6mnsysZ9I3PWNp/cUnx8VPOFb7mN79GxnofiUoNM9dnxDgAK
	CuppkE=
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291788eec.3.1794458187953;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
X-Received: by 2002:a05:7301:dd81:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-377deaeab9dmr1291758eec.3.1794458187208;
        Wed, 11 Nov 2026 20:36:27 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:26 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 00/11] Enable mutliple peripherals in IPQ5210
Date: Thu, 12 Nov 2026 10:06:19 +0530
Message-Id: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAENC9WoC/42T226bQBCGX8XiuoNm9oxVVX2PKBd7IqGOoWEJj
 R353buQBiPVSL4AdoHv25n94aNIsW9iKva7j6KPY5Oars2T6tuu8M+2fYrQhDwvGDKFGhWggTA
 kiIajc0x7zVyRX/7dx7p5n0UPj5/zPr6+Zd/webNwNkXw3fHYDPtdG98HmJxEhBN/jCnZebX97
 vv8AIlD4z2MDBCoUo5RFZn09LNLqXx9sy+TrMynHzcFqEiikYxMSYIRFxoIRtvbkI9fti3bfD3
 Z1rZ3Cglz7337BCNlkzZSGrTGCVPfKyCUVIlcWak140IBg0N/PqXz0NXloTu/dH/Sobm7HEZ5g
 +K0QQQ81NbUXHAf3Q3BFMlzk4auP81RjzRn8i9V/ZVq7gyh9tGwSMIHCv+pZtPIVjTJhZ6Scqj
 QKRORSbVB8xXN+ELnEaAW0RGnmhu2QYs1LRY6j0DJqMhSTr7GDVpe6WrVd+4BpBFRWifRiS1aL
 fT8MXzRatq1yovojVIimA1ar2hiC52rAK1d4EGZYOTW2uZK0/U/HHMVECoSSJWUyKsb9OVy+Qu
 AkZhK6AMAAA==
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
X-Proofpoint-ORIG-GUID: PtAvHLonkli9lEsA1k_5OLAuvnCZH2Qb
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af5424d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RaWcFzTeoJQvQ5yBV20A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: PtAvHLonkli9lEsA1k_5OLAuvnCZH2Qb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX9mh3LKRz4gqO
 j32tuGuYQC7HSPwVtNt/gbR55S+wwlppKVK5hAZaGOT/i8srEZkmdJCYcM6eOAIPO1k1bPRuY2P
 +EtBVyFz7pDMZcz46DRvytd1OpWnBfJ0H4+yxHS4PgwprtCBC2UJNb0/lz2Zn4vUv/jqo/FvUgm
 p+pzSzaxjNQFD4ntFG47EpE1jsxFWUqcOyuv0tul6doE606bwODnGvdOmc8ciGCL+WinvyLHAu5
 MeUUzMwLrAz1/MprlmxxhvyHSDL7xWroK7LbN8t9YaRgIZdh4xQVFPa3K+785nmOrjckt/BnCcG
 i619uf+Bi1ptIdF7LWI+tiGqZBZpqCrXgTjsng3oSmTxztZZaxG1Wz+n3zHqpTzEDD4W2ea6e38
 /HjAqGHMX1R6UCjC29Ln7Ca3QIGceKnS53W91fkAJ+3dP98wR07pCzWI98nRwvXFe6So5H4kOAw
 Xjz5fceUZ/1RE4FHYgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX425ma3L+rZy+
 G3cUId2ZhAEKjGAy5WRat9Q8ghfQPmNL88Pp/nbXEfKUH2KarE0sE19PuuuLzO6VFvgHpQ08z4t
 89cGePycUrjFBNyH5XVz/EOKockI9Zc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

This set of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v9:
- Rebase to next-20261110 and include merged changes from [1]
- Add qcom,ice = <&sdhc_ice>; to mmc@7804000 node
- Add qcom,ipq5210-inline-crypto-engine change to dependencies to avoid
  dtb validation failure from sashiko
- Link to v8: https://lore.kernel.org/r/20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com
  1 - https://lore.kernel.org/all/20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com/

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
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 276 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts   |  17 +
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  77 +--
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 752 ++++++++++++++++++++-
 5 files changed, 1043 insertions(+), 81 deletions(-)
---
base-commit: 827b0a511f329ad072f0f689407b3595a104cdf1
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
prerequisite-message-id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
prerequisite-patch-id: e6cdcf2043620e898c6dc3a5c266678a2b08137b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


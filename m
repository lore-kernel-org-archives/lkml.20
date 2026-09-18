Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813D5187F8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749808; cv=none; b=Yhg4GFKhr2P7/F6tpGt5QyZZeYFtwAPQgEdPU753SVrzcpv04eMQopRZ47mcsp8K25vIX7dm0o0btcdCeW/whEp9sUn0XxxFJUH5ByG4c0e9iFqntyFvUpjCAuEpvS1+uDsLGCXmW2qwQsMkvYpB9VyLZ+aSQ6GVMnXlmQ+b30s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749808; c=relaxed/simple;
	bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5lpaHD6yNCMIEHButFe2ZKBgR22g2a7qLy/mI+FovNp0vmxMfK1bEHscyJEqCTbst9oVsbK7Gpvhrojj8DyXOpYo8polhBbkO+PfIRtq8/8bMxQWK+4Oqy0Vvq1/yWW9isLxOA+vQhpwWtOILb+AwMjTIYem7JCVCDQ5UrsZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCqrl8Wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfOfIV6H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCqrl8Wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfOfIV6H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IF0XN61234167
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oA6mPBcLFH3SC1iZeQ71t0
	LSRYXqkDAN0OfRuXOGK2M=; b=gCqrl8WnlWeTApwrn8UvaGb2scDlmek50jvOtQ
	tmtkcUFRMu5DV8wOPb5CGREe0CLNtkth7AKAjkBONAkeLuOZMbYtb/W8XZ33smgT
	su/Jed6i0W1UvEBhCrkzbF5cTInqpQips5iVodenwkeyt6modgqavZj47/OR87so
	0l15fF434lPYtHdv7r5Oa8WF0KmvSznQUNpMjgVUTWQpaUPldlWRUp9qHOoozrxd
	R4Q87NPOE2J4ywB5GxYqoaRyNQhNWNEA+Ae0KGcs3ufqgnSTvqOPPqPQrRaFOO7T
	ToI6qqfKY8i1SpsNbc6fF8Bo80BB2toz3ocftzIhclJ0C/Xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs7jk8f97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:43:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so11702745ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749805; x=1790354605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=hfOfIV6HmpRKitsL0ojpERc0+AZffrWiG7lP56BKrHeKviG6iV/Jb81qlKQK5R/Y3Z
         TTLlR8aR/Cigz/unw+Cq8rthvgztconpXD5dqvyLtoM8QV00Jud2pLjMpFrNITM2BWUk
         jdvlluCUeX3SbSb0YAjMMz+FlsqilgELxpllfOzUMh5PW8nfFEz2QLYmc11JleZUh9BQ
         uP/C4koT+ZBQMY3DeeNMAr60iq3RyTQNGltYvMWWmEawlJjrtrHTsARgRKoaMfV8Y14C
         37oUYECdr/+ygdmf4To7AzVHcuC0RuXVTzPTe7lxmA8BuTwWUaDckWj+ORQJ1oiwKX3b
         IzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749805; x=1790354605;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oA6mPBcLFH3SC1iZeQ71t0LSRYXqkDAN0OfRuXOGK2M=;
        b=l4qZtPuzaCbeZxbCH9xFuNwzvrfv4A3P8gsB2cCSET+oRybbr9IIqs6qWfloMSVWNw
         hlwgXrAx96Jf38cv7Iq/4YgsqmEZwqyUalWJHnhoGyhc1Zs4lcnx9jpT4DXMuzPPwedD
         72F3YjCIOtTCV4Pr0EVizLmjDZEK+OwEuI0B+g1OpIpuRan4Mw+oLP2WibzTSiWIECcQ
         siDs/7PcpSbVLZ0dPhBqWvifoM5PY0muxcoDIsgXf+nVWT72KMuvQkREW35KwTO3iULo
         H8V/zstKPPV8EZFpFItwFNV0ipHDnUduoMCcssgdYZwHHLcBB7YbnvmtaVpfG6cbqtdR
         CHrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1PH/MSf6K5mXaQQqPuE7iMQuk2cZHBhGUpWYM0bo869r9jyf8/20r16wWehmBjS4/MgMu5Fu5avaIVEA=@vger.kernel.org
X-Gm-Message-State: AFuF++n1I+QbT88hDi5cUf5fRCBa/QeOcMRqp1E/0NNHEIPpEgj8DSaS
	IlajNV9h/+mMsW45EOjSOu3PZxGbIIFk+fQuH3wpBad+dJL0YOJY04AL+9IlWravPpRJNpVANFV
	KBmAlYvlqyY4AxIo+0rIJPiCJhM5No9XVyYMysMb1ca45AmV7JIrWXC5jZYHGRBhoBjU=
X-Gm-Gg: AYBFou0ZiOEX73BBAkbGuDcNDGNQDaamwygFqStZ0nEtYSx+5X+JkkZhMXSuwIS8KoI
	6YrDZTEoXxt6VJhxACt0Jhs6PtjFfa7W7LeCliVKmc6b8J8DhAWb3U4aa+g6dzX9yvFdlsQFqum
	w/fq/nUZfSwGFpvVqhQOdNLe0wYZt8gJXxS3Er1J8V7wKGQSiPjE5MtLbM1TLXT3KaA4mxDgoAU
	xrMAvVXsjLR+JL5G7z/X1yyBrR+XDhZ3Fhr3KsTX1ynjta9ulCJlUfY7hl/0+vONIpspZdVDPnj
	R06YXrtcuY1OMaZb140Ynfn8QtUqCZbo6BY4NHq2ojIoYAsuY+x/Cc26olBHV+IPKaW1LowzZrS
	PGxixR6XRGF29GsF0Jg==
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307815ad.9.1789749805263;
        Fri, 18 Sep 2026 09:43:25 -0700 (PDT)
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr71307305ad.9.1789749804649;
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Fri, 18 Sep 2026 22:12:44 +0530
Message-Id: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARqrWoC/yXMTQqDMBBA4avIrBuYTNT+XEWKaBzbKVRDRosg3
 r1Rl9/ivRWUo7DCI1sh8k9UxiHBXjLw72Z4sZEuGQipxLstTPje0GIt5GudQxjjZByWlJN1V/I
 OUhgi97Ic0+p5Wuf2w37aT7BtfwIjf8h2AAAA
X-Change-ID: 20260915-pm8010_i2c_support-3062421372c3
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1613;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=H6fsZYId41KQpeu0ypkHNClFv6JIG/e+9fOK7DhdSvA=;
 b=qKnWaYqEKCCysF3ieQyz7rqHneuV3s7N/zgJRNtZUrOVX0OAm8QMt2iZoZ+5DeMvSI7wQMd1v
 E2dbxY4M1tNAbrWRqW5vVuSIwCccSh59OHswK9t38hVxp2mrO9bCJpc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: KZ6F5IHe1WcA5RsKgMJVH807dvGnI1cD
X-Proofpoint-GUID: KZ6F5IHe1WcA5RsKgMJVH807dvGnI1cD
X-Authority-Analysis: v=2.4 cv=FeSiV5+6 c=1 sm=1 tr=0 ts=6aad6a2e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tWdyBv_7HfDShhJaVkwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX/R40LVn5QTmz
 PQ2Ff2L5A3lrz8E7FHluDJ30C5sZcw7kkU5e8mj2SnMqKyJnayPSX6MGWGvcBHdkZSKwaS/6hpS
 faDtRuCMtGYq7xYZN2unRtYvj89x9NYoWXDizfTYvDg9L5nS61F2mGoSDnLkAeUBOHOoqRFbl33
 nognS5CE3QOs5MkIFhmhp7mb2Pd+4OSAceB+nEuSmcpwZQHIy44Gb5O1ZG/Yy+T12br/2C7vVGZ
 8pzJjlgqtVaAfBS4BIrQvs8472MIDR/SPnnQUyLb1VUq6W0n8NTlODhaTMQkX/gbX3idK3TQL4/
 8SC9QN0GyVEVtq8zLAPbTKE4T8tEk0kRP/HRCFWZF70cXYjPPYPGTpBhiIQnSZhO1uRUf+xz0nt
 yBChvaJzwpf1Cxxpg8/shFvy6QSrEClTTNemBhwj4WXAiB31mcgfSGVqwlRQZgseeIeJ3NAA9FH
 0MKIgXUv0Xm5KTEu80g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX/C2vbSkr9Dqj
 zez3kPtJO+dJjXVsnkZO3akQ1orvZzTr0SOkU6OGFlkDlBWJqUvH1MMIrsk1+ffiKPvFnwRVm4W
 a77NCpzop3bO6m1b09eVJbC4bN2OQ4s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180238

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 adds PM8010 support in the MFD driver

Patch 5 updates documentation to make interrupt configuration optional

Patch 6 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Dhruvin Rajpura (1):
      regulator: qcom-pm8008: Add PM8010 mode support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 108 +++++++++---
 drivers/regulator/qcom-pm8008-regulator.c          | 184 ++++++++++++++++++---
 3 files changed, 250 insertions(+), 52 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3C4D5991
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973998; cv=none; b=ErOUrPChxAmsYeEJJeGYzZcHv0YLF0o9RHWbXqphqAVKWgtJ46uTvPxsJgOjjybY9nGR8qLoKea8wyFFJFwds168lX3M7q3Vqf/sMHdYQrz7WAoURTOUUZ77nQAOoB8HpigPoO4tJwa/M6qPKap0YIw7yvX0lEpSByzcIMI8hJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973998; c=relaxed/simple;
	bh=cQdvvOL0HPwR95jC9VzmtLBKVAu5cXVRhXP1lbva3gk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RQl8w4OAhAvqTKeui0iQasbYhN3isp7Tsuay/bdryCfFRhVU5bQAVdDddvZqyxJObz0cqFyJA4go6jnim5Vr8WhuF6WKXYUU7clJs2JBbV5rsoADsVkF+Rl0STKMKO0iZC4GAb3SRBKED8M6gQ3xW9aQkw4MycHYTfpeQ6YYQy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYjVZY9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQdMYSg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYjVZY9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQdMYSg7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARTqQ466878
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rZRV0H3Eo7IaIesmvx47nA
	Ej+mGzXT0oWjI9d7BBs5E=; b=AYjVZY9ctSIot+PTVK7P/rgFWkTUXcqiDrcYRq
	zlTXQu8toOl/+2GR/jYqm2iosyYbfh8plyv1zbKN3ggGCms35osf2XKiLSExH1p0
	IC/RczaabdNyyaUpx6/QAc/C7WFzB9ARjyB00LRc6KpYgH1F6Pi/jYO0iebHngxG
	aCKV108ceKINBPqw72gWtnOex7JBQ9s0Y9xCAzFWK4Cd3YCAhoAFTI5H3M10WcqL
	MVbIVm0iF2KI8cMqfPzOigo7badAVTINbk0exTb+rO+Vzllegesz9IAXSgvGrJIj
	DFjiuB9JYtpSzlAg85ZsCvddl+gkZTV+0tdB/bQUhKQSAzKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr0p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60770381cso35001515ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791973994; x=1792578794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZRV0H3Eo7IaIesmvx47nAEj+mGzXT0oWjI9d7BBs5E=;
        b=QQdMYSg7SCLZsYxKvNLZaWLRjpEdG9M4ZOuDqlZ2ZJFhGSL3bHbGDlB6pVivIPuoZh
         0J5+eTKtnHERB3ARMrVVfjASUrJIhtgjpOa8ishUVjNvtqCk7xLt3SvKSwUwpxtOEEya
         ga9oezl75jxy36XNeoHwwtn5jOLcdw7BextiVv8m6loZd+RznsfdmrMHOSa13s9oF+io
         ntCExBWMjnYdjPp3Z5uPmOg+fYl35OpDVRIkZwsdibJx0+4WjeEtjUk2QC6WjxPLJYpP
         D269P8ua0cYPyCL0szmQN5KL7oo0ofAqIyGAneUGH4aFIQEMIlZIZ89snBCREJP59naY
         dRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973994; x=1792578794;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rZRV0H3Eo7IaIesmvx47nAEj+mGzXT0oWjI9d7BBs5E=;
        b=j0eUVX4nPjusqX2JIESciXMOXm0jzT2n9x4PL2O74fFFHoVp+ZHei8eHAAngPo643d
         MNC8iKPqZyAAmpr63W+OMrQ/xmZEJeKlxoNemDRVXgtW5Ft/QCVZgYy4WowGtlGu8JxM
         eQbfWNBaCtxtIoGZmDvtYwvQXqCH7Hx4rqwWSRF8wty1Zl14kXvT0XrWS6ZMaUcYZfvw
         6Gi86kpcQ3sh9Ogjyub7afL6PDWIMb5ZSSj5yLTDlc1f7ac9DHtXxM61DAIWx5XCqOQG
         xJCX9kj1psvvTBlbKWGAYuEgnOl5q0KlXBkBpm05FxXUhjJElNcflzLdbSZhgsonqzzF
         0y4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1Yiunt1EsOMc5RxM71FpgJiNu1ghqHcN8CKrnXo4WbYnpHyqUf0ZKNQgo0x/qEAUcHKbviU54+WgtRtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJrzOyKL5eDoeRrz1yZZEQvfB4radMqnoOmn69XsaLjVHsUVa4
	UAoNyl2Dg3JCyivj6AztNRm+WtvjFx7DTrXglkhxIiB3VXcvTLtuBXkOsQNM2S0FlMbLTGB5kwv
	Z0m7bd8XhHxArCF8VTTnIXkYegm3sQAJ5uqbrPgWNkSCQpEUFwYztdaFW92Wf+MJcFr8=
X-Gm-Gg: AYBFou21n1ZGdot+Wsk3GfTEice1yyfzeYx49BxxqHPLszlIHzIiUhzo/Yec0ghtFkD
	TBvrJdkw7ZAggcS/gpLif91FfcEIqKXa+zsBg2wNAbxpElKUHdE0C8wtaif2nXj3LYBNZ4SxFzK
	DlGJ7TazFoT9hOVIHIdl+OmRmMaKWdc/iAG8fIKSuZZKwT+kTYjBypvamqVpwW0udNLvaoBCWrI
	P22Kj7rqk+2bz8Hgwpn50l61UwlLxrhD4FlVJj9rSnvwVlRpluiNAhgNXn6tthH9sfGdJx1MOXc
	FLbie+AOifENI2mBA503lgzPeP6TMLxFGZsYYaM3RQuH1b5TO1JN1PxXxiCdO9NxWm677X3ijrk
	Ug0l83ohwtvO8+r4po9o=
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr3612542637.36.1791973993442;
        Wed, 14 Oct 2026 03:33:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr3612517637.36.1791973992923;
        Wed, 14 Oct 2026 03:33:12 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:10 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Wed, 14 Oct 2026 16:01:57 +0530
Message-Id: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1az2oC/22Nyw6CMBREf8V0bUl7qzxc+R+GEGyLXCO09gLRE
 P7dgnHnZpKTzMyZGdmAlthpN7NgJyR0fQTY75hu6/5mOZrIDASkopBH7rtcSFEh6IpG710YuBI
 pHECqDLRiceiDbfC1nV7KL9N4vVs9rE9ro0UaXHhv1kmuvZ8g/yeYJBfcWKVMlje1KczZESXPs
 X5o13VJDFYuy/IBu07R3c0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2699;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=cQdvvOL0HPwR95jC9VzmtLBKVAu5cXVRhXP1lbva3gk=;
 b=gMSEL65jLFuH27jgq75H4O+ARk/gSz01YO/rdffbNmGQGLRSxlLP2Z+2HxrWJLnpvZIlLrswd
 Fxa+2OXGgqvD9K+NF+I1j703v8B9MdBbRRROWj8JwvSm57L/meoXYYM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXzafjbA+CBc3O
 DHcZjEM3dA9pDY++otiRrQG+BcKFeLtjr9/KMIY8OGyorQwzwCq9s+ttUpdzk3gy/En1ABHlQXk
 YBDKgqQZ8IX7JnmT6D0uaOHpWYyAaSQ=
X-Proofpoint-GUID: Efbruj-P_Cg0wkD-PhAjfe4vzeQZv63v
X-Proofpoint-ORIG-GUID: Efbruj-P_Cg0wkD-PhAjfe4vzeQZv63v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX4ySkZ9+mb2J7
 IZbjC6ywAr1XTOzZT6s1EA8+fm+edcb+2nPrPNCtQEpiUbaDmhcDAHIMFMvvEV11/z5dhBOyVI4
 g7ofyPC3LMHkfw7jxMJnqcoo2ldNJ/iBAE8ppu94OfovS41Xa92rOf9IujQ3p7CKIL00ViqGfQI
 Gj/NFK27/bOccgFsHIWIzE2/ZNW0JW8gLUiZQzqVOFXqeITlU5HkDrauLcjgFCYQWSases6W4jd
 Axb7IAK/w8dcOlItIFIbOSg8vDh53NXeneI+dcu2tJ529oxu+8X6Mb1uUOK0wLE2Hm2nqvxQe5c
 JXMYJlg0RaVuwof+xfv8R543tuxUVU0tG0r0F9dDC632pJPz4rBdXqqKKAMoPBHN1CvxFO+ZFbm
 nB8ueFP48coAk+FQpYnqCy8aUpSmoyV/9rFqeEHwKBliLIAcuM8ye557wc99ZhN41TqJuMqoPPo
 +yAaeefsXI92L3vOwXg==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf5a6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pFWVvVhNtIjcWoVgkSgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

PM8010 is the next generation PMIC following PM8008 and has similar
functionality, providing 7 LDOs that power camera sensors and associated
hardware, with some differences from PM8008 LDOs. The series also adds
support for skipping interrupt configurations which is needed to support
SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

Patch 1 adds the new compatible string for PM8010 over I2C

Patch 2 adds PM8010 LDO support

Patch 3 adds mode voting support for PM8010, which is not supported on PM8008

Patch 4 drops GPIO support from the MFD driver, as the GPIOs have fixed
functions and don't need SW configurations

Patch 5 adds PM8010 support in the MFD driver

Patch 6 updates documentation to make interrupt configuration optional

Patch 7 updates the MFD driver to tolerate a missing interrupt

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Simplified of_device_is_compatible() call in mode support patch as
  suggested by sashiko.
- Added a change to drop GPIO support in MFD driver as suggested by Konrad.
- Replaced match_data parsing in probe in PM8010 MFD support patch with enum
  identifier and switch() statement as suggested by Lee.
- Moved interrupt configuration from probe into separate function in missing
  interrupt support patch as suggested by Lee.
- Added MFD cells for no-IRQ variants of PM8008/PM8010 and updated probe to
  use them in missing interrupt support patch as suggested by sashiko.
- Collected Rob's Acked-by tags on binding changes and Oleg's Tested-by tags
  on regulator driver changes (not on MFD changes since some significant
  changes are made in them now).
- Link to v1: https://patch.msgid.link/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com

---
Dhruvin Rajpura (1):
      regulator: qcom-pm8008: Add PM8010 mode support

Jishnu Prakash (1):
      mfd: qcom-pm8008: Drop GPIO support

Konrad Dybcio (5):
      dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c compatible
      regulator: pm8008: Add PM8010 support
      mfd: qcom-pm8008: Add PM8010 support
      dt-bindings: mfd: pm8008: Make interrupts optional
      mfd: qcom-pm8008: Tolerate missing interrupt

 .../devicetree/bindings/mfd/qcom,pm8008.yaml       |  10 +-
 drivers/mfd/qcom-pm8008.c                          | 165 +++++++++++++-----
 drivers/regulator/qcom-pm8008-regulator.c          | 184 ++++++++++++++++++---
 3 files changed, 289 insertions(+), 70 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260915-pm8010_i2c_support-3062421372c3

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


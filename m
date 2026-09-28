Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14713644C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577431; cv=none; b=lpVI6X+78f1K9TamuH7I653CIiAV6/KgkdKNUOz6kNAKTMILDxVoIEZzwuu6+QnGVMCC54gFo5ioM0KQS1rQfCPD8vjfezNVVeZv3SdeJEI7xaVNz25c77Xf5MEFgmNezsMglWTu2fRlVGYwQ3Pz4rpVw7aAb59kpEkKlsedODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577431; c=relaxed/simple;
	bh=pi1nlOfbuXTW23fGZQRxlzqvgo2FgPdrsa/z5teMeKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VAf2dInt1OkUnPRV28mfzftCVQh0W/iPCYxWQhPCyuz3yt0U4rYGzB010Ffi4lPn8/Qs08uqLlpgH/frhqRfME2lT7iYyEpskUM2qvyUx+Mg+piokhCEj70N6W+hpGJa7km+cZOYSZihe10CSFFEttCRhoclGmFWkAlzhFuGz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSt6ytxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPff8qH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSt6ytxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPff8qH1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P38S674734
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zjq6w9GGoU/fBAsCOTHHUE
	zVoBXixqvy2upUbVg/rdA=; b=TSt6ytxJtsgSxHZr0nUyDUgfG/0XmNvqmGdsC4
	UYT97kPP+nMggr4PpYgUmG5fvt7tCoOX+iPlqXRzYJ3CFJBZ7WRZ7kQLf7/vjRX3
	Iue0ALNL6l6NCxtW6mhpDBkynItafrKGjC5UtDRAg/1w9WiZPPQpRAcR9aLkAyEM
	uAjl6VzUGOHY2q0ULwvIW5I8T6GkqTVHf3TuUA4DKL42BJ28RMVI1cnJN29PHVU0
	BK6lUPUC5tTuY9v6GqtsPt8kbmMW0QTQkQACp0ANXaSPJnp0k3vGGUWYerRFpGpf
	YlhCSQp5sCFpLkvp/MiDfGblYCp9u0NtGb9QuCPTvNznsyVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s079u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso49468615ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577428; x=1791182228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zjq6w9GGoU/fBAsCOTHHUEzVoBXixqvy2upUbVg/rdA=;
        b=PPff8qH11/LbTeSLL7xTgD/RLddbamy8g7yMxternD2EgVD1abScVoDaqzejIP0JD8
         pNqVtX/M+mWmJog3+GVqiNl3W+bckowIfIItZ7bhmaUUYcV4be1PZkzzDXpLKXWWDe05
         jaLti2AhZo1Gp2xkCH7bw3kGQQOC1sSwyMil4utrTvyr1ue6rj6uaygyq3gKHIHdpeca
         4E3JqE6P9PuyFJgLQ4y/dSGvJwFzOCzsKIjmtfWRi1ZskptHYJg9w7NcgdSk5BvtR9nG
         6e+4SkHSPg/Jf5S+PPN6sxlW4flG0vQQktIB1DYS/AH16Qy4aD9pHG7ubVPIU/E9pyJW
         fC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577428; x=1791182228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zjq6w9GGoU/fBAsCOTHHUEzVoBXixqvy2upUbVg/rdA=;
        b=NAH7m2qFQvSFqKAa4s+oI0wTwiQH6k3dXU5VWI/5qcwtYqxXoAOMAdIdEyFrAmKbGp
         YPosK3u30fHN69IYOICgfRGwM2THB+ywv+BgmRG0BJtvXvDywmzC+obMB1w1OM5wgc2Z
         dcEUbcRQ6ANBB6TZEz3uqWl2ISIMFizCrouY9v3UDq9lkXYa+TeEAbDxrWE8GgACz33y
         sqLj8IFGncidM2eZKBVLqHyxgGasF0attPGZvV5aUUJnA2FxO2LPKOnby4PQai2OHkG5
         W7mMI0WBYYUY2CLZHOtI2D1y6O/Hshx1O3NflhRmrIscs1kikNaY1/WJXizSbfW3EdVe
         IrgA==
X-Forwarded-Encrypted: i=1; AKwUvByGH93qv8TQHZuUOIJg7L9Zc3zst5JExyGm8VpB8xyxeux5XFNLfmVkzjmcTHKVmmf7KOt1RFZhioqR1AI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3pWYjP6jQ5MtdkqFoe6fTtbrJVNINzv79jTHSC6KBiPHltq4P
	kYPEjhAXZa3NIQ6sqhFoX8R327mOEh8pYgLF0bgaMhJXULt7aEalqmKQsC4Cm/hpqVzurrc0p4n
	kbzHi3Dr5UhA8RyX93M/hPqtkHo3zCpV9bdhIDuTOvX50YoBfj4QRf8sAQaD61702gFUvRr35eH
	U=
X-Gm-Gg: AYBFou2pVoAW5SKDkw13xyikQAs/OoGF9kdV5IBAUDq77l9CM6q3aG4GD43bSGhEsE6
	4QMjSBFaKnBP1wQUa+XwKqswHXxeodzqoNGCPM+Lk7Er9V7ctvpprJKheUdZcUixF+TwiIx7CDT
	VvgkxZY2VzSeX0swViQnUPehewf5cFZZZSjRciz3t/JqE50/uEVzXxFoOLPK+YNE6gUi6+DeZbJ
	0w0u9a+UvuXxRcuP0ELFsQpwlcM7fTzJuauRqy5vFNJ2O6AhYZaPOC58U9My0q38Kn9TMdRPMVQ
	VVsCHB1zoirXeXdRPGeu/2XCUw8Chfbe6So7BKiadXt+IYGib45hZjJoK9Gn+nFdY6Js/oH9Ztf
	M0fkIZOulRga5ziFtjTRV7QsaHMe+dLSQxO0UKK5DIf9+2C2exNcEKuGkNql/3Aze1iIeKb5F4/
	f1aBi0j774cGJJ
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr51326565ad.13.1790577428449;
        Sun, 27 Sep 2026 23:37:08 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr51326295ad.13.1790577428009;
        Sun, 27 Sep 2026 23:37:08 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:06 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/3] platform: arm64: qcom-hamoa-ec: Add thermistor support
Date: Mon, 28 Sep 2026 12:06:36 +0530
Message-Id: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQKumoC/yXMQQqDMBBA0avIrA04qYr2KiJS47SOUBNmYimId
 ze2y7f4fwclYVK4ZzsIfVjZrwmYZ+Dmx/oiw1My2MLWRYtoyA1xJnmzRi+DbiF4iaZCa9uqnsr
 mhpDaIPTk7+/b9X/rNi7k4jWD4zgB/IQRhnkAAAA=
X-Change-ID: 20260911-ec_thermistor_support-5122956d4831
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1079;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pi1nlOfbuXTW23fGZQRxlzqvgo2FgPdrsa/z5teMeKk=;
 b=wQNlfIQGWtf4zsEMBtI6agJA7H/7dv9y+dq3sVQzxsWm8kRyduGfTiuKVfqkBLF48YKB+oIMb
 mrJRycGCx4JDoulXK6zbF16OixmBtd8PQUiFQXfYo8USVLVTMfQWvnn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX/+Zc8mM98yJ7
 77d54yLiSeU0WaAA8Tkt1sncNxwNcK94OKa15gpKnzF4L8wH9FzDlN+kB40kSm7lB94TXaazFp4
 pCb5j1/4VEDi7QYn7b5kLqM3mvvEJhrmpXMf/T3+PyG++ndLDshq4aPN69ijOUw+C4aExAsUL7f
 suwtYS88YM17ywvLVIqvO8nSz0teejU3VZW2NjB3tdUnA+o15bOj6up4S8M7lBOjugUEwinj+ay
 A9d/WrbhAlC0bP7vrvkWuR0uKX+usmf0ccVWCrP8N85lVkIF9gklr509VnTj4S1X9Akr5w05jAk
 VXZfsENBGGkEAH6sBvU4+CDqPSIlyjzPprIWfc++IIJYoTNmijUBS9HpF3cd1HBQEFhyVeYTCEK
 vZ2JP1cv84D4znptFDM2Ut+C7MpqI/mNvDTPjaN6K8Xzx1++38j2VqsFcUMRZqVyZf/wh6DuJ/T
 MFFSX+1GBWbiLhCLKPQ==
X-Proofpoint-ORIG-GUID: mRr5uutg41wfhIyCCACFE1Rx3iqoAhdo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX2ItWK0XUdULt
 EbAdXuk6g8Ot5ECGBKI781sYI7w89Az/MgRJqtwImGSRgMtpoeK1LOHSMA1gmPsAucBmaJgKoRw
 2Yx2BQtxbcppS/07Dog7SLAriJTL9Dw=
X-Proofpoint-GUID: mRr5uutg41wfhIyCCACFE1Rx3iqoAhdo
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba0b15 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8uFsmxiYqSYk2WIGYwQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280026

The Qualcomm Hamoa/Glymur embedded controller hosts multiple onboard
thermistors. This series registers the available thermistors with the
thermal framework and exposes them as thermal sensors, with the EC described
as a thermal-sensor provider for Glymur SoCs.

The series also adds the EC thermal-sensor references and corresponding back
cover, keyboard and SoC thermal zones to the Glymur CRD.

---
Anvesh Jain P (3):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal sensors
      platform: arm64: qcom-hamoa-ec: Add thermistor sensors
      arm64: dts: qcom: glymur: Add EC thermal zones

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 12 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 45 ++++++++++++-
 drivers/platform/arm64/qcom-hamoa-ec.c             | 74 ++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260911-ec_thermistor_support-5122956d4831

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>


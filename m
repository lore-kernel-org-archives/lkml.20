Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD53563F6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583509; cv=none; b=b5o7C7iUuOxKJtNfAyVLcafATb8BrqLSLQ5SCp9x2dgpY9KEMvXCWzbUdeTesf79FDJK4uQ3uKHZcdFfWO5PZ7bwlbpx+dcUuqfGy2JDz4pmrMrOw/xySoNtBJl2BSWa7W94JX7AtM4Dkx2pGyZ4ejdiuPWqvY0I7qw6j9r/QCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583509; c=relaxed/simple;
	bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U/p4gaHkyyAUQdeswUcujYnGwSrjUh1BLDs3ZJ8ZCURVkapSC9zEvi7uKl8Wm/aYI2M15zPL2WGS3k5P+JiCRQni5QeddV8fOefD8jN5brMDI/hUvm82FmzoL1e0/oIWW9UvkGkND+7Qr4GMA6vtQqxIIyW+5ZZK9w77A2tP1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfN57Ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfylW4C8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfN57Ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfylW4C8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GH6UL73559622
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3gvRIGA/yV1xEyOwPDhQD
	5kTkCxuhUGXgr/bqpja1E=; b=aSfN57JiqDov2+LXnLsEHMyU+sKkGGpJyTGWIM
	wITMpOfFoM8endchB5r8vfr9ASRB1lDChTGd+lH9fXKOGHJueQtlipgRmLiR6j6K
	AmNI9/06ACMZ+XesVfMqGjPEZ7TxhKwYve2TXZwtil+gEJwalcUc92yaZxQEsfY+
	9xsXDbA4mylae1TMUd7JTyAXfBKUma0PpbZHNybtvvFqjlGFmyJuwdIxuUXdUOHD
	PzFjABYtj82hJc8c0MWlgd7XrqyzaiQIb/g7YoLv+m20c5GIXmiJGjIZ26iEDhLY
	23t0vhk/lad9/dQmskssFGeIf1aZZplBGBEHIuAzZGrFZq+w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7h8bun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso2017146e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583471; x=1790188271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=dfylW4C81qjm5B7KUZKztexiqVptv3oY0yj2uBHAlbSCA/OLy1uIzNxDtGUzX4ay4r
         bo1BphUxCv7vXW8dQ1KDvFPY9ODBN29SWcE41UuJX8LPLGeclC+dXFqsHqbsAP7c3c1j
         rmPtbV20X//NU8trrheqwa2UNOxIJ4mrv8s9ok2oBIMR9wMuFw88qKCLpS2dB5yluuQt
         2dLPOsoB7xtBjl8HDo1aag7ppWeHDpDBk4s9dHftuh7w3G0Hxlu4dWGR2FJYLLYRj6jo
         U44rb7R/RuppXnH7gWLKnlZN15wGIzdD24HfKOVTZgP0QcqcGr1N8mmVkZK8SUwCmrnx
         fCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583471; x=1790188271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=pl2WE6hTmyRTnwQvh8NbhoTfw/6yq2JnCCQLZJxBAIRs0JXV2RBFzjPHfJvc+j1eJX
         AbEAe6G+VGRyja4bPs0248T+A832nRftrjpY01fMSnHzbRXPWgu57+9CyjMb0BODj0Tf
         MKJfM7Tv1/L09ot42c+48Dbzgl+esiywoXMWYgBPvlrAyQ19VLQyDWBDOuz1twF7/ANg
         ttsCBJIlzCoIk+f6Qi4mgnMnwSFfi92u2QW7f6Sq4pDXfPist7sNTFr0dH79pFF/WphF
         MpFlQUzhUjJuI45OLEyoZOm0ZmyRLaXVs7RkfaqONq0gW97bsGXhsACCZUPE3IYxs/pm
         Qj2Q==
X-Forwarded-Encrypted: i=1; AKwUvBybmdwlw9bTgMbpzU/hk10YON/5VP7iqXV2+dHbG2O+qCZqmp2nO4BVbRJRiXxv9FXw46d1GgHBw6aTnDg=@vger.kernel.org
X-Gm-Message-State: AFuF++mKt8qU0CFLy6CvSWI7muvdandozu8QOZ25JsgyRwjU9qIzf2Xc
	wNReMDtJ0hwMOzN3P6Vg9lPhipG71bLMr8eDWW6Tvgc2q88rIvm9I5a5+zVozu+3O283QwNFCu+
	qnLDnilShgBmEYbx6v1DlPKAG5rzu43CJLTlH7DKcy2ObBRaFtf44EOeoEZ+HOQ17k2Oo+dvwD6
	4=
X-Gm-Gg: AYBFou2hoOm9x5fxqaIFYgXSwFvo96vOpssbUyNn7QNu2hS0+tXI2aC++D0nsdWy7jw
	F1Th5V1VIwwYfb3AfMmUn/2l/rjkwgNBNsTlMSk5p3oU7N59SHAXFctGncJAFWYpbZFOE0ENLsY
	0EkVYAPg/4Xs1iEHiRrOc6rDaDbUzU1EXIBH9EzD5JUTqTa2G9u0Yea9X4PX9idHFLp84k3+nqo
	dqFwErQfiEV55GY8Y+7Jlr83CP8ZaucKZoa6blQBWMGNVUOlHfzCWsNktpXnd0dbpoWT7NEIMew
	nffM12ytcHsQ8OgX90yUClHN+6hMTxkzPeec4W9vNDLbvMNoqYOiG3nJtLYDo59JggV1V52gPGy
	78GQL7DUX3xN8vHtoi4vBj4u/em0=
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367275e0c.11.1789583470386;
        Wed, 16 Sep 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367165e0c.11.1789583469801;
        Wed, 16 Sep 2026 11:31:09 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: Add USB PHY support for Nord SoC
Date: Wed, 16 Sep 2026 20:30:50 +0200
Message-Id: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrgqmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3bz8ohTd0uIk3YKMSt0Us5QUY3OzJLMkU2MloJaCotS0zAqwcdG
 xtbUAM0qRwF4AAAA=
X-Change-ID: 20260914-nord-usb-phy-d6dd376b6b53
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBfVzBHJbfCqkaO12bk15XeM7ldkyj+DPDmD
 bVq67wgUoqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgXwAKCRAFnS7L/zaE
 w/YkEAC7mYA8uMPgtdZSFoRCRwKj2MZ1A+5hLEUA9Ug3b5UGi0lpcHOtTZPG7d6kqRVGSPkED0x
 6iCBgew7V0+835N113sER9CTC+vM722xH329o3Fd50yzItvfqjjGQn/8MJGu4Zm73/8RG8hULsM
 A4axgIXl1qtrv8UkdFS1IIXCu45IyfRUuv0aOwfszZJ5HTT4JuZcDD4IaiNZoa5HvL3Lb1hzhEI
 zp0TjPEqHRyC507DzF+W3VyP/QQ//Dcq00QMa58uZ0TojcML1ZADfGixbgGllEtzf2wIWjKv6P/
 DI7PfSLnLww1dgXE8HvwddyfGzYSHHKPrSXEAGS7cFd/bZS6HMVvVBbvFLP9JklhQsrN72a2WJj
 lz7VB5v4Z3PYB0heIOHgL/aPpcmvyAh8erfPnBzA4iKAacTOYYYiyu5nxVekDFP2w/g7vNVtRi4
 jvqQC1cvOwM5Q1aZnspKarYB23znW4JTZ+1BSWzMOrSTqEICSRZ7AtM2JNFfZ8GWLA0xOb4S5kh
 9KdRZWGev2aGYvVzrPhK8USy393UCTeyupWJTRLFjENNEn/UkGGG66QA7Qr9q6KknF4vLOiUMcP
 iozJUvlnt5mPN78+JIUag36zXLqeT49WhLWsI+mQBH+aXTgo5V2FJoAQFUsotabT8d8dEqaE+0U
 3t0b6AlEYaTSi+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX9/y3t7zrmeH8
 PSrsORdAM2dWmvm4MCUR/WlOnOB2ZZISxnxHlK0gEMSEgsjU3BC6QRvMtPRFXKcfI46ffo1wphh
 y18uDt46Gjw6fcMwAsJCW9rTZASuZnuKjKodaKdopl2RZ8DtPoPebY7n8XKo8uK2INBBOgSXdPl
 5XrFgszJBuYcBM0xrlL0RHEmrfDGDGFRWJy+5fs1YoeYzwweNmGb0t/k7haxTz5pCmjnslw6AYs
 Mhso3ukga9X52WuGcxknBGe/PrXwRlp2u+zwOM/xqFrusc2yKjUDSfUfMWJ1bq/nqBSTMW4frOh
 vhlgzclHhHTjPO5Vgf58QZuabxJc/jrQHX8nMS8IcKOpIJ/ee27LvjF6hZqIsCaVobc48lCdJno
 QjihuREQfLgc+qTQcMp3A0HEyG/RaEcjmzLEH30hr3htFB4O5wzKWPZrZNttKm9DZBjEDTevDoe
 i6BlkaiIOZNmeZRqPrg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aaae06f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fYuUhxZzbo174WpB_3cA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: FUzK5kZP-4Sk-fj4AtA3p3_BO5I29j9m
X-Proofpoint-ORIG-GUID: FUzK5kZP-4Sk-fj4AtA3p3_BO5I29j9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX9OJsjrcEixMV
 CIF9ipt/Hhh56pfFK9YnuMhvsT/jQf36PTAakIl1NgZu8fcDW73xF9y/vE0/bs9C5KH9S/ehFU/
 kIonP1DLf1HBZSFOsRkPScQgg1RhK1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rephrase the commit message in patch 1/4: drop any mentions of the
  driver implementation as it has no impact on the bindings. Clarify
  that usb20 PHY really does not have an external reset.
- Squash patches 1 and 2 for the optional reset change to make sense in
  the context of adding the nord compatible.
- Fix tx_tbl register values for Nord.
- Link to v1: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (3):
      dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
      phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 80 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260914-nord-usb-phy-d6dd376b6b53

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


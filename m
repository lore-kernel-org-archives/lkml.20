Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E9446820
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249327; cv=none; b=SrbFX7qakS4PhDVtA8/j9ZsN8tRfMhMZZRY/g7Bw+HezJl2gS44TWFSGQvC4I520k5+BGLoENQZDBLr6fqEMZoCbuG7nfQpfizSiJ/wcsn9oRyXnZEO+qjImYitvBbJTue93mNCHMA+aIVDybje9trBUP5KNyLhrv0Hb62ShZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249327; c=relaxed/simple;
	bh=6+LUMqK+QEr1CV332wSeVbOAm5qKQQiCjVjQE8pOF5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4nRvlW4Y6/G5QsQB+WsAj/5kUI1CHFcbe97KnSQ5nApkm5TztWDAIqVSyIheIITzKnm8LrS4Gw2k0nl/UTimjD4JOmR1+6/KAtnW7cSR1g16iIrJdzcrB6QHi4saV8+0Ykgg4yqa0QpKEDgGoIA9mcKVv+bmLKuuUOXOSTHAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXHPnIZ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqX81QIC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXHPnIZ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqX81QIC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68178oRY2973928
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DroUy899f8UZcEHvH5hCZ0
	9xwNLqFHtAI/BTIz7Ayzk=; b=YXHPnIZ2PRkN7fObuJSzcUyA6T7UNbgHlSzCc1
	9l0fdz/qXclcphHg3S7kjJR1bC3EITBL3gBrDOofO7HCI7Pdeey6QPNhwpihl7pB
	zCONLfd+B79yhzGQppYdADs/oqsuJDx0AHwDo+TTKMV2JWfmhpSbZfwyK/jEbomc
	viGJdmbnT3AMyTtQ1Vux170nYv61UT0q2yzEOG/lzMfYJ7V97jebwQwoAX3cj3p5
	yGB+o3qbpoC+EXmPOBvtbZSoFxE78KEvvJN6F2HsmD3NrgXO/aQmxLeFAjKteFaV
	STYYs7bA1PAHL7eJT6gMQM9IqJKdMblcgX2bKbfNi0tiKEog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu09ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:55:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so692108685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249324; x=1788854124; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DroUy899f8UZcEHvH5hCZ09xwNLqFHtAI/BTIz7Ayzk=;
        b=RqX81QICGl1DkOtyXFH5ihoVOcIOm9t95nOVTqJJ7gGwYeYzQOPh+qtST1p6AfIkJS
         XtnQGOcA74arUkrIoJcu5xACY/24RC2N+6ef5wVrhr5Lfr8fBDx/acU7ZhdglKuKT8eq
         ynyFzh1tdlBhiejEcGqVdN7WX3KsYICkszS9ht32fAuAPFxMvkA5BNLAcPapMc/p27Az
         3oGnpTuyMw92NerdAgtFfmloGszqaXWSx63RCWAVkyjn0+ud4/WG1BW4FDYut4aISjR0
         NuLjYlwKjmuKdG1KEOaVEWnd1EKU2Nimtrx7KYq330KxIVIlGI6UTSVdPNTLqWKbNw1E
         J1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249324; x=1788854124;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DroUy899f8UZcEHvH5hCZ09xwNLqFHtAI/BTIz7Ayzk=;
        b=GFJJdO5VbNhjMD6AAOrYtn+asoPckKsjE3mwldhogBAYaPTNbmC8AcjDOYVpgFto7o
         0/1+wrA4aU63Pi/ZtolJdFym2ShzazmAa/OVISRxhw+ZWkNAm6lgzXVGQ8vTfLExnlol
         dwd41xlXwD2Wah3EHL5RcvMgNSenZOghb9EZ4VJ7erw7Bn5/v3uEo64sl5++n+iUhRKV
         1Arq0xVb8VLG6G9nef8OTb3tTfBAk4orFfmZFnIyHNlmi3gOJ/ydG8iV8x6Ji+eBXE3z
         N63Bm48ZPFjmkzQB2GwKALys+iy96fbutJjxJLfhaKeTZLtaa9PhWgX+T/jeq1+eFgfS
         6P/w==
X-Forwarded-Encrypted: i=1; AHgh+RokcntOjgmCwk+xkrLHl+5yJJJNeJuPvt1Fimu5EGT5eyx1+1wQ4dc7Y5Vht8olQf5DJJvPU01H7OIxv98=@vger.kernel.org
X-Gm-Message-State: AFuF++m9+/u+3Fjuu11Wu4I/jX+h8L2tA539oNCwGD9SRBJAJDY/AWcQ
	I0C2y7egp5mivL9w6a9WG7PSy7cUO/c+m45CmUzy9FFB8TIQ+IVIojMdyqVBTnYH6G+iupPxoYp
	ha42xjGiGMggBQHZbzP/F/+cNEQ6mZfgF8Hd7hwbcF3tKQYMByXsaDte3Yh6RcoSyy24=
X-Gm-Gg: AR+sD119pSQcd/wrbYTePISfQoQlHfhbCXuTQVx27fFGa5reIO6lZAXgcnO+9cWB727
	82adIhAKAYOh6bwXwF5l1yS26746ibehQ5IaXOsHlllm+zto+R2LHnzJyqzs8Ln6LBcpr73VPLp
	82FCzPDvJea2SEinKXpBSI39y3sKHcJfcADNVxrCW5T1LDAt7cH5D5tgZmUbcSfb8BOnchspxnN
	IDfPWyBFIcJ33VQCWDdm02gmnmR23i2jMHjH6zCprXR8EvR1HkSmgNSgi5kcDaj8wf5nQiZTtky
	79sxn30ANLujLqXug3ux+34NU4pjLJ6dYIgfSNhYrRY7HYx/6pm5171nk6uITf7koDtrBiOpCf1
	cB8ihr0VBXr26LliHkcxjchD/0m9twWIlvSEcujTIjB0FWwnmRAF1h+XVmhAEh5soI+GB
X-Received: by 2002:a05:620a:370e:b0:938:61e0:20a7 with SMTP id af79cd13be357-93947f8a679mr853241785a.1.1788249323797;
        Tue, 01 Sep 2026 00:55:23 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:938:61e0:20a7 with SMTP id af79cd13be357-93947f8a679mr853237085a.1.1788249323116;
        Tue, 01 Sep 2026 00:55:23 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391742780fsm970228785a.47.2026.09.01.00.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:55:22 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RESEND v3 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Tue, 01 Sep 2026 15:53:45 +0800
Message-Id: <20260901-sk5jn5-v3-0-17e728917bd4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788249318; l=2657;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=6+LUMqK+QEr1CV332wSeVbOAm5qKQQiCjVjQE8pOF5U=;
 b=vaZMQSWqL8X+N80cMsnNi00UCSXi4a9KnRsH9/IVMA1xzf8+NOkhGWqdUItZ1jsWEIWZ/HyDO
 kkFLTltcjpoCMOp/dtB/RUGGgNQSr0Lc9MQlE/jBjElPOWP59GGNlBQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX7WJ6iQ3nnupR
 QrgWEK22eEtuQ2aDu6YcOPS3JXyIrVl1gOUE3EmC51ZjoheBEKJduakm/8ZlhG/2z1cFy0p5fXR
 xnaYXM2lzwj4zZp+J23ItF7trp4519L3dI4A5Qvxx5MXq2txqsm6cGHJE97u70KONdzw9gMIruj
 tqFHfBujwCtMTNJ1PVXng/262j0zhl6GjNQ0/kSNX+TgV8SgE5eqHeYLJBRIifjazEvStDeqvQl
 cNTzG61VHUc9dg4PmzD4nv/9fH03w6029ZVIN1o3A02UrDaXwSuuOoCWS5VtMVfluL9EHvkPneS
 GEFzAyc4241zcDP/TZFa7XuJ1bgy9lNIDyfOoU/03ElATKYV/JCVGU3Aoon4DghAY+ZtF0tlU9A
 sdLDs8rtZ21521saXBfs2cC13974N8wzs0lzkfJXb41h9H4fHAPBuH33jYhY/5BaXDf8+2WIv9z
 cJ9a3EelJf5iwhaZMww==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a9684ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zxErxWrYDRBdf5X_hk0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2OSBTYWx0ZWRfX1gaPrWa6eAWP
 bBWoqnRijFKStWsnnVTGLrANpH4BAOMXnoOVrx7z3eZwABeTcih6n2D0U+Vt9xHfSHxOx21QG7i
 XruQ0hMqUTWqSFFvl5IZcp0d+JZMGhQ=
X-Proofpoint-ORIG-GUID: 7Ct8HNu14Be6XJhaKVP86bJEqwK8qDI-
X-Proofpoint-GUID: 7Ct8HNu14Be6XJhaKVP86bJEqwK8qDI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010069

This series adds support for the Samsung S5KJN5, a 50 MP 10-bit RAW MIPI
CSI-2 image sensor.

This is implemented as a separate driver rather than extending the existing
s5kjn1 driver. Although both sensors belong to the same family, they are
different parts with different register maps and power supplies.
Combining support for both devices in a single driver would result in very
little shared code while introducing separate initialization and control
paths, so keeping them as independent drivers is cleaner.

Power Supplies:
| Power Rail | S5KJN5 | S5KJN1 |
|------------|--------|--------|
| VDDD       | 1.0 V  | 1.0 V  |
| VDDA       | 2.2 V  | 2.8 V  |
| VDDIO      | 1.8 V  | 1.8 V  |
| VDDIO1p2   | 1.2 V  | -      |
| VDDM       | 1.0 V  | -      |

Tested on the Qualcomm Hawi qrd board.

---
Changes in v3:
- Add vddm-supply to the regulator list.
- Drop GBRG from Kconfig, file header and MODULE_DESCRIPTION. -- Vladimir
- Compute pixel_rate at runtime from the link frequency instead of
  storing it in the mode. -- Vladimir
- Split the init sequence into two tables around the 5 ms delay and
  drop the .delay_us field/handling. -- Vladimir
- Remove unused v4l2_ctrl pointers and the unused <media/v4l2-device.h>.
  -- Vladimir
- Move all control flag setting to the end of s5kjn5_init_controls(). -- Vladimir
- Fix s_ctrl() to apply controls when CONFIG_PM is disabled
  (pm_runtime_get_if_active() returns -EINVAL).
- Use S5KJN5_CHIP_ID in the init sequence; reword the clock-rate error;
  minor style fixes (reverse x-mas tree, ret init).
- Link to v2: https://lore.kernel.org/r/20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com

Changes in v2:
- dt-bindings: drop the "T:" MAINTAINERS entry -- Krzysztof
- Rename vdda2 -> vddio1p2; fix supply descriptions (vddio = 1.8 V VDD18,
  vddio1p2 = 1.2 V VDDIO12) -- Wenmeng
- Link to v1: https://lore.kernel.org/r/20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver

 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  117 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5kjn5.c                         | 2848 ++++++++++++++++++++
 5 files changed, 2984 insertions(+)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


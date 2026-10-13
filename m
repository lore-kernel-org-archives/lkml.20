Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50CC4E533C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889398; cv=none; b=Z2ZbtkYgVQaysPpV7KegG3iotPB3dCz6Ov0FzHkg6O++kLDf7BeMLHXkxc5owNN6z8zgiuzy/QfowIZUvTZdqDPzxR7ZkoQ3OrJk6A+XlNGX2G4cmgYEZlBnD171owkptz4VkPM50zC5JOk41uBHJxRsaE2n3PEjxf2EXiKhQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889398; c=relaxed/simple;
	bh=6H+aGiCzjsBk27LHmns2O/FIfdjtGutwnkI8cppe2iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BEtolzziP4d+4WNkL5elSFeO6ZgdrLQzCGX3FAlRaQ93maT3qRAxVcwDrn/M4SU6nd1NhY7ww2bNdRPzJFXUL02seb/bZoRcrNgQJ2c7U9AiMSm+Rs80zvbM9R5Suo60z+XPM/DCN9IoVuIOeKyuxcF0hUzy+OOESmUpwx7A+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTt9QWb1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyxvyBHA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTt9QWb1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyxvyBHA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CTFf949419
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uvn+YeykKtCQvYU2gbPylW
	MWTN+hqEcgHyy2To2P0bw=; b=JTt9QWb1zHiqYacKGePayq9Htd4fwYdnRmUEHW
	KZeBIKGUQfNjJyrF4JbCIhtuGA6ZMkHuAXDCTdGhuIs05Fwfo7PG9wOd0MYCDgyt
	JlyZLTz3Al788vVJHuZhyy/MhoTL+QZXRfG4lJ7fMh2xIQtFFcySicQA2QldauTZ
	OqjJSNtca4EvkU/UKF93qpBle1lXyk/uMCJ9bw3wJ+mGMZB5iz2yoGNNn/ufJDzp
	OkyXw5ZgqndofMcWQ0rP7ElqMqpIy4gXzwn2O3OoJ+0cZP6PbyuZ9JZBg3dReenD
	2ZuQpkazKCVpRmjUb984ipnaQVgeupwYjaQyra4T8xEf44Bw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6297db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2440392a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889394; x=1792494194; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uvn+YeykKtCQvYU2gbPylWMWTN+hqEcgHyy2To2P0bw=;
        b=WyxvyBHAbeL/yV4CHEDCtfCLH+/bzhslMDhftOqOnW/WKCWz4dGB1bKrXaDYEPPm6I
         fHgUpFc2TguiO0Qz+o1LAOJVPCblr5FFc2TJ7HVwjaaH0AlS6qAhxLlHIfyAHJ5zUNwX
         mWbyyfxkCKalHfE3RmMiNV67N+X2AfJoM+nkX+78K+TUcZMLVkmmjA4hQD2Yg2Clz07Z
         9yu3fueAMmm/ISdHZBOAcpYSfe01zBjACoW/Vpsvbp3C2ikOaPVaJFtL5q1U73ry3lY6
         sxo44Kh0M0Hz5kIKswSN1lABVG0p3UpqRjoBWx6ggyKsPi51XwRrjshGyESdRWQqa9y/
         YQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889394; x=1792494194;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uvn+YeykKtCQvYU2gbPylWMWTN+hqEcgHyy2To2P0bw=;
        b=Xh052g9vUua4/EDAa35x8DQVJy8m8OTk/o+6NjpTLjX3eHR66gi0e3vrv/aH+eJfrt
         /gcjLuAXxdcH6TXZMsL/EpVq1lrI3hvtAcWC7FS/5wQwge8hKgwU3wpARMIF0EWKdJ5W
         5bl6a2aO0kP+hUzd9WCDcpI0zF4ENCJ8hpn/5QdTNx+q9/yTovsAPGY8FikOQ7qYJwkf
         4xIHzzqJDylG1b1p+owmCUds2a3f7eciy++Zhk2aOYX1fsc7EueEWe3cvG2roPnD6nJW
         MGlrbPh7g60y9lndxJvwE3orlOq175mG5VS4NjKg8iTbQbTHirMfOhtT91AzIXA+kjes
         QoxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJv3qBsW7KA2/nZesHss2ddDszTTgNghaet+KreDpHxZ0NSAe56cUjwb70SAaK0RNDO8TVoH39mrYUa9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8hssLv0uW6O66xEnPFmrhLxSi7r8gHs8rDMy4piMg4asuGaRP
	h7V/gkhce79u9vCxqEzxMJ/uCaX2f7x7QxFD8mQ2JCjhPPINP5fBc150RjNtvpWvQ6tNta2oXsa
	fvAaOszkCO8Im7iUXpRgDR6gC5vRMgfwzVjNaWvcxOMZbLivdKGkcooJ2fisM3qHVfu8=
X-Gm-Gg: AYBFou0wyRquF986a8mSezV5pii1cu9iwWowLQOZ527gRsoLu9GOpQ8A+YU2xVo5Zj1
	/+KQARSCTXYPBwN46nxDvKzpsh0eeNS8YO8MyPreUY1TYws4cPy4wmret39SCqUL7Xd+tmTSvm7
	7hatk9e2NcVQDL/S0YJpYu15+QVVdSc/s7vywfJV9CPv9hi9AqlZODbq08ZFJvoq7yttc1mnwGm
	yid/xcgkH31S8IJZTtco6V46+goXZlZgdXEk42Jwd+tf86Y8RnVg7atrjrTNha9dZqAr4+5RMJ9
	NpeuQokjYLYwbMRWtNBedW8DSPD5//mMeMTuf8yorYOmF4MSr8ywa5VIcyYH88mO1HNUNYjG7LM
	IuKx8IbKzuGOlgF/KdiNaMADMfaqUEg0=
X-Received: by 2002:a17:90b:53d0:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ab3ae2c5c6mr10825283a91.55.1791889394378;
        Tue, 13 Oct 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ab3ae2c5c6mr10825240a91.55.1791889393918;
        Tue, 13 Oct 2026 04:03:13 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Add CAMSS support for Qualcomm Hawi and Maili
Date: Tue, 13 Oct 2026 16:32:42 +0530
Message-Id: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIPzmoC/31SQW4bMQz8iuFzNyAlSqRy6j+KHEiKqheI48brp
 C2C/L1ycnIOvQgYScPhkPO23+K8xra/373tz/G6buvpaYL0bbf3gz79jGXtE+8TpAot5eWgv9f
 lqOvjurget22x0p2yAkRP+0n7dY6x/vko+eNh4sO6XU7nvx8Kr3i9/U+xV1xgcTOjFCVTjO+nb
 bt7ftFHPx2Pd/PYP7x/ipzj+WW2e/lU2ptusVw/rZf7HYWlItU6QbfEndm9GCdybVlqdHDGXvJ
 Hv3rxw3R5v6sIMkKFbbQSqSEOaGbB0crQkqtnj9z4lmWZWHsFJy4jQy4GFM6VCQMGWplFShG4Z
 akWDCxeapOeKZVo3FwQxijUqiCL5kr2pcMp0xu0ADMRK6iDEWmA1KZAXBO2SWu3rOv7KJoIfMq
 KEjcyL86eg4qiEM4zvkyj1BgDIBVsQlEtd605J45wjOHdBNtcEN6yXBLymG2YwMicq2ZxspGsT
 lOdy8SZTG9ZOCwD50Y11UpdUERgmhvUfbD3MrOAGeWWxUNZmzfAUTW0k/dxLSEheQbIp1VQ9S8
 ztIqWcK5Ys1UucxjDUNCDYQbOglKjFtFm0N7/AZzZtGsfAwAA
X-Change-ID: 20260923-hawi-maili-camss-b5dc43a00ed2
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=5178;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=6H+aGiCzjsBk27LHmns2O/FIfdjtGutwnkI8cppe2iY=;
 b=KzdVaVmiBW4HGgh7sekITbprntJxsxB2wkFM3FwHc3iD7lN10Ted5B0omNXuJ2QqHG/Y5qYR5
 68vMF88tf1FB8dJZwu01srjlDeLrmICe3kjJP+1cX+o0wz5rgCN5Z4V
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0ff3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX/+ZvnO+v8sv7
 mN38V+8OkNLWvxD6B7z4D7pVZhLx7zOgLyS8hgNyGvj9h3rrbHFNcU53IGCgya+K/cUbnlo3eol
 iWa/14HmvaY4c/A3wr1y5bovwInoP/4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXxAP9mG87ol7B
 a2l560G3n3YYxJhaYMTy0xxYZ758PTyePfWGuAJIadHYcrLYeo1P69O8VKTuOBYW0dpNPAvuG1p
 DBQlVBgI8TPOX7/mXwFqX5b5OH8YS3eSKbNCji9TIFUE39acrazBVylsplR/Q974f59E7zuQftA
 rdzC36CxTQHnKZ/6BaIIyunXEt9rVJyPeM04aiQGy8bPbMjs0YMTJ98D4D9nDa4Wdrv9/YurX7y
 QGWjmD0D0fnq6BfupLZrC9KDiQ7dZ+c6SArpKVV+HF9RA9VYMFN937wooBKzdT1zl8Ec8HI7XQF
 gh3IgoRQPwT8QC2OFP4CSGSMnyrDKjhVq/eqKI4jT1nO46U2fIZ1LpHWJZCW8WNQCcR9nQqtWVw
 hz0wuxC3RFfMH6G/IjPJZaYTMBtfVZww0/OXzKOkfZL6UxqlcLI/bDKDkh6nltnDKoI4rAOma3Y
 UclyxZWHQnpbP9nH0Gg==
X-Proofpoint-GUID: MtC9FaKI-vEeOcr9WmQ6eYUBJnczrKOp
X-Proofpoint-ORIG-GUID: MtC9FaKI-vEeOcr9WmQ6eYUBJnczrKOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

Dependencies
------------
[1] https://lore.kernel.org/all/20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com/ -- Kaanapali CAMSS driver and bindings

Patch grouping
------------
I2C CCI bindings part for maintainer Loic/Robert/Andi (1):
[1] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible

PHY driver part for maintainer Vinod Koul (2):
[2] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
[5] phy: qcom-mipi-csi2: Add Hawi support

CAMSS driver and DTS part for maintainer Bryan O'Donoghue (5):
[3] dt-bindings: media: Add CAMSS device for Hawi
[4] dt-bindings: media: Add CAMSS device for Maili
[6] media: qcom: camss: Add Hawi compatible camss driver
[7] media: qcom: camss: csid: Add support for CSID 1190
[8] media: qcom: camss: vfe: Add support for VFE 1190

---
Changes in v2:
- Not an RFC anymore
- Rebase on next-20261012 and drop the external CSI2 PHY series dependency. 
- Drop DTS patches; they will be posted separately with Maili DTS dependency.
- Collect Reviewed-by from Konrad, Abel, Bryan
- Split CSID and VFE 1190 into individual files rather than in separate
  combined Gen4 files - bod
- Remove reduandant is_lite condition in CAMSS CSID and VFE resources - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Drop the unused reg_update_after_csid_config flag
- Add lane count fallback path for CSID RX configuration
- Add Hawi DPHY support by tuning register table, which prevents
  potential stream stalls and SMMU faults.
- Add a standalone Hawi CSI2 PHY compatible and make Maili fall back to it.
- Resolve conflicts introduced by Glymur in CSI2 PHY binding.
- Link to v1: https://lore.kernel.org/r/20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (6):
      dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
      dt-bindings: media: Add CAMSS device for Hawi
      phy: qcom-mipi-csi2: Add Hawi support
      media: qcom: camss: Add Hawi compatible camss driver
      media: qcom: camss: csid: Add support for CSID 1190
      media: qcom: camss: vfe: Add support for VFE 1190

Nihal Kumar Gupta (2):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi and Maili compatibles
      dt-bindings: media: Add CAMSS device for Maili

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 310 ++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   5 +
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 395 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 200 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 248 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
 14 files changed, 1305 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260923-hawi-maili-camss-b5dc43a00ed2
prerequisite-patch-id: 6108fea87bf95e2911f09bbe7e95fa536c3ce397
prerequisite-patch-id: b347ad60c475f3035b04ec76741e0f1b5f095580
prerequisite-patch-id: aa51e15c5698d3425e979c810ff54968178a364b
prerequisite-patch-id: 660cd909e0bb88b51af7114f0869a0476219a369
prerequisite-patch-id: 4f08f5a240caa58a4794bc5c7c3e45a18415a1e3
prerequisite-patch-id: 56eff00251984e6b3da63327eec1efcdb8194ef1
prerequisite-patch-id: c8217f219b80f3736a38c4bf2b6681d75a3834ba
prerequisite-patch-id: 1fb30739462664d8188801aff4dcf7cd55341318
prerequisite-patch-id: 7fa7a9c901f6aead4cdf94628e83b42c58a0aacb
prerequisite-patch-id: b61b21bf9a3b675479fb181ce7034ebe42949ee9

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


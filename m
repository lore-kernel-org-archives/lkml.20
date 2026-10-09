Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F593A5445
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521410; cv=none; b=iw7Hz6FAnIx2m+tVOjU4HJUSr1SKYb4/aycan6hotd4T6LQpgZcXUfjfPAr7i5BUfXdRy1K/hH3LIort/BttRK86kkTQ/MfnAfI5AhJv6sOOQJpZy/CEYWJNrl+faCvzxZDoQr9VWgL924RmMNk0oHgDXvv4rfDE32QuONSRJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521410; c=relaxed/simple;
	bh=KpZfuXP2BncoUo7N8+dgXrHsboPVdkVVv/WXl4neQGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pV8ddYibQIr9d69+BkXga+WGpeNzi8rysCsYUIjPJa5pBvh9hOXys8B3wXdDpBJ3NrETI0o3kjJxbCzO13l5w9DlbqQYLKizvWmqf8wR5AnjeCI+6lgNPdj9XpWkZldbE2GTqmuroGME+JWETUB616Gxtc+YGX9eTddXGfbLWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ag6VQruv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPaVV+bM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ag6VQruv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPaVV+bM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLrw966514
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dthmHVxL/tRbBtpCCqegSD
	oLuoy6NnyQdhGorTIFVK4=; b=Ag6VQruvl1v+iIKaOa8KA11tEKcBYjzMqUBu+M
	CLog0HeYgj716kbRIT8e49OMY4Cd2z+bjgL9WWEqRnUTVQt39A6Dm98wtMy6uh70
	6L0PmsxgXoNCtC3tjR6RpguAld6lDttlviupVQFsafaDtiO3gQdBJ1smCw5ggu8M
	4c/1RkNNkNgsTsP1f353pfUSiU54cb70JpQaQwp++FwvnY1k/DswXCvbMXjI7KxZ
	rAEo9jJyLTMl8yw7V+FG4pVS/UonL/kkuEqeoY+W57PrSjAncdU2tht4XgsYzMQ5
	DYIKTXaGPBzwE0oO24OFCS/UEMfFO7GoCMWmFjng6EPS/tnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj1w5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:50:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3537eb16c5dso572545eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521407; x=1792126207; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dthmHVxL/tRbBtpCCqegSDoLuoy6NnyQdhGorTIFVK4=;
        b=XPaVV+bMCUfpwnzXjUPn+eTvpg9SvESVzwOg+ZQuWfJX8iFMU/IIGJBC5ahl4d/fLs
         wlM2lVic62yMIWJAL8ApgLiuORw07X6+JLMpMWB5h5ZOX8JEn3F68uVFcfCHPOzjnMC2
         8BdmLLnVbU5TPSGryOoM/a1oCJ0COr0631G4YmQJ0B427U9D+kDd/lDIXjXsO8aUi3O4
         K4RWEtUhXsGd3dYe6aEVJrN2sakE9dq1T/w9c1OnviDvQ6GAenP3AXAt+CTTDYvLfjMG
         PcOfsfDs/GErMY5eHTtZ33WHzwXdCIYVXWmJ5eTLCPBFwlXQZnEHtWzxM/hbnos5Tiew
         iKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521407; x=1792126207;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dthmHVxL/tRbBtpCCqegSDoLuoy6NnyQdhGorTIFVK4=;
        b=fDAPGsd9etsJplQplrfiV2FFzVxf0N6If07ZebMNdoYhZJK0aucujWFkdcHwkmk+0/
         ju1uA8Mp5JLhOdDg2HN255AkKflQKL724YvuVj64BeOH356NVp9ZCAcTSg61wlEgvCb7
         o1DbECBKsuKFAcf3jr2o/gUuvaqmI1UXw9QqN1UAEKYjh1i1yTHV7hjNFxdCq8nvoEVv
         qmtjWw+Hb6OUZo9d+IzIgMag7CjJHXQ1VAJAXnG88LFfvkZR64L0NOqA/EMs2z1+psjX
         7FdkUZUJIyHrROMf4HKU7IYqeonSmSMutxm6qvL1E3m3JuYXbPS4wBZZwv0+tGlcRZpt
         87xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLAWwveS7zU46IbF4xkXffg6F6CKHTlujmLnyxZH4vEJS5NBo5BTFcgSnyyey0l9yyQG5LFboQ9VEzAYU=@vger.kernel.org
X-Gm-Message-State: AFuF++m9IY4808CYL5skxn/dICOl49ILdqfBu5qI03wVroYVJhu2J7mr
	CLwN8ZqaJ4J/0XUci4BMiRtj+F3+wIgmRDd0sO9zvOvUc/5y+MCcZvRk+nJFMV6Tr7ximhAlU+M
	IBt/AM8v49ZnrPIy/X4AOxYqoflYzSl4Z6zidQdLq8X3nFV1xlWIH9dN6g/tbaAJQ59o=
X-Gm-Gg: AYBFou1Cti1PR7ID6n16hsDtrBvDnywjB5HG3YEemGpSrlNElLP1xIq+TGfJ34uhz4P
	s4NU8OM1AETjnCT40rrdkMNyskGhTEnGO+nJmbR5Sixo+wFO7PoXeID3hTCHJkdCpNQ4vd+piGw
	X1jIZW69GGQbjQHkYOn+UHb3yaRocO622rj2FIzmK2gNd/o9jxNY27ts+nZpeVna9494c0VHyeF
	acpfeXqTg+HXhBdvj3ttFbx7yn8XXe2em3wHBVkZlqSRU0e/tV+cXFlU7gTB0XI619oSZjZycgI
	XLUfBxqRxu9AVU4tVE6PLSzAjbNldPufHLW85QQlRzo9tz2SVoZdBp3DfSZfdK45A6VTHmcYKnW
	eCB6yxJsPMZQ5uxyqrX1T3E2MrQvIbdhuxM1WhjrBpD86wuj7Mpqx4ZnsP+AbdI17MD5EHqBIO4
	q+g2MaLr4CI/AUKQWCXqDkJYie538knQ==
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id a92af1059eb24-16a61a6def5mr1248989c88.26.1791521406564;
        Thu, 08 Oct 2026 21:50:06 -0700 (PDT)
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id a92af1059eb24-16a61a6def5mr1248951c88.26.1791521406019;
        Thu, 08 Oct 2026 21:50:06 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:05 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add support for USB phys in IPQ9650
Date: Fri, 09 Oct 2026 10:19:54 +0530
Message-Id: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJyyGoC/3XPTW7DIBAF4KtYrEs0DD+xs+o9qi4Aj2ukxk6MY
 yWKfPdinLRZ1BukQXzvDXcWaQgU2aG4s4GmEEPfpcG8Fcy3tvsiHuo0MwQ0UCLwU3vjxiiqNXn
 ACll6eRqoCdec8vG5zgOdLylsXC+Zs5G474/HMB6Kjq4jXwIFQMkW0IY49sMtbzGJLB6FKhdOg
 gNHva9NaSUKcO99jLvzxX4vmbt05JgJ/2gFYqWYqPeVrLGRTrhmg8oX+myViUJZ0t4R+MbaDap
 +afqQXqlK1IHySqAk7+QG1a/UrFQvCzuqpARrlKr+ofM8/wAH2NZGugEAAA==
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8727f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: qDMSfqabJbyFidcD7eTK3f_Xtka6V06a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX2RtgO0+tb/pt
 VAA/aVWI5mH7lUdTZ3iFLd0sjV1iHO7dBTdzsGkvutpjywtwwpcyJeFjfzZXVaO0mC4+cL5JBd0
 dPsfGeXKuSSgWbSJJvAkjUD1CC7JIYT42T99l+x7vvRGRPJsjWbVRvyZGzpYUBtwfd16NzF7ZLL
 5RrVaYIqMsykTng+mVNC1hP2WikjBr3WtPVwczqRAFyIKiKml7RxPNNKIksAF00SITf8RKWNvHT
 6VswjIb63Tyef81soEQekLwW7GlTHnreG0QD2TpP5qLU/KL/rPqOClIRKYool5CYIswGfvgmqXZ
 6RICAh7b5ZAe504gi+YhMdS5sG+gSv5OLFmgPw9TRJUqOYsdSiC/Y+vGFsks5WMs0JgtClaGAm7
 WpC012GWA5bTHjEjU0NADnlfyvW4m+v7EaeoRGjYx3X+GCw1/VONTWOfYa52OGjlXxuoW6cAhMR
 p/AG2nGnCGIDeiKAS3g==
X-Proofpoint-GUID: qDMSfqabJbyFidcD7eTK3f_Xtka6V06a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX+WvWEhaTKqe8
 OamEX4rwbb6vBDiKBoyJoj4waMP2L8G09GOXa/dWi8EaJ7aofBViy4c1QEUQ3E/ngOCQ9XutVBx
 0HnKWTzQuJNzqEC1mjAa+1Eyrb8fQQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090019

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v6:
- #include <linux/bitfield.h> in drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
  to avoid build breaks in other (non arm64) architectures
- Link to v5: https://lore.kernel.org/r/20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com

Changes in v5:
- Use FIELD_PREP_CONST to define FSEL_24MHZ
- Change commit subject to 'Fix order of arguments to qcom_snps_hsphy_write_mask'
- Use data->{pre,post}_tuning in qcom_snps_hsphy_init() instead of a temporary
  local variable
- Pick R-b from Dmitry for two patches
- Link to v4: https://lore.kernel.org/r/20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com

Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix order of arguments to qcom_snps_hsphy_write_mask
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 194 ++++++++++++++++-----
 4 files changed, 269 insertions(+), 47 deletions(-)
---
base-commit: ed06cc88c5e644da0f1ef397a836c7b1c10f41ac
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


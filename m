Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8F36EA98
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209147; cv=none; b=pEMiVkGqCJWW87ZPDLuLFFlH9F8W1yxXL8xEilZXkww4QOsfj6K6yKxb7d7tOzJAlc/vxYrP9kgalxQX0TA0EZCYLZ+lEBE2iwEYfEmDfo+Mq7oo3q4GWDd/sqWIM2/LjXTmXq4wGklrcEDOzFhikh2tZzTAbCvCKq9eAfzbXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209147; c=relaxed/simple;
	bh=sO1KrEv86EVrexKpLzli8BENnpzHRBMlT5dgGwO99zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kAL6Erk6rrA0af1YLYZJAaV5nfRIWxulO8GHIihXwXdczVVC0zC8jCWHoOg2YGig78f1VB967k2bSeKeIA9YoIVj4gm0qwjMVJjYSw6W0kmcuCY3oxwnN43C3rR0yNvXIokb/iQWrpr1UUY+BMBTQAYffOL78bjfUTNCbygO5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojNTjD1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NisK2WHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojNTjD1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NisK2WHl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3kCLq3164936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIux
	Z8xIIUp8=; b=ojNTjD1lWAhwpNYmTK3sIScjHNZQ+nvdvpJ4lUy78oG5qzz47Xa
	Vfxb1oaxZX28Yk/Kw8IEeN/e3cg4OCweUYV+HpDhB1jLq8gN9LfifFjheC8uP+RR
	FJFDwOmNMdGXhyT22dvjXP8g9OrGHFsyeiH2lxBYs1vM+waYgt8Nl35Gsk9m2MMW
	CYAPckIeuav+j29fgFY0LY9ra3J6CnbuUS+5H5Qv8zL0v5UJMOxT/cArl0WpQrR5
	ED/aV3gjlc0skQ3rBZHqArsBLl9rCgThcbbUWblaizP3wyyktQtJ7YmZxbmD+EDq
	0lrx2bNOsvYg45QisMMyoomXvpsQv2u0apw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7r0d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-17dc865c94cso169601c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209144; x=1792813944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=NisK2WHl1W5axzkvlMEyCfIq+P81D+O93lR6myKTNectMTdxoplsA7QJGQVY7A4WA9
         6cic19y3iB9OLClHl5R8eO8uaDH57c7xDZK4lkrsV8QArW3V5ttYbKRNOQ1y9IHRBnfp
         u53a+cqlyzGEeeFGcUea5qBcgI82vX24LIKvR465K/8lePKnChyX+7ZOFZ6LFWpB3OQA
         +Ayg1urDcTDXoCaeNIeXY7xbVO9GA9jEf+24CdGnZjVggE4GtgmgdSEQNRwBK80i9H6L
         t9tDgFFyjWrDeaNEb6fMUB9QUOe6RA1BIr+JItanB1GeAshqQQlfVE9SfwxBQx0Q32sm
         rbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209144; x=1792813944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=gMg3vHyBKTfM7Ef2KJrzV9YWs4Ke8ilOuJ5ouJkdacHDaXYrc1fZLaX4htRw/GfV9k
         3EiU21ix4eo1o+qnxRsWOWA+gf97GGJGfZ0QbtyprrKCeEZfKVcAYy5Tqc/Axxr+76oV
         J8lJyKE0CEWPNYpHEwEX+s9nbAeErRCvkXHWkqU7ydyixKxJNgkP1PDqa9YiaW/B+yMK
         322ZPtUNqsJTeiPCGDKovy+xQZ+TclhtIuaqVarR4SCCtuIDc4xNPMWqws6UEjzH/nMc
         lUZzYzik2qlhb0l/+VJmcKE7DI1mFCgzp57fCePq9suFwNvk+rVyd5f/2kUxD4RRQD22
         RD6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/T9x8/qTABxcmOFyjslHazEf/syfnHgqWiCFv/yF5XE1O6df2g9VDxTkAenoS85Nm2ISHw0q0MhnnuKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLOkFEDrU8Rwrj3+p9omMjyTmA8dsS8iKunzJPcW+oaGSO/Lyy
	ERt+B1a347s4GpkXZ/SYcXLmzTgJhNNosUlM1OIH9nvml1h3J29qOzUv1E3M0FCLNcLYrDHWfRe
	Wkva49Sy5PyWtnWKwOslEEpGUY0LgtmsGRGAUXViq88kk8poxG/db3CXh/rNHlryCNbw=
X-Gm-Gg: AYBFou2s45gd9yjqVexAStf6thxPZAvuY9nNNGm4U2scbZ10Yc2/kIENDZOGvv1Gpto
	wokqpk3KMGrj8T4vWh853IXEoR/tfwLL6W+GQCB65w7sebCfpu4riIrySszEJdDzwEgFhVvWHtC
	t6+tdJgq2VcNyfQnDiUMTPbxlY8VUdaoxG7jTfW2zQUuzB7HWZYIkHTccy2Pxd3eQn5Z1M2YmQy
	XH2jrykZQPQkxpjnMLNTv9LD3q1tJPEYqAtC9DyLZr96wwmPKqFP6wEM7wLGHv6/TVzONdVmz4w
	YD5nn/IIegXT3CgI134B7laR61vBy/CrqQWKdAfIQdBgm9AjonVA7Pk88FszBfdMMmXYN10NeTL
	tkQ3a2hy1vpUlN6gE9K3VnysvNHyKFAwOMNhSvMA2Yl5vXyxH01gOJQ==
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609844c88.4.1792209144027;
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609810c88.4.1792209143415;
        Fri, 16 Oct 2026 20:52:23 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:22 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/2] media: qcom: camss: track PHY type and scale link frequency for C-PHY
Date: Fri, 16 Oct 2026 20:52:19 -0700
Message-Id: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX/DyZO5uXFR4S
 8bWY/uj8Qsr7i2BA17j4dVpQhBEuH8AH5NAuASR0Y9xKBIn+IA/IgtCgYJtolCfwe+YjZMGB1yE
 NIb0GFBGI8yBhWuSSLKIKw3snpurZnY=
X-Proofpoint-ORIG-GUID: 8Yp5VP0O3BLCHyp1kVsHzNm_6x5MVIsi
X-Proofpoint-GUID: 8Yp5VP0O3BLCHyp1kVsHzNm_6x5MVIsi
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad2f0f9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FUmL66orSvod6niQ26UA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX4K66RYP0enpR
 ffIRjtPBEO2Q/BC377rigwoXuGDj9Ty4+sTSCEHk7c7+Z0ojTJQigLu864UdzjEtO6k3Aq6MsXW
 kyF8GIlPrVO6saj2HU/0qaJSLZrOf9ME2ZoqJVA9O8WO9DOkJ9o4PQllWc12Ce9VpetO36iUwJC
 gKXMZtCuXWmGV68rqVzSd0PwsIoWY1tIGN3p8p4ay9aLhosvlvOTmq/iNcBO4oW3gGsEnFzb6Jd
 3QArM3EFD/DLWiKFD2aQ5T8SFmnjBZ36AP1G6ICdeaLuX2cM9IGNJ26NxU71vW7aVjadoXAuwWS
 MgRFDZX3z2Nagewh0VOsoYNllk0shZwMcTKijOnrMP8VsNEUA+2znl9IMdqaZHxydz2hqm/eAt2
 E53fDbavPOezoRVKJW+Wxd/qfsY3cG5VE0J2FIvGKjGWJbPD5FdDGbIkMnVf5JqF84u8SQLb6l2
 6A+kwmAcG2dorUvcIrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170015

This series lays the CAMSS-side groundwork for MIPI C-PHY sensors.

Patch 1 records whether a CSIPHY endpoint is D-PHY or C-PHY from its
device-tree bus-type property (instead of rejecting anything that
isn't D-PHY), storing it in struct csiphy_lanes_cfg.

Patch 2 threads that PHY type through to link-frequency calculation:
camss_get_link_freq() gains a cphy parameter and scales its per-lane
divisor to match C-PHY's 16-bits-per-7-symbols encoding (vs. D-PHY's
1 bit/symbol), and the CSID gen3 RX front-end's CSI2_RX_CFG0 register
is programmed with the matching PHY_TYPE_SEL bit so C-PHY streams are
actually decoded as C-PHY instead of silently defaulting to D-PHY.

Referenced using David's C-PHY support(v9)
Link: https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/
Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

David Heidelberg (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency
  
Anusha Arun Nandi (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency

 .../platform/qcom/camss/camss-csid-gen3.c     |  2 ++
 .../media/platform/qcom/camss/camss-csid.c    |  4 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  1 +
 .../media/platform/qcom/camss/camss-csiphy.c  |  8 +++---
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
 drivers/media/platform/qcom/camss/camss.c     | 25 +++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 7 files changed, 34 insertions(+), 10 deletions(-)


Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1


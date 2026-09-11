Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E22453A28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112072; cv=none; b=jIrdZF8R0yH6e1UhRw+P1RlG7TLkTTinsMFNGHwEGRMaSOcbbL5SaZQhtFUW36DHZQRofZhc20IsoOaGGEWjGK+2s9vOg4d6rpoFVEkzCv6Bxj+k5P62NlSzPPEGSBBvCbd37Hrkv6M0FVhBiA1SUsU602fL5zrTrwW4CZfy7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112072; c=relaxed/simple;
	bh=/XV4B/ajZbMtzz75c2d90DGyrSxX/X4ZyRUZt/hQ2UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H4tL/DRUorW+Il0d8eetiNZzxE2s5L3+vWp6B5b29vC7AODx7+XWMA2RKerrQcddeGe34ItO9lkef/YUfmPRSUtGRf/6AuLjyTw5P6d/wi0D74IcSsoQfPS2u5SvxYxh5dWoTXOKTJieQ1Aq0Epdvan1ttasiLvu4uN7JYtSSzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2eChdZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuFafCik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2eChdZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuFafCik"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kJnO2175545
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5
	tIIoGheA=; b=U2eChdZI4measUgiayoO7aIxmlc5D7onlACYoSWpmfuuJMAdOmG
	s3CAHxiG3NLop1T9LhRTzuucmj/vrjTjrdkWYL9Uj+So4g2aiBAZPvoyVZnOxEuQ
	Tdd3BMjVO3n2ChRiQv5VeT2mI1HfcnG/oMMrSqSN/sE2MmB8eklGLC75W0yDanSL
	k6/KjywU+nco8X+eUGHXaRUKP2iOf+cKmkCtb8xjEN/pvvy0vSJ7Y0xzn69eTufb
	zSbShNOnfW3yiML6l3rM2Qi0GShj25KBftUatGbK5cgfODaF+qoI+062wS5kXXLG
	XyzNmBZRWJO34vApv2v6fawYmUtyxToxGqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uch9jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:34:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1104205a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112066; x=1789716866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=BuFafCik+Gbo7qLQyhageFIiXjda+NBZGwQ2A/EQqI4ohG70hQTjLrxqY4MmtRlRPc
         iHPWSMBwUi3rb6INK0aX7EYS2UukrVeGltVwhw6K1kbT7RxPdD32zNggghrk6wBZieYP
         HVHoWCf3MpM0jMyOxxHhzQYP5kCdOJSsbUfwL4/9ZUSS63TT6SJ0zkXrfsFmcPp2Fp7W
         ncy45PvMfdlmEymoN22q6gypiw+e5mX65JLfQ0+hCLt0yzmSft9cuVrEKrgfRTCk+71U
         BiQdMGxpigCo+PJ3DuX/ghk34CZJHMEEV5pNGhZHsLuLuxaPd5dK1viP8bVQMA3Qbovr
         inyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112066; x=1789716866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZWIut35apgwu/A34S2lk9HsAvN9vo1ftL5tIIoGheA=;
        b=K6bDhP/OqDNKk5YwU1fPHZPe4qFZuR/n8FtQZqu4oZmVxoVRgObxtk6dJt+4g2Zx01
         Eg+UelmlTQsCy6XSd/Ie1XK/ZC1DWNVgogMHlqvt+MZVU6Fx2qtvuwWgO1a3Z9bwIo26
         G5OPORfrILqxYRKGlcSUcAsyDOD4ExGZcRkItYhFixG0Oqnjw90mwSI4wQz7cFmgvrS9
         xRe065VtTG5idWyjX/ntSHB2Cu+m2CC0X1aTozT7P5X/aJA+kMTBO4fie0uXFlIBF3Q3
         myiJmMVCDhhMk2qWlXjTFW/FBfLrdUh47BwnxCeyZH667IvUfEXLV/HT2tXJ4sLpVmZw
         i2Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwyMcjCUVrYn8SM8zrz3orTvMPVKKXex+d5998xm5YdiGQ8slfBerZDma10fzQVQFXey8n8KAaIvj5X5qc=@vger.kernel.org
X-Gm-Message-State: AFuF++mt7X+kRquRgVPjqF/Re1aF3Qtaz3eQT03lmQQ2A1nuaqVcjcXG
	HalXN1BsnNWw4OcwDMcFKiTjx+ihIMX0Cb9TyScL80wPs4Yo19zASqTQ7TP9w2g9DtUTpU25JEN
	pyhT4oaBbJW0MgkQS2fsQJetdRHbHfG0QV35L8Mdrz3GQxkS8r+8psrrgiXMfjx6o42g=
X-Gm-Gg: AYBFou12OtRGdXesWbH6VFf58FoplXnl7n2i44yiIulw+GH89IRifLlGJNqC7cWu8g4
	731OD35zWk89Nf4Iw+74ob7RwXgzOidAcoGZ2CVErpPXcgDtyIMNO19sdJU18Z8bwMSQc9XEJk5
	4ZXd2xN6jTkTz1yDS5KdrIe/77FCLnVprV66JDq4P9kVVh33V/XVOm+J6Zn1/jGubtEOI9npxqg
	hgyzcB8PlXf6aR57diGISMGdoEP0g6YqPzcpaTHVWII9oo1tGONJypoevx+XyoMKeM5Y/TJ1qR1
	JOR/6g1uRcmJeVAC7DtIM5Nbc2uYZGlmu1iKPmCXZ/Tz6Zi+UNHDxTrXD7jY1vQkK+pg8sTMX/N
	Ek0yTItLVFFnCKK+NourmayrGA7vz8qLQI6mNPbfQThdbSi6wRFI3VqNQeHFb
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177684a91.20.1789112066303;
        Fri, 11 Sep 2026 00:34:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39d9c22e224mr5177632a91.20.1789112065734;
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 RESEND 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Fri, 11 Sep 2026 15:34:12 +0800
Message-ID: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3af03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Sth0529Ve8dJX5Jf890A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX+IPKCw7NvRMX
 0Gj5Qz7DEMW2oNVYbkxdz+Md/ZzInM5pRZ+fMUD4t/qlOy33m2jDIKsVu9UTk7zQ425PJ8ZC4US
 ojMt0zbcoAWusJfSG4rbMqLfhImLy1mBEgSHO8GtZeyFsRfDmwGFpSlDNLpqb/qNDy2/rNTpLuM
 lI5848NApLjBzFu+HUFzSQj+PbZKtbSfZDbFl79/5/XU5OGsM8bWfCwvU23VuDN7zR6UXKd5AS1
 6hnkPRUpNPVOhTo/Da9DwT64yBarA8aPVw//repU1RUwky+aajzYch3+oacAuofqIJ+xNuAY3of
 dY/zT47HbowcxEpdfRH3/+1DOh2JEs1Bdah3icRX8J8LK+Qj9DMA9QiwvhrOykjZ+For3oCtCjI
 YZh9qsm+S5cVIGyDwt9/mORq+/baXoTMNN7PciMaowgpnXsS8Yj+ZpuKuHhVg7HFp2kl9VviRVc
 /2Mz+RB4vCYWR6u4D+w==
X-Proofpoint-GUID: af0Q297A34Yj74o7vVi1p2ycGAh8nM3S
X-Proofpoint-ORIG-GUID: af0Q297A34Yj74o7vVi1p2ycGAh8nM3S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfXyadjfLL1AP7p
 VDxZz1UeHDkJGp5c1JkKAidVeT24edOn9Lrgchogw99rtlCXxbxcqC8UQoCEL7l5CA+Auf8KB5W
 30927JqY/Ak2XuniA6Tg5YvwKJEMT5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110104

[ Resend to drop v1 Link tag from both patches ]

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 580 ++++++++++++++++++
 4 files changed, 750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156C43F787E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826996; cv=none; b=JEwIKTq2l8gmg2Hw5+xxzW+1Vpj/1E96SawBVPkDoWllu3OEEU0TirZccKh5FeGf0X4TWpJhatMuYb6PleG9JwQn4tAntMmev5YdvxfdMJtJx4jeS9vSfthFcWdSa/bgptwDA7Dnllk0n51tGBqSSsZWoikTb2MRJ+ma07yjDcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826996; c=relaxed/simple;
	bh=R8NdFiTTELsNPWU5Kfh3V0If350yDqkrd80DIpjhzBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7di2biaq7UNlUfb7baqx8EyyvG5LdJetzikQgTz4s3axYiqj14kTmKivV3US4hjNgTABFOB7uj2b4SNxPnYVIvbgQeAOWH5L1KUt60dx+B4g4DeL6FgHQRG5gIZ7pW/46iZpzm+w0pEvuvBOAIhrXnSTPJd2D3w3PUTlTrEQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOgPKaVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmIieSEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOgPKaVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmIieSEK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9H7vO3654639
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLC
	z/BedGoQ=; b=OOgPKaVkAxVfVboRi0fJHNcCevK5jbr/9SFhmGMyWJacehZ6gRk
	gUr4t88ttFd6jyicMhKxFv7LvqeztWMGst4sK72y6hX9z190lNyyCQ5/FtZ8LV9U
	nv1RPHc2bjDldsooc7eyPWIHMQgVGxZP+6vx8F8+UWWqD+Y9hwL8+7XeMmOyn523
	ZxgGF6QNdJD2iZ8cdwBYJ6kYy1drfQDVBTFM1dV56yuwSgIjiQKzbLVXWeXZeSGz
	MqZuwLIBBG9tYWXkYCiRAECerrMTPqMN1hTpkadlHLZ5KUWDEJkz2PjmwqsK4jJa
	2exqHdD+qhwnVox+yKLDrwYtiNewA2Tq6Kg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075cgq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:36:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso8074725ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787826993; x=1788431793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLCz/BedGoQ=;
        b=VmIieSEKbPzwWKawSNnGX/I0sf1ZRwzyGOr7oD4XS0YZzive235W0bSXkihTgvCUUa
         uS+BrCq+7tvdTnp5JIBfSyA9gnCQHfkPIYr6e7ZGWMVhsTdUu5SBTfMS2R4BvIn6y0aF
         W44sPzPTmcUrColLLMExaz8gwjwQKe3sjPVP87nHPbmyCwjZcdWV6Chmq4ZmOSLw9rBo
         pHpklruhG3ztBQpqk+VjxGY9XWQ5vkJerOsxKFSL0vQl1fxE8tx08RyxZ8DmmnrcKnUp
         k6pMpQ3ONpyhwA9ndttOzY+vaIyQeA/gGfwx2G3O7sh1ll8x2VjF0jNYuLSAFZtyw6m7
         OIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826993; x=1788431793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49BmMEhz3FqoDnV6VvO1AkxNDAyy7o57JLCz/BedGoQ=;
        b=ILyA8AtYpTcgwGdHIzChq5EeLZt4n6LmLTuv6qES/TaPvFAvZl6u7xsBtuRr7j3/mR
         xCyuMv6uBY30BJApLlqJODT78ZAS8f6aVwrX0YNRVhHXQuM3qy6w1TH/jfkPiQDxpSef
         ykpZTLRp4nz9KzDQjyMjapEXwO41vwgZJXEH/8bFNiSTBkCMB5tgO0Fo5uPUI8X0oNBq
         nF39KnV0oKIrD88ETmPQsyLFyyutSBth4N+rWBXjy+2AT+SULhDqbdVvNt3ZUdQE1pAi
         lsrSSpD+Ygpc9XVqgiBz71gtSv7AOK5JBj+PrBBVZWcrRJHki1xz4mRiH/htCKBJr3g+
         nfag==
X-Forwarded-Encrypted: i=1; AHgh+RoJKXfYdAJWIdZBQCJ3a/4mx8PU2/0edmwLl41RShbRkIoyJCP1GWmt4zgfXfn/Xllp4jCMBpKPUKJgywU=@vger.kernel.org
X-Gm-Message-State: AFuF++lAlWu7T+q4P8vSik/J1h9aA98reRt3kwSZVOkfHxhEbqfU3R2v
	fGl4KJHJniJU3s6CfIFb2ILrPLIsIYhFluRZ3E/8pP3O8NDHZ+Irnr0fT1oPjc768T9u4AmAQRA
	jXBw9N8eMAzcOLGo2FX9IPacjOSpJS1G7iwr8Aj0skednzTAsgT6P+gehIEAhj4WyTGI=
X-Gm-Gg: AR+sD133gj+w90oYs/VMYY/uhSqgUErVdnGY1PhxV/JsOhrxQ3HIpu5DgZ3i2nt/cmc
	RVK6iKYa5prmgPvMzoW6LMb/3onXe57631VBY3fwMjy12BOoIRCwCzYtAgpynDUgVzhPbLSAdP9
	jQsgl5Pf2DRAYav9FpaoH/hNv8ZVwAo0jEu0tiVW2QxfA7g1WdRdFSWPSRkslZPxbph+4RO7EiI
	N2eU/hXQEocj/nwOLA+Dwwbc40LeDwxAYxXR1wKQtHxukxpgp+3oy+xdq4+g3OAp/aq27QYX8Tu
	MKParAkvgxT5I+kccaBniwhGzewXxeVlqov8taewUOdYOPP24Q6TcRibVNiBu/eDZXOaF+HYG9k
	KFHCwR2oEx96nLiEabexm/bNpk5byBYLMeD4IVo3M8/x3D2IgJ1ka+I4FCQHc
X-Received: by 2002:a17:903:46c5:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d707a5d142mr256847165ad.8.1787826992835;
        Thu, 27 Aug 2026 03:36:32 -0700 (PDT)
X-Received: by 2002:a17:903:46c5:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d707a5d142mr256846265ad.8.1787826992414;
        Thu, 27 Aug 2026 03:36:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9e5fb1sm29831430eec.25.2026.08.27.03.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:36:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER namespace
Date: Thu, 27 Aug 2026 18:35:55 +0800
Message-ID: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vg2rICNUzUgCEMbmM5y11Smm5BIMc074
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA4OCBTYWx0ZWRfX4nuinzz7hRmM
 4XCkpoMPR0ZFggO0orbWFNGz7rwr1fx4xZjqMO7fpEH2OJzYn6FKF5BY1UZ6nHGa7CNt+c2anXI
 KAh5JgUhDALsaMbLfm0US+5HQZB35SpXgJgltTZExdCXSQYypzNBMnVZkK9sC4gg6QNnUWvhsyA
 yGgXsuwkBKXbls2fbaR9vo5i0EnhRGoA2PRFNR7tKDguWgTog15LIQAL31YzQbWug1HOZ82NtEY
 2+jkjclRMBlrDlBGySuLjmAjqlndotPM8A237HMfmqAU47SzFHfGSiU9tuWep7PcikM00UM35wB
 3BUKHNkyHIHBla6LmIj/W4vwD1wyZFkP3j2LbMYd+5pPKmdpYqhgF/zgXlrblb4QxHzEHo+zmOM
 qMDseoXTOi6/Sb2qSzjYXOlHrmPoIPf1Tx6KDWDIapTzfRupHaq72uScZyJiC6X4o1gbBaY1gSF
 IGWorK/RR7ZwkIqDxZw==
X-Proofpoint-GUID: vg2rICNUzUgCEMbmM5y11Smm5BIMc074
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA4OCBTYWx0ZWRfX1Vwa3Ifw6tFK
 A9WrsaU5ENWg40hCGsW28AsBSQTgM3dkDvlEsBH28B3K18YCsyPW7pfc5dDLZpjwJC0d75Xpo3d
 2/+OIhPHya/BWKyXLeg8wHWzYgEWNTw=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a901331 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4ZI4452vc5jSn75PgjkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270088

The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
so consumers must import it explicitly.  Without it modpost fails on
'iio_read_channel_processed' and 'devm_iio_channel_get':

  ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
  symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
  does not import it.

Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
index 0492d5eeca01..012eb2a5f31f 100644
--- a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
+++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
@@ -252,5 +252,6 @@ static struct platform_driver mbg_tm_driver = {
 };
 module_platform_driver(mbg_tm_driver);
 
+MODULE_IMPORT_NS("IIO_CONSUMER");
 MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


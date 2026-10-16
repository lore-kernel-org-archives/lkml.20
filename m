Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0CE38C423
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162174; cv=none; b=cRAFTUZ/69CxLaV/JB/XPqQ9AXcY4k7jEKdR/WZYAB4rNtVCs9YoY3XZRp+VI0sF1H4GO6FMJoWPdMIyKeJmdXaIR7CTcR36xvSPeCAUx19QSEcv44qlNtHbl8rbKTnN396TFXZR3tSz3RU2cYQjgEOdHrdnhgTx1sS5m9ggWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162174; c=relaxed/simple;
	bh=mt6FGyeK6jNbyz8QINMUDKHFZqEo2IFd7o4zHGRB+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXhFcBglpGAcypuU7h+S1iSsKE4KkEma4fCOWac0DyeDcLRZjJ0LFvvV1oIE4yYeK+aSM/5HnB+1qR0AtS7IHSGBug/HliiFg4rZtNcgz3x+NSFwsGu6aBru9p2ARr0hGTOC0sn+6QpcNfuMOyJEU0B9FQyPx9lK/BwHCJDMy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBnPaGm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU9Auhb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBnPaGm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU9Auhb7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5iu13506084
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx
	40Tj+jmU=; b=kBnPaGm+OpskkpHZN+gV/cEt1lamF0/R+H2DsKtc07jsMW8qBGa
	PKsRglq0VX2xT/2RlnBDcy3vRglHzoWCIF/xTXYpDR6gGm18t/RjVjaU/OG0+E/V
	fp1ftOpyEl6SgT5f98QMd/cLe04lkla30rG6mZs7Tizhwo4kmvZ9085Ac6odFhQ+
	HqmRGwIWnEXo8ukS9GcUyn7PRV0Zovi7D8+isLCHdkJbu/XZMagPEZ4S5sBQuOxh
	e3WO6OvJGEF68PU5UEsPjFurkBh+u7Bn3AyZmeY4mSmbfa5AIeYB3v8HsuD3yi6K
	GXxsDk+wgV2AQ9WrMqjz2N341AnWyQTur3Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r132fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so8051768c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162171; x=1792766971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=iU9Auhb7rcZtKYqPwuKZLLhjjJJV9CMWdHBrDe+HTdIgc9W4Z/9hU1vpt/uku0djVL
         njwvDNNpDJpjUVmwoRGDXQqWttShBh4kgpKrOZQJPbtaxXpHjlEPKAbfJbz3yEzmTpTh
         HCWPs7rUZmtWi1xSDsqISkAxneOUodj0EGsd9UzDbWerX/4pYm8PARceOZ0d6jDiNtPL
         NuJz46LcmOfje1ggvNddYWSU/4xydO1THvCweC42SL5huS+InIwEm1/6Jyyj3dNGIIub
         T+pHnc9SJqTAY1UAA4bKVU6inYP79c4zvLVskzyucPcR669N8lbU//wJ307FJyQSmUqS
         7m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162171; x=1792766971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FunvRqBJexNhP4K0lBIttu/jyrOh3lBtwcx40Tj+jmU=;
        b=ubE3KwBaDDP2l2exRNtVylI52Kmftu6gEvDEH9l/jbBNszJunw8jOjBVQgU0oh4u59
         c9MPv9yrI28AlC5uFYLnTmsXpOeAZRAnKVoXxs7YKatD26n6n36g0z7+17b4fp7A0GL0
         KKAzYmTwuiVCOIJj4rrdj+b8YgWNgGRbUARyCgqBYxDiOjBN1MGJCcPLO/jf8cLHe/2T
         ueItsCLOJQawNXT1BMeZuewiJvHnyjBpUMx2SRnleVwlgDHzrmOpzDZF86loz7cVD4UP
         ydYUg4jmO+JQben/wCK4R6UukyqLzQiX8WhV7aaJe3l9Uvt20xvHDqKYFi2yp1rlmjOe
         i5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHIj259ey8B6YlEPHThfka6cJf25/lNfb/1WMjPPrgnmaOFbczKELtZATfHQ18R8HXHMvjvG6P/l8sIwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoYXWLvWjwOWbodhP0bq49aHpaUWXFjRpU7hdpt0KcyMvkZ5kH
	iEzllBANFDUbeUFP9weAGNWMmOIZTfbEKzbNuSoObXHW5i6O4UDN9Vw7DXeRba8ZyzjaQpMHKQc
	wlxxSa6NfoFX8NIITJER8BUxO8ag0UDbFQHgtNBR6aVu+BCKMUH11cRDMxoRhwOs4vSM=
X-Gm-Gg: AYBFou06K1k1JF8vND/YQP9Poc9nrtYSY9TFHWySbaPqjPwVX3pccvIScEtVQZoEJ3U
	gQtNI3GoYmxfQU6yZ/wTDS0cKUWAcXLmb8F+o+Sefo5NkKGVnIEVaeg+4CAvm1RcJU0MNCNJGA5
	lP2+TQDKhvvH8MY8R8se48Y3Ow/LfGudpPGw3hVBZA9ENlwnoA1JLD0IkXTit3//tZ5nM2w48B3
	eeV12ighfQKfe/WwQazqXVuWYWCWKkn/GLu35qQdiA46kXKQLB92BLQCd1o0MkW2YrF1iZG0lSn
	QoCK2fE1k+HYqtOsT+dRBRFefV2zz00+aN1lSGZetr1360EhuxOn3UyGMq8ycFOY/uhsyKjOMv9
	XKlW+SnJVXHo6vSgd2A76wHtP+GxTk+CYa10o/3DTMQsH/qoe6xIz2FLj5fQ=
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162347c88.28.1792162171259;
        Fri, 16 Oct 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8b:b0:16c:6459:35b1 with SMTP id a92af1059eb24-1851310977dmr162327c88.28.1792162170523;
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] gpio: shared-proxy: Fix line accounting
Date: Fri, 16 Oct 2026 22:49:17 +0800
Message-ID: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -X6Zbdv1CIvjn3iDWvGHWxdcwWyvRf2f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXwKRer0c3Ff2f
 5e5V2cn76aC7OStp/qba/T/9lRs7xVpGI5ZxfgmXDKdpQUXcxNgB4tkXI3kJRRpjEtbD7cZm+IY
 e5oBu10IAnfUkz7ZcEm5phJXLicAGS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX8N16dkpRfxCz
 zynnFafHmfAfvOQ6b0emTcwMsUW89l75r5iqbZV/P+7nuq+Q/JfOKeK9C5aMOBbP168CgUJxDAZ
 TkpTDrqnvdTJd5T+fgRv7EgvzAWFmn1sShFibBZu+GtcKK4Aoh8dnFp0OYjU+snqGA6q6nRVSaL
 12nEbYvJ5r5MhFUQUWIRqosyfI5WE6E/Wx25o2Ayvb4eyoJpNANoq3b8fjNpdWCEqAbMzMuP6Ur
 I8pQy+/4Mhyg2GZrq1HN06HRXdfWA7yGneKIZDN8YrXr/F8WNZilc/F7o8daGhZLGwBPuuteDNb
 nmTGv1oC6elgH5ef3ZM4W09k9Yg127dITTq/D1VoGI3RIU33+Ykw8U+QK9BUXxuLqPOFfr3MDqJ
 FAAd10yAb3MOJhSa2rkmSWITHbcXyzUpZwFmyp7dhqoyR3xAGQLpGpRsIcZgoByF5jbEAH5Wvo0
 s4lrdITWjkCgJAE+NwQ==
X-Proofpoint-GUID: -X6Zbdv1CIvjn3iDWvGHWxdcwWyvRf2f
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad2397c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7bmC88ccGREFj9ZXeh8A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

Two fixes for the shared GPIO proxy's accounting of users and votes.

Patch 1 fixes a race between consumers that request a shared line
concurrently. Each of them sees usecnt > 1, assumes another user has
already configured the line, and fails with -EPERM. On Nord RRD this
intermittently leaves both DAC supply regulators without their enable
GPIO.

Patch 2 fixes a stale vote left behind when a proxy releases the line
and restoring the default value fails. The line stays at the
non-default value for the remaining users, and votecnt can underflow
when the line is requested again.

Changes in v2:
- Patch 1: Also use gpio_shared_proxy_may_init() instead of
  usecnt > 1 in set_config, so concurrent first users no longer skip
  the hardware config or log a spurious conflict (Sashiko)
- Patch 2: New. Fix the votecnt underflow on a failed write in free.
  It predates patch 1 (Sashiko)
- Link to v1: https://lore.kernel.org/all/20261015122740.971792-1-shengchao.guo@oss.qualcomm.com

Shawn Guo (2):
  gpio: shared-proxy: Fix race between concurrent first users
  gpio: shared-proxy: Drop the vote of a released proxy on write failure

 drivers/gpio/gpio-shared-proxy.c | 80 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 71 insertions(+), 10 deletions(-)

-- 
2.43.0


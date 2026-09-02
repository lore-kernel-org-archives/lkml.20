Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9838E5EF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380217; cv=none; b=lGrNo8movjnAd68Zuxkj5KyyNab4icRURQ06UKDP7b3YOQ9byyRnjrkv677tVsGDFF/C2f/S5pF+rEyyA3RIoW5yn1Bx9421qrnF5zzwccUq1+S79lKcqeeXypCdx4cU9x9tXhdDWQrZmWAgcuDJmA34zuBwX/l+sNNk3gszw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380217; c=relaxed/simple;
	bh=5hzLQzPg3Siq2sAjeVrPq1UVjrMV+4INkOiCvhmskWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8svCUrXcajLLTjgOKw8csAFQ/AueHyriTqBM9DInE8CLdA1f3KTZJzqOfivzGkOwqgBTqcFWse9Ym9S3yuls+nLFNri4vn1XwpwginXQo+F2f9DKCka25AgZFDejVn9B3fAVZPtngYXqPFzaqP9yGc81OCH0M6xBmb2+7JOfgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPo3DI7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NduUpLpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPo3DI7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NduUpLpP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrgnE2484327
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohah
	T+j6al9s=; b=WPo3DI7A9bAW4tlVrg0bqu4V+styJyUGUWS5W2JZCHN1MQPiTEi
	B/GveQ3mT/MrXBHqngiJvivPBht8vzfcWMVEe4SKqmIWxL6trNRvOAqeBCQxa9Cr
	CWxC7O6PRXcoIuZHFmx9f3HHaBfZ14Fm6UC9YMn3bMaA2GNvqkFiKTdYJzVrn8z0
	hJOGd1ybUsWB3nmQ5aLfFb0YTMEd1iqn7U0jVHt4/SGXznL8v5A7BR7nOU0B/Gyh
	gwvi2r+y7o9EnlAP8R003zg6xp9/l3tKssS7AOrIDul135GXM5UYereiVFD5t9Xu
	q6VoVNFAk528wRFtBLUFlQ4ltt5gNafAp0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9q7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:16:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2556511a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380213; x=1788985013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=NduUpLpP3hiFhWl5/xufGzmagfO64FiC7zKZjeAkedMJ4k3gOs5txqOqf0Pe2kkmZL
         RzYAfqjbeFFoxHTVfyRQQp75tDWLXDahU6DW+mf4iFCtA5lrw5CwfJg5x6lKIomiX/mj
         GxhilI7P0tolWg16zW+kEEBZjPrTnbCqmym3E9HqlL5GNTxq0cpPj71g00cGB4ckXufj
         75UH3q45KbXgufy0w0ItLyl5ggfuFBp0IXX6wcARPGGrF4WJ3H64/irmjBbTsVKI9APp
         orzL0LixF4tk6se3hLjNQFvgrkO/epfbrwfTHeJc201PNohsvqkCjs6tDbyMGXK+n6E+
         9/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380213; x=1788985013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=mI+kvjvGahfQXeYDHcrWszNPZ+msDl8bMCBqsx37a2cqUiLUnmeHa1Lz7/ZAVAQXM7
         nI4eoMm6Vsm5UHPxoj7NseQW0NwD6yNxG9vfEzMPj977Ny4wLXsgdIZC63xdaJxr0+G9
         318HlQGYY3uvf/46wFBR0mGPp8JeZGB6ywbpxSORt7+08xqrqdUzFG3uoEqjQHCOcBKV
         2QLHoh0bcR9m3C0xyP557Mvr4N51DuzjARbUHfd3vF2esYTOfua+itY46TS0M5CkvM/L
         Dm+MrNxWEjt4mwrqkrs6kfVW4NeG3sf2YxvRR0f7/YYfnyYPasF0/fwSIRVLetxRUIaP
         cOpQ==
X-Forwarded-Encrypted: i=1; AKwUvByKJHf6WuZ3vICotv0re5dtZTWpLnDTFKYWCw9P3dfszBSw+oxJUKqyuPk2DUaFsNGVQ1P+r2s7qNetH2M=@vger.kernel.org
X-Gm-Message-State: AFuF++lnA0EWQ8SECccMF7TMV03+LvPgZyxYpeHk8azRGu6tnltk7pHY
	vsmbHoJn86YUG1E3I//aOW8LAs4y7TrknaUnar9MDqVkyqiG0zhS7s0kzyewbEq3yMywrBZ4M20
	cZcxOFCzCOu5LdCrFHsuPAcm668do/XLrSniE8MQI3mNE6mK29UKmUwRiZD/cWSZC44g=
X-Gm-Gg: AYBFou3D71JS1m4KUEvQRSExWmPzCpDuF9WvNl1mqGkHvCUefoaRgzwj1DeBw6vaVzw
	+429t84szkioxBrNwpgBC62uerzWvSUA5Y01zAOMw+yqka1vxayQ2YPGXwBUM32UraIYKY7Ymdx
	qnxPxjbJdTg2Nt7JrfdLayaXmxaaU4oDluIOzTh0Hi/+tvQufdxgBek8WxnZC/KFZF3HA7ebJHY
	vvQ+6QDj1AcxjkYSId7ZYmAET0R9sWntzkcjgvawVteGmN01LgYkTt3O4yX9T4dgnA2ETJXArCZ
	Es2EegK9LbQaZCI7JH9awH2w20oez5rkriice9N7XCcwL/FPyN8fVYYQ7cvFLf7umOngNOIg37l
	ku65r/yjb0lwmcTRPtrM9ejJ+ULM=
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11956206a91.1.1788380213358;
        Wed, 02 Sep 2026 13:16:53 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11955961a91.1.1788380211806;
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/11] drm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:29 +0530
Message-ID: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QeqkIVQ0UK4IOBDlieYBER6oHFU_hxQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5FZBuIsFQnqI
 /joxWUggqA17qGlNLnHPfe43EL5HmQHzBBNx00qTgiV4zSCfltCSwAxR5WtzNQD3pTkcHbN2fbF
 dSBbpTpgNC3O/iqptoZ+gW9ecdOoRekwBF+7YSUnc5OpeD58ivtjm2CDvsi2AYzYlppSERZa1Wu
 1nyYU5g/JEkLcmxq5Tj+A+1mw3ClnkTknMpyPABrOgxgojVC8h5Tnnu3VeY+U7kAKcFW6OiPF/V
 sTqZDfDOZE4ncEqa9aR/dyWhEaL0uYctOJWPjoK3jhNF2CU69pdx7rA4/HvYMt/KCpVgLo2igIn
 Sms8APeO6i8SmePrcBui/pkT8mZzequnFXP/XWUkgdeSNGCzUivBTCbIM0rob3B6rN7tTr3TPks
 +51nSkaUPofIkCe0HpaPE+RxBqqPAcpAHSqPpqV1nS516VWANgzy4UZNZreh8yCpdUAVTALRwXM
 qp42LMbxoorCtUGhBsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX/aMoUnBD3F0q
 uJJwXNqdbSXkb/2E67FJ3UddMaV6RC7EvP1MlTYjjxFb5IDogITUK3AQLZoJX7yJoPUm+65qS35
 wuzy2usM1g7Jyp0a+n9hWhAoYO+zDKg=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988436 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZq82LKI3H6k8voUjgcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: QeqkIVQ0UK4IOBDlieYBER6oHFU_hxQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Several DRM drivers manually manage reserved memory lifetime by pairing
of_reserved_mem_device_init() with an explicit of_reserved_mem_device_release()
in the remove or unbind path. Missing the release on any error path between
the two calls leaks the region for the lifetime of the driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
DRM drivers to use it.

Note for drivers using the component framework (hdlcd, malidp, sun4i): the
previous code called of_reserved_mem_device_release() explicitly in the
component unbind callback. After conversion, the release happens at device
removal (devm teardown) rather than at component unbind. For standard CMA
or system heap reserved memory, this is benign. Drivers relying on custom
rmem->ops with meaningful release-time side effects may need to retain an
explicit release in unbind; those cases are not known to exist for the
drivers converted here.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (11):
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()

 drivers/gpu/drm/logicvc/logicvc_drm.c             | 21 ++++++++-------------
 drivers/gpu/drm/arm/hdlcd_drv.c                   |  6 +-----
 drivers/gpu/drm/pl111/pl111_drv.c                 |  4 +---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +---
 drivers/gpu/drm/arm/malidp_drv.c                  |  4 +---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 13 +------------
 drivers/gpu/drm/kmb/kmb_drv.c                     | 12 ++----------
 drivers/gpu/drm/sun4i/sun4i_drv.c                 |  4 +---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c               |  4 +---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                     |  2 +-
 11 files changed, 14 insertions(+), 76 deletions(-)

--
2.34.1

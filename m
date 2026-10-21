Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569459;
	b=RGs14OByLKjMQcZ0zgdAkgEcIo6J6HXHg9HoWqPrOgbj6FuLUXKviR614WG1UhR9Apvb
	 O7ED4TB+FXnpwPyYwJ8xPHQbOlQDjS/H4Cac2Zn2p7cPDAJy6x/szHDuNbNcYoYOJFP2C
	 VE5V83x6T+44BuodI8iN/XrdTiLpkfg3YXCFlImjhte66G6G2A8ihwT6352bfQbwEf1wk
	 qdgHKsEhPJBHMfe8bcSEaBek4o6Ly4YXumqA3hF5rOdcT9ZY6HvanPfELCq7QqzxM6cbc
	 A4kN//35Le+bzem+wX3JRUwPSir4aAlGUR3gZ+Htcp2DIzg/iPlaROTNFb9/V/YCR7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=880T14uGC3fw8iVLPzVZ05j0YuwypU0/k1MJiq3qWrY=;
	b=WRj8ktrzmwTeNNn4oVjNlBqlj4WnXZa0lAlLmjCxj0Ti+wOLKCWkNXWYOF9if38Z0axg
	 0Zg/SGHKWhLm9T1horJd03IjZvhe/knAXzfmy2rnfVMO+LZD0AAjcgnuP957/QbTuivJc
	 BDSLcK4d9quuyRxb2quLbwO6kMlJEvXdpetDCRAmDknUMcbkOgXG98GDsd+Ms1Gig8Uv3
	 OkiMA3Pa2YHzWRR1bjsm4AjQR1j8gEmV+qq6c8XkJOqk3aLlblePOkZUyK4DTPALoT39O
	 K0/U/ivWtxr1gBE/cJoQxAoN8ONnvV5VUo0Fj3iqylFYztX4ZGCdcqAZMh+f7dolmQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjodwT9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NG1OVR71;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjodwT9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NG1OVR71
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2pq3926475
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=880T14uGC3fw8iVLPzVZ05
	j0YuwypU0/k1MJiq3qWrY=; b=hjodwT9xo6rq2Pm1USRXY7XD7TOZQPoAT02iS3
	3/CBV75BOYssKxVT/hQm8ahHH6jsq78yIWtrgVIx4ADJoDYnmV3DxWjtbEP4mCa8
	NcjzLfUiLtROyOARzk9JRLt1xFYyRGMZBOSlcOssenum/GTFxGPM4YuD/qwIg9n6
	4SLsisQlFy5SQtnBF4HxJizesNppLZR7BuKy1rHwW0eGXKEa8x9nsgYAmtkRvRQD
	XRmkQvEmf0p0Om1R7S0bP9KJw1eQPax6mn7ZnbsEhiCgUDWsQ/UvrQNm7leYW9WD
	dYTtX4LL262LAhfp1bB7SA8z66ybv8lFTkZMWBiMw+iSuivA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2c8c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:57:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36803927a49so235958eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569457; x=1793174257; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=880T14uGC3fw8iVLPzVZ05j0YuwypU0/k1MJiq3qWrY=;
        b=NG1OVR71rmOjc5rVs3vuHwN5rEDZRqGhR7nYexIyeqJ54/kyV79Am1L1ZwVd0CRTVx
         n1zNjirZMn71BUJBi5g/zfs6QmnQkR8FZ1d0ErBlDR7+vNKBob1lGouAYuLvFz/nDIL1
         lmuNlE36R7oMDQog1iY2r1w7AxG+4s7YW83RWxuMwPFpjVnHrUEUAQWN2bSv8BQQCEfc
         0ZCdeCuTaG5nC7b45mzhrTWrEfmoz4fe9l2QIH5gFb7f3ig7usV4ymKv/cy0BFFGpp/y
         xJhDp7yDvX+ZYVulLJ7etpU7RWzb9TgD0BxlhzQ54A1tKT8mIogp4byjotOumICsf37E
         wx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569457; x=1793174257;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=880T14uGC3fw8iVLPzVZ05j0YuwypU0/k1MJiq3qWrY=;
        b=2BDrEMIxBJQKJulTxTbm/YsvUug/eWoebeS8cWq86gbmIplBkz4tQwhAsr+I86Oibk
         ktnS8/y2AWdwtvAc+ysRMZq9WC/E5O2CDuKSdmpPtSc3dgcWfBKxp4mgJ6082hnJxZLX
         OUudTdoKdArYSMDPa7OVKBayWTEZa/SCoT/s3eY1R5s3wSWOCmnqUWHM2/GsQk08qihm
         eRF11lp+5osSZVwIj+RpFK2MhysuawbW7tpWsfktV9lGhegJXNqh7HhwHfNwVzF5XGem
         0T2F9eO7diA+5Ug82IHk7UewkGC/qGSgsJ2S9zTb9zjSUzTZfFD23GRyqFlmPKH5mO27
         HsYg==
X-Forwarded-Encrypted: i=1; AKwUvBymTALsrc6j91gTxsopkvLGnyi8ARVgGsHf4QlxdrWAmAp4H6++7if7XnTpvDGfoqaaVvmVJRKUtmplB5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN3NujkuoUg1C/OqhlR123lS4HR/CNd4Y1TwJvpdE0H3uvGTC3
	NNJMlan/1bNBUZJJvz3DQeQ+TL3BP/2J8S9lHm1U7LzeHiAsa3/0PV6lV5e4Th21A3lvo4SP/rg
	/3ccWuatAaom2urZeiW8Pum1wCJ+yumHu+megQMAlzjOHhjtH7geXnLbFxPycE+BKrcA=
X-Gm-Gg: AYBFou32HV0zdwEf6hEDC/MFLaleYlyNWaPAEHMwrvDPCEl+ewrz4nYvuhHsOv+AFPt
	8ih2YWjdY6qTDsdwlCzvJOW3LtbS00doBbE5fX4xYwE1XTz74YLvMQZwiNrDG+ct0WvVBRytx2H
	yrDpn9KULukyglvnNcJNXtkCfj09U4pet64X7wA4JL3mmFMupWDEOR/CfsOfmUSrQzGCiIHQMtN
	IFnjkkCgTUWQ8qcfsIte8ydd82LjrLQn+lBP4vYGYBUsSOd+5Dk7Jks+H71v9JYe5FXo202zgqR
	/bXyl7KobsgxLa9Oxh7aWOWFwTsRh3Tr+VU6wLZh4LPYl40SvWwHCw+hkH+bBDNSrdwsgoBN2Xq
	Gtqp1kLTKghel8UJmgpP/7GRZ
X-Received: by 2002:a05:7301:dd86:b0:351:f762:a10c with SMTP id 5a478bee46e88-36748671653mr2186232eec.0.1792569456610;
        Wed, 21 Oct 2026 00:57:36 -0700 (PDT)
X-Received: by 2002:a05:7301:dd86:b0:351:f762:a10c with SMTP id 5a478bee46e88-36748671653mr2186178eec.0.1792569455819;
        Wed, 21 Oct 2026 00:57:35 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm10244209eec.26.2026.10.21.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:57:35 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Subject: [PATCH v18 0/2] Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI
 driver
Date: Wed, 21 Oct 2026 13:27:17 +0530
Message-Id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF1w2GoC/3XS20oDMRAG4FeRXLslM5OjV76HeJGjXWm7utsuS
 um7m61Cs8VACCRMvvwkc2ZTGvs0saeHMxvT3E/9cCgLMI8PLGzd4S11fSwbDDkqrrnpdkerAEI
 36y5nrTxG8FlmVg58jCn3X1ft5fV3PZ38ewrHRVgqtv10HMbv63WzXur+YFA1XAbvtJTkQGiSO
 TwP07T5PLldGPb7TZnY4s+mEnAVbTZF8NEhKJ9dJt0Q7E0wXKwEWwQSSE4rI1WkhgC8JtYhgBc
 jJcsdkIoGXcuAysB1DIDF8MJpG7y0uvUWgDfDclobWAwrQET05KOKLYNqw64NKoZLAUkIQxply
 xCVAXc5RDEkCS/Ica0UtgxZG3JtyGIYk22yZHRyvmXc2gv4/b8s/QXJlL5FjxnsP8blcvkBSSV
 cCx4DAAA=
X-Change-ID: 20260708-lt9611c-v7-ff76b2d1bf5f
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Sunyun Yang <syyang@lontium.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792569448; l=13964;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=g9efHyv/UoLb7vjNB3FsmL+sm2j7eKPSBhzbHe765Bw=;
 b=eHkGT0bEWequqgv0HZCViG0DJWUUTGkjEW7OAd5rL0+ij56MDXzuFWYB34RtzkJby9SUH0BYK
 IUCITPjBMb/AhAd8PZD+FWm+p1r6irTQUGmgfn35ayLavBm6xgg10cN
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-GUID: y3dVwobPaUS0zpms3aIvz_CN4pqroluJ
X-Proofpoint-ORIG-GUID: y3dVwobPaUS0zpms3aIvz_CN4pqroluJ
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87071 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=e5mUnYsNAAAA:8 a=xlFse1U23dwzZpx4usUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=RuZk68QooNbwfxovefhk:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0v9ee6P6jlxq
 tGwtHaIgClxNxTW9ub1i5RBHyLe1GbExRZKj2RtCjGQNTu4p83hIzhrMz0MJoFy5d/9NidZAF9O
 BjgQckP6Qzl9NSn3/SHO/vnbXqfxV4I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX/9ZMDTB41AhF
 4L5wzmXEaGtUeIqZyamA0UAdLapd36As+b0x8ZXsfW9g5kbNUjbg321HaRiEecc4kHLDPH2mTLv
 /9LqbDl0cUzpFgHTz5y2JGl4xxzmgcdRAfR6y1DvylTYz8e4nDL21X1PiOVfwSOa8QSq3VUm4hu
 JIPggs4ml0hMLGIWuxp3MY0UYabW9vAmsdWbLskmohcHC2cppPeDdvBqDIPuFmoJ7QiKZo5iw0U
 G5F3t+1ccgFQbLulHBojLkw1Z+5P88FSdcaqHfs1Y5/lwOyL7FT8QVT3CVNtwWACzbKLgJ+zm7v
 S3H0YVTfnCSwfDWOIrbE9X045PHh3lkfGc/nnYiqhKnsSv9mC9nFhrSxumcoB7Ew58hFZ1vC66q
 4+2sjwb5vU/Dx5ymZXoYDpVJmN00lxdya9Cm6Fy0B0BfZnf994wqsAijh1vsHETMyisSQ/aPAy6
 nlJcGVQS3jyTic1OKzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

This series introduces:
  - A device tree binding YAML file describing the hardware
  - A new DRM bridge driver implementing the basic functionality

  LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
  mipi dsi and output hdmi, differences in hardware features:
  - LT9611C: supports 1-port mipi dsi to hdmi 1.4
  - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
  - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0

Changes in v18:
- Fix commit message: add hardware feature list and driver capabilities
  description that was missing.
- Rename lt9611c_wren/lt9611c_wrdi to lt9611c_wr_enable/lt9611c_wr_disable
  for clarity.
- Replace heap allocation for CRC with incremental computation over
  fw->data followed by padding bytes, avoiding a full FW_SIZE buffer.
- Use total_size instead of FW_SIZE - 1 in lt9611c_write_crc call.
- Make total_size const.
- Improve HPD delay comment: explain 200 ms is empirically required for
  MCU debounce after interrupt.
- Use ARRAY_SIZE() instead of hardcoded 2 in devm_regulator_bulk_get.
- Move guard(mutex) in lt9611c_video_setup to just before the MCU command
  instead of before timing struct setup.
- Add NULL check in firmware_store and firmware_show to guard against
  access before i2c_set_clientdata() is called in probe.
- Add inline comments for MCU register addresses 0xe085.
- Fix double blank line in lt9611c_read_write_flow.
- Link to v17: https://lore.kernel.org/lkml/20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com/

Changes in v17:
- Add dual DSI port enable: introduce lt9611c_dual_port_enable() which
  sends the MCU command to enable dual DSI input mode on LT9611UXD/EX
  chips. Called from lt9611c_bridge_atomic_enable() after video_setup
  when two DSI hosts are connected. Add bool dual_dsi to struct lt9611c,
  set at parse_dt when secondary DSI port is found.
- Link to v16: https://lore.kernel.org/lkml/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v16:
- Fix interrupt clear sequence: write BIT(0) to assert clear then 0x00
  to deassert, instead of writing irq_status & ~BIT(0) which could
  inadvertently toggle other pending interrupt bits
- Fix suspend error recovery path: add msleep(400) before re-enabling
  IRQ after reset GPIO deassert, matching the delay in lt9611c_reset()
  to allow MCU to initialize before interrupts are enabled
- Link to v15: https://lore.kernel.org/all/20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com/

Changes in v15:
- Fix firmware flash corruption: poll for flash WIP (write-in-progress)
  bit to clear after each lt9611c_sram_to_flash() call in both
  lt9611c_write_data() and lt9611c_write_crc(), preventing SRAM from
  being overwritten while the SPI flash controller is still programming
- Fix missing infoframe flush during modeset: call
  drm_atomic_helper_connector_hdmi_update_infoframes() at the end of
  lt9611c_bridge_atomic_enable() to ensure AVI and other infoframes are
  transmitted after video setup
- Fix data race on fw_version: annotate concurrent read in
  firmware_show() with READ_ONCE and write in firmware_store() with
  WRITE_ONCE
- Link to v14: https://lore.kernel.org/dri-devel/20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com/

Changes in v14:
- Fix device node leak: redirect GPIO and regulator init failure paths
  to err_put_nodes label instead of returning directly, ensuring
  dsi0_node and dsi1_node are always released via of_node_put()
- Link to v13: https://lore.kernel.org/dri-devel/20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com/

Changes in v13:
- Fix double-free of dsi0_node/dsi1_node: remove __free(device_node) which
  is prohibited when mixed with goto; use explicit of_node_put in all exit
  paths
- Fix const and named initializers for i2c_device_id table
- Link to v12: https://lore.kernel.org/lkml/20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com/

Changes in v12:
- Fix audio deadlock in lt9611c_hdmi_audio_prepare: release mcu_lock before
  calling drm_atomic_helper_connector_hdmi_update_audio_infoframe which
  re-enters the driver via lt9611c_hdmi_write_audio_infoframe
- Move lock acquisition from lt9611c_write_infoframe/lt9611c_clear_infoframe
  helpers to individual bridge callbacks; add lockdep_assert_held in helpers
- Remove unused includes: platform_device.h, drm_drv.h, drm_print.h, drm_of.h,
  unaligned.h
- Remove DRM_PANEL_BRIDGE from Kconfig (unused)
- Fix copyright: (c) -> (C) for Qualcomm line
- Remove dsi0_node, dsi1_node, dsi0, dsi1 from struct lt9611c; make them
  local to probe using __free(device_node) and local dsi pointer
- Replace chip_type/max_tmds_rate fields with single cdata pointer in struct
- Fix sysfs NULL dereference race: move i2c_set_clientdata to top of probe
- Fix concurrent crc8_populate_msb: move to module_init
- Fix i2c_device_id: remove vendor prefix (was a workaround for NULL driver_data)
- Replace timing_data byte array with named struct using __be16 fields
- Rename page to npages in lt9611c_write_data
- Move loop-local variables inside loop in lt9611c_write_data
- Add DRM_BRIDGE_ATTACH_NO_CONNECTOR check in bridge_attach
- Use sizeof(timing_data) instead of ARRAY_SIZE
- Move regulator_bulk_enable inside lt9611c_regulator_init
- Various nits: comment spacing, blank lines, variable initialization
- Link to v11: https://lore.kernel.org/dri-devel/20260824-lt9611c-v7-v11-0-eb4a79cb597c@oss.qualcomm.com/

Changes in v11:
- Fix firmware path: use "Lontium/lt9611c_fw.bin" to match linux-firmware layout
- Link to v10: https://lore.kernel.org/dri-devel/20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com/

Changes in v10:
- Fix lt9611c_block_erase: check return value of read_poll_timeout to avoid writing to un-erased flash
- Fix NULL dereference: check i2c_get_match_data() return value before dereferencing
- Fix irq handler: return IRQ_NONE when BIT(0) is not set
- Fix devm_drm_bridge_add: check and propagate error return
- Fix use-after-free in remove: call disable_irq() before cancel_work_sync()
- Fix bridge/regulator ordering in remove: use drm_bridge_add/drm_bridge_remove explicitly so bridge is unregistered before regulators are disabled
- Promote firmware upgrade success log from dev_dbg to dev_info
- Link to v9: https://lore.kernel.org/lkml/20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com/

Changes in v9:
- Use regmap_bulk_write for 4-byte header write in read_write_flow
- Replace while(1) loop with read_poll_timeout in lt9611c_block_erase; read_flash_reg_status now returns unsigned int
- Fix unchecked regmap_read in lt9611c_upgrade_result; return -EIO on CRC mismatch
- Add struct lt9611c_chip_data with chip_type and max_tmds_rate; fix i2c_device_id table driver_data to use chip data pointers
- Use put_unaligned_be16() to replace manual high/low byte splits in lt9611c_video_setup
- Extract lt9611c_write_infoframe() and lt9611c_clear_infoframe() helpers; consolidate 6 infoframe functions into 2 helpers
- Remove lt9611c_hdmi_audio_startup and its bridge_funcs entry
- Remove hpd_enable callback from bridge_funcs
- Fix scoped_guard(mutex) deadlock in audio_prepare: release lock before calling drm_atomic_helper_connector_hdmi_update_audio_infoframe()
- Fix probe order: lt9611c_reset() before enable_irq()
- Fix remove(): remove disable_irq() (IRQ is devm_request_threaded_irq-managed)
- Fix bridge_suspend() unwind: on regulator_bulk_disable failure, de-assert reset and re-enable IRQ
- Move devm_drm_bridge_add to after both DSI attaches; remove cancel_work_sync from err_remove_bridge label
- Move request_firmware outside mcu_lock in lt9611c_firmware_upgrade; lock only wraps hardware access
- Re-read lt9611c->fw_version after successful firmware_store upgrade
- Rename ocm_lock to mcu_lock throughout
- Use goto err_put_dsi1 to eliminate duplicate DSI cleanup in probe error path
- Fix mcu_lock comment to correctly describe what it protects
- dt-binding: add if:then: block to disallow port@1 when compatible is lontium,lt9611c
- Rename sysfs ABI doc to sysfs-driver-lontium; rename sysfs attribute from lt9611c_firmware to firmware
- Kconfig: add I2C to depends on to satisfy REGMAP_I2C dependency
- Link to v8: https://lore.kernel.org/lkml/20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com/

  Changes in v8:
  - Refactor lt9611c_read_write_flow() to take a struct lt9611c_cmd parameter with an embedded struct lt9611c_cmd_hdr (func,
  type, seq, sep) and optional data payload, eliminating raw byte arrays at call sites
  - Add LT9611C_CMD_HDR_SIZE, LT9611C_EDID_BUF_SIZE constants to replace magic numbers
  - Use container_of_const() in bridge_to_lt9611c_const()
  - Remove obvious /*read only*/ comment
  - Use unsigned long cast instead of uintptr_t for chip type initialization
  - Replace memset + memcpy with memcpy + memset for CRC buffer preparation
  - Add ABI documentation for lt9611c_firmware sysfs attribute
  - Fix Kconfig help text to proper prose within line limits
  - Add disable_irq() before cancel_work_sync() in lt9611c_remove()
  - Add cancel_work_sync() in lt9611c_bridge_suspend()
  - Inline lt9611c_gpio_init() into probe
  - Use of_drm_get_bridge_by_endpoint() instead of drm_of_find_panel_or_bridge() + drm_bridge_get()
  - Return error if LT9611C (single DSI only) is configured with dual DSI in device tree
  - Move HPD status read_write_flow call from IRQ handler to lt9611c_hpd_work workqueue
  - Removed second lt9611_reset call from probe as not needed
  - Add struct lt9611c_rsp symmetric to struct lt9611c_cmd — both embed struct lt9611c_cmd_hdr
  - Link to v7: https://lore.kernel.org/lkml/20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com/

  Changes in v7:
  - Use i2c_get_match_data() for chip type initialization
  - Implement hdmi_write_hdmi_infoframe/hdmi_clear_hdmi_infoframe
  - Use drm_atomic_commit in bridge callbacks
  - Removing redundant lt9611c_reset() call and cleanup in probe error
    path
  - Populate bridge.vendor and bridge.product
  - implement hpd_enable callback
  - fix DT parsing and bridge refcount
  - Removed pre_enable and post_disable callbacks, it was affecting hpd
    as regulator was disabled
  - Changed reset gpio enablement and lt9611c_reset api.
  - Link to v6: https://lore.kernel.org/all/20260508134009.4582-1-syyang@lontium.com/

  Changes in v6:
  - dt-binding:
   1. sorted the compatible list alphabetically.                     [Dmitry]
  - Link to v5: https://lore.kernel.org/lkml/20260507024214.97708-1-syyang@lontium.com/

  Changes in v5:
  - drm/bridge:
   1. use #define FW_FILE "Lontium/lt9611c_fw.bin" to match linux-firmware    [Dmitry]
   2. add atomic state management
  - Link to v4: https://lore.kernel.org/lkml/20260506095100.78998-1-syyang@lontium.com/

  Changes in v4:
  - dt-binding:
   1. fix commit message                                                    [Krzysztof]
  - drm/bridge:
   1. use lt9611c_fw.bin                                                     [Dmitry]
   3. use enum lt9611_chip_type
   4. remove *fw from the lt9611c struct
   5. use read_poll_timeout and -ETIMEDOUT
   6. replace mutex_lock with guard(mutex) in some places
   7. switch to ARRAY_SIZE instead of specifying lengths directly
   8. use dev_err_probe
   9. add clear functions for AVI and audio infoframes
   10. add DRM_BRIDGE_OP_HDMI and remove .hpd_notify
   11. replace "GPL v2" with "GPL"
  - Link to v3: https://lore.kernel.org/lkml/20260420061644.1251070-1-syyang@lontium.com/

  Changes in v3:
  - dt-binding:
   1. lt9611c(ex/uxd) content merged into lontium,lt9611.yaml
  - drm/bridge:
   1. Drop the licence text, only use SPDX header
   2. Sort the headers
   3. Use library functions for crc8
   4. Use paged writes as implemented for LT9611C(EX/UXD)
   5. Use HDMI audio helpers
   6. Replace devm_kzalloc with devm_drm_bridge_alloc
   7. Remove extra kthread
  - Link to v1: https://lore.kernel.org/lkml/20250903123825.1721443-1-syyang@lontium.com/

  Changes in v2:
   1. Forget modify code, operation error, Please disregard this submit.

  Changes in v1:
  - dt-binding:
   1. Submit the first version of the code.
  - drm/bridge:
   1. Submit the first version of the code.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sunyun Yang (2):
      dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
      drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

 Documentation/ABI/testing/sysfs-lontium-firmware   |   10 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |   18 +-
 drivers/gpu/drm/bridge/Kconfig                     |   17 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 1361 ++++++++++++++++++++
 5 files changed, 1405 insertions(+), 2 deletions(-)
---
base-commit: ebdae09876325cb00da572d82ded6c7253c409fa
change-id: 20260708-lt9611c-v7-ff76b2d1bf5f

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>


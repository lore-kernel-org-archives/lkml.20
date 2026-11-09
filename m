Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205646;
	b=iohrBDKTllw6WeGDj006xFBhOP2zxfArKk/jHalWoPWeAxDKd6lwq2LnOeLAv/SZJO0k
	 bqjuhBjOWzaDasYk32Sq7nCpIQ8PkhZe/8WFjYAS90LW+4UTxZDidS3z923nJ00tR9CJo
	 V8E0MiArNNj04XhfxPjxLKXvgV3R4wM+KqJmfeT8lWFJ82c8FtZxOC/nr5wpvs/ETprqx
	 3Ib6iDXP4+fqzjTVLDIprbDeZmYEKr0KOHnVaPzyiXesvqvh5UvW0oW32CtM9RB8xg99h
	 3PPjwylFecGYQpyND/DzLUCaM63seB/Qy/y3mAO0xUbXgWfV9d5eGYSfeZB24XQ27gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
	b=U9H9ZcwVLz/8loOkGYvrCluF5INvy8N6lvpzy7+iIBWbAlHIawcymjmz2n8H2wzsfrhg
	 Moz3H7o+C66d46dk4vnt91pDKRF4y57ZbHflVuscVcMB0qkO2EygXnFzOYWhu1KtvNzwB
	 6Xz/ezOmw9kK6Mn37XOn2eu3WbMojWcJoy71MEXCzT7BC8URi+NYSzPKUWR2nvSX6YjZo
	 MUNyyi5nLSIFv349ZAwCzEEZzDsQ6MbyODT1X3mjW+Xez9inpklOr2knkdKRtNFVj/Zw/
	 +eCEQpuGjr5/7kr5J0i04Sd1qDrGz0d4L/kKWLINcyVP7TRm0PaOt+dEnQqaxLeBStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1y+eOu5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LO/DTE/g";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B7606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1y+eOu5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LO/DTE/g
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AVww3582281
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 06:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I6P/+/Ar1axx3nC1T+ZFo1
	xV01iG4tHc1syUNQX7w18=; b=L1y+eOu5LiT5vHGcvIarNbHENiE1K1qAEQcKbL
	A2Wr8B4tOdF0xKk3MG37atArNp2RdPOf9ceRjKXB+KXXFTsIEXVhQKEwRQItlaNj
	RjaaV2fa1TfvmZEUYcpUDIzoCTF0SG7xQxoeGYIHhlhLUDgPnFC9aHdwhLE0bSvs
	rsHOM/wat8SENxUIk6rjkygEvErJJxEZF7JUNev21mLpWi9BIHVSyYNEQMbAD3aW
	DQUZ6X4aHIKs2mCVdhZUfywzqcEltyMgQsutQEMmPVSzskoTHAD1MXGYDKRsS616
	+T36IJQq+gAO3ivArBEOfpn+9G7w707BnX+ehRqoHSoKQwCQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv734ydu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:27:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1504313eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205644; x=1794810444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
        b=LO/DTE/g0L2W4B6HHShEYjaMAYUV7l9DUhyotOChTuggtYAY59CUXEixrSpuBf3pXR
         oyVDFIMhploFnLkbpHaQ/uCbs5OMiLaZx/hQLQU/36SRCBNpOOeLa101UVLMtxdVuzY9
         W5mvNegqvTY7HZG5zs34iPTyPoKys8jnUIx10qq4avKFHQgOAquxnGipAyVnTs3jy6Y5
         o8QCljVOJfxLBP5gO/5oI40FJKMRxxtNXr4lAX3HrR79VW0ErZgvH4DT2sEqT2zFVZo6
         VA4Xd+Mx6bzZ8t7yMwsl/bTgaFdX3ST0VQJwLau2fs32LZvy40uizi8ni1ZMCBlrAIRm
         ToIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205644; x=1794810444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
        b=NFxKTi1ZFCsK8E+xzCd1Jrhi31MfI56QEszngdvc13c/hrbusiwHlbESHLdXtpeDjg
         EYYdzGFX1fDIocmTVyeifYep5pAvOkQ7ek9YqdASz7iFqM99RVGcWnMTrTvE0j56Ck+k
         h7Up7CpTMwdZdPQJm+4XU7RngeLYI1CTdswoeQrtkA/pWVwmSqzzUv0dLB/u4X6PexIw
         WCEMrdgoXwJKIokcV3C6GafJwS1Km5PMj8iZDTqytWQEvQkZzIMHFIeAOAVorLmCSCN1
         5755q+tc7U8S701sOlCWJOxX3woTsxl8gMggf93cQuqjfR0WvQvxN8widF2sisA2o13o
         2Piw==
X-Forwarded-Encrypted: i=1; AL+hErFMIfJsD8YQGRP+94Sc2t17FdMogA+kvM4d4QbG7D2kQ1vVTaIazJL4MlXSMTw/rPY6Gcmor7zy5NBJqeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0cZ4YJnF0lCnjTkFRuGUl5QHFk4rzwm3RGao6k5wHoAdhE/L
	/bW9NFk35LJfPwaSaIKGH3QZqq+trlnOAnaHgZVnjglPG0c4KIdc/51Fa1qwYFqSJHuJyXPhK/G
	sP4HKt/Bw2MKtx++mIkVXMEvNFixdvZjClO51wHX9zQ1CWrtoA9cyYY98DLBFATrwAuE=
X-Gm-Gg: AYBFou174paP7PE+XBkU7+IhtOt2iXeymZRx/jhBJw39/piauZLVnTCOx+z9ZuYaT+b
	qFWI8errfbZdk9oythkw0ZOXmFTvUjRyECKaxXBwjnAmBFV4awKWwIgPE/4bV8CFDvHYkoN8yfm
	pw3kBshmLiRUU5oMEe7mm48T2+MKz36DUH87vGYYiKJ2KiHL1b9DkRsa1t7VngH37zNrfvW01dT
	2tFe9XD5/7rWqu0oO6A/lFsv5AJwd2n25bHCeCEKi2YeTF69/FYyxAhu7gkbmv1P2WXLAIdAlpm
	R9WFMq97Y8Nu05Fod16hfkteRO0EXAGe+Q64n5AhXXJFX6LUFclGASst7Wo6BwjlMUcl6gugmFS
	SwEYUjbmQoT/F0/mQNu+qAjrQjKcn8f8taXneHKIwbBhjuMvCE54WLXBVqXFy6FlG+sVIeWHRkZ
	6chV29/FM=
X-Received: by 2002:a05:7301:618d:10b0:36a:3453:a356 with SMTP id 5a478bee46e88-37276535d08mr5879274eec.36.1794205643931;
        Sun, 08 Nov 2026 22:27:23 -0800 (PST)
X-Received: by 2002:a05:7301:618d:10b0:36a:3453:a356 with SMTP id 5a478bee46e88-37276535d08mr5879232eec.36.1794205643383;
        Sun, 08 Nov 2026 22:27:23 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm15812458eec.19.2026.11.08.22.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:27:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/panel: Add support for Novatek NT37802
Date: Mon, 09 Nov 2026 11:57:13 +0530
Message-Id: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFn8WoC/32NQQ6CMBREr0L+2pK2UkBX3sOwKOVji0K1H4iGc
 HcL7t1M8pKZNwsQBocE52SBgLMj54cI8pCAsXq4IXNNZJBc5kLwjHVk8W51YMN4LEoumVaaFye
 TmcYgxNkzYOveu/Ja/ZimukMzbp6tYR2NPnz2z1lsvT/6WTDOVIkKi7aWSuUXT5S+Jv0wvu/TG
 FCt6/oFV6Kcd8kAAAA=
X-Change-ID: 20261104-jshekhar-nt37802-a5a079c4cdce
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794205638; l=1979;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=FkR9f1cRWmpPscVyf3yZZzodXrTf3YT8+24ASTDxW5s=;
 b=2ulozcueZqDqpHWeGJjX6hJAQs4SqUcC4nFygoleItg9+WBmpeZz3r9I6y3DzrlgISPkqWh+a
 2mf3SROcaNOAP8lyceUDkBHoiK0l8UsGnhphyFQkYwSioImOnpjDzLi
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX8Yhhannch/LF
 9AlONmQPISNO1UQBQ+DC7LCWi3pYZP+OqcX2mV/Rk9gyhPct+Y/Engt8b8hj7/D6kjlyBLxb5qT
 3M0uBkcQMrxkldUqGxaXU0X3WkMSB0RTLXDVTk+AUoIHDejoa8s4TvjIuZfYBdW2xSvjrensBIr
 LSGPzHo6E1YSDEoCZwhuCjPRbKnFKqHIPPWVScySau73kodlRZnQIyEz7bPUqmYZ8bfjvWwVnLz
 +b2bu8E0kLiInPj9TVG2/oXBJF8pU39GmAY+BKVqaJj6D4Lh/FGj7xf1imTRaMuJAng5SCQpRLK
 XCfXNLQP6/5TlkvFRHtscq8VhOa+x0kavnVsDSePUij9LhRAJdygqTqTDGbKCI3V5pwpX7hlqWo
 tXBb7ozm5CqL8p6SAzonRzR164E2wPIC+aIYZVlCfuVQNdRyurhjUI7jwUEPwl6DoyrXfixwEC3
 AEnpxETSJwTqPAyVRnQ==
X-Proofpoint-ORIG-GUID: cObfUW6B9-me0l700-UQpTRZRSYPXWKe
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af167cc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=0fWOHazxJtL7KIpFMY4A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfXwMHrSAHbXLy0
 Z0FGpZb663r0XMHKXrF6SBqbTBWcGa8+FsoTbaM3jmYbdZUXuggnzyJsq+iM0JFS7buEcw/Zul/
 njzrGZcnSDAAQZ8DYs7qziqmAX2vUXY=
X-Proofpoint-GUID: cObfUW6B9-me0l700-UQpTRZRSYPXWKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090025

Add support for the Novatek NT37802 AMOLED DSI command-mode panel.

This series first documents the panel's Devicetree binding, then adds a
DRM panel driver. The driver provides
the 1440x3200@120Hz mode with DSC 1.2 over four DSI lanes, sequences
the panel supplies and reset GPIO, and exposes DCS brightness control.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Changes in v2: (Krzysztof Kozlowski)
  - Extend the existing NT37801 binding to cover NT37802, including its
    required EXVDD supply and an example; drop the separate schema file.
  - Drop the arm64 defconfig change from the panel driver patch.
  - Remove unexplained Maili/Pebble platform references.

- Link to v1: https://patch.msgid.link/20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jayant Shekhar (2):
      dt-bindings: display: panel: Add Novatek NT37802
      drm/panel: Add driver for Novatek NT37802

 .../bindings/display/panel/novatek,nt37801.yaml    |  49 +-
 drivers/gpu/drm/panel/Kconfig                      |  15 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37802.c      | 544 +++++++++++++++++++++
 4 files changed, 605 insertions(+), 4 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-jshekhar-nt37802-a5a079c4cdce

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>


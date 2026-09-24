Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F34A6CC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265578; cv=none; b=oknRus1rNpbvEuUXUsZv0XwQgdNyF94jEa/OgrF+YEDOTuPqKOQQi0MWb3zPXGCikI7DUdqiTRhCZrwB1sgnuyjijNNekReVmJBlqUJFzKAy/rga5s44N0lKV96qx/fqyoL83OorhYxR7ho7W6MpmnaKkUIzNhcNyWW/CNN1vpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265578; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXAy6r+MxA2Yn+C1vj6BXyO6QkOv7VQY2l0HXoL5Q3/OMnsslk0WxtUTXa1oWB1Yw87mi6XnE7xNjH/+6TJk41Cri/1Ae6PIdQW3MeEpI9GXtgQQ296OcC4jVJ7DBZP9vk+dmZ7WbLzNu4feqfYCdQXeovpwXoYXX1mhInTEJ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4Vx5238; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8lLHRfX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4Vx5238";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8lLHRfX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeUs73064807
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=L4Vx5238ZyCbLj0K
	QipZ+sAtiwv90BdLKTQ2HH92/VFEeZeLqYKpbMpwdGLYsesdymqXVGOTxBjFxdXJ
	ESrq8w1bEQ3C9+eR48MJtpXtRVEbv/EQSsc6kgBwoR24a1geVI/NN4u7PeFxegz5
	c+fM062PsFd1CfVP1gZsOkKvpW73dFbNNn5pu2VO7h1BB1EUlMSUAlnlcCl8dybK
	XlxVPjvMYtPdqPgvT+9c1VwJdcR0CURGCYc3J92fOBpK93IdLW1HSLX9xbyWgts1
	rEMRE6WrZ6KNSsRFWGz2a1KeZP9tUoFsSMaLu04IHz4COPtz8o26NhWAYfg7wUGO
	EOUYKA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjhdgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:59:34 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66e5f804faaso9819d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790265574; x=1790870374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=H8lLHRfXNHQcdsJLLWwmqMjylJe6hwEnN+ffTVQ96zgjO5VD03rML6lUzlLBp6oFfS
         uuJQ7eTgDQ2O2LbUvmUX243SmXy/uS3nm2FBir/UQ+Ppl/dFEqvfu9tZ5JGS0/r4PFJN
         EW5JpKc0Kn+CdPf/rMFipIqIPKsyQQSL7wY0fazp20AB1A6WJ+ZbOO9YjOjKRdPU8d0/
         pwZzAVLDd6udppBsug7D7JWWWhJesiRezdZePr6GxDotrb50Nq9PRO6wWVXfIwvXYFeC
         ZQYGl7xtqNGNn/+Gp8ufSVUUc5UAFcplZx70AZsEMEcF57bukVYvMClejDH8rcCnBjzT
         /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265574; x=1790870374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=HNJ6VMaWsYDyK0H8p+TcWGkftuiB8URbgbCIsAMZT1F6VnU9JR3500gvaBLNXufAbo
         TWqUXX5kOmBe/uLSYpNcjslpCrzykp8rDQqedU1xQTHRZnfvj9JCnjZ+0x5d+hbm5GSb
         Je57QzyJPqYTOTjMvr3O3MP6JvdLplmYsc3gaB/9xsd02sDZQl02+I7jzvFsvtDKva64
         ZbPlj5d61V3EFIb4OBN/c0ViL8WEk/ahW+2BLyu5axLnHNqEqF+bEGEeAd4nwNtt7ibd
         IN++T20DNaXPVqX3htn30ZWaC8Qyc8d5plt/XHA/67Z0VEGQZjipaqlJiFMxB/RDfg/9
         bI8A==
X-Forwarded-Encrypted: i=1; AKwUvByYQRn/IH2xnGYm0dIglblTpOYrCn7AaA6dsdWtwlLIpr1o2SM7mx2+Xp/iZ4mfiXvatytM4UU0RNSxRdU=@vger.kernel.org
X-Gm-Message-State: AFuF++llWuqpNuCZJoOzmK8Wh3zX8a5knSL4Z14R8WylC0lnBbsPdXKD
	X5XlPTum4+31JUa/SJAj/M7UNIeaL91T93fKex4qejy/rLn/NJN39qycFvCID0OXojO1b8l6K4t
	0vJxz8Rk/PfT+qmC7/FYl4ynyvv2nT21SoZI5yDZO3XfHV7uH7VUrIRUbUKdlg3nnz44=
X-Gm-Gg: AYBFou3tTcfVcpVLmbCeYx9smqSpmk9H9MtayV8YScGEi/U4PwN1oNSr2aOuMaNV/7B
	vKT7Iut6Qc0vU+yfY3haKGxMnpFfYsYZ/SzRl8CAdE2x7aQjiKM017jkRDWwZRZtAw4SKqopfNt
	I0phLzZeFFAmsKsy/UQlRYorzVWzWZS/jnDOo6R5m2DyuT5ZMpD1J3f8ULxUHiVNhWrQld1xFRR
	ISaiUG+6B4FY6aBBx19kgCrCxXG9oMyxfnGqM0UnrdKe+mtjWOlHL8+iOgCIiMnuPL7TkDOpPWr
	7b8wkrvQyjz61dOEeXmuYWc9V+flpNtd45oMGb/Kn2tBrcntIx+gzWMuKImSaNUi0TvAwu6ra7r
	flq4EsI1ymp84W1Zdwy8gHxhNUAokaW+L5Gxn02aSHIGQ/8RR7NVFSF8DMqwLG4xt4aecnl8rYe
	qaEyREr9SgZHhx2wFbDR24
X-Received: by 2002:a53:bd4e:0:b0:671:1256:56f2 with SMTP id 956f58d0204a3-672ece3f118mr1991395d50.0.1790265574280;
        Thu, 24 Sep 2026 08:59:34 -0700 (PDT)
X-Received: by 2002:a53:bd4e:0:b0:671:1256:56f2 with SMTP id 956f58d0204a3-672ece3f118mr1991386d50.0.1790265573893;
        Thu, 24 Sep 2026 08:59:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d81e102asm2271003d50.19.2026.09.24.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:59:33 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Thu, 24 Sep 2026 21:29:10 +0530
Subject: [PATCH v9 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-lt9211c-bridge-v9-1-d78b39677a61@oss.qualcomm.com>
References: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
In-Reply-To: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790265554; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=hEeFDcepPc6JFQoICcwq7lno6RBFKeTfIcn1bnp+3lE4885PlNlYhbqK5Pn7DeS4NvFmTpvmr
 7zcnS/3EDKDDJKytCQK1aa9uvp6JMXmxLiA8E4NeEPYD3ZQhTlSx+q0
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: DUWIUBQ8WOR2S5IAY98--VE7UcLs3Uc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NSBTYWx0ZWRfX2hG9gAW3EWh8
 Z0Sg809u1ouhHIDgg1a349aSNWgmM3DL5dwAbp5IXp8kUhyN7f/L4HM8iGQ8mPB7se2Ve7Ig8Xq
 kkt9AMek9aIQwTFLT1BDVDqWtn+x6MZyEJy79NcC/QeP5aTa3MEwB0KNSDeMfuqdEQK7rsdRsAa
 LYZrKEWknve39i2MszSj+nn4QFHpwI4kk9vi4PBU8mpllJSSg49eRLbQvxV5W2OQFSxSNnEg6OH
 mZVuzDLFOS6ZTwSOpNOyhy7eEyHizeBzV+npaRyXAe1bko/cQoaN09c+hPkcpHoc8JTqdNQtPFg
 vJCwp44mCrur3v3Ppn4bQG70dWIUUCIr7gCOhgMSB3Ait2qbyDKBmof7VvEChXkMecTgfcCJgli
 FeSAOXFyK3Nx7ndj6htZCTFDHrGEZKCcOPSk9V6CNvbDTdtxffpnKBKVt/Dye3KdEEhWESN1MbZ
 F66OxG4vGJ+2KCRpuhA==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab548e6 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: DUWIUBQ8WOR2S5IAY98--VE7UcLs3Uc3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NSBTYWx0ZWRfX5wAsNLtZzhr3
 XLh/7tQ5FIUJxUEaiQmMc19Cmk0CEfZbzDt9Dx/D/+Ss1iz4L0pFP1oj2ql8YEfogHLtm/RxIKr
 IdMET/tqyYRat0wc1t6qksf+A/2tkxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240065

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1


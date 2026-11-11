Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357799;
	b=H9GprzLIvvl59TkFrXA/1fNjWWQpvNzuJ0ACdbfjEkwwhtzRjY+2U3Jie9fzxrWhe3CM
	 ebN2sO6cXrd7ywoUZcJghuhMNVV7NqHyl830J8E/6xQwwXKltYN4jKqheL9ACQIg3QDRg
	 8ZnUuJ8MkhkwN4uhqvIBPrEfyyA90Sq8V+6p1HyEZjY+WYFCGUQYzn9X8a8MFIbljLyEV
	 bo5KUqKghHCmTkhxGxs9aN1LevM4/Betv/H43pQbw3adiaHslSd8m4glM1xJ43jBSmX1B
	 ojURVgsvHxvyOATZViVCtK4Fn5eSAQ1qLCE9By9xBkMQYr6UEPFfixpQ3EF4vz0G1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
	b=J4Vw9rDvW/BT4cvEqDrYGG5fGPaYenDqxBnxJKDdSuxWRsct28T68hDNZ70S6VgBSAUM
	 HK5W0u5kB9aRuZ5hHz3Au24xHtpQyHeStGOQ0uzkv8pEfKo2u7RpUXH+kDCjAVw9ZChta
	 unpgK5yT82LoRkBhtN7SaFHokURJDwusNqHqSQlSQU68Bf3ttBojwi9USz9jgPZ8WMXGb
	 cWsr1q6xgg4JNYgSiYgvVzBr1ARlD0zLj6dBz623I+d9qCa7asq2ShVhIaBB+XziVelnk
	 2wcUe34iTJ6xI10PwBgXbd9dq0Ecx6qfZcnIi1bkLQJix4X07au6l7nu5BIoLGy9LeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYZIMJu8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFT00dVz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC1606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DC1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pYZIMJu8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFT00dVz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FEXk725833
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=; b=pYZIMJu8SCvI0zGn
	v1MmNj3pK+ekhtK14G9CYcRKhud3pXTN7CSw/9qzQcGdmYOdLzk2MS1IHDBJjQaH
	W2VYq/HIKDQVMd9Sz6u6g76JRnvmLx6hGmofgcnf1tA3QSKEy6oR41EUUd46X8Q/
	tJETz0+Hgf/DauBbtGciOnhtN8PTHU7ssdpgG/Na0rTg6PtkY9u+na49Geho8CLk
	Fc99MxG32XZvrLqZ5Mmw+U7jHwfVx9Bj0AZcClnlD2OxNvZ/i3hmWXvn/9p/qxBm
	TUYlZYBe93JK0772CKCnlJewU1nd04ixO7/Oyi+y7+q62wpXuZCVIL4mhzW84xoO
	89tcBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm82md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7bf2d734so56440716d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357794; x=1794962594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
        b=hFT00dVzgJJJDuCs1sv+efGEll+eOjfx4z6zx7Tk/PsMJfukO5bV7/VTOhBmnBAq+u
         m7kPrsSeOq/lglgH1/7bCHNyVyCgxasA6/quGt3yXtHrt+z5lqtychKawVqC9q4/ugMv
         RcmGZRLHfeAvfYk7KOiZ6Gt0cYHLxIaM7Ypz827swVlVS/031BceFBHUn7Vj3ykXtLxU
         XgJUjq/yFGIAVB8lT78UIo+PyJPDcR6MKhMx3Ddf9SJZZFjdMYoCpviLdpR74WX7ppK+
         jqxxV69BYoaoKz7Y7RXYux1KR1Pjo9ErFo1OPlM9H9SDdj45P/kvKbdiK2BX8J/HUzkW
         1fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357794; x=1794962594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2Ef44+u2+BvWMLecS2zSyGvijAfiGu+XblURBJZ3vM=;
        b=iEUY3D1wPrwfvpanr2HpnigFqLfeFPor7PHMN4aw9SSc6zoflD4Sab+emt9TtoV74i
         lo4k88am7oQ6nMn3e+IuSy70uPMlwoiAT6s0KhoQJrLeN6BnHMAKGL/0SdI9peUKmRSI
         KDI5IzFw1iRxzyDbFOb0R+sZcXVko0tlNJOPeCY9jOeeMWuCJmIRbjbRcdmYuCUL/7kt
         OlDks0qZija5WbfsSyJ3VtPv0Iam/Js03wx/tgUme3NJzx+3/rVKDAIsswqDIYtuEehQ
         lGHSJvsOpURvM6CMzGY5HFStxlrX9W+jdgea7oc3FWCfJj+V2aSTF7kzES5nuQkaGARz
         LVGA==
X-Forwarded-Encrypted: i=1; AL+hErFcHd0PZXJiC4hzfvZ2F0Tuaz9bM9nABqRM2UDybx90Pno6oVT0K4Hy6OVdXCUkY1LgEdrXiTTX5ykNO+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OjmEKR5XdgFsHKzqnIuOMyMMLBQdqbIOmhTQPjBxcOoW10piE
	S9Hf4JiU6F7u/MiPw3CI9lPAnfX0MTGkwHE07PBbheM+rKCJiw1dk18GYyYs2tG3e7Hek+ZGJqq
	lF2jCboJQr3vMYEPp0NRGxVEGw1eatnNrqJqiZIXpaTfoqaNAlrTZFHdvOn/khpXssk0=
X-Gm-Gg: AYBFou2X3Vls3Hgxn5o7yN7gYMEuRM4pBqPcJA6GAauICnbl+Gp1F59gYThOLaH5wwy
	XkEI7iaB5eycPgw71mSfDQsDDUR/5rzCvI0rN75zRGT7ORLnUUCB2uYD7qJFr1SaUkCY55AMgXG
	38QyFMrGARGQm2q0lssbfVTL0NRi9HF4LOEH7+7tD/LUpd4W0U+qRY87qMqNIrCXD5ub9mZhpRT
	+sNi28ISSoY7J4Wg9X40eRpOdgGeQLGiFOtBplu19iX3tdbf2x1b6XKBOV74z3CH17270Pui+Ft
	lVkht6xuB7NNmuvc+EHn6IDOm4SnDDFdlbgIT6FnEwuIPz60zza+8R/alsQekFR5GquexuqDryi
	InHZv4b6+Tqq/q4hTHCmspJIBigZym8XlQuY8lD0Amnqp+HSV0XvKKvpxnFEMgehEX472lZKF2p
	31qKG6GnFO8XN2AtYqthoVP1tt5kuHUJrXSy1HN4wraEQQBUU/Ee/9+esCIw6vKw==
X-Received: by 2002:a05:6214:226e:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91f040d0e12mr17091386d6.23.1794357793941;
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
X-Received: by 2002:a05:6214:226e:b0:917:aa8e:474f with SMTP id 6a1803df08f44-91f040d0e12mr17090886d6.23.1794357793243;
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:33 +0200
Subject: [PATCH v8 04/10] drm: renesas: rcar-du: embed the writeback
 encoder in rcar_du_crtc
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
Message-Id: <20261111-wb-drop-encoder-v8-4-62948ed87d13@oss.qualcomm.com>
References: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
In-Reply-To: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZSlizkHBUXN8nDew7m6LYl5yzLb4zNCOIibe7gX2PeA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oJflkjyS2l7Tu9VWxRnlVFgQGzVHoPPIAeY
 j7nNVp6JpWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6CQAKCRCLPIo+Aiko
 1SchCACQzn6uSd3HLFQMP772rOcAkgW4rhLJSa5A9i1KcT5t39kj3lQjEgUdItypDEsYxvs6RWT
 lcc6NQ5EjQOcALrZHzlbhpSQsLqTPkWfZIo2oOvcGYt1Fxe1iJC+3BKmLfCFG1Gr/0ekLPmVuxV
 jeYA5aZsDu6bUhzOXh8cmYWQWGTxXFNYclDFUrZXy+BSEVUa1qL3VxARRt8pQMaSX1n8IiZjxOz
 PYHzryzi7x8L/f8zdibA4u6iadeudXMFNg0LQU9pQU1abNwis+swWpst1rTA3rF7mJ6FSiHGMRU
 ncF5jXYdpJrS4IpOYT5fNebXGdk4sY6ym0tEuI0NWcikzXuI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 50F76YeUjxt3M6Ss6QKT5ZJHZQM976s6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX5Hk3LTJV62CQ
 WmIhN7NZUJYj88aHiL9iyuJJpkB2jTa5Q9R1YW5yqtee7Fdf9TOcfk1EGSAzYBDistNcyKpBOXA
 7ImgO9Vpm4R4VFfm4gY9uP9gnzzxHQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXz7Q7cn1OM4Kv
 EJi0UulaoEPJXwOtYnG1OjP0nAQq9W6OXg0DXuNHlNKzzTV5mYGtiot8209/tSc49GJqOWxPTFT
 z/6n/w/53pwF1dEG+ziL0IdIy0KjedPME0TfwFBosLO/73MhiOouHO98D7OMObDbI1cU/xMHc4h
 shFP8qQNu9JHCCOVh4Yeai9hzN4Dob7rJUN1cE2IWVdREfrH6FRVCaV0olNNZxHi0sNVvi8RXTd
 r9rAmky+D5Y/Pqe2YNOumhn+cpY1Sj+zPybk4qFMHdYeeBmTwe4XfeYmz0CUAF0KKaQNPIj5sA+
 EHwAGXBRYtfCX5pfjQvB68ttHGEBHER1UUA46Jz3EUqT7z8gFX1IXu4EW/bkX2eBpWAjs/Rk6PN
 8hrUE13TUgXAVn4KjbDf1GnVY2ZhNVcuANVmog5x2Q1PwBAN+657CXSwSHnzjQU7DbHvmQlTrcM
 ViGF1WXNmssPFsH6xUQ==
X-Proofpoint-GUID: 50F76YeUjxt3M6Ss6QKT5ZJHZQM976s6
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3ba22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_cPotY8_OL_z5XV9VKUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |  2 ++
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 29 +++++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index 8857926e109a..d8b1dcab8dea 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -44,6 +44,7 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @encoder: the writeback encoder
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -74,6 +75,7 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+	struct drm_encoder encoder;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 0a3108965591..a1271fec9874 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -172,6 +172,10 @@ static int rcar_du_wb_enc_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs rcar_du_wb_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs rcar_du_wb_enc_helper_funcs = {
 	.atomic_check = rcar_du_wb_enc_atomic_check,
 };
@@ -199,16 +203,29 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder = &rcrtc->encoder;
+	int ret;
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
+	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_wb_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
+							encoder,
+							&rcar_du_wb_conn_funcs,
+							writeback_formats,
+							ARRAY_SIZE(writeback_formats));
+	if (ret)
+		drm_encoder_cleanup(encoder);
+
+	return ret;
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3


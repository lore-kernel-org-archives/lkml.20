Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357806;
	b=Jn9Ymo86eeMbukOMnwSe5BYBHIJPIL3W6zY97NFQwtcgi3j2FHIaIBGopTXH985ScETg
	 jAp+jM30+L/ZHMaAXTFwa6Dt1pFbX7bBdZZWqPKG5f6ai+m3gcCrGYbVi6xTW1Gih/bWB
	 ndnkFXkiMcv5VuUJ5nTurxEw5QuR1QEH79ZT5zixItEYgET64EP9+LcLohBKBHOx5wUXe
	 ZbhX9qJDcOIBUxunK82TBPNOMfsoLQfMF6hinyWw/DBXoI1FokG558KgZAJNl4HVP4M47
	 VjVIOyhTG733MXtiUi/KjBY7kUo52u6FtolJDGr7q4RgzVsu5Nnuo5P5K3crTrirUOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hhveaKbmmmrP1w+Sni0lZMyjK8nAFckdknPCkhp9J44=;
	b=dUMlQa7rE8218ZhZnbetrXVlqOjzXJBsyMxAll4WBZdivUdId6+l4T4xNeeRT9DPZa3u
	 voexxX80VSkNozu3qT5bqF3s/UHHgUmUCr7VW5TQVl15uhC+hKezHxbqlS9fpPMr0T+eH
	 QaZ35IsfMEg1VsiAPQ2mpIzwD59JBKKvq767AlMk7iWqtV6c/RmEaTDG14EtDANCMJTM/
	 GczP7/Pa2tIC3hz7GrHMFcnuehh5+oPJ5HdFzHZv/4gqOdmUDJh0xbxMkP83WgMGxobrz
	 0pT2YcuV59hG9xqSBrZRP4tKiIegnx6d2Ex426eDF2xEUVDC+Slg/iDWDRavqPwCGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArmHmbIL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tx/wZngE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArmHmbIL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx/wZngE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0LSke407240
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhveaKbmmmrP1w+Sni0lZMyjK8nAFckdknPCkhp9J44=; b=ArmHmbILUuUtsadw
	nWEPIL8Tw+H7j2TWvIODSCkbPxgChOY6fbgLnLnu7KZLOOlVekdLrRmRShwJZYJP
	oYD9EqTVQWRbEIstWQVeqzaFjyr6EcFV+YqS7NLi8+Q7sSmB0mxL1Uf9tzEzxDIf
	NxO03sD3Cy3DUtQMyY7/xcOtu9AjuSaMECeE5xIHYa0e3oLyO1PZR06kDMcGFoOH
	OGIcwPWjg6gGnWfYslAy1dbuOaYHrTuB1ozETvFwaVCrYCpVleVcTaxvDzv55lpl
	ZozBtmSKCmOo+z50kPNvTNqODU5AiFnF2D1WFVhPPtJcvk7kaUwEHMsfEQx08FYV
	JGB08g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh0275-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91f01e99265so10240666d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357802; x=1794962602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhveaKbmmmrP1w+Sni0lZMyjK8nAFckdknPCkhp9J44=;
        b=Tx/wZngESj6Ng+ljaqZNZUAaS+TIz4wRgGpnamEkbnErDFmweiGxaLP2JGiSc10mdP
         Hifv5SpiNAGWDEBQGjkN9y+ynfVmG2KmpuYCbQRuLXKZVRscZ3jF1icCNrG7/03Ax0WR
         jwoZ6gjkaU1inl1lQBT+oLcanl3E5va1IvYzIf1LY2C/8EXZoCpvUzwxuvwgjU/MlTmT
         jMv5vVck5HLdVP8sO6ecvWb2BZ+wEJkoE9J3o+0TiTdzqEaLwPqKm/TKmr0Bz9CkyyOj
         hjNriFbjzpqEGHKEL5Oex6q/hCbT8uLRXkloZ0JQhASqagF0zvoBPPyTDeaAf6RRkO17
         CD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357802; x=1794962602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhveaKbmmmrP1w+Sni0lZMyjK8nAFckdknPCkhp9J44=;
        b=JlPwNACHzVgLxyImoZ7omBAfD46Q1C5ALKa3g70vCBZBRGTY/NUGUdy5Ir3zgrBpt0
         u+IUuxF4y2vqjmcJLSqcAsReLgJlfa0UgEFxB5yFTJ2Q5BFvR5ozPFvTcme/r/tJIBWC
         klLzAy0MqMigS+SLYx7cfG/sTYkfThzaTZFZ4QqazJ7UbWVsh4qDypa4vNe+ZUiDhHN1
         jSPR11r+gm8G7IFW01eBSUsmkI461M8YS2FO5yLAELsObQxd5Xk/4pOWRcytOvd1uDu0
         2Beo5CDCiVRODoEt2/xs+za0vIC4pSHxB1kDTIzC2A2U1rqL+MSfZGuim/HWv/XrOf9B
         OX+A==
X-Forwarded-Encrypted: i=1; AL+hErH0XfDzBoBpdkUUG/UPrwsQ6PMxCKo4RhPap878T/lXYtyc+ZHBBiSXuEpA/SLxWyga/m4Tg0pmyuCBOz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87DzqyK1qOhxn+6koQSnhS8K4zMz58lodFge/uisj/qsgfuBU/
	pdB/vL3g1bpEOpu9qomngPrAOkHhB6jjk4t57pxkEBg1tIih6KO6WXpZ8jfbmB91mpn2Qb4/3oh
	ALJWpuyhO7Wda4SZWQhIq9iR8fZfkqcSWA1zWdj62cfXc/3XepGDl+kHscEy1Y+lCMKc=
X-Gm-Gg: AYBFou2qjTxJh00ntNeluW0Zg0gXO6c3qmO3GZZeWUInW8OPxj1GpuDGNtK42VNXQrb
	JArXECjB0kKKNebo463HMJwmXHSr997YR6yJSCAYMn0DWWpyz4dNtLVosG2FZ3s+8CTnwoOzzp9
	RvEvzyumJ7xSvtOgVVUzBNNkChuTD2NcP5QxDLeO0vbAhHr5qklXJQt0NUpuvQwa0xXLj2sRDke
	HJ9C95Zf1vbH4xoX5TU5iY/090LbH3ROF3b7gAEKdvbD0J9NmH6OTxTecdc3fidsHhwWB3RmEdK
	UoiC+Q4sHMt8pdbWHTKWUOyqkCn5D3pWu6dcLAQpgJQU+PsFWKYgeiT6zXCslr0djACap7HuisY
	q2faTNADc5mQcfNHvyM3BnljyBKH0NegnD7W84dli32Jc8WqJurZ+FUud7/+yGBJgT6hrTrYcQq
	RM1NbeURaVAGvDsY1dcs1AlXAkveh4/aBn80+t6WTgZZp6HmCNStbKtv/GzYHx5w==
X-Received: by 2002:a05:6214:d86:b0:91e:a629:ff92 with SMTP id 6a1803df08f44-91f04196dd4mr18148966d6.42.1794357801732;
        Tue, 10 Nov 2026 16:43:21 -0800 (PST)
X-Received: by 2002:a05:6214:d86:b0:91e:a629:ff92 with SMTP id 6a1803df08f44-91f04196dd4mr18148396d6.42.1794357801033;
        Tue, 10 Nov 2026 16:43:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:35 +0200
Subject: [PATCH v8 06/10] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
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
Message-Id: <20261111-wb-drop-encoder-v8-6-62948ed87d13@oss.qualcomm.com>
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wvKxj/weq4r4ZxPKaEMkccXc+Kqhd05QUrApI4aY/UE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oO56imQXCPnVcLCoJc7EVpFUdmAkmiwiJjs
 DKzNFrZ25OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6DgAKCRCLPIo+Aiko
 1XvNCACpqHYibAHqx9CrcrvKX7v7KToL77nGbW0BpE/3brMkQw5Au+kpj7nq7PT/fw73Q0PRsAV
 oKhCfkmuvYa9IsYzA2dJ6CTKy6yNNJ+YgU1U86C3BOi1dyWIiSuY2nXqIGxVjBTV7sBPh7FRAyl
 Re0sqtsmSv7k35XyQNMgd82L+rUC7BRfUAuJnt5K5FcMuV0jDcS1Tvqhjw3Lpd53sH6nDG8+obn
 RV/SOXsFd0beBgLVxDEbw0IYIJcbTj44dIHpm6k6z8tLQcDuEKPFrBQpqrmWoKFkJvnPFfYSb+6
 PnzfQHJLHFOk0VYLr17RNNmZAt1Z1MIjebJ7J5s5dqRYA+kV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX/Zf+iEu6NX7k
 68/p8gL1S4YoAz6P4AQ90TuBcuhZn3t69T6O8due6dFXrFtMTypPW/olwRWjsbdluaptj0AanCq
 zxx4zr4D5IOfkUNEYJIhbYvRs5yE/l4=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af3ba2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=KeTiLIfg1DN4_MrrFvcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: MxmysbN_s6tTk18tFbRrlg85VGVYZhyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXySQdNw/Ibv5g
 DUcAU7xC/GgjdVEKMuAbSC435DIaFmxziwZQrqnclh6uHO6vgvISbv80VuT6vFza7/c2UlD6JLp
 31n7Om4gaf7e96ypx0gMuWAx1k0P6gt6lPprgw96vW0OVT/IB4mck5mCMTGrtl//iZjND/IBVRl
 EGrdpiE8XZtqay3o63Tddf7bTUQiW10K+3AVD7LLa7uV10ZkbvrV8/G/PuR/6Zgp9NE9oM88RTR
 EDHV7QYJlxLHlTa5Qui5vxuaiEBD9SiBpDAYhEYfg942UsPGHlSMSfESc0qavtaA0rFA8a+QpfN
 Bbsf9EB3WcTkeXCeSX6gBdtAnyn5oGDZJV7Y2sZ7CTeZ2cu2u9ZpSKDrAc0Dj1RPNKTKDMimQwO
 e9tup6o3SBaAHACvDbKSMiRW73Kt5KMEwhAKjoP/V1kcWbMjoQbSaPQwusnjWuwmzpfmwwhncFl
 jM08AEMX2Bnx3Koh0KA==
X-Proofpoint-ORIG-GUID: MxmysbN_s6tTk18tFbRrlg85VGVYZhyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init(). Drop references to the "custom encoder"
from the documentation since it's now the only way to specify the
encoder to the writeback connector.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 10 +++++-----
 .../drm/arm/display/komeda/komeda_wb_connector.c    |  8 ++++----
 drivers/gpu/drm/arm/malidp_mw.c                     |  8 ++++----
 drivers/gpu/drm/drm_writeback.c                     | 21 +++++++++------------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_txp.c                       |  8 ++++----
 include/drm/drm_writeback.h                         | 10 +++++-----
 7 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index e0ef23f692d4..dde02b2b018b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -262,11 +262,11 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init_with_encoder(&dm->adev->ddev, &wbcon->base,
-							&wbcon->encoder,
-							&amdgpu_dm_wb_connector_funcs,
-							amdgpu_dm_wb_formats,
-							ARRAY_SIZE(amdgpu_dm_wb_formats));
+	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+					   &amdgpu_dm_wb_connector_funcs,
+					   &wbcon->encoder,
+					   amdgpu_dm_wb_formats,
+					   ARRAY_SIZE(amdgpu_dm_wb_formats));
 	if (res) {
 		drm_encoder_cleanup(&wbcon->encoder);
 		return res;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 7b795e1c5705..ea4589b00ee0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -186,10 +186,10 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return err;
 	}
 
-	err = drm_writeback_connector_init_with_encoder(&kms->base, wb_conn,
-							wb_encoder,
-							&komeda_wb_connector_funcs,
-							formats, n_formats);
+	err = drm_writeback_connector_init(&kms->base, wb_conn,
+					   &komeda_wb_connector_funcs,
+					   wb_encoder,
+					   formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		drm_encoder_cleanup(wb_encoder);
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 889d0d1db85d..3669d10540bf 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -239,10 +239,10 @@ int malidp_mw_connector_init(struct drm_device *drm)
 		return ret;
 	}
 
-	ret = drm_writeback_connector_init_with_encoder(drm, &malidp->mw_connector,
-							&malidp->mw_encoder,
-							&malidp_mw_connector_funcs,
-							formats, n_formats);
+	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
+					   &malidp_mw_connector_funcs,
+					   &malidp->mw_encoder,
+					   formats, n_formats);
 	kfree(formats);
 	if (ret) {
 		drm_encoder_cleanup(&malidp->mw_encoder);
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 683da368e339..89c36f1414ce 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -165,8 +165,7 @@ static void delete_writeback_properties(struct drm_device *dev)
 }
 
 /**
- * __drm_writeback_connector_init - Initialize a writeback connector with
- * a custom encoder
+ * __drm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
@@ -241,8 +240,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
- * a custom encoder
+ * drm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
@@ -269,11 +267,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -290,7 +288,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
@@ -320,8 +318,7 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 }
 
 /**
- * drmm_writeback_connector_init - Initialize a writeback connector with
- * a custom encoder
+ * drmm_writeback_connector_init - Initialize a writeback connector
  *
  * @dev: DRM device
  * @wb_connector: Writeback connector to initialize
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index a1271fec9874..a88408124758 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -217,11 +217,11 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	ret = drm_writeback_connector_init_with_encoder(&rcdu->ddev, wb_conn,
-							encoder,
-							&rcar_du_wb_conn_funcs,
-							writeback_formats,
-							ARRAY_SIZE(writeback_formats));
+	ret = drm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					   &rcar_du_wb_conn_funcs,
+					   encoder,
+					   writeback_formats,
+					   ARRAY_SIZE(writeback_formats));
 	if (ret)
 		drm_encoder_cleanup(encoder);
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 642953cba25f..6ffc54d23d48 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -601,10 +601,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_helper_add(&txp->connector.base,
 				 &vc4_txp_connector_helper_funcs);
-	ret = drm_writeback_connector_init_with_encoder(drm, &txp->connector,
-							encoder,
-							&vc4_txp_connector_funcs,
-							drm_fmts, ARRAY_SIZE(drm_fmts));
+	ret = drm_writeback_connector_init(drm, &txp->connector,
+					   &vc4_txp_connector_funcs,
+					   encoder,
+					   drm_fmts, ARRAY_SIZE(drm_fmts));
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3


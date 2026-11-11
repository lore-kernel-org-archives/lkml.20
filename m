Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357809;
	b=jaO9j10xSElVsCRiObmehNQcuysn94Tjd9O+Ca2OIQYQbBlHlIyD6Psap0wo3Vz6uhEq
	 +Cz+VdN42hahaxdVZlAzf19gtVt5ZdFeqznoiA2kWHDESqajhd9zyWxizGniEcrJ+3zoA
	 PSEvAfBhZxfw7Gg1J67KpAu5MF+bzJqo0TutYjVvosFt3fg4yvwq5oJcXBKLFU3D79M/l
	 zvsDXLlAprY2VGXLvvR8o0MeTwgAUTCv3FOEIy+fqu1YuwkeLedostDDteZQ/ray2UyCO
	 pT9mv0HKeJ2XjZIx2Z4QOpex+htTeMaBy9JvTPvCLChVVcHCmLIhBytJn/s92g3zzfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
	b=hbuJEd75zydS/W2BY86EmVcEZXLgS2y3zRxgv/WbLJBVo3VBhnAtJNnhwyozf/OipvUd
	 wlv1Kl4QW2Ve7JW9cMvlabOYEHXYb7yZisf0467CRhgmz4YmUVUnlbo0aY8Qvl3joiNyu
	 tIozkUPP9Af9KCFIfuhYJDe4cxTpROylv3ogI6ypmNy5dA8Ab5c6enAMiR1Ht19nHu5+a
	 vKVYwZxfeaqjcnn3ZWDEx5JxbqRngFFh8sAp7UuvgH5P049V4YSORkgd4Wy5Oi9CcpwIv
	 ivcdVMUupTedpeepU8xRSUqIpX/vCDrzGBbOfiQOObStOAYO+D5Yww0otFO8THE7MDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9zqxJjF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYeNAajF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B060A3813
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35B060A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h9zqxJjF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYeNAajF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FQC61689109
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=; b=h9zqxJjFYhD28UvK
	Ij1h7eXNmw3UsK6AJTLnInELHhMXwJV4xlb5zOl7B0hwd5BQUQVMFEm3m+6hKpAm
	PgoplbjppNcWr0Hma8+6CyRL9XWbceQW5EHbX/4uGZW6DT9fMcNpLd1G/qA1Rzt7
	0ZA8eGER2mgnTZkIc+/Lj6Rpke/j/hwkD80D5tjMoa98fSC5LGBwjIgAUR8duttr
	vriHmTxpxCbOOONW94S7mTbSuC9YCp04TzdEgPIDdtdVVp6U88RMZag48Ny4dA88
	B2n8s7+LCLRufK69P4G65o8EVywqZtEYW9+mJ8TutVO2mLi6qW1vbhAII8928jR8
	TgkXAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp02ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb7d1472cso48979636d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357807; x=1794962607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
        b=dYeNAajFTlGbT4An9ls0M2LzHp8bUuhRZxnS/R8QzMDnGU6VhaHc0KdWx8OtZhO6uw
         gKp8P4M0v03a70/sPz1k0kscMEO1HT/NCXhFF6q4QBNJsGGHRjhwb8xsJmh5qZNQVm+n
         N+eeG9vdxHgYVN1YXycnu7zZujidXYFkvykVYdBxaoaCakSvLQYnFm1LXwBO0gG5CGly
         JiT7IdoUyDMxlo966JIx7SHUfGrKUtLV10IwxHs+b5Fwk36zzW9CCT/3FZsGX58mx+M7
         x+bih9UW0D2rFlTwVdZD3NAaaThg+gS2YgMVTZtVaZ3Hn6KrHH6lKfRxmaB0jBfxoVbm
         m2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357807; x=1794962607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdrgOO1kZ/LJgG/yaXawlqaJ5/GwT+jqCvdWQyL4krg=;
        b=GORz8EW2R+ZttQLicxNEJLyJO8qFECMuks6bJ5k1U7RIZY6KlHLLebLtoPTJIzfUI/
         DncpPVXKmdhVdrrObv/oyRPjWUZpFctTxl9o4ClG2jZgKZZ3fppYjQBVHE8Cn8E3o5p0
         Zfb9AHh1TaRVPEwtadSjBAyzcC2kVjOnB4Csna5X5zC1h9FY8wu1rhcWJQZ334IErqHi
         7SLpYKywa9x5GgrlAhBVqvungyRaB75gntgDvPerUH4k3uUgZugGmGPrToxLNg86N/ee
         3hC60Xe45KNDZrVjGmeju1uuv1hS3GswMM1thZsFJjRejJfOJw28ZXWgsVPD8SrT15SA
         Q4Lw==
X-Forwarded-Encrypted: i=1; AL+hErEdynpBh152sWySCWGQw4wzNofYUWmJvaPFOZ1NmBwU3g7EZ35pz54Zq+zL1P7upObHeoQeYs2Z0ExrOTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UP8DmtkNOoK9dKC8HjsOWnLv+0/gWnzF+hXq+MKVB2C2t9pOL
	WNkkWECmoC6rCmRfEkH/ZnuRABtXD7tp3jlgwUsCVpCikhXz5TAJL0dFtikV5DdY1yEKmSZJ5CZ
	ePAFTOxk5dZjdUa9EuPDzM0fzs2fxGWgxRD8A1EE8pnFfE0W5CpyNEnYzhSEZta0vdqk=
X-Gm-Gg: AYBFou3k5Mt7aQrTROR0mJBF35MaR0Z93E75LTqRP9MhV7YymMYww2klwrQueGB/J9g
	KsRG2PMX952b5jd6rcyrDOWPltlj0pu3017xVcD3J6QXemjE4A5Y+OTNJfrcYigO51lV3Ah+44c
	mFRqv9pbm3gsRuadKulPztF5Muj7JyTjn/mTolieu/H2QGqKB6A05pKIIOnkGh8OIrbjiyJBVSW
	R1B+vs5s56DlBeNry4pV4dxj9aQiPv/13mxSgoMVNx+28TE+vQjxDqUUoPIa0YPt+ftQARc74gf
	siAEJ52gFPf1VdRvqcUPWWvBYnlDy7yF6te9xojv4kN75ER+ywOPdr42SqF3WwEeKP4VBg8jxE0
	ZY/D9sW5cQqOHMA/ceVQxIGDjIN5dybE13uTJP/wpZoctEORAdkyObr3fYCwv76seDdPNgUrGi9
	9RVvXATQXGeFf/R8/2y3vPVdLWy6ZNWYbDTCCRb0FRWF80Kk/FXYuquyfYYePH8g==
X-Received: by 2002:a05:6214:529b:b0:91b:8025:6827 with SMTP id 6a1803df08f44-91f0411d3a5mr17363696d6.21.1794357806546;
        Tue, 10 Nov 2026 16:43:26 -0800 (PST)
X-Received: by 2002:a05:6214:529b:b0:91b:8025:6827 with SMTP id 6a1803df08f44-91f0411d3a5mr17363256d6.21.1794357805821;
        Tue, 10 Nov 2026 16:43:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:38 +0200
Subject: [PATCH v8 09/10] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
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
Message-Id: <20261111-wb-drop-encoder-v8-9-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6133;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BrJAtr2wc8dHMLrCB0wAes1muKcDYhiw7YM4ATkNvko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oUuxLWwzl7qKvchquyNbQBCvVpstIV7joS1
 cWcAHzvWOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6FAAKCRCLPIo+Aiko
 1Wv8B/sGJZubZyrWIr8blvtjJMU8+jiAyHEiOmDkjw8ca+3HLKX5PXHhdcyvjOJV0zMGRqIsYjc
 QvO2VpNtsYZsGNufKKGpkIn2XxThPyValQg4HBWRAJO6QyKRisuON4TTSWX5tfJ62QiOFljnxTe
 JHXbO7pwXsDTEJTI0+ul5F3/NaPUs0AewITBLCbBYAolgEb1UJKRtxDQpFbt/iPoUp0crdAv/AU
 +ol29ENhA+qhWWYHzEM1GwZjozk5EvSxoJ6ggs8hRMAiNcJW3fhI+pWnmG3q7AaOJGpX32LYz9n
 cAPm24H35pLd6+L3IDtHQmYkBsDrpgm0Uh/8OTJgCQMXRulk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX8NnwYkL6o71Y
 WoDYzefcXuDok/ue4d5N0ssn4weIih7f3GoclTXy8ZdMAuoO3nTt5BLx6RuRUHl75VysGrmk4QZ
 snpCdWWHn6Z3BPArNrj6POPksOpK0Hl7tS5Edf3zhIQwu6zKsnZ135A/5KpZ+8adXkpjCzb/Eyu
 pdhTPHJ3PYRCZx2n5zKm7zQIIQZSsTHejZrrurgBvaWOWj4i8lciRZDp9JhOygaE6Hmk2jDGYtn
 qXPpfVwgNadXqWx+lK/AvlFhJLCuoMDrmN4kP+YVCLW0YOnNcm/MzKAFhP1HxZzE3+G57/XWmUx
 xWUMhlyQ8zoF6N/RAhXpNvwJ8Nlnk7Aehd8Rfjvbixoe8zdtqEASpbgMbYHx6hFCHw1aRy2EaX3
 qPTL7OIlUWeb8Vj7v9BFaesRI+1H6l5ApybKsk3rTtS3+g/OpAYDvY6GoVrRnG3AC/P7yROqYPG
 NPfPjgxLSDmYtpDYrvg==
X-Proofpoint-GUID: QF3OIXHur50oMi0LG12sPk4cKAJ34Pex
X-Proofpoint-ORIG-GUID: QF3OIXHur50oMi0LG12sPk4cKAJ34Pex
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af3ba2f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6GQbiVArWzZUabU3hp4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX4HZoFj8CDCuN
 8i2rrLXaFbKhl0+6Q0tmsU5DqPWE4aPtRvI6Fdec384yV0QuQzR3Z8adQaUOhFZIe2+RjgtzPGC
 UOUgqJ5K9MErU5oe2htdNk0F7zqdW4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

Only drmm_writeback_connector_init() registers
drm_writeback_connector_cleanup(). Connectors set up with
drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
never drop the formats blob or free the jobs still on the queue, leaking
them together with their framebuffer and fence references.

Call drm_writeback_connector_cleanup() from drm_connector_cleanup() so it
runs for both kinds of initialization, the same way the HDMI audio and
SCDC state is torn down there. It downcasts the connector to its
drm_writeback_connector wrapper, which is only valid when the connector
really is embedded in one. A plain drm_connector (or a different wrapper
struct) may be initialized with DRM_MODE_CONNECTOR_WRITEBACK without being
a writeback connector, as several KUnit tests do, so keying the cleanup
off the connector type would read out of bounds. Track genuine writeback
initialization with a drm_connector::wb_initialized flag set by
__drm_writeback_connector_init() and clean up based on it instead. The
drmm action now just wraps the helper; clearing the flag makes the second
invocation a no-op and also covers drm_connector_cleanup() being called
after a failed __drm_writeback_connector_init().

Fixes: 935774cd71fe ("drm: Add writeback connector type")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c     |  3 +++
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 drivers/gpu/drm/drm_writeback.c     | 30 ++++++++++++++++++++++++------
 include/drm/drm_connector.h         | 12 ++++++++++++
 4 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d66188521881..da0b16f25ac4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -921,6 +921,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	if (connector->hdmi.scdc_work_initialized)
 		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
 
+	if (connector->wb_initialized)
+		drm_writeback_connector_cleanup(connector);
+
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
 	if (connector->privacy_screen) {
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 3492787c3697..f60216adcd31 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -329,4 +329,7 @@ static inline void drm_panic_unregister(struct drm_device *dev) {}
 static inline void drm_panic_init(void) {}
 #endif
 
+/* drm_writeback.c */
+void drm_writeback_connector_cleanup(struct drm_connector *connector);
+
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 6487f4a104f2..6ea3e55a1962 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -21,6 +21,8 @@
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
 
+#include "drm_crtc_internal.h"
+
 /**
  * DOC: overview
  *
@@ -215,6 +217,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 				   blob->base.id);
 	wb_connector->pixel_formats_blob_ptr = blob;
 
+	connector->wb_initialized = true;
+
 	return 0;
 }
 
@@ -271,22 +275,28 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
- * @dev: DRM device
- * @data: Pointer to the writeback connector to clean up
+ * @connector: Writeback connector to clean up
  *
  * This will decrement the reference counter of blobs. It will also clean the
  * remaining jobs in this writeback connector. Caution: This helper will not
  * clean up the attached encoder and the drm_connector.
+ *
+ * Called from drm_connector_cleanup() for all writeback connectors.
  */
-static void drm_writeback_connector_cleanup(struct drm_device *dev,
-					    void *data)
+void drm_writeback_connector_cleanup(struct drm_connector *connector)
 {
-	struct drm_writeback_connector *wb_connector = data;
+	struct drm_writeback_connector *wb_connector =
+		drm_connector_to_writeback(connector);
 	struct drm_writeback_job *pos, *n;
 	unsigned long flags;
 	LIST_HEAD(jobs);
 
+	if (!connector->wb_initialized)
+		return;
+	connector->wb_initialized = false;
+
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+	wb_connector->pixel_formats_blob_ptr = NULL;
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	list_splice_init(&wb_connector->job_queue, &jobs);
@@ -298,6 +308,14 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	}
 }
 
+static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
+						   void *data)
+{
+	struct drm_writeback_connector *wb_connector = data;
+
+	drm_writeback_connector_cleanup(&wb_connector->base);
+}
+
 /**
  * drmm_writeback_connector_init - Initialize a writeback connector
  *
@@ -336,7 +354,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
+	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
 				       wb_connector);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f656ed8324d3..07218ab26c9e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2688,6 +2688,18 @@ struct drm_connector {
 	 */
 	struct llist_node free_node;
 
+	/**
+	 * @wb_initialized:
+	 *
+	 * Set when the connector is embedded in a &struct
+	 * drm_writeback_connector that has been initialized through
+	 * __drm_writeback_connector_init(). A plain &struct drm_connector may
+	 * be created with DRM_MODE_CONNECTOR_WRITEBACK without being a
+	 * writeback connector, so drm_connector_cleanup() keys the writeback
+	 * teardown off this flag rather than the connector type.
+	 */
+	bool wb_initialized;
+
 	/**
 	 * @hdmi: HDMI-related variable and properties.
 	 */

-- 
2.47.3


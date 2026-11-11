Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357809;
	b=TAfYeaa9Q5bm1bEMJXUDaNR5tKSvOb6Cy90itmfL2EnGvxllSnyVyluw/j0WNBSliDXM
	 3AkCywQaeI3rnf34cxLvdQYDpwdsPfeMt3MSwUd1kmqwg3zhxu/mMaseZqWaFv9jgFj6F
	 2RkOceBNnETopaB16Q5mBSNyGuWqIZioCLhM4WLOaV5unW9Xq0d+TOdrrhP10O+X/64jq
	 jUNWHskvIj622FrIhiK12bSk5lVtXG5Owq2VLYhEMyh6JMB1NFi/ITCeJQ2gMn7dGzIXt
	 weLga1VIumWV8DYq+YYxCfDJ2UAth79AKPFomWxMeLu4zkQtsihKA+7LNEGAMwYgkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
	b=iTqtZtRxJztbw3HdfsYX9UlIjALt9BkjqZa8hB7951EHQCtmTvpnl9aWi+6IWaj5u3ce
	 jM6xrYRjOIFtgZzzsVPCeXw7xQ+kj+gs9tsqqOsJiyyzJ0ebeKtCosyfoHOoeG2pD0z5L
	 MMaQW24NbKWOuOMyjCCZidGhyU9MrPiR6lcmNOw3yQTxPNw+MPl3QhL0+jn1bauu9h4DU
	 zD5M6IqaSpTY3NLp0oGT9+V7FZTsPNdnI5ME0wpHhZcDEtu6c0KrkW9T4HmhHPFwwccGC
	 sOzetZoAKKcLsWzjyzrA4uf6kqINlZaZrcR8dniXDxRvHJB9DIlVulVT0I43V4iulMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvwrJspI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqvYVYam;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4060A3811
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A4060A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hvwrJspI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqvYVYam
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAN8mns570538
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=; b=hvwrJspIEHTugiEx
	IOFiIc5IM9EZ1hAf88dfpNx/HTDPm9kiBCa1bT8f633Yp1Jxsezg2xlKYxXKdnGN
	nAfHduuNtmPButDXy/GsOpu16W3Al7oT70ccsi9rlCEOr4v4yeNoIJa9E8UwPTDY
	LI6nJo3+MOHnh9xEI6wVhnOH0IaczrVnywc17Lc6Xo+mdsp76tCtx/l8cC+UtXX8
	mYohnWP3SPyj8h2gOfIwg0VRQHF26zTiaRbLlOANV2Dg5xRv2XYWU50bUH2svnKO
	RXEngv6FLfBkmwVseYfso3CiWsdiVS3fNScXx9y8c9hBFt9Pe0yIKYdX2X6sZHzD
	Ao9yPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpeg8xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so494494085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357805; x=1794962605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
        b=UqvYVYam1lz0KEQdZI7n06BjFg1Ebu4EBY6IT4qLetaCR71Z5XxYI+mUrMJnF72tgz
         rASbYf8DXRBKABuhYX+vR5sA/wlrk/7u47OCQtYfPhHf7nFP+mpEdNpCky3AtFy+h/3S
         bTqUn/oqc4bXBh+ZoPpVg7VdJSGdQLK39HaSdaYFieyqlZFjPaW3p3KLdOpPi7wA6si/
         3iTDDoEbs92pElGfpKyrU3xw7PdbGE4n6xmMtQ+2Pz11vKz9IXofHj7cyeX3hy/qqMip
         bZL2VlL/3YuU5K+t5Q3Ub1Cvaeyt1Awyx8Sd65erhAcwmi8BcC/KWRH3IblSRXEE6QoW
         kBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357805; x=1794962605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqrKT0cA3nLDIjgKp7KtkPxQyzK/HBBzs1wgJJzWDiQ=;
        b=ax9dQbCHULRP7SLz3wzcHaJ50gl+tpi0IYIBjX5AxQ3/Ki9LdQEO1K40dsqzxo/54M
         FOhP0npD5vnCVJM651u58GQpo8Wnh1NpU5liNWc7OF1QiM/j8Om8yLQjoAi0ZUbLoefQ
         1ZLKV65rn+FUfh+yu3Rr1ZHoQrq+ZEuFK5QwO9WSLSUDvab7BTDKKHyPGfavPzpv9mEx
         UD4/oBVsj1l7POar7pYcmYlQ7qpVHQLwbFoGjXkJ+o79YseAJOSJTlb5j0twWUraTKuj
         vxBjhefohdZIyK1VSA3uu3NsQExs7JddiEN3prd82NYk58yMdHA8oC11mlP+hPDemOdT
         8HWw==
X-Forwarded-Encrypted: i=1; AL+hErElUKBFGv469XQawWZLdX8YY/Dedwb7sJ2Ak8BNGdG7S1Q5gEGCa6WuoH6oUQfE0RBdvxaoi5cuRhuvk4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gtQ2wCPFxFhDfNwj6nlEG30G51bMmWW6xBWpiMa2GyBCC3h0v
	ic3LXOPLcuJgIhKVpBdFG1wKdh2M9qN7aGjGR8dhRnTZa2V/tY8l1UMZQGMA7M6i7BMVsDrSUg/
	8M5fDD+VE3nwQDZC9QycMQmA2RLgS2MkkKXde/xyq8ZCTVFHN38QHR4icUhSmyk87aQ8=
X-Gm-Gg: AYBFou2poBnThsQ44qEQuQUo2aVgahMNLATIqYHF1O9KGHjHzvGCfqnZNOlpojjAfK1
	UJGzIX33zJp2dLUe9fViopSgb+t7HLVxN8qOgRCja8gZymW+FeRhyfISoKIgPaE9yzRbzI2urCu
	CetDKDdqFS5GCq8PcwRSw9r513gq8fgAtAI3eXvhLXIzowgX9K7jSoRgOsAzkmxSMBjkmkIGKH6
	8aODLQEwFSv0fX65c0LPVKsmhJptxQY+emrXGRDbz5+FlPRwTOo7LHKBUp6XXn3Ut0x/kIbFNbZ
	XfU3OYt7EEC2gTVll2r9X5h17odJTpGlPGpo0OfoykFXym0tgDQedinszrhCS0CUv1vyUP0/Dec
	w+J3RUtQMxzHbSw+RSLq2uygeTriSJAMm3QKUDJCYmWtZKtocn/XczStHyOzx6+D+zRGl/+5dD6
	1oR0Ot1vrrEYVsEDiQMqGggLpHMWDfciXRGLk5BxLcEYCTTmh5WHzjiz3KfgMLTQ==
X-Received: by 2002:a05:620a:6c19:b0:943:7e61:fd9f with SMTP id af79cd13be357-947ae71ebf9mr202913485a.1.1794357804761;
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
X-Received: by 2002:a05:620a:6c19:b0:943:7e61:fd9f with SMTP id af79cd13be357-947ae71ebf9mr202908485a.1.1794357804205;
        Tue, 10 Nov 2026 16:43:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:37 +0200
Subject: [PATCH v8 08/10] drm: writeback: clean up writeback jobs outside
 the job_lock
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
Message-Id: <20261111-wb-drop-encoder-v8-8-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6lI15A13l9Pj2MhuBcjzRiQ6NpV3/1ulOmfHPu2OyVQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oSIbjxQ/q7RrVd2MdTNVg0HuzllSpgWim2B
 aZWVwGStq2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6EgAKCRCLPIo+Aiko
 1ddnB/44pQGZq4MXj/3mf9607WzgcNauTKE2H07IKpYHZawQRixcf9lDGxnbcHjUxmBBs+TX42E
 rqXYXuzrynwYs6NMvOOxo3eZmYe4Fb7cFDyIjb7YoT6h9Rhb3T2s3pL7O+HzEBUPLSAjfvQ38Vv
 9MoJ6vDGDkIWI09pjGY30Vu0HguWoVduaJ7Q//RneKQBF1BpmsU0enxhZIMoB1GyOQXy4wDmebO
 7BQJdPJc5AIiPECtyetj8sok9eXrnw/z1C4LuZJZI1QIJYr8YvOYb/6lXSNolXuV1N1w5I3KOkI
 Phr3Y1GDLdliZ7ZUNKjYEkGvOqvEzEX1BNIz4lOcXNL2Ktxy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX+J0ROJAmHtLY
 VmQwtUcZ45NLFwaHCnedckBl9zLFggW6EDXkxrnprQBhxnZXmhU1plq2ZRdxLnVPOSvwrkelitK
 ZTv6fT51yoDeO2f9EeWlVIBkNDZ0Q59bIFfvgFsWV9AzEtRb2AkBh0YX9+J2jYp5u08Ar87LvMO
 CELJtB456nVoZ3s2/iR5m7ugT+pACKaoXY0/EOn1Ie+eDR66CPlSe0yRAKsHnxY/ZRuE0Ewr6kt
 UPnQmUVqiCjGIE/lELQ+nD3K3aapRrCyLDy9B7Q6c/CRFez2Or9K/za8dC8dJUAhB1fNtRpDBK8
 y9J99l94cXW87sCbGjHhPlhZdAgMfIpcye1hFy5mBCFwgI3ipMxdnI1bdGt8E5p+rvzPOfX4Fuq
 5W8s9tcyFLQYF9C9q+djCUnHv0EYYoYD8mWA0HgIeUlXq7KAgMq98qW12Rq+kbL3yXtmIddrnRb
 nR7PePIuUueZXqBnkyg==
X-Proofpoint-ORIG-GUID: H40PaJ8c39o1Y8D21ALxv8Jhj_usFf7b
X-Proofpoint-GUID: H40PaJ8c39o1Y8D21ALxv8Jhj_usFf7b
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3ba2d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ByKfqPmZO4XEhVLTLvsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX9YQiHhVc/3Ce
 /EsNV02N22ZC0o/GGFFgiOawoEdxqMK5zw4EGmegt1hSwypsAe9DgHAA6P3mA1jdmV04bsJsb5E
 XGatgAT+WwNBUC/LrONo3S7lSZrPOgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110001

drm_writeback_connector_cleanup() frees the jobs left on the queue while
holding job_lock with interrupts disabled. drm_writeback_cleanup_job()
may sleep, though: dropping the last framebuffer reference takes
mode_config.idr_mutex and other mutexes, and a driver's
cleanup_writeback_job() hook (e.g. amdgpu) grabs a dma_resv ww_mutex.

Splice the queue onto a local list under the lock and free the jobs after
dropping it, so the sleeping work runs in process context.

Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 2f6a7b50336c..6487f4a104f2 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -281,18 +281,21 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
 static void drm_writeback_connector_cleanup(struct drm_device *dev,
 					    void *data)
 {
-	unsigned long flags;
-	struct drm_writeback_job *pos, *n;
 	struct drm_writeback_connector *wb_connector = data;
+	struct drm_writeback_job *pos, *n;
+	unsigned long flags;
+	LIST_HEAD(jobs);
 
 	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
-	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
+	list_splice_init(&wb_connector->job_queue, &jobs);
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+
+	list_for_each_entry_safe(pos, n, &jobs, list_entry) {
 		list_del(&pos->list_entry);
 		drm_writeback_cleanup_job(pos);
 	}
-	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
 /**

-- 
2.47.3


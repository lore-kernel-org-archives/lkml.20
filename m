Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28604FECEA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415587; cv=none; b=eVKAYEIPvErFyJFyHG8XH7qd+sKrHO5qpbtdu201HOFaiJlTZlOaoXuY1Sa1GKT0S7MpBlKQjac2VHlbaUcXXoHDp8anDsw/PYF7RKVDizByoeHrGqlwK6cReILwKRdi5M8JlLldjM/a01cxkQMrJItMqyqlZc48tlMpQavco4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415587; c=relaxed/simple;
	bh=cJTn82pjvFTmv+adSTGav2SLcNIy0UXB7XKTHYaKc7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1jWIPH94wR7+jFUoWT2BPr6BuXV3XyEvbFPGlDUsUba4g9yu56aisnZohK8nn5p4EpC13rut/O96iVwNfpc0SE+sCJyXARP+H1+ZcbHcawgXvNRjXBESa2eo4VEDxQ0GoRz/W71rk//hfACWiWLlITZltJhXcevyMaG9EjTc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xg/1YfD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVOKaLT8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xg/1YfD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVOKaLT8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2wF724559
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjY7yAp2Z8nvcjzi2objk8Dg2AFP5I6RCbBdptwbxXw=; b=Xg/1YfD8EHqVjLCd
	cSTkcv5ymULTNWeLesqGwFCM3jFTtjmgbly01/uvxugyYBVOsWxKY25puQT98Q9J
	2c93BPO/NmMV5VAmxi9v9Q4OIY3fyJiHVt52FQRslRJolMqPWhwpN/0+qxKkbwdX
	9rXp+O+uCKD6+g/l8I/342rKjvR+y6iTKsB9TUyKzN7Shzutsn0NWXvAd+nl23tR
	SqwG39qcdMwa4ntlLHoALZLa/Aq8+fkYz6JWHyLodWBMPMfxfSgJJrqx3bZ31WZ+
	sjKo+qLiXOiPhIn1bFN1kbe4K+3hkfI/PVEN0YaRse3InRiXjC5kQLSnM0BSM7JC
	THInwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65h7b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:13:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dd3c3badbso501491085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415584; x=1793020384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjY7yAp2Z8nvcjzi2objk8Dg2AFP5I6RCbBdptwbxXw=;
        b=EVOKaLT8r1nhQY4QXPfZk38Tn6FpCOynCdr2bv/5sJixG63oucwfi5gUb5bNpW8uDX
         jvCuzIQV7QuEZ6QXXWsy7FwpfDMyB2eDviIUvVa5x00s5DObU/GAn9uU59V5iT5EUBNh
         f/Bk1mrNkqXcN7QcNchDh5dY/nxIUzcOqw4aRFnG3fSFQKOXoFH54PoxV97vtsyv+t4q
         +Hyz19Ar2hdHjd/P0p456fDUfUil3+teYIpdjUXhLNSu308Fspn+YhsZ/fCKUzjJfRq3
         oM9Q/KL3NTTxWdOGzpxIy6Ihtc6cpJGA/Ef1dZH5fNzyQEhdhIi5RqW1icJKUzFsoikm
         3fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415584; x=1793020384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjY7yAp2Z8nvcjzi2objk8Dg2AFP5I6RCbBdptwbxXw=;
        b=P6pb/k5JYY1NMvHOFuT9ZgAvnZUnZp5edcXRluBoNzd8qmBUyKYBlrByKfDJFScAYv
         FAfuyZXqazSpZ66O22i4JwHCS3XA5Q/ZPSZD8fy+GRM0AMUIX+vRvi3cPlvEra+AWO+K
         tZWulg949KkFn+Nt31RgaY8gSO7XkUZdCd0plNkDovyvWLS8C6bLACHOZZ3Du6vdy7Qm
         NZfbdjH/TDALEDW9zX4cNDZ8ceKPDBB0/l768j6dK6wAh4qcGPflnpu3hW5uIb3GsVxC
         PSoyVslD3LPQuxZewXxrtiGniwR6Ri8xTU8B3eekCPTJhNW/ynPNmhRe0z57NAkIKKA5
         X0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBz9L6RQnDMazQZkME9Sw0rRqDh80gg213lGowpJeSuWb781jICsohKvb/sg9ew2kAqNRVdkCFiNTtgvKkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmAav8hF5jYHQPpPqFlkxNzzQrKLENp1TLAtFgvBywQ9VM6dhS
	lCcbVaz57/5BJH6Ge+ltb7tW/QuusnQFjTS11m//n4aMi28BJIhyr9JIBC3Kcfa1jlJNY3uE7tu
	UmAzkB32OJGHLdMeWdbWDrlrQRsm3SaknqshOb1DUxj18l2ddc8HCf2WhT50yis6gnnc=
X-Gm-Gg: AYBFou3kiy+W6cqe1GW4IYPG74KHDkr9k7HySUCTC10YRf3p/m+4xz2ph0dVcqE0OEA
	VFH36bupEpRz0eBsgnh9shiXFhjIcK+v6Ue0ma8BFnkn1gHkHRYOBNiPF/mIiV17iMID8WipGMr
	mgrcCJARAOVh2Zs0yHe3L86neadpEesJ2o2G7wy0UV8e45KacMUA26ibgHmuX8L2l/Fqx87hAn4
	9bW7STq6IZpSV4aRlmqIGNjwQLwxadm0ydmH5NyyCnFEGe/gFGN7yIfmkPM/jbc3eu03RcuQ4ST
	YKY9tOxqptmNXodqsK6RnOUtFXGUOEDpQZuESNnE5e5w68c5oFd4n4xHK7aqzCcQINWoQqditPp
	4k77vS6wL55Il4F9FJJj0kJxfayutzrk4heH0eiyHvxnxVgwD24SKZyATP2Qtrm0A6i73A02kKQ
	eMLXNXbpRNUxt6
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1248051485a.28.1792415584183;
        Mon, 19 Oct 2026 06:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:939:6c9a:8f8d with SMTP id af79cd13be357-93f29ceec9bmr1248044185a.28.1792415583536;
        Mon, 19 Oct 2026 06:13:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:13:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:12:35 +0300
Subject: [PATCH v7 9/9] drm: writeback: drop the drmm writeback cleanup
 action
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-wb-drop-encoder-v7-9-d4288a26eb54@oss.qualcomm.com>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cJTn82pjvFTmv+adSTGav2SLcNIy0UXB7XKTHYaKc7s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdGrWE90+VGNNBzkJup8rA7qU3hQoX7mvzRl
 8wMEIYTVG6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXRgAKCRCLPIo+Aiko
 1XcnB/4r2B/SnDa+KqzrY9qAJ+Lmba7KA8Op/9uFQB8E2ydzAXcTOqqgHiv4QFUYGKZ4B/Ra6Jj
 uDzpKki/dgdrqbghElst7BBOD9KgAcrauCvD0jhckc5uI7D9naEe7ld4JjvAXgtGkTQdD+XTqed
 Y5+ic4ZkIHQ/Ft9p92DnUsw9HyCq4LbEd+h16HozGCQOKLqF61cdBWLbIBbTrgZuNWXDtUIQU5Q
 DHLG2TdMuMa3kHgVXeFr//FpfmIS95T+IJnDUsyvTS4UgRQa8RnZVX/tlTEPn63rhGaIDhzCKBn
 BlvmeLAa8FjRjkTzflbzt6nAJQJNnv99VENO8gw8577fKCFc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX1MPdcmcql1vN
 ZqYs7YeT2w0rBN1qdxHrGvF6aMf1HMAw1tkqgGT1LpmNZJjC2o5ovUfXzYzUj8lTGtdPxkczGIF
 +NvAoCThrDk0j3tkKL8Ske4Di40WxhM=
X-Proofpoint-ORIG-GUID: 3BEJduT_x7e9dwYNaIxCI55J9Wwe0jNK
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad61761 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jfrLVL6Nzc9eZwqZ98kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX47QO89N0kTr4
 ROOqDTG8uBc1XnJA6c0K1Tl5ZhpNBmmDMQcfAYqNpGGXJgdDjiurK99bO/cOSzLG65uuj3JCIYc
 kqGsziydrh4uuPzN6UBrtW18Avn7uRGnDC623mVUYwxeKCEqgeTNacD/AY3Et7VA3ftQjBpg93V
 Z0eIQZvaUmEdZdK7ING/u/4XxwBeEq2nzYmnxJNen5VFeTRn6h3TtUkR+nPZZ5b4BokNIULV4L3
 0zTcwk2LCXzgNgXe37LlPP7oNuKPnm7VDlQR3gcQA6P8c/3cwXR7kPOsmRUvEbyRxbFMyAWmZij
 mCsHcovgNH43P1Zr8H7pyA6l6pGYq1vdTBrkicUd+KQdSkQvexvZHrTN6KTcZ/ShcsHYtn2RVB4
 vwMwZi6QsW/4Xlwm4Yd/u14yjYv2LLP5fSEbktw1RZmAzGofMLPMTHgX2N6k+36vffsOFHhIUUK
 sE2qTLgLvzxmrNKhBIA==
X-Proofpoint-GUID: 3BEJduT_x7e9dwYNaIxCI55J9Wwe0jNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190052

drmm_connector_init() already registers drm_connector_cleanup() as a
managed action, and that now cleans up the writeback state too. The
extra action registered by drmm_writeback_connector_init() just does the
same work a little earlier, leaving drm_connector_cleanup() nothing to
do. Drop it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 272012a70efe..0c5d2fbe7a7c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -16,7 +16,6 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_property.h>
 #include <drm/drm_writeback.h>
@@ -303,14 +302,6 @@ void drm_writeback_connector_cleanup(struct drm_connector *connector)
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
-static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
-						   void *data)
-{
-	struct drm_writeback_connector *wb_connector = data;
-
-	drm_writeback_connector_cleanup(&wb_connector->base);
-}
-
 /**
  * drmm_writeback_connector_init - Initialize a writeback connector
  *
@@ -321,7 +312,8 @@ static void drm_writeback_connector_cleanup_action(struct drm_device *dev,
  * @formats: Array of supported pixel formats for the writeback engine
  * @n_formats: Length of the formats array
  *
- * This function initialize a writeback connector and register its cleanup.
+ * This function initializes a writeback connector. Cleanup is automatically
+ * handled with a call to drm_connector_cleanup() in a DRM-managed action.
  *
  * This function creates the writeback-connector-specific properties if they
  * have not been already created, initializes the connector as
@@ -344,17 +336,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
-					     n_formats);
-	if (ret)
-		return ret;
-
-	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup_action,
-				       wb_connector);
-	if (ret)
-		return ret;
-
-	return 0;
+	return __drm_writeback_connector_init(dev, wb_connector, enc, formats,
+					      n_formats);
 }
 EXPORT_SYMBOL(drmm_writeback_connector_init);
 

-- 
2.47.3


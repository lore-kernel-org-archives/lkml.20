Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357799;
	b=dgaWCdq6rWeEnLNG4lrK4BvK7EpswJRZeopsBhRz5RHsU7BaxNE9aa4rsEytMWPrZaC6
	 nChQPgCJQU6daEtD885Bt+sWsTXWVoDhT1RfT1bQcO25pgqHD0+Mc7XbfKxRTBy6EAf7j
	 xB7if0FPF4LkJ3tWUPXOYdcpDFfXYHTMaIVKZxNIrtz9i5LwQhreZ5YNIWImGz6P82mtt
	 f4qCaHUy7KuCBrzyFbnYKjG/KwklhmyJPMFQOkuuQ16FImx2XWkjQgY9bvJSjvqpI0dJL
	 Ged9ZBiVsRbHMsqEXf6msJKlPdOT2DpJC5jqnXEULUigGmlh9kCDci/ShUlLRSVrEqQ==
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
	bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
	b=Ax6Y3rWuZRmF69tXlYiMrpq2S8puS94Qmf/c/jylfvKTs+2nT6SgqV0dkoVrtYD9+m/w
	 ZvmV6K3jwjFXZ/PvINRmKsl5daw7za7R3VqqOQrDgSOGIAOD831HdrqDhqqYGBG5XFPW6
	 I33cnCCu92dtHDr5PwL760qHl9bvXh9V+d7TcDMcLQ4wxRmz1zPXvyMiWZPGuoS7xj4Cf
	 bTR3yzHIAv2hOxWl5xc4YSfJNp5bSIMxo72l3BV0v2pqZuZvJtvvdz2ySyU0SG492kB9h
	 RWVPugBGsN0DaU0e+fWBRQtN320O82XLqmZC8x7rn1OsywCBL1z3vVvPqzDplqflKAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpxXNdvG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VS5zOGAf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F05D606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F05D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RpxXNdvG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VS5zOGAf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FJ77725912
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=; b=RpxXNdvGJNyU4xIK
	Yn23v4rvrdzJEam9XSUDSFW44xiRf1LyML+rXyR9eoxnqBhbDw6hg1kgqZiqvgTz
	6P5t4O4ixOBNE0E5HqVjTkgFBgjtsxo+0iJOmtmeOAYoOrjd/VvG9yWWlVI+MiTk
	wWXmrMOV6MLxuWeRNDQQLZS2Bzetp2LKAUSsksgrkAOdbWnA8MaVf7Kf8nf041Uz
	3dZbLT7EGlK6XIsuuE9HOMLNwkV2znTO+5pn5saAwV3t8i9eh2YXQNagP+mXQ1gi
	deG3MTm0keigBQeadD+AmDfEal82BJmpKrMGSd6uLchz0kVczbR9CwJNlpa0i29o
	gbbAsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm82mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f322ef7d3so616421285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357796; x=1794962596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=VS5zOGAfleRj5yd5tVncsuy7KmFTtgW4LiwSH8nx9/feTkTwjHbdmfAYKfBErzFF+4
         /xj58RvBq8uns2FJXbWZOGqLjmY7Gr9Nc2kx8pt+Ou0kAMtSJwLsAWCl1KEDsQ4/J6lA
         L+E00+xL8G4Gz0IFrvk1sp49F7cDptx57E3jptNlGDvCW9O2i7O91Pt0+rCPqtZeE4cK
         uH3CvNNDHpeWbIEaNA6zletf8IFLgDoMBw/hpv8DSg7gtL0fM0joUKndU4x3zjkcEk6/
         HExqH0ZGFMpWaefPglbTyGMGYiR15MdZ3wdwoGxrcRvRgCXfaAx0i3ywz4sSRoRWkuGP
         d/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357796; x=1794962596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDY4R6k/Nm1p1S0xEhbA3aSwiXunRz/voblMx4e/CvA=;
        b=rsOqstNRdRBMgvjqL4UfvL8n2kckZQQywzw7qO+RNy58oH64fjVbwcRxcIYUnTEV5Z
         jVK79mjlhCwIR2GCSH+8JCwTkxxN0SbD4b5otriXlBRyqXiikM9RtZxGj1h7/z3aleA4
         ZsyL1+yyg3OZXA6n91R5b6V7PG3p+K9+r/cX2s+MgCJaqGqYqxyjwBFA5FlEiccmXEs6
         tfA6P3mkeMmIdrNb8x8A9w4p1khXosbGynpg/PaaljQWeFb5N9T+sZ+EMVTOSU40KhoE
         4LJbwqgb59POcpRoIpNzdglonha1oAloLPT3K1I68F1NywoMQ6bCGFqOSDCI1qo91DH5
         AdkA==
X-Forwarded-Encrypted: i=1; AL+hErFun4ryQC4srHQmzAWmbTDAEjsuv8Zw0W2T40mRh85IMgLmBhZ1FDPz1V7MQm2FfY7NpjQDeUwe84+HAS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BvqMRPSHF0/gLQ8nu1GOSFlHsSGmtli2D/NwNegsmvpjcd33T
	FsyqTHQZAopM9gVN4kFhqWraFaZKT6m9+V1FQlPVvXXn3ZMoa6LMEKPlViINPmG9qnur1v/FGCH
	iTfHVAojLL3kycMjXcCoYVEieI68c0McTVKnLgg6K5RHsLhLgxjQHzTGf/9YD4/aNRYw=
X-Gm-Gg: AYBFou0s4UUynJHZ3v49M+1eN6tZLQa0NpNAOhkJVUwv1KcM3Jgv35H4dJEJ3TqkAgT
	JAly8Sf0pcu/X//3XgGAtYk2GFD0SAvg7w0iWPUbAC/dULjnss32K1G/qG62Y5JAPzwD+5rrHD7
	3slNez7gTVLyiiYevP7CPCpvC1U1Lo3vGYDkOl9Q9CvBN+pXkrPPexD3E5aiSqlGHL9BlD1ZOaN
	Sff9mq0eTFWZvWHwY5BZY6Z++E2N1dhxa1KOlXJtrZ1zAP1PBOVL27VVtcH82ReYUlA3bGKaQjQ
	cFHaWLafvBOViO8o5fIZibGV0GsD7x970B/j6mvE7gc1Vp6e6xM7YXWNxh7fj3KmWGZuqD7ByAd
	TNNA3+7BKG6J9TrVazQ6j8//bzyzN2LWEkylylBYD6JfJlVFdJfO64qSqxB5ZAzyF2jDjboQTeA
	l+r85RfR9/54VS2+6qNcBy65nJTW9Qcc2u0PbLDoCq4ITx7wjdtyd+WiOXFWwAUA==
X-Received: by 2002:a05:620a:4452:b0:93a:2e8:5aff with SMTP id af79cd13be357-947aff97f54mr127298285a.21.1794357796037;
        Tue, 10 Nov 2026 16:43:16 -0800 (PST)
X-Received: by 2002:a05:620a:4452:b0:93a:2e8:5aff with SMTP id af79cd13be357-947aff97f54mr127295885a.21.1794357795520;
        Tue, 10 Nov 2026 16:43:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:34 +0200
Subject: [PATCH v8 05/10] drm: writeback: drop excess connector
 initialization functions
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
Message-Id: <20261111-wb-drop-encoder-v8-5-62948ed87d13@oss.qualcomm.com>
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
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEKNuuMhXPGLAYB0Q++KZrnkiKauZVjWcJRHipLfbt4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oM13PxAyI1w9bgajKA46sMEgojpOcz29Dac
 FZ/7CEv9iyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6DAAKCRCLPIo+Aiko
 1cU9B/9UwbZgTFXDQaVSVNSllqahNLCWJgRpFNU+7Iiog9h+C/GQIabCL23UCJwXfsNB6SjPzRS
 MLaXT0agcTPNshHkhSLFC0w0JRAIVcghV6RBP6FVLX0NLR/U/4MLH4C/sEvX/pjfAMsMQgU5vZQ
 Ta9x/RX8m+DCAud8NxSzzPDewDXaUY1+oygjlsPpCPV/b9RuOfO/w831uCHn1EL7N57SrkQqMOP
 oBX383nwP/aUBhqT4XIi7x6OPH4StzxKATQp/oSF6XmYkq/EtQzUCFbADoUliE1+WCb3gJWS1Ul
 cnkMel2fRcQeVGefitJlHJBspLqie1TRY5EEROfVgsVgroM4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ENpfru6Gj_Acl8uvRYbii3zLbu0ochhN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX0yk3caqoyKea
 ngCGjvTUjPWkSaXzBbjmvrJ4mlyqa8IE/MCziYOrI7HzmWR0yge/9uXVj4ndkT2CEC91ZI7qe3x
 Ip/UFqtCw7aTvtBsH58AoolHFLFfN+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX1EsgpmCH+YPw
 Uct+BbXrOPyn3pGBU5Fanmb5W6zAcbO19d6jihAsfai0zde1r1g/wt2Q8mL/ARiYk3LYy3eUZOe
 WCwEPdc0dRJjVuSW022gHqWuCI05qtweKzTsogq76xr2J3yoo/YiDySC+JpKS866pFm7agco/WZ
 pu7XtjPMja8Jxkr0K8ZkPCE7bA3L4L+KjwOYqGjEOcgmPHLN6ftbby4ftD/3E8Oa4uCclo/66Cn
 mzWR3zwOu3HdHMUOVcj9IPT8qWfBpdnh200ot5tVa5rs4GPReRZxG9Pp4qu7ESTZtml4zjkpTgp
 f6dbVB2g58G8MY0fdL3MGH8tX1s1WvxiCrmo18GeQD4XiCrsLH1QtYgAygmnTfd0/CS4jlUK8nl
 eY+7dWmW+u6MV1BYz7o5ZEcBTkW0szFO+vPz/kL3399HvBoblkJKZ41IjUxdUFYHME8qWhW/tq6
 1XP4nA5IbRjxkE8KY9Q==
X-Proofpoint-GUID: ENpfru6Gj_Acl8uvRYbii3zLbu0ochhN
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3ba24 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

Now as all drivers have been converted to
drm_writeback_connector_init_with_encoder(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
field, they are unused now.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index b4a002e6d043..683da368e339 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -148,61 +148,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..879ca103320c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.47.3


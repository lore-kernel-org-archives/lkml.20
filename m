Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357792;
	b=E0UfkJdQwjJFnv3xqJyIFtxfKuqhpe8GBUAjhxC/Lxgy2qrcd8z37du16jXlEcrztWoZ
	 6UDpS5jOb5H2lGHLM+ACyRClwiDUdouZoT56KSD0mR5/E+x8dM53MFIQKLwf7TEg4RoYg
	 Qa5rOwPFBK+sZnl7uDO+ojRCT41UTJDWmYdFFTUEZmCJOoMKUOTk1Xu1xSV2JEx3pw7Y6
	 iJHgmrEzetpSfSCzw8ie9KjQ43D0qeub5asKPkxYblfu5BuqjWRGiAtOhE/K0c7jF/dRo
	 qFjsOJlhFNGH80GqZ5rsxPKNH9VLvWvA5t08NTpEOQ32ssZ0tTF4qFDiaw5xxJ63v/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
	b=c7qTAM7H8HGUBd94hnRnB1A2cYR7x4rZ6/05MrmSNlXNWdESLIQ2EIl3ehjDbGPvjDda
	 MWcNNTmpx5ykEE4N0r4TXq0lic3rSxWmtGXdGbiKoMmnHwu+UkOow7z94mX7WjkkXfNUh
	 VM703B4Tv59/xseOpyKibdPUE8E2HUS1zhxc333YBGPET/f/WnSsVyDsGxhhvO2rtIbZt
	 Ukfl9rdT7RvzkZXcQngj0QJo3FguCSAf6RjYSU6G/6rC3JYxLhBe1ZbSrP78sAvpSdN0U
	 vpVGFQ/6L0W/62/byhUVTct4kkXPX5GhvFEyG1zEIJRmAngZ9+76IWctOF/FmGxPKNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FwDiu2/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EuGvZAt6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B39A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwDiu2/w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EuGvZAt6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKooK3592288
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=; b=FwDiu2/wIVg5+sN5
	ZHhT095rML6/GoXvNZHhQtkyei7HR2++AGRgzcfwdDu5sXzLZAygaaU/xOaH1spL
	SeRTgViAuXfFjw8y61FITPw8sLT2XfwdXxmhKpT+OL8E/GuI259pwlNXGAbF5eGD
	rpP6/1P1++NM0pQcJg4edY+W4rYZsEPGn/clSNhhC8B0iqMl4yINrMh+HCrb091v
	15ChKUGj7ewC9C2HWTfjEcO/sDrzSNLYoNaapZEpXulcJjwI1sivXzRVnLYBfE/M
	3B5vP6aNDVYZJjyObGTfU1L3n3IKwl5qeVY9uY5Q9VbbpUhtHVySB6kP6EmuhfTC
	Ikfj5Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5hqev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91eaad6eaeaso49216676d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357788; x=1794962588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
        b=EuGvZAt6stMQXsk4NekyobBhUT02h4GE/tE0uMDuMdJLZvp8Pu6MgXdcONJk8trQgN
         DyyvVIRw/aoGTgnhqAUvVz36NqjhOUcy2B+vevAhhQxQ5Zu1+pOOINDWLxTj5uaSF+At
         T1EUOFEM/Su46RtQnNHBKNKM2jz1s+iwuktCqDjdKWOt1RXWTG04U7YQS/J/xeh5OQ0f
         oIvYauZ/qZnPvmNVrXGKbyVT6H31Y4lkyZE/gtDIF7xJZJTx7ts+ArP04+lf6Y+07qF7
         /28w7Sgt5Vt3SbfxRU2A5BcLsCyqFyDX+8o/A2WP3VsDocCSlG4uFG9w8CVTFX9e348e
         MlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357788; x=1794962588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc0502QjSovnWK7vfGY36WFYd9ZgYYG4f75fpMR8ddg=;
        b=EDgH5tCtWmGi6XIS+mBDc+Oy3m5KsT9iewD7HG51oSwAOndcaRscZS3MZ2hqZ4wv60
         9MScMZS0fFv6S2uPbR2CIA9rERKFrxlP4UQfR301rXCH1QiONx0M/uov0SYp6+92MsKH
         NxmlIMi1HwYbX+Aw/EwDBtMtDTRLX8VV9FWJADzEJKzphCv6CJeEIxhfrZq4KqjHGtb0
         hc1ysa4cOQrHEVoZh1Ckrj1Vam71nFk2pjdRoEk22uYoN3+Pmy7ZJWGEjRxSY/PyBAuU
         aOK3ZqvEqkZGrlvuaU5ZPcDhxNmZcLwoFG4NwYwEshW9qwqufB72CHrzIZQAKEKgtGS9
         L+xQ==
X-Forwarded-Encrypted: i=1; AL+hErFTH/+C/xVki/3S8zP0JWd6sgHw10JU/5BzvPDfknHkHbziTBI1J9T/IEQfxCT6ybSYG4KaFQyXLZC3JCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z92pYBnfRlXRs4PO+zyRO2RpIrJFTJcL2S6o7Ehw5lScEV3W3px
	fZOTQJpABkCwShzAL5/0+lxVO7jOyWq3cohghMhmYUefSPLPe4/DoFWLmKh9u/+CgqWDZZc/9KE
	cN1rtR1teB27qeebrzijkIsNAxeUomxBeXq12iHxN/q2xUfkLoAK4oV/DuLEkRAN6ISQ=
X-Gm-Gg: AYBFou3O7LY9DD0WZ42mwxIqvzgv7jaypNp36ohSpq2hhtCyCXc+HAq1/xShi0YmHgJ
	OFo61tmrG6CytrxbxoqIl+hvw5MprVvk7ZGQE+mYZwXPp7uqnZ7g9nZxNRLg9iN3m37E0j03rO2
	oIKJcthALt/90ao8kY6nj9zTZZnLKCHEbKTD4wkqxlUyLLfvxJN0Rc2Ru3en+ZYfiqbArlrGKwC
	xpFKbagawNFebArBimkEGU0CimZuF7+b642jbt2S4OHB/QgtUKGqx1qdPHulJ2BI6JH2A7Bu2vw
	/aZEo/tsIEY6qDKMTEqZh0SsQCxtO6ScRH1aUeUwzyWaoVofbg4q4HgXI1bW0QX5vs3w4/4tvXJ
	nSfkqoJakzy+eV4V4VQcna46BzmeQjPoZYE1F19LDyFy38AWQdG6M4g3NvAoVCyxZyLacSg09i6
	fgR6+6mJTFCrTK2R+flpoctc+W69nWeUxu7jJqo2G1cXMGfr+Lnt1OGozLOn0eZg==
X-Received: by 2002:a05:6214:5f01:b0:91c:75ef:5532 with SMTP id 6a1803df08f44-91f040c0662mr15962896d6.39.1794357788258;
        Tue, 10 Nov 2026 16:43:08 -0800 (PST)
X-Received: by 2002:a05:6214:5f01:b0:91c:75ef:5532 with SMTP id 6a1803df08f44-91f040c0662mr15962546d6.39.1794357787587;
        Tue, 10 Nov 2026 16:43:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 02:42:30 +0200
Subject: [PATCH v8 01/10] drm/amd/display: embed the writeback encoder in
 amdgpu_dm_wb_connector
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
Message-Id: <20261111-wb-drop-encoder-v8-1-62948ed87d13@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK2qPY9AT21budCgsaXkgZkIMdXALboBP7lCjCRQJmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87oDKYH3jNhUDLRZlLVx61WMVdAo+SJbh0qes
 1TtBYuzV7uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO6AwAKCRCLPIo+Aiko
 1WDFCACi4kHBwkk3TsZD6c2vsanacmFNZzYYNpYYP/z3Txpuw8+HfYz7XtP2ofaV9QjCs44w0tK
 GMpfFO34XwYny0M5QYuRdDTTCzvtHhLFuKLSbh9HMbSNhg4oSXj8eefowqj3pjqTgMygxlu3ADV
 OdYyGNKhidlZwYPpDzeQ6vQpRGuIe4Idi5zSp4X7Qbw9rGqlmhhY2GiRR2OGfzfHfrOj8RElScP
 QB+uKf2B/qo2G0magfZMeCaUJDEZylYsE61a/aVYW6h31G5BwHDBXi1u+t+h5Dirgbk5g5gcKdm
 IOXCQ+Exht3fG0gGhgEy0xCO/vyZFwwKX52KiiEzmR+JP1Hw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX+QzVTvrMAeHM
 Gq+SM8/6p5YH/r3vDTNsJodq1payEk43qGZFFIf1zJZv5X3N28rJUD90xtrpXuCLrR50iekOs8a
 Cdcnwl4f3jbuKudQ1N9tjDAFjb9CxJdMMYpyP6D2KDElVLu7lY6nbbv38FCtkpdf8acwpKR3NAJ
 cXNnzGnR8WnN0gxlSCJefZn2Ya3+ehcuZPSUxPXcLHyMvUtg2urNJ6XJLvImbCcl1rfyNU1W6j0
 dt+NUrGmPQEwzXAlFBhfQ725SLUFYmI6jUDzf4LysXdrwSbMm8UnJ0nZZqyViaD71q5drE8c8mW
 /eFk5YyjEGOPwIFv83awISPNet/TEMR2eNSkqYvLvEZ2hZ1SjrPbMMzFRfAioP+pBreM4HVSiNb
 KnqM54PMbCwtyKqqheyoJLZYf0u9sW5WmM/upH9iji+vXl2b0KyMkrrDTZjjjn3MkkEnuT355nZ
 ghncjGw7OXZmhSxiz2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX8OlADQnIB5Q4
 E5I3l5MzWX+b6YuaycL3JKxND5a93JzqwM+yaF9Peh/wyC7lJ1uoT8oSluaYpzMcdeJZ5CiBZ1D
 EflAQp/6TvkSTiEeSSaZBaT4oxBXUcI=
X-Proofpoint-ORIG-GUID: aXUjyriXfShPftiRKF6PVircLnPmBHU8
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af3ba1d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=_MfM8nSJvC0osUG94L8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: aXUjyriXfShPftiRKF6PVircLnPmBHU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

drm_writeback_connector_init() hides the encoder inside struct
drm_writeback_connector, which is the only reason that structure carries
an encoder at all. Every other writeback user already owns its encoder.

Embed the encoder in the driver's own structure and register the
connector with drm_writeback_connector_init_with_encoder(), so that the
encoder can be dropped from drm_writeback_connector.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 29 ++++++++++++++++------
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |  4 +--
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |  4 +--
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0ea45ab12119..77788a2289fb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4812,7 +4812,7 @@ dm_set_writeback(struct amdgpu_display_manager *dm,
 		goto cleanup;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(to_amdgpu_dm_wb_connector(wb_conn)->encoder.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		goto cleanup;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1b91fe4c3171..111bb110c439 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -935,6 +935,7 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 struct amdgpu_dm_wb_connector {
 	struct drm_writeback_connector base;
+	struct drm_encoder encoder;
 	struct dc_link *link;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 39b7b3e49f6b..e0ef23f692d4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -218,6 +218,10 @@ STATIC_IFN_KUNIT void amdgpu_dm_wb_cleanup_job(struct drm_writeback_connector *c
 }
 EXPORT_IF_KUNIT(amdgpu_dm_wb_cleanup_job);
 
+static const struct drm_encoder_funcs amdgpu_dm_wb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs = {
 	.atomic_check = amdgpu_dm_wb_encoder_atomic_check,
 };
@@ -247,17 +251,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 
 	wbcon->link = link;
 
-	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
-
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
-					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
-					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+	drm_encoder_helper_add(&wbcon->encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+	wbcon->encoder.possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
+	res = drm_encoder_init(&dm->adev->ddev, &wbcon->encoder,
+			       &amdgpu_dm_wb_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (res)
 		return res;
+
+	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
+
+	res = drm_writeback_connector_init_with_encoder(&dm->adev->ddev, &wbcon->base,
+							&wbcon->encoder,
+							&amdgpu_dm_wb_connector_funcs,
+							amdgpu_dm_wb_formats,
+							ARRAY_SIZE(amdgpu_dm_wb_formats));
+	if (res) {
+		drm_encoder_cleanup(&wbcon->encoder);
+		return res;
+	}
 	/*
 	 * Some of the properties below require access to state, like bpc.
 	 * Allocate some default initial connector state with our reset helper.
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
index e77e6fa18a72..e15db8c41662 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
@@ -4567,7 +4567,7 @@ static void dm_test_clear_writeback_removes_stream(struct kunit *test)
 static void dm_test_set_writeback_no_pipe(struct kunit *test)
 {
 	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
-	struct drm_writeback_connector *wb_conn;
+	struct amdgpu_dm_wb_connector *wb_conn;
 	struct drm_connector_state *conn_state;
 	struct drm_writeback_job *job;
 	struct amdgpu_framebuffer *afb;
@@ -4597,7 +4597,7 @@ static void dm_test_set_writeback_no_pipe(struct kunit *test)
 	conn_state->writeback_job = job;
 	crtc_state->stream = dm_kunit_alloc_stream(test, NULL);
 
-	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base, conn_state);
+	dm_set_writeback(&adev->dm, crtc_state, &wb_conn->base.base, conn_state);
 
 	KUNIT_EXPECT_NULL(test, acrtc->wb_conn);
 	KUNIT_EXPECT_FALSE(test, acrtc->wb_pending);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
index b54624385e48..8359ef046c9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_wb_test.c
@@ -510,8 +510,8 @@ static void dm_test_wb_connector_init_success(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.funcs != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.helper_private != NULL);
 	KUNIT_EXPECT_TRUE(test, wbcon->base.base.state != NULL);
-	KUNIT_EXPECT_TRUE(test, wbcon->base.encoder.funcs != NULL);
-	KUNIT_EXPECT_EQ(test, wbcon->base.encoder.possible_crtcs, 0x1);
+	KUNIT_EXPECT_NOT_NULL(test, wbcon->encoder.funcs);
+	KUNIT_EXPECT_EQ(test, wbcon->encoder.possible_crtcs, 0x1);
 }
 
 /* Tests for amdgpu_dm_wb_prepare_job / amdgpu_dm_wb_cleanup_job */

-- 
2.47.3


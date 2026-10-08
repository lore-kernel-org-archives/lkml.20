Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897D3C76A6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440662; cv=none; b=Ooj91YC0a/6vjBfEzuHW6IeRcoD1paUy/kN77YMknn2E/zblJ0xemjSfxC5sZw9Ml4ZKmEsFBAQXEufpoQ+bqIxV4FxPtkWxoKbzKXzQa2kuIs4AfXxsN4B/vHGL9oLbCDW8tu17jQiKY+WGN2/BtZTed6yF3dzh6xBLCrL7qWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440662; c=relaxed/simple;
	bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jsAzeXUInNaZidKk/r17ChRa5HJorrG9pGCajm8h4dq+HU7q/e+eRak3Xn6ZceMFBkX/piSbGe5bI1a2/Tys2AcoAwAftMaV9GN/pkHaUHeJvlQjim5UKMj4r5xtt50hl8wxM+/i6x2+4xz4t2uS+gJl8R56zCi3RmV30yKdWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFmNdFpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeNs94ni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFmNdFpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeNs94ni"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BmRJ1433848
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=; b=TFmNdFpOlG6NHlIp
	ysObBgGGLPPajn+bvzRVehKaxBQR+MqGbnXHIwO80l9sznaCsHTTxnr67Um5cruq
	6Ak60HUHN2YY8cPW4VydPR5c8Y+elQTNoklcIReDUvjI1YvdvrW3OMvTPtUfRij3
	0hN9WZrezjRdiGQuqO/Djk37SFsmiiU1oAE28/O5GwmNbUshM92gp1hmYDA9QWXw
	kxzHyNOX/TnywHGk4RfPjYYkncHlCKOlyvrX+9Rd3LYs3M0d5qc3lUHOS4A60D/c
	tR4uoBtujR1aRD/3K2X8Q6rY6XKzhh6WeB5b+lSJLyPOYbrAPfr6IbPCpnjMFWAA
	59VVRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3hhqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:24:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4849373a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440658; x=1792045458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=LeNs94niub6zqddIfBZ6xBnVOrlC5hJM3obvzVG2rNOTMvqRMjaejf7JK2gnCOzPqt
         l13oGXB74Bj2C/K/LeDwV9wNz84NEMJbBiwut9D2Aaj8WSFAJ+4/diT6uiU7XpqwMvWw
         wNqpJ6myF1EJRRirPzALc+6/n9cA3RCcsvr/4gDJdMCegMnaPQM/bTmghiC5tJN1CyI0
         z4zmPdfjaVLJdxXZwTwl3QuRbN/y8YSkesqDiuP42w1CgzVWnDfOP7DhlLSQqBTP3kqr
         aWfB30SOSW63DyltUB56CI1pOOEMmhhjmgy0ASyZ8L+3IlvNApO7jOXa3i8tjObYE3kM
         uulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440658; x=1792045458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=KSBfqbM3zaZG7l6AYE4Zqeb+veYOwuTDQhmKs8/LBF2COklq9eTL57GxvQMS76oesT
         /ghRdVnAAn2y3pwY+2GloCeXvmLiyLCVWozt1IXXCzGvBhx3jEl19TQ2yUnuG36TQRd3
         dwqQsQwYOe947D3d2p1Y8PBTH78rjHiki2pUODo/yt+0hz/dGPQDPpcCM9w5zjmoBczS
         h6Awi34Ez+kK5WseNbxvfbrS+S0Vh2xVUHB8CC2whI9/Ytr5WDvvuBT9omnQy/2ZppjG
         pmfVa0M42MWcJGpC2orw1rOy4yjBA5bxAhBbBD4+QUtIrsBnB2nw9s0DvmOpW0HtuCwe
         KMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7gcOSXur7iUJXx5BHBTiCFynx4u+j2kiamiOABWfXxT4oGTaI1584WbK0jm+Mh4FOKdNumfm7kFxZMts=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoBN+/WlcTukXV1NsOf5MG7jAI0li4Pn+eFdzNUA389raI0I5F
	U+RX3t0Vf49xetfA1MqoHRRL3Y/wz8nDkWD/RvPCtEPEo7dBuh7dK2mIH6VGCiKXf+BOELNa4AT
	Ia9pjw8Zebk5zx0L1TlLtsWvKzEcuKkVkPaufbxEK+8MoWMNItEYUeAw0nD+BD6IMvlM=
X-Gm-Gg: AYBFou0McDkcGmN1YmWMfEooL2SN9QXQcAg6fWxHS70e/b+CCUIxCGdHYep8OaXk6Z3
	oFVo9ybqCuVbsM3xvJKe4kX4BwgAKI34ok6Ol57znVSIwQtkkS7RkIkznc+XXeAOFo4tE4+4Evi
	SSWnI43elsFm7F7E+Ak4kzWhDyOE/VcA7yzMyHdLFl0BXjzeOQCVW+QLPmmIefaEeVgJT5rY3ei
	rBWqR6QiMY1TqddI9toTbITF4rOMD6evtb1VjHTx/nxdqm5jYUr//GDmI7BHlhCOqgLYuzQbV7P
	bZGQmHGE8u8KFHQnnHor5nBfeRiTbKWvz8sUfZecIjUcv3dY3CAos+0dTl6H7fqIIAxavCgIXH9
	XEAMoLTqXc8zih+OWilmoVLKvzTgE
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477742a91.51.1791440658326;
        Wed, 07 Oct 2026 23:24:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477720a91.51.1791440657697;
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:49 +0530
Subject: [PATCH v7 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-5-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
 b=bOPbALLTjtghyIg6XWPv+m4uZabc/9k/qXf2m7FLi9ATry5ElCUPscnHwYbhJuhKdksUdejlf
 zmj75EumEjGBqTI4IiSli48DtA/009ODsG5zbLLblm0hBjfRMLBzdnL
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXyUXkRQ0RIOVG
 iAtciRNWdkab07nf3VuBKMYq+5grxolb4LHpTiwSfeO/IG/m+UxgtZzxmC+BA16cQ7S7vxC7J6T
 5ZSoIeYOUfJeypIclII9sdikLogjAxQ=
X-Proofpoint-ORIG-GUID: VmQ4ZvLoNUg6PPSkKMkUGRdQdABuMyf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfXzNRQ0WahDiRF
 oFsm4M11iRJMw+hWpILY/a0OwZJ0AMhdU+Mst1vxFqEoVopNglLR7r7Crw49YYffBZPg4lcUHDq
 6idvfTv0eIdirHAw0S7oXM1VWxZFidmZUORLmhtHvPKmDK97aedkkikWTjGYBAQdZf5Jpq3k2Ch
 A92MgRHGsfkztq6mdPT5+ZT9pZrKBJbhbsT7wGf6kPmJoD+l89o9VJRF5JcM+zWOmWzPN6MyZPp
 s75ed3sPTZWUNGzDOJOthnBaNt97MpAnn7Yu5DgmEDrIJq8sk9SbAbmsjDnXWMCb0xhjLT6U9Fj
 uhN6FYGcBws23noFffEkkAK4f9A2RjHkx28nkMeuXNMO7KOz/l32nR+G9abqz71cygm2mwaqBjX
 edRnMBLc3fS2k2ENMNg13c9HVke+SmBfXmkTvJbgPyo/TUrOg7Q2TNjcW0M/MqfOgAlGRooTpDH
 Z7LW1P0G8XCEYxWjrWA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac73713 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VmQ4ZvLoNUg6PPSkKMkUGRdQdABuMyf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 7fe5158c17e9814f50b2065202a629eb10a742a8..460695055572151003110f4aec1d682b92753770 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an

-- 
2.34.1


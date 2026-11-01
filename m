Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571866;
	b=pnpLK8aCmp4ABXXEzbyp1hX6sAbBDWmQBQr2mmTEqr1E9xiq+ImHQItKDvUFZgl6j4yz
	 4Gm9M1iEXlV1Pw4lAf/qIsC9kZNom88EoZCTU7IU7tCYbL5m8WituENmUUKhBbJIKKEa5
	 6hMOz+LrGuo8s1kWke80GGIq9fVZvwKneu6Jb7mA6ImYft7xMo9FSZeLvI2pu2hWe2p4c
	 b7CwNyc/tINJtUqYNhKDw0mVHw8PeM2/etaebEBfS2DKf3N7kGMcS3k9e/AYaNHW2q8UT
	 rb5TGLtmTb7gdkfvwqN6OM5YlbEGq5NfpF3FNQgekaJSiB8NPTENBh5wXLoddeqmsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DDIjv2t3kxu4uCj5kTpqmf+g9+klZ8lK8KCpkELT5QI=;
	b=PBRWAqCuVWMlHp9xTvbsXRS8TRJ4nN1ROzjlVeKXwMxL6Zxr3gLeJGHEMJPBbvq5IuGc
	 Ek9wB6puBt+Ot5KrZ8glVisVqZC3fd2sSIbOaCseXNSQAhdk0oePQ3PyiKAYQwdjPxQc5
	 R064oXnt6DNqVwXQGtJiDGvBL070oIlBVl2TyjaUfAt3kVdYbhRxkVBPXVOGcsxxkGlJg
	 CaBl3wBmt4JY3g0ZPtRR3vie46PDMG27J5aeYCOxPhOw4G9plTNb3Ze91lz2hZxnY0dy7
	 eKhdE8W+Uy69uhEMJ8krnvN3399aJLvcmSnzMWt9aQRALlBjYPOgNv0ZtXUYzCn9XzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0EMW8rw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpEHLDeK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD30606A333
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD30606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0EMW8rw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpEHLDeK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK9u62377098
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDIjv2t3kxu4uCj5kTpqmf+g9+klZ8lK8KCpkELT5QI=; b=R0EMW8rw09zvPbpV
	0X0hZ03EvuUZTcUVYRzUBAioVMR0K/g897QQL89fauhqDPsAA+T0tGM2J0jKvSh1
	ch6943IsdHv0hRydd42zYkHpizM+dfQo2AO5eHnPMGIU05d4GfJSIzji1E0KLWKr
	Cc5Y1GzjqHryE6xU/5vWIT3c427gzIOrggJ+Dvh5DNTKpxrZsRY3z9Nm83tbwlZN
	Iv3xzLZPBx+uX2pFo/Xffalhnao3Zl8dErFe8yONAPYMerq3WkXmYykSt1+TnyAa
	JLT9sA3QmYsB0aD4c/2FPablPyjJ4uLNhflWavsC54vsR4ISxrHU2votYbd1bK1Z
	kD5mmw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6me6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:24:23 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-189d17eca17so1840245c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571863; x=1794176663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDIjv2t3kxu4uCj5kTpqmf+g9+klZ8lK8KCpkELT5QI=;
        b=SpEHLDeKIOnQ4KQAQhB/EJRpRHxLROFBFsyadhZXETCNogVRtVLRUQz8OtunsjWgb+
         NPuhorYDr7U/LtqwPXKe2ErRW+y5wEIf+vlC/+ZtvzQjzgS0atsDxVo7qOqEgO9ZVLaG
         W5pr4kjGCU22goWg5dfhRQOxVe2/5l6tvhUQIvMmZO3MVYiIO8UxYj7RLaP81j9stdHA
         bjqWksvp8z5Iaco0L7BGBktXAwRaRk5VUTgaDbexpQg7Aw9OrFTgA853tvjzulW/QrNt
         mccECjRNUlQovIGFldYhdMv0CpBkA95L3e4a9n2IhTOYAKyJvCQ+htCHjYy24ocAyE8q
         Pitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571863; x=1794176663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDIjv2t3kxu4uCj5kTpqmf+g9+klZ8lK8KCpkELT5QI=;
        b=MJH2rqYSvYMbuEJfMgLgNFEM7cPk7WxvLXcUPfF7t4EQxrAqk+KVKdY9viWWJbjtoO
         2AxmwLMYLDFMtBDk02S3iASQCESBqmlY1Y1UHtyE4vZki9A8TJ+Ku5W/28YU6SVunnS5
         4cZsASpe5gdxF++c3rmMuCBIoG40gGI/QXF1LZYIX860cwTr5ZQTEtrpg8muOg/wEy6m
         hNUbRCoLdjGQzd6VDJVXrXR+LANd39JPcOkITpSiGoU6sKv4qgQrMreoMG0AEdYrrEln
         aaCLXrSOc3IQEPaIVggZJqAOaqtpyO3LglfndeeT4VHx3DlbkcUexpkjf/rmj9WV+Q3H
         CGyA==
X-Forwarded-Encrypted: i=1; AKwUvBzfHxwHQvkT3wKqMc1Pvsr7TkOXs2S4oZILYgS1YGYusSYgjTKuO62/BiOb01/xtOfSGetO+RTy+wpCM5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAC76/JFmEsiLoS1X8cXVXMgsoa+VZwqqSwUMOhHSe4W27Gn46
	s0PDvUBQS4liGqK04F35N3/ZMa8+zWM78eTQ0vPe4rYTr0xqZ9lQPigkmXY0a0itQcmIU7u1gJ/
	dpU3IiX6cABLQcmleEOebYSrHUIt9gWFDK6ScuqJKV9shc4agntPltnzk73R4TnuioSQ=
X-Gm-Gg: AYBFou3u63IUNnipfme9YwfyfXVeinGSQlct91lgZKRaj1IHXKKPkH2rn9cmyzv7GQO
	bONTygYBAm/cBfmW2pJEoofriaUWEUjCDTIB1yXcpHzqYYrDlyG6EWxU1VMrhKowRPpQsjWZtWU
	7u9sVBpHWDlgDnrwki7zkHxqQtGzolG45YcCkARYPM68DKL4YOIOz5qVWSFtVT1dcb+r4ftiL2a
	kE4isXqP6uXWaJQnpvHrdZwf0GV5iG/2ifbACkGK9OWzZ9AIoHhc7WgZBWbRfoya7e7VwWFr+n6
	5+WbsclhJNnbemUw4JYm3XJDsexYols9kCGZu0ApnTyaaQ7eP2LWVAMiShKHQyV798C1JlzPNx2
	LOT9qsShecMshj74gDwvS4FkMirVl8yDVu15fOwg6v3pjesjiV1HXdcZkpqqkkRwrG8R6bkoeRS
	Mq90zh0g==
X-Received: by 2002:a05:7022:f908:b0:144:c123:4036 with SMTP id a92af1059eb24-1ac5d2c5c0amr11394379c88.35.1793571862634;
        Sun, 01 Nov 2026 14:24:22 -0800 (PST)
X-Received: by 2002:a05:7022:f908:b0:144:c123:4036 with SMTP id a92af1059eb24-1ac5d2c5c0amr11394357c88.35.1793571861908;
        Sun, 01 Nov 2026 14:24:21 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:24:21 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:29 +0530
Subject: [PATCH v4 16/25] accel/qda: Add DSP process creation and release
 to the legacy shim
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
Message-Id: <20261102-v4-v4-16-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=15146;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Zu4aikUS4z99rvRIW0FEBWJEg6EthgJ2icSkGnfIaq0=;
 b=dvTOAynjWA2/5F1p6yz8+TXl4m6fAzi7njg3ucAkW1+M2EwEbECsEBbHhBgNlscgIdhNOBV2Y
 K7CfACy0e/5A9c1lVk/ahXtrgxvCKGOkF7gl/xjFlAyV5WgIKTpOuZK
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: ww0KJHGH9Vaeq2YDKsUK2u9oiQ5_We84
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7bc17 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SfWijOj2cehhM-0QlpEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: ww0KJHGH9Vaeq2YDKsUK2u9oiQ5_We84
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXwjqJ5J+X7u2M
 p1q6B90bnn6nJ8GcA+xBPO3Qj8rIq/i4i98BZbJexpNqUtDrujLL4uzGhdl7YbXiSjnuUi+AuU+
 AMRpPmQmdz7GnKsDPfBEDnW+ljD/D3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX4HolNYZ9TSRT
 MTozDOtc+MpIcT2zwrrTSBWLkBrAEjZbl2txZM4GyX6/KOh/wJMmyKjNLCuyN0XWNeYh/NBCNyj
 8Ibw9ufVlMMviPX8IIzkUToBSk+WWPPkTVSGi1eVm2KBYOASz4QRNmuMQQfSgoNZmL/U8eBEUKC
 e8UVkvp33jXD6IvwL0V2BSlh8vb3o02NysIAQ1NLlWbgv8x+mvRMpUbe34T7kZV607khW1yXykO
 27/g06ZK5EWFH7UjS0OWBa6oLRcyodDsiqI0LD8Rtkwc4byi/DW6dmW0cwmYG+0KKkn69Iu7otb
 BGlMg3uTX2seQTPD9WNyf5900H1rRO+F7ldQ2W+zIYXtcAuqB9VRDGe22roS99/Bw6gyF5c3Y2W
 +241avOv74PU9+fwnq/l009U3WKtXBTVTzxcA3rInO7q3tP2wK2sJUWzklRv41Z46JE9UdMUj46
 OG4sAVPZzhWyRSHssAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Applications written for the /dev/fastrpc-* interface create their
DSP process with an ioctl that names the ELF image by file descriptor.
Serve it by importing the descriptor into the session's context bank and
creating the process with the shared creation code, which takes the
already-imported buffer in place of a handle. Closing the file releases
the process, as closing a DRM file does.

The old interface offers a secure and a non-secure node per domain.
Mirror its rule: on a secure channel, a client that opened the
non-secure node may only create an unsigned process, and only on a
domain that supports them. This sits in front of the shared check that
a signed process needs CAP_SYS_ADMIN, which applies to both interfaces.

An ELF image passed as a bare pointer rather than a descriptor is not
supported, as there is no buffer to resolve for it.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc.c      | 35 ++++++++++++++++++--
 drivers/accel/qda/qda_fastrpc.h      | 17 ++++++++++
 drivers/accel/qda/qda_fastrpc_shim.c | 64 +++++++++++++++++++++++++++++++++---
 drivers/accel/qda/qda_ioctl.c        | 22 ++++++++++++-
 drivers/accel/qda/qda_ioctl.h        |  3 ++
 drivers/accel/qda/qda_legacy_ops.c   | 39 ++++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.h   |  5 +++
 7 files changed, 176 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 4672405ea4b7..35ce60f3de2e 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -757,6 +757,27 @@ int qda_fastrpc_invoke_legacy(struct qda_dev *qdev, struct qda_session *session,
 	return err;
 }
 
+/*
+ * Use the ELF buffer the caller imported itself as argument 2. It is checked
+ * as a buffer named by handle would be: it must be mapped in this session's
+ * context bank, and the image must fit in it, as the DSP would otherwise read
+ * past the end of the buffer.
+ */
+static int qda_fastrpc_use_elf_obj(struct qda_fastrpc_invoke_ctx *ctx,
+				   struct drm_gem_object *obj, u32 filelen)
+{
+	if (to_qda_gem_obj(obj)->iommu_dev != ctx->session->assigned_iommu_dev)
+		return -EACCES;
+
+	if (filelen > to_qda_gem_obj(obj)->size)
+		return -EINVAL;
+
+	drm_gem_object_get(obj);
+	ctx->gem_objs[2] = obj;
+
+	return 0;
+}
+
 /*
  * INIT_RELEASE packed layout:
  *   [0] remote_session_id	sizeof(int)	IN
@@ -796,7 +817,8 @@ static int qda_fastrpc_prepare_args_release_process(struct qda_fastrpc_invoke_ct
  */
 static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
 {
-	struct drm_qda_init_create *init = argp;
+	struct qda_init_create_args *create = argp;
+	struct drm_qda_init_create *init = &create->init;
 	struct qda_fastrpc_create_process_inbuf *inbuf;
 	struct qda_dev *qdev = ctx->qdev;
 	struct drm_gem_object *gem_obj;
@@ -853,12 +875,19 @@ static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *c
 	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_comm, inbuf->namelen);
 	/* The image starts at the beginning of the buffer the caller named */
 	ctx->args[2].length = init->filelen;
-	ctx->args[2].handle = init->filehandle;
+	if (create->elf_obj) {
+		err = qda_fastrpc_use_elf_obj(ctx, create->elf_obj, init->filelen);
+		if (err)
+			goto out_put;
+	} else {
+		ctx->args[2].handle = init->filehandle;
+	}
 	assign_kernel_gem_arg(ctx, 3, kernel_gem, gv + off_pages, sizeof(struct qda_phy_page));
 
+out_put:
 	drm_gem_object_put(&kernel_gem->base);
 
-	return 0;
+	return err;
 }
 
 /*
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index eaebc4e99676..a5bd7661c26c 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -261,6 +261,23 @@ struct qda_legacy_invoke_arg {
 	s32 fd;
 };
 
+/**
+ * struct qda_init_create_args - Kernel-side arguments for creating a DSP process
+ *
+ * Wraps the UAPI arguments so that a caller with no handle table, such as the
+ * legacy shim, can pass the ELF image as an already imported buffer.
+ */
+struct qda_init_create_args {
+	/** @init: Creation parameters; @init.file must be zero */
+	struct drm_qda_init_create init;
+	/**
+	 * @elf_obj: Buffer holding the ELF image, mapped in the session's
+	 * context bank, or NULL if @init.filehandle names it. Borrowed: the
+	 * caller keeps its reference for the length of the call.
+	 */
+	struct drm_gem_object *elf_obj;
+};
+
 struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
 void qda_fastrpc_context_free(struct kref *ref);
 void qda_fastrpc_cleanup_handlelist(struct qda_fastrpc_invoke_ctx *ctx);
diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index 03fce990ccdb..4a2ba20ee01a 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -24,6 +24,11 @@
 /* State of one open /dev/fastrpc-* file */
 struct qda_shim_file {
 	struct qda_session *session;
+	/* Opened through the /dev/fastrpc-<dsp>-secure node */
+	bool secure_node;
+	/* Properties of the qda_shim_dev this file was opened on */
+	bool secure_channel;
+	bool unsigned_support;
 };
 
 /* One misc device node */
@@ -31,6 +36,7 @@ struct qda_shim_node {
 	struct qda_shim_dev *sdev;
 	struct miscdevice miscdev;
 	char *name;
+	bool secure;
 	bool registered;
 };
 
@@ -42,11 +48,13 @@ struct qda_shim_node {
  * offload, always get both, so that untrusted applications can still reach
  * the non-secure node on a secure channel.
  *
- * The two nodes behave identically for now; what separates them is applied
- * to the operations that need it as those are added.
+ * What separates the two nodes is applied to the operations that need it,
+ * using the channel properties recorded here.
  */
 struct qda_shim_dev {
 	struct qda_dev *qdev;
+	bool secure_channel;
+	bool unsigned_support;
 	struct qda_shim_node nodes[2];
 };
 
@@ -89,6 +97,10 @@ static int qda_shim_open(struct inode *inode, struct file *file)
 		return err;
 	}
 
+	sf->secure_node = snode->secure;
+	sf->secure_channel = snode->sdev->secure_channel;
+	sf->unsigned_support = snode->sdev->unsigned_support;
+
 	file->private_data = sf;
 
 	return 0;
@@ -98,6 +110,7 @@ static int qda_shim_release(struct inode *inode, struct file *file)
 {
 	struct qda_shim_file *sf = file->private_data;
 
+	qda_legacy_ops_table.release(sf->session);
 	qda_legacy_ops_table.session_destroy(sf->session);
 	kfree(sf);
 
@@ -141,6 +154,43 @@ static long qda_shim_alloc_dma_buf(struct qda_shim_file *sf, void __user *argp)
 	return 0;
 }
 
+/*
+ * As in drivers/misc/fastrpc.c: on a secure channel, a client that came in
+ * through the non-secure node may only create an unsigned PD, and only on a
+ * domain that supports unsigned PD offload.
+ */
+static bool qda_shim_session_rejected(struct qda_shim_file *sf, bool unsigned_pd)
+{
+	if (!sf->secure_node && sf->secure_channel)
+		return !sf->unsigned_support || !unsigned_pd;
+
+	return false;
+}
+
+static long qda_shim_init_create(struct qda_shim_file *sf, void __user *argp)
+{
+	struct drm_gem_object *elf_obj = NULL;
+	struct fastrpc_init_create args;
+	int err;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (qda_shim_session_rejected(sf, args.attrs & FASTRPC_MODE_UNSIGNED_MODULE))
+		return -ECONNREFUSED;
+
+	elf_obj = shim_import_fd(sf->session, args.filefd);
+	if (IS_ERR(elf_obj))
+		return PTR_ERR(elf_obj);
+
+	err = qda_legacy_ops_table.init_create(sf->session, elf_obj, args.filelen, args.attrs,
+					       args.siglen);
+	if (elf_obj)
+		drm_gem_object_put(elf_obj);
+
+	return err;
+}
+
 static long qda_shim_invoke(struct qda_shim_file *sf, void __user *argp)
 {
 	struct qda_legacy_invoke_arg *largs;
@@ -210,6 +260,8 @@ static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void _
 	switch (cmd) {
 	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
 		return qda_shim_alloc_dma_buf(sf, argp);
+	case FASTRPC_IOCTL_INIT_CREATE:
+		return qda_shim_init_create(sf, argp);
 	case FASTRPC_IOCTL_INVOKE:
 		return qda_shim_invoke(sf, argp);
 	default:
@@ -256,6 +308,7 @@ static int qda_shim_node_register(struct qda_shim_dev *sdev, int i, bool secure)
 		return -ENOMEM;
 
 	snode->sdev = sdev;
+	snode->secure = secure;
 	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
 	snode->miscdev.name = snode->name;
 	snode->miscdev.fops = &qda_shim_fops;
@@ -293,8 +346,6 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
 			  const struct auxiliary_device_id *id)
 {
 	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
-	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
-						     "qcom,non-secure-domain");
 	struct qda_shim_dev *sdev;
 	int err;
 
@@ -303,16 +354,19 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
 		return -ENOMEM;
 
 	sdev->qdev = qdev;
+	sdev->secure_channel = !of_property_read_bool(qdev->dev->of_node,
+						      "qcom,non-secure-domain");
 
 	if (!strncmp(qdev->dsp_name, "cdsp", 4) || !strncmp(qdev->dsp_name, "gdsp", 4)) {
 		/* Both nodes, so signed and unsigned PDs are both reachable */
+		sdev->unsigned_support = true;
 		err = qda_shim_node_register(sdev, 0, true);
 		if (!err)
 			err = qda_shim_node_register(sdev, 1, false);
 	} else if (!strncmp(qdev->dsp_name, "adsp", 4) ||
 		   !strncmp(qdev->dsp_name, "mdsp", 4) ||
 		   !strncmp(qdev->dsp_name, "sdsp", 4)) {
-		err = qda_shim_node_register(sdev, 0, secure_channel);
+		err = qda_shim_node_register(sdev, 0, sdev->secure_channel);
 	} else {
 		err = -ENODEV;
 	}
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index f51ad0bc9e9c..99b8a2517726 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -137,7 +137,27 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
  */
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
-	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_CREATE, data, file_priv->driver_priv);
+	struct qda_init_create_args create = {
+		.init = *(struct drm_qda_init_create *)data,
+	};
+
+	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_CREATE, &create, file_priv->driver_priv);
+}
+
+/**
+ * qda_session_init_create() - Create a DSP process from an imported ELF buffer
+ * @session: Session to create the process for
+ * @create: Creation parameters; @create->init.filehandle and @create->init.file
+ *          must be zero
+ *
+ * For sessions with no handle table to name the ELF buffer by, such as those
+ * of the legacy shim.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create)
+{
+	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_CREATE, create, session);
 }
 
 /**
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index da67f863c03c..b2c7bd25b138 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -8,10 +8,13 @@
 
 #include "qda_drv.h"
 
+struct qda_init_create_args;
+
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index 74ee4995350e..2b3b3f4fb246 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -10,6 +10,7 @@
 #include "qda_drv.h"
 #include "qda_fastrpc.h"
 #include "qda_gem.h"
+#include "qda_ioctl.h"
 #include "qda_legacy_ops.h"
 #include "qda_prime.h"
 
@@ -38,6 +39,42 @@ static void legacy_session_destroy(struct qda_session *session)
 	drm_dev_put(drm_dev);
 }
 
+/*
+ * The ELF image of a legacy caller is named by file descriptor, so it arrives
+ * already imported. An image passed as a bare pointer has no buffer to
+ * resolve, so it is only accepted when there is none, i.e. an empty image.
+ */
+static int legacy_init_create(struct qda_session *session, struct drm_gem_object *elf_obj,
+			      u32 filelen, u32 attrs, u32 siglen)
+{
+	struct qda_init_create_args create = {
+		.init = {
+			.filelen = filelen,
+			.attrs = attrs,
+			.siglen = siglen,
+		},
+		.elf_obj = elf_obj,
+	};
+
+	if (!elf_obj && filelen)
+		return -EOPNOTSUPP;
+
+	return qda_session_init_create(session, &create);
+}
+
+static int legacy_release(struct qda_session *session)
+{
+	/* Only a session that created a process has one to release */
+	if (!READ_ONCE(session->init_mem_gem_obj))
+		return 0;
+
+	/* Unplug check only; see qda_shim_ioctl() for why not drm_dev_enter() */
+	if (drm_dev_is_unplugged(&session->qda_dev->drm_dev))
+		return -ENODEV;
+
+	return qda_release_dsp_process(session->qda_dev, session);
+}
+
 /*
  * As the GEM_CREATE ioctl, but exporting a DMA-BUF rather than installing a
  * handle: a session the shim created has no DRM file to hold handles, and the
@@ -81,6 +118,8 @@ static int legacy_invoke(struct qda_session *session, u32 handle, u32 sc,
 const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
+	.init_create = legacy_init_create,
+	.release = legacy_release,
 	.alloc_dmabuf = legacy_alloc_dmabuf,
 	.import_dmabuf = legacy_import_dmabuf,
 	.invoke = legacy_invoke,
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index ba1ce3c0a22b..05bd1f806c9a 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -30,6 +30,11 @@ struct qda_legacy_ops {
 	struct qda_session *(*session_create)(struct qda_dev *qdev);
 	/** @session_destroy: Close a session */
 	void (*session_destroy)(struct qda_session *session);
+	/** @init_create: Create a DSP process from an imported ELF image */
+	int (*init_create)(struct qda_session *session, struct drm_gem_object *elf_obj,
+			   u32 filelen, u32 attrs, u32 siglen);
+	/** @release: Release the session's DSP process, if it has one */
+	int (*release)(struct qda_session *session);
 	/** @alloc_dmabuf: Allocate a buffer and export it as a DMA-BUF */
 	struct dma_buf *(*alloc_dmabuf)(struct qda_session *session, u64 size);
 	/** @import_dmabuf: Map a DMA-BUF into a session's context bank */

-- 
2.34.1


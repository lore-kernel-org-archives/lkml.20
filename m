Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660185;
	b=x2TaJULEi9qCwEwhfsbzzgez72+d8tBpanACq0OaFOj0QcEmswrIHEc6PxNXxTJuI3Qm
	 JcmaFBFkCRn8Y1hlQ7cj/bnKqTtQzLjrxum+d5H1mX4jn4KIXbYFCQDQrYWoFDMn3+6oz
	 hzaUEwztPEqG71zDgLqKPWJWqeOMNFdb/ubJAvAJCuVkokJTJo4KazNnn/1hjUfberylg
	 t8suxclHu0lXY89D7+gZu7abc0rf4r8lBvqKaLM7hUaPgFYvJaW1AJzTR2YxXXKAfAOvP
	 PxS+N558QxZ8Tht46v62qtw5s88kjF1IlJ35de7u2uhc0LJ7bxETEySVNE+Y+A4po4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
	b=YX1E2BW16ooNnfF3lu2RpIKwdgJU6OXmwddJCBsmfbtEv/cvwhXGzyh39nASPNBKn+iu
	 UmDQkBhYNCGsdBqjPKKBuV/ZV7Pyyd4R0Vdwad2Sg8rp4q0avTVToi6qF0RyVYfhUiMEf
	 SB86MjdzLotVPHC9Kwx1xGLUbJcO/moN/7nClJJRNEgiEtsHW1sAdpiCM5Jd3jeLlbVhU
	 5lgmC+Wi0elywhvveR1W26ux3CHnD8YSjnIMJpaK87V87i7wpHZYEmB/hzrBl3LCZ2p8D
	 KSW3koLeaDNvadLTjD41ZXMVWY1pmAsuDOl6NzYwVKqCw9RwXmzaNqy1J03NQhRbjew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3ErXA3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUSImDFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E520606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E520606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3ErXA3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUSImDFz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70Ecg2516156
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=; b=b3ErXA3NK6BbgHoJ
	Xrfe5LF1YuKsQFI+mcFcBuqsTWz/ou9wj9dooSaVafC7BpmvW4I9DFPa9Uw3a9f4
	JxVWJvH9ss44Y5Zemv7KvroirpVXgx/eZ51LbiETmz/ejYQ7pX1GCyj4xikIw32k
	32s1r3XTUO+D0CR5iJK3jrJAYb/hxdPAMsOA1eYTZfS6juehv0NIySdmJwy4fudR
	I1SSRqc+TWc4TnOHwKkFm2IZAZ5Zl+ydlo4k8N5m6KvD5E8JVoQb2oJJMit7pSYA
	iGqXY13Py0+iZgzEQD2wKJ0LjhugBOmwKK6L/mUlqAVSShJHduUVqZJ1cRarOG3M
	KxFuhw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9mk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso2936419c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660178; x=1793264978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
        b=NUSImDFzb3kQx8acUDLVNMP6oF2AfsSZlkSMY8wQb/QoQUCDcdJrvVCf8CstpVW88+
         sEzxKcPZ2+oMZVikP1Gcz7FPu88E4fiKz5D5YLiiW76iZuy3PEfjcsnPWf+YM5l9EhN6
         mFIhZ7l4cfKjuu9KlS83g2RwwrCzMeD+gotdQwQ1WR6/giI+Q+6B3B082NxUhtvn2Eib
         OGBSrax1Jzm2ZL9QCYDO720l8xy1H2LAt2smMgFewhtA/NRtyHbDqWeonYKvAo5u1JQi
         KTFDCGY7sXiH+vkcelXfJ8jh8nEwUzmgZcPomCy8LyG8i8SSJbRx3Hj6Tl6esM3HHxsR
         68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660178; x=1793264978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjfWDRPzYl5PNTaWP9ttZL/Fu+3IQzVkWXRGbtuepsA=;
        b=AP4MA6VA7CWdHzGH8oe7Nj8nINfk7+//RlIuYbao+NkQTmlZ0X1vlJxncsrUBNPkK+
         5ClqyI/iSwZA3xp0FSqfXlUCri0IBdibV/QtqT6eP8f14/OivCuPnoHFOO3w0dzVSIUF
         rcAnE3Zyy5RVMoyMBLs6MTWS4dg4efICV+Z5d6GgrHAJcG2CTJpgfZFBAvMMRVn6eZhz
         9a3Hi7vT/HWgusXh1VbUhdKs0OcStX7I8Yp26hsVJsVSKuzQMxiLLMLcw4dAt38xq9cw
         GBjW9QKd8CmF6ozSKVRuk8tVeVhcLMD4PgUzuOKBVhGVc4zYAN/exrqLRZkwcukU6D3M
         onwA==
X-Forwarded-Encrypted: i=1; AKwUvBx48NyLUCAv4DOhWp7usOFg0mn8apwmvEvS+di1dnz8KJ5ndL6K6IHaELjsPA1qmQ6WLF8mJ4cgK38bREU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK92CGitTeYzlj349/Ffyn1/yhthx1+6NBsb2FtzX9M92GK1Qk9
	+Qy/UMx+uApG6hsMI/GL9qe+cF2vAOXVwBGrLF+SlWZOaDgLcGMuFnz9zhAf2NNk6llXt80+0vd
	SJznw0BErWFIJZWk55o3NvfjhpDTfPEag34vMOCNmuuiDHaKZEFRBu2+zAuLSKyJ1L5A=
X-Gm-Gg: AYBFou0FxJhfINXVehRL8sNzx17TqEu6qEFVTD8muKoxycboA1hQZHmZwpKPj/UHOiq
	c1neJIccMpuhp9/T6UQIiIN4oo94aR3dWpuqVbWtAbqlO5/oLAaOzzYKvgkD3bjTVbQP9nzPITJ
	eYL7fgYDyfz7Z/J11IZfufYfHM407NrA4kXGB4GaCEw/umpZlaQ7fHDEzYblpaCy5sdRPbeVxa8
	GN0Q+Qi5zobfZKQeXoXNrXMSQEIZdvoTSUALT7ISjxZi2ekBbd1o2asjBaQVNdH7PDcUZWFjGAZ
	rmoL5D7gZxmXmklj0rcvcmokIJTf7YapQw0Pi2Ur7E9RS6qCGU2qBwdwhNh5UGGq7sZqde/TAuu
	MAiO7NUQyfWYCL828upWjHEJPvqtvMQjr
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr8274768c88.25.1792660177723;
        Thu, 22 Oct 2026 02:09:37 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr8274735c88.25.1792660177165;
        Thu, 22 Oct 2026 02:09:37 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm20475694c88.4.2026.10.22.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:36 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:38:48 +0530
Subject: [PATCH v2 2/2] misc: fastrpc: fix init ordering race in rpmsg
 probe
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
Message-Id: <20261022-fastrpc-probe-fixes-v2-2-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660163; l=7445;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=zUgEbnWLsDTknLyFxpzFJGnr20DIE7GXMRNqYKnIzjk=;
 b=rmpt0ZUKSJ5j1Ux8PcHksq0tkZILGFGnayKQum0+doGDcNPo84jXam4cm0VCiRZunLLFhVusl
 zEbfz+cg7LjDJUs7v9wtC9r9xYt6P8EdcjFRNLoXFHUlcz49rC15cb0
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9d2d2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RafEaDNIwz_KoXd2q0MA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: D55DnHC0rw06kyycNowSB49LAkxHuKd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXy8E3M20MZG7w
 qs37VKbbOn6zFT3iO+pamAX8+RRcjee9xsDoU12Eq4i/pXrIrmhyyR5rShMEWt10ja63L4OAo7R
 Gfy1w/sAKsGz+C9Vv3Jw2wcssHDDAI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX/dg6J3uFuqir
 ET+F0K0EwLFcMuzH5RjPCoIIVq0VDgwvMP4Fu6KCXYL6291Wqppa07MSvGn4Q8YItWBrp7IOISv
 R6rSVhj1oKhkXuqrJ1SJ+aFLfEg/CdkCu87kVH44BTneCchPpO/MtNna8GRl1S85+OlOp0z+fpp
 HESmChPBXXomCuA7tmacn5PoPtG9JiW8RnxJyb+LOEqPLYT3w1TMLMeidW/fm1xW+ZgwpkUGkuQ
 Fz+ZPUAnfO5JYFf2ZJ9tMCAcAaVrMKBkDHSvAxPOv2P4RCIDENWJHEbznsOVtT/WfUkZh+APDPM
 dK31C0O7ZCcEZhumpgx/x0r12MP22tZQ7FTj0PWOwcQxSUc9UcfTRJX0rr1U94N3j8QIPkNGGaZ
 QtQbCkwrlwjwvd0yz2JDK7r+n5n5NXambNujwgHPw0Wj6asse3i9j9l8AHeZTEizu1RPhMMtLNk
 a49/iVJu2Hx2/TmBixw==
X-Proofpoint-GUID: D55DnHC0rw06kyycNowSB49LAkxHuKd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

fastrpc_device_register() calls misc_register() which makes the device
node visible to userspace. However, kref_init(), spin_lock_init(),
INIT_LIST_HEAD(), dev_set_drvdata() and fastrpc_cb_devices_create()
were all called after the switch/misc_register block, leaving a window
where userspace can open the device and call fastrpc_device_open() on
a partially initialised channel context.

On a concurrent open(), fastrpc_channel_ctx_get() calls kref_get() on
a kzalloc-zeroed, never kref_init()'d refcount of 0, triggering:

  refcount_t: addition on 0; use-after-free.
  Call trace:
   refcount_warn_saturate+0x120/0x148 (P)
   fastrpc_device_open+0x204/0x258 [fastrpc]
   misc_open+0xd8/0x1a0

Additionally, fastrpc_cb_devices_create() not having run means
sesscount is still 0, so fastrpc_session_alloc() returns NULL and
fastrpc_device_open() hits the error path which calls
fastrpc_channel_ctx_put() on the already-bogus refcount. This
triggers the free callback, kfree()-ing the channel context. A
subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
freed spinlock:

  Unable to handle kernel paging request at virtual address ffffcd5841510ca0
  Internal error: Oops: 0000000096000047 [#1] SMP
  Call trace:
   queued_spin_lock_slowpath+0x414/0x5e0 (P)
   _raw_spin_lock_irqsave+0x74/0x90
   fastrpc_rpmsg_callback+0x4c/0xf0 [fastrpc]
   qcom_glink_native_rx+0x6c4/0xf10
   qcom_glink_smem_intr+0x1c/0x38 [qcom_glink_smem]
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Fix by moving all channel context initialisation (kref_init,
spin_lock_init, INIT_LIST_HEAD, idr_init, dev_set_drvdata) and
fastrpc_cb_devices_create() before fastrpc_device_register(), ensuring
the struct is fully ready before the device node is visible to
userspace.

Add err_depopulate label in the error path since
fastrpc_cb_devices_create() now runs before misc_register(); a
fastrpc_device_register() failure must call fastrpc_cb_devices_destroy()
to clean up the compute-cb children.

On CDSP/GDSP the secure node is registered before the non-secure one, so
an application may already have opened the first node and hold a channel
context reference when the second registration fails. Freeing the
context with kfree() there would leave that user with a dangling
pointer. Handle it like fastrpc_rpmsg_remove(): after the nodes are
deregistered, clear rpdev, wake pending invocations with -EPIPE and drop
only the probe reference with fastrpc_channel_ctx_put(), so the last
holder frees the context. Move fastrpc_notify_users() above probe so it
can be used there.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Cc: stable@vger.kernel.org
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 83 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f280bff2edf0..fc09cd27af4b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2548,6 +2548,18 @@ static int fastrpc_init_reserved_mem(struct fastrpc_channel_ctx *cctx,
 				  cctx->vmperms, cctx->vmcount);
 }
 
+static void fastrpc_notify_users(struct fastrpc_user *user)
+{
+	struct fastrpc_invoke_ctx *ctx;
+
+	spin_lock(&user->lock);
+	list_for_each_entry(ctx, &user->pending, node) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+	}
+	spin_unlock(&user->lock);
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2557,6 +2569,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
 	const struct fastrpc_soc_data *soc_data;
+	struct fastrpc_user *user;
+	unsigned long flags;
 
 	soc_data = device_get_match_data(rdev);
 
@@ -2605,6 +2619,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->poll_mode_supported = soc_data->poll_mode_supported ||
 		of_machine_get_match(fastrpc_poll_supported_machines);
 
+	kref_init(&data->refcount);
+	atomic_set(&data->ctx_seq, 0);
+
+	rdev->dma_mask = &data->dma_mask;
+	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
+	INIT_LIST_HEAD(&data->users);
+	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
+	spin_lock_init(&data->lock);
+	idr_init(&data->ctx_idr);
+	data->domain_id = domain_id;
+	data->rpdev = rpdev;
+	dev_set_drvdata(&rpdev->dev, data);
+
+	err = fastrpc_cb_devices_create(rpdev);
+	if (err)
+		goto err_free_data;
+
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2613,7 +2644,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
@@ -2621,7 +2652,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 
 		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
@@ -2629,30 +2660,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		break;
 	default:
 		err = -EINVAL;
-		goto err_free_data;
+		goto err_depopulate;
 	}
 
-	kref_init(&data->refcount);
-	atomic_set(&data->ctx_seq, 0);
-
-	rdev->dma_mask = &data->dma_mask;
-	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
-	INIT_LIST_HEAD(&data->users);
-	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
-	spin_lock_init(&data->lock);
-	idr_init(&data->ctx_idr);
-	data->domain_id = domain_id;
-	data->rpdev = rpdev;
-	dev_set_drvdata(&rpdev->dev, data);
-
-	err = fastrpc_cb_devices_create(rpdev);
-	if (err)
-		goto err_deregister_fdev;
-
 	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
 		struct fastrpc_session_ctx *last_sess;
 		struct fastrpc_session_ctx *dup_sess;
-		unsigned long flags;
 
 		spin_lock_irqsave(&data->lock, flags);
 		last_sess = &data->session[data->sesscount - 1];
@@ -2673,23 +2686,27 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_depopulate:
+	/*
+	 * A registered device node may already have been opened, so a user
+	 * can hold a cctx reference. Drop only our reference instead of
+	 * freeing the context directly.
+	 */
+	spin_lock_irqsave(&data->lock, flags);
+	data->rpdev = NULL;
+	list_for_each_entry(user, &data->users, user)
+		fastrpc_notify_users(user);
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	fastrpc_cb_devices_destroy(rpdev);
+	fastrpc_channel_ctx_put(data);
+	return err;
+
 err_free_data:
 	kfree(data);
 	return err;
 }
 
-static void fastrpc_notify_users(struct fastrpc_user *user)
-{
-	struct fastrpc_invoke_ctx *ctx;
-
-	spin_lock(&user->lock);
-	list_for_each_entry(ctx, &user->pending, node) {
-		ctx->retval = -EPIPE;
-		complete(&ctx->work);
-	}
-	spin_unlock(&user->lock);
-}
-
 static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);

-- 
2.34.1


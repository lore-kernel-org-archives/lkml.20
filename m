Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7B4E77FB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852544; cv=none; b=uAVXBTS/e5Qpjn4GqG3cS8LhuMKOmf2mrBjBXFqZdNdI5tcy+mZewpS5ZR05Uqt6NVSBq9LoIP0zQAZhzcnNN6vEPWoOcuSGFxIFmd8E7Qa8/DF1D6ij8dGvahSkW14yeXLvD86fXqsAL7cATsRVBCNuRwIIvxEx+3Unn5cuf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852544; c=relaxed/simple;
	bh=AAlmuP7Zbq46cR3jlCBUJN55F+/3OqGdgksKttWnW20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzt0BIf9rAD1pBbxYw4J0Zj7RpYTqBWclrQIPlG2WhFwy7t4ZsbucLuqdzNNX+FhowEw3IYO0mXkD4qAIDUihMIcg+eVF5fxcx3PaCuQjBg6yvBaSq5i+5EByxG5/8XeP8lc/UcLHer2aH7V17O8T1qtmqutPkv7dua93jQow38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2VLeLXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caSoe1w2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2VLeLXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caSoe1w2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xeQr2176984
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiHrKYHs1q0NoEg2GeDpcNzoHKZ7xEAHie7JhW8mVJw=; b=T2VLeLXZphN0RH6C
	2R6fLQ28PdKnWSttxWCnlQQHNmG4gXZW7JLIEtvbCnLKAX2akFoz46yIjx4JqVTk
	8rXWsc+3QNZm1onb/YwI0ZrgID1bfvw7M9ZpqemMQofiuD0hfuSeR7APj+8f+7bh
	lGsGE0qa4fQbw/Y/txXzdyCPNQvuA+z0g2uSDTYebALEDPf014fD6Nec4T6o4/0u
	7ov71h0fMKGrOUohigIS1UXpRWnQ0tvtRcs5ynTA06OfjFHDb7D8zxdXC91OAgkc
	eny4ex4YdnKVORBVN5p3u4b6OCajk8QQM2ZlkyIcIoDZRgt+Lyw2bE3QPAvqdiml
	BvMLhQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsg6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:02:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86261e66700so4866198b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852537; x=1791457337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiHrKYHs1q0NoEg2GeDpcNzoHKZ7xEAHie7JhW8mVJw=;
        b=caSoe1w2oj+UxOBZfrkqkRLwlxKTYyE9VwbnZ3n/ZS/mPx1VG/CMGXBUE+aTFP9A/+
         JadBg2EKAqVA4opgk9af8QE89LtiDU63cJsJfDEFkq13b5RrJH/c9VUBZPcyI+L3DueM
         WoQTIeEQ4pONxu7Qiev4hpkjv2TS+80NADQ9jZneC2RBPohu5XZ7DyJFuO3A6w3rqoOo
         WA626/sFuJZ5o73SnedGb710LxU+W2IAiRu5TUoXhHKsk/loW+uIoBek19ARdCiXiC2d
         bJmOzq2sqEDXSURxR9E/f3gNkXUFYSAY3ZXs5pmEELplv9Unog43ZuXzs5G1zVtWNfwk
         7dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852537; x=1791457337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KiHrKYHs1q0NoEg2GeDpcNzoHKZ7xEAHie7JhW8mVJw=;
        b=Xs/0eTHwglxxaFQmuTROp0Np1Fts/pBheWZu0EtsdcJRjqQ8BtA4zdJwS7qka0R/OO
         HJgaaD2dfs1/20fw1LENTxorB9qW26JoXPt/E4o2J2Q3KmZzP/5IiDksftTqVsDVI46W
         LPiHZLyYJ8Y40hq9xOdAjnwt1yES/L8WMZFnLc+yvWnJSG9bGc4r6xBxkgGt74rCftUn
         bfoZARuOG+AsjYOwqe5DKPm5aDiha4EMBAyWlqn0JPXyClWPaUawppQJIJIA8aTI2d1i
         u84wKmDXuCaQUOofPTEBFepJRELp/EsCilwmSWCRp4RlGKDwBWvmbNplx3r/KhU40wSO
         9RIg==
X-Forwarded-Encrypted: i=1; AKwUvBxOfJ5KOK+VCpFptSmN67kWoGUbwHmdmxQP8hsjdrf0k6rKY1IuoMGTM0htroY+mtASK0HP+XUva08f/s8=@vger.kernel.org
X-Gm-Message-State: AFuF++kYAR34cWIPnEW9i0SrNmRy9cz73pVORI7WPskV45YruBp03tul
	PzCa7kdbZDzLZUGeUzcBPEE15ZLvskkU8HPydCEAhoF0XeODfdVW/XBe02B+rru1hA9kX+y+grz
	hu0d/VTRRy4TeAtvIEJIN1pLIXwzPH3YlrOlAYGUWupC0Ha7v0O28apoQo4i4dNfLMsA=
X-Gm-Gg: AYBFou2WIsaaqSl5Xhw16QBC71+4xXsW4Y10AMUbed92LDi3oz0oX852w53u5T0s7Zy
	3lT+E0sF0MoG/RXvl7EJOy/FQC/qw37Z3lMXWve+vXc2YMfVMrzYSC3FvFtqY9gunEfoR9tkmi8
	eburFr2aAdQuHvaSCXRglgD4rnRNYOJCLhnUNdY0MpG1ZSTab1ADUY6l3MzhHtq+NefE+GhGLVr
	ip5SLkrygrYKjWTBv3qrvsLBSdN+MgaPL7xolYxmRXThCYtmZ7epKfc2xml8Rk3sMNJN7dvTrSo
	Wo+WIR7GDNCRhI9mLJ/23Y4nOyZEi4dercD4N1Y8UUmrjwSXaBHOrWNbX1+FbHO3YLaTG0LnQU9
	3Y4aol4swGN5iKDq6uIDE406d6F5tiJ0L+Q==
X-Received: by 2002:a05:6a00:9296:b0:87d:d878:5eb1 with SMTP id d2e1a72fcca58-8874d29ffc1mr3623348b3a.56.1790852537107;
        Thu, 01 Oct 2026 04:02:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:9296:b0:87d:d878:5eb1 with SMTP id d2e1a72fcca58-8874d29ffc1mr3623306b3a.56.1790852536584;
        Thu, 01 Oct 2026 04:02:16 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197ced69sm886049b3a.48.2026.10.01.04.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:02:16 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:26 +0530
Subject: [PATCH 2/2] misc: fastrpc: fix init ordering race in rpmsg probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fastrpc-probe-fixes-v1-2-1376d93b8b3e@oss.qualcomm.com>
References: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852523; l=5052;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=AAlmuP7Zbq46cR3jlCBUJN55F+/3OqGdgksKttWnW20=;
 b=lozHwIEDFFZck/CjJ7xyGQT6NncRY+b1WMRhFBpg9GI4ZSkRrs/aczQl/1+vo98+1u6oLCcY5
 G4dthWGsZ/QDCo9iLfyFsL+g4P3OmoiERG8ZvCWEalWZA5h9dsblH4T
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3dba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KWbisqpt0Nw2-B9i3BEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX6U3vEeC0qfG1
 8HxmdR/705UV+nvAPTUXTvAW5qE4yeK9fM8XxpoEouYjAowChVyDSJtCnRTNG5L1zz98ez+A63T
 F+NzD9d7lNXwqLAkHEUcboyS3yiocns=
X-Proofpoint-ORIG-GUID: 8zVlLyjnO7jXWX9VN6RPYfpw9DnqDXdf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXzKZeTbQ57zW+
 CvH64HoMh5+2joz05//p4B3VZJ7kqGya6ckeC251ZIn/8UzPBEIzJ45b4mxWMjxZhz6bDI7wbvw
 0NYWTxGz3+ZDBE+wNHhO65zIUD6tHoqIe8IrbjjFWw74gLR+zGq+038OMeKeWfcGyeBUNhxb95M
 3tHQDVQm3Zp/nglvpijN9xXN3lwsVdQzYrJwfJSMiS1i0hzWSwrNxIUnS1nyozg+6Vr+8JYT3er
 TCCwb9f9La/KTWO5zVPPAyKRBZgZ4CiYdNl0bKAOyODVjL31eqrF/t7nZKGUqYVPWX4baBUwth4
 IkRPR2WwfXPivyE7HCoOgBikl4iokCYgS5Qs+NaiMdFLpIwkOuKCFniRtVZ8Ck/4z7nPR6EsBIe
 0/CkdwxRjqTJPBAoxLm9OByZC68jqj4WMXJ1UtPf8DZdu+sygt+/xNj+X8h+GjkPGyKDSRrCIBf
 /THZF7HmEOK6CdL+QUw==
X-Proofpoint-GUID: 8zVlLyjnO7jXWX9VN6RPYfpw9DnqDXdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

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
to clean up the compute-cb children before freeing data.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7ab1cbbf19bb..93d07d28a0f1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2614,6 +2614,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
@@ -2622,7 +2639,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
@@ -2630,7 +2647,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
-			goto err_free_data;
+			goto err_depopulate;
 
 		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
@@ -2638,26 +2655,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
@@ -2682,6 +2682,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (data->secure_fdevice)
 		misc_deregister(&data->secure_fdevice->miscdev);
 
+err_depopulate:
+	fastrpc_cb_devices_destroy(rpdev);
+
 err_free_data:
 	kfree(data);
 	return err;

-- 
2.34.1


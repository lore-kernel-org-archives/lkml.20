Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11BA26738B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247208; cv=none; b=fh4glrsp2ZQ+R/fj89szm7p/+k579f3lotClyd8A1QWAgAAxaUTxI7VbFveP4Tdk442/b7Ep+U2as1mVD4ocDZhy9YdIY2hpTTfGTVZwzTjBRuNQpf72G9GJXYkR+c9LKt9XC/8FxBqkz9hLWmvuPy8LcU4gLpHR53Gzy/97wnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247208; c=relaxed/simple;
	bh=Y9kjvXncYREFAgUwoBtFPotlKXtYHvixiI47ICifGeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JE+Fx9NnGgfkpuBGYC+KJt1f/VybAJnm+rlcVIC3le8n0xh2tJdC3ao1f4VewlPXb2kPBo+p214ZhBvqo+LwOqF0c3L2VRACIUEhURCxmZ+3BL8kkOpS4QfZ/x8FBwLycUqnYwfOvSTMFJ9gvzYo9P3B0pVcu0kxJJT3wgugLEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WJBHUgB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOyJUuFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WJBHUgB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOyJUuFL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNSXT2597287
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 00:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=; b=WJBHUgB0X3/JGa2J
	bTCFQ/W0ALtJnWq+kuZTmRbg41C6dw160r5JxyfoG5vtdAKFDMajG5UUKQUKSPJb
	+dc5DjZZ/zSIzNRomCYaQs7UKP374pWPbSRJ0gJm4rRsKxY1a03qtQPwj8QUND6g
	ot2lBIIIJF+f4TFnswk6DwZ3StMhrYWMBGo2zYPcg+P5B6JGo3TSwOIw8dAGmdy4
	OXrKebuIr8yDnEtn9ZBpEY7LUwGwFQN+kv8Urk4z3bkETiDmz0go90XEnhlPsQXq
	aPDNk9xElb+rY4y+G4aR0cDJEmwbyCVhceZDZ4QJoRgznVHXoLeWXzXi1jfzRFbT
	rknFog==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dtxxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:40:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so4364992eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247204; x=1791852004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=DOyJUuFLUxKTClpyckhruViG6f9X3J/3TDzmimWwwmqELDLphA6zHzjVglfPJRs0L+
         /pEuAqyx/iouFVvs30FSeDKh/KK/dVRJB1FObaqBl76gEHc3Fzmiw4+tMHV4zzoVnf/t
         bnxeuQlaKKxMje3zcTEKoj5p4tvlXV9LnJeUQbpi+Sa6OyQpGgxojPH668og316coHz7
         EecwOw6VVQaKa/X6N5aC1spsdNr0k8nNFRlfmqENOqE4ky46OD/2yWEZVdFzqqPxiGB9
         vb/LM1gLa6VR2mjYSV99wVNH2dMCRFXiK7OKlDilU2a/u/6U5wbi0ZIUaK3uWAsNXUOq
         qKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247204; x=1791852004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=JqcobhjUvMabjhIlWvpinxuLvbCummM9Nq2NJxPrMoMDuNJ5pSDqIl3op4rzyn5xKr
         Iy4xXHeu+c3BWH1RDWsj9GDIh51333EBHgqWMHvxOOhpQX3fbYSmOQrRllei695msMlc
         /c2EZRKOrjMwbjH45numeh4FF8oj6sN9YdKgLRQJrgPVcN3FUt5tD1Jn4qALgyhwWVQZ
         GyBn+z+4sNE/ad1xfsXuPxDILAGx2qD1z2Hlx+mFqAteDd8A2SXgMU+my5pbpXx69l3u
         bHqNyhGQmtAoRylmLSy0iE9RbGCA4kiK5a6HIuWIa4Fjy8clAmaduCe/aDJ+VGAIptMS
         gzjQ==
X-Forwarded-Encrypted: i=1; AKwUvByIEUuWktC6sSCeRi3x/rC3hwqamDGMENiKaP8/Ax2ynqpMUD657BjkDtO8J+wRJQNIEqmeD8ex+J30UHs=@vger.kernel.org
X-Gm-Message-State: AFuF++lRXsCU4/Vhf7ulKHafbF+OmMMvFDMU6TD2KdCPocQkMYESNji2
	s/WYhJXp2A3qiduLwhT3mUIX8myOeaiof+/isB+iJCjCPgJnAFkV97xOy3gD4DG+zRWEsdPczsE
	wT0eJ1sziS2WNE2h9KBU1NfrHEGQ7CGXJihl3jZXCgsFffoi1vSiuxrrvjQP6DT3yAw==
X-Gm-Gg: AYBFou0WgI6Gljf+bBKfwwFyZ4xGJ70I5caWESG4gIWNNS8Lz6bf1+X7s2377L60/q6
	ERQPLirz7x1hsYMsH6TriOI5eOhoYsI5BZe18mDGXd8XL2aAS9SMlvAr43t/Qei6ELMW0FmKUYA
	vKNykRsn7uPozIlGcEBfhP/c9KyQOW9GdZ2nMKznhw7FOQf0WL2xilTwhEeAVlC/jMQasuNLyN1
	YobryncpYvUbqfBw1vN/kPQe0rWDCca/eN1NOVuSyK+zM3duswXlvwFLZrPzNgYofeoK2to/nMj
	oH2r6WZabC5lkKPiDnOYmu3zYSfNkuvw2AnFgJ2vjNHANEOKK3JcZPJgnx2x/zepV9Y2vg2PQ2M
	MfrxcioDRPnfPbahxYe3oa8Kn6df5pef8v9lP1Dh7FsmAvYBWCkEIzEcX8Q==
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11505000eec.34.1791247203574;
        Mon, 05 Oct 2026 17:40:03 -0700 (PDT)
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11504954eec.34.1791247202887;
        Mon, 05 Oct 2026 17:40:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:40:01 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:52 -0700
Subject: [PATCH RFC v2 8/8] tee: optee: support RPMI asynchronous
 notification doorbells
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-8-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX5u+kj53FeIa2
 JjHi7r4PY5Oxq/hokaHUhIvm61U1vkuBwiE+uS64WmQ+ZGuadwPn1dFdn+WlPpZI9+PwBQZRk+a
 /y0QiV1wG9VjAlT0/xu6CxMmvIx4b4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX5DtRgTRfFqbA
 Fe/sdADv8Q0kVQ2IZAJocu9zt4d0waMoL90XVOawmZvO84GJ7CAqOa9dsW5ZLCm5Z1Ne00AFNdR
 BqJ8VCbVq1g0gukx5o79YF6lUeEv1HWZqF7SPFIYjgEr8QCvW/rUHw8HSJLkaLEu2+4cUnCfJ30
 mGI+rCaeyi4nbJIaRbgXbbzquVoGt0gMRp/axTOMCnTZYajLLnegayaa4Z1oIBBSz3ENvoJ3Gnb
 RigDsVEckQTYbsA94tfwTHAXrdYtyYkH8DQN5yWmf3pwnsKdm1LtPDax5H48vkSX57L5yndZBIW
 gveZ92jv2+attUEctW8PnGS3NQKLrmWDbkQ/0ftGVlT67gdmrCxX6B4ARgiPl2mvo6jJAoowwFL
 jNAr+QOUzSNn+vxCAVqdLdpNZ1MAn2ffUjwOBTcuvpeYgjS/RCBGOT+Q1SBfkhI8HkcpXYn/mus
 7vRYF+PNIsQZ4MDWQxw==
X-Proofpoint-GUID: 7yIT5iCaCIYdtQhb9hrl_4rynrNnL3cG
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac44364 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 7yIT5iCaCIYdtQhb9hrl_4rynrNnL3cG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001

OP-TEE uses asynchronous notifications to request bottom-half
processing in normal world without waiting for a client call.

Allocate a TEE-to-REE RPMI signal and pass its ID to OP-TEE when
enabling asynchronous notifications. Queue bottom-half processing on
a private workqueue.

Initialize notification delivery before publishing the TEE devices.
Allow probe to continue if setup fails, keeping synchronous RPC
notifications available.

On cleanup, request that OP-TEE stop asynchronous notifications,
relinquish the signal and drain the bottom-half workqueue. Transport
relinquishment does not synchronize an already-selected callback.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_private.h |  6 +++
 drivers/tee/optee/rpmi_abi.c      | 87 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 07c27e322a71..e5c6381bb872 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -190,6 +190,9 @@ struct rpmi_tee_device;
  * @shm_rht: lookup by the host-endian parcel ID and nonce pair
  * @sec_caps: negotiated optional OPTEE_RPMI_CAP_* features
  * @notification_count: negotiated nonzero number of logical notification keys
+ * @signal: allocated TEE-to-REE doorbell, independent of logical keys
+ * @notif_wq: private bottom-half workqueue, NULL when notifications are inactive
+ * @notif_work: processes bottom halves requested by the RPMI signal
  *
  * Callers keep their tee_shm alive while using its registration. Lookup
  * returns a raw pointer; the mutex does not protect its lifetime after
@@ -203,6 +206,9 @@ struct optee_rpmi {
 	struct rhashtable shm_rht;
 	u32 sec_caps;
 	u32 notification_count;
+	u32 signal;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 #endif
 
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index db541f3de425..ffe44d81e857 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -685,6 +685,88 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
 
+/* Yielding bottom halves run here, not in the transport retrieval worker. */
+static void optee_rpmi_notif_work(struct work_struct *work)
+{
+	struct optee_rpmi *rpmi = container_of(work, struct optee_rpmi, notif_work);
+	struct optee *optee = container_of(rpmi, struct optee, rpmi);
+
+	optee_do_bottom_half(optee->ctx);
+}
+
+static void optee_rpmi_notif_callback(struct rpmi_tee_device *rdev, u32 signal,
+				      void *cb_data)
+{
+	struct optee *optee = cb_data;
+
+	queue_work(optee->rpmi.notif_wq, &optee->rpmi.notif_work);
+}
+
+/* Relinquish is not a barrier for an already-selected transport callback. */
+static void optee_rpmi_async_notif_uninit(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	int ret;
+
+	if (!rpmi->notif_wq)
+		return;
+
+	ret = optee_stop_async_notif(optee->ctx);
+	if (ret)
+		dev_warn(&rdev->dev, "stop notifications failed: %d\n", ret);
+
+	ret = rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_warn(&rdev->dev,
+			 "relinquish notification failed: %d\n", ret);
+
+	destroy_workqueue(rpmi->notif_wq);
+
+	rpmi->notif_wq = NULL;
+}
+
+/* Enable OP-TEE's bottom-half doorbell using the reserved RPMI signal. */
+static int optee_rpmi_enable_async_notif(struct optee *optee)
+{
+	struct optee_rpmi_enable_notif_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_ENABLE_ASYNC_NOTIF),
+		.signal_id = cpu_to_le32(optee->rpmi.signal),
+	};
+	struct optee_rpmi_status_resp resp;
+
+	return optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
+}
+
+static int optee_rpmi_async_notif_init(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	int ret;
+
+	INIT_WORK(&rpmi->notif_work, optee_rpmi_notif_work);
+	rpmi->notif_wq = alloc_workqueue("optee_rpmi_notif", WQ_UNBOUND, 1);
+	if (!rpmi->notif_wq)
+		return -ENOMEM;
+
+	ret = rdev->ops->notifier_ops->notify_request(rdev,
+						      optee_rpmi_notif_callback,
+						      optee, &rpmi->signal);
+	if (ret) {
+		destroy_workqueue(rpmi->notif_wq);
+		/* Checked in optee_rpmi_async_notif_uninit(). */
+		rpmi->notif_wq = NULL;
+
+		return ret;
+	}
+
+	ret = optee_rpmi_enable_async_notif(optee);
+	if (ret)
+		optee_rpmi_async_notif_uninit(optee);
+
+	return ret;
+}
+
 /* Query and store the trusted OS revision. */
 static int optee_rpmi_get_os_version(struct optee *optee)
 {
@@ -823,6 +905,7 @@ static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
 {
 	struct optee *optee = dev_get_drvdata(&rdev->dev);
 
+	optee_rpmi_async_notif_uninit(optee);
 	optee_remove_common(optee);
 	optee_rpmi_shm_rht_uninit(optee);
 	kfree(optee);
@@ -901,6 +984,10 @@ static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
 
 	optee->ctx = ctx;
 	dev_set_drvdata(&rdev->dev, optee);
+	ret = optee_rpmi_async_notif_init(optee);
+	if (ret)
+		dev_warn(&rdev->dev, "async notifications unavailable: %d\n", ret);
+
 	if (optee->in_kernel_rpmb_routing)
 		blocking_notifier_chain_register(&optee_rpmb_intf_added,
 						 &optee->rpmb_intf);

-- 
2.34.1


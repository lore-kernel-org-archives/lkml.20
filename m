Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC642885F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208150; cv=none; b=ugq8rGyRJJIvOsLSz89BhX23vwokLoCFQStylUI5gT12I5nxc91/MTBXrxxFcvW2U8fA+hH2qaRsx3sT2m9pSdiQkDOMiS9zrllkBxX/aM8zyVWhulZTm2e8vXLrGZWgLikw+yhFUQqjeXRgnZ0Ucz0ASQlCEUiI2slFnvqj670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208150; c=relaxed/simple;
	bh=SjmSpxqAuYgtpzBQ9XDeV2ABXwKg7pySTt9lVRCGSis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5++8mBsfsLoupmXLEundGGf3+CPiswZnwVuVObWo29QLAJ50hWnd/TlseGiLahCaslT9s5Il9Qif9Sm78SEsetPN7tK8uWmqxIai1XQFy+GjoEVN3lwvGLkg+9YSlOoKv+qDXi0Wss22iSJi1stoFQlAHQsK7v9FWEZsCbE9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuWV02fB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTXEEg7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuWV02fB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTXEEg7R"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C856Wx1803989
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01tozVF7OH7LwFf5hthHRqzoedWJYa1DR1n732zt2Cc=; b=IuWV02fBiHX7623D
	1dnEXnByTSVhDafzQO0XKrurq8MLCqISde3Lov7C14phfKnsuQkzZhepQjIErNRV
	ZQngfx0SGzgiq7ilm22kgwCGYVXu7D09QdS198iVBT0S0Lo2rO7WSzVi/QM/48V8
	upj6f5/y+BHX55mbIw+Ka2d7OdxdQSDLId/1URxwQliWl7yghoH37g1+0wqSIsBv
	a0ncNOv1sXBfG/DKk0XTjTAGMpbvjp6njw5G7u/sNmRPH2NsysdG/HNcfiOcg5UI
	exxqW4L+ZEeGkf/NGwRzBUYnDQbcuUxlTKf2OOe8mnTHyZBygQ/q0aGVKjZrR1xQ
	fMdHUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8p04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2094171a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208133; x=1789812933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01tozVF7OH7LwFf5hthHRqzoedWJYa1DR1n732zt2Cc=;
        b=dTXEEg7ReVG/QcIlI6jxFQA8IcEbdWgqXx2hGpIPdNPujR5cVET0eiU+DUxm+3HrXD
         5DW8hDRyOvHpvaI07zDlTur8Ps4OOCYlRuaLkwc8CdxSfwr+ZwYdr8Ieq8rJOiKtiEhx
         DWkYjPnX6uc1t6pQN5A7Jytyy6sKCazwKLvuYDDM2ZQ5P/lXD9TAOLvSql11dBNy2aqQ
         QkpabRXzIzfGS1LPIsi5zsOlrNKhvstWSfvXox6gWzKMRVm1W5uMcDxyMdW7IL10Wwia
         9GWxMCezEaS9xjAQgqnoOvOFyr+u6gLSv83gQFbTJNK1aFh0XGC3jegpZt5J4qKuubR7
         eh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208133; x=1789812933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01tozVF7OH7LwFf5hthHRqzoedWJYa1DR1n732zt2Cc=;
        b=QHCWpkVRsDt+TMFfOpLQMCPLjsOldSALv6gzHDMZynK4UDylYa/4MI7j6BvZHXEvry
         rVBM3/rfC4v6EK6lqMHL1GdW6CnQYgDcbh2ZzYCuS/b9MizAPjYoHlw8X8CN1k5v+Yso
         JBS6sf5HURUjqrt2GhOLl/J11CO53fGBlgxCBX2/ClG7SIudObPLbV+4Sougjz+QMdrM
         vZa8B/9hLEWKcKH0tR2Lj+qw3cuUvwP7oMPVzphL7NdJwNoOrBr9V17sxWQOx5GP6z+k
         3u9RQqgJ00udeFLI1uJYyj7gJ+ucpYe5TtGm93Bdy9wPJpK1Jk43srjiAZx7oJJlgMGF
         XFig==
X-Forwarded-Encrypted: i=1; AKwUvBxtDLZZ2gfq/XpJI6rMxsjL1M4/VQNd/mJsjuyF3fp/HAlUqUVMORSqoiZdlKaa3lLyOkNJ2KipkFAXal8=@vger.kernel.org
X-Gm-Message-State: AFuF++lrPfiewCgUrOA7uDdHamwjXyv01wdU8jIIcVXHw6zWTGHbTY8c
	VufyGM92j+/eQg6Zt2xLhrx1Yl/ML4HmEz18UM5NZkSJJiYh/UEAzWRk7ioJxVp/1To36slzWt7
	6iJa6SYVqzRPJOhl38V5BJiM95nkTMFv7Brhiuhcd37E4O5BdQbA9c1to5j5fDrYuuw==
X-Gm-Gg: AYBFou3YpqCtv4Ue6U2xePNo+cCIbg4jx+shmT8y4QVBqqTMddwBiNdUIik9iyR/YZL
	C4QBN74RzcMXYpP7xijjNYQ1uewgCZtaQ15R+h1nXYBbrpvlA4kwgO15u3Ikya/ZWGOMoNTBDw9
	mV4InM/UDXzux0LjoTtXL51rASn0BxPsVRiiD/8nSs7DPY+9N1nmfeaYAfbrdj7K7gX1lm8B1w6
	wHrLQPJ7ilu2QRDWfGzTBzFqor2laBCy22+ZUPuh8pc0zu4WrUCifaO8aOsAsAkZRZe4osvoImA
	JY7UzlctNpRXpiRq6GHK0QtMadmrKvsRFSFIj58cqRGSzb3iK61VDVBUiYY6VuG2Qw+y/8sqrXQ
	/SkNr2lXV0+Qc5Aw7Y40wBM6eUeKG55qvOooZRIb3wwhlEy5tQXYXFP9YgBY=
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr13833514a91.20.1789208133242;
        Sat, 12 Sep 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr13833448a91.20.1789208132722;
        Sat, 12 Sep 2026 03:15:32 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:32 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:15 -0700
Subject: [PATCH RFC 4/5] optee: riscv: add asynchronous notifications over
 the signal bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-4-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: j_v8C-ABNmjKjeF6CEdzbkgle9H2agc7
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa5264d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C3oiFVa1e18yrY4R6uUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX7zkr/HClZrrn
 Zha0YaLcsypnXKJo1pCFr9hS9drAI/yKw1pP6BIPsDk9VFYBAUNJjzgn8IaspgN2PHQWGYC56/h
 xEb1w9i2oJgQMddMgAUBR8MZGDL8PCA=
X-Proofpoint-ORIG-GUID: j_v8C-ABNmjKjeF6CEdzbkgle9H2agc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXwbJ4Iru1UAHy
 5r0YqK6Bhkx15F2tdpM0nupt9e8YeW2lLW4TKpUJjDDDA/FcacjCWJzC/kySyKJl82nKac57HLV
 rkF/CG1ShbNxjDDBjDB5s3MVLxa259MB0JW1CeZic3tumLtm1i/d6ebFyZZARl3dWUXVtATAzbT
 wrC6277zjdqibqVupffEXKLyxiEMSVGoYQUnJ3E6Cp4q5pQiDYjaujiQ025XYv2W5ogcXx9nGug
 BdkC5UyLumEp1Qerq2FvGGyNpdinnZd/jOTsI70giMya9vkEs27DGR350QnOMiGr4yv7cvoTnwL
 3fkVW4JWN2d602UC53OHlH+fj3skkewmA9QaTlyEmZ8nCPQg0JsK1vcVv8/llr7Whr9W4hvWlmQ
 kfqvmsE40Ws3nyYZSM+cFK6/BV4jfg9qMahY5XsNgQ0ThoJeUA4xDD+vEs0ZVyIMhnr/MsMF327
 Co3pPnaLEbPwgDvGWhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146

Add asynchronous notification support using the RPMI TEE signal bus.

Set up a signal bus between OP-TEE and Linux and use the platform
interrupt as the availability doorbell. When signalled, retrieve pending
signals and pass normal notification values to optee_notif_send(). Reserve
one signal value for requesting the OP-TEE bottom-half handler.

Enable this only when secure world advertises asynchronous notification
support.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_private.h |  11 ++
 drivers/tee/optee/optee_riscv.c   | 251 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/optee/optee_riscv.h   |  64 ++++++++++
 3 files changed, 326 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index cf878b8178f9..2ec53bd330a1 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -181,6 +181,12 @@ struct optee_ffa {
  * @next_nonce:		monotonic nonce source for memory parcel creation
  * @mutex:		serializes access to @global_ids
  * @global_ids:		memory parcel id to tee_shm translation table
+ * @notif_wq:		workqueue for signal-bus asynchronous notification
+ * @notif_work:		work for signal-bus asynchronous notification
+ * @signal_irq:		availability doorbell IRQ, or 0 if async notif unused
+ * @sender_signals:	number of signals OP-TEE may raise to the REE
+ * @bottom_half_value:	signal value that requests an RPC bottom half, or
+ *			U32_MAX if async notif is unused
  *
  * This is the RISC-V analog of struct optee_ffa: communication with secure
  * world OP-TEE OS rides the RPMI TEE service group (RPMI spec section 4.16)
@@ -196,6 +202,11 @@ struct optee_riscv {
 	/* Serializes access to @global_ids */
 	struct mutex mutex;
 	struct rhashtable global_ids;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
+	unsigned int signal_irq;
+	u32 sender_signals;
+	u32 bottom_half_value;
 };
 
 struct optee;
diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
index 72c9eb85f4fe..b9bb813adef5 100644
--- a/drivers/tee/optee/optee_riscv.c
+++ b/drivers/tee/optee/optee_riscv.c
@@ -28,6 +28,7 @@
 
 #include <linux/atomic.h>
 #include <linux/errno.h>
+#include <linux/interrupt.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/mm.h>
@@ -46,6 +47,9 @@
 #include "optee_riscv.h"
 #include "optee_rpc_cmd.h"
 
+static int optee_riscv_probe_feature(struct optee *optee, u32 feature_id,
+				     u32 *value);
+
 /*
  * Low level RPMI TEE service group transport over the SBI MPXY mailbox.
  *
@@ -852,6 +856,242 @@ static int optee_riscv_do_call_with_arg(struct tee_context *ctx,
 	return optee_riscv_yielding_call(ctx, in, rpc_arg, system_thread);
 }
 
+/*
+ * 5b. Asynchronous notification over the signal bus
+ *
+ * The TEE service group defines no framework notification events (RPMI spec
+ * section 4.16.2), so OP-TEE signals the REE asynchronously over the signal
+ * bus (services 0x05-0x08). This is the RISC-V analog of the FF-A
+ * notification path (optee_ffa_async_notif_init / notif_callback): OP-TEE
+ * raises a signal, the framework rings an availability doorbell delivered as
+ * a System MSI or System IRQ, and the REE retrieves the pending signals with
+ * TEE_SIGNAL_RETRIEVE. A retrieved signal value is the OP-TEE async
+ * notification key; the reserved top value requests an RPC bottom half.
+ */
+
+static void notif_work_fn(struct work_struct *work)
+{
+	struct optee_riscv *optee_riscv = container_of(work, struct optee_riscv,
+						       notif_work);
+	struct optee *optee = container_of(optee_riscv, struct optee, riscv);
+
+	optee_do_bottom_half(optee->ctx);
+}
+
+/*
+ * Drain all pending signals from the framework and dispatch them. Returns
+ * true if an RPC bottom half was requested by OP-TEE. TEE_SIGNAL_RETRIEVE
+ * returns the signals of one bus per call and sets MORE_AVAILABLE while other
+ * buses still have pending signals, so loop until it is clear.
+ */
+static bool optee_riscv_retrieve_signals(struct optee *optee)
+{
+	bool do_bottom_half = false;
+	size_t max_signals = optee->riscv.sender_signals;
+	struct rpmi_tee_signal_retrieve_resp *rx;
+	struct rpmi_mbox_message msg;
+	size_t rx_len;
+	u32 flags;
+
+	rx_len = struct_size(rx, signal, max_signals);
+	rx = kzalloc(rx_len, GFP_KERNEL);
+	if (!rx)
+		return false;
+
+	do {
+		u32 status, n, i;
+
+		rpmi_mbox_init_send_with_response(&msg,
+						  RPMI_TEE_SRV_SIGNAL_RETRIEVE,
+						  NULL, 0, rx, rx_len);
+		if (optee_riscv_send(optee, &msg))
+			break;
+
+		status = le32_to_cpu(rx->status);
+		if (status == (u32)RPMI_ERR_NO_DATA)
+			break;
+		if (status)
+			break;
+
+		n = min_t(u32, le32_to_cpu(rx->signal_len), max_signals);
+		for (i = 0; i < n; i++) {
+			u32 value = le32_to_cpu(rx->signal[i]);
+
+			if (value == OPTEE_ABI_ASYNC_NOTIF_BOTTOM_HALF)
+				do_bottom_half = true;
+			else
+				optee_notif_send(optee, value);
+		}
+
+		flags = le32_to_cpu(rx->flags);
+	} while (flags & RPMI_TEE_SIGNAL_RETRIEVE_MORE_AVAILABLE);
+
+	kfree(rx);
+
+	return do_bottom_half;
+}
+
+static irqreturn_t notif_irq_handler(int irq, void *dev_id)
+{
+	struct optee *optee = dev_id;
+
+	if (optee_riscv_retrieve_signals(optee))
+		queue_work(optee->riscv.notif_wq, &optee->riscv.notif_work);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * Arm the OP-TEE asynchronous notification subsystem (OPTEE_ABI_ENABLE_ASYNC_NOTIF
+ * blocking call, the mirror of FF-A's OPTEE_FFA_ENABLE_ASYNC_NOTIF). The reserved
+ * bottom-half signal value is handed to OP-TEE so that a raise of that value is
+ * understood as a request to run the driver bottom half rather than as a plain
+ * notification key.
+ */
+static int optee_riscv_enable_async_notif(struct optee *optee)
+{
+	u64 in[RPMI_TEE_OPTEE_CALL_REGS] = { OPTEE_ABI_ENABLE_ASYNC_NOTIF,
+		      optee->riscv.bottom_half_value };
+	u64 out[RPMI_TEE_OPTEE_RESP_REGS] = { };
+	int rc;
+
+	rc = optee_riscv_tee_call(optee, in, out);
+	if (rc)
+		return rc;
+	if (out[0])
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * Set up the signal bus with OP-TEE (TEE_SIGNAL_BUS_SETUP, service 0x05) and
+ * request the availability doorbell IRQ. The bus must be set up by the REE
+ * (RPMI spec section 4.16.7) and is sized so every OP-TEE async notification
+ * value, plus the reserved bottom-half value, maps to a distinct signal that
+ * OP-TEE may raise.
+ */
+static int optee_riscv_setup_signal_bus(struct optee *optee)
+{
+	struct rpmi_tee_signal_bus_setup_req tx = {
+		.target_id = cpu_to_le32(RPMI_TEE_ENDPOINT_OPTEE),
+		.bus_width = cpu_to_le32(OPTEE_ABI_ASYNC_NOTIF_BUS_WIDTH),
+		/*
+		 * SENDER_SIGNALS (RPMI spec Table 190) is the number of signals
+		 * reserved for us, the sender, to receive: signals 0 <= x < N
+		 * are raised by the target (OP-TEE) and read by us. We only
+		 * ever receive notifications from OP-TEE and never raise any, so
+		 * reserve the whole bus for OP-TEE to raise.
+		 */
+		.sender_signals = cpu_to_le32(OPTEE_ABI_ASYNC_NOTIF_BUS_WIDTH),
+	};
+	struct rpmi_tee_signal_bus_setup_resp rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_TEE_SRV_SIGNAL_BUS_SETUP,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = optee_riscv_send(optee, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	return 0;
+}
+
+static void optee_riscv_teardown_signal_bus(struct optee *optee)
+{
+	struct rpmi_tee_signal_bus_teardown_req tx = {
+		.target_id = cpu_to_le32(RPMI_TEE_ENDPOINT_OPTEE),
+	};
+	struct rpmi_tee_signal_bus_teardown_resp rx = { };
+	struct rpmi_mbox_message msg;
+
+	rpmi_mbox_init_send_with_response(&msg,
+					  RPMI_TEE_SRV_SIGNAL_BUS_TEARDOWN,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	optee_riscv_send(optee, &msg);
+}
+
+/*
+ * Discover and enable asynchronous notification. Probe the SIGNAL_BUS
+ * feature word: bits [1:0] give the doorbell transport (System MSI or System
+ * IRQ), [11:2] the maximum bus width and [31:12] the doorbell index. On this
+ * platform the doorbell is wired to the platform device as its interrupt, so
+ * the index is resolved through the DT and requested with platform_get_irq().
+ */
+static int optee_riscv_async_notif_init(struct platform_device *pdev,
+					struct optee *optee)
+{
+	u32 feat = 0;
+	int irq, rc;
+
+	rc = optee_riscv_probe_feature(optee, RPMI_TEE_FEAT_SIGNAL_BUS, &feat);
+	if (rc)
+		return rc;
+
+	if (RPMI_TEE_SIGNAL_BUS_TRANSPORT(feat) == RPMI_TEE_SIGNAL_BUS_NONE)
+		return -EOPNOTSUPP;
+	if (RPMI_TEE_SIGNAL_BUS_WIDTH(feat) < OPTEE_ABI_ASYNC_NOTIF_BUS_WIDTH)
+		return -EOPNOTSUPP;
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	INIT_WORK(&optee->riscv.notif_work, notif_work_fn);
+	optee->riscv.notif_wq = create_workqueue("optee_notification");
+	if (!optee->riscv.notif_wq) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	optee->riscv.sender_signals = OPTEE_ABI_ASYNC_NOTIF_BUS_WIDTH;
+
+	rc = optee_riscv_setup_signal_bus(optee);
+	if (rc)
+		goto err_wq;
+
+	rc = request_threaded_irq(irq, NULL, notif_irq_handler, IRQF_ONESHOT,
+				  "optee_notification", optee);
+	if (rc)
+		goto err_bus;
+	optee->riscv.signal_irq = irq;
+	optee->riscv.bottom_half_value = OPTEE_ABI_ASYNC_NOTIF_BOTTOM_HALF;
+
+	rc = optee_riscv_enable_async_notif(optee);
+	if (rc)
+		goto err_irq;
+
+	return 0;
+
+err_irq:
+	free_irq(irq, optee);
+	optee->riscv.signal_irq = 0;
+err_bus:
+	optee_riscv_teardown_signal_bus(optee);
+err_wq:
+	destroy_workqueue(optee->riscv.notif_wq);
+	optee->riscv.notif_wq = NULL;
+err:
+	optee->riscv.sender_signals = 0;
+	optee->riscv.bottom_half_value = U32_MAX;
+
+	return rc;
+}
+
+static void optee_riscv_async_notif_uninit(struct optee *optee)
+{
+	if (optee->riscv.bottom_half_value == U32_MAX)
+		return;
+
+	free_irq(optee->riscv.signal_irq, optee);
+	optee_riscv_teardown_signal_bus(optee);
+	destroy_workqueue(optee->riscv.notif_wq);
+	optee->riscv.notif_wq = NULL;
+}
+
 /*
  * 6. Driver initialization
  *
@@ -1238,6 +1478,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 
 	optee->ops = &optee_riscv_ops;
 	optee->rpc_param_count = rpc_param_count;
+	optee->riscv.bottom_half_value = U32_MAX;
 
 	if (IS_REACHABLE(CONFIG_RPMB) &&
 	    (sec_caps & OPTEE_ABI_SEC_CAP_RPMB_PROBE))
@@ -1291,6 +1532,13 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_close_ctx;
 
+	if (sec_caps & OPTEE_ABI_SEC_CAP_ASYNC_NOTIF) {
+		rc = optee_riscv_async_notif_init(pdev, optee);
+		if (rc)
+			dev_warn(dev, "Failed to initialize async notifications: %d\n",
+				 rc);
+	}
+
 	rc = optee_enumerate_devices(PTA_CMD_GET_DEVICES);
 	if (rc)
 		goto err_unregister_devices;
@@ -1306,6 +1554,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 
 err_unregister_devices:
 	optee_unregister_devices();
+	optee_riscv_async_notif_uninit(optee);
 	optee_notif_uninit(optee);
 err_close_ctx:
 	teedev_close_context(ctx);
@@ -1334,6 +1583,8 @@ static void optee_riscv_remove(struct platform_device *pdev)
 {
 	struct optee *optee = platform_get_drvdata(pdev);
 
+	optee_riscv_async_notif_uninit(optee);
+
 	optee_remove_common(optee);
 
 	mutex_destroy(&optee->riscv.mutex);
diff --git a/drivers/tee/optee/optee_riscv.h b/drivers/tee/optee/optee_riscv.h
index 2cdbb1fb4eab..33a714b79f98 100644
--- a/drivers/tee/optee/optee_riscv.h
+++ b/drivers/tee/optee/optee_riscv.h
@@ -82,6 +82,70 @@ enum rpmi_tee_feature_id {
 #define RPMI_TEE_MEMORY_SHARE_TEE_ONLY		1
 #define RPMI_TEE_MEMORY_SHARE_FULL		2
 
+/*
+ * SIGNAL_BUS feature word encoding (RPMI spec Table 182, feature id 4).
+ *
+ * The TEE service group defines no framework notification events
+ * (RPMI spec section 4.16.2), so asynchronous notification from OP-TEE rides
+ * the signal bus (services 0x05-0x08) instead. The SIGNAL_BUS feature word
+ * describes both how the availability doorbell is delivered and the shape of
+ * the bus:
+ *   [1:0]   transport: 0 unsupported, 1 System MSI, 2 System IRQ
+ *   [11:2]  maximum bus width (number of signals per endpoint pair)
+ *   [31:12] System MSI index or System IRQ index of the availability doorbell
+ */
+#define RPMI_TEE_SIGNAL_BUS_TRANSPORT(v)	((v) & GENMASK(1, 0))
+#define RPMI_TEE_SIGNAL_BUS_WIDTH(v)		(((v) & GENMASK(11, 2)) >> 2)
+#define RPMI_TEE_SIGNAL_BUS_INDEX(v)		(((v) & GENMASK(31, 12)) >> 12)
+
+#define RPMI_TEE_SIGNAL_BUS_NONE		0
+#define RPMI_TEE_SIGNAL_BUS_MSI			1
+#define RPMI_TEE_SIGNAL_BUS_SYSIRQ		2
+
+/*
+ * Signal bus wire encodings (RPMI spec section 4.16.7-4.16.10,
+ * Tables 190-197). The bus is always set up by the REE; signals
+ * 0 <= x < sender_signals are raised by the target (OP-TEE) and read by us.
+ */
+struct rpmi_tee_signal_bus_setup_req {
+	__le32 target_id;
+	__le32 bus_width;
+	__le32 sender_signals;
+};
+
+struct rpmi_tee_signal_bus_setup_resp {
+	__le32 status;
+};
+
+struct rpmi_tee_signal_bus_teardown_req {
+	__le32 target_id;
+};
+
+struct rpmi_tee_signal_bus_teardown_resp {
+	__le32 status;
+};
+
+/* TEE_SIGNAL_RETRIEVE response (Table 197); request carries no data. */
+#define RPMI_TEE_SIGNAL_RETRIEVE_MORE_AVAILABLE	BIT(31)
+
+struct rpmi_tee_signal_retrieve_resp {
+	__le32 status;
+	__le32 flags;
+	__le32 target_id;
+	__le32 signal_len;
+	__le32 signal[];
+};
+
+/*
+ * Asynchronous notification signal assignment (frozen contract with secure
+ * world OP-TEE). A raised signal value is the OP-TEE async notification key
+ * verbatim: values 0 <= x < OPTEE_ABI_MAX_ASYNC_NOTIF_VALUE are delivered to
+ * optee_notif_send(), and the reserved top value requests an RPC bottom half.
+ * The bus is therefore sized one wider than the maximum notification value.
+ */
+#define OPTEE_ABI_ASYNC_NOTIF_BOTTOM_HALF	OPTEE_ABI_MAX_ASYNC_NOTIF_VALUE
+#define OPTEE_ABI_ASYNC_NOTIF_BUS_WIDTH		(OPTEE_ABI_MAX_ASYNC_NOTIF_VALUE + 1)
+
 /* TEE_PROBE_FEATURES request (Table 183) / response (Table 184). */
 struct rpmi_tee_probe_features_req {
 	__le32 feature_id;

-- 
2.34.1


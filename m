Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D339A070
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881179; cv=none; b=oDtNcUXYwq2XE1N5sVy4bvT++fLMN5uh13yRobZxExrv06VxoEop9YlIxG1j8/vscjjXLTgHWJypDJycgHvbXxYse8WzoxJp9+xxP0myBTgFIU6Ex4t7nV1eqXoCaO29gYQKByh9z37lodV444Q+ViiOuDnj2CdLfcPf7EkY190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881179; c=relaxed/simple;
	bh=WOlYML6nDWgfki9gBvI5PrtveNHb2NgS9scfx9ZQuf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGutfANeNqG4e2MZjuFKNopQH72xNFWpS4v258HYQZNw8kkAIseWa8qAzsSlGG1vtktfJ7+Wq0PUSTsnPYQpInZlUWOuts18WhFJFxtlNPIFuvqTVuAkhvYJ9fUFsea8Gb8vvYS34PhlsVja7UF7N/qAZk6bOXTMaG5BgFsv9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6/XMFNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLivjvZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6/XMFNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLivjvZM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Afeu3752769
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fh+Jj8+Zn8eGJqRFVuNyIaNN45uhPJrqS4xeK/EivYw=; b=b6/XMFNd21lDGnjt
	ye2e/J1ir93ZnuqegqZCZxrvsfMu2nR5PDnjCa1YKzxn94ez5gre0vorGS2GLJbV
	vXeUUwJANnNw6Lh2OdxmUcSIZ0PyiWsxTTTspi9SOYv2PWVwgQywBmvFbyAxKwxr
	qHK3O93/Qnz9xx5mzvl095tdzXa6+eDZ6S52o3b8ian4G+SvGMdEf6nz6GazX2rU
	4oGSU+C2z21Jk7pOitPgwB6VJl7EePQocLgNYpZsZv2SWEizGxXd7rjqwdMo6sjV
	k97RY3Prv0W3DXqQlB2+uq3189KxE4EnZTl7Bg/7P8NW4y2kAvFPDnlFSYT3C08Q
	zUEG5A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w35d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so3109928a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881176; x=1792485976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fh+Jj8+Zn8eGJqRFVuNyIaNN45uhPJrqS4xeK/EivYw=;
        b=SLivjvZMw8oTxNKOwG6Zw5RZ4+MnLp75tF7Nky0FPkNG9q1pnpxbgdMfQMljLmtxOk
         8IpAPWSMS41/EVLGI4sU5/lkU9ymAPmjEMIAB35vYj/b1GB4UE0eXNJ8JE+eDFCxSwcX
         UEkQVvQ5x4l64mIqjHnpj06w0xJ64ZHV/yWTlmJTzotQlgek0hRTzGIVqZ5JrOJS60MY
         h8dHTGaDqCeMpiK2e0fX9nrg/PGLx4nWHAyl3VT+vNSJp4xHxajoLIdKkSl+2DIteEaY
         Sr3S5ZADGHTdZ1DKfk3ou21HIQzLq3SXoloXa2tymDTH6koYzWlQOfXg/WCQqE2jdeFa
         CDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881176; x=1792485976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fh+Jj8+Zn8eGJqRFVuNyIaNN45uhPJrqS4xeK/EivYw=;
        b=S8Hdd5XFBCXRARaGELH2gvlBvwlxd7RriXNsp5xGbYlK5lbcioxbL95uoQ6QM6MYjN
         7wAakrq2781j4HCGAofz4m/jW1BjDPXOw/8d3Qk+3lbWcFlE4INB2M0yIATe8BoC/viU
         U0gofKBu8ndVs/AWhWzi0/c9YboTvAvgyoYLRos4FJq5FJH38Z5Nlm4beJeBshOoRojV
         lzSE8VWKFrGnYSxPXYJaaPSepMnRbWVMHOEXlIiWkk5uwx2xijpKk0O4mnE9tq95olHd
         O6oOeniiUT2ZfrLZix2XG7Qw4jLDrCa2NwNBRHIq+DCJiLssbrtoIsG/zTygbfpxkf6j
         3g6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcxbUlspFDzaQzAVQdatD+pfp6hrghyOUhYtb1KcTbfqpfUubLV6dfrjwWKt28kmHoMCGQankn7985wz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgGvZwNiT6xHqXHp1EW8wn6N20WH3kUSdFn4PeV6AREhv/nDcD
	8jF1yQ+mXbgmR/ev1eKSY9R9MIgabA1UQVcn2OyS6IgH0oONu5nxN2uqVExXLuWN7oo1dljY353
	Rf99+iS67xMbvVsKlHV7BoJOxGBp0KtKH247NPnfchZ2noVDS1dTR1zUxZ16Okua3XYA=
X-Gm-Gg: AYBFou3127T+10YRAR/bu2h/m2e3ck5gBJE2Y2D1VpBP51MiWv1jmguxCgzQKVRzw26
	y1Nybd4g+QXJiyd0KE2LnSINItlCPvfvZlXrfSFPPgob6NlSYafacGaQBt5GpQhF3j9SPvWKKDk
	z/oy3igTXTtfNijYqnelBBjlqQtEQec7K0Y1FDEBkLGrYxlgMOeQUwTh/kwvafaqa4F+fXZS2sG
	jbsPqqhQe7UCPN9ni4Q7QolerLmV56XBG28PEaQKyVPalESgmXL7/7OUlAN/r/aecldJD+BaX/d
	zUYsWC2+sjIPkRROrMPIknDh0aSmkwlDn1IKaT8xB7BPIRWErS/pM43HQVFYjlLmcVnIMrqXXcQ
	ctUsRJ2Kk9t+Yj9phFCtAip4Tc5qo
X-Received: by 2002:a05:6a21:3511:b0:3dd:85a9:55ab with SMTP id adf61e73a8af0-3e16be2877amr9611904637.36.1791881175462;
        Tue, 13 Oct 2026 01:46:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:3511:b0:3dd:85a9:55ab with SMTP id adf61e73a8af0-3e16be2877amr9611881637.36.1791881174703;
        Tue, 13 Oct 2026 01:46:14 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:14 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:37 +0530
Subject: [PATCH v9 6/7] bus: mhi: Capture DDR training data via command
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-6-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=15007;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=WOlYML6nDWgfki9gBvI5PrtveNHb2NgS9scfx9ZQuf8=;
 b=psbm6jMAAjK7lNpxoTOioyXftRy59uIo1Whu3Dj27lMaBEIj4OZRnnORYVLiro3Fj7RWJwSrB
 yNH/+I4JaIaBD+1hiZrX0J9vAmL6r0shENEXMj04KgzwOOzxV5+sNhR
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: GXNmvgcZqGEGXzV3X8ELYwy9jjwzS87r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX335ayfZynNS9
 +YjA0qLKvt982ATkSljCHXe6nQqrnzY+0+xKdhbSutHHXJ+YMnC2bF8W89+5NiRc4lim1bqPS/4
 JtXRXjRjkuZqa+kqOpYehA0lNcM5AYUWj7u+F+Y5k4f13pi/GSIZKO413BFHkw69RQdgjaiQFaK
 yO6qRxFVPKdQcK6nl+SQSz0MZr0nx/8+aJ8tAQiVlkeQKFDW2tvqXhY057Pj/1Vx5HmBmSXAOlW
 9w2EAm64y2sZk77v1aIunQxwgRptdYlu5iIKdEJ/a7xBM49Cp6y9pTePj7JsPHg3tTt/7sH2yyT
 Btr8AnFYVTh/V/8laVsjjnvCG5znSq3720wIQiHspJy+H6jVvv/2vt4Zdnz88dH4YTZ7Y5GJ+3z
 k7xK+4wdwyITdMG0I9lYw3KH6qNa9IvIECIUoO7QioeRFBo13fl/cxzAYG4hz/m5iS0XuEVNFlC
 ikOyiDZXCguXINSv6Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX5/hV9NEPhjrU
 HPoHVzPgPz93/Aw/fphmL0QXOJcMEO8YtLW3riXaspPT2r6EAvqdX1+sCTeryBQFlVWN8I/xjfh
 ICuwPMipl4NcWmN7eKfIgOa50yof16c=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdefd8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_u4x-iUupSARUiuVX_kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: GXNmvgcZqGEGXzV3X8ELYwy9jjwzS87r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

During early boot, devices may perform DDR training and produce training
data that can be reused on subsequent boots to reduce initialization
time. The Sahara protocol provides a command mode flow to transfer this
training data to the host, but the driver currently does not handle
command mode and drops the training payload.

Add Sahara command mode support to retrieve DDR training data from the
device. When the device enters command mode and sends CMD_READY, query
the support command list(ID 8) and request DDR training data(ID 9) using
EXECUTE and EXECUTE_DATA as defined by protocol. Allocate receive buffers
based on the reported response size and copy the raw payload directly from
the MHI DL completion callback.

Store the captured training data in controller-scoped memory using devres,
so it remains available after Sahara channel teardown. Also distinguish
raw payload completion from control packets in the DL callback, avoiding
misinterpretation of training data as protocol messages, and requeue
the RX buffer after switching back to IMAGE_TX_PENDING to allow the
boot flow to continue.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 326 ++++++++++++++++++++++++++-
 1 file changed, 319 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 62b9c72e826801a77a321991f9bb91af37e0cc8c..aa684355b7a31674f81a43a3783d5c4158b824b1 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -5,10 +5,13 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
 #include <linux/minmax.h>
+#include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
@@ -58,7 +61,15 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
+#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
+#define SAHARA_SWITCH_MODE_LENGTH	0xc
+#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
+#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
 #define SAHARA_DDR_TRAINING_IMG_ID	34
+#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
 
 struct sahara_packet {
 	__le32 cmd;
@@ -94,6 +105,19 @@ struct sahara_packet {
 			__le64 memory_address;
 			__le64 memory_length;
 		} memory_read64;
+		struct {
+			__le32 client_command;
+		} command_execute;
+		struct {
+			__le32 client_command;
+			__le32 response_length;
+		} command_execute_resp;
+		struct {
+			__le32 client_command;
+		} command_exec_data;
+		struct {
+			__le32 mode;
+		} mode_switch;
 	};
 };
 
@@ -160,6 +184,7 @@ struct sahara_context {
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
 	struct work_struct		read_data_work;
+	struct work_struct		cmd_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -180,6 +205,24 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
 	const char			*fw_folder;
+	bool				is_cmd_mode;
+	bool				receiving_training_data;
+	size_t				training_size;
+	size_t				training_rcvd;
+	u32				training_nbuf;
+	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
+};
+
+/*
+ * Controller-scoped training data store (per MHI controller device).
+ * Stored as devres resource on mhi_dev->mhi_cntrl->mhi_dev->dev.
+ */
+struct sahara_cntrl_training_data {
+	struct mutex lock;	/* Protects data, size, copied and receiving */
+	void *data;
+	size_t size;
+	size_t copied;
+	bool receiving;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -187,6 +230,48 @@ static bool is_streaming(struct sahara_context *context)
 	return !context->non_streaming;
 }
 
+static void sahara_cntrl_training_release(struct device *dev, void *res)
+{
+	struct sahara_cntrl_training_data *ct = res;
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+	mutex_unlock(&ct->lock);
+}
+
+static int sahara_cntrl_training_match(struct device *dev, void *res, void *match_data)
+{
+	/* Exactly one instance per controller */
+	return 1;
+}
+
+static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct device *dev)
+{
+	struct sahara_cntrl_training_data *ct;
+
+	ct = devres_find(dev, sahara_cntrl_training_release,
+			 sahara_cntrl_training_match, NULL);
+	if (ct)
+		return ct;
+
+	ct = devres_alloc(sahara_cntrl_training_release, sizeof(*ct), GFP_KERNEL);
+	if (!ct)
+		return NULL;
+
+	mutex_init(&ct->lock);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+
+	devres_add(dev, ct);
+	return ct;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -280,6 +365,11 @@ static void sahara_send_reset(struct sahara_context *context)
 	context->is_mem_dump_mode = false;
 	context->read_data_offset = 0;
 	context->read_data_length = 0;
+	context->is_cmd_mode = false;
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -315,7 +405,8 @@ static void sahara_hello(struct sahara_context *context)
 
 	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
 	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_COMMAND) {
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
 			le32_to_cpu(context->rx->hello.mode));
 		return;
@@ -334,6 +425,153 @@ static void sahara_hello(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
 }
 
+static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
+	context->tx[0]->mode_switch.mode = cpu_to_le32(SAHARA_MODE_IMAGE_TX_PENDING);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
+}
+
+static void sahara_command_execute(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
+	context->tx[0]->command_execute.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
+}
+
+static void sahara_command_execute_data(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
+	context->tx[0]->command_exec_data.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send execute data %d\n", ret);
+}
+
+static void sahara_command_ready(struct sahara_context *context)
+{
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command ready packet - length %u\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	context->is_cmd_mode = true;
+	context->receiving_training_data = false;
+
+	sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
+}
+
+static void sahara_command_execute_resp(struct sahara_context *context)
+{
+	struct device *dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+	struct sahara_cntrl_training_data *ct;
+	u32 client_cmd, resp_len;
+	int ret;
+	u64 remaining;
+	u32 i;
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
+	    le32_to_cpu(context->rx->command_execute_resp.response_length) < 0) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command execute resp packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	client_cmd = le32_to_cpu(context->rx->command_execute_resp.client_command);
+	resp_len = le32_to_cpu(context->rx->command_execute_resp.response_length);
+
+	sahara_command_execute_data(context, client_cmd);
+
+	if (client_cmd == SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST) {
+		sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
+		return;
+	}
+
+	if (client_cmd != SAHARA_EXEC_CMD_GET_TRAINING_DATA)
+		return;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = kzalloc(resp_len, GFP_KERNEL);
+	ct->size = resp_len;
+	ct->copied = 0;
+	ct->receiving = true;
+	mutex_unlock(&ct->lock);
+
+	if (!ct->data) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	context->training_size = resp_len;
+	context->training_rcvd = 0;
+	context->receiving_training_data = true;
+
+	remaining = resp_len;
+	for (i = 0; i < SAHARA_NUM_CMD_BUF && remaining; i++) {
+		size_t pkt = min_t(size_t, remaining, SAHARA_PACKET_MAX_SIZE);
+
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->cmd_buff[i], pkt,
+				    (remaining <= pkt) ? MHI_EOT : MHI_CHAIN);
+		if (ret)
+			break;
+
+		remaining -= pkt;
+	}
+
+	context->training_nbuf = i;
+}
+
+static void sahara_command_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
+	int ret;
+
+	if (le32_to_cpu(context->rx->cmd) == SAHARA_EXECUTE_RESP_CMD)
+		sahara_command_execute_resp(context);
+
+	if (!context->receiving_training_data) {
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->rx, SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+
+		if (ret)
+			dev_err(&context->mhi_dev->dev,
+				"Unable to requeue rx buf %d\n", ret);
+	}
+}
+
 static int read_data_helper(struct sahara_context *context, int buf_index)
 {
 	enum mhi_flags mhi_flag;
@@ -560,6 +798,9 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_MEM_DEBUG64_CMD:
 		sahara_memory_debug64(context);
 		break;
+	case SAHARA_CMD_READY_CMD:
+		sahara_command_ready(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -860,6 +1101,20 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
 	INIT_WORK(&context->read_data_work, sahara_read_data_processing);
+	INIT_WORK(&context->cmd_work, sahara_command_processing);
+
+	for (i = 0; i < SAHARA_NUM_CMD_BUF; i++) {
+		context->cmd_buff[i] = devm_kzalloc(&mhi_dev->dev,
+						    SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		if (!context->cmd_buff[i])
+			return -ENOMEM;
+	}
+
+	context->is_cmd_mode = false;
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -883,6 +1138,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
+	cancel_work_sync(&context->cmd_work);
 	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
@@ -899,15 +1155,71 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_cntrl_training_data *ct;
+	struct device *dev;
+	size_t copy;
+	int ret;
+	u32 i;
+
+	if (mhi_result->transaction_status)
+		return;
+
+	/*
+	 * Raw training payload completions arrive for cmd_buff[] buffers.
+	 * Do not schedule cmd_work for those.
+	 */
+	if (context->is_cmd_mode && context->receiving_training_data &&
+	    mhi_result->buf_addr != context->rx) {
+		dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+		ct = sahara_cntrl_training_get(dev);
+		if (!ct)
+			return;
 
-	if (!mhi_result->transaction_status) {
-		context->rx_size = mhi_result->bytes_xferd;
-		if (context->is_mem_dump_mode)
-			schedule_work(&context->dump_work);
-		else
-			schedule_work(&context->fw_work);
+		for (i = 0; i < context->training_nbuf; i++) {
+			if (mhi_result->buf_addr == context->cmd_buff[i]) {
+				mutex_lock(&ct->lock);
+				copy = min_t(size_t, mhi_result->bytes_xferd,
+					     ct->size - ct->copied);
+				memcpy((u8 *)ct->data + ct->copied,
+				       mhi_result->buf_addr, copy);
+				ct->copied += copy;
+				mutex_unlock(&ct->lock);
+
+				context->training_rcvd += copy;
+
+				if (context->training_rcvd >= context->training_size) {
+					mutex_lock(&ct->lock);
+					ct->receiving = false;
+					mutex_unlock(&ct->lock);
+
+					context->receiving_training_data = false;
+					context->is_cmd_mode = false;
+
+					sahara_switch_mode_to_img_tx(context);
+					ret = mhi_queue_buf(context->mhi_dev,
+							    DMA_FROM_DEVICE,
+							    context->rx,
+							    SAHARA_PACKET_MAX_SIZE,
+							    MHI_EOT);
+					if (ret)
+						dev_err(&context->mhi_dev->dev,
+							"Unable to requeue rx buf %d\n", ret);
+				}
+				return;
+			}
+		}
+		return;
 	}
 
+	/* Normal Rx completion */
+	context->rx_size = mhi_result->bytes_xferd;
+	if (context->is_mem_dump_mode)
+		schedule_work(&context->dump_work);
+	else if (context->is_cmd_mode)
+		schedule_work(&context->cmd_work);
+	else
+		schedule_work(&context->fw_work);
+
 }
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {

-- 
2.34.1


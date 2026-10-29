Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246330;
	b=oMA6woiyExn5v+ywtIIUF6gpz4ur7KhMOxnPQV7yPr/r+vOQbxyIVKMm65MdDvmRuVeC
	 HjK4U+JCtLFWFtoAAh0ytELfFIQuL9KfzVazeGF1Wl9bFr24m4VD8c44TU3mMDqK9IF9G
	 Baz66aU2nHwVb6zaDOTjOr42RsmGcWvxFxqDtVOHnUFuniFn5DE4ramxzD4yAId4e8Lo/
	 3hMLwcWj/KqxcbkytSBauVfIF5V1rwrZU5UpIBXon3MqUZsFedxpkCzsMvQgbQZyqBdqd
	 xxWHCfdtXxbOzyGoEaj52e1ENtNLIKGd2D7Tgz66ycyLN04gSslRlt2u12B6ebHQEoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246330;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=IgbNz+SNgouia/IOvlHkxYnX76eQZ+kGE/jr65hcj7c=;
	b=tFvOw7cu/9l/o82tUrcwcCkiA9HYNZpLTwFIq8CMKZNgnTS+YDZSs9O4Eq3En2dvUN+h
	 PkHcZZnq0TrH2JYcVbYxOeXP6lrVidMHeEh6kzKDE4koloepVoPkj7+mM5hpRuQxLXBQR
	 eapyWHzG33HOSHlBWpQpT9S8IyaoQi30KVD+/+PDwk4Q4S/ZkM3G68sGFNLIb06QlY8qm
	 F9Jr5Lut4Ux6aFWW5RjIqTGIagzitpyfoewVm/u+RV+68mvntaR4FoPmPKqcIDj8Pr/9v
	 2GFKUq1wrUGUhrqSsQewO+dipeUf63mc0hsW/rmmt8LQ61PbyRBntZzm6VfUEScSfYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71774606A32F;
	Thu, 29 Oct 2026 03:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71774606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246308t7553b4d1
X-QQ-Originating-IP: 8S/q3VMDhlXxy5MiBaIKvjvTI/fNn/VqPiFYkd4YxAk=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7907422778241273766
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 11:58:10 +0800
Subject: [PATCH 5/5] media: iris: Recycle decoder buffers for non-display
 pictures
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
Message-Id: <20261029-iris-va-fixes-v1-5-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
In-Reply-To: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5731; i=sophon@radxa.com;
 h=from:subject:message-id; bh=vbrIyfaSgxCS/czmR4f/8hxsAEFbVTZnOXusQwoLvVo=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgT1Sds/WjN3hxBnsYDDx6MfNHVYOMoftM57Un83V
 jqspGtSRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIkcrWD4n8RhEPqJZ0qT9F2x
 H6t2Z+5OsLI7Fubb9O2Pnlq5n+yX34wM8wR4lATtz8UaPH53i53jvYqKb+/UqVp72efKfXkU2uL
 CDQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NhFh/C1ssL5wjn7ePSJWjXWuC/2KMVAOuw4//sHTQFBMyhzUHoMJTMVS
	RRrC4L87jNi9Y9t21yf1NPDyMIzZETgTyGFg7RuLgDqTUxn1dSPReCtPIanEJIrhQO1jMq/
	0Mn9avOLvNnJx08IT069tDt33FcNgdDdfvoS2bHfEFh+g8CRqEoBk8iejvLJG8wktVuK2zo
	1X/Gdfs29QFkIjyadKvhjvLKyfEoaSBjHfr/3NtkHfxLcLES9LDXC+KKLluuvSIJgUzvIyR
	IkB9zNXOtupgKPyZ5TpmGKJnEtwEG/OabZ0HrOg8h194nmCLbAA5XyxSetN4hKgMbpXX5+P
	oKEAfy7esi7ZzvggNrBCUNXEYtIL3dfqyXP9EStpjKEQiP9ykEK2xH9g2kgNSsTcEu2+UwY
	HFaHUAerU0Qt+M0MMtCrDEoQKt7ivAqF16W+73qGh5xm3XuZ6aUaRL3L+fLS/rNl35IntVw
	So3qUyzv4q1OZU8x91l7EFBGJnS0EKVSScqDGYVNCiJnCpt6BbVbAo/UdlYFwg8axecNo/T
	vrv69PACfGhnjL0k18vmX5wc0Xr5sq1wTorKxvklKDW5Imgm7+WXR8h7dfwmNGN+//xkrHK
	5Kqg2jqC2bPimHPW8BvuWVMOYd5XkDnH5DfgnMiW+fU4yk4/pHcmio1zH84pdop/vEVF5N7
	UMlQ1T/ai4RsoIJqip9lAZ5c/oHqn7devvjwaVAR3ENd4jqc0K+wC5bFlX+ynPv0QEe47YI
	QMJe2TpqzKr7aR8c2Sq1TxTM5GItyYA5uY0eFqX/khMzG/jxRW7++oikgaM5+bAt3YsPPa0
	num+2/YfI4uT0mwr7PtCLxFFCmsPPVHTlaQhIT07IX91fS2Bm6gn/k7yTx6KgSDNpzZPrzp
	mJBLQHRV5mWkoUnPaYPTPRwh5PIbzcRMLDR/hHmLxD6UBoNhwEvZdiM4OOps76Nr8IsOHAf
	lcAr5to9cbNs0ciXxkGihrr48Emf6Lsuwqz4lmwK73rNjTxZMEiRfAYN+hlSvq+h/Zs14Z9
	8qisplZDeQjlM9TbNHeRMIa2lHEMam6d781rlG4RJQsiDIqEX4ILv0ucyFgnhzXZy5qWk73
	Q==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

HFI gen2 reports non-display pictures with HFI_GEN2_PICTURE_NOSHOW, but
Iris returns them as errors. For AV1, hidden and displayed pictures can
share a timestamp, so GStreamer's v4l2av1dec drops the pending frame and
loses the displayed picture.

Recycle successful non-display buffers within the driver instead of
returning them to userspace as errors. This also fixes VP9 streams using
hidden alt-ref frames.

Fixes: ac72ad9deafa ("media: iris: Add handling for no show frames")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 11 ++++-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 47 ++++++++++++++++++++--
 3 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 21ab58e0aa84..79aac2d4e500 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -20,6 +20,7 @@ struct iris_core;
  * @packet: HFI packet
  * @ipsc_properties_set: boolean to set ipsc properties to fw
  * @opsc_properties_set: boolean to set opsc properties to fw
+ * @output_stopping: capture STOP command is awaiting its response
  * @hfi_frame_info: structure of frame info
  * @src_subcr_params: subscription params to fw on input port
  * @dst_subcr_params: subscription params to fw on output port
@@ -29,6 +30,7 @@ struct iris_inst_hfi_gen2 {
 	struct iris_hfi_header		*packet;
 	bool				ipsc_properties_set;
 	bool				opsc_properties_set;
+	bool				output_stopping;
 	struct iris_hfi_frame_info	hfi_frame_info;
 	struct hfi_subscription_params	src_subcr_params;
 	struct hfi_subscription_params	dst_subcr_params;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a285e6fc8728..77ea153bf2d7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1172,7 +1172,16 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
 	if (ret)
 		return ret;
 
-	return iris_wait_for_session_response(inst, false);
+	/* The response wait drops inst->lock, allowing buffers to be returned. */
+	if (plane == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		inst_hfi_gen2->output_stopping = true;
+
+	ret = iris_wait_for_session_response(inst, false);
+
+	if (plane == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		inst_hfi_gen2->output_stopping = false;
+
+	return ret;
 }
 
 static int iris_hfi_gen2_session_pause(struct iris_inst *inst, u32 plane)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..a545410d1e8d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -101,9 +101,7 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
 		HFI_GEN2_PICTURE_CRA | HFI_GEN2_PICTURE_BLA;
 	u32 driver_flags = 0;
 
-	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHOW)
-		driver_flags |= V4L2_BUF_FLAG_ERROR;
-	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
+	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
 		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
 	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_P)
 		driver_flags |= V4L2_BUF_FLAG_PFRAME;
@@ -345,9 +343,40 @@ static int iris_hfi_gen2_handle_input_buffer(struct iris_inst *inst,
 	return 0;
 }
 
+static int iris_hfi_gen2_requeue_output_buffer(struct iris_inst *inst,
+					       struct iris_buffer *buf)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u64 timestamp = buf->timestamp;
+	int ret;
+
+	buf->data_size = 0;
+	buf->timestamp = 0;
+	buf->flags = 0;
+	buf->attr &= ~BUF_ATTR_DEQUEUED;
+	buf->attr |= BUF_ATTR_DEFERRED;
+
+	/* Leave stopped buffers for streamoff cleanup or the next streamon. */
+	if (inst_hfi_gen2->output_stopping ||
+	    (inst->state != IRIS_INST_STREAMING &&
+	     inst->state != IRIS_INST_OUTPUT_STREAMING))
+		return 0;
+
+	ret = iris_queue_buffer(inst, buf);
+	if (ret) {
+		buf->attr &= ~BUF_ATTR_DEFERRED;
+		buf->attr |= BUF_ATTR_DEQUEUED;
+		buf->flags = V4L2_BUF_FLAG_ERROR;
+		buf->timestamp = timestamp;
+	}
+
+	return ret;
+}
+
 static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 					      struct iris_hfi_buffer *hfi_buffer)
 {
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	struct v4l2_m2m_buffer *m2m_buffer, *n;
 	struct iris_buffer *buf;
@@ -390,8 +419,18 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	if (inst->domain == DECODER &&
+	    inst_hfi_gen2->hfi_frame_info.picture_type & HFI_GEN2_PICTURE_NOSHOW) {
+		/* A hidden reference picture is neither a display frame nor an error. */
+		buf->data_size = 0;
+		if (inst->state == IRIS_INST_ERROR)
+			buf->flags |= V4L2_BUF_FLAG_ERROR;
+		if (!(buf->flags & (V4L2_BUF_FLAG_ERROR | V4L2_BUF_FLAG_LAST)))
+			return iris_hfi_gen2_requeue_output_buffer(inst, buf);
+	}
+
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(buf->flags & V4L2_BUF_FLAG_LAST)) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 

-- 
2.56.0


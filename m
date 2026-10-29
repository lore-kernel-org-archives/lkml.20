Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246319;
	b=qTlPTN2AaaBlBpEcfJU4Bqoopju6Cv14L20zuG0aLk/fsG3eeY8bO0VqebyrGfjHBKZ/
	 AQcOacq3EvadciBMwX45Lx9uZaG8ZXICd495lG/oc3Gz+5ZLIcI+1YsLphhczKKuQlPwE
	 2XC+CFIRd2j3o8QnaQRzObtwB3A2o1jZVkddpNEI9eMTQ0tXIhKhkDnlPE5EOr9Veh8nD
	 8CHeOfTY+LFquhfB8l2+At6upGvlg2edaeCNR9CvjTTVoXz6cnIdCTXlPrBjak3Gn0NE2
	 lbkcxpXYsNfWZby2FQU712geYo7xncf9L4pYPuGjaSKJXlU2tFXSVepGbh6T8CfEzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246319;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=BFyLvxz4SXBn37Mm+VHu0liQCJYb3+5Wnq/m/6TzgMQ=;
	b=RMwvPQXbf5RIIJv1dVjO6qpkwbHH4CQxNTIJdPZN3AmM3hD+EmXDLt0lspYPPp7gyvt3
	 M7EbarZIu9hc/9M8rz4Smczc+MwD6kYe47/k0ViGRj73in6T7gMXBwGyI6xE0il4GX1zu
	 wn4iZQ7fa8rexay+S/alLYy1Dr6rDD0PSzLfFLlmcpZ6k1RoxxEk04/RYXz5g+TayriJf
	 C7ZTeex0C4RFSAXkMr6Bx8frsbnQk75oQjTgYMuoDlrYktGJGDGNacfNc/68lwfdQ4Z8D
	 p5u+5N1yVn6vF33M1k+fvQM8UTk9tzgKly1xpNw92JW+wcePapAtsSs4xpJAISRwwCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877C606A32D;
	Thu, 29 Oct 2026 03:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6877C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246298t9a167de4
X-QQ-Originating-IP: nweIdh7gutCYAe23QkulISMAwB3Hw2QnoC6AogDnQUc=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8137748758459802009
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 11:58:07 +0800
Subject: [PATCH 2/5] media: iris: allow larger capture buffer pools on HFI
 gen2
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
Message-Id: <20261029-iris-va-fixes-v1-2-44a2783f782b@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=sophon@radxa.com;
 h=from:subject:message-id; bh=zBt5EWF02554zl4wui+IeGIlpE3r7mVcyNeUaq/LzB8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgTZVMpNWXdg0sPfZ72vx23a2GrTPG3vevvJJvPXs
 D55qW8Y0FHKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BWAi1vIM/8slBJbaGzXujZG3
 uMV/hX3XWvccyYzLbsfCDijf2Pfl0xVGhq0tP18IbH7x5ETW0ox7y/gfKkim8+3QnP7I73I1j7u
 7PR8A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NmRjDopJZVxOniNVEP/DuHqvmxWTJff6es9/tHb3fB4XiE/wc5r/yCMA
	PGWI6UB/FwKv+CF6+d3Fu5rIpkZapcqCxlNGoI8fwn54nT+SqKj6dQTGs5oW2cR/d3dIkBb
	v0XWPzcrXffkwmbLXQcsQIw9tQk9DNZPrRjRFo7HjGjwle+XVDSpJid23sNMv7omxoSpYi6
	7Ji+27At+tFsL3MVUp0mAakFH16rQ57bGeNt3Zpf5+i4VfhNYodd8DQlNuqBdIp2C/k04hN
	QzRJAb+VS1cb1WIyhGsi/Kuo7qOU3FHo2LSLRNSUvUwMNRYmq0pE8i/6+jxUX00GV+/1sA9
	0bHzxCWp6bYHPwjVIHnCWkGe/yzRAXW0ZUNBYuPgpvAGB8U9vYWZrk9dlEak8dFL3P2vfoX
	lUONErL+6/e4A0fMF/kDmLMPfK6HVUcuiJ1Kt2HBePaJwBPLuVYUhqdksVu5EywIjoY5RmM
	GyOoSpdBMe8Xk4J/fKuc06tPfk0ZVFXG4dNKAXPsA0tdz2oP0flDClWl/jy9JmUrjODsXx/
	RQzj47j+lM38lO+N+The9ylw/Fauh+JgqEo1MwXPdB1VvOOV9/MF1AD2ntb7TRNqMjNa0q+
	fKSb7auisSQVefApzIOxaAOCHEjdlVr9KRVX7F2mLQte8XZC52VpqI9AldEGVw6Z0hn5Swg
	3bEOb1gWTyUSsLxHdIDr6udW3UoF0RXz51ks/F2oEyUPVgvKZFeE8oLb+BEwIlUrid3hKpA
	6S186ThVSZeJQnyVbStSN2D1FdGtjvWV+N9Dd5AvylOo+I7JfC74XjLdbVUWy8CcTKXIlj4
	r6dHVSDGqgVhBzK6rJ6gF9L1p84LK57KLZ9mcSHu3aNhswKGrkiPX+fKtfZHioJo6j6fHev
	pOS7tb5Vh53xdTBOAUGhv8P0MGhME4ftHPG7EZG3Xp8Q3A8hQZlZH56VrM7Uvw3xcz2oRB6
	Bwr/uWrJ/6FAY90mXOmvwCdmOfeGKpMnZ444bF3LHac3bp6vptAoNA0axcksRAqhi9jPHTg
	2j8fiYFqkwYhcODXspXrhytOxT+MldPO7I5IrmYGKHopeAmK2eLfjTj3i4R40Ljz186NaWR
	g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

VLC with VA-API frame threading can require more than the default vb2
limit of 32 CAPTURE buffers.

Raise the HFI gen2 decoder CAPTURE queue limit to 64 buffers.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..8c96b007b391 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -140,6 +140,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
+	if (inst->domain == DECODER &&
+	    inst->core->iris_firmware_data == &iris_hfi_gen2_data)
+		dst_vq->max_num_buffers = DEFAULT_MAX_HOST_BUF_COUNT;
 	dst_vq->dev = inst->core->dev;
 	dst_vq->lock = &inst->ctx_q_lock;
 

-- 
2.56.0


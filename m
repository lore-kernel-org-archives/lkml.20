Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305259;
	b=n3nuqKLlcaDIpddQKOKAwShy9cnC/tFLVq0vI58EfVbUEKc8gvgqZ9Tnr5El+MnhA9Pc
	 GsDiHX7vyGFK59RXY/YQ+Xb8roDbILRo7Cv4hVPhJYIn8cZI3AP6LFwyQ0JAD+Iq9BBhe
	 4fq0UV21QatywC5Rp5ecd8U2mnSWVXzQpn85v4dPrF8FuZoT5uIPgz5v9TZKqW8W78ws4
	 RhyF5n38MnoCSF7wb6Jd4+69SASDiM7sAp4Ovsmqix3iGL7vmvNYbV/Bn/CmYjxbNlwzh
	 Od23Czfgvu6KjAJT1OTPdThR1yq6lVJn/eRCciPRcvERnZbTntBbQkqYsbWJybCfMVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305259;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ao8K5/T+J6vVSApsC1JJR7GkMSRx6aXdz7Pw677rMw=;
	b=Yf3CpW8M9rmtuuJ87Pu9b6zz6zU7IBUS1TYI3QtuCY5JQtCuV65DzPv5qOyk0FcaJuiq
	 LFUts+15+dBWz2KNd9B0OUc69P5gkmryRG6Qdi8cx2Sze85pqh8bIT8N/F9pbcTlaQmyf
	 WIV+mNP5l+QLZWvm1WmekXDsVhwkj8v00iHlH/FI6RSefnt8ZWsUpXQ10blV4aEJSQ85P
	 7praXX8sJ8I0sHeL4nwRIZ2KWdi13XIj8rF7/srFiZ8kOA00t1vdNd6nTbBsVHfRh0ESH
	 DC1noBYYzv7WaGNpsSAoOibAPRmdTieu5AZDY4XO2yYG/rlLtJrF9B4rIL0lpru0S4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID3QL+vT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD860A3812;
	Tue, 10 Nov 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID3QL+vT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305259;
	b=nbFrGAzNIBjeVeSPVz3uHN2LwgdW03Gefs8ryJl9AgLkVi1hKVHbdraWHvNKCa7LfSRs
	 zYVMlc3NOMepxYiwN5XewBEUI130Ps3sz6CKfMTVCBYfOWbo1IzcoeNLuxiKvoFBEQsiT
	 bTbXOfg/AtC509rBuxHuYi2VS9RnDt1KPbp/jUvhtdEtc+7Xme+v4Og+NU46MZ7EOkd3R
	 E6X4NCBXf1lcguuB9djl9fgFTRfzHtVRhzVN7YFFEbzazYd9j6Fb2aO41Wa+6/fBlBKic
	 6SEOTA3ICKHSo57pr4I5mnVs5x3Cpz4fUtwua8WnI2sjOrUscQHCerL5Jk/g6DQzK6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305259;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ao8K5/T+J6vVSApsC1JJR7GkMSRx6aXdz7Pw677rMw=;
	b=NLtx6ZNf3ILbvCTwQ6nOVhVaDBHutqp7w2W5DoOUorwjulWCqCD2FdAAV0QqdYBHsXQZ
	 Q5UViAqaXRAGRxJ3uEeHmIW2Z6FGmYa3MAtr8T4onjTpStAXDTVzTDDQKtbJrM10fQo7K
	 0alz/IjC5UTnZUui+oxrjdrt0F7tw/FmWm048Qt53GbA556/xP4sTcOU4dGJvNP/U/lZg
	 mwvzbYQkq0rJYAS1eROn62y3gpWaeClx8++ipUH0u2Y08jSWNN4wNeF4InBx8VJROKbpD
	 Jf5OnE0KbLGv/SBlKHG6v+eHyIiPdRblJxqjsTYRUXHk7ZZ11yWXXT6Km39L3uV4aBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC1281F0089F;
	Tue, 10 Nov 2026 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305259;
	bh=9ao8K5/T+J6vVSApsC1JJR7GkMSRx6aXdz7Pw677rMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ID3QL+vT2QOTai2kmbPTwOQqMzZ8HMbLSKErlahBFB/WBD1Lra7dJZv05vfyPYd4N
	 HqVrHBAIkC3zeGGEjIihD+fWzk+PuYKKg9B4shnGkSpPgRtAe3hMc6BG/ahqJzkt08
	 lU4aMMeKrCSpQspm6bQ0RStRUl/UBpekqafWXAmKJD3ygZudMbhrkVn4eZZS2mTeMY
	 lv6IRTH5vZdk3ZjfiMokiBuU6r7seccc01/0fF0uOQJt3KTjAjGunEDdq5V593McTo
	 wv1t90Q07VX0T2XTIdaEcsMfh2U+x6ySGCbycMCA6c+v8QqA6VO1L9n3qz7SG1S8qQ
	 rEH1OZbZDYqzg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FCAD48ABE;
	Tue, 10 Nov 2026 10:07:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:07:38 +0000
Subject: [PATCH RFC 08/10] media: v4l2-hevc-enc: Add QP limits for the I
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
Message-Id: <20261110-hevc-encode-uapi-v1-8-38ae9fcfedd4@gmail.com>
References: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
In-Reply-To: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305251; l=3795;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=AE4kglGiR5u7/pgWxx7FMl4jnb/lWjlmJsY7hLn1kAM=;
 b=VLX/BGi7saL9KOTcpT5V6O7pX9fdNr0GoOZRt7wCU3xHbiW6aYEvcFaHsQnXZgxO4sMrgIMEw
 C/ZhaQo7CJTDHRp7AmwMKg+LeiLa/C0reqCPgbF6AfMAv81KEzRQ92m
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The frame rate control of the core limits all pictures to the range of
V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP and V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP. The
I pictures, coded several QP steps below the P pictures, then reach very
low QP values at high bitrates, where they cost many bits for little
quality.

Take the limits of the I pictures from V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP
and V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP when the driver has them, with
a frame rate control. Without these controls, nothing changes.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-hevc-enc.c | 24 +++++++++++++++++++++---
 include/media/v4l2-hevc-enc.h           |  7 +++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-hevc-enc.c b/drivers/media/v4l2-core/v4l2-hevc-enc.c
index a167c4af6288..2e0ba832b868 100644
--- a/drivers/media/v4l2-core/v4l2-hevc-enc.c
+++ b/drivers/media/v4l2-core/v4l2-hevc-enc.c
@@ -645,6 +645,12 @@ static void prepare_rc(struct v4l2_hevc_enc *enc,
 	state->qp_min = enc_ctrl_val(enc, V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
 				     -qp_bd_offset);
 	state->qp_max = enc_ctrl_val(enc, V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP, 51);
+	state->qp_min_i = enc_ctrl_val(enc,
+				       V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP,
+				       state->qp_min);
+	state->qp_max_i = enc_ctrl_val(enc,
+				       V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP,
+				       state->qp_max);
 	state->qp_i = enc_ctrl_val(enc, V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP, 30);
 	state->qp_p = enc_ctrl_val(enc, V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
 				   state->qp_i);
@@ -1072,10 +1078,23 @@ static bool rc_core_cbr(const struct v4l2_hevc_enc *enc,
 	       !(enc->rc_ops && enc->rc_ops->estimate);
 }
 
+/* QP limits of the picture: the I picture ones with a frame rate control */
+static int rc_clamp_qp(const struct v4l2_hevc_enc_state *state, int qp)
+{
+	int qp_bd_offset = 6 * state->sps.bit_depth_luma_minus8;
+
+	if (state->frame_rc_enable &&
+	    state->encode.slice_type == V4L2_HEVC_SLICE_TYPE_I)
+		qp = clamp(qp, state->qp_min_i, state->qp_max_i);
+	else
+		qp = clamp(qp, state->qp_min, state->qp_max);
+
+	return clamp(qp, -qp_bd_offset, 51);
+}
+
 static int rc_step(struct v4l2_hevc_enc *enc)
 {
 	struct v4l2_hevc_enc_state *state = &enc->state_active;
-	int qp_bd_offset = 6 * state->sps.bit_depth_luma_minus8;
 	u8 slice_type = state->encode.slice_type;
 	unsigned int range;
 	int qp, ret;
@@ -1114,8 +1133,7 @@ static int rc_step(struct v4l2_hevc_enc *enc)
 			return ret;
 	}
 
-	qp = clamp(qp, state->qp_min, state->qp_max);
-	enc->qp = clamp(qp, -qp_bd_offset, 51);
+	enc->qp = rc_clamp_qp(state, qp);
 
 	return 0;
 }
diff --git a/include/media/v4l2-hevc-enc.h b/include/media/v4l2-hevc-enc.h
index 3db131370c56..f1d3da3269f1 100644
--- a/include/media/v4l2-hevc-enc.h
+++ b/include/media/v4l2-hevc-enc.h
@@ -128,6 +128,11 @@ struct v4l2_hevc_enc_ref {
  * @frame_rc_enable: V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE
  * @qp_min: V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP
  * @qp_max: V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP
+ * @qp_min_i: V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP, @qp_min if the driver
+ *	      has no such control. Limits the I pictures with a frame rate
+ *	      control instead of @qp_min.
+ * @qp_max_i: V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP, @qp_max if the driver
+ *	      has no such control
  * @qp_i: V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP
  * @qp_p: V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP
  * @qp_b: V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP
@@ -153,6 +158,8 @@ struct v4l2_hevc_enc_state {
 	bool frame_rc_enable;
 	int qp_min;
 	int qp_max;
+	int qp_min_i;
+	int qp_max_i;
 	int qp_i;
 	int qp_p;
 	int qp_b;

-- 
2.55.0



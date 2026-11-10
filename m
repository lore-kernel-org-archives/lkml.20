Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305120;
	b=shO9SiIr82Ba5QFl+ghxpulgDyv+C0/zUlLj/FZMWOjIwFQeJV/WAIP66Ub0T4AquOw4
	 mS9C4ogdHffKH7k1khYccl30WCZu+hZDTfGUZ5EObP8aUBh9yarY51Wg0H/C5WlI4YuTf
	 m72BzPUiti41FC0HA1Hjhq4nK9whdUW5BlQnps0wRxk5AAu8jyx7Bqb8gYyR+AMgL49Vz
	 1UngABwtC6nCcdVcRJPi2Tp72TBVHvgQ4fVQSVjcXB5esvHhnWqOxKmeMzg0xrljntE/C
	 Pda5asiCG7w54JQjIdH0Msm7z9FQ21q2CbSTHV8E03vGFSZgrpNAu13wa3TCCBnIOgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305120;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BskGLoGruitQ8HSqA3ofT1EWKTDohCTdgmt5lMCT1dw=;
	b=SGdgk3XRPGNEwf6pcg+cFRXwfEpPsLZU7P6Aa4+Ze/e4xJPNFmzZqNmk+ldk+qB3r908
	 RaYZ6WtoUF3tnwwN/E845mXmvrK1psyuSjShq1+s1R9VT1XM0D/SSaJadjknBA4pbJAlQ
	 qiYp7cqg19eSJBSwEk/yuBJpYXDdDoYE5jgLBvOmWEdJULZR1no8BlWlG8/ganmU7GKcv
	 1GcGnT0F5GVUqIc5zfBycXzDQlKnwaquF5CpZv8UaCveiCDIQKOJExuEl2fkYH0hQ8RbU
	 vqgv/aMEf3yoU/pZx3gMCww6vinLuucAOhuPYy4ip5d26fBh5Pt44bIPopeEWil52MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KY5Ei4pi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8A606A337;
	Tue, 10 Nov 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KY5Ei4pi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305120;
	b=tp3yxMpl88hy5I9Wr1l3+Vi5sWCZxrNHTeX4snbSMIeGs8eL8NCAAfturmZf90BgyCRV
	 kRQsXlUGpEgD6055DgGI1oAU6OHvbMz9tdBIjtKsx/1wy4razJQKIuFbCry6GsUjpUgJE
	 F5kOy6wJxW2KdJMBVTMK0BiF+/Cw7N4poJttzHa2opibvwhs/v8wY9P4ZqyuaPjazVjzG
	 DTYC0gFyMayCSmjip29bEkjLj7LI74fpuzooCyaBPFdIyDHQgb595Ujc2+XIKh+aXybd6
	 s4ONEhMjpDk9eppquPeKx5FuYlTZGg4crny6FHV4ZHOHSShSUdiWI1vYy/bW+/opjbA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305120;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BskGLoGruitQ8HSqA3ofT1EWKTDohCTdgmt5lMCT1dw=;
	b=HkS4NvmvO08QAfdjMM4gcKECrixyP1TdpqdYD6yRSnVqIyGDfjR0ZCUv6yVRqt7yBLZs
	 cA5PkrfMnkTgU21amXRxyZudmosvkJy+I+lk+9KQZ709MjMlx5rjvt8TVRcrYTPcuWqeZ
	 046TF2iPl+1SJYRROK4L8+nE5mm+4BpiEPtsCYTGTNi8J36/beTOUYwd2nFO1K5+GiEYo
	 iOcB/cq8yE77DbsIqO0i25Nn+Vaw+Fmt9bRRD73+0aCh2wJmFa8HPfKz79edTdbkJ8pwG
	 i6RdnWYqIiJ4U805JKEXObCWt08XM4PWPn0gbzjWl55ErjNBcQnMZWwFX1QbPg06dMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21B831F008A2;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305120;
	bh=BskGLoGruitQ8HSqA3ofT1EWKTDohCTdgmt5lMCT1dw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KY5Ei4pixvY7V9PCgdqG/haXQVIXDpy3jolPyt9l7/iRcjfZlWCFaALp6Eq3j59YI
	 CNjlON5Hg2MQ5+3JITTTYd06924JLaoYDG1lEhZrbuAnHY4Uu6R5hSm/MSV+K5KfEk
	 NPpk7jCRuYBZLTpuTy6qnvHBGi0dBeVcn/qN82EHSpzvbEbyknLt4kCbKeeI4ORPfO
	 l6F0LHntGyVn8wSx5Bm0KnzXj1LVU1af9dSe2kKy52+SG/38oZsj7Tf6ZR/2Y2Jz0m
	 YKdg8W7moaK6Xl5qH0e3+va5KxjzUOU7SON0pL7pKTdQ1dY0oYITBMfpUHmXBEKx+4
	 92Wt7uKhfeAEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A347248A82;
	Tue, 10 Nov 2026 10:05:17 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:16 +0000
Subject: [PATCH RFC 02/11] media: h264: Support picture order count type 2
 in stateless encode
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
Message-Id: <20261110-h264-encode-fixes-v1-2-7a64486df499@gmail.com>
References: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
In-Reply-To: <20261110-h264-encode-fixes-v1-0-7a64486df499@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=5092;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=PCwKK6nMmQCe8KJ/MFG/ebErqC3wgGPpYaNKYiqCq2Y=;
 b=+DTLMzGqQ3mfZO8FkeJLj6mTAKM+p9Ms1EHrowHNkQK95kdabC/Jr6ourZ1eWabG9iHt9UHqa
 fFCw8AlTbfYBcJv3re77MGPpYwY97BTGDFWRSUTkxrZMRCR8vIBQnwf
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Some encoders write the slice header in hardware and can't put a
pic_order_cnt_lsb in it: the Hantro H1 and Rockchip VEPU1/VEPU2 encoders
only produce slice headers for pic_order_cnt_type 2, where the picture
order count is derived from frame_num.

Accept pic_order_cnt_type 2, which drivers can then select in their
state_constrain operation, and compute the picture order count as
specified in ITU-T H.264 section 8.2.1.3. This needs the frame_num and
FrameNumOffset of the previous picture in decoding order, which are now
tracked for every picture, reference or not.

Type 2 implies that the output order is the decoding order, which is
always the case without B frames. Type 1 is still rejected.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c |  3 +-
 drivers/media/v4l2-core/v4l2-h264-enc.c      | 51 +++++++++++++++++++++++++---
 include/media/v4l2-h264-enc.h                |  3 ++
 3 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
index a165f8114ce9..2d751855195b 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
@@ -758,7 +758,8 @@ int v4l2_h264_enc_rbsp_sps(struct v4l2_h264_enc_rbsp *rbsp,
 			if (ret)
 				return ret;
 		}
-	} else {
+	} else if (sps->pic_order_cnt_type != 2) {
+		/* Type 2 has no further syntax elements. */
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index af925b6626cf..9745c0e85ee5 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -200,10 +200,11 @@ static int state_prepare_params(struct v4l2_h264_enc *enc)
 	sps->pic_height_in_map_units_minus1 = state->height_mbs - 1;
 
 	/*
-	 * Only pic_order_cnt_type = 0 is currently supported.
-	 * Error out since no pic_order_cnt_lsb was provided.
+	 * Only pic_order_cnt_type 0 and 2 are currently supported. Type 2
+	 * derives the picture order count from frame_num, for hardware that
+	 * can't write pic_order_cnt_lsb in the slice header.
 	 */
-	if (sps->pic_order_cnt_type)
+	if (sps->pic_order_cnt_type == 1)
 		return -EINVAL;
 
 	/* SPS Video */
@@ -933,6 +934,41 @@ static int ref_step_buffers(struct v4l2_h264_enc *enc)
 	return 0;
 }
 
+/* Picture order count type 2, see ITU-T H.264 section 8.2.1.3. */
+static int ref_step_poc_type2(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_h264_enc_ref *ref = &enc->ref;
+	unsigned int max_frame_num = BIT(sps->log2_max_frame_num_minus4 + 4);
+	unsigned int frame_num_offset;
+	unsigned int pic_order_cnt;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+		frame_num_offset = 0;
+	else if (ref->prev_frame_num > encode->frame_num)
+		frame_num_offset = ref->prev_frame_num_offset + max_frame_num;
+	else
+		frame_num_offset = ref->prev_frame_num_offset;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC)
+		pic_order_cnt = 0;
+	else if (!encode->nal_ref_idc)
+		pic_order_cnt = 2 * (frame_num_offset + encode->frame_num) - 1;
+	else
+		pic_order_cnt = 2 * (frame_num_offset + encode->frame_num);
+
+	ref->frame_num_offset = frame_num_offset;
+	ref->pic_order_cnt_msb = 0;
+	ref->pic_order_cnt_lsb = 0;
+	ref->top_field_order_cnt = pic_order_cnt;
+	ref->bottom_field_order_cnt = pic_order_cnt;
+	ref->pic_order_cnt = pic_order_cnt;
+
+	return 0;
+}
+
 static int ref_step_poc(struct v4l2_h264_enc *enc)
 {
 	struct v4l2_h264_enc_state *state = &enc->state_active;
@@ -949,7 +985,10 @@ static int ref_step_poc(struct v4l2_h264_enc *enc)
 	unsigned int top_field_order_cnt;
 	unsigned int bottom_field_order_cnt;
 
-	/* Only pic_order_cnt_type = 0 is currently supported. */
+	if (sps->pic_order_cnt_type == 2)
+		return ref_step_poc_type2(enc);
+
+	/* Only pic_order_cnt_type 0 and 2 are currently supported. */
 	if (sps->pic_order_cnt_type)
 		return -EINVAL;
 
@@ -1174,6 +1213,10 @@ static int ref_complete(struct v4l2_h264_enc *enc,
 	unsigned int index;
 	int ret;
 
+	/* Keep the frame number of the previous picture for POC type 2. */
+	ref->prev_frame_num = encode->frame_num;
+	ref->prev_frame_num_offset = ref->frame_num_offset;
+
 	if (!encode->nal_ref_idc)
 		return 0;
 
diff --git a/include/media/v4l2-h264-enc.h b/include/media/v4l2-h264-enc.h
index 6debdc95232c..ff7166109551 100644
--- a/include/media/v4l2-h264-enc.h
+++ b/include/media/v4l2-h264-enc.h
@@ -54,6 +54,9 @@ struct v4l2_h264_enc_ref {
 
 	struct v4l2_h264_reflist_builder builder;
 
+	unsigned int prev_frame_num;
+	unsigned int prev_frame_num_offset;
+	unsigned int frame_num_offset;
 	unsigned int prev_pic_order_cnt_msb;
 	unsigned int prev_pic_order_cnt_lsb;
 	unsigned int pic_order_cnt_msb;

-- 
2.55.0



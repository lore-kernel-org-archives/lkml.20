Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305259;
	b=zJ4Xvj8huvMikLZ0jqfsIgXfXbBNuN3K0VmBFr9qbDrCoPFh3kmgjyc7mE2PQpm7H2aW
	 z7xiLT4UCrxWaANt3a3yUmqFWIxN6eeGpO2oV/FI7hTU397IHR/6SDiGT/jjmbxTc7mVv
	 pny/9JC8pa8W0SrF5VKvqQm5SRfyjv4sy67MqwAv3VWcqWPG0wXtYuYMN74QiqSOYDcb7
	 aKggC1Pb6c7Emfe356ghNx4MJlwVw0tVpxRVJMvbjyM7nkkBn1yD77mZALWa2DITroGXr
	 J/VL7UkEW/DPDubiq3kiVzsqcR4Kuq0rYC4Gy2h2N39PHXoO8drHNYxh5pqwzSmlzMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305259;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dJ5SwTX6kMq4QS/dCi1lNi2sh2+0vyNohp9x9or1oWc=;
	b=qa5yAkSU4VQxJ0YdSkedXdQVviT54+/fSQ88MXMcgyVji9uiSmnURwZ/yRnNlRIfGfF6
	 JCThrYY9Q6wHpv9cRsFhizkHu2MIL13lCwDLEdW9E9dXBQnGjkAUcdYefKPFCkEFDAKyK
	 1SxmMUHk4cJKlw+6uHNyBc3IX6EyHrTHJ6j3k1kExP1BiW5lVFTAuwVmi3wSRHptRFpBZ
	 xDdQvfyHP+rhe5Q5tjyfks2J6KE8djU4u1ty6dv/v2llaTpcfbhnR8I6JzjFicCUDJmab
	 wK+YiiJFElTVStUbVBPKQFg0TCKB72XqTxvhAo6oLu8eEsplDiAFBFbtyJVafYlUZ3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aup5jWYF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5B60A3811;
	Tue, 10 Nov 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aup5jWYF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305259;
	b=KQ79lXblUAHddQx4gNEFLqZ7L5kIXX65BdiHmOxT4YF6V+oR9/VuwjQfEz6OIJLCGVYv
	 4Q3qUbPwqoRqLD51ya6bH+hHhQD4TH0sCZjjxxDNXAM8k31QeRouZOAQa4r6iPil2bu3E
	 AF2GkgymsazrpmkqDqnmLIJX7qGmToDYRIYXdOrRBsv7QQ1Aqf7LqP7Xbkn45QRa/qo4K
	 LEaCoR4E1sDNYZ6Dg/9kkdws6tEz6HJvreSjkWSMxl05prt7T90n5gAIVEb2gztlQR3+j
	 oRJKQz1BojfJDCnMWHpqG/iomQEh4ASdOcod0en+5xZenEla2TMqzgMbW5gqxyGzefg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305259;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dJ5SwTX6kMq4QS/dCi1lNi2sh2+0vyNohp9x9or1oWc=;
	b=KzhQEyLBXzCT3J9LQ6Q3ZFBZpoqkj1z8jdwumxfPDzqmBYmEvXchy4FWp00iIpJueOFP
	 gm6WcwTKO38xGL7bFbw+/agcArsJpcGkRlEmpBqnSoETY04HtDgFeALqgYh6fsB8V52Rq
	 EVl77XBCIbJSaS0ZDd5coraIMXH3gqWtV9i2vs040es4gMgz6OfOv+rqM0KldmXjL334Y
	 GzOIcm4I9bQ2pxVVYZY/OJexESqqiBAhRbt0ptX4FALWHNtSGr5T92s1XIdDNvz+P2W4e
	 aX9bFZrCphvAt4Z0ZeJ/MUR/W8yTflDbL4y8E2qqBsK83EJbmXKPIV1icWWrTajKzWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D8001F00900;
	Tue, 10 Nov 2026 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305259;
	bh=dJ5SwTX6kMq4QS/dCi1lNi2sh2+0vyNohp9x9or1oWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aup5jWYFeMoEPkHZvXUCDsNsYk1ASIVxYV+QVR7Ed3tgh4aOuVO/SfDI6+8pq851Z
	 ZCKg0In8TQwBPhZSuU6jC21e+z1qpiJrz+u3KhVWqlxprKHBIpgW8X/nraRnCCPURv
	 NKSD4ev3V6gCuUAbFNgv1/7GxStvh6NfyWA1BKgyHw9N0e1oiJvBK5TzDs16KcnhhV
	 NsnZNtVBkb1B01HlRganZkkFVJuKo8gVQp1BDEjevlNFvyYXzXvEtJJfL8g8eso/SY
	 5JB5jcj/Zxs5LoJ/sOF8wmKltnKjxM1XOnDdITDBN7lSliHG0ei6DEkHU2RIV9skDd
	 ztfr9zQ/KByFQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 818A248AC2;
	Tue, 10 Nov 2026 10:07:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:07:39 +0000
Subject: [PATCH RFC 09/10] media: v4l2-hevc-enc: Re-encode oversized
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
Message-Id: <20261110-hevc-encode-uapi-v1-9-38ae9fcfedd4@gmail.com>
References: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
In-Reply-To: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305251; l=3645;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=BLpAo/ixfrwr4n6bp3710+JDuneOuRSPbETSTp9CIrU=;
 b=+xbqip82hxr2sijn1KFdJqn+hIKzMJ43VyBK2/bw+6Z1rl7XZP/9SJl56bCM+5EKcg8qStMfW
 fmINAf9Bl1CBG5PSNAVySLZ7SImXk5w03LxDG6zUMyiXJaPAii6PrjK
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A scene change in a P picture can make it many times larger than its size
target, and the peak bitrate around it can then exceed what a decoder
buffer of the stream takes. v4l2-enc-cbr can ask for a second pass of such
a picture at a higher QP (v4l2_enc_cbr_reencode()).

Provide v4l2_hevc_enc_reencode() in the HEVC encode core for drivers whose
hardware writes the slice header: called after the hardware finished a
picture and before v4l2_hevc_enc_complete(), it returns true with the new
QP in enc->qp when the constant bitrate mode wants the picture encoded
again. Hardware that takes the slice header from the core cannot use it:
that header holds the QP of the first pass.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-hevc-enc.c | 39 +++++++++++++++++++++++++++++++++
 include/media/v4l2-hevc-enc.h           |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-hevc-enc.c b/drivers/media/v4l2-core/v4l2-hevc-enc.c
index 2e0ba832b868..d49cee336558 100644
--- a/drivers/media/v4l2-core/v4l2-hevc-enc.c
+++ b/drivers/media/v4l2-core/v4l2-hevc-enc.c
@@ -1369,6 +1369,45 @@ static int ref_complete(struct v4l2_hevc_enc *enc, u64 timestamp)
 	return 0;
 }
 
+/**
+ * v4l2_hevc_enc_reencode() - decide on encoding the picture a second time
+ * @enc: the core context
+ * @bytesused: size of the encoded picture in bytes, with the headers the core
+ *	       wrote
+ *
+ * In the constant bitrate mode of the core, a picture far above its size
+ * target can be encoded again with a higher QP (see v4l2_enc_cbr_reencode()).
+ * Drivers that can run the hardware again for the same picture call it after
+ * the hardware finished it and before v4l2_hevc_enc_complete(). If it returns
+ * true, @enc->qp holds the new QP and the driver encodes the picture again,
+ * with the same size target and the same headers, writing the slice data
+ * from the same offset. Only for hardware that writes the slice header
+ * (V4L2_HEVC_ENC_FLAG_HW_SLICE_HEADER): the slice header of the core holds the
+ * QP of the first pass.
+ *
+ * Return: true if the picture is to be encoded again.
+ */
+bool v4l2_hevc_enc_reencode(struct v4l2_hevc_enc *enc, unsigned int bytesused)
+{
+	struct v4l2_hevc_enc_state *state = &enc->state_active;
+	bool intra = state->encode.slice_type == V4L2_HEVC_SLICE_TYPE_I;
+	int qp_max = intra ? state->qp_max_i : state->qp_max;
+
+	if (!(enc->flags & V4L2_HEVC_ENC_FLAG_HW_SLICE_HEADER) ||
+	    !rc_core_cbr(enc, state))
+		return false;
+
+	if (!v4l2_enc_cbr_reencode(&enc->cbr, (u64)bytesused * 8,
+				   &state->timeperframe, enc->qp,
+				   min(qp_max, 51)))
+		return false;
+
+	enc->qp = rc_clamp_qp(state, v4l2_enc_cbr_qp(&enc->cbr));
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(v4l2_hevc_enc_reencode);
+
 /**
  * v4l2_hevc_enc_complete() - complete the encode run of a picture
  * @enc: the core context
diff --git a/include/media/v4l2-hevc-enc.h b/include/media/v4l2-hevc-enc.h
index f1d3da3269f1..5be449e5ec03 100644
--- a/include/media/v4l2-hevc-enc.h
+++ b/include/media/v4l2-hevc-enc.h
@@ -285,6 +285,8 @@ int v4l2_hevc_enc_init(struct v4l2_hevc_enc *enc);
 void v4l2_hevc_enc_exit(struct v4l2_hevc_enc *enc);
 int v4l2_hevc_enc_step(struct v4l2_hevc_enc *enc,
 		       struct vb2_v4l2_buffer *buffer);
+bool v4l2_hevc_enc_reencode(struct v4l2_hevc_enc *enc,
+			    unsigned int bytesused);
 int v4l2_hevc_enc_complete(struct v4l2_hevc_enc *enc,
 			   struct vb2_v4l2_buffer *buffer,
 			   const struct v4l2_stateless_encode_stats *stats);

-- 
2.55.0



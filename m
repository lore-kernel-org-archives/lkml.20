Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305122;
	b=bgSk2WUfnivIwaky0wvfsp5qrMOvIvS+u62kdPT5qdPnutFtnjekI7sP5FJlXUZX/kTU
	 rfLeo9PLO5j0blAhLWs1YwrQFvcH8h0NSVYsT7yJJOG7qrMuJk6xCEXU7U5mxIjb/N3SI
	 1KQ2t7UffnEBpdu3YH89/xDY3k7CsWIj8xQcJeAUFrb6DHClD6mJh/XjxansyeHWdgOpr
	 FVLRtFUK3ShgGJwCkAIZOG0Tq8oqbQq7VdPRdN34lBNtrCM4c17JzC+Gnb5GBdxo+Fgf0
	 eNxXm2hNVaaNbkSTME6xR+BEwMNDzd2jSzYEBLTZ3OFJw0mGc1AmxqdwtneneIOAY+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305122;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T1VUELxi6nfL5TSUYWGoKprb5ZFV6NnO56oVDAgRyNc=;
	b=zFm+H5kukDDmhqmofvOZ+amAEu2US4Vzjo1CpLd5/+nj6jf+vBgPbISpNHrr8yQQj968
	 5nuQB1m9O7KgMIz4CLrCAChAnHvVaXsJRaz10eUc/0i1KqWYehfEixmRCgM3WVJrCfgCO
	 EZRV4hJEDRkXA2g1LukMDRAzFFmPTvabMDtMsg67jUbNdbwF0T4NNstwxzCP7TLMyrhwL
	 iFnL1uDZazgzqpZAEPHBbxkfib2ff6W3lLSdZZFtOhQt72+t92wdizOLzJ/STOLeSAE4E
	 CJZeeme3GMkVINTI7oWRtK21Z6X5jznIajtis+1N6AdMfoHD9hGDW1FH/7UiH1igTGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wp3mlFMo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E860A2619;
	Tue, 10 Nov 2026 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wp3mlFMo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305121;
	b=3qq5wS/Hjp0iGX/l2t/S8Z7Y0LbB6o4Uo6GyOZBr+29kR6SdWagVJLmirFPKwSYrIMTG
	 pQDZgBTENRSpvbtmNjhY/W1vTVn2hZO3/FyqO+1MVW4amP53agdMdNJq2LTkey11smCqp
	 lSzg2l238yF3lHmrv/ytB8BwngbDoGV7+qBIbFMP6PCd4Mn0O7JmFfojhwfO9PoMTWhVd
	 6smthVIelN/cruL1hiLV1KPfYa5l26u60M0eAi2gmRp5hmS/Al5Hi7XR4626Rh0BgUg7+
	 fl3HfqOwgEJc0HXTKxHYUlaOiW8cZ3SkGHQdyK7Trnq5dTTujcyTgioAg2QbIlV6bhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305121;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T1VUELxi6nfL5TSUYWGoKprb5ZFV6NnO56oVDAgRyNc=;
	b=c50vtZ6OlTJQ2VvGm42K+C+u16Ktac8+VMPP7u+q6V+9THZvZX7BCQe5qq8lqR+I496B
	 cbAgWsP/ACpvsfVD5xnbQ1F98zmmuPXeAHypWUczqfo4VQQdp9IFuh0Zy8Sba6MX/tnGQ
	 6BFpLdhFpq1cqbQpJfvUQKlg+dTUYQ9iHE+L9/j4YnhFoZuKKBFZ7bWNqfBilYP9dpvoJ
	 0cMB7AJdwMVls3at3KdS4JlEwsyx6KiSU/x8wo5nkkJq18XNsgRhmiyfkWxkLJK78P5Bn
	 8bOZTKfZTSy44b5ar2WiKzvYUaS9AgdLUDnzsLsf1y2aSz1o2mrETlNairEoprLgqww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF0491F008A3;
	Tue, 10 Nov 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305121;
	bh=T1VUELxi6nfL5TSUYWGoKprb5ZFV6NnO56oVDAgRyNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wp3mlFMohx5buEAbb2PgMbMPyE0UjyWpByWmcfFgg1RJYKkSB21DDX7413iQHPNAo
	 ZXjyvfq/t5nXdWQdv9wjVogpBnyXPPhVOb1Cam3YCW49fwya/FiEaYer8vJVS8n5jU
	 DNQw427Vb1311+Pn21Bn9N0BTA7gijl4ocbsvmYlbSKDkN2xqXeR4AVzdNKNu9nwKX
	 VK7FCP8+62rRxIXGbwjF7M0S9XjnZ4mrAjMyJTGVpfcKR4+J0Ba2zEqWmVgcffgnPi
	 f1JO/FqMGs/HGQ/OUx+JNy8LHQvwC4fvQvvATNF4X2x/Ikgc9cBGBKv82lJ5pcSYDh
	 2yqSkzGcCwPYw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FAD648A9E;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:23 +0000
Subject: [PATCH RFC 09/11] media: v4l2-core: Fix all-intra streams in the
 encode CBR rate control
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
Message-Id: <20261110-h264-encode-fixes-v1-9-7a64486df499@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=3510;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=4AxtZpl7Nbv4Ml13yIiwu9wZOqiZCqVqCpFtquYmJyE=;
 b=uFk+/TamCX5+o3B5iSk+diBBZiSNz+5SX07uPlFYtijwQYdYlbPP0qhQrZkkA1KSyaEjwGmwe
 i0A6hf0Yx/5BBElX5azqpqb+61yAw2q9yziQmAT/xmVtXsm/obJTDPu
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

All-intra streams (an IDR period of 1) have two problems in the constant
bitrate rate control:

- the QP state, which is the QP of the P pictures, is limited to the QP
  range, and the I pictures are coded the I QP delta below it, so they
  never reach the highest QP: at targets that need it the bitrate stays
  far above the target (2.3 times at 1080p30 and 1 Mbit/s with QP 49
  instead of 51);
- the start QP is estimated for an I picture of a GOP of two seconds,
  which gets about nine times the nominal size, so the first pictures of
  an all-intra stream come out several times their size until the state
  has climbed: the largest one second window of a 1080p30 stream at
  4 Mbit/s is 1.55 times the bitrate.

Shift the range of the state by the I QP delta in all-intra streams, and
when the second picture is an I picture again, set the state from the
size of the first one at its QP. In a host simulation against a model
encoder (sizes halving every 6 QP, 720p and 1080p, 256 kbit/s to
20 Mbit/s), the all-intra bitrate is then within 0.1% of the target
wherever QP 51 can reach it, and the largest one second window drops to
1.02-1.11 times the bitrate (was up to 1.88). Streams with P pictures are
not changed.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-enc-cbr.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-enc-cbr.c b/drivers/media/v4l2-core/v4l2-enc-cbr.c
index 28826e32c418..87db60469182 100644
--- a/drivers/media/v4l2-core/v4l2-enc-cbr.c
+++ b/drivers/media/v4l2-core/v4l2-enc-cbr.c
@@ -239,8 +239,22 @@ int v4l2_enc_cbr_begin(struct v4l2_enc_cbr *cbr, u32 bitrate,
 
 	if (intra) {
 		/* An I picture closes the GOP: its length is the IDR period. */
-		if (cbr->seen_i)
+		if (cbr->seen_i) {
+			/*
+			 * The second picture of an all-intra stream: the size
+			 * of the first one at its QP tells the QP of the
+			 * nominal size better than the start estimate, which
+			 * assumed a GOP with P pictures.
+			 */
+			if (!cbr->gop && !cbr->since_i)
+				cbr->qp_q8 = clamp_t(int, (cbr->qp_pic +
+						 cbr->qp_delta_intra) * 256 +
+						 6 * (cbr_log2_q8(cbr->i_bits) -
+						      cbr_log2_q8(nominal)),
+						 (qp_min + cbr->qp_delta_intra) * 256,
+						 (qp_max + cbr->qp_delta_intra) * 256);
 			cbr->gop = cbr->since_i + 1;
+		}
 		cbr->since_i = 0;
 		cbr->seen_i = true;
 	}
@@ -381,7 +395,7 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 	unsigned int fps = cbr_fps(timeperframe);
 	s64 limit = cbr->nominal * CBR_BUFFER_SECONDS * fps;
 	unsigned int ratio;
-	int err, step;
+	int err, step, shift;
 	s64 cap, add;
 
 	if (!cbr->bitrate || !cbr->target_bits)
@@ -452,7 +466,14 @@ void v4l2_enc_cbr_end(struct v4l2_enc_cbr *cbr, u64 bits,
 		cbr->qp_q8 += cbr->gop == 1 ? step : step / 4;
 	}
 
-	cbr->qp_q8 = clamp_t(int, cbr->qp_q8, qp_min * 256, qp_max * 256);
+	/*
+	 * The state is the QP of the P pictures. All-intra streams code their
+	 * pictures at the state less the I QP delta, so they need the QP range
+	 * shifted up by it to reach the highest QP.
+	 */
+	shift = cbr->gop == 1 ? cbr->qp_delta_intra : 0;
+	cbr->qp_q8 = clamp_t(int, cbr->qp_q8, (qp_min + shift) * 256,
+			     (qp_max + shift) * 256);
 
 	pr_debug("+ v4l2-enc-cbr: end");
 	pr_debug("  size: %llu bits, target: %llu bits, qp error: %d/256, qp: %d/256",

-- 
2.55.0



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305119;
	b=EusT0si5YV5jHljtT6By0F6rFyGBKH84pnN65FhPydsjSAxiThUNwt6ML0OwEHG17DKR
	 kijFd5+u4FL+SFBPvneERn/wG5L9BfWlVo+8hcpP5lUoH+WgjjofhIsvNRXP2kWtgJqXS
	 kOYLeobLl2aojplYh/jHAM6JM/Dgc5BNqVBm5hJgO8Rsciz27Z21j+laEiK/nqA9+wvsA
	 tJiw9Dtg+gOP1GYFRdAooBHpm8zO82BM2TUzOwA5vZqhaXxvClyQfpkhZh3QNuGLpIEVD
	 aNVD5vWSeE06Z/FbC0bQJ4wa01XD3PZQV0vvQBQaHP1G3ckj7pIkYRseDTb+0XnheTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305119;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nV7Jh55bQpNKk8GMoHlvji7tzP6eE8WWO9cr6pAKxOk=;
	b=rVAlUn6EXtC2AMkKvS7YDzHOWqExGYjjJ6lZG3rsUyCr/tp04gH7Qt/XdaFL80sOQCY5
	 CTFxDrmPr1Ksmf9pwxmNxPdSNYXFsBxHPCQAGBK3HFNSCHk6KfMfN84p7ODE//czKALN6
	 c4b8mx5UXEQs5P+NGgTZMioVHupyqN1iTL+monCevDw5PTppssyFn3l8uXdvqG6SlID5E
	 huv1mumuwMNEcrTcuOqp27BxLUjDGHyZcfzsEgp/xN6tooZAYKicJJE4pTkiH2oOaLyUs
	 vGLalsDgXu5HT4+iM5HbiLpDm+fkn4fpVVKVHMvR7Yn+XhnxREk6MrO4avQnoYdqaYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ml2jqr14;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282E606A32A;
	Tue, 10 Nov 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ml2jqr14
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305119;
	b=Tn7TuH8pcAO5EDpl4F24HwOxRcvIyosylS/K5B3VvlT736PffDjOuv4KaSilMoeziljo
	 TMjNAYk8sSMoCJ9bber/5m2RF8rnmkMOWHRWOZ82GZMGsaEyL43AX8hiSFE+ONFI5qlj9
	 zwH9MV9T7kLGqw77uoSqemhWQxGDJpxsDh2Sc8JjKGhcU9/J4T0uX4LuEuDLb5qcSpIte
	 6lAu3uGUYef4UD+vXB8fToRhir6fX14GZFXjmJTVTbLErFbh9KqQSOppbl+KP0PYUNLUk
	 CAoHlL3SgwGd1OJdy5COIxpjwet6YGgt+vXEQ6gQy03hTNtUatUqvPHNOjyeqdyEGJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305119;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nV7Jh55bQpNKk8GMoHlvji7tzP6eE8WWO9cr6pAKxOk=;
	b=CnSCMYE40F8yoOVf0E3NTiY3WwiIxOIuwQfqKdAlsH3CnOhu5Yp+LI3d283ipRoc8xnX
	 i1feM1hHVxzNRmEhe1Xeyw0LO/rQASlDnu6RwBm4pLqs6LL714ILy9sLgvYZ0flRv7eK7
	 8SLiLcTnPko0aYgvAxsbb3KaaHlkShUTTnPWK89A5o47yUa31J5pqs7nFHaJSqghFnkpA
	 YcuERhufvrXQNlh4DODZunY/V3img3BJ+fPYvghGQRo43Brt02My+lvaQxo4rfo1tQQRA
	 cAwN3oykxE6b45Z8q+KnEzsHJ1WQojpe2X8omjLC4XT4bg4AqYG2SxDp91dD9GYiDig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3259D1F008A3;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305119;
	bh=nV7Jh55bQpNKk8GMoHlvji7tzP6eE8WWO9cr6pAKxOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ml2jqr14eBJHHDUPYKyovFa9qbfkXfdSqqB53sJ/uZXcptYc9MSm2VKEPSgHiLAsQ
	 AHsz/UL/VdU07MuxGPL7Gf+eD1cUb3z1oYLyWMN3wkG/a4ammQbZOUsmqHKt2XqHU6
	 h8lzUvaiWGMFQLA5xGeIYvNiFn7oqaN4v/634cWFE2t6y/ccDLCRJ/dpXA200nUau3
	 VOKaxIGJKjFES/7VccMsGwlrHrNFHU1e+6TIaFpyAaemCldlOhkvpO8oPtwkZmWR8s
	 +QUBsxsagprloyfiKhmozqgbkIov7Q0aMe5wYWmS2fivI2ouxxLuF0KUblbwvyJ+i7
	 06h1LAHHV1R7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B5C2448A86;
	Tue, 10 Nov 2026 10:05:17 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:17 +0000
Subject: [PATCH RFC 03/11] media: h264: Write the stateless encode SPS and
 PPS with nal_ref_idc 3
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
Message-Id: <20261110-h264-encode-fixes-v1-3-7a64486df499@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=1645;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=zXcv0YCbY9QS6/mK5AO05SvWHKGBxnD43EKlSGfUjz8=;
 b=wd8cdQ/TIylNSiaZgPRwRMIhpf4DXaAbjvBJxq8z+MDCmZaixkRI/Ow+2oE2SktxbD/vBYG1x
 /RVUlF+nuTbBZqZK0AlmoLs4c2TIdO1zPaE5/T4DEIqlV2bdTqe4k6q
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The sequence and picture parameter set NAL units are written with
nal_ref_idc 0, which ITU-T H.264 section 7.4.1 forbids: "nal_ref_idc
shall not be equal to 0 for sequence parameter set or sequence parameter
set extension or subset sequence parameter set or picture parameter set
NAL units". FFmpeg's H.264 probe rejects such streams (an Annex B file
from the encoder is "detected only with low score of 1"), and stricter
decoders may drop the parameter sets.

Write them with nal_ref_idc 3, as other encoders do. Access unit
delimiters keep 0, which the specification requires for them.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
index 2d751855195b..fa5857b77d76 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc-rbsp.c
@@ -654,7 +654,7 @@ int v4l2_h264_enc_rbsp_sps(struct v4l2_h264_enc_rbsp *rbsp,
 	unsigned int i;
 	int ret;
 
-	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 0, V4L2_H264_NALU_TYPE_SPS);
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 3, V4L2_H264_NALU_TYPE_SPS);
 	if (ret)
 		return ret;
 
@@ -845,7 +845,7 @@ int v4l2_h264_enc_rbsp_pps(struct v4l2_h264_enc_rbsp *rbsp,
 	u8 pic_scaling_matrix_present_flag = 0;
 	int ret;
 
-	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 0, V4L2_H264_NALU_TYPE_PPS);
+	ret = v4l2_h264_enc_rbsp_nalu_begin(rbsp, 3, V4L2_H264_NALU_TYPE_PPS);
 	if (ret)
 		return ret;
 

-- 
2.55.0



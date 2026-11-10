Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305119;
	b=jA4d7nZwMr211szdsWLHybcygSpCyyfB1jpISlsGkDsggHRH3/kQehwy/2DyzvnTlNfb
	 YNYQXr+eR4N17FITT11ObwCy4PVA9wiMV7PM0IgHBnfp9bd9gSn5x1RlJoIc4L2ifxOoR
	 iZLh4uiRD1NtPRN1Ko6g/KAptNIGI8JKqm9fV4kx9GQAZr26oBcvJR9R70S2IrSSObpqq
	 RrkOdPr5um5SsHfrXQIbv29z+bVsoK9voH4MHRFm9ve5Gn4uajQp0ivJI0nvyJPFNqbKP
	 oC3kIFg3Z6YphMMJ3LdjSbtaQ6mmfpTYeEr+tSKnO836JbrBj3CdflZrfZdWnIJRkow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305119;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FNGeDCEm5xyU8JCn+b0Gltb7bO26fe8BQ81RKh2mYJc=;
	b=VtWWHmdsRE7BBEMbIqTYis4mO97rsOblpmYM/YVPMExl4hBZ5VAVs7Xn9YMRynPnVXRD
	 RUGVJ9xjKQFX8zuwuTGlfRqW1UQMtKTK5/pnqO+/B+cA9xyRWoke+6lXqT6wo0SF4hDaJ
	 2ocdu0Ud1URNuSfYhEwfzRzNhvldVIvQf5Zx4gYpBx9DiiQH2MHmB1RueolOpzCcE/Y0K
	 GfzbNH17loqSTOcL8iMlYmK2Dlu15BJPBVwShlfqVtCWnu11kP1HZemdxmJGfTYBGWB9q
	 1XjfTQjtZDfNZFpf4WpTenAw5wA2qo1AlwQkmFyPsNbmx0oKdlD2O6H6NRMLE0OLjNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfBag7iC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F286F606A31C;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZfBag7iC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305118;
	b=yt06jULMgj4oeNNuq2W5L2ud/T/gmEwnOD/xgMwuEdmiURbzloooTBCuPZhMH7pAr2wV
	 udvdzdKxdmg/OHWi1AENUdShJC3AhnKTTfN5WA1hXTHrQuHMfc3wHe00dvlacNui07M5y
	 rlaQoq/B5DXGSUPVdbK3xrAyLKPRU6zZaaEcXzr7X6sZnpd3e8ILz9A92Ucv7hzRkLanE
	 XlQlSSofr5Rm5Y4M5kJ1jDv4me3jAlIMoaBuPElX51xRtSv6/CXtuV+tSceIKedZ5M03H
	 L4mXU4igw/ioeJWuwpWOfSYnJHe2BXj94rWIA5vIQnaOu4BQjcYoY1LEO6Hws/qFKAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305118;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FNGeDCEm5xyU8JCn+b0Gltb7bO26fe8BQ81RKh2mYJc=;
	b=eRQ2/K3lUssREyWxDqRfT6R0PkEbBiwE6bHi1jwvmmYBA1BDyRf8tnIHLioCfEjcrT8b
	 yE7gysTLihjtMojnutCm06uQr9o4+PnYhqJ5Q7mvyLQwdxuy9ftBkrE/Dq1tNOMhsPJOW
	 gO1NntbGU/Q9+yY7ALzNZ77PnWnT3NnGy1kBz2S/+ARCMUL5slBkHDjetp3MkrwKuifY7
	 ifcfHLwnYYiHTB03LlTNt0743mwvaOROJS4h3u+lH0e39XkcLqgv5nvzVbNcvuMTTrrst
	 zeSEpzGUb5cR2HtKbFoQs9JWYPFRzNoNcknOVhDYxf1UhcBLVEjyxMjqNtsO7m6DoAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 188A51F008A1;
	Tue, 10 Nov 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305118;
	bh=FNGeDCEm5xyU8JCn+b0Gltb7bO26fe8BQ81RKh2mYJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZfBag7iCieZRdcY/D7Bhf+ft523FRHNjT3sM0Gle3xBaKuhMIxbHsvE89wMD1hqF3
	 1e22dtUcdCjpuUpVMalyxrGC8S1p4IU1ovr99MV+RMffbc557M7by6nnh3P75NIQm5
	 TgwtvFgFHgEiV4DUM9fM+QNXYDUH/L4QbxGU5nymUZb2lACD2LQol+v3Tn9zQPPZ8y
	 /87EiUJ6Zc5wWmW9ovl6k65RYOB071YyIsw1MrZT266VLTgngrVJImtfHug5NVeDGX
	 iP1kr3y2kO+v0oMR4hEYaGtj4IbQLNupoXUPoxIEnHfC6smIFr747c+baG0ACJc61I
	 gPdEx303OzM8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 916BA48A75;
	Tue, 10 Nov 2026 10:05:17 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:05:15 +0000
Subject: [PATCH RFC 01/11] media: h264: Only write the SPS and PPS of a
 stateless encode when they change
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
Message-Id: <20261110-h264-encode-fixes-v1-1-7a64486df499@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305116; l=2032;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Rto6Khl5v0MGxvUzll0pj/YSX45EUzCtavvbMJo4tew=;
 b=jjcaKoArzPuOamZoqU36/oXnjN5APV5b06YiPYwcMEvNtx9xtEj6NvctZvji6eR2zQVLoqdLz
 hr7Ex7e7BoJCeKmn4/x6Xnm/YfG+e1H8LWFm4KKMNFbFHX4/pfB1qP5
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The stateless encode core is meant to write the SPS and PPS for the first
picture of a stream, and then only when they change. The check is
inverted: the first picture compares the new SPS and PPS with the zeroed
active state, which always differs, and all the following pictures get
them unconditionally. This wastes some bits on every picture, and skews
the size statistics of the rate control.

Compare with the active state once a picture was encoded, and write them
unconditionally for the first picture. The
V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR control still forces them on
IDR pictures.

To be squashed into "media: h264: Add stateless encode core" from
https://patch.msgid.link/20260522101653.2565125-5-paulk@sys-base.io

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/v4l2-core/v4l2-h264-enc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
index 67ea82cebe7f..af925b6626cf 100644
--- a/drivers/media/v4l2-core/v4l2-h264-enc.c
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -762,9 +762,12 @@ static int rbsp_update(struct v4l2_h264_enc *enc)
 	if (ctrl && ctrl->cur.val)
 		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_AUD;
 
-	/* SPS */
+	/*
+	 * SPS: always written for the first picture of the stream, then only
+	 * when it changes.
+	 */
 
-	if (!enc->state_serial) {
+	if (enc->state_serial) {
 		if (memcmp(&state_active->sps, &state->sps,
 			   sizeof(state_active->sps)) ||
 		    memcmp(&state_active->sps_video, &state->sps_video,
@@ -774,9 +777,9 @@ static int rbsp_update(struct v4l2_h264_enc *enc)
 		enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_SPS;
 	}
 
-	/* PPS */
+	/* PPS: same as the SPS. */
 
-	if (!enc->state_serial) {
+	if (enc->state_serial) {
 		if (memcmp(&state_active->pps, &state->pps,
 			   sizeof(state_active->pps)))
 			enc->rbsp_update |= V4L2_H264_ENC_RBSP_UPDATE_PPS;

-- 
2.55.0



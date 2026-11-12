Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473698;
	b=gUSq8Y7rI256s8NIjtnVbSrlE80jw6B5GCvqUGroWSdPFFE4+leWsgYbMRCtm7KhYrx5
	 Tgv9XHVlDBpqDtvZKuiqJ/YJ82PIhXQJ6BMYGKOFZIqRHGkkK8upAl3NF/wM3ON8oqEkZ
	 +2O3uD4L0ywDZtMmw0BUUx3nAJt4SWWRfZDDwATp8yNQJ8yYy48M97a/liUofRYnrTdqp
	 zYFaJ43ji5JnfBiAxevQ7A/Xr4qMGB5UDZUema41K7gv8qcwVQmQwy0nB2pnysD6UL/tz
	 3xMidIjFrnuPThRkhBhDj+Tnb9XCM8hgRVe/1utM815AYUCf0gF6xFFJeLxzNgp/5tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473698;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=;
	b=MbnTDOI8igxMBLS8GJMKg/KIVok38wtuZLAbRgMnilcKscFHr8kW6OkjIwyZKdi6wMMv
	 GPkrJP9Rtf1AgCGAJBzxtcXllDjU+uKwiHtB71SD11qpWw1zWU/wkjI5H8uv6SlZDjCEs
	 yzC1lAYzuiktxkabtioPNmteU+rmXwUS5mn2Q0B3oJbCXtsJK9Fxb+VLWXzhgeShBPU9a
	 BtdB6CJcbEZ9Kfk23zIKgPPjjYHwnr7tdYij7Y625xaNZqPfCcrPGunJzE2evK7eHb3v1
	 8oK/CM+0rLJNVPznkFOJfAOTSZ1ai8iVmqWnnehibYA3y3oAhUXGt/sCa2ZaBS6tBjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDSfzTzj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D2606A886;
	Thu, 12 Nov 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDSfzTzj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794473697;
	b=z3/yb4ESfk5EPtIp4XaSvCiqod4jXUqYUVV926y8mcAR2myqXFtehxhBZk0Y9m2NlOFJ
	 ljV5f5mtT+/Et45C8/Qtjog5xCm7wqtItjw56z3KnjjP4QRnKovZtYxkdpRIVruDRIodC
	 z6AfxVkjZCgOpSsUVGU1BzzfhKpH9C9EQgmMDTBO7SNH9F9qxBzTDleS9h431zFDh+uee
	 2EBMfU7K83J3xPU17bl+Dz1f2UyI6XDj28EaDWX/KdkClkN8Eks98KIBQ9zXcj3qsv57g
	 mIxJlCkSVc8E7t8ZN2k2ZRGpNoIsIH/KP81v9vfO2HD5bggaOFnOamd1MUuSD/bOJ4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794473697;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=;
	b=V9W0OvOh4QEFjk9mx4kW+tPoxROwmwDjmf6obUqeGRMUFSJicbus6JRAY4zq6+ewzz8o
	 Ts9puIiwKaulAWunv6m4fn36Ny7pKwgfwPthryTDv6cLem+OIOFpoVghWbiF0kPIolY3Z
	 ajyNMaMTKJviMi7rc6TIL71XhqIM7tpM86SNaoGNMrmGuBtReGDKLxHeiaHjnLw69cQ+n
	 i+rp332/HWrZfCY0VnKQewDyJAZwI77quF7dzVYksx3stCIfa3pYztUBiLiAnLFnXrbua
	 WhHcVMSHkVEj8yHYLe1K4DLAOWwDLCWCH9WJOab4kTt9c5yUD31xIq1Cu9iR5TUOhgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 824351F00A0B;
	Thu, 12 Nov 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473697;
	bh=GSMh+74fPK0ymy278CPAuF9fN6B/X3Bftnl6WSY5S7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nDSfzTzju93g0o6Ob9x9rFDLSrkyy+MUjhO0nW9Gl4to+IKVMJL0VOA28m/4WVPrj
	 kCChHZ53WgShWQBetBB9ZLc27yJlKWRlqHwT8ON74NUxNXVuRt7UUEX/b1xvuug6W4
	 M5i0F1MgNB3SYL84jlK78W3Twp/ddr/axBdhpiL9FZVOA7PFEGZfQZOBLo4+4pA+4s
	 nQEYiVxxWNOU9cdehYATTWEQ8vvv7UIktOp8t+AmJimR/s5EgGB6Ce8FTw316rp2AU
	 9zlaaI2MHMc9xWjZu2BM9jNGPUhs2TL0Iv5onywNmkYCk7pQB6B6Oo4F6g9eSKcbet
	 OpdsBDOU5rmDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1254E4940F;
	Thu, 12 Nov 2026 08:54:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:54:57 +0000
Subject: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p on
 the Rockchip VDPU2
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
Message-Id: <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com>
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
In-Reply-To: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Jeffy Chen <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794473695; l=2123;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=EXI8QBEeHs1R1u0NRn+cDDndC1H6YMS5/uVvMAcEFAg=;
 b=byQz4GYiQ/6r0/WJ5LPGX55naEJ393h9T1l5gHuaK5OuRo6RtWYZrlSRhz6YOZrGDiFC/xWOf
 MshdVJCvzlEDYYPq9i3nJ18rnSX1E++DEDDC4aOJbvgshWW7NRDDiRS
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VDPU2 decoder format tables (RK3328, RK3568, RK3588 VPU121) and the
RK3399 one let the VP8 OUTPUT format go up to 3840x2160, but their only
CAPTURE format, NV12, stops at 1920x1088, and the CAPTURE size is
clamped to it. A 4K VP8 stream is therefore accepted on OUTPUT and then
decoded into a 1920x1088 buffer: on RK3588 GStreamer v4l2slvp8dec runs
into "gst_video_frame_map_id: assertion 'info->width <= meta->width'
failed" for every frame of a 3840x2160 stream and none of the frames
match FFmpeg.

Nothing above 1080p can be decoded with these tables, so don't
advertise it: limit VP8 to the 1920x1088 of the other codecs and of the
CAPTURE format. Userspace that checks VIDIOC_ENUM_FRAMESIZES, and the
S_FMT clamping, then know that a 4K VP8 stream needs another decoder.

Fixes: 73fb5bfa53e9 ("media: hantro: Support RK3399 VP8 decoding")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..2b6242c1fb86 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -274,10 +274,10 @@ static const struct hantro_fmt rockchip_vdpu2_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = FMT_MIN_HEIGHT,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -315,10 +315,10 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_FHD_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = FMT_MIN_HEIGHT,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_FHD_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295112;
	b=NE5j+iLF0HxnBm7JLqVXHmxAfcdr+/Tj+IIWu1K17FaLm/XrvBBRX5z9t1zC3+PGJFJc
	 K8JYuxTWTkcYjWonK+XSHfLVzQ7ls3eaStGpr5YqPHEFj3sDpJVNy0Nl+G0RkZzb/DXBY
	 bc4X/Mkomm65ysmDE54j27aqWmThmqs3jipnAf4YtYHpEfGU+Une7N9CxZaGHJQGjpryD
	 w5TF9fB9mXmKXyuXsb1BMkKnvPfj7qhsDdGCFJZZBVakWKi/xmHh54vuRnXbTnunHPVzD
	 SHYbTNoYWRWte8FldPimkd2Juijm0sukj3Br5P9kjpbtU8pVqsAcNHehJ0m3nDMUXBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295112;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=;
	b=pEc2k7KowHuWIzqIr3d7aifprUG8FnZKhCD2AgoMROtdVn0PKIl4alOLq9WgE2hmPU5j
	 Rll3eCdB5M0uDdSQdiIJPd6/1918Rf0eInn4L1ywI8GvoqbXSJOKTYj4gnXcad3GZTuEs
	 s6NnaetMmX40inOICCLivBM1ZQkCUpunHEZQIXrAIT0Zl5iNWsyfDP6RWjybwExLg066C
	 r0It9pBpYxS5eizZuRfF5jl2Bsi4LByH483m14k+sw5W5E4RuR3FZjt9PipWrPeO9rAMB
	 v8WAm6qfar4oxHxrGx5m2JY4jkNQEiltABKqKGbMYQbVXuWqSHRlFfl96oYcMaHkC0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPpiE2Rs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AC606D63D;
	Tue, 10 Nov 2026 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPpiE2Rs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295111;
	b=07KT4q7hzPYqJdNUmwk9vtfIdt0igMwv64+HqW0PpzBowC3zlzJiosOuj4rUQsRdwh+9
	 BARAp09oPtIMjB7ddbINC6GG/T69Q9N1ghMyyq21z51XVZ6AHh7vho4UYIcLF5PGOdx93
	 c01G99sQ4/Q2I8XmIFzNhhXP2OD5Hdkq2ueX1Wpiw18lxiiYnU0pUdSQzbOw4NuRy+UlB
	 dhE78Ha3ddmSbMkjPvzbALve48zHBHRrVlFtdjRg+n/B7PatuTf9DrJmJHUhNsE5cXBTE
	 rGXJpet+kkbfEP4TqkMZdPJYuIwXQH8wptmCOV+1UiexLLDRbxB5kz6rad+xcLYKa+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295111;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=;
	b=G7Nq5aXtd13jRn4DlvyzdHTplfi/yhuqoMEeazKRJeAvTr1pjDkJTLpi6E30v6Sv8DQY
	 NMOMMmOLG2p8KgwZK+gZMjwIEzm+J6G5P0ZVyL4aGM1Rr1QmZJhEMVkYW4HPK0d0Q+bAY
	 PRpePldys9UkqpTRe2KwTFpxgqJxHw1IKCJhZ8um45jlIQYUZj//8/rtjxeUZj4+1pHiX
	 oH5QT2gP5zLuEtPt9wuQhdd8HQ3yEEq5/wlh6mWsZhsTZih3FpwXf+iRvODYD0NcN8Lop
	 ptoQZ14PVhxFRk+AjxYE7+WoL0kPpbcwsTuD81g+Dr9oBX1erfeWKbAOXNe77G4lxFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1C431F0092F;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295111;
	bh=sBoi/8R1PIhDrxBflVR5FUUlorGvIuk3wspRa7/rYcs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fPpiE2RsO1F7NDmtp8rnEwodZTUR6Fq8pwaj5qr08KnPGvsUfK9EcwVZm/c2sPeoz
	 6Q+lN0LUuDDKO25whv2tMau+5SzeHHshrBpBZjMS0cqAvWQMe54pGFrpZVSW2fTLjH
	 FOiB08J7O4paMsuHEoTwdMgPKAZznl4HocIOnB/7ThxQSx9GtqTpxno/CeOUx/Lwdz
	 YWnk6woNXG+/aTVaD3MFyq2hvsWxaKiC2oFVxvyaC9uSnYwmHgHmjwRZ01SJ8+wTnh
	 OwbR+hJxrVIK931VvgeYWHKA0uuxVA1qdeFslyCGk8FdzLAjB105FCc+/5qJDjgYOA
	 ba6hyvpAGgcpg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5654F4896C;
	Tue, 10 Nov 2026 07:18:30 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] media: rkvdec: vdpu381: compress the co-located motion
 vectors
Date: Tue, 10 Nov 2026 07:18:29 +0000
Message-Id: <20261110-rkvdec-colmv-v1-0-012b84ea43f7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3aLsspTUZN3k/JzcMl0TU1MDU/PkJGNLcxMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA275TMHAAAAA=
X-Change-ID: 20261110-rkvdec-colmv-455057cb3974
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295110; l=2112;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ek8nnlo2Z+H0om9KAswdYQk2Ei8TtpDwU/E3AzwDn9U=;
 b=pkad0colCQyFDuzCw0zt4yr4BdNBS2eYZJAuJmgk0HrbZkevIZyWUDS8CWoRVfxzbA2JsOYug
 cNwLsCysTI7CYDnH5IzBQqrdjpAwbA1YLhJ0YweiGOOTs5w03K2Y0U/
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

The VDPU381 can store the co-located motion vectors of a frame
compressed (colmv_compress_en in register 12). The Rockchip MPP enables
it for H.264 streams without field pictures or MBAFF and always for
HEVC; mainline never does. B-frames are what limits H.264 decoding at
4K on one core, and the motion vector traffic is part of that.

Patch 1 enables it for H.264 and reserves the worst case of the
compressed layout, which can be larger than the uncompressed one (the
hardware wrote up to 556128 bytes compressed against 522240
uncompressed for the motion vectors of a 4K HEVC stream): a 4K CAPTURE
buffer gets 8.3 MB instead of 4.1 MB of motion vector space on VDPU381.
Patch 2 enables it for HEVC.

Tested on an Orange Pi 5 (RK3588S), GStreamer into fakevideosink,
240-frame clips: H.264 3840x2160 65.4 -> 68.4 fps, 1920x1080 214 -> 234
fps, HEVC 3840x2160 98.6-102.8 -> 104.6 fps. Every frame's checksum is
the same with compression off and on, the decoded frames are bit-exact
with FFmpeg's software decoders, and fluster is unchanged
(JCT-VC-HEVC_V1 146/147, JVT-AVC_V1 129/135, JVT-FR-EXT 65/69). The
bytes the hardware writes into the motion vector area were measured
with a poisoned buffer to size the compressed layout.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (2):
      media: rkvdec: vdpu381: Compress the co-located motion vectors of H.264
      media: rkvdec: vdpu381: Compress the co-located motion vectors of HEVC

 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 10 ++++++++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  3 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c        | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-rkvdec-colmv-455057cb3974

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



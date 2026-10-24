Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792863903;
	b=mdO96fhM1faArvMdjtt/uvMPYAvX4WWgOEKMstFV1Ry0cjiJkAHl7AHHD+d46mXxtC+4
	 EzpDRfpS3uO1Zc1OWQGxVRUYzdwQxwCKSsQ/Lsq/+5/Ijm6PY42tDvA+wHLzWvmSzWqnl
	 enk1fypVNe8RkyQEHAhGps1D1IQDgXZVHTuBh+3DHs7goHrGlp9yko1FMpLfMPztyglM7
	 jDXGIFfLTosPCxCkfGBHikQKKA5AzFzr39YLElg1E+HrRZ4K+dGYs7AmD7/WE6budvyS+
	 EdWa2kcWNgaz3nC3Akn4KFXN09bHcKBryix/T5kKsN2IhASIXcrb/zSmofhoWykvOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792863903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
	b=Ld1gCYomDxMwT0sR19bjPV/MepQ5ZTpZDYSjJsNOzt8nYJGvh9TnMxTTJqrCxrD1qyef
	 uWNUBohisAbgxGmkzscs49lYARbDNHnLaFabQb07Kn72ktb2PX5ArLTLLsUEi71HVM4OS
	 M+jrZmqxNfz70yCSPhLFONLOVlW6UkHL5D3XMxICjqV3rbdqkmrJFKS5rVqSM2btW86F6
	 Zm2UnpU8NshBHpGr8j1rc5lV5tJxsN1EWOxjB+8nQqBzajLRBx+hWR7QRqIERPvrgmdeq
	 0F8r+4MPUShqcXeV4aWEnuzBhIQEdlVSEUhtjoe90GwXC8OZa7kVqXb64eCJa0D9kgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U9KL1kyn;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE1606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U9KL1kyn
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1532818f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792863901; x=1793468701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=U9KL1kynmW4e9Kq9IiiNvGdF+51Gbk5+qvhsS4w4NciYSk8hrON1hl1eSeMWhlxgjN
         pJHRkV1N4GJXQQur+n8FXZctAO7+Dj1Vye1rez9Y+Ycum0mArRSLaVD3n4rUgNhR9ptg
         dxY7bl83dz4U+bPOs2ILmjuOUdPlB+BaKLFvDanLiLUO7xWT9mD/H9J+CUUevoGo6UiL
         vnMiw7BshVQdKn0A4qJ+iW7KDfB70MLXj+uLB6GVTHd3dHzfVBsZZTLTv0Lli9Fgi2fv
         6hBF/sURvxQ/bJKeTJ+YvGJ/uw03P0vqo9HnqSfziYQiEYAeAy5u88zgQ2kC2X2H7aKS
         W6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792863901; x=1793468701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=TpHtOzLVHfYJWy1xd/nTmYEg110qJKVw+esgh4dVTONHgQCQnl6XXegT9Cytyjftlr
         3PrzXoRJfeqGdjFEEHvmwfiRRNjRwVsBUwZ73FOtAJbgaSL3ansXDaig9sp2IigfcqTO
         AFO0I/N+IBGanmg5+5ZnuCbtynf7gR3+ZBy0OX/f5F4+UTgjf60rgvmPRXPXhrUJi3Ma
         SS3UN6VuqVxs19XYQK38MfQHyhzTy+CT2e77SP01xLmOO241EE6JYLRuWDR05hA4UI5d
         2U0xRHeMXVeQMCPedsKimlRb6UqoL8/ODTTkQl1kRxOQ1wxftiitgkAKOp37nmNPpHsU
         hSpw==
X-Forwarded-Encrypted: i=1; AKwUvBynkkZnV1S9f3rJxjrh0N8yuBQXWgo3v0d2ckYtFKZIlIKEoEdRET0lj9tdzBn3WGQAeapzb6+8ijWkXkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJovPetzpCjrUrdr2kZoj6fgIZPcynF9i15gxuPXAEzUEPjPvYP
	xC2UdmSfmeq+P8RaJdi63EfyPTrZl+kWx+U4d1obEm6Z/yc4zj5MnkCp
X-Gm-Gg: AYBFou3R/9CHFt/6rBWLvBburzDPoW7D8ZKiQFpLqodJr9tz5Z8qpWObqhiup08DE+L
	1xcfKwHbuL47DhVSPbr0mQPNU6ooxwNRg63sSelf1+2b0CocDmFdN4oSKG0k0Sl4hQzkevdEbMk
	TkXrB/XWxLH1SV54spySpmCaxXJ7NkZAjv40PGfLYIjLbxAiZNQswMYt6I8nj6LaY7zlM4qa9ju
	gW3s0NEAZnvKuz5Wy9WdnP65Ls+M11D0alSulvQPLZyV48uWViR2JMCrTsS+sqWx6T2fhCoyBJU
	WJ2z/vPBN3q0/MBAjU5B5esKXjkKmqlxlMm25fE66qY7UWDAgmTKqDiDwyndmheurW3Ex6Njoat
	eVZTx9qnErC2AJhffR8DK49uJ6a5T8S9aAegaPH4k9a2HGcKkK5rUbcv/7xTkV+/Dp4kxiHYG9o
	TVvePLxfDsYYS0OGQnQKmvSeJB6Kjnv6/fWJ0dG1mZzCTiYmLIGu7fFeJ1kf3Xm1Or4v7uqg6hs
	CIw1+fRZajkQ4NxwqNwTNHIdfL6/berxHgaoZfY13+O83IVhLX/NGPp2w+1hswTMVLNJkaUtHeK
	s7EzHbJYXkTFS9hzA03sbculG1I=
X-Received: by 2002:a05:6000:178d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e3eb262f0mr3872646f8f.7.1792863900975;
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
Received: from john-desktop.station ([93.107.83.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm5748244f8f.28.2026.10.24.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: reset the VLD before H.264 decoding
Date: Sat, 24 Oct 2026 18:44:36 +0100
Message-ID: <20261024174436.1835068-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H.264 decoder outputs wrong luma until the second IDR picture of a
stream. Chroma is correct. The top-left macroblocks of the first IDR
picture hold garbage that is different on each run. Intra prediction
spreads the error over the picture, and inter prediction carries it to
the following pictures.

vdec_1_start() resets the VDEC1 blocks with DOS_SW_RESET0 before it
powers on the VDEC memories with DOS_MEM_PD_VDEC. The VLD then starts
in an undefined state. The vendor driver resets the VLD, IQIDCT and MC
again in vh264_prot_init(), after the memories are on. This driver
does not.

Reset the VLD (DOS_SW_RESET0 bit 4) in codec_h264_start(). The VLD
reset alone fixes the corruption. The other resets that the vendor
driver does (IQIDCT, MC, DBLK, PIC_DC) make no difference.

On G12A, every decode session is affected. On GXBB, only the first
session after power-on is affected.

Fixes: d7647e7c90f5 ("media: meson: vdec: add H.264 decoding support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John O'Callaghan <johnocallaghan@gmail.com>
---
How this patch was made: the bug was found and the fix written with an
LLM coding assistant (Claude Code). I reviewed the fix and ran every
test below on my boards. checkpatch is clean; W=1 and sparse give no
new warnings.

Users see this bug in normal playback. On G12A, every H.264 video plays
with the wrong brightness until the second IDR picture: the first
8 seconds of my test clip, with a band 72 levels too bright on the left.

Tested with H.264 High profile clips (1080p and 720p, 600 frames, IDR
every 250 frames), GStreamer 1.26 (v4l2h264dec) and FFmpeg 7.1
(h264_v4l2m2m). Every decoded frame was compared by MD5 with the FFmpeg
software decoder.

Radxa Zero (S905Y2, G12A), Armbian kernels 6.18.45 and 7.3, staging
vdec with Armbian's patches:
- before: frames 0-249 wrong in every run (10 of 10)
- after:  all 600 frames bit-exact (32 of 32 runs)

Odroid C2 (S905, GXBB), Armbian kernel 6.18.44:
- before: frames 0-249 wrong in the first decode after power-on,
  later decodes bit-exact
- after:  bit-exact, including the first decode after power-on

Odroid C2, plain v7.3 (no out-of-tree vdec patches), GStreamer:
- before: frames 0-249 wrong in the first decode after power-on
- after:  bit-exact. Two GStreamer starts failed first with the known
  poll() start race, so the decoder had already run before this decode.
(v7.3 also drops the second-to-last frame at the end of the stream.
That is a separate bug and is not addressed here.)

The DOS_SW_RESET0 bits were tested one at a time: only bit 4 (VLD)
changes the result.

Not tested: GXL, GXLX, GXM, SM1, interlaced streams, 4K. On G12A the
tests ran on Armbian kernels; their vdec patches do not touch
codec_h264_start().

The same fix is in Armbian:
https://github.com/armbian/build/pull/11098

 drivers/staging/media/meson/vdec/codec_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index a6074de15..497fbada6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -182,6 +182,14 @@ static int codec_h264_start(struct amvdec_session *sess)
 	if (!h264->sei_vaddr)
 		return -ENOMEM;
 
+	/*
+	 * vdec_1_start() resets the VLD before the VDEC memories are powered
+	 * on. Reset it again, or the luma of the first pictures is corrupt.
+	 */
+	amvdec_write_dos(core, DOS_SW_RESET0, BIT(4));
+	amvdec_write_dos(core, DOS_SW_RESET0, 0);
+	amvdec_read_dos(core, DOS_SW_RESET0);
+
 	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
 
 	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
-- 
2.50.1


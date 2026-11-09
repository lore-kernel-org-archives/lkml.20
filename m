Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246667;
	b=QdrWT1AddGNIpRgA7EnwJbMYjWDFkBUMhLldIhuhxoJvsKM6UeWxUACODO2UP7ZjX46F
	 +TcP9jYaNYRs6G7+nCAOz3qYoXO4Bg/MVW0uuKYSrWDzp9+TUWm3PZf/Yw1Dc/2a4pxqp
	 T/e4i6OCmE7SeVIQC1TcArS67HMhb+yc2VslKR3bcjCl2vocThahA8bPzvMi6QBq6vWmM
	 ZjYwfFnv//Owayyjpv//ON1saRXXqYoa2tSoSrOacM/bxv7o0KDn/neamiOsS0gGI9MZM
	 Co4/aniFkscH7x6FLi7b8+REA9fesFNADMNaOUFZsw3RVKcOmMEi9XSaaiwq7aTs0mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
	b=1Dns4fXBBx6lo6iBn9hr8Mmn2R3qkTfvNJciuxMk3U8ah9hEXzJ5C/k6cdA/HUMVkcsT
	 cSLEeJTQCLtVg59hbZ0Esov6oST+91u3kAlv0lVdh1iiAZUmzJnwQjJXgaBYOwCgdQtA3
	 0U8DMqXxppNG1GBZgQxV6Qc9j3TfQaHF9ZNVOO4X8/41onFtYAWm4cDyXg4CAG9phAQav
	 gUMvbvsI8XHtUKWSHk/wHt8P0TV3oxIplo2wx0IK2440QQxAFK9dDUw4Pb0e84/r1MtFC
	 ZwHSNWUD2alf3zchySjohBlRWUVvCnOaEhAqHoUqfUlhm7iBWE73WwpGQNuDmw+kzkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoaoxZsx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0F606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A0F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HoaoxZsx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492690dd5daso829652f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246665; x=1794851465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=HoaoxZsxyVMYO7A9pJFtu/iYFEg+f72EGw9QLVjFJE1HpTzbWLkfVaZ3wfPTwBJOJv
         LaEed3CGew4U5eVFlkjAjVHOamdVyWk5GjA2Gfj5eS7f6R6NAtznYfDZjriR3oQLSlVq
         Fjnty9h3WOQhwPENUtwCnQEzVmflcTlIFbUjzotP6r6LNMRQQ56MbJEdFEZW8TvokG6l
         JEt8F/sl86ZDoxo1T2XeBNU6Mbgd5hAcsIGU/dpAp33L0y2wNchvHTIiHgVbm+NrFOpv
         Xau7kYeYxJOcELxYfQzRPUlm4kE43KXYNEvwKtOijWSxAdZfiOwp1hfw/vIVcts1S5Zb
         if1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246665; x=1794851465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2EBWm0WsMjUhoHR6YsRGN60RmHktL80iMChWst02Po=;
        b=NW9vJWQ9QueQ8gJVBxbt0sRXcqsyLJ4++FjH7p6KgcBGWwyAVkFygXYA2R6gIQSelD
         KujH3Suhfyp7ZraWetp0m5gye4tImnT2xhHGJFSR0P2W4KXEUIkYGpwJKzNH6wSS7bGO
         uAgaWkXIV1vrnkXpLPxDabiE116f5yBPx4nycnmyWJrB9mzHbd2V+ZWTN7cfDfunWJxn
         5cNNNbFJDyIB/WSpHYhozy1YhKoZEaonSepO0tsHd64vfNYuM4qJ19SrPkjhLO6SDdkl
         6PTwb5WP+XYDb6GRTW0ZehqlTOh9MSlU48gj7EnA1PiVmdyICmHUpogmzoeYG0+zPZvg
         m5Tw==
X-Forwarded-Encrypted: i=1; AL+hErHJwQg7Joraxk8V1n0pfuvcceOCJfytSshzTXzUlhvCH035GqWKoUnNz+WbrYzZtMpCVJXlmhZqcPsJ57g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F7iht53IeZbbjLBaBG5/rW6565TFS9GNpE3EDRsbz/UHa6pto
	ddicsAi37WGtebS7X6eyKHE5xYP86JZoAKS6akE9QlXNJ0tCchTr71D2
X-Gm-Gg: AYBFou1JCdgd1QQmvyBY79Pp95m+BTVIB3a0NcqAY40guhI1NOj2VvN6JkMTLGdieNC
	mn02u7f/U2iqXlXJPpfRo0Dq0/hTjdp9qnzzqDaGYq/OqXz0QgkJEBrL/Em4fKTsKArStYGbiwQ
	s2Nt/bIUljGNFqspkVIhaPsn5e9Q6ZzRmDSAEywIVh+6RXhBbPO5ssSFjZ3An1jUvCSKnpbE96l
	ko3Laki1MgZ4l0qz/F4/TTT97F0rq9Fc93DAH1Jh5RXNmLgt/89RIvjIee3E38CzxffbcBCf7iY
	OEmiRZqCzJrhbAdS9yblrnw3JQ2NQAH4xpGwRZ9/+vll8d7jsNoUWHfD62r6MY2Lm2EcaHT6bte
	ZNW2WH6B1jhxKVi3gfwFvzJ2pmWMbVRUMaqIPATwrnQEhRohEqxVUbzP7gKLk/JhynpE55K6JZf
	Z24LEjWrunzus3AaTM3DuG5ey5Kl6h+faVNlMQhi5XDC5uDEosO/gVxDP2LrGL9GVOuJAFqVQCD
	jPZ0dXzG2UXf3Sr+VZpalxXxYZgIE9l5kfIv95DgdsNv4Te240OzHkuHVuhoyYKfcthRRQc3qLg
	hV4S1qVgifXuHFpmwzeoO9T0XsC5BwGw6PKxOynI380acI95wLNoK2K/D3Q89YAAFMf0X6kvnmR
	7Y8+PBht7aZtAWoUR1eD+cZpE6cuRpGMWuDsEJFMC2QLVAeshyUjfMOLiELJzZJP/jzdoGYbatl
	cCObwQ6K5UO4AZbs2cM2Qlrk/L+dHhA4kVtLEpytOYcDlEsWEeMdPEJ/fD96hTzB7/vX9sSj2OM
	peoU1TcwWI28VxvvxtfMUIhAVAXeYvLkoB6
X-Received: by 2002:a05:6000:3c5:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-4982e641f54mr399339f8f.17.1794246665055;
        Mon, 09 Nov 2026 09:51:05 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:04 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/11] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  9 Nov 2026 18:50:05 +0100
Message-ID: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a number of bugs in the Cedrus driver, found while
running the conformance suites and comparing with the vendor library,
mostly on H616.

Patches 1-10 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 reject H.264/HEVC SPS and VP8 frame sizes beyond the
  hardware limits, and fail jobs whose picture doesn't fit the buffers,
  preventing memory overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8,
- patch 10 clears the sizes of the H.264 DRAM buffers on start, which
  fixes a double free when a narrow H.264 stream follows a wide one on
  the same file handle.

Patch 11 is new functionality: VP8 decoding of frames wider than 2048
pixels. It depends on patch 10.

Changes in v2:
- patches 2 and 7: check only the hardware limits in try_ctrl. Check
  whether the picture fits the buffers in the setup callbacks instead,
  which fail the job with an error buffer. try_ctrl could be bypassed
  by setting the control before the buffers were allocated (Nicolas,
  Sashiko).
- patch 2: describe what the HEVC decoder takes from the SPS.
- patch 7: limit VP8 frames to 4080 pixels in width, as the frame size
  register holds 8-bit macroblock counts.
- patch 3: pass the reference type instead of a bool (Nicolas), and
  keep the reference type of the first field when the second field of
  a pair is decoded into the same buffer (Sashiko).
- patch 4: halve the macroblock aligned height for the boundary of a
  field, like the vendor library does (Nicolas).
- patch 10: new.
- patch 11: set the DRAM buffer sizes only once both buffers are
  allocated and clear them first, so that a failed allocation or the
  data of another codec can't leave stale sizes (Sashiko).
- collected Reviewed-by tags.

v1: https://lore.kernel.org/linux-sunxi/20261102170303.1973892-1-jernej.skrabec@gmail.com/

Please take a look.

Best regards,
Jernej

Jernej Skrabec (11):
  staging: media: cedrus: free MV-col buffers in buf_cleanup
  staging: media: cedrus: reject too large H.264/HEVC SPS
  staging: media: cedrus: h264: mark long-term references in the frame
    info
  staging: media: cedrus: mpeg2: use the field height for field pictures
  staging: media: cedrus: mpeg2: derive the field order of field
    pictures
  staging: media: cedrus: mpeg2: fix the references of field pictures
  staging: media: cedrus: validate VP8 frame size
  staging: media: cedrus: vp8: use the vendor probability table size
  staging: media: cedrus: h616: use the 256-bit DDR mode
  staging: media: cedrus: h264: clear the DRAM buffer sizes on start
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 +++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 49 ++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 66 +++++++++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 32 +++++---
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 +++-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 74 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 72 +++++++++++++++++-
 10 files changed, 329 insertions(+), 46 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0


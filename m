Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638996;
	b=3DPUYe2n2CPuwpfuGDPu72w7OXZ6lxQS2CGIKsjvS8EOBelHjpgeaKtF7IJGlcqiDpaY
	 CKL2tEsg+hUTuK1X+yiddiA+MKbHL9pnxi3VTQXWpIAVmp25yA3sya5+A2OluG+wxR1oC
	 d9zHT6rMN2kK4eW7928l88NVtYOWDOa218a9mWPpM0t/TbKAk8vg1XNPqWIod4BCWFIn+
	 cFuQLvCA1N5Mz+tN2K7PugJveh9GiwJMQrL9dHxwbSmNVOjt2Tjei38MlbIAaUWDtqptP
	 Nfik2h7KQUMtJItBNT03CZvgerHwr6E+Lfz1pqbd7sXCFnvWHa1xZq38v5pNULcHctA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
	b=2mM4iCVS65guNyHnfdJjPgbDV4DZnVyezUbGKIi1rkmVz5H7KikSTT1nm3r68qamBu7e
	 UM2OP1le1U+R3YHDkQqkwj5tx2lRvapkxUxBAMZIMi09JH/3516rsfqUgNU8ZHajDlDFB
	 KXZQt9EwTK17ciC/8wKV9pEviII8kNwh39/y3Jn0fRJpGeqj2MLUuMiecjXmNzhTTESNJ
	 xhVKE0aEkC4ahf00pn9UKfyQwNQkII9DRkwHesPixEV9+I85l3JFYQMpGI6+Xdj2WWGyy
	 3x7FB1JpjxZkNfwkxZdBl4hc8koQ0aXvmueDKEbhaSIkPMeP5uRLsh0rIsm6VR2hsEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLcwHB8e;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35FE606A5A3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35FE606A5A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLcwHB8e
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c45551fa84eso475988366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638994; x=1794243794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=NLcwHB8e2np0eq+L4OiMPgIc4+Cdw1WtWgJeb8nnaRBVLrW6GDfgJM6bobOROoYBlG
         jEfcSTLZsV/sj66GyUYRBi6QY5SHZNAxV8GEaoh5Uty6RZ0tLhpwFG3wN2wZxhsZyQhS
         krYhyzFecQRLjAIMwy75/dwG8KmpLao9arm5rTgR7mZS8gZ0llGfpAOeK7XPEeBrBqm7
         28VJfXqH0Xu/6X7Te8cXF6cVm3wRHE3BTa1UKBBPYu3NBWY3xkxy/WEuOvImlJlKDx8O
         PPPVwCmK9JX4QPHy0fkBPZRMr9jb6R0KDdpR4W/eqqvxFPPpHc0ArgJ2T2zl9dDivGNm
         5Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638994; x=1794243794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyWui7dAfXbBCWh/47kRB3Ky2JFvt+VIP6naoPJCv0k=;
        b=nyQGARbzAJm0F/pmz5iER2InQkEMkhBCt2TLwMrvQxrGh0H8QgmXcX8FSdouzV0gOJ
         AcwU9CEvMfMCqt85K0MDxAOeE1e5CB0jU9Y3tt5tCC8gDghchV0YTpROpiab8rofqVtq
         951sZju6Y8ClGhyeeUM/Xs4DDkIFpFRqjsUalsmMKqBxw7+tMESE/zrdqE51LOpcjcti
         iJr3ZmrhCueRkL61JUTwNoMRJOLD69PuvEWIgHL6208dXw4VUx18rQXZtpPifugoYVhz
         5vUbBGFRsAAMNsCPbF90P+GrVMdileTR5huaiU9ik1eZqRyaDfNrMGt6xTfkx0pK+8y+
         jlyg==
X-Forwarded-Encrypted: i=1; AKwUvBy3k84c6/M19shCDPbvDAq4J1thSegvCFxJuqscGG1Bw1CkYwiBy3k5g9+UhHBhM4UkEckz3CKhh/YKP3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPn5MikuW++CK9Jhxu2qeFI4AuVALz2CMaK79Ktv7ASb1Ec9QU
	c7N0IsSyKUnNBnMdfBYsNO4Bp2fMlwLkZO6EM3Srj3lNoJOkUA/syaYE
X-Gm-Gg: AYBFou0mCFsxdS5y15waaq8PwfKodwtC1KEU3sdhMVEsXBPVEGc5K7Dmb0g98Q8VBZZ
	sCLNpq38syuiQbsGeRvv2QLUHHo1CgF2WrCSlUWyBAc1K6HuQucLDTMP7vivhUUFWBD7dkrLZ73
	3Welz86GfX6KAKYlLOIPw584Ut9W06qxcOiwaw5qd5vYIuzSZA7LnEz9CP9sSGXXapMT22RZVvM
	7jfoO+fAnKJVVuOIKDuxyMYUhQZN4fPfKMRXjy1D0W1kuH8HC8mutCftR5TZI8CU/Uhc8GnYcvT
	WlA0B/izn8XRFC5GiKbbcwxB4XSPavs7dWNbdRfMmHhH6U58judpqP33uMznMAu3KMIqXqoh/wi
	3YCWjU8AiEmglM+xdaLypF3NZsWMND6xy/dq0z8O9Q/HV9rl/0p64MRg9Mxnbc5IslTS/ESv3r3
	LMwsyf+D2xaFAhfd1VhRUmW8U5KX+3+2qhYnj/x4N/IQhurp9pOLR+MD//jMsXSpKPgxA372nHr
	sN5QNruDFHekctzGoV6QHx76sLuyK8vV8CtGprfoqrZthMN10gy/JR8tpNhdaQvZsu05SE1ATpY
	pAoFWdMPHz5MR6o/vfJRjvSGIpDTfAK/jpK1rdqa3cqxo7XQDthueVA8/HeJGUNKTgLuKXfEkHe
	Mi2gmwC95Ywj2jHOn786UMZUbbTM9f8MnHySv7aOLMg7ahHmnSt0yWNOl8gpxtSVFUnp95pUSMC
	OkCoPEQLXHVg76RUc8VrhIuTYGoft/eeHrmbadu987veyfjg7hcOW2IqKb05Fab+bhcdUi+Beul
	oQFoT9p5u/Ggroq6hHMI9LSlG6v+OjL0L145IjWjDbaD6oO9Q==
X-Received: by 2002:a17:907:e8f:b0:c41:64c1:cc2d with SMTP id a640c23a62f3a-c4ca79353a4mr832997366b.2.1793638993799;
        Mon, 02 Nov 2026 09:03:13 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:12 -0800 (PST)
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
Subject: [PATCH 00/10] staging: media: cedrus: assorted fixes and VP8 4K support
Date: Mon,  2 Nov 2026 18:02:53 +0100
Message-ID: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

Patches 1-9 are fixes:
- patch 1 fixes MV-col buffer leak when the file handle is closed
  without STREAMOFF,
- patches 2 and 7 validate H.264/HEVC SPS and VP8 frame size against
  the hardware limits and allocated capture buffers, preventing memory
  overruns and hardware hangs,
- patch 3 marks H.264 long-term references, which fixes MR8_BT_B and
  MR9_BT_B conformance samples,
- patches 4-6 fix MPEG-2 field picture decoding (field height, field
  order detection and references of the second field),
- patch 8 enlarges VP8 probability table to the size used by the vendor
  libraries, since the hardware uses the area past it as scratch space,
- patch 9 switches H616 to the 256-bit DDR mode, which fixes corrupted
  reference chroma in H.264 and VP8.

Patch 10 is new functionality: VP8 decoding of frames wider than 2048
pixels.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (10):
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
  staging: media: cedrus: vp8: support frames wider than 2048 pixels

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 60 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 15 ++++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 40 +++++++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 28 ++++----
 .../staging/media/sunxi/cedrus/cedrus_hw.c    | 14 ++--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 72 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  8 +++
 .../staging/media/sunxi/cedrus/cedrus_video.c | 15 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.h |  5 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 66 ++++++++++++++++-
 10 files changed, 276 insertions(+), 47 deletions(-)


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.43.0


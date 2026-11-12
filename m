Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466242;
	b=WotkjKcJG40YNbhitR7dsO3BBW8n+iALAGmnM51OoSsKcqdB2LAwYVTJx/vXXU3gX9ND
	 3F/chySrGIBYlJsHpoIfKjMmWS1rhYhzuYN4qUpRQ/RIV6/hL6S+JSwuAqXZibJA7c1f9
	 z099ZI0FLcyE/tFQGctsc8GydkESfKGXOzLl+uCn0NIra9EliXAJIP3sZy2DILE4nsnyc
	 tWRZpvahPw5F5srvxneCV6Mu/0NZcFrG+vcqzjim5a7adThSNOQcw33y7Qb/Ym+JWc3yM
	 k/v4PrU/r5B3DpWUOvaFV3D7DHrgR2mv6JGqJZW8frtkgc00mi32Y080uejyPEVOMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UQ104XrltwOzDQ8IcCi3Ok5RkLXXXhJmwNsMcy2ddH8=;
	b=NrcuX9xXNVXRHdlafDXI89E7Q4JoeOyokoaWrlSomRYrz39NXI4oeKgIJmJwqTFStUwu
	 znDT2EmB7SitURSzKaqg4AXwqwGtV5qUvxPGRw8nhn/gjMD4vt/qW+SRxCHj2eXA81rIg
	 OCIzj5AxckUHMSLYeXylGP3iLZqCXFGnhllrABcoeBjkIUbNc+JCG1hY3+Rt85tip3njC
	 G2WTyEDo00FXZnFLgkBjmjTrcWeB4B2WoMGMG4M2BJLJnhNsrB81Cv9fPy2jVrQ9kOZ6L
	 itJWilki3oYoiY8CkHQt0iSKTmaLuCH6rPU962GBtg0tIP49gu4f8uPpyfMkyABWh9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+kJtLGF;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F7606AE60
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1F7606AE60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+kJtLGF
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso394502a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466241; x=1795071041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQ104XrltwOzDQ8IcCi3Ok5RkLXXXhJmwNsMcy2ddH8=;
        b=N+kJtLGFASRGuahSux7Ypn94XBqaQfBt7x3p0iF0GNp3TDjNDeTJ8prQVSu9U8gFcP
         hlYxSbRXx68RnRcWwVG62mYXATTWyEhA25gQiWCIdjKvya7iLVH7GMPwISFXw/RwMRLg
         fh07Q9IhoovKjhk3QfbcovvP55djwpBIo7Mfn/cLYeKeGi0Pr7N8Ot3VEAv9Y2mk6zPq
         SX39mUH53To5ACHKMAXINsCDWFFxWCDb5zz78Stq/veL24gHJr5sBammaFm6wMPQfdTi
         mnM4s+sH+zw2UhavXX24lv6W+QR8G7zjJVVEyyNYEtD9mB6elnGo191616otDMecOWua
         XHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466241; x=1795071041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ104XrltwOzDQ8IcCi3Ok5RkLXXXhJmwNsMcy2ddH8=;
        b=FlugssYQ9MhITf0Yfpbgq0G6VLRoiTYD6hQChbf7VE4hwwzz3Q5+WKCvgGGMME0X8x
         W5cEJ5F/J3Me1uFpqq0rcRpB0IXV/i1ECy319xC2lG/4z8qLpgzA0rc+wQRU/NY36sL8
         qCDbysDk8Yt1f+MOxtylSaC9ZYjE3p+T647woEs+fA+MIDfk706elXqOfGX+YyPHZ1yr
         UwGUhjHbp8CzCTSn8Yc58/x68jyBh+zZ4CM3BRU08TcPjes3Q6F/DjR2VsgUsk+15jMq
         VRRtJttpSVEL5VGa3zdS/3JHlwwP/CwojXRj3MZ9mmnj0KhOlmPwT6o5/oWSoaer0gms
         7fRQ==
X-Forwarded-Encrypted: i=1; AL+hErFSHlJ53oaPkztZoHkL5uhonCdPnTKKw8HPCZHiu9OqPbMelalaTNoc1Yi/J1hOixUismhWJi+6TJZfWro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vd1o77DihPXYzgG4vdjkuU1S4+U1dH/sHWAMJafWdY0qGMjRd
	deA+W2gzkdoU3NjAyUAx795tL85pz8pMC7TgHlZFa0q5c5H7SsrgbhBa
X-Gm-Gg: AYBFou1cZ7KMZq//Tvu2Sx1JA1ql5vHU2TRD7vRDgyZnzAK1M34ABb5c+lXrhMx9CZy
	LXh5Y+fUfmWuaJdm3Wq2IBho8jXaaH4gPvFZZaKKDV8X+sDJ6vIPf7mErVqk0ZC/Oa+jqkX+SXN
	kNTjcVFPyN23ZzEubRht+Qx5wPB0jQuO+QLGHYye9sYN81esUoCwaQq2/WIbkCjiwIz8FcuR84T
	G49mVb2TO29YpDQFuTgBgN3iO3lei9MVAihs/pNndOu8pL9cra8QvMM8dW5ewW/YQYnuEE+Z02O
	F/1C4XveAfEr6wxbvgieIeYHz5k42ELIdm1qurHl2uOvwUhvsimnQTkdgravLw5x8sF7p83EyRD
	F08MhBPheb5qv7TAgPEIhfM/ud5nPBTpAWoCviny9pnAuKVjHKI8SjGxuVTH1aOaqAL+jTRLcPS
	6QN9yWq+MGrrhrT8wap04H4iBbs/FUjoPWMLQg1xkaTWBOqHz10nuADTdD9aylvNfd8FQ0xfUcf
	/akOZ0dBWiXzU4RP9QxM7+HGJjYEWGVFW5/7/M+X+4x1BXY5f+mHfWsnhKUioUKYBaBt7CA7Jrq
	11onElA72q4DH4MCBVd8vnY52BqVUZrEvRHF9a21IOJG9hDn/SJUOCaKMKnMR2ZxbCAcf3uD03u
	6ignUu+gVEVkgKK7JzRQfkyqcsxbJpIXDOq64lg==
X-Received: by 2002:a17:90b:4b84:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b197cca4b8mr1069474a91.29.1794466240511;
        Wed, 11 Nov 2026 22:50:40 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8aae8sm3073297a91.14.2026.11.11.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:39 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Johannes Kirchmair <johannes.kirchmair@skidata.com>,
	Yuki Horii <yuuki198708@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-input@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Input: tsc2007 - drop platform data support and cleanups
Date: Wed, 11 Nov 2026 22:50:32 -0800
Message-ID: <20261112065037.1800467-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Now that all in-tree boards using tsc2007 (including SuperH ecovec24)
have been converted to generic device properties, this series drops
legacy platform data support and its header file, removes redundant
memory barriers, fixes minor coding style issues, skips registering a
non-functional input device when no interrupt is wired (when the chip is
used purely as an IIO ADC), and uses IRQF_NO_AUTOEN when requesting the
threaded interrupt.

Thanks.

Dmitry Torokhov (5):
  Input: tsc2007 - drop platform data support
  Input: tsc2007 - remove unneeded memory barriers
  Input: tsc2007 - fix minor coding style issues
  Input: tsc2007 - do not register input device without IRQ
  Input: tsc2007 - use IRQF_NO_AUTOEN when requesting interrupt

 arch/sh/boards/mach-ecovec24/setup.c     |   1 -
 drivers/input/touchscreen/tsc2007.h      |   5 +-
 drivers/input/touchscreen/tsc2007_core.c | 183 ++++++++---------------
 include/linux/platform_data/tsc2007.h    |  23 ---
 4 files changed, 60 insertions(+), 152 deletions(-)
 delete mode 100644 include/linux/platform_data/tsc2007.h

-- 
2.56.0.567.gdb80ae8cd5-goog


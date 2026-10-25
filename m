Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958103;
	b=4kXrGbkGwGRfhRb9kHODYqruGvgI2Rm3r4un5Sc90RGSIb8FAmdWdqGWn9aJII/8/dLs
	 YgnXEtzJSl4S1KPGPbmPzmJC4sdkszHHxJbwjzHDKWj8Ya1BMARYt9EUQb3WsIE2MEDD+
	 Vd9Qi1KTs6gbW9zSsx++pes2FsgJ5G9+s7EaprhqAXgUkrxmjOPfWS6Z8Gg4BNS8m20uL
	 32IWkTgmGq6nb0bxiJjO0yJAz+BWP4COtXDOggWMbqQ9Kk1l/wAbf9FTgdWS13tPuEnv8
	 876hOEFTzqrYj+ks1t2IMJ0Zdk0MWWQH2l5n3Dyrex253xCIcauAMzD4Z96YDQvi0Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
	b=IsuGW68bvUpIS6/vL2edp8wWlRx4fZ82xfVIQ5oDfu4eI5/wuYY1akhwSVrCie1e0Ode
	 LyEkEDli9eVaKb2WWRrw9a5QEJYBSrcM6slYl58y6sLXVlN5rkpe6Jq9QnWcWWYqfQkrz
	 OMbbgELXSwFI29xWkcLq4K7SvLwdUVywUZdVCDEAD9ZdWpjv8rAlyQaRJ3BOxCbkbDCug
	 lxGau9LOD0TQgKmpAvPvev5HYcCqzuocV+eHcJmR0UgxFw4lCSbvc9X4MOtlFOy1cnTTb
	 SRdn/PY+Ys3Asu556okD84YlY5Onorp76O3mNwmm56K7srv/A1S+lZvncVGX2OE61tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WtBcFVxl;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDDC606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDDC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WtBcFVxl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3574743a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958101; x=1793562901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
        b=WtBcFVxlmTUpy9DpkgFamxaPrQ5IIznZ3JEWiFvXxmTFiFSjWq4eGipJm3wWGY+E6F
         m7cGtU3o4U0+JCMTg5FCciB9n6KlDXcdZwskzS9lXKfecIoxL30n5lyimfUVvRT7KlKD
         2zcsBYUrayGwQpfNU5Xv3Gvc/NKV+Bxd02QuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958101; x=1793562901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77x1qiUZRiKVIGGrVBjtoX70xNoRq8JAxKSgRXShqGM=;
        b=pNefeGsCoqUXGXbhnvZ/1xv9SYSH95xeMgf926eY2gOwwLKMaANItHlXbNfUHgKl5V
         Ws7Rh8BaTLzi/WTUWxRm9JRSiNO+DD6oGy4OZjw2rYU87uSwNChwCWq+DFm/9BXmQz/g
         bqORff3fsAPoCK4fbOCsINu/iUJPFITPx8GpYFkJ7pTrm5vPxuEBRwkshABXtdw7XlyD
         cn9a++mrBGk/MeirATtYRQUsFiv+z0fUV3nKyyBN25YaqG5hqSHIq+Ya2ZC+uIIcRo9O
         cG32jh1OUhwClP0QqfWDq4tsGIWlVzsHNw2Y2JPQYDE1JxLGp3GzOf1YvGeK10A9hPyo
         sLRA==
X-Forwarded-Encrypted: i=1; AKwUvBxTjSjpvY02MtycheET8vLYOUisthbH2AwHo+/GbwpLzPr5KGDi4MMCqlMo3GNnaVrfa6YCS81JUlJOL/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtSObKKluUo1xFJ9KP7/rGfxrmBF4Ac01WcFD5n7/U35s2n2yl
	dXxregqLZ2Tmat8d04/bOfts9zMU1r6wpNPusI67cZCn3kNnjnSEVorWR6rzh+hP3BQ=
X-Gm-Gg: AYBFou3Y8lU4Ky2QRum1nDBa/YX8E+eKutIgFjw0mDPOGATelh0xCjclPsmmIQj8Ng8
	aUa0/qb2uRz57x+4wFnyo5pytSDtyBOcyLdQP6r2goqpNRVHL9nhoWQVBDfRlf2OnIRCfRXZiNM
	iBKzUzOENbwj2repOmrn7n5EHHb4Krx3OEvm2q1QIu+xIrX9cFPArvD30bM1cy8YT8eJHHwtgRE
	b09aZ+TNkJ7D4xig5qHJgnCbx1q05D4/Qlb6aRLsIrlJsYEzUK221H79szW/z+gzWak6Ovc5ktY
	pnG5IuSzAfyPBF0KX8xz4SeiTSVgKvnl/f5rRUdcxMu8BRBZRvdOFtsP7K0pjHLFYHIGBZZtaMQ
	YIVOv/3P3akfO8LZJ4A3/sQcM6EGJkUz9oiAtQW0O9YIxAJmKmDb0gej70ia5lKAJFBD4dSRDl6
	uJIXpe7bspDmryyF9F5wM4bI+33PZFxEcCI4mQxHrlrCON+GiQEdXbgzVxP6TkRZrRD3NKrL3dx
	2PkgLn0VNvLEpQ2OqFm9VDau2FnqJ9Lznr28taQs0lifoFSAmfFrMXGRCvO+mP4fm2hCnmYq7s=
X-Received: by 2002:a17:907:3d88:b0:c46:bbde:734b with SMTP id a640c23a62f3a-c46bdddf2f9mr549261166b.32.1792958100776;
        Sun, 25 Oct 2026 12:55:00 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:54:59 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v2 0/2] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
Date: Sun, 25 Oct 2026 20:54:54 +0100
Message-ID: <20261025195456.43414-1-chris@miget.com>
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

Two patches on top of Mingyou Chen's v13 "Merge redmi-wmi into
bitland-mifs-wmi" [1], which adds the quirks table they build on.

Patch 1 adds the Xiaomi Book Pro 14 (TM2424) entry. Patch 2 stops
platform profile save/restore errors from failing system suspend or
resume.

Kento proposed a different mapping for the same board [2]: low-power
as 0x0a (which also dims the panel and keyboard backlight), balanced as
0x09, performance as 0x04 with 0x03 as fallback, and no
balanced-performance. This series keeps the four distinct firmware
modes and leaves 0x0a to the firmware's own mode cycling. Kento, if
this is a problem on BIOS 0707 or 0A0A, please say so.

Mingyou, on your v13 question: with 7/7, accept_zero_function is not
needed here. The entry does not set it and every SET succeeds.

Changes since v1 [3][4]:
- Use the quirks table from v13 instead of a DMI conditional in the code
- Match on board name TM2424 (Kento)
- Suspend fix also covers resume and skips the restore when nothing
  was saved

[1] https://lore.kernel.org/all/20261021123414.25516-1-qby140326@gmail.com/
[2] https://lore.kernel.org/all/20260929144703.700966-1-kento@kekto.ru/
[3] https://lore.kernel.org/all/20260928153902.139956-1-chris@miget.com/
[4] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/

Chris Taraszka (2):
  platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
  platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on
    profile errors

 drivers/platform/x86/bitland-mifs-wmi.c | 43 +++++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)


base-commit: 9d3475065167197742b0882aff21cf8e78393277
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 2bbb1371b506f5a07a1e6e69d34217195cd5ffcb
prerequisite-patch-id: b88e60d7915ad055b67478359bd9c6c9482d8433
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
prerequisite-patch-id: fbf70405992dfa75ed02026d97aa16e1644fbd42
-- 
2.56.0


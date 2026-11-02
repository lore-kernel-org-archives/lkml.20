Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639777;
	b=Uy0UQWatdETpNrQnWh0sOWWEJN0UrWOlJ/zRQaAE6h+p5XmHy3Ai/dwLgc22qBDstCg3
	 d7ujhcJrhNkWfHos9WCr5wG8buYZ+Vm164jB7NcZx/fFK3Gv4Ph4V6w0ubr745WSwGOKI
	 zNigpPuuVkIKwo6SBrdYLaWHrXtaf83rlLKc12AGpgrWfZawDrraK2KsRMzsQkcIrUl7F
	 R7QJE55Rcungkkvk2ZMCZOpQROwURQH2nwmZEsUQlR5Ly98yBW+hpEeAZa/OYSbRkgPlQ
	 g3X0KT0q61uletRJaSoBdpldc/rZ4RwneiBIv0udRe++1KtWtugKlbSYe/RiKqiz3JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A9NhjEiTs8MY8y/q7o/Otn/Omwz5Gf796OYmmromK3g=;
	b=yrRLDuOKHiY6obPfPuW7gLQQ4Fmn2w8gv/N6gmNuHtnhAJ2i4TLiQIRQLSz0lVyhgves
	 CqGtcyQXoBiGJVKQzVqQGNWEQvcl/Mu9BctJjMIh4GrZwmvjFPTC5W1hUMeez9C8gn89g
	 mXBcvD7Rn9YVFvudWw4cMX+GKjTpn2FXc9EbIYCTvwQXn2B66ssgkD6oYdW3w+f6wdw0a
	 VJlL6ttFD+foS3rCP6DGKBL6gVHzCIVkPWMEGMs6CCu1PC6+XQrN1WdoZnek1VnD/X1JL
	 4xeRuKat/R/IeRMkKcX3Chr7nxmg5XVNRj5S4QxSu/nQ03/0uzVolO+bXU//xtp1d3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lha3S2ld;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB00606A930
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB00606A930
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lha3S2ld
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1776019f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639775; x=1794244575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9NhjEiTs8MY8y/q7o/Otn/Omwz5Gf796OYmmromK3g=;
        b=Lha3S2ldXQeXGGzuOaVI2SSRdupbvuUhMMMZqPcrzn0TEL+roGMSoQmZJGt7kvbldn
         PtzhzYLQM8YHNLLonUCSyFEjCv6T69UDOcXWim4i/qoJ8HD49ZRYMlg+XZi/Yjku3CXK
         etlFsM40qo96ihPVYzEkTsBTcOk7+VAbTCDL8KlruJmfK7cW5Sj55q26jIN0TbIywuPh
         vPRPGqnYYVftcpuSU7V9sopSHJKVxb3oen3SziTWMBPngtAI7fdLQn10gpZu3LWzV31J
         0fI7n1uzHxXqsUE4s/IB4nF665lTVwCRQcNxLTnGNDPEVOA2Kr4mE69VhAM8/K4+1Eey
         5Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639775; x=1794244575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9NhjEiTs8MY8y/q7o/Otn/Omwz5Gf796OYmmromK3g=;
        b=eAdEePOYFrxagGzOVx8hKBPC6kDtz6xxjJwSpZeJwgY1dMvTDEapaKcsa9yUr5l9Nd
         92ZABI0tBC1hUM71MyGAmloH/sfpnqbGr5lBdGGpdbIraV4clzt2JPJjHkdFnn40bSLo
         CykvRsZED4EKAXbgzZjO1HuzEu8fonriGNn/b3vfbIVHLwLcxdteJ1XySmZQ7+e6bpcu
         W/BLrZglHW4Lzgri2B9NwP0+IIrArnU1Xz1N7RQrN7z26EDRzLxAq88l6P6+fgAE8yQR
         xyexKMiv+lsuF7E+0d5bKOcYktcB0kLYkVj7wy6ksykYAJkF7DoJiBXvWYG2FpveG9iF
         auDg==
X-Forwarded-Encrypted: i=1; AKwUvBzL12NYXBI9Bs5ZojpVwTM4VolV1vbphp/xIDXePAY3BicVS4YOq8KTC83Kvijz8e2s51BCn4cyJd1Kc6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z//zIOnvMOzn5dviCNguqGvxbWeL2iX05BaCPutYRknh62dSgfd
	MPDhzcid9RHr2U/eFAGvdqQ8Vas+OSYUOm1NtpqmYYQ7/AZT2X7qwU7w
X-Gm-Gg: AYBFou1kuRhr2+JW8I2gPS8HBdXUHH2LHWUHhSzRAs60+cPgnAm3vC4l3n0S3LLwGtH
	XwaMJYkjinzdiGakKgVRQDDc9Y8CWxru7LWc0StEetqZHCXGH2/hfVGUkC9OsuJpPzFI21hhHMy
	MbiJyEVjpPyMXN1pmqI65Tysxo6WPNcSsvPdmb5/7RM6wT2YeHSwKVxOtxM1YsLtWME4glyxsHs
	wq6hHrTU4a6Ea6+EdNUj04rUfkbcSsqcCHbLLeL+6vhxpGaPoqrpmqFeYacD5IZCX5gFAjSAAJj
	DMHwPU0ygX1pegchy/v7Kh/4ZGTuRYCeVylInuhFReigUCTKrNrr3BHxdYCXCqbkJE7z4pHBlLr
	KvRjCFM2HSOfkX0fgxPvSMIqQp3WcMwHvvkA/7IYa2+kWOhImHctTppm9ycIZUtZcUtgcOJ4k+u
	5gMzrsy1l4CRB7sxqzWIxovXfxNlLqFTBwtY/edhllXkr1875gr47KDH9L6xTNb13EX3fvvPvjy
	t6RsK6yAh8x1bjXhgkUZBg2YUW2M0iAG+vgxlWACF4xqx6wQ1+zvFrn05Xmt1rdcb6ucnSC9otm
	0pLh9C62Ih5FntGtMOBHh/fjB825ynmD0mj7gBtcATFjr3GZz/G1pf/uOQJlEC8=
X-Received: by 2002:a05:6000:719:b0:48d:fbf4:895d with SMTP id ffacd0b85a97d-48e6e2e7552mr23436272f8f.19.1793639775208;
        Mon, 02 Nov 2026 09:16:15 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23598760f8f.6.2026.11.02.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:16:14 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/4] wifi: cw1200: add XRadio XR819 support
Date: Mon,  2 Nov 2026 17:15:59 +0000
Message-ID: <20261102171603.368298-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The XRadio XR819 SDIO Wi-Fi chip, used on the PocketBook Verse and on
boards like the Orange Pi Zero, is a CW1x60 derivative. cw1200 drives
it with a bootloader stage and two firmware differences: channel switch
and join. Patch 2 moves the per-chip firmware into a table first.

Tested on a PocketBook Verse: scan, WPA2-PSK, DHCP and ping.

Pablo Mazzini (4):
  wifi: cw1200: don't update the beacon in station mode
  wifi: cw1200: describe the chips in a table
  wifi: cw1200: handle the XR819 channel switch and join
  wifi: cw1200: add XRadio XR819 support

 drivers/net/wireless/st/cw1200/Kconfig       |   3 +-
 drivers/net/wireless/st/cw1200/cw1200.h      |   3 +-
 drivers/net/wireless/st/cw1200/cw1200_sdio.c |  13 +-
 drivers/net/wireless/st/cw1200/fwio.c        | 121 +++++++++++++------
 drivers/net/wireless/st/cw1200/fwio.h        |  15 ++-
 drivers/net/wireless/st/cw1200/main.c        |   2 +-
 drivers/net/wireless/st/cw1200/sta.c         |  12 +-
 drivers/net/wireless/st/cw1200/wsm.c         |   3 +-
 include/linux/mmc/sdio_ids.h                 |   1 +
 9 files changed, 126 insertions(+), 47 deletions(-)


base-commit: 2c50cd5d10e8723797f28c7978f1f61688e0c0d2
-- 
2.52.0


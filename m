Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299073;
	b=ieLtmJBBuQNPFkzM4xyI+KsyVmMIY852kMFwVyhsmEDlv7omVTlOY4IQ/yR4wxSVXD4O
	 soF1HoBW865ZzE0qF84axUFpopzq38zNMdn3nHlHM1yAX9A14k1RETlw/0H91Sxm5i/nS
	 bg3GwM6PV4uK/wpMA21Z1CHwOB7ik37tE2eE9yR+DDhdGsZi8bsOxJBpO6Xgp+JUlQp1+
	 geOfo3kaq4tGN0DiVk61Yjy1DdmO7ZUTfE86kPaFgGwxv13OR0bosKCfvzMWJdw///mTY
	 pwWDWroadmMpi+5eghNm02j9zOpWPcjz6Gv7pgl+1ck26dy5Tb5Cr5afFicy4zhq20Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
	b=VKS3G7fnHLw2JX2Fwvu4QAMXAX1yl8wJTX6YedQbnz8OrKN0Qtcan1SOiZ+2ktMKcS/8
	 PFhELFequOOSnF4UuXALNNWmjOhAY1OmuNuOk9UV6zcRjRaUK94AQxCnKghBkogwO2b3v
	 Q/mFFoUftKTH8XTze3h26j7eJ8g9VbG6+9J4P4jFWfirbspREsbqjQwVfbUSgDUluDaZt
	 W11bsXE3xmVzdoWKDkQpaNdTfqBBxD4KBnd4LfVO93wixkral3xBWOkdaaN3yUouQ+dQM
	 Sstahwu9Klr4wEiiB1XP5FMS838sDwSuvfsL9kkTLuaU9TPCkocwpDW8GskhkP3axJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Mw9/QQHv";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Mw9/QQHv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so12616375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299070; x=1793903870; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=Mw9/QQHv9O7c6ltEiNuMsAIVLhsexhHLIr/T/pVhQ8PFhP3aKhOf3KQ3ed1qXYCLaR
         Xo5QDlBW+Idi1EMurjmtCQ12v1gTgoId/O386K7S+LIEps94LDkdxx0KfdkagbO+T1sk
         lrTu41xj/S6sA3+cecp1QZHjUI8Azyig3I4ON25gzW6rH9cVsCMllMQqjBd9PTphjMPL
         +yYtkVUZ9sAvfkKzwenh3SyDO4MISUrqAtdPa8NBdRpS+Cg+GhgGtYHBgvk6gukldHhq
         uM+ZwuTrncWe7vnvY6Znc/OqibE0rSl5WGmi14kEnrS72paNDFsC8VoBObuUB3wwlLks
         wPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299070; x=1793903870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=jp7KF342SAg+lFNQg6cd2pJbVkk9lkplPVS1I4Cj1YTqlwaw2APv6BY2ued1YhgI1q
         yPPciQ0RLwqhdYzjtDkf0KbpM6rJ+uciRjXFhmzKAZ3rRDkKiKzNizxXhUQ4wNUHTE3f
         dYaf/rJwUfMB/+umNOi/fxAS29hnzihQ6dXi/p9LnfgeHW4SnvtWKDHuiTR5DTElKv7x
         0PZmAHLBfsUUj2FqQxz+nB6/kP13Ux4LioQHSmQbzDhdJ6TJKws9KDKFtn5d7UfcTql4
         9mdfFcyvcgTFrNQ0DeODJnwN738sK9hfhW52NZIqa1zOr2Bkwg+tXNv+erDSQafLrKAR
         jchw==
X-Forwarded-Encrypted: i=1; AKwUvBxUazqrDMO/FHm3uoLHftpJNvxUGjmvDYPqD8xoO+zoxoFw5xii3dvkvdzJpXEzWs7jsvnFVC7fMtrBV5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyhK0l+vh/JHWy4+1Bc1Z8Uv5Lig04w2PLRoC5IYL6SxFWg6oV
	tyRh+TgMIcYof0L9Xm+BGyaadvlu6ZJgeST5hZEyjo9GIvJKYKUrPdSNJNotLQZBRQk=
X-Gm-Gg: AYBFou3G5Hj8oVg5r3G9M3ZzVLHLOY/y+b538LRYX6Y3TwQeTesM9lhG1udDCUp7AzX
	TWtBnpeP86rUHuj8xZgGNUOHtPwram2V5pqXvBsi/4x7q31yZGkgjWL7lrpz5TW0ytgOuIRbXUv
	0yUL5ckjflu6uKIt6bWl5OyIgjOTsTMZ7Dsz7LLo4ixzXtBpGt7ss7PzjyUva6wJ1cMRE57aa5B
	ul47GacdxOyoWKw3ODuDXUo5DWrVEw5RYIK3V6KMegTaVlbamxmndS7XXM17Y/r9GayQZe3seuw
	9ziI03CvUuZdJFYRL5CqeQaog3LAlwDr62Uc385HO1MqTqvVNGChMGZEA5RVQJ9y1o2JXex6iI2
	g6fcx4AQ4bAdBPKZarPQIiXXJUbdmYA7gdNW6nrULEIjUOO2UzELJk2uAdfX+C9RPzaVEzjOgXR
	AwibN/LYUifDTCw0Qq4es7KBu71CoCQLpN4SxWHqPYHHE+DbBVG6z4uSdZ9f9gMJKG1Smn/5meB
	fDBdna3qt2Jl7Y699Vec0D/R3jWAzy+aHM6h9ebWddGXI3DlTdH2OB6gsojPNELA/NRNAndE93E
	q/vrSJID57n9VXh9B2/Rp572OYavIQTX+sAm6F01avvszf1FuwuC2jQ8xHeNZn3TqJoZ1EVOU7D
	6POEOq2RWVUDWwSf2rw==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr155468995e9.11.1793299070403;
        Thu, 29 Oct 2026 11:37:50 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:49 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
Date: Thu, 29 Oct 2026 19:37:33 +0100
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBQAr0K69pm2GCGuvIdh0ZZXecqn6StEQ
 ri7gBdwOclkZhGMkZDFLVtExImYhn4DfcqEa0z/RKB6Y6GlviqpNYyBU0TTgWvfgL0LwNgCN+Q
 T+BoL43JbOizEVggRPX2O+qP6MY/2hS7tyd1oiNMQ52M/qd377zQpkOCVVaikyevycrdmbslGP
 LuhE9W6rl9nsblj2wAAAA==
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0

The GXBB, G12A and S4 clock drivers place the ENCP clock select at
VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Reword the S4 commit message and the cover letter: S4 has no ENCT
  encoder (Chuan, Jerome)
- Add Chuan's Reviewed-by to the S4 patch
- Link to v1: https://patch.msgid.link/20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


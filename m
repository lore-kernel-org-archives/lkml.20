Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276332;
	b=zTtgt4Kb1yVkW1bdAiHKzPHUxCHQx1stawf9XKxnlgfUUD0PmhLG446VQFiqKOIlSH75
	 koPeQAxTioAhoi+Mce1E0c/BOGAcABVhjyVi8xpngnSNMef3BvAjc6g/JqpeTNDRA/JWG
	 jhHjmtgzBPgQ9/2dgvWSAzisrh2qAOFciozdrkhxwqMJ3BSsSrKsTAf6QmtFfZbiKa17s
	 Ab4RKYjruHRAc5uAmKXusbSJyQyTF+0NWEIHW26Ai7/Eb8xWIa+paPKWuJdSoIKV6vJkR
	 ci9ARE7sqFTLA6a8NfC2i9f0N+vUSwoZuF22lG2DGMUOdUIK3QfzMYYgSrEc+t0dFNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
	b=4aDNZdzH3wKwxuaKMJ2lOIWdEglB9YoMg1tI/g6a5qmWEHH2FrQjFVZ8eUcBQhfkw9o+
	 g7d+uF7DvcKHwS2QUKv5WqMNlNfbEwN41djkQQn+Cua6Gg8H9VVKUfpvCfdxDY8lLYi2I
	 AbMfCZXLSLfUWW0tFch13gcClktsJ/0P66ZbYfIObI5j/dOIWz763UGdA3Qdn7VI59tTB
	 jd9fZvB7jgnrI0YT8gHOaukBjGFBQ/1OOBlRYJSy4s3g29aSWlhXcAm5NzFqdAoMMd+Oe
	 +FmhZ7D5YN9ANWYIMAaBvlpg8b5vCsK0w9bnuQDDCVmhTz7f7HC1TyXit5FU7gxtlSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF4606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so201371566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276330; cv=none;
        d=google.com; s=arc-20260327;
        b=WPuzzeFktedD9NCoPojgx5+qi4SvjXuQbQ3LkCk/A2dMfsS0t6EnalUV2zWA0BQxHw
         a4ofkwWoz8hUKPyFz7UhMoBed/9FInqEDEDsAB4qN4PxwA5aFSw6+nfKgNxHgklK9Z3Z
         U+j5qJCj/ONe0iqaDJvSyw+Mjn5rx9i64sfJ23qrb5iKKNglhOwgdQHj4ZpNaTDI02tK
         rgpotNnTLxmbzMS6vFS5oORsu6cLgovVOiI8ROs6j3lvVJ3lZJp5kfMPFR/MSJMURQyz
         lRGgWO7ZwwDoApDjD0lyvh5iM0LfmBlAKPYCV3IjUmCNhG6T3xcEmtGLTzqsuoNdlRFP
         6mUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        fh=SmSAYHYFEgI1LomzSljeQVUAAH61+jw2YRoXJBoF8c0=;
        b=PotP7TVzNoSZi28AI7I1CeJbSaXKEu30LisKSS4G+S8usU2RmecyzLoQaDCLR4hk+r
         58jioyFJO9YYA+/6Gce2bosYwpxKVNei89Rl44FesMzieG9AVgIYcktSxdIMakmhV5gU
         hXoqqTtZdI0N1PBBMGd70mFzeVfYeJ4H0vArdvASBn2Xv+VTw3Zxdpb3WZNgO3CrvM3i
         PtItRWCqk/81x8F7+qsnyWiuRsHQVGHB0av9E8RW90B40qx6aWD/cxfhCFeb3ABk6vaa
         XBBbwno1KZt9y3we8fjFkKuKFxdM3jepX0Dt+i6m1pgHf9EzKSr//PZvTWlhD9RukzpC
         Z8FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276330; x=1794881130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=WeSmmqPj9oYt6CbGz2WJL1YHOSbW3KRP3BlaJT3/RZecDRCwFl9shRmqGLP+4GWoJR
         iUGkcG2vxUqZb0p2S2Wrq+uynYiIFP9Dzml0Q8pJmy2//UEsRR5NFRTDPabVXInnvo/v
         VZKGPU7xyXY6+d2xJu53l9S4ztCKhYEQE+AzDQ3/s7J7hpyjlCyGC1NtFsLRszg91uRo
         SN+gDbsxK+pDUOcGzhrN7GFM6fB3EbhzsWBaRx3p1rF7ebWMT61fsLe20jRQBsblZRBU
         uEdURgh/7Rp2GsTZV2YT9wKjy6WXLZ6SDM47f+KOZ2UIiLrHD0yIaZHrB8TdmGLOlbDk
         sc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276330; x=1794881130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=11gAhxlLvBRhd2Ahn08Dr1vorO9qFNUx5LXwpgnWvwWX1arWY/qZzySVlgaK4HxNWq
         A9RfX+GATwHtnmZJ9lz6uyrClrAti4pJgb5T8eAH9GP0yfWyabF4jQQh+N8wlJxsBCyJ
         yO8mKu7XOJ4AKlmoX9sdtT497KE/6oQx0y1gdo61CO7TCDqChBk3M5TWw/CX1+6MXL8f
         otlir0zLwCgEDz/Q30QEJIvCeJ5op3pfkPqaUUupv+DDDY2AnSY57x40HRLO9lvXH5OY
         yuU8ARyXiLfLw8zBA6WBOPDYHPIUANjPZP0TUEEIYH0iYUiBLPbQWqEkrNOpyX2hvQoH
         ri6Q==
X-Forwarded-Encrypted: i=1; AL+hErHcVzyqhZW9EFGJzjuoMQUTZp0jofbHHL/qxMxFl0CLkjI6CqUobijEXKx9mdYfnh7y2QSMxQVynEY1ORA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Psxw9Z45Z4Boc8aJalGdZHVs9rRjXRAE+Px8H0tvRAGduh+A2
	P0WHtHTkOcMFPqi8k3nR2PvT0TEiUyGftR9C2mb/XddNVc4c/8W4j7Bm4Nb0qCxGXP5IcCmxWJw
	oOyLh6f+LZD/MzBoYvRAeSOjSwq3ZcQ==
X-Gm-Gg: AYBFou17RwXo8DI9SmuZtluTi9kcvF1aEjpykaXizvnzDqDLh+6jMkadRxeBJqXeR0g
	kgMvqFP2fH/vKAQcS8mO0bKQnSVcH8IEEm6B684K+obRnub92oRtwGsOCPvplaH/0ctREzUIVdc
	LTWzWPNe/v/1Nc+KMWvQ0qtveaODBGfBZOh+3y9dhEdMPmcnOfT85Mjrl2zRTU1F/X8bEFZAzL0
	BKH9vtKSx+22Y03cUaegPBrEl/qaokbCOV+uXMmhrkzDKcIvBdKobbwutAv+IkTgj8akVinQUP3
	ZtD7eSFAqRgma19T6gS19sXdd6MwDSLBXEcDlTGexZg25vT2Dbwfrqc3LgsCeNpHKZHy8wpkVwd
	oyRfvPEdwZjSS2jM/UpRUlTQUrYbH4pJTwcPhqIB81wtmDHZS6J82QeUBhHfzzM1kfdBA+9H15X
	YZbze9HvjKWnPseEK81TSWlp6Tj9EuORTEwY/GrjGtKYjLkfuiqfJemnNifw4onQJe
X-Received: by 2002:a17:907:c5ce:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c50495fe76emr88017366b.28.1794276330124; Mon, 09 Nov 2026
 18:05:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:05:28 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 18:05:28 -0800
X-Gm-Features: AclHuK_B1IgAnEVdazOZdTLnofngIFWRqke7PWcMcLBdIVd8SA8s9C2nwtymCu4
Message-ID: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Subject: [PATCH v4 0/2] media: rcar-isp: fix core IRQ and probe error handling
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the core IRQ lifetime before changing resource-error handling.
Patch 1 delays IRQ registration and releases it after I/O drain but
before RPPX1 destruction. Patch 2 distinguishes an absent optional core
from initialization failures and preserves deferred probing.

Apply in this order so resource-error cleanup cannot invoke the shared
IRQ handler after core->base is cleared.

Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
AI assistance: Codex prepared the split and descriptions; independent
Codex agents reviewed the code.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 30 insertions(+), 16 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

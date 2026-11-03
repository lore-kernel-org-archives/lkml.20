Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739275;
	b=06g0/CuP1F7TbZhILy/FFcLkbHlqYWGJ7U5QhQrFDRQS5zLy6kRf0SQPgHv0J+XphJDN
	 dqZk5tq/a8k+VIAtsK0GucPNS6i0l7QYTbxLm6A70xpv9LGBu4bzGsUQaLBu6y+R6Stgf
	 7fRmwexx+3DkZWHLaD+bUXP4XOXUb1MIB2hFsBuOvysPW7+qfvBz+9UVLTPBoCdkueya8
	 6hvMgebpAsZyABJ48akA8ihiykRqP7fmu+3E0Zq/86p3WXGd+fogGvvkZktmpfb5+Xn5X
	 2WokomQXWkoX1jZJhuN89T2J0wtRAcAUQdZ2aB3eKopBMvQOP9v6KZ3RhiU9ATjC23A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
	b=b38dFRctif5h8rQkNl0tsInJ8+P9un1wuyY7UwH2jol9K3maJ8hOeRvft68adpCjhEZQ
	 l0bIXUKqULeAVtxctrLfzPaQSiJ5hBa5tW0ucOFgv25Zexq/WeKeqyBMd8ESUgeGd6ect
	 nxlRH+M3uNxOuBQ0QK82fwItb/QqjvAtrTUZ28QgiyWi+VJuip0ByqrN2QshGVcvlnjVJ
	 ZzmAqpxeZsnHo43Pomjp0kSNr0KrLGwoRWi2Nf0HO37TU8h+RdNBEvsiMVlpcBH9v8Z7E
	 XZurq/VEFCratIdPrzWkUqrNZqVfY+dA2DpLP9OjjqVV1CCl1EIgFFO6IfDBy8lyV4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWMKjz2f;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33769606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33769606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWMKjz2f
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b06c0794cfso342587b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739274; x=1794344074; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=xWMKjz2f24N7OKwl4uSDOvuxlNLn5Py1ca2wVzSkGeUL+AettLzhvVM0YhUWZD4dze
         PdI2V8dKw6JpN/yJahTam97guOJbvw9Z7BD7CcKiD+0HZtuy/19eQEuvvbnw77oKYu7x
         hyN3c79ZTgDEdWW24uy714LlOnwpl9GhZqgvF32VJYvOw/bh9l8y+b4mPEbtN6m6FDAo
         jh5Mdp1BNbAC752TteA7tevs3WR+eA41r30iAXlxRKFgw7WHrpCbqtRJp8wUXhdkZMzp
         gZSr4rgme9jkfa4P0NTFBoMPBtevKxdOqI8vtjQIEypl3vMbUYroG6wCF8m+y0vN8wwX
         r0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739274; x=1794344074;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=Xu5IaXz9Tav38tgYntivOmmXi0f7J3E8QAR0PQlK0ZeIMyDFlt4GHZp/8iBxpYh++0
         46c73WhxYdDBba4TELT0ZexJGJJcX1+s0zTEZjJ2d86xsZIe2uPQEN820V13/0sZv0ZX
         OtYUbzGYmWPgp2FOAN5ICcaavxOUmhR7OJw8Nlw8vHk2AnpcI4/kA+gXiG5bZuKKpOiv
         101g1eAO5dx5VpS5qYNaZFOG4aXvWbY+Suw2sve1C7sNGPJmC8x/43jAPjmOjaWKtrAf
         RP3WTRT9wQ43EWG7zyJZp1JnEtb5gcOVAMgnVyR+mhsJc6BaOCEopiwWsUr5mY+n6isU
         ry6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4AZoKWTJqCsazbiw6NxlQIIPziUlNLwlapg9+QUZqbnO0Vt9CO1z5HaJfdAOHQSN87bD6Ko/lAX9DurU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G6lxNcx2q/Iva32uIFFKSOutPzcHHWu3JfOQihBiIyimQ6gS1
	ZEljDeCVBnKa5lu27P4lhFAScKB8/Rd+b/yOKVZBGHavWl9sTpAGtrtn
X-Gm-Gg: AYBFou0162n8PCcXmc2Q3a3mX/w+K6OsnA2GuFhRq6vByqmllsaNXrquI5Msinsufhs
	9e/ulIhTMlBeWXjZU/yz6lzzmqYHUU3x9KBapLQVvUGjMXv98cB0yzrymgCnq2BJcUVNx8UX3fS
	17KivqCD5kdJggyElaVRu/1l/CL/LXqomsactHaraZoSt6mRqEkXPYFmVLTtwJqll79OZWg91YC
	tXLwuvQZnAT5DWq52yJDFbUiZjtlnsfsLe0XSfJyp64D9PEWQuIFNXhcw++wOErLVzhhaEdzBZp
	d9iqyiQ4rM2e3qoI2WIq1D051vdqPkml7v7GU/nHbMQ5tGh1KqxV0MkeDSY1jbr2t5cbdrZnqY4
	108cVBRJsmYDvHrC4cyJpdBs3ws4Fjq2OVf7G4/zPH41V6jcZr3eIclJ3UQXYdUOfoXiVGwOi61
	cy71cZ3suhP0kNzc/Ufu/EiHJXhJ99EWlQyXKP80iva3vzgE8cvpIQUlHGGAyZheJxViW2H0qr+
	/zZYzz3CO/zpb/b/yC1gyEYJSsC2/xzTlOMOUdDFYmkfDfyirR6Ucsg9HGhyk+dH3byrio82/gl
	g5BROCpoPKpBrIu7QONc2lRWNRmoxXs0pdGRgQNetzrQl8APIb7CPTfgbQ==
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr112559257b3.24.1793739274317;
        Tue, 03 Nov 2026 12:54:34 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm4805187b3.40.2026.11.03.12.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:54:33 -0800 (PST)
Date: Tue, 3 Nov 2026 15:54:29 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
Message-ID: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct spelling in comment.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.51.0


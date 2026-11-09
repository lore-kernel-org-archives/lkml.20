Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794231486;
	b=UouyFORABNxmVXc0c1Cf20dChQmylUIDPWWwjO+wXTDa9Tja2hKkBfLDIsmAMU2FeWmJ
	 YIU0A9vSlv/9nMqAJkL5zj2A4xJCPAAE7gioHdWxmNo6Mh3rtg01CROTt8/D6toJ1cp2u
	 TjtBQBnCGpks3VeZQFCpFmKWa48E4rQKu12QRdUWQ9PJ9U+g48Cb3c2U68b+7AJDRFN/q
	 3I77NyS3qF6/EekbGzEfE8SL6IB3ojmwpdvHwKDphoA3hiiQOp4DvQdgjUC10k1rlD6/v
	 bIB2eXzbBhVjgilMIRSl4muynYJkJTX7Tm1iZmc4rzRY3ctQf9yDslVxAdyvsnoVrsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
	b=CtBLgkuHtHBUdPRsxuUSPX1pdYSYSI1KRo9sdWdFDmAf3iYIO+6wP6KDl4ojE9oX6pcg
	 liH9kV5ERDlPabm0i6msZ1Z6UYlReD18AjnyZx0+zmQOdZTwQ1io9C7Hn7CATGj2iYS58
	 WquvHVu5AchCoY3NwzjxgYJHyq2m5YEZuF57CmfHZA11j1ZRi+DjMtF3yKu18eku3JxwK
	 wZWXjTRS2M8iolpb8RT7ITL2v69BXB1CVue3uyvLVEB+6wgeUOsTJRfR7rSgYdZlJbB1a
	 yqW9uOztkmixdeJEvuX1B4ZfwLLqa4kGwO9o70lKe2TP0s3BV6Fkn46TQ1TG7H+iWPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ob/X2+fA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23515606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23515606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ob/X2+fA
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso987421a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794231484; cv=none;
        d=google.com; s=arc-20260327;
        b=ENTcETbI3j9l6kCISJKjKTO9XE9x9RG5yuIQdxMrD891HrR7eNsHgduAkXvTaIuHb0
         VzRNvwCuPTbhyqkda7h1rOMV1br43O8EenbUTPJBrs6JpPLrWiKjGk7D1DgLeXi2sXgy
         tUXGsYu980J24++qJh5z+/6eO0XETmKlRU9zG8n+WRHB29kvFJ9nmmqdHQvE+vC6nAXu
         Ez4iCL4D+4OvSuzozM5gfJ4E+jemcAIwHAsvg+vpx49ektHDVo2relvqu0Pm3rMzLLIf
         cQlru/Q7kJTvecxqV0OmHhLgdgktH6EJgzJnSjWZCUDL6PKsfjzoCnlwqjN1XzKFsyZE
         ggkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        fh=ht2Mw1mgfatQRdvKVbHa4YPDp76vOaFFkzzwZRGdCJA=;
        b=izwIXZUkyBt3GiGbOLSwJUcR8Q1Ko+bTItB7E/NB8maLBpvtENRsRx33u4V9MBVszM
         WDt9CEIcdrasuYB03+eWdOcKX0s/JG+1YIDoVCIuLXxG6AU6/rqHlapOUrLsevxoThWc
         gD2D2vZrfYA/78auscQTB+Q3snN5Qme+qu4lDkmqQ+0DC6ZPUFbyzb6m6KCOATS+TAQ0
         SzdYGqnpHo1brMcKD7iKsNEYmS5UWTsLSvXVByNpXThOmKfgVBzHwvQ4kZ0CYZkZ4XD1
         Xg5MrvOkCwHGuKjhMPRUt+dBatz8ARbqq9ciPYCxgtnW5Gs63gA6QzkZYmOXM4iu+LTL
         bqqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231484; x=1794836284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=Ob/X2+fAyrgY07l5aAfWdTUU9k10irIiCWiHeaeaB+RRaAjYVyKQvg6DDleUdpkodM
         TJhUUpWUMmVKFkfXeUm+VzbfuUR2JYi2suCHXFID1CworwShP3boINdDyVETY1d2izis
         LReJk3WDqzXoE1ZDzGYezXuxcxxN8nkyU8O1RhvZ11/mZX2FZIFQFtbMpSc5HX2DA2PF
         WXcbNSR4IIdMOpfxtMDf1lANqITduP8Tooc/1eSiSYFQ34cKJNGjk9glBqZN8NpjIL50
         Vcmw51kNUPL9b9J5v4Az6GvohzSW0ntuGlICkhBWew5nq1f3wiwo+uZIWbI5ucXM5R7B
         PG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231484; x=1794836284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zv8wE7nYktMBq6L4GF3QSXFm19o0Lrnz7OmEGxn1wZY=;
        b=fHBZ8z4Sr81D4PrZ9uD097FnR4AkCuAra+LRC+9LxKDVajmlfGxd+5FG4GTXGzWUvl
         hBmmyLPqLFnb1Ry/AMOG67jeB5pVgRcwFTRes/gzwdwLiyGvpM6NhlNnCuR1e6UFyqVM
         /0+DMC+8gThDdLZ4aiWMcbgPq97DnJdKrNGOqBgCvNMoBUk1+llCP1BEcCEPZFAfwZPL
         uAXdN1xwy/B6XxBdIRIaUNvsN5PLRs3KJlLp+um4NCjcztGsr/9bi+T3vFB+vNlnZSXw
         COaffFqDeyCgKfTTG2+Xo9Ksmg7VFOo40xJS4IVE/dci1S+NfVcLXq1iq6TyWgUMrZmA
         VudQ==
X-Forwarded-Encrypted: i=1; AL+hErHbxlac9cR6ymy0xlAYkgEHqJ5YeIgeAzOTeYMdh4ECsWIFbmqKXEIb9+f7ZosHFIpwaiZ/niPFXgfPLY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vs7Nqj3qq3cyJka10MzWzFoTh584NgUbnjYBgEcMj7jdcbueY
	nuAJADL3cjEsY4oFUaRNxW+UerjODDs4gTW4BABzOHfBlyg+7T9/wK3+lysVWnYPd44lpaFcunk
	TVWkORlaMegFIoi1nGFtF+Y0GrrbHt2g=
X-Gm-Gg: AYBFou1cFlOVocwzcLLVc+mHkUGQ14j7cm67hxee4xUQzTh3tGMhcuV4429XdH495Jq
	wFprEs8oTUfHEvpsSQeY2E/4GiRJmpDYEbi+DPs0zvlPR2tm7wdJWVnOBJJLf7PKXQUE4j0IhFt
	j5NORvmvcmKFInF7EKnnpcnuwKdwZvi3DUuGA5rnQYMeipI1dhDmFwWKtHO/M2Zl/OIdfcjjXOF
	qNJvSFlGOiZ9QTMvPIlyvDORZBGQoEgt1+6OyeCJvXrN/7U4x0xFDza7riHAFp8qMJnpShHKibn
	vwZav1beI+H+XQH2eAKY96PavvdQexjs2ZX4VcNUWzqGg2mfrdNJCAZ0rm4Elgl9zHJyX6ZYhmM
	tJYpw0S6hFTy2irxZIgry3dpVBXGFXfomP0M=
X-Received: by 2002:a05:6402:4403:b0:6b7:186:e60b with SMTP id
 4fb4d7f45d1cf-6b722370721mr3069483a12.5.1794231484049; Mon, 09 Nov 2026
 05:38:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Nov 2026 14:37:52 +0100
X-Gm-Features: AclHuK-GwXS5uzKJjXZFVGbrq4GgjBtjHoVwLZJ345xo66Ul2iiUwy2U-krDQME
Message-ID: <CAORyz2L6Q=EeY5Oa=ch2R+Mh=xCeWosFPPRe+o8Qjg+Zc4QpDw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Thank you!

Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Sony PSC and mt8167 Xiaomi Clock

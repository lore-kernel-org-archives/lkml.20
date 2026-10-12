Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168CF420488
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800533; cv=none; b=hh0tmiMiwQi7QR3Gm3e+Anh86O5Nd4rgf4xEkvUAen60xBIQzd/SiB4UN6K0j6ZEoK358SsB09zU6KSTehA5QsDouzZUgFYhX11V/BI2twUijBVcInfgSm/pIDy4qLgcORMRGPtrTExARqi31eaZQY5QBYMrC2+5UxFtJh1NKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800533; c=relaxed/simple;
	bh=zFD2E/SM8xRGAjKxc/G95StFEui4tWc89ptGvsdyWy0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LL7r+lMgelVwucEuizfK9fz6QPWta7waczOiui8qwXvJuP9gKUmKxN5dGLQsgAiWTU72tlKHAbTfd+yCZtm79x/DPi5VKE5SLybOQDqA1m7KS60xxXzAVh4Mmv9ACmic3SLF7sswFmvUnj7a8EXdw13ncUXqsSXI7dc45h9XQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XNE4zjmV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XNE4zjmV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so10139185e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800516; x=1792405316; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=XNE4zjmVhgYVrzicQeZh8sPDbTFxv0axmN2vhvEje85z1++AaWJbSrK9+xpGRknwLu
         81PQyax3rdRu9FlMOLLn4WlbxVZzMXqizXZLYUXeC0Dl3vR8h+UL39H2VEjq7CY3KAah
         G/Gdd5cjUjWKu9ijmbWT+617WQK/OOaI58yrtvf193cOTqCvGqI5cmtmtSjF9SJITG8X
         hYa99OQWC/kanMzsPqNwkz0gQqVKRavmcO8gDXp0J4y2XmjX57yccZFn0CvbMIos/MT3
         iPxHYXQ94rZQ3hnZ3mdoRK8kshjlIIjUMHQwSI093vwXGNzStkb9VuUtYNlNLxFB7TLw
         wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800516; x=1792405316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=D0H2nRnfNmyZ3pLCg/B8UXzFO8Z7nJc2t1GRYcL3043cLeodGyjmx6QubA8xPMXWQD
         p65G/5a2NeYpwhD/NruT2WaLQ29LGfrwY/yAvLKJYN+csPhMQNn3LvrYQ5yRamUewBOk
         9bZjpsF9ujFFBqOXP1p/WcWxTG1jJdOd7sqpINVZtU6CeNB8VotmdySM79dxaNBb73u3
         OCY1aBdCFPcybKAWAcQVcrxNSf7FTKklUGXdtGUIjt/zLiUCRzafD2LxkmYyhgPtKjwD
         j/tzxtR8Sajz+agG87gNVe/pTLNXBKfhzYC7yFXxtQ86eeqtGfjsprm8FTCmUvUZIASq
         XfOA==
X-Forwarded-Encrypted: i=1; AKwUvBybQwr2tMNqOKrIT4xECjHg30fdIbr6qI4T5pI6nStE2AHvtKZSxtyUyxQ47qA1+t4Go9juM1FZQLx6msk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ2lz1HLL8Q4l8uhMYe3Z4PuIYuZ3ECx1y6cKWTQFtyrafH92J
	WWQbWUAik3QqDgi8ZdJNQy5dmgMi748TslTfWQwISg8MDdV2Mwn+gqUPfXkoznrnUlH37ouxqvl
	HCCIz3+4=
X-Gm-Gg: AYBFou3P+E/lRdPl+m7l2dBWsLxMRC2q+pnmEj5igxbfD8cKgrg2BuK4bLvn0ZZV7Vs
	9DidhWzLoYE0HZJWjAqp6Njxe+v7W51BzKQirKCwyWr0uDvJyH7qa4cK0XPwXYXgLdtjk8SGJpZ
	dJQQJOpfrdW7ikTHE6XuNx1Ry1Hys32RoChoMdICoqwr6oWPXcOhlYVw5tAHTwQTLZNx3CKXMNX
	fcga2WKn/cHTG/luADRiEO1xv0bJtthizt64vBKIRJbBqIoYFOAHV7jUiMW/Ndnz/qMJHkNhSTP
	BG6eshYhSu570F/YphqjlKwD1AcHQIotZHCMlXxDUA+lXYLndTcFLN8YCVVBpxslNV51dtkoe+K
	R8MORVwKqRE2cIAQkyFjTJr5u3+c0QmGbfLD3iIdfq5Suri/wI3ZYzpOUtgbZpivdMvJYym42JV
	hY7FJkIsqGSPajkhg+9AuIdBrnB74jXzgyABdA6vahL/2aKhNj0vLTfSGaD9mjU77gbMXlzaUqy
	23w0DRFATVYEz/4Cg==
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr165061225e9.24.1791800516029;
        Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm18110592f8f.37.2026.10.12.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/15] reset: starfive: jh7110: Match auxiliary
 device names to jh71x0 clk driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-4-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-4-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.17520660789962324320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zFD2E/SM8xRGAjKxc/G95StFEui4tWc89ptGvsdyWy0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuw307BpVwiqmXA7fLsjw7rJaS3+juyrmlwn6uW1/
 FnptmJvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbiFMjwv+LMKi+tDwy7fm+/
 EMf+TJu3Nrzvr4D3bFPT+WnFWVMXrWP4zZ4+r0d/HZefj1FolGucvvxHbl2NjM7gLf+ezDHcUcr
 EDwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The JH7110 reset driver binds to auxiliary devices created by the
> StarFive clock driver. As part of moving the reset controller registration
> helper into clk-starfive-jh71x0.c so that it can be shared by other
> StarFive SoCs, the auxiliary device names are now prefixed with
> "clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".
> 
> Update the auxiliary_device_id table accordingly, otherwise the reset
> driver fails to probe.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 29a43f0f2ad6..c936e61156a2 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
>  
>  static const struct auxiliary_device_id jh7110_reset_ids[] = {
>  	{
> -		.name = "clk_starfive_jh7110_sys.rst-sys",
> +		.name = "clk_starfive_jh71x0.rst-sys",

Does this break bisect between the previous change and this one ?

-- 
Jerome


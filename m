Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD845562A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755104; cv=none; b=jn7kThMgi0B80wSuvB7wnsbw382fW95Z0Zji+VOgQ8O/4f89Ts24Cp5dPN7QANZ2dIRwmjN4D1aPpghAVBj9Y5ZOtcRuqWzAdKLK7bfrzoFo5Bm74L9z4aCtRgNkE38wVNEfoQZ6jCa4LKb4R79XkTRKwxDLqHg1ddxjSaHyY6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755104; c=relaxed/simple;
	bh=lvXf3tpQM3sE0rI68tmiWzWdjaHzxfLtaXOKMtVK6QA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZGQE0TQvHmlZ8srZVy+p5yTOlDr02Qf2vi0zBa2FpfNFpEdgToFzvmfJICwmfketuSvsy2QHuCk+hniPKT+mj0JfHDPzG2qn0Lp3xrIf989ec8NsjM39AJAuI1/9zKj1vb30fOwJkuzIgLtHSo3pAIrM+5uTTlMyLZXNv3tell8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Aw/cfMFU; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Aw/cfMFU"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so436658f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790755099; x=1791359899; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWn2iPXvCs6SWNk89OK5OvlJgb4Z2dWAtqxQeryEwx0=;
        b=Aw/cfMFUz1EHQqySg/QqFUtjautV5Wijb88vTfz9nHiysjQpxB+H7cNKGyvjvx0j3A
         soXarMRbu9eql/0AQgSnGqmgu0riDm9vWHeyIy2qC4xtD1VR8lXb8Az1DxHFyCHo3N6z
         /b2qLXNW0Eexnsn8UUBktyqYl9AMAerMkLhVzuewo4dEvHQFaVbjhxj9YvVrOquBLZ0Y
         qnX3fLjeCrLEDt/8wWXrv3boC9uDH7bfAFg60AJFCuZiUrqAw7sQSrnTIpIh8rOHFCnp
         HnhAj5KkSSBTuyWxg146iK/W3WXjGEjr2xn703avD82/Jl+FKargSUDdOyoER7Oglk/i
         Nbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755099; x=1791359899;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jWn2iPXvCs6SWNk89OK5OvlJgb4Z2dWAtqxQeryEwx0=;
        b=1jPFwNLtUGyQUCgrur5xaTZCvMIlM5GJggQGQgN1MaFEbmEpdVRCncngVFqP+/3z18
         Wph9edmM+yJgjdGt+ghWORYSElJu+YRuJei5ys598YAJ5c1vY1aU3v2ZfSqITG6nMUpE
         f1hCBKKMq80OlLvYXxwUGtGUTsPRjlm/hj9NIjRMoBNl1bj/fybm0cH/wg3xojfrTjnT
         cDuhw+4oBd5PixzRXbqJn0GZZU1rgeTt05oJpsmJQw6FpF9912/z7Kg7r0n2VjggeoQG
         Aq6w+rgnhYRewBO6E397NO+6/TqnsBR3T/GcbJWQFCuUe6NrsmkHKTWPzMxMr8gt5Ugx
         sBOQ==
X-Forwarded-Encrypted: i=1; AKwUvByEfaQJqn7/JCCSHBXkwr4q3+nKdbbO6vtQ1nUEDm8V/9PTGEVQ59VSkQ36SiCsrGANgnh6Kzr2WP4uqR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzMw2ka1l9x1Kl4nvkXWNiqRUNUQhIs1eA3cjN3YM0dE0u2AUk
	eL3+bU0YjRCtHAHBJX47PIYDV9t9CO3RzNXYEAwU2J4Q8NncOOKjiZwfdmr6HCOA7rk=
X-Gm-Gg: AYBFou2n801nutNPNNiF3yT5/ObRe1x/0SeVF0kzYilu0wszAfC5NfWPBGyb7L6TWcU
	ydyJdFxv0ReahJnh5WGNCG6BEaiD6PM7LQ79qR+8ZTWGGGg1aIwFCalGRBIr2tiJt/FEK6Ln2++
	9EoYNtVGhXiGvwENplxwhPWFjW+bTfSamkEiQ6kMZ0uPzC68RDE7PufHVcVgmonQtyOuPwM86LT
	lvoSEL2Kwjn/mQ1Tj1tYCBA+08QgM9FW0vmvQQZwjJJGJr4Z5dq1okcJrmsk1+UCSHHya12+DkQ
	ZklRdsnOxmAFkY7UUh6pLYxj4CmuElBzYP2j/QB08YH/XqhhPrp05HCMojBpEzrj4Za+wJl+lnB
	Qx+X9kRo0rjCA9euQaMWqyNoLeliinV4oIQrSYZo8othhn53/NQk6LSoDNjICAXf0y4h0apSNnh
	fK5hcAD9iT8TSZchfcGf7QhreVD/qa8hdkbr0TVoAtsidmsD5ocWBe3/pkLZTjo5LrrzJT4ZSKA
	I3/uomg9QsL9XKrMg==
X-Received: by 2002:a05:6000:310d:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-48b0250afc2mr1187154f8f.34.1790755099585;
        Wed, 30 Sep 2026 00:58:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b028b237esm1738200f8f.0.2026.09.30.00.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:58:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "open list:TEGRA
 ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:KERNEL HARDENING (not covered
 by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b"
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH RESEND] clk: tegra: bmp: remove kcalloc
In-Reply-To: <20260929192437.27775-1-rosenp@gmail.com>
References: <20260929192437.27775-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 09:58:18 +0200
Message-ID: <1jwls32msl.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 29 sept. 2026 at 12:24, Rosen Penev <rosenp@gmail.com> wrote:

> Use a flexible array member to avoid allocating separately.
>
> Use __counted_by for extra runtime analysis.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/tegra/clk-bpmp.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
> index 067a8555c4e7..15b976162b59 100644
> --- a/drivers/clk/tegra/clk-bpmp.c
> +++ b/drivers/clk/tegra/clk-bpmp.c
> @@ -32,7 +32,7 @@ struct tegra_bpmp_clk {
>  	unsigned int id;
>  
>  	unsigned int num_parents;
> -	unsigned int *parents;
> +	unsigned int parents[] __counted_by(num_parents);
>  };
>  
>  static inline struct tegra_bpmp_clk *to_tegra_bpmp_clk(struct clk_hw *hw)
> @@ -518,20 +518,14 @@ tegra_bpmp_clk_register(struct tegra_bpmp *bpmp,
>  	unsigned int i;
>  	int err;
>  
> -	clk = devm_kzalloc(bpmp->dev, sizeof(*clk), GFP_KERNEL);
> +	clk = devm_kzalloc(bpmp->dev, struct_size(clk, parents, info->num_parents), GFP_KERNEL);
>  	if (!clk)
>  		return ERR_PTR(-ENOMEM);
>  
> +	clk->num_parents = info->num_parents;
>  	clk->id = info->id;
>  	clk->bpmp = bpmp;
>  
> -	clk->parents = devm_kcalloc(bpmp->dev, info->num_parents,
> -				    sizeof(*clk->parents), GFP_KERNEL);
> -	if (!clk->parents)
> -		return ERR_PTR(-ENOMEM);
> -
> -	clk->num_parents = info->num_parents;
> -

What is the benefit of doing this ? It looks like you are just trading
one alloc for another here ?

>  	/* hardware clock initialization */
>  	memset(&init, 0, sizeof(init));
>  	init.name = info->name;
> -- 
> 2.55.0
>

-- 
Jerome

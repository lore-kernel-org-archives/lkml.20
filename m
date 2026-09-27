Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA231E832
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524981; cv=none; b=Xb4WVEfarSDYFy/lSZ4ILN68syTJr+NzlyVbR6PUJCbDngvaFEQ7by/9PR415vNImMHx8woPiKG7tJ2mfVs7I8/niEGejErmuutxT8gdK2EtrwMoHg0IKP3dedxeBqsxcp+pGRvnj2BoRSod9HUEWnTTCJH0C3sAytArHb1IhFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524981; c=relaxed/simple;
	bh=hjJUFq9Qq27SG4MmAUZ1qN1fAS98vkbO3WcGCKh0AEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fQF9w9X/wiCNUUJ2jo9ien6gN5ZIpg51qTtFKpGEMiaHXCKB1T6GnP4dhyhI/icJk05/arMngEeNJhgSgbVLIEVX5mi0jbf3wob6CPd/vp/S1vVAxE8e7DsR6DULw6BBHu/MGu40ZhwiWcZs5usUEaHEmLv1zNvGpZrqK5zdzdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=O7HeAZBU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="O7HeAZBU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so11895015e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790524977; x=1791129777; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYQzv3XnB4eGBczMg+RylH9SGrdqjENMMi3iqbV4/zU=;
        b=O7HeAZBUdpRb1PYmn5POk3hYnnDGazF3h1dIHE9FIusc6S9+IDkb36d3/iZywr5isa
         cWjodYa1Y6HArOD8Bf0Xk62hyW9VlFD7MrHiCiF6XA0WzWvTnhNKP/5x6Qa6uAP67cGi
         Fvs3Mvi+MQ3m/WNT+ZnY+iViGUlymzXTjms2l4yQEg1cNQ5PuvEFuMW1vQkjj+faiWbj
         ZsrbuNhoGreIGCfd+Alx9CjuKQd6b7UXtlmPxSahm6ARQKolJgXp8lIURandfVWpNr8n
         dU0wJjkkDFXyOR092cuaAx8I8F6JaOYJqDh1qfgPMkJKIyw6Jx9Ku5Lt2BydmCiHrgJo
         ZUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524977; x=1791129777;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYQzv3XnB4eGBczMg+RylH9SGrdqjENMMi3iqbV4/zU=;
        b=To4qd3EcH0IiUBRVRQrDTLBNSE/00rbgQf5n5/R7MJOU9sMCLEgpjJTWJ8G6XsqyOS
         X/MAqYQAtzQrjEt5hevnUCyt+tOyC5O+ILXUI5b9VLkX3c0wvKgxKAG/SNiM59BMKlcb
         h3M5c/+tSaCr2Z2O3jGOltgXj06wAqgqi/zum70ZUrCwrnhGMGgygTlHkjJoD+dcdwLT
         jlz/KZLkmi+ksK3DYv5LDCO4Nex9oUfbhauP/sFENbTA94RKztyEZX8iWOcON5n+nzlg
         Yu+W25DZ82fX0+Sx3F/Y26KIOJ+3dNdti7ZcMxHBLZfSYDxYDJ3gTrXfS+U4IVdqyi9h
         afMA==
X-Forwarded-Encrypted: i=1; AKwUvBy6LHFRJwNxAOVTNQuTXgsaIN9OhOykVstmirnXe0U61mtPu7/G5moonLMDE9nAl7ryHhnGeo4zr4bvJzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mG6Gw/JL1yX2xEJPSzH7B60+mBR8OvVJRNO9GqJh5XTz+LGaUt
	FFsIEFw8AGV4ir9b05OIyjeigd8AB7c8olnEveEsCF8hhPxtE/KAyVEHo9bJgb7EUMk=
X-Gm-Gg: AYBFou0fVMCeeaQpyv5n701GHC43UePD2YaGP+6sx9gCX6mSI98mORrusWrhQHbFSNS
	7reXmJXL4SNfG88xDXUkGuwRQAkSjXJHwGVZpg0zxItTXhQoWNcJPk+xk5AE4C0A5qddWTe5nl5
	K/jePrIs7pIVCWYHBgiJ9Hcn2vJ+KfqVXQVcPUTnQM3oxyjtayH4udx8EbjXXY5ullY/d/meBDY
	E8OFKKjXa+UyO6UZJgusHjFWCgEWaqeWHA9VAvcK0L5288gBXgthjYEBwsiGpuyXHXis43SZQJN
	wP1ah4u5NSyMaudFd6iyZ/RChZ9mtKJiX5IUP2yxXiciLfdUwOxSj629+J5ogTSBt5QvUqaQYr4
	rmsvbUkJ19kRApEUICrhiiQOE58lMQzzh4zv2m/9/bp4zUcMCD/8JHJKFNdZ1tere92z9OsTgb6
	GzxgZBZ/EvFxUd913CCgB+QrD7+FWMXnLY9iL1gNIG0cc+l/xb/UxFLurDQld5KleotPpXlPW2x
	OISzfnokopXQ1ZygA==
X-Received: by 2002:a05:600c:8b65:b0:49f:fe7e:dc61 with SMTP id 5b1f17b1804b1-49ffe7eddc0mr51807745e9.0.1790524977389;
        Sun, 27 Sep 2026 09:02:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm65282445e9.14.2026.09.27.09.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:02:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>, andy.tang@nxp.com
Cc: bmasney@redhat.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com, oss@buserror.net,
 robh@kernel.org, sboyd@kernel.org, lkml@vger.kernel.org, Wentao Liang
 <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qoriq: Fix clock reference leak in
 input_clock_by_index()
In-Reply-To: <20260915042829.1725639-1-vulab@iscas.ac.cn>
References: <20260915042829.1725639-1-vulab@iscas.ac.cn>
Date: Sun, 27 Sep 2026 18:02:56 +0200
Message-ID: <1jik3qadhr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 15 sept. 2026 at 04:28, Wentao Liang <vulab@iscas.ac.cn> wrote:

> input_clock_by_index() obtains a consumer clock with of_clk_get() and
> hands it to input_clock(), which only uses __clk_get_name() to read the
> clock name and then registers a new fixed factor clock.  The consumer
> clock itself is discarded without clk_put(), so the reference returned
> by of_clk_get() is never released.
>
> Release the reference with clk_put() once input_clock() is done with
> the clock, mirroring the pattern used by of_clk_get_parent_name().
>
> Fixes: 80b4ae7acea4 ("clk: qoriq: Separate root input clock for core PLLs on ls1012a")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

This is PATCH 2 out 6 but there is not thread, cover letter or other
patches. I can't tell if there is a context I should be aware of.

Please check how you've send this. Consider using b4.

> ---
>  drivers/clk/clk-qoriq.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
> index 2524c5c0eb46..2ed8f93bc861 100644
> --- a/drivers/clk/clk-qoriq.c
> +++ b/drivers/clk/clk-qoriq.c
> @@ -1135,13 +1135,16 @@ static struct clk __init *input_clock_by_name(const char *name,
>  
>  static struct clk __init *input_clock_by_index(const char *name, int idx)
>  {
> -	struct clk *clk;
> +	struct clk *clk, *ret;
>  
>  	clk = of_clk_get(clockgen.node, 0);
>  	if (IS_ERR(clk))
>  		return clk;
>  
> -	return input_clock(name, clk);
> +	ret = input_clock(name, clk);
> +	clk_put(clk);
> +
> +	return ret;
>  }
>  
>  static struct clk * __init create_sysclk(const char *name)
> -- 
> 2.34.1
>

-- 
Jerome

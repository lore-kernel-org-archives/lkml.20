Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794676574;
	b=3jfFMCnxH6RC2agpOlfUF8kZK/Ls1D4lFKiCa5SAxgZ7pPKHlMeiCreta/+IUv84GOdI
	 e4WLGqx/iv3b/2YUr5G93WehM/FJ0sK63V7NRI/+WGHhwxX3/dBZOazlbVFTXcuIFlqfx
	 FDbcwa7/wR3FzQ2Fen9eDkz33FrRa9ScfRBTphsPgH1RNrOs32qhy2NwmAHb/9OcsuSOB
	 QgknN8AWlu2cKRD3vOOAjg5cOBs5qfcMgm3J6m2TOBu2jtM3UImOBamqEHzyfVbdcbSc0
	 PcqK7798csO/VfWtLRrRBrKBgb9Gmzh7nWnwCONGCiOIyaeHK+RjXIF6HBbB/+8PplQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
	b=4oVwupVHGCoJoMQiwde4il52FcUYdXsQqrFRpKZBY7XI7a+Q95ePoSeUVkVpekjpNPpa
	 1E7h5zFA2MTCQDywR3pjFkQYLDDECJ4Cm3h3u0uUHinwAMMhfpKdJ3XORFSMNAjq8tTO7
	 //0LX+Ghj7+iFN/SoK5osQy2ZDYMq5JS3UE3DaUeGEWDbzVQwXyhEqKsbmQi09ErMawfd
	 E73D5z+mhENCa6G1GaqFTJOcsbZHYgTxbKIZQ3wCO+CCJxxtuXtGg3Koywkz1iCw7SQu4
	 iF1r+joNAzjgWwG2e7y5Ei+6kLfGomHdGdsvEBrzpDyoOHtadS8gFHVj4g2hTHditEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uu995ZBS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652E606A882
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7652E606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uu995ZBS
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso22536271fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794676572; cv=none;
        d=google.com; s=arc-20260327;
        b=Zypn/E4hSl+HsMEgi4RwGxkRTPBxS0tuxYgnkSbTwK/9wic1YwsAqFPqTqSnIn93pH
         BvIxuZUyvTUrJp//pC4HzhuBZis4YJmfBhzlnXUTN8DO6nH3xvJqn79WWAxT4hMGRfZo
         qQ6j0VEMn4rmdbXmyCYpEYlkq8W8WPRVm/T7ppS5qTfaE13YuujAylphfZgog0qf7vWj
         1e1Hld1ikDRiqKInAyKpvhuK2JJNrZDJg8PcEmrFKlsNom9+saCLBTsLeUG6APp+vuwL
         /8xDGIBe3yZKbJ4lDKc3O57fwehZZcdzSJEJ0GQbF8KIS5q8nLcytdxWsumsVu3KFsYm
         a26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        fh=vOCSBQhv1Evn7K4j+tniziHYyZ9J6ZaJPRJimOTJzGI=;
        b=s0uMbeKNAcDiQveI3m7kZ7oh+04xa9OCDMFg6NrDqtx7SkmjqqQ6scPWrMRK9vB7fm
         UcgMDcOuiZFc5dUl6eJcxIMAFigwsQLN4/teK4f2LrAEFc5ra8ZJqFqxq5b3eZWbYtTc
         BoiqHngGUUMm3IozARQJEJMvSiYztCYalclBTXGCcIGKAP4aKCPfFoUlzM8OqYcYvlIj
         PZAX2DlB3RvkP29nl+CMBzYo2zsWdLKJNYSbTfV1be9mRn5BzRiY/lAoTtmTu5RzK1pb
         QAz/xjOlWA5mPlr3ILqv3x7f+eUNDXt0fzRtmP5IUWGQZiOV/tkSHlHD3NRnn+LabQxC
         wA0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676572; x=1795281372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        b=Uu995ZBSYhVk/ut3/p1P+Cl0wRRbF8bK59Cz7xgSi5+2v6nWcu2ZhiE3nyXDOvQ1Qy
         dNrB221bQZ5ANxofHUgDBI7tcl36ZS4Ycj1ds6hMib8DlL6G2xJZ1+5e0C0mK4oDhr0y
         SDAGKDs1KLAntHl25lmgVL2N+UowpjXw6x4Tu95iRo0EIhfzZGgQgDgOam6qdXIitoXn
         HUzbEEdNlfeN+JlcUhajAIuEpmKFyw6viWoXYWk+q4VUWtur7u1uQH64iix5MP9vjIy4
         LkrSrNqAoT8yJXXhbxsnC4uYKSabcLnzuinvhK59LWcNOsyLEPFJFFhkVtg2SIh6DgUT
         wtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676572; x=1795281372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31xlbb6hx1eX0rC5HvEAM3/FqjUjtY0Jax6WCFj+W3o=;
        b=03YiCZfB2eZkHFI5Yqo3wiaLfe77BUqCXavRWBrtsvpkzybk37nO+BuWx+yNatdwIi
         akXCZR5mV7m0mwkfk0ZR2ZPZTU2+5tBGyTiG+End4kq38R3oArZ293xEgMM5T+C2mfZg
         5c1QKpzS/78FPWD0L52INCgJF2zW+7YrUzPsrU0U/YMcDPC1q4bjqITDo67MrfIi1xfE
         kq1PimmM4dze4JR+zS1VKOo4KHL8eSYGJpVqbBYTUiBep5xt5ig7JFbLKzK21tduYxC+
         uq8QwgR7+i/eX0ai/XQEktCqV9ZxcwcwN84DjleXxOlZF/LnjR+ZlvaLl2OTdERJ4wBa
         P5qQ==
X-Forwarded-Encrypted: i=1; AL+hErHGpFJRngAZdQ0lRW2kqItCBQZgeWZsIwx6knvzdL1Dg0McWOGhOv8P+asr/xIAXnPWm8xqbSH+YUSGGM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z83L8AbGky0ySIqr4YYV74EfwIlhjSE6wS4nX+ZdwMm8BpfRu5b
	LSunsJ1GNNxDq+cUM3yNLvI8BldlgJjcjwEzyHC1WsHGxcPKkbStUmlhKzsC6wjU3/hFsiOmAfQ
	vPqRwbX/BVgijM3MjVqSG1JMWb9ofhUc=
X-Gm-Gg: AYBFou2YTzEDBGjtMkfCChSrsgKNrG9ldh1zvtamy5CvhoTx+b3yYiSBvwyCM4wfIKq
	K7KsbmNKrOEj7Sd8HOEs3xUniPusPfQ5Hm3GCXVm5CpxdmDAo7OdI5LaxdN1u9GiEz1qfBy7tdv
	FJ7oONw2KWRfuL7t494SQlq8tYs38zop3imeWnOIzqsOO9Cno+zRsZDaHGvAHmE7p/huTFw1ou5
	XR9jY20QS6i7jVuwH5JjlgIPxNEXzkZte96Tzx+ovxnWIFmG29AxJm7lS/9uFNi6p0yqBqA2wmi
	S9IghnoI/YMA5LaWoSNhJ1QQVE2PBfn+63y5b/mwF/+qopcqehFhx7r4arCoDLfh00h9uFN7dQp
	KnwKpObYQvP0RA15nRqN0xtHXvXgiydd8gP7eq3jOKlIpB0YGBqH/Uvd/ILLuXtzKyeTSAyq3a8
	vmbNExfdAIcRPJiDFyeESxOakcPg7BTpqx0Ailiw==
X-Received: by 2002:a2e:bea8:0:b0:3ac:fe79:5a6f with SMTP id
 38308e7fff4ca-3ae2b42eeadmr21400341fa.3.1794676571309; Sat, 14 Nov 2026
 09:16:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114095335.1283016-1-linmag7@gmail.com> <20261114095335.1283016-2-linmag7@gmail.com>
In-Reply-To: <20261114095335.1283016-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:15:57 -0500
X-Gm-Features: AclHuK8pfoOdDB1dTXpJvk9VU3VN7aUD2aIn22xx6EnrehJ7wih6FztmrukmuUg
Message-ID: <CAEdQ38HoFs7Mf65EcOSwLOYsXcD1KrTFkq05gnU_GmXGpYVZ+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alpha: parse early parameters before reserving
 contiguous memory
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:53=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index 9fda01b73b18..c7b7ebcc47b6 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -579,6 +579,9 @@ setup_arch(char **cmdline_p)
>       if (alpha_mv.init_arch)
>               alpha_mv.init_arch();
>
> +     /* Parse early options before reserving memory for DMA CMA. */
> +     parse_early_param();
> +

Once your jump label series lands, this will run before start_kernel()
calls jump_label_init(), and any early_param handler that flips a static
key will trip the "used before call to jump_label_init" warning.
threadirqs and randomize_kstack_offset=3D both do that. We don't select
IRQ_FORCED_THREADING or HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET today, so
nothing breaks yet, but arm64 and riscv both call jump_label_init()
right before parse_early_param() in setup_arch() for this reason. It
returns early if called again, so it's safe to add here. Whichever of
the two series goes in second should probably do that.

Reviewed-by: Matt Turner <mattst88@gmail.com>

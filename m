Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746650;
	b=w8aW/N/GQrL3OsyE0fV/ylpMhOJCuwVSvHGr4Q/9VZOmayMyJQDW2q4fUQnvxmv95zJO
	 Hj+EYgC2tZuNkAaWsq5aM1HE3BSnXELaRXYvwHRhEPCCNc++ObItUq4i375q0jtApkk6M
	 nqjqYZrAjwFlaehCHhunHloiPvmlyJR8uc3QkX+3QctS90BLJ+hSY0y9wJVJzw+L+ulkk
	 N8A1oaS5q3GhXOGo6/u1eRUFOtUiX+WZHBZTlA8+cXHhKR493GU2SgLeq/ybfzFCMbpwZ
	 wloBhGkqV1Jd573sUCY5Y0M0YOgDGFi/tl2VBwMU/71mjwdxWjYUaE7c5WD5i2KmvHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
	b=vgVT6EIuBp03DNxzJEkmQb4VT500ihhsxEPTuzXIrgQQO4MqB65MpAW5KsLQXgVDs8TU
	 Np3oVYmBv7KqLQs1mxGZ2v5d+EYffBIlaQV0IdAfXLE2bboUJUXoLFxs+BFFXF0b93R7P
	 eZnGMY31pjv3OgnKvx/hxcshEN7urx3bJQ0xTPRDYcAERsjL8U0E2UL1Tte95dQXuWMcy
	 BXYOyIWDvr3gTaY3e/YC2dmkJgKSxHc9nid0Y4X+2J7LCyMlBxhKLTpt1w/JL3I0+Cppp
	 OxsYanUz9zpksWh08MycIa1MXJArgaBLDsnInA6ktH6FJIGBkklprZ4zEnDS+RKyqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn2YXEG;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B5F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn2YXEG
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1212989f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746648; x=1793351448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
        b=Pbn2YXEG/rXrfUeBygvLj0POXdzY0Tnwaufs6IOfsyh+72cx6EU0qZmQ6wPL+QL6Tz
         rlAu7ZbVJekIeLLzIVX6D7UNR33vy96PR43DS0LqjT4HM9b4YQn7oHzchOijnf11FpS4
         EnZOCUYWilwSKVDKgZFe+sVWlBDTVrNfHFYFnRxBmd1xhKfTAASYnT3CP0BdJjKTW00Q
         NHZOWTS5p9fZFwmi+b9Ok8ChNKELCdXBnNAh0ixKiFIqQCK+VOATwZNYn/njd86KTwTq
         RRSyY87JuOScGciBuE/F9YUfAXKIXhBpeYN/kJf8APs8X2Eoq6t75dHMEU0VBRKdQtnw
         oA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746648; x=1793351448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iks0aFSHOkkGNM3nhF8ovnYM+3HT6MOjrI6VZAWf4VM=;
        b=BFmMzMOU+5XmM/OjBiPleVcCWL3XBR45+6D5xr9TCIgVnMqcJK2bVzgaoefMygLCwG
         KnkslYA8PHElYOmxapJGXSl0Non7QL7DMuG18PTt4Lp1P2n7O1dNLcw/qeNpRkw1NRsM
         ikapYumCQ8VTUyQyv7HXJbJP47uloOySjsEChc27TfMppiavz9zQkizTfzyeEr29ZfXB
         Ojqx3tYF2lmRSWgC/ApVzwWLh6eg89IoOhuM0I5iatRF+ffNQ2WKdgWwcjVhyljMmELA
         ypcgMWBGVJ3vA8/ZFvqnqNN6jeJY7FXQl5m7qeGhOeH3z1zz3u+4yHwZzl8PRi01QBhJ
         nmGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcgAkInCvYNq5URkMkLxPmc+zF2c2wvz+xBAAoAMWgypmtstmk3zpzgAOqjkes9komjRCzGZadpVQHiFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBnKZuNOQnBOdtidkZBKocHUmjr15LFoKXWwmkSWrEYS4zOO2L
	MBwIBMD2is/TR7AHLh9bU/hTVSA+py/cDtLnrr0hbPp8m22176QqTqv5
X-Gm-Gg: AYBFou3lf0Bgm0jCmqIWb72hSs+6XZLjl0jBuKs1jDu/a36WqNjz6X3OocxSwfoLc3B
	TKZWR1fmW/Cl9ay9N0bt/KxSxDgeBAz6hQiHCuf6MYGt2Cma/NCZoFq3G1EleCk0l4jTAEmSfC+
	fkJTNtFO53kqeDEj6CeqrK403RphZTlP8TcHgdlLKsdgQWxJTv1Vm4McKg1Q9yNUTcxr2AYxNn/
	sr0GePDUmk6irJmySiYCvGSyQXR7G82N0bfEpiSxdqZjiIqe75fyNO55utYK1eX9u76X/q3qkho
	SlmpjaStWLa48YCc3J8QOYbtu0czaWatHBGmjJ/Y/tK3DbyrF6BoGzMe2pvDlNqhbU3N0o+f34z
	uANhFWQ2NiQnmBU8k1FKccf4p3BwK5GED8w9yJth04k2SyZ2m/eNhRHu4DguImcEZdIYPw55Qnp
	4I+gqazZ/jMRVCYAkgveoiUhG6/HOXm9py2Y6ODQqCPQRKBR09XHQAC8WYLYu+wI5iNNvilJvVv
	m1s5+pWD7XqNL8KKRVLUXZuXWq9QVCr/gaia+mY2u8ctgPlNLKMldUSaww1B3q0ZAUkAiiw6txj
	z0HAR8iXjdkXiZaE19CMQq3HisZmDX7t/TZuj4dYAiClj1sELjx064GI1aTEQedm7b4vobwdc/N
	GAGBvZFAGlZAcFwmbGcF9fJhRHXAUxqjC7BA4Mxe1THO5fM81lcyKNIbRkqkxGhTQNQZ4FJu77F
	35CxUxq/KDNWBZf/nXwZ4ih6ILZvnAzumbjyNPqE9qUgrBgBYWwxPq0ZdWtSlqVw==
X-Received: by 2002:a05:6000:1a88:b0:48e:884:affb with SMTP id ffacd0b85a97d-48e2d273444mr10748908f8f.24.1792746643235;
        Fri, 23 Oct 2026 02:10:43 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3803360asm3931375f8f.29.2026.10.23.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:10:43 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:10:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jesper X Nilsson <jesper.x.nilsson@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Stefan Windfeldt-Prytz"
 <stefan.windfeldt-prytz@axis.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@axis.com>
Subject: Re: [PATCH 2/3] iio: light: opt4001: refactor driver to prepare to
 support more devices
Message-ID: <20261023111032.0000019b@gmail.com>
In-Reply-To: <20261023-opt4041-v1-2-45227f82d05c@axis.com>
References: <20261023-opt4041-v1-0-45227f82d05c@axis.com>
	<20261023-opt4041-v1-2-45227f82d05c@axis.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Oct 2026 09:48:14 +0200
Jesper X Nilsson <jesper.x.nilsson@axis.com> wrote:

> Prepare opt4001 driver to be able to support OPT4041. Extend struct
> opt4001_chip_info with fields channels and device_id because OPT4041 has
> two channels and another device id.
> 
> Datasheet: https://www.ti.com/lit/gpn/opt4041
> Assisted-by: LLM

This tag has been deprecated.

> Signed-off-by: Jesper X Nilsson <jesper.x.nilsson@axis.com>

...

> @@ -388,19 +411,19 @@ static int opt4001_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, ret,
>  				     "failed to reinit regmap cache\n");
>  
> +	chip->chip_info = i2c_get_match_data(client);

+ null check and return -ENODATA on failure.

-- 
Kind regards,
Joshua Crofts

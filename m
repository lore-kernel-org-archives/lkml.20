Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDB433936B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437191; cv=none; b=FHd5Xq4KZiqzT3IBTifCyhDeAdjS0xbFwoq3q6s6B3dH27ac8vwa/AImmiWKxccdV9jxBq6SPcdxfrOw9aTpAxyo9MKVmuxk+4oDPCpFSLi3gwiFOwFxufirKTunnzM0Fx9XF/2KnAekoIoZn5kBlXoUwe7wrUMCzKOF6mQAzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437191; c=relaxed/simple;
	bh=YLhZ1J4p3EUdKxhsg9iYuJO51jHcBUEBJC612xT7c3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJwIidpZD2J/hSEe42xIYMi6xtVx3C8tofOD6pN/xRnrwBrQYIj0w5pIsgt6TZ3iMhLwpEek12owURB6mIjZuESNvfwI4s97hwsqQfNc9FT5lIeuh+bczIA12Co+Wq3j+UPQp1v7z2oxe104lK48REC0IMgAVu4exnuSbdkAZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc5GWSi6; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc5GWSi6"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7981646dcd1so726819137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437189; x=1790041989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Jx0gqCqlP6JSyM7YNUSbMymSXVv7Wb6Hva9YnJeBQ=;
        b=oc5GWSi6ruZgDn+fmMBFLltiANvq9YrwHR4NcZ5Sut2pjYxdQFpNfSSZo2HfYFMU4V
         51q62O7mAI/E5+1KY25tmuAX39JaDrk1Ioduvdk1jJbpw69hz40r1P0ts8xGJRCK2+jO
         dn2f0CdxgvxxAAUrZG43EM9yDaH6oI4W0LBzayrxz0WqYc8JCjNrVfsRFFZQLxpov+jA
         ++/fB/S6C+Z8uvnG7dVHTxU8TWVizBIWvjNn5ChE302E00AtB/y3PW5XsPbZLZzhf4EA
         uWb6j7QR1f8xCyhQ8S2sEyHURWqjHobSuKagyLvIP0FgoAa8AeEmsNah4ZEiGN5ePt+o
         3Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437189; x=1790041989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Jx0gqCqlP6JSyM7YNUSbMymSXVv7Wb6Hva9YnJeBQ=;
        b=dNbXReGWf4X/57tWKMVLPB5S6JR9uYprCH0UBxZTXH3/d3qUV1QIdSdl2kIV6iiNax
         w0uDABCGrirgbJE5xuXaimA3zMCJr8HPLiijLHfMjS7mupeYlQ0itL6nzjXhspnN3ufL
         He7nP2RvlqEDS7Dhbzbd3n3ypoLzuKsf8Eyf0j9UgAYMkTlKr6LBx7390ikA7h545R59
         fVFQQ13+GSMN4nfkUPFngemMju6YFAKpvvOS3ibpQ8XNcrEl43k14+q/QyJ1QpIoOxUW
         d8Et8UL3e+7q7vgZ5eg4amH5i1Y3UGcftL6vR5c9OpCqZo5MQKjsswgMV1fPsuZT1szZ
         uwQA==
X-Forwarded-Encrypted: i=1; AKwUvBwlXKYYbx9ZJ+vOGrDuqhpux3AEo2Tz6MOjMBZKcglO7vFZmDaGz+8xlz+LwAQFB3eTbTXf3JpUCxCaqDg=@vger.kernel.org
X-Gm-Message-State: AFuF++mO2b7xGJqmLcv5b3glB4RleEtlm/QTxV6XEhrzBEXgnmjFJrte
	sgPFzf42F0Wg8KZduyOKyKNoH+mLQc0/hfxdF2IO5h0FRa+zrcIETNj6
X-Gm-Gg: AYBFou1lqU2KlctFJ1HavmS/UOwiFc760LTR5em1JTB0rMmjfwSlrFNeGClv7mmCHAl
	Nnh7R/mcCeprLWvVWdu8ybvyPWtQ8HOy0obPeVVfWMqWarfQtpL7pwcf8tMkFUjbpWHo3AsAocV
	0smLyjU73wxYt1FnhxfO9m/q1P1JasXdfH19PKfmyrFoOhAZZ031p25f7WddMw1biLoZM+CzjMB
	cIG+paCcsw4XV9GVaPaE7zdN3IFTfVIjj/p9TySAHK2J/550q+vlA9dd2Ozuos5UzE7iQVoXrwh
	eTfM6cVDKzOm0unm0p7fLDZfR8g4GRQPbrTUlLYT2SyBeh9ugFyv+sJU4l7angfjEIFBWa7PjzN
	22OyRkxO2EH5tqMLC+m7Ehamkr7X3F6kMaDrsFGPsyMXOAWW2mRk5QlyU0Ck+oRp1JZsoYkha3U
	+JIJomvEtLaYEMePPmcEHNlp8Pd78IqEcji6N5Uw0IVJ24S33okdrqP4umkf4lJR/e8mHtw2dut
	AhKFw==
X-Received: by 2002:a05:6102:3a0f:b0:79d:63bb:249b with SMTP id ada2fe7eead31-79d63bb25fbmr1122940137.13.1789437188656;
        Mon, 14 Sep 2026 18:53:08 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9fac504sm13361055241.8.2026.09.14.18.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:53:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:54:07 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed
 APIs
Message-ID: <aqilP8FSTmrLpqEQ@debian-BULLSEYE-live-builder-AMD64>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908172359.30003-1-mdshahid03@gmail.com>

On 09/08, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Changes in v4:
> - Move the ADC enable error-path cleanup simplification into the
>   clock conversion patch.
> - Simplify the ADC devm cleanup action.
> - Restore the blank line after the copyright header.
> 

For the whole series,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

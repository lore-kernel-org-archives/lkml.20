Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617E47CA8D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629676; cv=pass; b=Tj1hYEnAjOuwCNeBCeFeX4oDtaV5gp9acS1DM4phmSkdAMForCU/TE1j5jSdIvo1cfzpk42R/uFX1eS0uyAFPktu/5nlvK5TD9vIYqmGrBOSifHlMOTQNl0TNDbcEnA5GtG2kD9/uXc/1uk1fyjdtw30w8wovrM2pAR5R3lr/Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629676; c=relaxed/simple;
	bh=y6msfbNFuQcpgJ7i9i+gI5S8bcxxgxGClBG3WW+qGzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKxXZjfxPKfkUENyWcQi6SLyfp3Cjr2KBngBlT2Au/24ZCsciwobRAIouakbU5Mbkwqyy1SxS5mq3I+LzMZkJArE/oBOq1m/rnfdyJEhE3RhNtqwqNAMhMin6OpEk/FxP4yCmOL8YxiXSxwFlA4OfNGy/pp3k9KihJdDaKzyHAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiOpfAnt; arc=pass smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiOpfAnt"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-492d8c4add0so1884998fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790629673; cv=none;
        d=google.com; s=arc-20260327;
        b=DenryMx+n8uegcEyr0f3VQoIwUDXf1jsFY8S7Mz21zTemjqjLNvjHY0u4ZjgdBunXA
         LTF8FgEDJ1/H/+89GBnahQ1VXqSaqXeXWHlmZAq1mDS9Ab58rHgo/mtwaOy7eVd2sH9C
         67HwELcyE8rS1uoAvP9dEnHQGteRAjNfxKIQ8/mxyAO110/S0Kixno167eXlokuiMuCL
         qHy/hyHQ5NJh99zksz2mqZzyzm7lFW9IzpUHcOpbQtlr9pNEg7FI33SWOyDg+jicR3gd
         dmbJn1Lw0QMbB6rWGasQFHhFDPPMpfvpdal0qRYkKKN6BMO4yqFadnRGK9Qnn5Az15Jp
         qfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y6msfbNFuQcpgJ7i9i+gI5S8bcxxgxGClBG3WW+qGzE=;
        fh=HSRAVrvusg8pFpDNtK39d5SV6WinhmU6YOVbRACFUUI=;
        b=s68SzenTAYOVtf92RffNJgtKjeQtTMvhyetWU5/XoVxQqktaHxadWlZSQ9Sdgf+xZr
         pcJxEuv2n5uMOf3h81NQp1Hxi11WK8UcG8TCfsVckkIuYUIsWy1GzPG06WOoBBieerV/
         S3E4R3zkui/i1xxJ5XK2Nh5jVs8rTQcVl7DcbnnDLR+IbGylXl11WJvLRKDvF+rep9A/
         s/Qc4sAdH+NLjz+/rjagj2XmxF398TR29p4BLfvxUWOtPSv+W51qSQ2zJfuAga9WKoZB
         Ed523zAFM3mfWTmbYqn2WyHOGS9i5jju7KeChA3qwodtIqS0i7IuZHMjJuXkFDgtb+0x
         zlvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629673; x=1791234473; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6msfbNFuQcpgJ7i9i+gI5S8bcxxgxGClBG3WW+qGzE=;
        b=PiOpfAntCZ8yLPGEeKI+hyFBkvuihK4h3SMkN0//sQ4oh4MFs9l+OC7i1iAc380Uy3
         OnZyBnCoPodHAXb34xATDT5kyc7bsLf6m4rWYCyLxpVdQ/QuvztXl4wPDjNS0NWOCAkG
         t++l5Fb+kIoXz47wu+S4vDU1agAugdHSGWUBhvmHCMfQJ4k+mrrirm57KQBRvZ+W6I8s
         ZFeZcEVzLL0KLbQqxKi5vm7KssnsxO4fUC8REFJNeDUgsZXClUOzJTJfOkTIehGCrUB3
         yAhV91D13gQUb8hCJpYAumFf5s5B2ksA3H1ptMddinnH/0mqzI3q7lbWHJX3WKgBky0a
         cjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629673; x=1791234473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y6msfbNFuQcpgJ7i9i+gI5S8bcxxgxGClBG3WW+qGzE=;
        b=lRBX/GV/y4JL8JKV8ltiKb778scLyKeFn0l9CvRwpr1mwFUv/1etKYdE2G0aWOr3TF
         0dynEbj6W1RlgfT/UUtg0jEkHgVjee7aid6pExQ+/fb3ZcQEs427np9WHM1ykjCZDxtZ
         f1JBUxQB2u/vnXBRiqxmk0tiCh5XAcKOJxf7UAjBh5rW9U+JcxVgBA1OQYE0Su9H1Qrh
         ADm3fMjBaUqEIwHK0Qmzb335ydF0UQz0LLVrbJ9yt9oJK2Mo0zdpYB/u0cRqLZ6xm/R2
         rM9wlfORytTC2mmGoGtlkDTpU0AqTsFmm76FKLpZcLVWR3BI9nX/rgZnYm5/jFrRfp5h
         Utiw==
X-Forwarded-Encrypted: i=1; AKwUvByafHB+plo6BxzWOgeGBpg6+NEYxTL7Y1n4BkxN7Wk+K+BqaIA7p7L3LoJKG2/Gr+aI1FTO6wx5YyFejTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mA9YqO5BQiaG4XSnEmX+0EBjpOwVbztEiVGdMpjUS84+KfQpxE
	SonT8g3rl/IiOkct3YpddBtLPWxzeaDTlupfGeM3DjxMxtnUfLf0Pn22u6nTGhRa4voikVb4FZB
	vkgNRUiDbaYmWLzsA+qLq2EABozUKdPI=
X-Gm-Gg: AYBFou0N+0xMj8Yjsb7zWDgv7iMMIoVdsQrKJrsacYiWkexgATGdOlN806ft38Scd98
	V0GjqfVQXNqLXCjQzY6PAgrEHWKnjWu9LoS35+LTCzCiUkorSIEqgEIi8PamWx3IK86REj3Wx9s
	gQdHY7K26DMTO38V3KFnK4bIGi/LNeswCoJqa7RQHkzxodkEBOasz9ZFMuUgvcObimWp3wUpTqg
	wGbOxEmgBoKFtR7TxC8f+37umxIt0x72Yh6idZjqeQsGzkY3EAOaxf9hC0/jft8uIKwJXHX0Dkr
	wNTre4F0JWTQFLo7w4is+HSyIbm5gmr7752GOROSh/wGftbzInW31gjk4UvcB1yIh2ifbfZoVIP
	7uGxBGFcKQ8Xg
X-Received: by 2002:a05:6808:198a:b0:4b3:75cb:b856 with SMTP id
 5614622812f47-4d72a2562e9mr16552925b6e.9.1790629673450; Mon, 28 Sep 2026
 14:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928142450.103799-1-vidhu.linux@gmail.com> <CAHp75VcW3ADQdf68Whmo7yhqu9rdi54YVYgyh5PRLPccH6aUBg@mail.gmail.com>
In-Reply-To: <CAHp75VcW3ADQdf68Whmo7yhqu9rdi54YVYgyh5PRLPccH6aUBg@mail.gmail.com>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Tue, 29 Sep 2026 02:37:41 +0530
X-Gm-Features: AclHuK8JYQr6zVy-MVLb9YJgMPw7_y1Mm2flQRhzFloJn7TG5F9PXG6HsjEjJBs
Message-ID: <CAFqz8LL0bgOu3TKfxz0Ri=qw09wVHC68CbVS2yZZjv7oKTGwVw@mail.gmail.com>
Subject: Re: [PATCH] iio: humidity: am2315: fix negative temperature decoding
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Siratul Islam <email@sirat.me>, Tiberiu Breana <tiberiu.a.breana@intel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,
On Mon, Sep 28, 2026 at 9:01 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Can you use sign_extend32()?

I checked whether sign_extend32() can be used here, but I don't
think itcan be applied since as per datasheet [1], The temperature value
is sign-magnitude such that bit 15 is the sign and bits 14 to 0
contain the magnitude. For eg., 0x8065 represents -101.
sign_extend32(temp_raw, 15) would instead interpret 0x8065 as a
two's-complement value, giving us -32667.

So I think the sign bit needs to be decoded explicitly by masking
bit 15 and negating the magnitude when set.

[1] https://cdn-shop.adafruit.com/datasheets/AM2315.pdf

Regards,
Vidhu Sarwal

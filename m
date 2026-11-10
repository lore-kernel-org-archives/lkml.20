Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317764;
	b=cGnMAfQ1kkR1yyA9h+oi13zOZmWGwkk5oJbdcC5sYHIJY8+XXWTeMa5ClTjvT3KI9kRq
	 Z/5vHDP6W/o7skIP1fZqTy4sryOPKBAG4yg/TxewGOewS4vATKwAg87HTANtROSKMAUIf
	 NCJwl/v0R5huyMwQrqrFxvH/EB4kOm4ySRig9QxvFYDhSHh7MTKJub9zYoh/uENU2DlUD
	 LrnUjZyspZm94hb7PobVtjrXJJPl9P0Oc9lyyVpJw5i3O5M0cSL50wYnn66de6A4q6XNF
	 +3PpWCg958W7gFfmJcXIUyOF/hlgmxNoKa24WJjJNTX7DfH9cRa8yMqZPnooJfnYKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317764;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BePlmUzazBil0jZOyafds1nHUSQqBT9o0NsepsGpMCY=;
	b=rTub3Lu19DzP30kYoVh604o8OfUAY1ObLYbUXDdTV22v1fUh67lEyYrQYmcSN6+CX/09
	 BqaQYdcdUQy9pLpVqP6geDv4L1BRCnCQ3/NnHQzeEuzq/kjhfqZxe6uZGgNJgYMzvZ1/e
	 2M8Z7OFaVsUjjUIuWbDwjb19TexyyiguGWVePWzPHT5YrnJqpPNAgHFeqbnrTtTsyT8M1
	 JVEeNa9hsIn1tGpEawy2MHm86wElgajsHF+CKeIeEBvDKa9jAGPi2volgmKHGfTL0Oxzx
	 F5C+PDtimiH8xUJE+q7KENtr+cSmmS3U1xQIq1lakwblR0OJzs+oftmYxddx8aLldFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39787606E45C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39787606E45C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1551229a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317763; x=1794922563;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BePlmUzazBil0jZOyafds1nHUSQqBT9o0NsepsGpMCY=;
        b=QLKGDXoF5S0fzHxovfcl35YtSrpeYcnMfGzwPHACkJYHNnwnetDQdZQ4H/v+pmBlfw
         hcZVTC2bWW7IKBmv7hxds1+jXR7PpMs6C8zeI/1PLe2Z9fcs6kFpyHUC+7gA+xCWQku4
         mHMKIxIXcMz2M9IX+hv35Jo3AKuu/4o0jlXjy/zyz3tGBINvJImRJ4OwndlCRRt+iFZg
         iN5ldf7okDhehXu8rKkqWzCIpCLbQsrLjiRh71Os/DPvcSNjnCKSK59cN55f9CWgZDfM
         j1m/dv7lTTJ5X7MBQ5kuqnAQ54zyuHPojl6cIofuNWscN64mWmuAAg+bNc0Sb6WIT23j
         JL5w==
X-Forwarded-Encrypted: i=1; AL+hErEzQydgVNJfxHG+JgjX8eWBolkDSUsDBRFR+QGZ1Rqf49jNrZi2EnqUX8baPVsJ4p05akma1XC6uupYGug=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZeHcekp8ZK1LMXFqf0A0ry7mBUuthV+u/+Sur1gO1vWwCVEs+
	LoSa3w4AqvoME9UroDuKnajTBOXIqgHiIXa1ULriFg+YPhcZs6bSr6SJ713yHg0u4To=
X-Gm-Gg: AYBFou07DTcSmLsoLpF/cRuq5nkUXCHGTsxXbYQf88M5Jy4zA03MCFb8006DRim26Cb
	97IGXh5IRvkPpBgCOUCtr36RpmxRot3VnWR2iHZjB5kNhFRLKziMryGIM9ypwCixOTJqgIQT3zY
	voRQP5attUCIv82ZelY+2QNTaWHdRjf4OdiXwmUjOULsszVHV3Jh/v1clkPMl22U5Fh3wgHcd4v
	yS2al+CddQAFOQFfKd7PSh+RqBFS2BaYBPNaC7s5rkjf5haldrEGnAH826S+golhfXQktJ6HT9h
	EniXRsvlfYV8RiB0HXSyXn4gJogTj5jtLco6BKm75ayOK2j6YV7YbYbd8VMYDrS5cqrdC7LHomc
	y2WPAUIPCz0z+ol6VYs3ZWik6GLuMgyMlvjIrA7z6h19HeucXxuQiEtO3w0udybc3HxFjipnDA9
	QGy2Ok7+Xlm/ZoPDuNYu3shdYEaK9uitdzi2ZtOJiOqpmscMXuBCp75gQK/x3WDLVbauKjugR6C
	l2wzn11iaMmnrzFNkjOLEI9r3w8fFBk/8WnKby5thIfgDKx04EGoorlVaeMKWahs03s7XGnEs1O
	mqgkTXm8fxEm+bDMQ3SnJVBy/Ed6vUvFHDWreCxHf3UzhdPEaFbbd8E2okfzh3c2e+A=
X-Received: by 2002:a17:907:8e95:b0:c40:dead:7466 with SMTP id a640c23a62f3a-c5049553248mr211943266b.20.1794317762577;
        Tue, 10 Nov 2026 05:36:02 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5704aasm108692266b.25.2026.11.10.05.35.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:35:59 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3122680a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:35:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtTgJe+JfMHLHZ5cN8zzIy0W72ODnHtXdjs9dFrA11RJBS412KrbbNpqLlMkmWtFqQ8TVeOzh72x+ftqY=@vger.kernel.org
X-Received: by 2002:aa7:d853:0:b0:6b6:4dcd:968c with SMTP id
 4fb4d7f45d1cf-6b756add2aamr1624928a12.16.1794317758591; Tue, 10 Nov 2026
 05:35:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
In-Reply-To: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 14:35:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHw5mbe8LY_t9zWW2VK9TuDDJYTQE_Y5GmjNpLzOB-zA@mail.gmail.com>
X-Gm-Features: AclHuK-0srTXKsnuWni1-CcV0btL_Vd3sgu665FN-7w6sZ24vTtXz1uHDKMnXqg
Message-ID: <CAMuHMdWHw5mbe8LY_t9zWW2VK9TuDDJYTQE_Y5GmjNpLzOB-zA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 11:01, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> In gpiochip_add_hog(), parsing a device tree with an excessively large
> "#gpio-cells" property causes a stack out-of-bounds write when populating
> the GPIO specification.
>
> The value read from #gpio-cells is used to copy the values into right
> places in struct fwnode_reference_args but that struct's args field is
> an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
> make the loop write past the end of that array.
>
> If #gpio-cells is 0, we can trigger a divide-by-zero later when
> calculating the actual number of hogs.
>
> If #gpio-cells is 1, we can also perform an out-of-bounds read of
> the "gpios" array.
>
> Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS, lower than 1
> and make sure #gpio-cells is larger than 1 before checking the
> active-low flag.
>
> Cc: stable@vger.kernel.org
> Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
> Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix a potential divide-by-zero bug too (sashiko)
> - Fix an off-by-one bug for #gpio-cells == 1
> - Link to v1: https://patch.msgid.link/20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

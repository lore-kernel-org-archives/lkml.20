Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506638;
	b=OGvZq2kkZ0zoia4ER5sXwYm7H16Emw0NiC6cvB3hMal5J8je3utVW7snTWd+PqwoQLis
	 0NmBbIJTPqZbmjCBf+/659JGaSgWMp1movt1TMYisCN7bKTKICjGlV3f9GA4PCnpT8ENq
	 0a9eqzbqTf8BxRRhapzIEO3bI1GB/riDN6JVZGjZfvzcEFjAig67vwQkrdmhyzDh99CZo
	 Shl8KnAEgLIFSGOsholPnV02qrK4hC9hs4OAH19SPmUHyBCfBLpdgZectsL49QIxx3nr4
	 2dXUubC/JaeK9bWYc31c0kqX4nax7F05V7iF89vUDVNnm1akUFhzscqNnzLxDnlXRLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506638;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=s5rk30dIBimN6FXN9o9VIA3zg1IdCjfxBBybpQK7NFY=;
	b=ZAkeZpok3EGLAiP99RKpmgLKyBEods5+T1EC220ZTENUj8o+yU1qkmQlgAoXClxLGY45
	 GvuRA8ae41vYBGZFfkEcPePgPrpXNtZ747Lz2RmBXlKnpTU/m+RjQyGclf3Msdxow4i18
	 8HiNqyBAQQ586JITtOFzhWMqMs1ZqLpskSs12jnNEPwKwgxSC7dVHujtPB+Db1+PYpm0k
	 qicWuZe7FEEBpLZmjXi3ejOw5sUhTeLOnOznCU09t/rpidNRHM/m2yEh3x7O1URC8DVPq
	 jd/PdPeIHpm1Bp4KAI4vORCXKoUKLreHJ6k6kL3FBORXJx5HlWIA5NRukScX7jS5dWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D59606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D59606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5d7daf06158so1058529e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506637; x=1793111437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s5rk30dIBimN6FXN9o9VIA3zg1IdCjfxBBybpQK7NFY=;
        b=jORBKiNkZ1jMBnv6jP2g6V05qE20DR9kAS5//qUltou8WlcWkWt953mKpCOEITV3xR
         /B1EAjyqWlhkZYYyPJBYEDvzyZQpiBuR8Yfpu8FY5fKT16aSsDTeR2nziNaaNfpvH0bE
         Hroh72oGxaVyau46A6xJ+7zP5kFBRS6ejIA+65f4LIkWDgbq2ytu06RZll1pWrEVQOKo
         izzK57djBbZpG0etOKaRnOUujMFc45sIQg9r/OTr51dJ9kN/7DHLbDSv3KQ/tIGsJ0HX
         OfKsvfdopNITnw0nncy0THICV6E7fNZiwL5chQfGVj/cDiYaAaNTlKn4EHcarvRyIS/O
         Mx7g==
X-Forwarded-Encrypted: i=1; AKwUvByUQSObpZRDaBwXx3IFootUSfm7lq2itEIx01sK9/egFxRyNsiB5wRWx/to6npTS8UcXR+nDjmjHvcoCMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBQExsuoPmMfH+lDLLXhcoBz8kY5ZX2JFTh/pswfw8d/+OTUoI
	tcnwN0bIQaIjKvUtm+4mQmLPKchyd0hTu6F1xkrgFJiJEchUGQm8ShRo3ixX51xs8ak=
X-Gm-Gg: AYBFou30YDw5uj3LAKl/5niz4IlqDseRaNAmrCfj4uUaFtk//ZEWznh0Cdl9nay/RKC
	wQ0c5rHS3u6M8yA3VtdRzA0b60yWggXJaaqQqxuxnn5a3J8sPIsG0JR25ca7MuJnov0+sZ9QAug
	DVLl5vKHe5JlbUoC7oS05nbvahW7Ap/IKRpaZZEgFspilqvpfSfqUqUraczzeG8NNejqUw570yG
	X7lwnk7IrDF/UQ+gUa8pwk4HtWPM0+A5bMoUNkYUmgWGrVmGuj8Ne4nMZ8wf9JGLCOePbizoiL+
	4hl11TM7RN3HAmsOVS9US10yD8I2/ZJIJ3I/tR6SE60DFbAX9ndRLghBz5R6Qm1FiPRN137UnrE
	V8me6N1mxgldPOp2my25GdQzctJxLF6lQVdJeh/Mplj1rZVhlkM+9RkxmttDPwe/xSgE0YGkopQ
	WRzQCAwGY1Ki6BLRb9F/1eUXP1fY0Y9SMsYiNQcnuqvIADfSsWN0x8BKFVVBHrJ+a+1hsDxg4WW
	vx8/uy5aIILcat3UvZ4dIIx4qukRcSw0Gel
X-Received: by 2002:a05:6122:3285:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5eae32480bfmr270243e0c.3.1792506636883;
        Tue, 20 Oct 2026 07:30:36 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm12453900e0c.3.2026.10.20.07.30.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:30:35 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-988c7371716so954554241.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx19jNIZWidpTpehPD279txu+iPeg1OTNhJKe4mpwGnCeWV1W2U2vyj9Tw7w4owfIG1GTTcRpCDTl/Tpu8=@vger.kernel.org
X-Received: by 2002:a05:6102:3c92:b0:7b5:4700:3a58 with SMTP id
 ada2fe7eead31-7cc36a8514bmr2313996137.31.1792506635170; Tue, 20 Oct 2026
 07:30:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
In-Reply-To: <20260630-gpio-shared-dynamic-voting-v3-1-8ecf0542953b@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 16:30:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
X-Gm-Features: AclHuK_MQ7h98POTsIQIAl-vz3Fn2A2UG4Y8IpuLxRnU5t23jE3LqaX6Kfyj4OQ
Message-ID: <CAMuHMdUWPXK3eBQu+49ZURg8u01hmOSgv9e1KNYZwbYxjXFNWA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: shared: make the voting mechanism adaptable
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Marek Vasut <marex@nabladev.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Viacheslav Bocharov <v@baodeep.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 30 Jun 2026 at 16:33, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> The current voting mechanism in GPIO shared proxy assumes that "low" is
> always the default value and users can only vote for driving the GPIO
> "high" in which case it will remain high as long as there's at least one
> user voting.
>
> This makes it impossible to use the automatic sharing management for
> certain use-cases such as the write-protect GPIOs of EEPROMs which are
> requested "high" and driven "low" to enable writing. In this case, if
> the WP GPIO is shared by multiple EEPROMs, and at least one of them
> wants to enable writing, the pin must be set to "low".
>
> Modify the voting heuristic to assume the value set by the first user on
> request to be the "default" and subseqent calls to gpiod_set_value()
> will constitute votes for a change of the value to the opposite. In the
> wp-gpios case it will mean that the nvmem core requests the GPIO as
> "out-high" for all EEPROMs sharing the pin, and when one of them wants
> to write, the pin will be driven low, enabling it.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Reported-by: Marek Vasut <marex@nabladev.com>
> Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nabladev.com/
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch, which is now commit b30973e8c3920ddf ("gpio:
shared: make the voting mechanism adaptable") in v7.2. I only
noticed this now, thanks to commit f918e38044988082 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") in soc/for-next.
So far I haven't seen any ill behavior due to that yet.

However, shouldn't the default state depend on GPIO_ACTIVE_{HIGH,LOW}
and/or GPIO_OPEN_{DRAIN,SOURCE}?

Apparently Marek asked the same question[1], to which you replied[2]:

   "We could but that would require DT changes, you probably don't want
    this?"

Can you please elaborate why this would require DT changes?

Thanks!

[1] https://lore.kernel.org/3612f5f6-eeca-49e5-9662-72729bb48c9f@nabladev.com/
[2] https://lore.kernel.org/CAMRc=Mf_B+=adsEu+4TTBdKHdVSf2uWH+11WH9uz-h4Q0BS-VA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

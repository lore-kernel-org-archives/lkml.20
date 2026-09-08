Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AA3451CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861711; cv=none; b=oPo+Ua7aHK2xhuRVL4kSWTqDeFB/OntomN+NamkjdbKptFwJs0hsLfsZeWjWTete3lelwfekESdJuOQ0EAvp0n5yyDzk2VTjyskA3ZroFzJEZvpr3hJPQgBlWYhsizLGvYuRK54fIEaIJwxp5j3TY5rqhkOdbINNHFmZdKM3H3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861711; c=relaxed/simple;
	bh=7Fyxy571KMxMz2l9KXmc8erKfEp7VslXJ6d5gZZbnPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRYVpcjNtqoUEEu42tGngyC5QiFf4Eq6qjKb9aMPhs+RtU6yqxQjxtWXiCZev6aahqIwfCzjA4qgJei+wpaVeiP/8Lxiy79f0NTacnT2ojgcIaqqcSo3AHTgC1qPhRsfHmewWc1QarfKnMSjn58kT6sjIvfzbZXF7GUJfPPRRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-745497ac8fcso957345137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861705; x=1789466505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2tI/7x8c4NyE/PwWWec1lASAENg1AULIuOMZ9zg64C8=;
        b=oAiCMIq+3EtXt1C6YUuob1OZp6+800tyF8yjXbIFJyLExwSW0521xT8e+Uukq26OqI
         ZSAlZ7xWRq+6G2bBr7hJ0WREb3gEnLtFQnNlR2pEa/3hbujngz9p6ZmNHN7MKeMBa0IP
         FKBumZnwafc1ZAnw+p3tJZSZCOZ6qjYTndUqClwQVwiXWk9ppuIOvTf56RTAEMgLa+N3
         u+/c+8rRbVlBzkX9LEnoTg7S5Lys4/wQNNUeJVeWA6nBY2bbbZ6E2N8MS7fnkoSWObcF
         TJojpUMbSocIwvEY3ggrevCXV44qs7rJW6hWYjoyItj+679PCVEiQJ1OQcXcJyh5C2Zu
         9s0Q==
X-Forwarded-Encrypted: i=1; AKwUvByyjXDdUUbTo2r61rqCQFlLxZ+HdZUQsBWmXwuW40TrbU3G0230IUzyB5YatLJudmvt7ZmP3Z8rOkytJgo=@vger.kernel.org
X-Gm-Message-State: AFuF++mji6CV0nxLBl8Byc4+hfccQjhfbXwBnvK0ULWzEBPQ4eVcbO+8
	0ItNY2LdfFleG4kjXTouJcfgVjillrU3bcyTonGt79MwTY0M/4KfrC38r4TB3I8A
X-Gm-Gg: AYBFou0+a6UMW2zxpu29jWrMvZrykl7W+EqyI/47e2a4qZE6InN31dbJgqOpPoKVKfR
	V7OHXPTrPqgGX5iMAut4+GqUjn/R4ooSN5l7oV25KnksItXj18SQCodJ2/PH71v4q724QiR9oLI
	d91FsbdMylIwzo5D29ezudAco0DgrS0HEgvMZNrS43koJBdgWglZFDKyNvWJElE+GQLlKpomeeX
	t0SRQD/itY/khWn1gu1nyDWShPlT4MfduumTefomoUuc3EO6OMtGncN30zZqac7zNsRFgAn9XfS
	5AMZsapGqOpwrXKxttT94oT2rZ76TFlMPHWIK1q3sYKcofcNotIdv+0mCbNistztmY560iWn/iW
	rEP9Z/NfKB9oMo8fp2WYWR1fprC0cbc2Sr8cjpwEaLM91klT4oV2qsSkkBFYscUdCl8n7uL6PnC
	d9e+Q1iql5/ZSH08/QY6q3pdxzEjsxMHMOeCusort2OQj3ynEmo7txV9O958uN01PJ2oGZt0V81
	vhx/bp2YeOijWDNnMEJlcOV8vww/w==
X-Received: by 2002:a05:6102:91d:b0:785:76cd:ce88 with SMTP id ada2fe7eead31-78a4a67ba9bmr9093766137.3.1788861705226;
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b56bd3sm8022084137.12.2026.09.08.03.01.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c7afda4515so2553935e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6B8PzRtw3uK7UPuhoQeS7zkEW4ijjVcq5I7GRpeVkKzpJpjnWSvYmkfto9VHEvQQWwSLKXtWduaS7ihg=@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a4a6c8a04mr9752098137.4.1788861704764; Tue, 08 Sep 2026
 03:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:01:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
X-Gm-Features: AcwNN1XXZ_HyHzFSTOBPBh4qzYYojXkTSzZF4gN87445u1hVP8hGIVXwwu4oGIw
Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: renesas: rzt2h: remove unused struct rzt2h_pinctrl::gpio_range
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The struct rzt2h_pinctrl::gpio_range field is unused and seems to be a
> vestige of calling pinctrl_add_gpio_range(). Remove it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

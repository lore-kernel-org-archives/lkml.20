Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794468485;
	b=y4o94pvoTGnaGaGB9bt8yaTSE5R//8LSsd9nk0u7UebyseAzmibAv8G7yEC2e5VMR27+
	 0ooGeHrYj0XoNIxpFsE3r2TvjQNMTdT0ro/cpelZWUVc1/ZMuw2eD6pDpV0bMCbzQHgk6
	 X4X8pUo6M2l17NPvcrS1pZl37MGOgNOprB9k4FTjnkOu/OhkLVc7l8YLvVreNN/Psb1XX
	 SUH1TrB7eK6vTHH1Z7Tr/xBa0OHQVy3XSVYF/b7t76hp4Fpb3dVFfuzFi0UXZmwCLH2xz
	 5mkCj13oesPahZkaQdZXzvnuviWhfLV/5ICYnYQUGaPqwzEi1xtsCLLxm/6/HFjrw8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RSqIoItjXabFeCd3yG0ONrGqXrTW//2M4yj0JC2D6LU=;
	b=MXMrGbZIem5JIyoEuuJGYILHl7eByD1xdLxjMoYzlODEhrAD2pBOQFMP2rWur/Sqj03v
	 b114udRzi3lXwsq4cjLpM3q7xNwAwlLZoeWdoE4/g/hKyycNaFxsCvhqbLkbDGeDeq/Ue
	 5xJ0/jZHxE5jnlgG5273GWLSbFwKtroBJ3Exzjb5Z0ftIM6hIsREyy5x5v8CpOwq/om8j
	 qDuU8rZ1A7L3uAleqZx7vZgM79tKSLE/WbveivfooFVEOhfIdxh8qqgBg0XytVFsOw3GR
	 jVv6LoQp015sIfcSISC7gyoiGKlW04CE+WmOOjl9ht4ijexS+aj2xG68Dp0oHELFEdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5Z7h234;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F62606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F62606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5Z7h234
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso640273e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794468483; cv=none;
        d=google.com; s=arc-20260327;
        b=GzOxKLGU0FXNSxTe5LJkjQ9AnuzyF8//wCx1Iqb33YTGg8IrQ+vHuKmiy370HmR+sg
         S52mak1daWMeKl+GKZDeuFrgEatyFb5QPqSuLNJnoxdMyzmsmWZ4kCSDEtoWkpW/iVg0
         j2dOGQO+J490cogVfmjzCbZZLEa+HK1/KwkGckVNf4tI1XR+YPPssGVMsljNpYCI2Of2
         Er4D3fJPyAAN9/cR0SLiJMkZeOvYg5JwXe67rRyb2SoSmRudBFIs5JAIFKE0Qzbir4xH
         g/E3SvcsgzRt0T2JGh8UjQ1vSDQmLYM5zMR7sTnDoOrZn+kbHbNrgTayoDWYdftUjRf4
         n+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RSqIoItjXabFeCd3yG0ONrGqXrTW//2M4yj0JC2D6LU=;
        fh=0ZNcJ3H8BmPVtfpk6EaFLiNmXM0eY6o/TFce5Ysbf8c=;
        b=VRwQZAT0oXIgGA4kAlpG1sJetJxBIwaGrWinAucg85EmqL3HUmxjoH5ZITTNYl6MU/
         DrzCAlaWTuFs6zf9iOBXJacgE2mlHHrzDqL0bH0MBJUkbOz3e8wHUBAmiKNYpjyXhsQy
         CP7UrUaiTYXao6TkXu0gzVCFhxqJL4uA8kIDzblecMZHZCCy7kYlMXRrVZsMH9+a9bG/
         yMzFe1BgiRTELGFzWpeXTBuVcuc+M44AtbCBgQtgikQgRJ7LYssbx6YJmgc/T+fml2y+
         rTazbBdzY50UU5zgcOraVVJixVDYneXD9DADb3iOfYdNlrimRMbSo2773n3dhpPa1S+C
         4OXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794468483; x=1795073283; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSqIoItjXabFeCd3yG0ONrGqXrTW//2M4yj0JC2D6LU=;
        b=e5Z7h234zkCd/ciE/tXHKetWlewKGG5d7S9/f8/LJ+Oov71aPEbB2k62uvxj7j8kCj
         708eNcRQT7nQB/4wD7RFaCEMyLJfBJMl4M6R0bzlbBU+JqA+35e/Pfq9Y+jsIbiUiq/t
         dWTP02rb0oS3BbLlp5DOLx39/3kNPXYbfoBarMjL0qe58yCQ5k0Fg7x8U4GWTXy4aKEW
         0sC6QwSs8udtVphoxrfovcgp9suB8hbs0OkV3+l3x93DTNLBdJqMZHm654WV90qgt2KH
         7+xLjGR+7QZiiYOFbHIlom1tI8rExr3pmdpFH3gJT2mx5vPsLFudQeYNxaHkJTUGHqXJ
         ucRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468483; x=1795073283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RSqIoItjXabFeCd3yG0ONrGqXrTW//2M4yj0JC2D6LU=;
        b=PC732rvQXUJvzXzUTFsn73iIJGOL3h94TmwOYgnksi+SJqH3LmmCQZaa0DHLrBBvyP
         CLEsGK+6hBHqJjZO1QwIy1Jiyh03dBMqfkj43MTo+CuPdt+l5nBBXly6DPBpNJwyoHuE
         znn8cI/oP8Z8kIqA6mnzY12HGfm39CxF2mR7IUG6h6SY3Q7ZzOcDXcMi+BeO3JHuxkc/
         5KoIHfnl4zQvBob8DSiGsGqtXhF9EEAKGBfRQz6hCKMImhBRQ2pkTYBG5n4UvDTreVPK
         WCe3ShtSEY/rSGRqfiEj+uq8PQsnmnq9XQiXTIWKmqnRHi+Z8g6jQkQAMzqOUBdVnTuw
         3UaQ==
X-Forwarded-Encrypted: i=1; AL+hErHxmw16H6xnqtY2FGFzhBIzAikPEJIveUtqFpW+/vt9qMAuAsv+KKvVt7iljVJ86/NVMsrVxZh9Ftj5Fjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QoxpS5iJf96DGdY4TUpDi80SZ7tshQGQzHhvJP5dvUJvQdeF3
	0RSwVLX+VbsOVkooFBYWyUWMeddWewDcNKYo1PzgjhSGNcbPA7d065sY9qx00lzM92gvpAqkqe3
	Yz44KqTvnsK6y0jZUNI0jOe5GgDaWNqDmoC04qu7A
X-Gm-Gg: AYBFou2OipBmd+dN2vZKKHEiu6CgGJW2tVOfri63q9sEp1uMRd3ZyaBcwxshU0quBEG
	OetlAe03xzAWCjMnNK+6y8WFTsfjIeHXGWI+4ZEq+IJhEV8z/LQbfT0FVbGNqxDVPenUAevm3kY
	Sp+yWX9K8P29IF85OQTu/nLALh21EGQV3dmqdaW7zIZNrShV/Zy9t55QMV/GIRYVPMkH1NXvfco
	kYhNuGavdJ5K8IMDKjTiolmFUL1tBTkNplTIJoaZnOkv91/YLUC3C3GnMQ2VjQLOd+ispoOl4HG
	1eeXdBqz+oaCnAFI8qkjHqMgC1cZqX6BKtBQBFETajWjnMEiKbiMhfFYAL28U6v03GTR35oN3C7
	Ub+kcjxiTryEU/04mjbUVOXX3VaMwsZiJC1GxXQctYPZ3TKNqvm3W/3l7RjXqOMAA25c=
X-Received: by 2002:a05:6512:15a8:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5c15d632df7mr1472008e87.37.1794468482663; Wed, 11 Nov 2026
 23:28:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027061258.3900768-1-apusaka@google.com> <CAJQfnxFCMtr6AyGqRqAYQe461U0m1WBgzZ_psuTnU+1kS8-5Ag@mail.gmail.com>
In-Reply-To: <CAJQfnxFCMtr6AyGqRqAYQe461U0m1WBgzZ_psuTnU+1kS8-5Ag@mail.gmail.com>
From: Archie Pusaka <apusaka@google.com>
Date: Thu, 12 Nov 2026 15:27:48 +0800
X-Gm-Features: AclHuK9mRuQss2pbvsXUEp6Mw8Dr2YJlgL_feJg_aMhHpW4cC6Tk8ImBSNrEEqQ
Message-ID: <CAJQfnxE8hyYT7o9TRH5MDT-SrND+mxfBe+dWEhKkZHUCMY1uRQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: connect Bluetooth devices before
 HID++ handshake
To: linux-input@vger.kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	benjamin.tissoires@redhat.com
Cc: lains@riseup.net, hadess@hadess.net, linux-kernel@vger.kernel.org, 
	Olivier Gay <ogay@logitech.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 10:06, Archie Pusaka <apusaka@google.com> wrote:
>
> Hi Maintainers,
> [...]

Hi Benjamin,

Gentle ping on this patch.
https://lore.kernel.org/linux-input/20261027061258.3900768-1-apusaka@google.com/

It fixes the first keystrokes being lost when a Bluetooth HID++
keyboard reconnects on a key press (e.g. typing a password on resume),
which affects devices that recently moved from hid-generic to
hid-logitech-hidpp.

Also adding Olivier from Logitech, who suggested reaching out.

Thanks,
Archie

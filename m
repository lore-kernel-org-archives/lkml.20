Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4259F38239A
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 01:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791076111; cv=pass; b=XExx6rHwd77E0JKB8g8E2h3X/Xh5vQBTwtlfjpFulOVdNUTJnH1qpVbUEWAJUvakrYtvgQ0e/jSVlcHHCOan2PDsTVF7vwEDKZNx1nL4SZ488vSwLbnnboJDn+GQ9D0G4wa3XPcxHuO+9jNwbi6R2GE+n8V+j/224EDVS2XN1zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791076111; c=relaxed/simple;
	bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vENhQSpif+dS9UBb9nyPkD6g+5b4zsN4Zx+oB3zUbSYNvT/Cpx9VF4xNYiWAE7lUyr5GzMQ1s5RGgiAM0FNLIGNng5hnsXF3nwKSMEbASkR1XJwfcteYUHN2Ol7DU7cYGldgClVUhvtu/xe27Uws2GVcu7jQ+UjRKFgY8SbwU8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzY2vk2T; arc=pass smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzY2vk2T"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so334899b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 18:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791076109; cv=none;
        d=google.com; s=arc-20260327;
        b=lh+FV/K2N6ljo7cPHd7Osi0i+H2dcJ187guaOIRQ/M0cl8MTkm6cT/ekukwA2TMg+o
         KD2bI/5laoECtghO/dkwcpk9Oycd58Zear9O32e/phRm93evBMT0mab450zfvCcRi3zO
         5jvJB7tf1aWGaqREMZhiaMhTxgfOI9sVYMqqpbeK5g644nmQaxcmWWIBeykx/Urq8U2J
         Z75/8o+jpvy29056YG0J4npOVPCHMQAOuK//zbEg62Ak65KppWEfHPBT/UTSzpWG+oL6
         Tw5wItSPgrX8QMI00vrLmSAuc46aM8bP53MmzODAymtZbClCe0/lE9MmGr/Yu4xI40UA
         Krvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        fh=U7TorTrLXneH720cehJu9VyXc/y5oM21XqWyvefmxuA=;
        b=g85/+kod4XPtQ683qr1VK+tVxDi5eTs0ZNbeIY4CJ5sv1RyJM75gwj2jqZ3dEwLvej
         T5mirBphrySZPNE+mPJdFlCVI3+JC7J8OET0hLK82gASOfJ6bSqN55Fe2COUH+4Qg+KL
         pPbMuxE+qvSoqeEryX2X9w4pnN92ROZR8zIekDRWnhWTkt1dCQK+HxfwqR0+Lcus2wic
         IVpNO7hbonWeUs4h7N4CVhK2O9d+kZBttyO2b1l5vyYl8V9S9AdgQQREEAHJBjg4B9uU
         n7D4QBfx1Uj3FZvK5Mgee5Rcor7hLaHGX+X11XYH2P0Bohe1F0rbC/MNLIAN9+jULlS/
         0hTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791076109; x=1791680909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        b=mzY2vk2TFGGVC86GKQK9tv31m/zA+ShbspF5huJai4M+/b7WtKtNkEoZC4PPPOj6P8
         uJl8w0hIQPLq2fw5+EVps1oLEXcl/Dyh0p7CS8KvO7TAuzym36AxUa8M8zBsgF8EUT9H
         3KKGB5ZQ/FOtPqNXTT9hJusHgD313/QFjIh7WTLg5WPhMjJMmmxN71ToADhveemJ7nXK
         hvYr3mBgqeKhkyrDvc/QfJbBgYTPICqcgbZ7BEWv5M54wrXX2uvgiEfNiUWZm6YkL4/Y
         7tDfKchtLtjdvz6ZDHHJGgS96f1+qk9OFecZn/mdKzGUnfqYhE3WPvd8g/+oM/C5J2Su
         Sncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791076109; x=1791680909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2EzKxBStvluvfBbLZlJzC5SzXZqcUJVtJyLqt4MO7k=;
        b=y+lmoDauNIt2DVFyxRy5AObCqBReEFxMMt4tLCU0HoTeO0M34HxnrxqZ/nN7c34otW
         cmnq4mSu4ncIaDKD/gNAQq+LY9vXVbW9On/hxfjLNNKrehtZBlZOFnw+xhrSsxumS6ZF
         ovzvr+lo57t0A4EhrTT6WyoOJj/bEX2dUSeAPBvmofjVObxbcfj7LErCziorXhUV79nf
         EyNh30osNgZP/YzjE7KWKoTuS6i3B3XKYMhmt454MuAsLwZL/yreWmRlNVGY2tz54elY
         65uAp+WKbXvEXDGo5xuH7u8vo3D0ONjjU52md6bFzMFh9l3Gwa/DSXmJIOkDLGRhYA1D
         2tyw==
X-Forwarded-Encrypted: i=1; AKwUvBzwwWiWJEfeSc6f9+cLPVP9LQ4t+H3CEBUjy/G0pXixTRJoWcDZG8n+V1g86l0Tq5sZY0JQ9TcWVtHJ1Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++mntr53eMrDN+r78L28RbiXQok7X6njyO4dNYzkxm38hoGVrA6I
	GGHf75j6agsiCHXhfGFp6up7vZYMn70GFHT62O0BKGww6d559NLnTPvgPO2Wbu1rg9amHFi0d89
	Vnw8tNxW4WpUsPsIBiCsUIvlQAHqvk5A=
X-Gm-Gg: AYBFou3YWKEOPAy5VZNZ1fC5yFJfmCd0FzoIWxpS6v+UbOlBzqhBRKUCFw2YN3dsY2C
	DagwIe/p4D2rQMjR/3yiA7WrucnCLGj53Sw+YOZ0gf8cB/4WtC8clUFsn7XI3GiJpDkxCPoY33z
	hh5EIvkN3EeZ3yQTWK2pCRXiEtyPOdJuFJSvyvJOUjHDmNUaeWJyYPxxUWYSzSlEDo4SuFG09/1
	oSvMTRjgFdzKX3WNnhqxU6dFuv5FwJ8G8Uf5vTzzPjJ0x2KyQE8PAYNh31Ut6wGoC4xyaiq0WG6
	jyC1EJ7dE9Ct/bGy4OQVnlgfVNEpdhsrsJaFAZc1zjPXQwsHudepAElc/qRQvLg9dbD1iSvRJHk
	rj7xFv7nLom/PL1JG3v9KwWcLMilaSb1WDinCVgLWi0s6qPYDrxEPF2m93nkrvp0VEDJGuQ7DDw
	UB5s5uosKEWvf4RR/kizxwIiuuhw==
X-Received: by 2002:a05:6a00:928d:b0:881:b008:12dc with SMTP id
 d2e1a72fcca58-88af6d23112mr6680413b3a.51.1791076109507; Sat, 03 Oct 2026
 18:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814043028.12548-1-phucduc.bui@gmail.com> <aro6C_SWBGF44z5E@black.igk.intel.com>
In-Reply-To: <aro6C_SWBGF44z5E@black.igk.intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 4 Oct 2026 08:08:18 +0700
X-Gm-Features: AclHuK9IG0a55vjRJ0Ls9cn7wrTw42YZDJM-IfJVm55MhbZJ8YTIhAXFCbeNeC4
Message-ID: <CAABR9nEmXm2UwOWHDR2=A_62LuFxjgN4En=8Jcn2r_on0XmROA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for pointing me to the discussion.

>
> Have you read the discussion [1]?
> It would be better to make platform_get_irq_optional() to be actually opt=
ional.
>
> [1]: https://lore.kernel.org/lkml/20220212201631.12648-1-s.shtylyov@omp.r=
u/
>

However, Regardless of how the API might be redesigned in the future
to return 0
or negative error codes, the fundamental requirement at the driver
level remains
the same: real errors must be propagated properly.

This patch isn't concerned with the API style discussion, but rather
with ensuring
that driver probe doesn't silently swallow genuine errors like =E2=81=A0-EP=
ROBE_DEFER=E2=81=A0.
Proper error reporting is necessary under any reasonable API design.

Best regards
Phuc

Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03DB496D5C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567298; cv=none; b=MlaEorYc0+AFek6l5OI/P8IONYsu4jUxU5gI1650+aweIrroONtpRHmJYUruB8JKcSkv874oQoiEx0P5v7qpBxjMWot21G45PG/4OS/XcVhQhayqw9XXiVvLb5XmgSaDDK/WRMocsJxl/PNx4i7RKsrYOY8PNVF9KBFdR01aVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567298; c=relaxed/simple;
	bh=LOZA1HywhSNmDK1UoZyyxVq3wzA5V9QKlib/CveDAJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOYYhxe2Z6qcQCcx1LQSq4UqN5IGPMIyPsX+iweDl0lvQ+2NUkIFXWgiWqE/prVXgyNrinaW+v8gguJXSr/JILnOCTz4cK9abUxIespWKzV+Y9QpP3Tc5aWPRaJxW9n+W26ki4FfJdA3kRJ5RdThyCOFb1R/ctc9xdUl4TeRFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so236372066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567295; x=1790172095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YB5wJdJp7iKTK9TemjyuyLSregIs6jY3r0wL3mFG0oc=;
        b=ag0mSrBGzS9KLeOtzH7SYpcgPQ5yevY/I3+6oOWqEHNTwwPRb2/v7GpOX9c369Ddsy
         VaebzY0Coiyis3lXrZ5kO0INgXEBO0Yl1yXbm0Eg1vqn58KeZVNgPvfZlUf4hKqOSpxz
         tX9/+zFD/NR98v5IKeeBMrfcKvS/BH5qnNqBFpsvOiJP6OC+z7OlY3NeKqEImchsyAMB
         S77TQovqO8oRQEV8YLtoTS5uPn1IC2nbBDPkMl6WAMKNfiUL9oM2ZmKDAf2p7yiEEhcs
         PBe/aYXmSRMhoRUobasYQRqrVP+yLr9Rg5zwTnCWE6yYA6BGdHViIlpuiv48PbyfuAxi
         q4OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyb1DRxwBfzabBfk9SRkWswcyskPwh2Wqep4+0WKubDwmrLMtEe/cF2NFP95D5Iz/7ceRES6DORYgQdPI=@vger.kernel.org
X-Gm-Message-State: AFuF++kEzZZs1/Wvc3mNFenQ4a+g7lM4nxYeGlLPn+BfR8Xr0Qk5Xzuy
	NImrR1TNMjTA72x+71gxhfhDKMkI1bBUhlQux6aUWxmwF0hhaqZYohAQG45cmRXWTsA=
X-Gm-Gg: AYBFou0NqIudSGVXVFh0W+IaetCOMNyfFJ6tZIYzhi2jMVocS0aNWe9aB73kay+xdjf
	zKKOugJ/omhhJRXx7fqbqn14Ea+dUvWHFqn8fGge5EFx65xgCcuCXXAPbiEU0kJN1TV6N4K1V+n
	71OVQab8xfdrFwNmxQH8qtwH8Cc0sEM13RiGDpcDEhVD6LJJhQHhMsOGZkR/k7xJoAEnTVZzzow
	rVLsTNhgBgndJtBCE+T6d4Lo6cmFsgMY7eNjFIRgFNK+ZM4WPZLgIBEqaSctOHQ2zC0JRWGTAn7
	hFAoYBy8zisKDxS+CgP5TE3DndBseU9LNtCBlxiuSqk/vdnC8LzDkZwqXsalK4/VQqkuE1MaEmc
	mUNSr1eXGHGBHSNrOnaPO/rud0ZA13+RyvPkMNIwZfxzR6GDqug2v+WcWhoifrCRYxJHmU/tbIU
	ATvrD81l8/j197CA1edi1wZtNdmCOQEgqWwn9oyFIAYhwMerNBxZtOJMufP9P1G4uEFfNEr35I2
	IdBenUZkuoH72tr7AExO3r8udIlbg6U/ArS
X-Received: by 2002:a17:906:4792:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c29c89688d6mr615759666b.11.1789567294218;
        Wed, 16 Sep 2026 07:01:34 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de63a7c8sm146343366b.51.2026.09.16.07.01.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:01:33 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c294ad260fdso316516266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1B/fqIJZ0cmNVvbqq4mCejhd3lnxJeiGRWjz9xD3NDUGyr0LioVBPVQcQzjD2wvFBz+9NfOe5woJtYl0=@vger.kernel.org
X-Received: by 2002:a17:907:9452:b0:c25:f7dc:2dc with SMTP id
 a640c23a62f3a-c29c8bf56d3mr614247266b.29.1789567293068; Wed, 16 Sep 2026
 07:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
X-Gm-Features: AcwNN1UfyJCOGSEjRjtYLZ4YGwDs-hH1sGh2EPXUqWFwEQpikBVlS7z89oufr3M
Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To help debugging, offer a list of registered hwspinlocks in debugfs. It
> will also print the responsible hwspinlock_device and if the spinlock is
> currently used. It does not show if the lock is taken because of
> side-effects. Often, reading a lock means actually taking it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -860,5 +862,70 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
>
> +#ifdef CONFIG_DEBUG_FS
> +static void *hwspin_lock_seq_start(struct seq_file *s, loff_t *ppos)
> +{
> +       unsigned long index = *ppos;
> +       struct hwspinlock *hwlock;
> +
> +       rcu_read_lock();
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}
> +
> +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> +{
> +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */

Do you mean xa_find_after() may loop forever?

> +       unsigned long index = *ppos + 1;
> +       struct hwspinlock *hwlock;
> +
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}

> +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> +{
> +       struct hwspinlock *hwlock = v;
> +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> +
> +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",

For easier parsing the output, you may want to use a string without
spaces, e.g. "busy", "active", ...

> +                  dev_name(hwlock->bank->dev));
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

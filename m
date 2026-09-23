Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD2413789
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190960; cv=pass; b=Rt1c+iDbjlkFZtda+DRsG2OnoOQQGWjaFB4FVyXL7e2dD0fjR05n/bB10oJuVeUMqZPVbUA4jusIcxBeI5MjQCjlAWBP5tiaoNMIsFWtgkr8SfiWYc0xc567Amc11qNmLNmhfWHsCRckQR1zljDwWXDrG1qhCSSn6P4tVxifICg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190960; c=relaxed/simple;
	bh=1fO+H3CaJeix86W//NLHqNy5lAb7mvgci32QvoqP3J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIr4wp7nETi+8BOTV3FGoved+N7xhTWVTlWa+oJz4wa6r7DBZSgbYZdFaah2vQdeNfK+5zvfLrDfgmWz+sUxH25z//HSRffeUHfeE3EyOSF+9DTulZWi7zUEoPeHasa7FqcPgafa9CUixlgqE8GpV9GlBX0ISlubkXwtv/7mNIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqU0tMh+; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqU0tMh+"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so21846877b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190958; cv=none;
        d=google.com; s=arc-20260327;
        b=UTtNsRGwm5ZQWjUmFWumV9dS+HlyQpmUvyyfMwxbF5SoKW05GDSHPXEH8koRxUYnzQ
         k/zrKJHWi7wAJuXE9E2Ti2Dtxyxbc+xle8vsxMklwpxtxREcj8aZkzRHGURoSEQFfG/W
         wkZf39wu1i2yYOPeRL0OkW78+9i5Z+pQMva3E4IOVvcHmUBiVBTYqwouVKGXyAA7gezX
         go9H6ujJOp1bnF8qfovEEZmp5fw620rgKyh9uLzobTH1ibIbpJ4Ew304NvQNyUOMAT9g
         kJJCq/h5IJH8WuYY1rjMZY2aAh7UGzB2a3Dlmmg0bP1BstCH2ZGbAONQjQHD+CMU1XNF
         wt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        fh=c8QC8aUD6L8x446bsLs1eKBNAE/KtoeNoNlqy4+Vlwc=;
        b=j2rcp0gxKI7aUGzLCqhUVSSlsdYkHpuNOusJQEYJLqtUMmjSCNu6Qy/o2b6YwNvOBg
         xIWLfTd/VyEYosR9+WFNGqdZoWrxjWbRy1Sa5h6Ojv3SY8N0/5bi6mEifURld5HYdAti
         dXADudl0FIp9JsgAbrV01kXNo7DlXo9ozZK91iY/NGuV89vIOezcLXE7/MHpWTziv/cZ
         BCK1aUInAKRJRpu80UV4ELxpEzQw9FAbRpIziN0uRWbxH8hqEqOjps1c1d09yWIat2Ou
         iwkJol8IQblfQ+jRZvQUyjPjcMbfSMUgV+VufWh11VNu4PCYwI6l1px9y0qp8YUjcUwI
         b4Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190958; x=1790795758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        b=HqU0tMh+ouNwqsekAmGMUtU0Vk0cY7pg8vTvuRloWikvxQevbHNHYrmibaMACACoCW
         C/0/mSD5w27pZr5lT7zFOa/p+NKAbnCynY/49zs6QMEzTY76KIJ1K0DgOyylcWr4Cimo
         DR0IRqZoVFua3BuDZpQoXzAuJW0Tgc2PpORszUJ6Su3YGuIA2msrvSIqcA5HWtJBpmfw
         zx+fSmH9TQobwO0M1VYM9As/eGIq4oTff9I6MLuCwIeDPbsstSECYzBr75FYJ0YeEGnT
         +LcoJzrPs9VMZ4GzH4x/QgTlmzz/JnyFxMicqOM10NCe4zEHX5AztZrrSrItlWok9Il5
         OJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190958; x=1790795758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        b=GznPkwWsQnmegD+jWaKcBLumbH/5eEKfO8bS0sDQ+Lg0yDcBezuFNI2FLiZ8RxmDjI
         bpqut9UJKuPpFUOeelriAi1RXhDVi216/r5dhM2/6na+04yeckR4tJMhj5bjRHq+rFkn
         5cDPBS00/1OLoAhiXwxCssarsfmtkaMi3kJbp0AxbY89EGITWtYT2ZToAHKNZzZMJ0Hb
         spUGm0PhJREPiYIyRzUWMKXbgDHAc84pVg75Vk7sSEc4TxcF2nWwp9n/RI/XQ1JYumv4
         AQ94d8kXZaVM27Gu8GVWdFDYRs4+sSgzhJ0FQSE5o6kov0l5Q09TvNLDYiUgpsTlkwuI
         bgJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+3FDUGoxBexVMZmrrRkPhAIuchezw1gXz+FKDszATBZPNfMX7hbwwyjRGTJILk9t7CalqIBG7dWV4hcY=@vger.kernel.org
X-Gm-Message-State: AFuF++kMgtXTGiCIZxGCwhSJXFvDgq5exkSI/RIMTPIRW6PDAB3Fy9hQ
	2bbTBMC9CqhqFSIAZDfQaPZ2+6FkboaZ+M25kPQDkIhSAYhca7LgsqUvfAv+nzL8DD3E1SPQzC1
	CaXT1w/Vh/uLKT9aAzgr4A68OEsg52nnxFTTLEZ3aqw==
X-Gm-Gg: AYBFou3pU8fWIzwmO3Xtl/jM9wZ9znF6NObn3E9mE9/d5War3dD6R/DZ34ljFgirgSw
	KcZeZXlLNgc+8gI64vbL0Eaupj1adQW+S2A30kJN2tfds1UFfnWbF4sUGyi3LrTBKlRPpdvVIz7
	v9oRk+UddJQSFkKhbiWGpkGD92DBy4aQ0N2EZ2ihVDoxiOSXdxvPua0nZbnwHN7BENaNBkhE51E
	iWKdM7RcPQWJOWabRmpv6rhtDkv1P/Ls1TZOrXNErtjXJxpvGnZebSrqrSi4PC6n+WO3ievgz/I
	xkzwBOTbFu6M8pklZDO2/u3ze07S4K9AOikLQQkQZdin9xY6xbDbHmzIb07W+rgRhA==
X-Received: by 2002:a05:690c:6610:b0:873:17c9:b054 with SMTP id
 00721157ae682-8a648505a0dmr1055207b3.21.1790190958227; Wed, 23 Sep 2026
 12:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922215849.16739-1-vladan.kalaba@gmail.com> <arN08yVxjhAAyZ4S@stanley.mountain>
In-Reply-To: <arN08yVxjhAAyZ4S@stanley.mountain>
From: Vladan Kalaba <vladan.kalaba@gmail.com>
Date: Wed, 23 Sep 2026 22:15:45 +0300
X-Gm-Features: AclHuK9JgAQsoEghJsGDXhi9vPLNpnYzGw31sUj4uH2GUgZlNk-AGNv2A8t4vO8
Message-ID: <CAMfJq18GfekJgaCi7uOT9MazN+_scyCHfOjC3o_umzJzmZPMBA@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in tx_fifo_depth
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com, 
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:43=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Tue, Sep 22, 2026 at 11:58:48PM +0200, Vladan Kalaba wrote:
> > Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
> > to check in axis_fifo_write() subtracting 4.
> >
> > Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length =
check")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> > ---
>
> This has been sent a number of times before.  The information comes
> from device tree and we trust the device tree.
>
> regards,
> dan carpenter
>
Hi Dan,
Thanks for letting me know, I will keep that in mind in future.

Sincerely,
Vladan

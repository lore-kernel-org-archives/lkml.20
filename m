Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793101401;
	b=dRYXz1KLhDtLWbWGlhpgT+hXahaybXpSCodWXp+po9+2QAntCxmLV4vohNBjDfE8aH+v
	 sXz1sexEaYIt+iG2ya2+QwHc+60D8mQ1o8NQytB1AESOJQ/3QGn87TgjZqAlJs6/b6O5p
	 zynkmduEXbKBG3xFKpb4nK7DPfV57eSq5GrbkB0YXPUrbwDAif5cUtXJ43mN4gUSZ9hde
	 zd8JGkWbBnSe738eB44zidtr61Kik2FZyNoTNiNjDG6mGlcgAYPTZj3jBxHYjy58FUExk
	 /ttHzGmufb1oOp5DX3PtegvVkC13HL8E0ptNf1CliN6xEXCfPJpJe/DwtkWI3BZbycw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
	b=tfRbEA5P3KQwsZh5TTAyeOrxFvUALuQoe3Iny53IlY8j0qfvWnVH7ldA1f8NwfZdsbMp
	 8OXSUYAg4qMjA3zdKRZ1/j9X8wpqCsbZnELuG+++ddMvg6ZVzv9C95DBFLD1Lrn/r+lW4
	 XWVMBLe6S7jdvBZSgZjkrU17rDhhDc33tlWnbMrfCfOSIs/RLSsyxrMc3C83GmzlAQYW/
	 Ou+3zja9CRv4QNIhc0yxntU2tq3ah6/jKJmWxb9zAfkR6dTpN7RKh3DT3I2TPMhU1P9+G
	 1zxHBFGYEVxxQmZOACuiD+zSgRnMd069L7DgHN8lX85BNu6AoXQYLQ9WjqU4ObpfTkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=laCiiI7m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED30E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED30E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=laCiiI7m
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2581597f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101399; cv=none;
        d=google.com; s=arc-20260327;
        b=ksyNZNRJfmblJveFrKD9Qccrl1LofEVnYYG3ANOKEx9x5VQLvqA2mUuXdwRMluWai4
         kBQNQBidD7TXoqvxFJsENbBFd/KG7LKqHPdMRzcLGo7xAlYEk5T24Fi0dHuWFsMqKeem
         hQWp0f1BhzZk3dRo9jH4ynKBmG0MFTnpbAMVm/vd3tTLJquOu/nwJ2Q0kQhxUsWDEQqC
         7c7J4RrSW3ZCNira6Zj4KHEwOUoGUVWR65QxBjHxBAq9yVrVeMSDP2VmTnsX47SmRAzD
         D+7ea2QAJJa3eSz1Msz8seVsLj4odOpyZGzKkgOY4V2YpXn1NSYLfvtB1d+cDjwEbCf4
         XsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        fh=X63N7pvUvrXtmHOeI6fFa/DcjbufVJD/bXb0IZesmK4=;
        b=C6jfigoF82g4en24ILSnWe1IiIN10EabPz2DM0XL386RWJuIBLkHXLg572QH8Wc7iB
         yKL8PJig+VbL5LcKdn+Eft/IfDY+ei0Ori3sF2q/yh35ntvp7x8+LUfxpuqxvcJT/j2Z
         QJFIJ60/JPl50lVQ6Aui2eWGa9jANpYy0orjcISgDGE5Gr+rM/nIQ3sg84wtHVNl4bVd
         mrXl4wUVWZ7dX7bSEcbo+DRMsPlwPEKoR4H3FhxllAhcxW1vg2qOvcp+KsKMKjHb8UIZ
         neTaL8Tv6dDYsIe4BV36kPO+CE6roIU/ofAeSn0Byab/y8Pu/v199ysNDulLme+hOMm0
         w3BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793101399; x=1793706199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        b=laCiiI7m2hNlxjVbN+qEGCwup9iUp19oeABd52JblaFUQtBM8JaHKAh4eS5OGv0UUF
         DEs2uK4dgC2GYai3f4BOKQeo0HW09hlOEMIhMQW8NAh/+wTg5+mcVHwXVx6liHSCntIo
         pnfpge8e7htWBz9lxt4nPrr9z/6X+VM3KQ+yKCOmTd9aNNAQ0/UFGcynSoTyeMwZuuM1
         SS/BpOIo4FtFvtlnzEo2ajK2jWU4oJs7mYDE4o/3XWKXMuVtWEk3Ka6s5vykpTwtkX9Q
         IIjS8bwHyq1aXMZlIvmQzdylpwh9k8HEddj41qqL4TQ86vTCc2fY2CZDnDDr90Gr/MnB
         Zazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101399; x=1793706199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHBq5VztpAn2AdPs1YW6B/lO82en/xJ+WK6rO9j64qA=;
        b=hY/n5KZtjzUDADA9+QSITn+qxC37VRKD8EtE3jAuPQeH5oRh9Ld/xec92El6JjWZ4A
         zZ/jtSzuK1NoAPYU/Jm7jyUNVPXCJ3QbTP8bv2OVqeP0z4fDaPN0t7pKGOiELfY5iYw2
         /Q6ouBufJih4w2n2Kv2B0kKkqYa7ul1z8y7dl9nlNgOMednohiVKVvAIsWHvimuhWt1k
         lkT6F9AQf/akYchatRdcvsICItp9jc7KMdaOOa8/HnuU/krtvbb9vlbs0saP66Pe++KL
         48jAQ6qjILBlQ1vxrBmSs6kqLZCslSaEpOWLXZ5JX/N/e6HPS6o/yla92hZWW34yTdm1
         6rqg==
X-Forwarded-Encrypted: i=1; AKwUvByk0EDi11+tcK8hOilG7qlfDY4ijXYqo/W1hZ4mOc1uq4QgmeZhHgTeK1CChjHAl1HjBN7//MCVfl4B2s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9ZsDaXShQAcpxH9gV8o3lysxmxJU17jHK+g/cYV5o76edfk2Q
	WIUHwcwr7CpxAPPH6ByT4ddgPzflALgOA9AlNm++fTJSH6V5K6uMNqyok4EX5UPFBPD7FRiYpGG
	WqIJ6/W0sa6pzRCeWRkVC8fGHejqhcZ/yGGL8WHWqzw==
X-Gm-Gg: AYBFou1dwfeTD7ThAtHTVnteSpF5EfwL4FFyUdqCBQdyVg1AMNn8kSApx7ivrOois0b
	40zapBzEs2VcPdAAfRLc/Vn2ZaKO1H9vXPGh1Ryiw5qvdzFQWQqvSxa+qnbBb3zYGGhZjalD7d/
	6UZOhQt2x5QZkP683rJuCNiXzCULviQGK8pvebAKOdibDaLyqSXXhW384Utmi0ZZH00Xkps27qO
	wG/r1LhOzXRaM9ieekLWKf6vkZNxAfWpREVPVcRyLwf8fsvKfUhcdOykzzwH7cGJclaxiJ1rYMk
	Hwn54lqwjLQg12XNeNP5lJH7S2yZUJcjZNF6yvaxJBczZMvPffUvutT6Zv4zcSX34FGa4WIxSHT
	Ib0ZvsEwaZYC6P7E4HG2tExofgJkbaTTFUzVKmZFJAHiSpuXXlQPG6Y1SH4u7dxnvEm5198WU+N
	+e+vpSlAydfHqDjr4bK6lDAtFmQyniPFA2omLE5FtJw4URdLajLqw0RC8=
X-Received: by 2002:a05:6000:2312:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48e3eb2cdbfmr18502041f8f.4.1793101399218; Tue, 27 Oct 2026
 04:43:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026122641.3292904-2-thnkslprpt@gmail.com>
In-Reply-To: <20261026122641.3292904-2-thnkslprpt@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 17:13:07 +0530
X-Gm-Features: AclHuK_YxyDIyftc25iUYC8NVVRB1Cvcm_VUFCydYG2U01f8I4k1oeSJn7Y-8Jg
Message-ID: <CAAhSdy2RDTujdV1xmXjEwjAU7VCOpHL2MidOFqt1UpY07GWXmQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bjorn Topel <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:56=E2=80=AFPM Avi Weiss <thnkslprpt@gmail.com> wr=
ote:
>
> imsic_irq_retrigger() writes to the IMSIC MSI register to retrigger
> an interrupt, but returns 0. The IRQ core treats zero as failure and
> may schedule a software resend despite the hardware retrigger.
>
> Return 1 after the MSI write to report successful hardware
> retriggering and prevent the unnecessary software resend.
>
> Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support =
for platform devices")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Thanks for catching.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/irqchip/irq-riscv-imsic-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip=
/irq-riscv-imsic-platform.c
> index 95ff76e63a69..5f72b2a80887 100644
> --- a/drivers/irqchip/irq-riscv-imsic-platform.c
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -61,7 +61,7 @@ static int imsic_irq_retrigger(struct irq_data *d)
>
>         local =3D per_cpu_ptr(imsic->global.local, vec->cpu);
>         writel_relaxed(vec->local_id, local->msi_va);
> -       return 0;
> +       return 1;
>  }
>
>  static void imsic_irq_ack(struct irq_data *d)
>
> base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> --
> 2.43.0
>

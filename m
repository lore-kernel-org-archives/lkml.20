Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922300;
	b=CVLawxVQ6jyID8mc7URy9LU1eQi6kEKBv0pSQjr1UDztCUG0f4HwuhQDFRqSJQxhzXAV
	 OD5LrPesDlLny8BiE1kIj5UYNgPIDzbTM25zp0FciIz+8ADLUZaIttl0jWZUv0jbwWend
	 l3P3JVMLcoawAJ8hg6QHw4YKQGrdbFpC6fTj1gbiWEyouDtYF8HPFowjuHLPQz50ENV5R
	 TS8TxVKmnUHSDz/0cNcwb5dYAX//zDpOWSwQ2NT6QjXfyiAMe3slZrTHg8fuB1SjP4ytt
	 Eq2kkfZeI0EW1Y664v7v0XuQ8M+TkDoxQTQGwBYDjv+bI0UIWKtnipZvIrQDFNnLxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922300;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=;
	b=jxKKF1luRBW5puG7lzxSK7XDEldA/y/1T1offjNbmsan0raJuMJyAQKCCXlkPL3TJzCj
	 +KG82K3RsQJJtFrgw58PuI9qsD4kUeLfI0j0K/asKJFb3x7V+lh4VUeYmvL0bcZ9I/fhu
	 GCKP296Kl2rDHvi6U2yQk8iLTAFaZqT4KJZ1uKXDp7rvWgqEHsu1C54moALC7/miC1F8f
	 atdm4nGWNhqTSma+Stl0k+ZEOePd4y/9Zhsdt+ZPSMrEf/OFqJsBlXJLmOKcrmwGE3Jix
	 QoCilCNaD8nnyk53ohTRi3mqLeNnc6Et4USj/kpSAhhf9NNKhB357dTqtWNcQGRqjSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F05606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so722817e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922299; x=1795527099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=;
        b=QMl1DGo4ubqHrtgY7Md1hmIPgT1XtLBwiIBQYMKNdqHt+FMvMSGKoe/ibHZr4PcZk4
         epvhSjL7QwCYI0J6KUz9h1745HO0k8Rqi40xYwBGkUvjxJe4Rgy9Ts49f0gCoHoIEpyn
         RaKGsBMIPsYO6J8JiEDEOX/NvcpZvKW8604hgQYJw0NHxYHKTLQ4/G2Iyh82PxyVu3S0
         5ADF73vbEpiMMkioNV8YE5+3YwRsyT+IvS2wSFpmWQoe9y+c+WwYbIwlVcgrAyckEBfU
         gJ2CVfLlvo02bpHM+rV4Q8yv/7U/05JHQ5j2S3ZKRaEhQmc+mWjjd3Fty1VyGmOTFBiJ
         laVg==
X-Forwarded-Encrypted: i=1; AL+hErFIT4/7LtarY7+/fySFJFWrO9EZ0iWGLTc1qtXf4jZtJp5Er/kBTX/31tLCb6RNf76S/ovkk4OJ5OLOFII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ahQEo9vLC3EsAL//aigsVXcVvks2gRC7AQYXmIFxYezMtpht8
	Cz6mD+0qYlwUSIu+O7fnLWQl2ZwFBkPM2fsdwEL5QfRrTqIXf/IaAuOU6Oj2GXRG
X-Gm-Gg: AYBFou1qaOyPpAmP5Z2laBeBSn/RW8XsBPGHtqX1RzLcEaUEe54iP7QrOHAEEb6v4T1
	d/aFtLeiT/MXlsH0voLZeoSzXS+NkHbOZiaAE93l3vzrjfPCgQyOMQ+MtEU3B03axWOrgCYPDdQ
	Uwy+i8mdEaMk0NVRvfocJLoOzugmbz2fXbYNSki5cJgj49fu9RzLRZxzqj45stkcr12AlodrS1l
	gc3S0tbFS59pIjm5H0uOZC1jxCVNMaGZf/M0p+pzZWY21hyQgbys6NR+e3Okb5Ocx+As/yy/smU
	bUapCnp9r8EoABHoJKs6Jiz5JU2PZSGgrGUHAx2ZJhkHkX3BP0OmI23/dL3Ki6nfelKvFPyOYwj
	DGPYr/KSfrEvbJvIs8wpquGeUIOTMDjt9yLRHIZQIWLFIdK/MZ0WhwnmnKrKvthjCN7FouzL2hF
	Oh/DdIDRrhPHVOei5Zo7NFQD1ZENk85XFJzVLaViGHrJwQQjaxI+VEyzx2JWAi6ikZ/qJSHHLKK
	+Wz3yti1GtujvwzduVS6O/Zu30DNT41VhrWKw3G++SE7q+9DP2H+593k04hh1PqyLJNo3FxQC08
	TwaIet3qs9A7sAQB8aeOoWoTQcctMAr7QhD5fRcTPyVgsaRKhJFFX6efaMBD67Zg2+a3zoU=
X-Received: by 2002:a05:6122:3c50:b0:5ea:c3bc:c54b with SMTP id 71dfb90a1353d-5ee5b639fbfmr679336e0c.3.1794922298731;
        Tue, 17 Nov 2026 05:31:38 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e11d3c2sm6836809e0c.15.2026.11.17.05.31.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:37 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so711719e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgqVOWE/Ws2iVpDo3rjHx7nnSEiLUwGRt2Ap0Lt3MBNPXMRk1+VoLjxEaWTg2h7P7YqfWCLp4AAqA4CM0=@vger.kernel.org
X-Received: by 2002:a05:6122:680e:10b0:5e9:54b9:40a with SMTP id
 71dfb90a1353d-5ee5b70f820mr569387e0c.3.1794922296878; Tue, 17 Nov 2026
 05:31:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112204944.1427733-2-oss.patchbox@gmail.com>
In-Reply-To: <20261112204944.1427733-2-oss.patchbox@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 14:31:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
X-Gm-Features: Aa3M54pQZqX6BYtGrH7PmQPQgi-XDFTxO2MIGthzf4F_ODNzK-JgBMe7vBScNM4
Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Yuho,

CC devicetree

On Thu, 12 Nov 2026 at 22:47, Yuho Choi <oss.patchbox@gmail.com> wrote:
> its_of_probe() walks the ITS nodes with of_find_matching_node(), which
> drops the reference on the previous node and returns the next one with
> its reference count raised. The loops are balanced when they run to the
> end, but the three error returns (a failed its_reset_one(), a failed
> its_node_init() and a failed its_probe_one()) leave with the current
> node still referenced.
>
> Declare the iterator in each loop with __free(device_node), so that the
> reference is dropped whichever way the loop is left.
>
> Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
> Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch, which is now commit aab02e49f0b54a08
("irqchip/gic-v3-its: Drop ITS node reference on its_of_probe()
errors") in irqchip/irq/drivers.

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
>
>  static int __init its_of_probe(struct device_node *node)
>  {
> -       struct device_node *np;
>         struct resource res;
>         int err;
>
> @@ -5582,7 +5581,7 @@ static int __init its_of_probe(struct device_node *node)
>          * reset, don't even try to go any further, as this could
>          * result in something even worse.
>          */
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

So the old code was just an open-coded copy of the existing
for_each_matching_node() helper.
The new code is the open-coded original for a future
for_each_matching_node_scoped() helper?

>                 if (!of_device_is_available(np) ||
>                     !of_property_read_bool(np, "msi-controller") ||
> @@ -5594,7 +5593,7 @@ static int __init its_of_probe(struct device_node *node)
>                         return err;
>         }
>
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

Likewise.

>                 struct its_node *its;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

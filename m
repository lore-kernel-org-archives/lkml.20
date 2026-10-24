Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792816836;
	b=4uFRvYTcInAoZq9v7+QTkFluEMIRrXyR9AVeKipLvnGGxM/Eva9KDeXvjN0V82BIZH0Y
	 DKqvuSxSjh6ZdOAQMsEqw557rGubsDDJy80dz/jj9ogH93W8oCwaa2EGVfMBJ1LUtQ5tW
	 jN4LHoZHIBB2Y75NDGodYIf4Qy3XH6cz4OqSZc9CxG0tTz1A4C8Fa9nsZkhNZ0R2O7vbK
	 B2+FIeS9MQsSVZsQZaZHyIK4vHhrKZ2YNNNNk9qjRDg9LgdrEKcPLELanpiA+J8vvgjAz
	 n93GfvP1zBD+LqLpVR/Wn2zTZuQWIdfAV7qTssCaUKSj/927dgKnyG4YO1TOKeLWS1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792816836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
	b=upP6cAOURUv7JIjo6HyzvlvHpYsPMhDWoxeVdrxE9imFYn74fDXPUdE3Np+l9FmXvKmV
	 S2+bthtd0KpdD/A2wraeh2EsJz/6QlYcEdfZB3zY8o2/bSpflxqhuEVKe1dUCQt/sb+qV
	 141QD9sB+6a9b3vMnjDKr7to/vwx9gFt07Fx4L6XHjs/LgS3m35HqSwnXGWLK3OuM44YE
	 3XsmTg7+q7djiwBJ1cbitGEcsFh79eWfzvrtTvyyQSzr9N1HdQzV5TqfERZdzR12mOi+Q
	 CjAAjP+xYjV632fPE9C20zOAeDMDT9ZqVY7T7G3DnUQCOfZ71rA1o7niFssXXRlzouQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=g6jeRVMZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341A3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=g6jeRVMZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso16704715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792816834; cv=none;
        d=google.com; s=arc-20260327;
        b=T1a/jXIxjBrFEIMuWEoWLLMTsxr0Z0dwCCHyOFVvWYnBRZ0js7PmcDmEGjNWwBneK5
         KmH2ZQo9i4vblbqRz3M5uh5qvsGWmdiCwf9FvAwjFn9JXK5W9kUsGib52CDYTaY0abGp
         59LM0CzCtq/iATh1Sqb5zHH2/G4CXzH8pT1QN13p9Dvbezy61Nq+ybmcOoihZQnpGazP
         aypSD3gDZqbtOBtn62bN8oijSDKowNoBPvGmhBM4KkMhXusZH87M1srA17uzrpapp4et
         9SfOc4+2ANNQTy0a0RSI8NyHB6VdOBXC6WOg2E9P6xWpVlNf8jbkVLtZPiB28IWRmCTO
         yf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        fh=Tzr09ldjFa5a8ZTlRfXJNPAYZnMCU9knmi5cts3Mdug=;
        b=UqNlZmV4Pvw+jy0jrfMwo2pGgjZQyWO5GtgqxZFgSa6xCoGGZg7rhKexua9l5FlopW
         huhG0mcVb3ry9vApOIqfmnPztBJM+QsMygPjzsZdvAeXfGW3mIGcWXkc2jiVErN8yWvo
         m8RkncDJvOE2iDKjL8EQ6u9lB2jXzwE52PeW0dtVg7mHDMHrbSS9B4JffJNoJQTM10Vz
         j0YMH1X7TsROoRJt/f6fFzkoAVCqXCAuQK5v1BrfLBui7txAEx86rYpMtDA68S44otx6
         MBMA0noB/dYvyVRfwbKO1YDa4/XTxlBshJRykREoJoH7mjyaaezVAwyG+zAYqG1RVO3X
         iVyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792816834; x=1793421634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        b=g6jeRVMZrNnOmffXBBh1xF+gO7saDyvpFtde2skkobYfvOiCueWqIsBgTSeG46ybT9
         dP5bmgfgazzvpJbtZBn/TyBjDP0ZupDYI1XbQY9C7INArmMcItSNE2OlVmG+0vzXpCf5
         azpaXcDsUi9x6nURIP78pLmPQ/VBa8q6yu761pKw6LMU5qojdxvh9RMEJqcIPuXlU45E
         PRFqy64ZJuIeQdM7vZ1yxHkc1Q55KLMkwsnX8zIbp1AQtVRNIYc8/V06EJuZGhZ0dTLY
         wZo8MQaYFjFR16ae1ZNeqyVxmDPz/OujlKN2ociuPIql6tHhus8rLSdiW0VWAo0AJXpc
         ALpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792816834; x=1793421634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        b=rQB2o5Lk7Qw2S5M/tYu6RhC6I9H9RO69nE1+2pooZxos4BKMFmZYzSpC93tA08MWsI
         JnNKnVduQNx4s52RlA8kbVWfoCZHtH2qkI4fqWy98RoF92BQPJW0zFirfZZBkqHDYnKk
         f0JLqOe6GJVBe89OwbPr896ZMslj5RPaqKUO8lepQZaF1T5Lpd5a3XhQZTrl/rH9lBct
         jviW+PjJAVE5HDT36CGc8sckfR9Qu+isVGyQx11/fitjHCzM2TkR7VJ5hOuRJxLgdJo0
         txO3N33Seicr55vtBsccL1Bypj1KqL5xM9ZskNO7yoYqAQFwx/3ZXiEwbVnljIeTyZG2
         DP8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxy5afivtPxzNudDToO1oviCGtzZU+HPDDKYeDyomIJPQsnkGregzQrPVrQR8et+aoIg4PxkfG5IPhQf3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdI9tYDyYNosMUJIFAhC51Mos/dI2wg0yu1N0o1oDXkuKU287e
	9ckfS7W+quehwEYVuXMUs3Sv5PQbWkVM4gOMxHsc4CEAzD2jziSIHkoi1m5QeNF6g8Z+qIZXpKn
	j6xw7uh+43jT9QTjfELq5ZIgjVarRBWZNWeKw9hcodA==
X-Gm-Gg: AYBFou2NG56KuVfr5i2QvyCis0+S051Ou/3AHGFYpyjUGAibd0MGenTZ/sUlI1dj/Qr
	faL+BOO61SgAC8LKj0SdTEc8jt8C/75Q+DtFoVlA45MLcriR1Ooz33EXKzvoRlZU7zD2Wqrv4f7
	5oBFNGZ5rLkz/NIfv90ac9h9we+675eaDD+rUId6HC42Hnn9CD4Hciq6g/GMKY6OX1+UjI1yt4O
	/4+zaH30dzyBQSvyqEtRY1w9y6Qsmok3+4dMFJpktmFlIc1r8lYlcB05k68RkbR7h1td3Sn4/x2
	DDDfWusA8Z+W+VX1FchItn6Phl+2aWqYHVdC5MKjrlf/Xuh1gfS5R8nbvTY/WMvXcKdwc2mPAfK
	sknrkHGYX2RNteedjEPEK+MyKwNajMZ/AwgeC0HuqV+aIEcH1zS2nEp9t0T9DnZgklqCI29xb9r
	cygCRyoS0/EwB0/wAqiG2sCjfjynqn2aRtASfbrPolpkgFdksdn6THXYI=
X-Received: by 2002:a05:600c:1c26:b0:4a1:d798:b08a with SMTP id
 5b1f17b1804b1-4a35aca500cmr13825895e9.21.1792816834039; Fri, 23 Oct 2026
 21:40:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Oct 2026 10:10:22 +0530
X-Gm-Features: AclHuK-Aa9nHvGIr0-n7GYUfK2M05kKCRP7g5XpxhDUMoJIkzRzG40FEBcm0xis
Message-ID: <CAAhSdy3vAi7emCX5aXkN37XicacoDFCSE4Yj8MxRPSosQBAwBQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Validate system MSI indices
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Rahul Pathak <rahul@summations.net>, Thomas Gleixner <tglx@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 10:07=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:
>
> SYS_NUM_MSI is the number of available system MSIs. OpenSBI and the Linux
> wired-MSI domain therefore treat valid system MSI indices as the half-ope=
n
> range [0, SYS_NUM_MSI). The driver stores this count in nr_irqs, but its
> translation callback only subtracts gsi_base.
>
> For DT, gsi_base is zero, so an interrupt specifier at or above
> SYS_NUM_MSI can be retained as the hardware interrupt number. The wired
> MSI allocation path uses a separate descriptor index and preserves the
> hardware number in the MSI cookie, so the domain size does not reject it.
>
> Reject a raw value below gsi_base and a translated value outside that
> half-open range.
>
> Fixes: aa43953e862c ("irqchip: Add driver for the RPMI system MSI service=
 group")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/ir=
q-riscv-rpmi-sysmsi.c
> index 612f3972f7af0..9d957f8a12477 100644
> --- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> +++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
> @@ -174,8 +174,13 @@ static int rpmi_sysmsi_translate(struct irq_domain *=
d, struct irq_fwspec *fwspec
>         if (WARN_ON(fwspec->param_count < 1))
>                 return -EINVAL;
>
> -       /* For DT, gsi_base is always zero. */
> +       if (fwspec->param[0] < priv->gsi_base)
> +               return -EINVAL;
> +
>         *hwirq =3D fwspec->param[0] - priv->gsi_base;
> +       if (*hwirq >=3D priv->nr_irqs)
> +               return -EINVAL;
> +
>         *type =3D IRQ_TYPE_NONE;
>         return 0;
>  }
> --
> 2.43.0
>

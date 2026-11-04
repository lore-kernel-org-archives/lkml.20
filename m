Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805259;
	b=YTejleQr1li1BWmKxzk7dHoe/KTxgTqF7Wj0hmb6cNuTNS4DM1EUiOakIuSOIB61KJ06
	 MuoFfkjRRO/NQSSzsaBLHFf0ylXyUrbzncnXjbXQdU47YQkRY9YozEjSWnr2jcVu3GCyQ
	 FrOb8d9J8DLzVFoTuAlj1NrLem94S9nbefz1+asdOfaeXua7jD6aBbxONcJ9ytj7FchJP
	 OMGneyyupIw0NZKZn35pNGGMrZbNzgXOvMvsrqHi49Cgn48pIFvr00P/lLfHs5JSI7Zr5
	 HtbKQe5rFEBai7IKz3M3wtNsZe14LMy3b13DWFXu2VEUPNEzUW0mEn6AhQavSajC/YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
	b=tDN8c9wrX18jQ+z22ewu0WL5LiAR91/MBweeiAkliFv1UovosPQl/WjO+PusNthX4D+e
	 ZbxXgeYBVZkok1DJb5YVFY/x+uSX7wGGQhAkcuuPPV2eSoxMm7/M7nVb1Vctqzv8ayWRQ
	 6yYw5EaoyFJhnnHHwbeMYQ1APDHQyY43KyRGEX6DDW0vebrnodCJtyhn7EanI3ZssGwf1
	 7E+NcVyG33qlhvhbgw5QYo4qpPJ8pdpU34vYKmjCu6pyXuuka18KcZH+OVWQ/nKY8EV3i
	 8RUn6vY+A0dJfgVltPghw2sRCcREQ1Ce4yKQ4BH2iraBWA9FFcQ4saqVj2k5govhSZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F1606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 682F1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=X4twjPvM
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4395d31228so123485166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805258; cv=none;
        d=google.com; s=arc-20260327;
        b=ByQtOYwRBvzKFg0IByrTvWSgLWpl8lwxnUnk+PgzyTv1smCnrlrBEjttKLmH+kY9ZL
         vBpPoDOi03D0HEVFMqPRZixmWutw3ky7gnJlDZSu7sfdWVLRFUebvIB7fICOEPhcPVjx
         TL/xQh16vcc1NDljsUKFRca/x0Y69ot0/XAtdvQ/1smkoz6fyE2QdRe1r+n5GYFmv9Hd
         r1Si3uVte2RUxr8nzYVEmTISQwcfVaf3mUvom798vHxlHMUkKDwmQkbaKuPfkw7UFcoT
         EBt9PO3gocColM2UnxvPT8nQJLxvySkRH2jHeiCLxqOGsQZB1muP6wvPo2/3KMXpHICd
         OJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        fh=4GflharC5xQvm2TDUhpyLf/xiBeicza9dZDV8A08gKE=;
        b=JJkjn2uCNnof7We8OmQVBUH0JU/oMWqdJl91Qr0pmmDVCPBqD8sjtGFkZ8We/w+1y8
         hUaq0GG/zerSXII1kvA07NzCDbqsVX2ICwcTQshA/AD3Oc4+uU3NRht2LO7xEQUQXPbw
         glF3q3CipNCd8W3QZvjoy2+UUQu0k5vWgtegcKknZkXdNQoMCp91TAtRBRaMFWuGAGS8
         Vw0s9ZP81XggO4KVzTe2ZfBs5bpizNc6k6Py/04DAh/TIPLbJLV7vDzEYxMEHi3qfaC6
         2rdoTTLLipTs9jMRoU+P7jGQauqGzkP4+Hu0p1M2QjxGyDuyzjUt5zyhEBisbfVARCkn
         uouQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805258; x=1794410058; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=X4twjPvMo8O+/BkdL3YgGabPuN9DltmynN2uPyL45WP8/lgf2q9RpSqkWE9pvDG4ok
         P8LqF8f8bCvdIWISi5N0eUisbGtKhcofr5PLsVtXmvdmh6jQtOdFx8I+WtBIyX8Eqosw
         LyjWDJaho3C9yNu6DyNHRkKyz/RUwX6KVM1p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805258; x=1794410058;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7aJLzL4K+pL9DSZnNvSRgm/7gCEWAB9vQb5KSH1v41I=;
        b=swvme06uLhI3EHNZ+WExGAApHoAKrChEyIvjz1j8/c+gPe08saVimx5epDKR4CS3hi
         yDAkgrKlBByvdy2+PZl2TWOaLriqk3SvGr3QYK0lk/7vE3nTu0h45svjC1AhdJMwp+jL
         q3jDuL5SFymFPqffkNT/oJz5qVO7MQh1RN+rwRJ1YdU+Zymml+EqkLnHSlFFv3DsFQ+W
         WNwA+SfPR/NWYupLGclPaigq37I79AtAkMWQB9Ons3L+2GHMiIhhY2xlkvdLj5Xabipa
         LptUiwkoQn/9aePHUq5uH0w+MI9W6zkygtpnsJV8pJeq4VyokjZUgKUc/38DB0tksu5J
         vOLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy03G0EaP7AqPJhjehZbliwTqgiibKipwOmoydX6rgTQTPtAY88wC70495l57M7Lml5xn4cDI4CT2DKv1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GTzVutEyyLLYTJhs79KcDCTVyWykcpXALkCsYdeYLScj8jI/r
	0k1lXs20MFUtkopoNCS51NRmWXEK1/0qtkRq4nrDgBQbov0Zjj10SwIqne+IhQcLcFEhkBNtIHN
	bAtOZ6i/19g/nmQlN7Nm0F0P8Aem+b6ljiKzOPx74
X-Gm-Gg: AYBFou32qD34PyPPJoxauXext8edWIK19zFaGsIqKvm0zwxzzmv8yGGFYl2SWuITmE+
	wdhtBv9PfHZSZLBLOB9scSi2c0AQQVO2CF8l8ZnfMHKzZ2MMsTsYc00eWFxinwCO9vHLrFcovsx
	cajCgVR9ov5F/6kUaw532A/grT9swVkUxbgoOMZie5sURoDCCfvQ1Sd5umFoobcgEB9qvkTZqvc
	MNFP5S5b50F+NyCUs9dg+XTjOxy5mJU4pwFfhXz1CUf1QKlqFIDDhRPbNGZroAMHX5JvBvs7Kbd
	Mq5yYFvSjcJEy1FvwFUkQTLJeyv5d+i0fa6z9lR6vWqszr7rOG9oVRhWNvccW5ejLwCSyPNVGl9
	BOMdyRNUuQIgi9DWLji/b6RokMWN9TD/fnNTd6hRfx9DX6nX1BcD2HHvQRMIQeNi5zP4YCkg=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1586536466b.14.1793805257870; Wed, 04 Nov 2026
 07:14:17 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:16 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:49 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-11-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-11-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:16 -0800
X-Gm-Features: AclHuK9ApV58fCR-2zSxW0lIXRwkMPc7QZYOG9hrN35s6jfXd6uS4NXmkfDPcWw
Message-ID: <CAFLszTi-3DOb3GxHdDW=kxBFWrynhnnrvXNdQLnkRnyWeSOkMA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> libfdt: overlay: Make fdto const in overlay_apply_node()
>
> `overlay_apply_node()` only reads from the overlay blob `@fdto` while
> merging properties and subnodes into `@fdt`. Mark `@fdto` as
> `const void *` so callers holding a `const void *fdto` pointer (such as
> the upcoming `/__local_fixups__` update logic) can call
> `overlay_apply_node()` without casting away `const`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  libfdt/fdt_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

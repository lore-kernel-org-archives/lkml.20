Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6239B970
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200216; cv=none; b=Ur27tTHJghnN+LnWcWzPZrIzIRg5FopRtj52EMBwwn8zGUhdqf768vJofQ0Y6TLYoOZJ7ropWDZFfzIGg/F8fXOlfUw80d3gjFE9ovahiPPmMbw546ERQp5vrhDHKGnCO6FFEXG/iuIB5waj4KMpuzaZ5hAkjSBLIQo8zXzT9Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200216; c=relaxed/simple;
	bh=xbw4b8lag8MyTeGZcrb5hN4Ez5F8B1eouB6Ym16ffLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbIzhlsDyhmSsp1B1zrGPk05H0CTDzhMhurs46rZwpapu9ulyyTjp+ujjjpZR+tgDhrxFXt1Ci5mOpohiqgUwW8Y4RIk3rRqLI2pDvKSHksp8gqq7z9y99HEzEnkRe5jZJgPbqUOnh8mRoslFai2QBjWSpXCpC86szIrk/Omm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vcd5GHpL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vcd5GHpL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197e7e4e94so565849766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788200212; x=1788805012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QU1kfWJYR+xjkRuN6RGZEPHu4Juq/92TUoclvitOE8=;
        b=Vcd5GHpL+B6lKe/zgKK2BBkQJSvxzlIR/YaUuyROJxHfXS4TavndXRORpaetCAxmmX
         h2eEUxpKPVQKU9QRnZ418UvLPjaJHs20la9ABiwZs8uFR3aXQVm4V3jt/EkqMt5ej/Ct
         VivLhcA+gPf6an4dVPrIDCtosEM81nSy2Vljc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200212; x=1788805012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QU1kfWJYR+xjkRuN6RGZEPHu4Juq/92TUoclvitOE8=;
        b=FzLaXX7eDHQhdr65SGNp1Z50f5GHHvkhLl7AWzZezzgKLs5A51qAf8iViXR0ZWsl/s
         T+Zv689oXUucye9I4ui3QCJiE7eBh9MIHlc8PTgezP+TFYeQ4ry/9ma62Cv3x/6F4o6q
         dnN4Vx2xSbVvTnb5F2qIeSbm0NRqdzxEysRFslhw9ToX20CghPMd54sbdTWOy01h2NpB
         liaDdOVYQNR7ng4yyRABych7AX4+fPIyx5RvdD3r2PnenVxSwxqglOfoS+NiU/dWkuWK
         ya/PYmde0AZVfQvAnuVWSr0+nl+RnMtlNGvLDommPFkaZ9d5Sb9nJ9XZFvjkvSNODkRA
         tgTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9DEEFcXNEFoFEFajMQAjm+G8HMhIqe1CVwn/NLsnOYvvRv0tGrdA6bgBfNwJiQ1jL084ix2srwxpxMuE=@vger.kernel.org
X-Gm-Message-State: AFuF++kDSyKHyacqLDDl8IkggPCGtkWTIRXDiS9X/v5BW4J2cXl/I2j1
	CLchHCSbLLEBAyO1mey7SrET4CBNIzL+eBLMD5f+7/72/tRYE73DBgORYeveu8UHwj/N4ZmD+zV
	HXYRcFss7
X-Gm-Gg: AR+sD10rcGu9XM2W+U98zSIUYdC3u65Ic3yRbByYZbBbfFT/Ntrpe1M0TJiQ0nQEqkv
	4ETvnmb+O1Xlea6Qz2CBrovfXxyMCaB3B/VuitfuF/kEGGlJ8q3ka9vVDRLGtEjEoddCPfk+RPv
	0bZHCWomTRcKZ6iGq7pZ9HDUCepreEel0Jyhaazv6XRn2iFhbLdT34kJM9smJYAZwJKeP2GQWr/
	/qKfQzyQsjVcUm2bi3b0KnMbaI0GZWm0tWsbT8gqR7uEkFMVJ0mdezoKIpe4z+IouTTQ5TnHVfh
	6/17fx0STekewCCjCqvU2iV1Ehpe4oZV3EOXwuPLfZ5qNQ6zfFS7iTqA0xGnN+9zrvKZBoy9ej7
	b+/oTe+YrosDPomiCM/costVG4H2jYVILpEdiOWqnnYWnxc3oTTSDCv1l460CYwou/cBYpPp7Cg
	0DHVN0io21QNMnNg8FQYKz1CbEWSSt+fPz/ZnSGcj4aFKZyUlNqZNjI4+unzbVlAmk/kPpY/r2d
	dt1/LSHxVvlaNQAewZ+mWTZ/2M=
X-Received: by 2002:a17:907:c01c:b0:c20:af9d:454a with SMTP id a640c23a62f3a-c25571deba3mr1841223966b.16.1788200212219;
        Mon, 31 Aug 2026 11:16:52 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb965sm493434466b.49.2026.08.31.11.16.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:16:51 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso26726565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpFTr1wkJwAciQMRku2mtYy4NBnxFY7hC8cj/tZXqjuUVJ/cKpWKlkxQ/YuBQYPwU5p8elBwN9Iu+KRerc=@vger.kernel.org
X-Received: by 2002:a05:600c:621a:b0:49c:dc12:2ab0 with SMTP id
 5b1f17b1804b1-49cdc122ac8mr48333075e9.11.1788200210130; Mon, 31 Aug 2026
 11:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-qcom-wdt-nmi-series-v2-0-363979fe6b6b@google.com> <20260828-qcom-wdt-nmi-series-v2-1-363979fe6b6b@google.com>
In-Reply-To: <20260828-qcom-wdt-nmi-series-v2-1-363979fe6b6b@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 11:16:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaDEWktsK5vNWJY0txA+YJZcjha-VPhmKQX=XS5pF+mg@mail.gmail.com>
X-Gm-Features: AcwNN1VV28U2KlLG_KwlvZN_vPKUX9__aF5EBSUQ4pSV3pF_j6BfJodMLb9TnQI
Message-ID: <CAD=FV=VaDEWktsK5vNWJY0txA+YJZcjha-VPhmKQX=XS5pF+mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Mayank Rungta <mrungta@google.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2026 at 6:00=E2=80=AFPM Mayank Rungta <mrungta@google.com> =
wrote:
>
> When freeing an interrupt requested via request_nmi(), __cleanup_nmi()
> currently tears down the NMI and frees the irqaction structure without
> waiting for in-flight instances of the handler on other CPUs to complete,
> which can lead to use-after-free conditions on module unload.
>
> Because NMIs cannot acquire desc->lock or set IRQD_IRQ_INPROGRESS without
> risking deadlocks, synchronizing in-flight NMIs on other CPUs during
> teardown (__synchronize_hardirq) relies on querying the hardware
> controller state via __irq_get_irqchip_state(IRQCHIP_STATE_ACTIVE).
>
> Enforce that any interrupt controller claiming NMI support via
> IRQCHIP_SUPPORTS_NMI must implement ->irq_get_irqchip_state(). In
> __cleanup_nmi(), shut down the line, call __synchronize_hardirq(desc, tru=
e)
> to wait for in-flight handlers, and only then tear down the NMI
> configuration and deactivate the interrupt domain before freeing the acti=
on
> structure.
>
> Also add a WARN(in_interrupt()) check in free_nmi() matching __free_irq()
> to prevent freeing NMIs from atomic contexts since synchronization and
> resource cleanup can sleep and spin.
>
> Assisted-by: Antigravity:gemini
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/irq/manage.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)

FWIW, Sashiko's feedback [1] again seems relevant, so probably a v3 is
worthwhile.

[1] https://lore.kernel.org/all/20260829011449.87AF11F000E9@smtp.kernel.org=
/

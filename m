Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805265;
	b=T2lxw7o6P6OX+7VBUVUTFSRlHfbnww7D4xUXCgUi2Fnaw3VLUFwPKDgGwc1ITmm3sNUh
	 IGDrC5ul+2QAiN9j70hTudSlW38MagqLsUiXQG96vnm6qdZvxJIeVdUYzXt96MR62hwHE
	 YyftbcI7uIPihVQpoTNEjgIIFPpPDOtPPgcQX6zTKtor7Kiq0udDLELr5g/APlfB4f9/3
	 uBBjSCTqKnEPtO3S9U3SvpV6bKMJGi8FQZ0tvg2f5G2l5kYk5Opr/L9pi46aOBjHtcGr3
	 8P/6J4O0F0E5VJw8jdsM6LzYji/YfNpsDhyTanrdMz3MYDfikLHVlHJ3nF7LJtIlh0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
	b=i7EKsK9E+ihiK96/isbMkZkmR1BkW5CIiLBbQla5Rqv78kV7+qRD0Ah3CYzNf1LVJlzz
	 uOT+6u3c4NRBMICSrgehri4oFpl73ZXWEH1+bXzRgch65MlST443V2eQFcFhbdvQx2wJL
	 izSKIN2IxsYgMN2t5yREmGMiqSfhD2cK0LIuRzJMQ63QnhIHOfNiBv3qKjg6EKBewoeSb
	 N+aI11425MnJkQ/JSGRQH4sBfv7q6wH3C0XvmZOdqmAcorjPwiTGzdQYpPH3G/ouX/pW7
	 HBsIy6NP4UNtvQi2oIJdZdD49wexTg7EyJUvyZqvTdb6g2G5wTa7I9qo25Ooq8OCPKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0934D606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0934D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jIyQGiA3
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2804285a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805263; cv=none;
        d=google.com; s=arc-20260327;
        b=p+ZPlXxQQ4FZMQ0xXHkg4up3q58+H+HJS1ZGFPPZghTHj6o4G2gE7fU0rjlaxdBed3
         dQCL1PW8bOXR99mOsdkqrjWr685kutiUn64jv/dBLFQTdSDFgyPo7ifxpD/2EGO57iPo
         4jvVmUju4oVq3waOqyWbiuTstk+rDYYT55LHzOE7c0hgt0G9H3tevNaIBsetMZbBFlPp
         Q7kcTn07yeHlYcWgsxT8SMUI2ZlyfVhNSkjtZe7CBEOCbZFYwTvsZ7ybXdC8GqwQ0PKX
         ie7HdIDR+SMXzu0xB7rE2uWF2VnVyFNNqYWYlbmuYYXEJX8+kbhKqIk8Ison8sbMOjfh
         ZaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        fh=a+u2QKlkBXSLdHoSsDfmuRvCCmui0Z/W3bWYOGkYn0A=;
        b=c+tHntXuI87aANkjQkw2+0/KSkcKWoXm5frQaFiRG3oeH22bYyZuP1EsmfJQwTRCpy
         5WuT5N/QcbFOuu63i3ToPrXLiwIw33A4rLmglb33HSWiOsCJOBYmozBmbU1aIK8V7Eu8
         5V0XacrsrlRcbhIcGju9p433h/SYOnNDMfNxFdUFFK60o9N8ptxSR6SEPuUeS0KbM+lu
         L1IEE+nur5LGn6Kve7A5TX2q0YQMpSCitZT4rB46mOja+8xfAh9B1LHncBMesp7gBTYm
         yFTlykWlGoU7rvWnwiIeETMiE+JE48PAm71dlZVCKjiI/OSSQLGLcyYHXa/k9mODEXBX
         vEiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805263; x=1794410063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=jIyQGiA30ggNY/gePK9uAOpdjZdjmmpf2PywAnfTbXxFbYkCteIj7r2oPuvoZxleFF
         ZO+tsaqgMRQlICWQVBxB8SH6FvY0uij7Eaq7FEtjjhp/CQrmlpsj05TdfwqvyPNIdleK
         5c2qtd2XkN51j3OvcGjx+HEh73YxAytA0K8mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805263; x=1794410063;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l4au3qYusgikFbRlpJHdB29Lm/tp0bsQekjwbnjpS9A=;
        b=de1W77qoPV0Ac8aA6OUvSU76fTCx2UdGM+Kp4A7FgoWVb/Ktxe6MyCGJriTU+Ajbb4
         9OnSYsgK0H+6tx6qz/w+lx8sBqeB/bBzI68RX4vxyPEpENhvTnO9+HYnsspEURZ1mLh2
         1IsbT6+AJzdwd6GHbEZFh52J5sKzcKt1fteIzZaU4fryM3EOvQY31hWER7QHm7lWGzlL
         RfwL/Pm7KAmhWhgokywLbi8CoE3JJXOZ3C8Z74JMrEWypBHAe4PWhrm97g0377k+FSiy
         gftaS045qIXMdYIqaJUihReto+zWHQ01076IPcflxNvbdnpKiw1t51Yi7+e9R3gcKrWl
         dSmg==
X-Forwarded-Encrypted: i=1; AKwUvBy7Kj1/7eVcpME9BCGbKD+USJJ0sHTQUoUZfsCzL71+jyP5eNb9PwBpOIGA5wTkoZaZBTFEKOfOVN4UsfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eq1lsooiz6oFUs4LGIxtBphGlCEUEnUkAFBS6EXoT7LEhjdwl
	SRkP1rvYmoIAHXVpVGGDC5Hcw1/XXggKF402Y8y1Op0a1Se6uX9zHBHk6+5kg4A+49bdB8ST2JA
	NQIfzuJWh6IJV2X+fyj/WAZ2sQhNydWf2tzdG8uC4
X-Gm-Gg: AYBFou0mFL8ud9iseejimBpynU2s1gBzndin98SO73h3k8lKvPc/UYuEbrUS8Xil0Ul
	WWLEyM8QtQYkdqw4UttlW2mv5W8pnsOUbVX3IFHTUbNCMW0K4O6x38vBTi+8C2BFmMh4GtARS5F
	FawduTF6B1Y7PJLNmXlHIwFBXKbBdxenVvMnmFGcofWkPPsN9eekgNanwiZDWOZcmySnzIPWJ+e
	S/Ye5PWruau9T5PtGwy4tOD98GaUQIOFeluEYdpugdVfGK5gUSs7yte3Os3ejaKG8SA6ITg2QVr
	nv8ck6qCqnKVmyQH8egCGbYtpFrPxFRg6bfekw01bBr/KBKxv+uAPdieLR6VctckBu5PdJq5hkP
	IRUuTT7vhUYuiSZl/AlDTBK12+jFt3nCr9oxsWp6xyFUkO1gLYWBrWq/wYnWeHs+lwDSxRMo=
X-Received: by 2002:a05:6402:a6d3:10b0:6b1:e072:763b with SMTP id
 4fb4d7f45d1cf-6b4b0b821f0mr10620274a12.5.1793805263475; Wed, 04 Nov 2026
 07:14:23 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:20 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Nov 2026 06:16:54 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-14-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-14-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:20 -0800
X-Gm-Features: AclHuK8NWGTzSKUvVKtQyz5aMNFmdu9T2RyI_tRUYr7JqriTGegWmwNChaR-jTk
Message-ID: <CAFLszTjBv_oQ_hPY=rzwuiP3sZTHPzBGoo1zcBgktxYO8Va1jw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] fdtfactor: Add -S/--strip-local-fixups option
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
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor` without `-S` reduces total
> uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
> `fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
> 298 KB by omitting `/__local_fixups__` from `base.dtb`).
>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> `-L`) via `dtbs_equal_unordered`.
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 18 ++++++++++++++++++
>  3 files changed, 53 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

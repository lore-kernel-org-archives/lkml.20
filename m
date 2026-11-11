Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392936;
	b=Zt8AIMYAXO+tNDDu2FJH2l6Yc2uhhJCjcBBDpkF7PfUwqnjrupyZnjMCTDlMfwt7Xq2W
	 hkQgPojrTS8BzFONiBJ24liI541xJrAQdFL0fm/G3FEdlfcBod2u4FQmjJpMLsEDcD4gH
	 5JXmcJvlos3w1liU3ajLvkShKDgolAdAsj+mdOCxVpg3fpJj2FMVc50yLsxrlwp8ZtjPz
	 OrORFLU8ckPZC5V3918UIjtpVpLIe4sWR8akgpc5/ay+aFLgPxlLMPDKimC/DBiAd1l61
	 6X2ecvE2iz6aVAQAF70Sy3zGW9QNB+7/AC3XsiOIWL5eiApKHUHaRsPHxFJzldQk5kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
	b=qZfGCxg3Evvm3EFwW3B+ibdsmumtrHg/8v57sMacP/Gpubqrkb3sR7lTVCkXEKvar+2U
	 wm1AL7nHJhqUSkK8mn819+f7adzQfqiO5qKn/qDmouMSapeafQmhYZF/s9T+dhAMrFBQ0
	 LIYeKzpVNuNgEL67lttl1n2eaZTZkD+soXUL1PbWJOjDJvUY9Oeulws8WENg3XmX2zsHj
	 uqb5nZOF2Pbkg4wWhQKNLU2nbboxRutZizXAH9qrGHpneNTUeRzqosfAHXOPmSkxw/Eby
	 MH+RhgwdPwEppv5eR/s96nCrTlrKiu/14VHZdlO89ydo5d6m7zG/mGqRSiCZDzNV7UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW39RcL;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B721606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B721606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW39RcL
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso2341147f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392934; x=1794997734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
        b=PjW39RcLxzoGvtaKcQYDQP2va3T9aZKhVStCO4PitYqiXI92QH4v+JUentad+6tFcX
         c+UIVPyEMpkFJVvDxgUAmsb9V+25vMtzatHC5XpytY7COKz5m6B2DKxs61dzKDdx5q1C
         IB84sEugGeoLpsKYMjMfSHutuS8Fxg0BDRCbW8oRrNGJ9I9TiLf+yVdiU50A3uGbJxqv
         jTc6W1XJX0b/KWLV4qVe++Ze3WSf/bx7y7BXZWYq/cpGiYtnpIx7WeoFZVUy8LjUBMmz
         ohQRcTYEJQ7qB7CjNPxVVAHw95KNReLbkn0GknrUihsDOgV1LQnP4SGx6bLlmuX26UZU
         Qr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392934; x=1794997734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0n6tEIf6xgoVedt+MafTEKXaK+IsDQRgSWIh9QwpkE=;
        b=yKIe4xC0z+kh8ffnIdSBvcDX3KkZvbrbaCoz/4Py22RkxqtEIk65tq6cJh2gyTpRWV
         wCQv91inYICFphiEeQlUa3J/zeBP/IByDpcGVOoT3gbBM1eGPHmEOqAZiRng09XtQxOw
         E0FMp5Sfylgwx2wwzLWgEXRRJn5arkfgLndk6jTf192jPB6zZiY84SRcsWNv0A7xHDMm
         VM1zdJdpBQi5jLz3L+U8FxT0kXYGomz4LyTEv3irllimBLP2OiieqMC9L/uOp3wKXwAe
         mWtNcGD9AOHuU4LRLPD/q036hOW1MmmZuauRZF89JgkVVMCpxyeDbltlGjAukVrXWw8w
         rd8A==
X-Forwarded-Encrypted: i=1; AL+hErEzy67jm+Vopi6vXD+8DFG34J+0QdASGMbuRB+hWHFlek9Lwe6X06547kNpbW03FJ2iR8ff7ZgUbs2f9dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YkaBoFlggpBJDlQxk5cQ1C1lbmK7ZNxwEvIQPUXzKXxrgQZYR
	a2XSFlEDDrK7wxMeex3+VMUy4HAj3KNvKHlO6saxf6TfTT0gjLkcbePM
X-Gm-Gg: AYBFou28kT0TroQPulrZJfbiJO7s0pur1AE7M9DGEqVyhwd8JcJ5H0VF49eZ2eEIKU4
	G5ksl7E+fuFwM8ZqVmJFP0h0yODF7f+EhCJOkc6WydUWzLuI4ba6tIjexStyPbu/QC4/wQEfeQj
	B3qa5UDPELScpiblqtWfwGTnkf4QUdrqw12dB0MMIV43mTrv29TcKEuqoGqfAvEb8NMbZFYTEaf
	IxcXOlWh6VVaQZS0YvQIlS0UmGRgl+tf6rabOklBM0vs9FsqBliZPaEjr6qfrXfok3r/jzEnfxK
	q+lz9dpftte3+uD33wjnarQ+ZrLKbH7uxnR4nRGr7PjX0PzWOzd3dbdcmsHeZqS0KcCtrwU19HL
	mfE6A19KxvUThyE58n2sxJH8Xs9Js3YyIU2aEgxLl5oIqU9YHMrStZu5/N6wYJgsUYSsQWHa1Nv
	OolulP1FSuEGE4TvD207EfzipEmbgNE9NtapfS7WEM+kjokc2bAJdXnZsF34M9f5dseIHQ03Bwa
	OeDPJxFc35f3qlahn3nxe+uhtQ999iyw+EWDSNBRh4i7uD6514ysOBD7xXAjbToYRvxVtPEMITu
	6mwMdOUWoQWz4GXN3f200n7kn3L7pJRSo/WsbRQTJdcqQNppdaEq8uNvCdSy6O12WBeUok8pVi7
	sf1w9QEg=
X-Received: by 2002:a05:6000:2201:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-499c9dad952mr3537266f8f.42.1794392933785;
        Wed, 11 Nov 2026 02:28:53 -0800 (PST)
Received: from [192.168.68.73] (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm10342588f8f.10.2026.11.11.02.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:28:53 -0800 (PST)
Message-ID: <a64e2fa1-6670-4018-80b8-b6856709ad5f@gmail.com>
Date: Wed, 11 Nov 2026 11:28:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: reset rtd->num_components after
 allocation
To: Kees Cook <kees@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
References: <20261109102536.357134-1-ghidoliemanuele@gmail.com>
 <87bj7yw9e2.wl-tiwai@suse.de>
 <87FF4A7B-853C-466A-AB01-2D9137DEE6CC@kernel.org>
 <EAAF07EF-6B11-4EA5-A5AF-A7787CA2F196@kernel.org>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <EAAF07EF-6B11-4EA5-A5AF-A7787CA2F196@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/26 06:59, Kees Cook wrote:
> 
> 
> On November 10, 2026 9:50:08 PM PST, Kees Cook <kees@kernel.org> wrote:
> 
> For example, what keeps snd_soc_rtd_add_component() from overflowing that array? If you want to protect the array, add another member, say max_component, and use that for the counter, which gets set at allocation time and protects the array from indexing beyond the actual allocation size.
> 
> 

Hello Kees,

Mark has already applied the fix to for-7.4 (d00ba321499c). I agree that
your proposal is far better, but the applied patch was meant as the
minimal change to fix the regression.

On your question about what keeps snd_soc_rtd_add_component() from
overflowing the array: nothing, and it already seems possible today.

From an LLM-assisted review of the code: the platform loop in
snd_soc_add_pcm_runtime() adds every component that matches the platform
dai_link_component, while components[] has one entry per
platform. On mt8173, for example, the AFE registers three components on the
same device and the front-end links use it as platform, so four components go
into three entries. The extra store has gone unnoticed in the slab slack, but
with max_components as the counter UBSAN_BOUNDS would report it.

I can't work on a follow-up. If someone picks it up, components[] probably
needs to be sized by the matching components before the counter is switched to
max_components.

Emanuele



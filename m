Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792923433;
	b=gcYGUs9AgMEM0gFYoOngRwIhv9ip2sZPk9e2fAIER1oyuUI1n0TRhfb8caKQggalt0tN
	 yYOnBykGZONMZLfKiKMGSboPoVXmd5hk3OfjfXPwbjptPc3l+DQkY5gh4evuOuYoQ+xJ/
	 g10qg5xdbS2Gqb17KaSXI5FOm2E2klAzSbf0tQhqXQwGjI59bWKOY8k1Penkmn+e63yNm
	 280RSuM2eXh9dB50LXrJnJScYBSTKd86+Slmdl00x71mDGVCSeb9+9VVJ7H9/DerMbXZg
	 ZyK4HLc04RPzBR3pPPw5JOTsgaByDKCtg2VNbxHGHA3mdaT8D/abDPUchX9zRdW0SPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792923433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p55qrhCyb8bxNriwh0vS71dSvlmsqPiAx/g1ELCZR1w=;
	b=Cdd6AYlloK3liXsTyH17L4zvyzhgRD/hHZsjPlZbN6DqgyKOTRZcoXaRi6njRGa15J4p
	 IyQKY/f3we4S52m3TLafBnpIspEO2OKheu44TGfntlOJPkfgQHzf8eMmE96GwD/kPEyXW
	 EwwH+dLLDDOihO5M2kvdlU9yvqACXJKFy2tqM4x9kTFtgcBkSh97lYJDtTKb0oxsFiNBD
	 UnVduhy+J4w7D8mRfFHS1Tgn4MOzSe8j/PxjPPO4vUneAmNtymBmi71h/OerWGEiYABvq
	 rJ7UKnE0vu8Q/kD+vazushtCCrYJCxIjeNVllBno3t5YTB8TrhVEPnEOgQTSK4ZlXVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dicwZ0eT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70F606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C70F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dicwZ0eT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1631822f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792923431; x=1793528231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p55qrhCyb8bxNriwh0vS71dSvlmsqPiAx/g1ELCZR1w=;
        b=dicwZ0eT7zq6YUUFB94I/WXO5NSlGex+hWh0GEVXR44ffPnN3MbpD/WEElftVxleU+
         DOuh7AXK1KJcOgKI15DQCk8hylTYjJ4XHQqisS06cXDne10O0kaP5JgNcOsa6u5DLnMw
         IjZnTxtx/fRmOW7Mx+POEbJH6h5nffujIGdqSYpBm9K8MraGb7luDjNM3rggiyynruVl
         LPyFfYk05E3DaN4m4U3AUwPYRUfyiohPyN7tV1Lq4TJ8ZCr4JYPaoaSstlLTh4s1vIKV
         iGQn+IFoGseKl5dEZyWX5pFIFpjda3YXAGpFMSctygoAk23DtAaJ5nPJ8A13vYsuPCc4
         6DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792923431; x=1793528231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p55qrhCyb8bxNriwh0vS71dSvlmsqPiAx/g1ELCZR1w=;
        b=2RcTDhJIVi3QyAiNCTO64CfZ5e8rue3C8egf6BjgHI75f16EOhxZe1CXXa6exCr5dj
         9NdEnqDCJ5eyWWMy5uf5fi9cunPFZypqQ5hCXv/X++3TRIb1m+hG47J3ftwszWvgpTpY
         18YTXsyqY4C/b4Dki9nWKcESxZeDFKN9Vqe0JKE66us6TFnO59eCSKvC7oslS7VLiF91
         fEIj5IG8ebxQfp6LhYKXL/DFfS5RZHMNrx8cTIu5ZEB67OOUeGx3tA0VYYPBJ2gSu06g
         0xzqHr/YQJoNg3IkiB3LDh5Bs5KolfMc3aHADiPAioikMe8K5CHPBBYs4aaPy7alfUAD
         pBqw==
X-Forwarded-Encrypted: i=1; AKwUvBzq5Fv4qeXN9M4JwR4L2sy7z5FNVFarxvX6wyvpVCj3Ur2v5bh4ayIO1G5ner3Ew+O+fH4OJ9J8I/MpOmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXsK4QWhOc9VWDnN7P2VGDRFLNanWQpYa7FViyKIq/gLc35nz/
	b2y26IIcTXXbi0QGdajKi5XSxDab/J+HaoR5kBuDmPSsimrxk86MlT1u
X-Gm-Gg: AYBFou0oJtKml1yAk5V96+ZWSyHcvIs8fIw99ULMu1R9PO29hSQCoV4sBMG1q/bmaZn
	z0A7pJP8VFFTotAr8axZ5Hat++1MPp8c6iO6bfp2gupTk9bDi0wWEY92Op/H27SdbpUgq7FC6Ui
	fLnVvwGT9i3+K+s8FJ4aV3A5hI5xFgVr+MOYxCZfMDaqQDOITCsv6RVRXldb3lyh4AgK/8H1MuL
	a3DUYQUTPZhdA19dMIbR2nHkqM8m9VbSkuX18fwIctNiFVoXBwt1T32jZNjJxVAfMVZd3bU+G0K
	oEKoGuBJjKS3RYpNVOCV+0f1eYwpdi8VlPzQB+nZYUySq4ZDJjaxr02i939xSRR8/rOBnTGFgVM
	YGQydnmzl1nkgqRb7pB14K1KuGj8Z9zjdUm/ykAdbmCOC4+roSL6Xr0UHq/PKfCXPDAOUkl4HDm
	X0p6aRiA6ubVX6q8NQ6Dco98BcgNlDE9Px7v8vXVaau3W8iSxgOmBDQqvmSsrfk3ZXrnHR94ED+
	3m4nYEcn+rcCAD+BLfUL4qzv7lwvHQDrKdBXEEVNI+Mc8HCGztfsooArqCWrjmxa6cDzLyCWxCP
	ZHvVVk/A55c1z8Bq3+7Rr8e58Lfrj28VJozrMc1Gi0MuXs0BgWahe+r/TRCxWJ+hX3QW0m5qE/5
	6hRl2MKPg8r1vrGKNQ7yZM0PmN+VD1gr1KAUu/P5a1TvCelK227VFX2ei5zr6B/tU+FkksYsMq9
	vjI5hUjIJMtJp+
X-Received: by 2002:a5d:588f:0:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e3ed08f76mr7079445f8f.8.1792923430870;
        Sun, 25 Oct 2026 03:17:10 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm9068776f8f.59.2026.10.25.03.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 03:17:10 -0700 (PDT)
Date: Sun, 25 Oct 2026 11:17:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Ariana Lazar
 <ariana.lazar@microchip.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: dac: mcp47feb02: reject out-of-range raw values
Message-ID: <20261025111708.233f7fb8@systembl0wer>
In-Reply-To: <20261024214423.865635-1-devnexen@gmail.com>
References: <20261024214423.865635-1-devnexen@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 22:44:23 +0100
David Carlier <devnexen@gmail.com> wrote:

> mcp47feb02_write_raw() writes the user supplied raw value to the DAC
> register without checking it against the chip resolution. The parts
> are 8, 10 or 12 bit, and the bits above the resolution are not
> implemented, so writing 300 to out_voltage0_raw on an 8-bit part sets
> the output to code 44 instead of failing, and -1 is written as 0xffff.
> 
> The out-of-range value is also cached in dac_data, so it is written
> back on resume and stored to EEPROM by store_eeprom.
> 
> Return -EINVAL for values outside [0, 2^resolution - 1].
> 
> Found by code inspection. Build tested with W=1 (=m and =y) only;
> no hardware was available for runtime testing.

This should go under the ---.

> Fixes: bf394cc80369 ("iio: dac: adding support for Microchip MCP47FEB02")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM

This tag has been deprecated.

Otherwise LGTM.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts

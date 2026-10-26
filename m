Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974229;
	b=dkHTmafUFbdW7sS7uuQnlxjhbSnoOnv++cvUt3cNv5Jdh6HvEmUyT3SsP+WQ82uyCf1z
	 9newO/0nDVQcPJumj51sU+c+8Olz8VuUSK0Yq9C3QvvlmN9Q1N5fDhykWj4VFnkMHkj8B
	 O3tBjiKgUNdwWeNjMH1Uz7TIg0kHau3P14OHA1TOKTZ8hxXG3zg2UPgwuyo7DOeJ0UHaU
	 FxmFFk1ZO4OFDfOt7sRXMx3tZV+25pXYRX+L8xdE43f85Rlm9CAjuwbmoWmEUFQiwjdhr
	 uSmVdfpZTrG9NK9pCFukdfHksTCrpkztgWzEVmmp+qyynrf0ZcC1TGlESZ9kEpeYkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
	b=ewJGrj7AxAtlZzjv08dspGxaq3TEnSKawl8zHo3PtMvn/p9T4Nklw9/V/BNHAopSPvpm
	 S3NJ53i3TbGk50pnAb+KEzu02G5KZLF4Y++zvoe4tgUNTygg3yaO5H0F4aOjzp+7qKsmy
	 RT8P+qtMjz1YYxSWDs8i/g/dfY7J058BYPjEoh0sF0sysHolCsYDdCHMZ9L6lkxf4D4ju
	 u9h3XktTBTKTJNNvzaXo623eN/76Z6T92cueRq+xgT3MQ5cWxAczZMoY60vEnQrF0tRKm
	 mVY7RlSRIt4tNYRzUhcGmBujGLuFz9SbMnNpHVNJVT/02q1h5HIdLmCJWdtQTaYecVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c5O6rA/0";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2683606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2683606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5O6rA/0
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1795186a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974228; x=1793579028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=c5O6rA/07U3TPiUdjyQl+0E/1QGQKFEd/BuZr146AnkMngEg/j6CBnibvZSqG0Fd/U
         e4xYnAbkCcJZ1k93qWPPfj5VllNNTSBCgJV5StBfQdExN/DGAdLuzUg0d+8BpiUz+dWF
         8k8Yh1uPDnH3nRhntCgLGxU/EuI7hZF/CcR4oFQkXMUVcuTWXLK9tsE7bHqwgN19O4Zd
         Cyeu/xE4r6nEEXj62dltqk3zE19zxhJyrgAJVuQnqGgjnQ/LBWSIkIOro2427PZKPcis
         CuBDXBzun4bni3YIS0qe8Wr7agcu2YNAB9TuCWvtGR2SX0aXsXlmznXP+M9fy4lE0ZeB
         LV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974228; x=1793579028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=WvuBXuNFclzzYvC6IWLHa/mfEo/d+SCpkK/uC1+lO30R8di349Ob3+nsTNw6qBh28N
         kY3NBK2/9X46ATKyF5RE4zzFyBq5t5PsM/oDN8/B07qQoQXxMCkYdD+NW+c9AttCUCXs
         JAQBHnGPmF7d0RxgwF0/KYKgN6+OsyazEgQWvfGciRDs4aw89DKpVHnXu/5afvLBoA++
         hPf8pzJU84wFpbN8S3LFSnf7JUxBknQF+Rxw4E99jf7xlQRyc8LstgtmPkF4V0/jdc3A
         AbRJ4fru1FFAarrDKotyBgK8CaUAWgms0Qmx2V21OzoyUHbjEGqYNarxyDSUWeJFf1Dy
         BihQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDayjJrmUVKm6xVfqVNkqCr9bjSV4a+3ilKfgqp5Y4UQ/aUxn3/VtC3gBhr68+SFrC7vhVbkZhd2tGTKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeN2QhPV8g+akFvac+KwZCO7e+5rfcSo8W2TSUgH3CopTtp8an
	jGFqjDZ/IYwZT0MMMnF8nscrcMf2ihbFodK0Ly6+cFwyNFbAWxEzUs97
X-Gm-Gg: AYBFou3zXIuiGb1DXuHmxSAUiW21dhFFC9x15VBGHU+5QkfOOzsBP39ObePwuHvArhW
	51ycEWV37SZorvJ4np+s9yPDVb/R2nVtK5SySNTOMY4gYYbzsuavIfyz977brJzRo8EaFHvS3qG
	v7lxNPZT0ld5AqhHnVtZc1K22l9bJUe4yFzJc+DKTGhDvhhv50EjB2Z/cDic2nX2riTrqBZqFR4
	kyDZk15b+FrixSHiTadrT779jGIGlhdr5TKYxtjhnPpbiC+QPqpJC4GTCDsqpQbYpXSczQ84E5p
	lV4Iboyfo2V+qPEy4BktQu8WiJuArLCzPCSapzSF6iszP7JYAwrXuzP9kCs9YLV/TC+yHCFdY+g
	PsJ/0iijy9vss3cSsPpxRGPOnx/9dHf1BMn5CalPPSolV9WjLoKwUQCgnYYwqgU4R1fL6mNTyHp
	2i+/rJJSWgl0qRPvzhF2oP4ta2X1LW5ZeeWOuFBNrLzOHOo2sSLxwwMazaOC1KWDltLpA2cfcTI
	dBpEm6PvjOkmwVWnJ07cVofzKSoGhI/fUdR3TSkyrruFFd2jcoHhrFhcwGBjhIzeD6/Jg==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5091396a91.6.1792974228365;
        Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm6406037a91.2.2026.10.25.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Message-ID: <c5cdf9e3-919c-48c9-9717-8bc801ad207e@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:49PM +0800, John Erasmus Mari Geronimo wrote:
> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks
Guenter

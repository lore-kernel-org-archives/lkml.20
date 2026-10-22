Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687510;
	b=FaRZW++6v1AAsEsWRzWEBezsVmDiUVEs37otdW8Gw3SoJLtdQvkFxFdCvis8VEPIPLSV
	 QIk68JXHB5r7GA04El1iAz1oNzwjYV8C4PghVNznmwueAVsn9jCKZg+YmGWoH+GQJQjTX
	 bdVNmEnBgs5jC18ND7scUvZAhud7q0NfcbsFJvAEmnZFHzLszoqiWaEV5RXKo1W7uJhmw
	 +07iBwfQFHXykHIVpw7YYqlOIjq86sdyp88Vl9IekM0ejEFxdYcWRBoLPqwwo170yWJkX
	 bC/eFo7owFjvRpyAxxrYvDB7UCH5FNIhm9PArIhPHF3Bh8/xW6Y+754I3gpKQ9jMYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JGlsLpHXpIQv7tIcULxVWCH8ZJux0WaXSvk5ybBuhZc=;
	b=HpoQ1k8i/V2NIr0MDjNZ01+9QgRpj5bZDz440ARqtHPJdSJMLckOAu7ueWz9VpyubxpK
	 nG+DAq7wbGRG40GnNNk0hChBLLIFRa2hyfu17e9Gcn/5PWVqkPyLbuPaeJ8D0glwhlgIT
	 lY7Fdulzg0KMSfMUyi5rvY+uciP5A/KTQxNsIuv7uQ6hf7+6tt8gT1kJ6HL7pMhLPWgeE
	 rPQi7GB3GeV1jBaoxm/pXzy6rPloUDumoAUaxIRev1fOqRPDBx2Qho6utrhj+l16kqiZA
	 vjUoj0yB9jYmMf1NlS54GFAUwp5jofacFdaZUGCOaqodwJTTd1uUi+2MO71ewJnkGnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hDtu2ixz;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B901606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B901606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hDtu2ixz
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so2836942c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687509; x=1793292309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGlsLpHXpIQv7tIcULxVWCH8ZJux0WaXSvk5ybBuhZc=;
        b=hDtu2ixz0cDU2WZXnqEshmApKOvlvhL0y69OjIS2JLtfncARrSsFgB7cDWWjdAMdis
         8Jlo6uuFiIw0J3N6w0F1QV8L570p5992RVkE3gO2Va+q8g8h0m+FLkV4xqCsxvz0+6WZ
         mA6+KueiynFUe9HZ6QMSXSGYIAqw99fHuNptzqIivawOap1LLeoD7FPmyx8KOAnM8mZI
         8TNkNGz5z26g1i2LpITPtp/CuRfeW9ts3XjNn/MseStMm3psT5MK16d89wegUi57QZ1k
         r22u0XKZimFkE/E/83b1hmBxSrmlV0ElEhm8lhvVHRXEp8wzcnIpVTvKAvPx1iVngjI2
         j+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687509; x=1793292309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGlsLpHXpIQv7tIcULxVWCH8ZJux0WaXSvk5ybBuhZc=;
        b=KMv8fcIi6Gv8Ovyw1mT8batkSgkrs3SgpdggpYPRQ9bX/4gyFGPE31JRGvk4Eeq8UK
         PMSkdM1bF4urHPgsTkiX9J8oC2FwKYOAH0nxT6IkABDjt1DAYB9jtaCejhviN/XSCL9G
         5YM2sstDjyYSIIBOKgATEN0GmLHgxznPUcHtllryXyM31MKajvLJibPC+VzP3T6/eDef
         W8XRdo5sZxnnB41cQWs/i1EzKviHb3QvYMz65Xw9ELCwrHOHLbWY1AzAygOHiu5V9Woz
         zzw141E7KmadKd/BVGsNbWi2ZITFF7/c/b5dWfFlEjolEjz+haxzemVfor9cwTtXCEO8
         6WDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXrLbM88cjbW2yNVi9e5W6MPXAd+t9fJVqXgorv2JCn9fJyvbLj+l9HNYCj6Hz6Io1YqkUDw7DIpzNfxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkV23Nnyi6CdpstxHheoQQMoZBGXR+XR1q31aTUIuIMYJhMwvN
	FJNGHz5OVKd72EgCRYW1LhfqI0Y8dVNeg3KguDH0e5YU1dWPu9Eapfuo
X-Gm-Gg: AYBFou20hPwNQPWVo8IMDoL7qMGDuRM4EhdugPHYEtYVXOD6A51gBp/FIUnw6keJLJR
	exQ0XsPkKrNPEJ8k/TIkfjL6sLymWvQN4qPyan7h3MK0m/EtS79zvMIVfGC9ImeLNrzIezGpLi8
	krOOCStt/6VpA6jsaIj1R5+WUvakT3k6IqW2JWk2fTaiKfFSxZZFd4MO+slOuUvPBqcqr1jX3ZG
	N5iSqDg/QwwkVV99WlAa8yt30vwVHotqKra5DjjZGhpdg8gZ2DhL843dl0bPaPsqJDwOzqhdAjr
	xr4IQgdBLDJD7B+/0IKWUbLuq+dVZU9oeG60bTYxFz0Ma963OueORHrOtIXraEyXSQlwpKRxHn2
	SYTWgO1IcnA7Fft8lbFihJksE7T5DxngIvU18c+Rd22U+rh/RNhyT66lctEoHlv/cjXp6NfVcoo
	wzRf2Les0j2CjzDeS2BD+8QFUol8UGAF1hNnN+BCALWlN96dhUft3s9wb2fWIpXvSOY8O7oyu9c
	k0pUsqf27roexXVVmCWoh50840XRGkh2xdbsvEpxBirLsADE/tzjKI81dLSa+z4zuQ5FEb23998
	DKWYMyneANC0DSqgau0+w7hwC+/2IVT0YFqG9feM7UZn8ga5Mlvsi8AQSubi0/XhhqRfqV+u93k
	Ajrp5RuLgZ50=
X-Received: by 2002:a05:7022:3c84:b0:168:6ad8:e89e with SMTP id a92af1059eb24-1959ae11b35mr22548c88.45.1792687509046;
        Thu, 22 Oct 2026 09:45:09 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm15841782c88.8.2026.10.22.09.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:08 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: proximity: sx9324: fix out-of-bounds read of scan
Date: Thu, 22 Oct 2026 22:14:52 +0530
Message-ID: <20261022164452.201416-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ato8fTSWub91Fy2R@ashevche-desk.local>
References: <20261021225417.626946-1-kapoorarnav43@gmail.com> <ato8fTSWub91Fy2R@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 22, 2026 at 07:40:29PM +0300, Andy Shevchenko wrote:
> NAK to this hunk.
> Homework:
> read my comments regarding formatting such arrays in linux-iio@ mailing list
> for last calendar year or so and summarize the idea.

Understood. I'll go through your comments on linux-iio about formatting
such tables and redo the array accordingly in v2.

> > +static_assert(ARRAY_SIZE(sx9324_scan_period_table) ==
> > +	      ARRAY_SIZE(sx9324_samp_freq_table));
>
> This is fine, but I would dare make it a single line.

Will do.

Thanks for the review,
Arnav

Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D04305680
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320232; cv=none; b=DvysER+IdGEc91osANbiPcjqhuKC9cRSV78HOXWx6oZho4f2IQx6HzLI6EYw8QKGhYnmB6yvqu9gHszG4mfwGf6huoZnNdiWmU1EYDXG1Hzx1c7VVl5FmJcK1sPX2ftpDu6h4aflisFeK9KxZOPVCgJLkY+wTlacAJXwJUseGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320232; c=relaxed/simple;
	bh=nK2g6PCG8RmaEW0yEszSpyDSTDIVp2sQ/UCkE4rggGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XeU9eDS0EPaEAlrcvqWFzC5UzAjz7zKjscWCo+ISjSeuZRT6yaCDLa6ffVOAwMv/+He0d4vEgVHlONxlGvIVCEZbvvxcFYGeSEhuJxX7TQMWzU5uvzdbJBXvdqNWAlOEvaMGHDN//Gmuy4R3ru+ituy2jMLWfH7JCL/om3IZhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPWg8v4a; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPWg8v4a"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-8048c50724eso675971a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789320230; x=1789925030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=hPWg8v4a2iMQMdHsn128VXbUDJH/mn1Ls8iJf4DgChshPpVV/tCIl64v88pQiIVhj6
         D9LZthxEXGAasfmfWSaD2wLqWtB6YwNnzTSOoR75g6MikTFFh+n5YS5jXfYjIRKWpN9T
         rw5IRGolSVtdEb1jCGhtMRhZyOvEsIcn0DYTlV4nC0SXcf3TkBx009H0cI1RUCBtkwIz
         rWgvYduc8JZdkl3O5HkaNmT8t9TejdRzln+ODn4kcOU6zwXvqJw9ZP2+1W3pLRNC97jl
         CwMx1KIYPP5JzJk7dAsiQTvdVNowqrOHwaVkm+XUWlWEcBGZb66QzjiyAE215cM7N3co
         QRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789320230; x=1789925030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AE5k/kG8YJbF9+P0eXSyvzyutUhB0PHETgWhH6QKTKQ=;
        b=aXwew+vWbKDC9yull4u6A/ju38tr2eURTWbqDpnT19er9jrwtMboBuqkMhkDmNZynf
         9YK8j+Qk0Zadrn5ZXJAjv+8aSaFtpmkmGs7deuhh8i9viGum4/Bzw5iSOppxFw+kuc4i
         wdfuyeVxDuCtfMBxJk5hTcBqhrD++Ptbr7aSHG9XNdg2e7b01eXHyqDaEwBrHWgNWKga
         MrCFHzcEBy/58qAWc5WTV4UsmNOPIHFXMGixw0i9wS1XE5i0gckzcI0Vv5h4uEcKrF/u
         gVcDLsGJ2PjNKgfdmwwJtWzexB+EY4N2W4KPKAIGFWVCQycvLeyoBDE0hGgqJkvLCv85
         7YSg==
X-Forwarded-Encrypted: i=1; AKwUvBxDzaligraXDq94n6OT2f2OWE4oq6UCLmu4qTo+Haia1PKWbfkvWxYGz3i0E/BiBwMYUVJ+Isy4oLGeAyg=@vger.kernel.org
X-Gm-Message-State: AFuF++ksMY9d0kN8Ixwg2Z9I/0JPwLK/tdSW3IkY5aSTDEOdBrfozYNY
	j3yct3v2hGjrsWLOtwYkHMkspnbrP1rFm05aZT1bvUBojNhZ+KZo6ErN
X-Gm-Gg: AYBFou0/aKE8rt2wyoSC9B9zPJBzdigOrLpN/m0o7JtcbgkgTVZaL7O9zTSwhHZINSF
	MJO3DgYpHgeVPzaGb8X1kCZiu1PY2XzzE0N2NUodOR3qx7owKpuOzmepQQ71iNv73OwyTlOy2EI
	iZpLIa5zM0/209eqm2Usc1edPrzHCCANDh+f4zxzGzqr+kmy05gafI23LtOpA4zVMtLqiVwHIDF
	gMTXH2LrJsOmgiE5GMbBoxjSz5jrEi0aza6zkLnWgfO1w7aMIFjsLVKuO7n81g4egF1ZiZLNYyi
	5wLThayhXoKehdzfW/kcNE6vKsVdCbRWY7i8HghU3UZOTlRfrnKFJ42V31GISLfKaxig3gCb5Mh
	aQFUtx8lvEdGoBbaRbywHeiVoNQwP520nMWziX3nHYeyS5KOK73GJvO/r//o230ouTdwRYiVbPo
	9tQ7H92GIU7bVsspwXCfUlUVgFJ2Lb2VHKZmVFihctom9KtP4oSulTsHvFvDVg6XpXHfyEBfkmx
	Bd4NYvby1sGtPR0
X-Received: by 2002:a05:6820:3411:10b0:6ba:5d2e:cdbc with SMTP id 006d021491bc7-6c0b9d4e352mr11117155eaf.7.1789320230280;
        Sun, 13 Sep 2026 10:23:50 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8bc8884sm6899818fac.10.2026.09.13.10.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:23:48 -0700 (PDT)
Message-ID: <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
Date: Sun, 13 Sep 2026 12:23:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 
(2017), boe,tv101wum-nm0

On the CABC teardown for the nm0 variant that Sashiko found: the write 
is a single DSI generic command to the panel IC just before it is 
powered off, so there is nothing on I2C for it to collide with (the 
LP8557 backlight is a different device and is already off by then). On 
the Fire HD 10 the full disable/unprepare then prepare/enable path runs 
on every DPMS cycle and system suspend, and the panel comes back cleanly 
every time. Skipping the call for variants that never turn CABC on would 
be tidier, though, and I am fine either way; I'll let it be your call 
Nickolay. Thanks for pulling in my patches!

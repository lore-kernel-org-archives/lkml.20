Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586456;
	b=dEYqFDfICB5D+vZgPgMLTABw6CGEnwSknFvRSt0o6Kgv5yzuXadqb5kh9jhqDR8RvJ7z
	 Mi1wk6fe/FbJeDE/VJr/IhnYnUp6bV7tepCuUsTVTfQFVq9kwQkJOdwy65NQ9dV1LeYqT
	 n7huKTa6RwulTFr/GSzC8wxX5mqU/gGkG4LZhSG4SeD6lH62PggygN5ivdgilBHlLOHHp
	 hjUYA/QuFGBjSJpLcXovkflaAtMZs5uIiny9NhKQvuJM2HSH8SzEvEyZHpyJRjVU+aZzM
	 6b4Q8J6RgSo3D3biSgDY0tD9e0mDFAAmwitZuJb3FpR9lyqQf33j89i4ifVKXahLqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
	b=afgPZ+MxqErFjR9qhqMahDJjN1cld79f4QP6UVdUTUAsobS8xOIDGsoAK8IpXHMA2H2g
	 8Fm0VSZz1YxSNvIy8vOBj+URKxbcfkfLr2EpTJecs5cb89IhRJmNGTF00onjsFWf2prXZ
	 1xlRNvHRFOYXCGTvkrNtVVV+1f7LyysE16ZA9i0iBK4U0Brz9UoAPO9MJ0O78V8p4g/xb
	 FHEn16QeG5vG50HxNYvtXWBqjCkV3eq3LgbijHDaV031bo6HT9FJ6JNjckfKpBaYRTBP8
	 IJf0qlMzvaEym/VXfJezoCYLCYCDkT6LFesh88MD9kbtmJ2rQagFBANTSxqcbrgxedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488C6070211
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A488C6070211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9aEphJh
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f8b7b943so448616a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586454; x=1795191254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=w9aEphJhxN7KRplF0AemXK6zfCEpZm7MqmDAaYAKTs1SrfzT5ugoss90iRafy9F9OD
         hR92TRyq5NjVfe4DDgIGkXrwOVztZGdvedhTy75XiVPMkt2+LVuahYxekXX1kzdRWCw9
         PWALAVHUS4ZEjxxsDiq3DFc9Yhhw3BxyWXjX+rPSdNklIfwQXmd9sFK9OxwrDOEDZQyn
         Nv7BkWcz7Gdc1Pph9fcj7zW33bbZdF6cYaZnELCjV5lLleY6fQxt4SmZ2RrExyoXq7/W
         z7w2hVUfxwkJwW2GjWkxA3asMKrhe3iGF39F0rgYowhRDYWcm9gyWGVn/bxZVMeh7ikb
         o3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586454; x=1795191254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNTZCO6CVD9uiA7Rqib0iVTPKHOWhKLny7CTKnD008c=;
        b=RDsjy1BFWbA/PQ1OqrUigNXTPgSvjYL+PpfGx8K1pem6Q8ay1CaPaqw0ZXrUVziPuD
         NJeMX2mS3emG2CrfTY7ZncNXBvS30Oju9jOOcxIkncZqsFLCS9eikCW7eRHywsMSWcb/
         1XkajsEajo/8YEsiPjnpsbBF1p+/YK6Vz4S7KGb5NWkICZvdyV16dze4bWw0ekBktqwp
         grwFw00A3oc6PaHSomjJWIqpxTkDFq2e2oh/8LMhoA9aWj4DnwkK0zruwuxgUzZ6upHP
         hZdKkuhbKKDtI4eRwfbbV4ptg9+bm/x0xMlQZ7ezl6iJquqTpp522pFemMNzO1RTJmoX
         NkHQ==
X-Forwarded-Encrypted: i=1; AL+hErFUqXvspGybzFpN1d9l82Bdzuq3R1MXFHiSzB7xhcz0yycsjwcQxMTHbXJwB21K1vPkgUdpVvpZ+8t/1co=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VzgP+GEmrhPM2r4Hz6ELOVx3sQRUkbI4EUQUjHKbZExnixzzO
	gXH9yII2Tzpddgdyu1gzgtNOeYKBS/n3BABSVOMhBhNT/JeaB1ik5EPO
X-Gm-Gg: AYBFou1tvIXBsiKifUvQVesh7FctbJFmyvFmrptMDoOL6X+GQuX+DIQ1SgQ0MMH+V+0
	pHn+Z5BGJ0rT45xBKkog/1GCKkaZfPAgEffaVnS+oIQXykvdoG7BjI1O6JSbe7qQ/ZeFOhJ7evl
	9vfoZ2IEEfi2UNHkWcpi+Mcqu/mh7mXy2ipcqQlgYg0qDToFY8VqayUN/h+G5rQnrbVfpmdfYm1
	tZspesnAe9JbmzEbvokVefReGLE8tZ6ApPtUaCvffAKT8y2B9ujEAqhRF5YFMzmG8DNOn3WxP/E
	1cm7coLU8iq2I3fkDUarr+aWxACwifsbM9JWTfJj+SCs2ZP1ceOfrIW5CmhkghId86iro22acCd
	iM11VK7pboE1EUUYcTmk388cmuVZEP+MVBIcbiXWTj4R92L/uyI1YQgsGQ2Gc+UA5dgNrGG89sN
	WeTCZYcu1Eq3q7dvEmZMUvVdYEO5TJUyxN140+Hq+dNx1x0yxGp7ExLdqi/HbQ69ZYa9II+5Md5
	taByDB1vo0lYkJGOzTNa97pNEEQqaiSP4rZaIiIlAD1nHQ091PsehUyulvmOerasrwpCuKr0txw
	mwNI+DKfOBWZRA0Lwyc5/dm6e5f9aOeLEk22GuXKbyePRHz/9yEDzyhewhYkMQyLe6S4vM4/Qr6
	Nd9fQMkDVjHiRZJQ2M4I=
X-Received: by 2002:a05:6830:3491:b0:85d:6045:52cf with SMTP id 46e09a7af769-862898c8b4dmr2468232a34.12.1794586454518;
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm2668473a34.17.2026.11.13.08.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:14:14 -0800 (PST)
Message-ID: <36b0b778-a5bb-4b85-b36d-d4408c3ca6fa@gmail.com>
Date: Fri, 13 Nov 2026 10:14:10 -0600
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
Subject: Re: [PATCH v3] dt-bindings: display: panel: Make DSI panels port
 optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Cristian Cozzolino <cristian_ci@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Nickolay Goppen <setotau@mainlining.org>,
 Robert Chiras <robert.chiras@nxp.com>, Alexander Koskovich
 <akoskovich@pm.me>, Marijn Suijten <marijn.suijten@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chris Morgan <macromorgan@hotmail.com>,
 Barnabas Czeman <barnabas.czeman@mainlining.org>,
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>,
 Arpit Saini <arpit.saini@oss.qualcomm.com>, Michael Walle
 <mwalle@kernel.org>, Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Svyatoslav Ryhel
 <clamor95@gmail.com>, Danila Tikhonov <danila@mainlining.org>,
 Jens Reidel <adrian@travitia.xyz>, Michael Srba <Michael.Srba@seznam.cz>,
 Shawn Guo <shawn.guo@linaro.org>, Alexandre Mergnat <amergnat@baylibre.com>,
 Alexander Baransky <sanyapilot496@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113084236.53336-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 2:42 AM, Krzysztof Kozlowski wrote:
> DSI panels can be placed under DSI bus directly and some of the Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.
> Examples are Samsung Exynos and Allwinner DRM drivers.
>
> The Linux panel drivers affected here do not use OF graph, either.
>
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  That's a mistake, because:
> 1. It prevents usage of such panel in DTS for other platforms,
> 2. Places the constraint (port requirement) in wrong domain - the DSI
>     host needs the port, not the panel.
>
> The port is not needed for the panel hardware to operate thus it should
> be optional.
>
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # renesas r61307 and r69328
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Ryan Brue <ryanbrue.dev@gmail.com> # novatek,nt51021

Thanks,
Ryan Brue

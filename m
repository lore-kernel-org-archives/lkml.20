Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED717347BC6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827923; cv=none; b=JVzeNg+kEdXkAEq6zjxoEf9c6RZbRbtF2nDvKz6/I4Sq5N9TqewxHGB3k8uFfSUoLzxkzacneUbBE+8iVtwfbuT4aWkulfRN02NaANYRBaK4lYmPUG5MAVEXxrRd1dS0gUaah3vpi3eDKbtZou75hvUtffHaKeffr5CKwrwmluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827923; c=relaxed/simple;
	bh=S/ViNZ2YtzcrRDHfzV5246E+VEqBUQTYkIoaPYG9LJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drMKcYrY9i9s7f1ZMCV6JV/Q0T4xLn1zOrLyQtsaEnUIqEoHmOkc5Y/8bxf40UG9tCRGz0S2UqwVUl0O6BymXlfsJhCr5YAGW+pBQfENoPb1Q51CGOCZSGRR+xW3DxMSBjev28dAHCVEvFn/d8WP4EP+Q5Pc82CM0hEkQatF7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dTmkw0N/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dTmkw0N/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so11691785e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827919; x=1790432719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=dTmkw0N/pkZVW6rzNqFqTAB+Gqa0JEtYh4hv4tx/KwbSf6B1ifrzV6hdpNnq/BVIOl
         v7YwfTiWBkQ2xV0C8oXcJSx5ASyPOvjVjENhzXdY6QRNJnLq8cyS4deIgE+9c5zR4np5
         qVkyTQ6V8E7xNGmj2GEuos/txbQAwUeFYF8nWAwdoQzZmvUmsfn2ZBrPiTnsrLSrqYlJ
         +5pKMmqrAZEFTFdzMsKLlQmpm39ZDpPF2hEeejAkqOyecKnuKZMCMWrO7NlkdEL/Pn+8
         Ml9uahvIz/eYY/71AdB2dEZGd0AR6QaPMUSpOUsu1BJ25cSQX7k6mfbl9BGpb9kbBG6i
         X+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827919; x=1790432719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=pYxl9pGtiuXpUca/sBmmwQdg/5CYGbWmMzp1teI2YWQXB0VZgd0D8OQJ3cqI3gTsMi
         rkmEpLG0BE/B89PscYqjb3MgOOcRgGhLovsnn7IbP+ZLdvtBO+0PDUAF4lJb8fzibaKI
         YJMfOeV3ho3c9xXcgqg2cpw85cLCu+ks8J9tR6Xsd9SHJYrRIt+xNwAyOvYUzZsJfiya
         CvlQ1o6ztTotghGYXtGtZ6pf1Y1nPoGundWZc/0rvTx1oyZHchsFaMogg52sVp6BBGen
         sYYHtLpRM0TF50awe7TDymd1OtRXDY9U94rETuU5XsDZUY8RAlaq7JG2bcHLLKTIqksh
         m/CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbYMb/OiVmfGVvroR42z6iIWiW/5xU6cKQyn8UIXOOwR9e4nz5ijYsHlfMgaB8ITRRyAodhlWBnI3G49E=@vger.kernel.org
X-Gm-Message-State: AFuF++lEIVt5pO/xiDcrCutDnJ4CRHTnsrcNlKFvgK0MYFROuucAADLG
	TmgeS7vdQ10vKpNoVC41JrDNVNJJPc30Upp5a/JZ/E0DHj2s6hniTU7+xznrS35WWo8=
X-Gm-Gg: AYBFou0zdjamr/xC8pcq5jA1/qTv2TQMYtUWjEl9GFB2XppqFVriehR+59dhpeLzpga
	xTFQR15+mNJ7J0gwm2KlNqlYNi4Frs4scS+iJPOE9N1uJVwKoRdeE01Ex8X9KIa3fVRFvbgFOfc
	Yx3WdaPm3cJAjlVJdBSXYHqN23nfxmP5hIF1yVHg7lv/1RUNriOqgXVqEawGy+BRAAyiJqM0wPz
	UCxnhUMNNV61sQMSiwirW8Mrb7nZGA6J8Nr+PbC5JHNGq4ypqgi86uMJjnOo70f8Q59uV0sEi0J
	XDus63Va/cW6OCK/erDxQxwZF/R0NpZcVe+31QBDgx8dTUQbjQq79GTEhSX+akrwzQ5ed0kR5Lo
	thyV0iF4jnO8LCnAEr1me+gdH6JB6VxHogSD+VwtArYpdJr4Un1Fd/gTVdfbfLtzLRbQ9EWWs0z
	LVTrd8yuwZUJC+MLh0RchqREgyEdaeOK59UHxuem6i9pGjTcudM1UwYGyBcqpSNv4DI70m8KvfQ
	zCD6nRr2KVvHLBNxSLIAVmd6tQS46TNDfpAHVyntWbSLGyGVvEAf+Fq
X-Received: by 2002:a05:600c:19d1:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fc5743bc4mr79415245e9.23.1789827919214;
        Sat, 19 Sep 2026 07:25:19 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm78403545e9.7.2026.09.19.07.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:18 -0700 (PDT)
Message-ID: <c2c649b7-0f6b-4271-974e-a84559c10231@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-4-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

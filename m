Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B4257827
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827942; cv=none; b=Xa3PkdrxbSOX8ycY0pjOq//RGhasQbs7giYG5XDeksTzP93cq0lnYfEjEovnCcKVx5/UDauqdiVWQ/b9asdQpJSeKL+iTIZa/a4Wmj1+K6INiEf+//f5bZFxgUIBzmZhL/Hs10K0tsVpAn4d3f86trcHcbQ/6nGHmF/++x9LaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827942; c=relaxed/simple;
	bh=MXiWKKMga59CYgjF+JX/HuYbRMF4SIgIjBhzB9KdFlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XihM3NFE6EhswRO9jZzcPSsqTXgCMnIKFoPC4W9rOr9VJT1MwzMXEUY4m1r24H7iqoK+BTICyyqaE+zg8zs/4CWiC6HBSmYN4QCP6AkN8CtXelGixZBLyE8+RTLRFqc5QPRn5rX6YU+pOH6vcPtQqhTbycmXkkAegMDC/fOH2Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WUJOE8Yz; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WUJOE8Yz"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso12209535e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827937; x=1790432737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=WUJOE8YzyYqKoC0lgK1BYOOiRGFAVM6djLmzvzy4l65wej8x7yFTexCLN57n2qgfRd
         qzN6rjDEZuB0DAf1UXGMlWt1v0Gn9sBcF9qCgUXmJIWq36oS5Bcu3CsiTARMYK4dUWq+
         IKIrv0ekJV7nKA65Gy2xyBabd+dUwx3rTgplUTGLrcUHZyhVOklVjzSRgRX/sAIEk8A4
         1mQwIAB6vvlqD79OFH4aT+uI0XwPKRwNlYQAz0cxIqE+TL/wYUubgfXFsh3v9qTYYp7n
         42KZJKu5ns1lZp0rFJkAIxzNfFSD4rlPRlbXPWrwihkGksDJJreMkfv2Yr3lPnxPsxQc
         aQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827937; x=1790432737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7shCbBzL3NxDtg4fCdmbNM7nlS/zl4e99x1q/nsZ2so=;
        b=rGBURe0YDdZ7DsqNmi/3wrXJbTFq9g5zUrjw3icus7mqpzJafXNgAx/7GSAtPtvaeA
         sw8YwesFq8ITWsi/BLvXeuoItLA1lVXgtGrCUMadllqzuJ8tBLMozcN+iOXRDmweFua0
         YewEY9Br46TtDMb06YrRGagY7JJwIKHI5RPQxrk3SFm1GKwNs1NHz+Ig/2JVc21Ums0s
         gWUATikahrVbAkB8GjKzCduFEAVXbXSrAfv8T38S76zSblqE2o09Jdb28RwAIiM6ZlSc
         V3DkIUO23WZndbQyUalNMCaFkSkA12ra2/U/vYeOSskKHakBfPW/EeQGAY1CdIdZunE2
         Rsyw==
X-Forwarded-Encrypted: i=1; AKwUvBzaQOctuz3xXIxTwzXbPR0Rk2MYaOF27fSPKPkj5OtqaoSFeh0L5qp7YUAmItTXE208eT1tbcpEATDmfdU=@vger.kernel.org
X-Gm-Message-State: AFuF++n+FHe0/2EcMCgQYwIZieqpsCfd0a5ZhEfVInvzzRgWyJd5IwTC
	iiWy273qA3J9gMWNyQ9bmqJHVz9dhO5eBC/47sgYZapxnpotlygtzIA7nHNfd8m5BoE=
X-Gm-Gg: AYBFou10BY0uYgUrOi/WhrlU5G2K1OzpeXzymLfy99IbvvMvHX7FHAJB/5QZFaSULhf
	ZVtoEZufcp0yW3QVHro89SzjtjEuc1eY0BnLMfxEMnk8sWof+bkpmMxxPbpxhyLfsS2bpO09tC+
	LpUwEQgV3O91yEoagQyD1P9jS2tQ9Oe0HDcU8b4z2w6v5I6dQ7dKS2YDJxvT4u9OyKiGCK1iJ41
	5mDvKMzMyAkkttaDuMpwRqhLNcqFymI1qGt0LdwAmPKkWVt1LsIGkYvp7l5tKZjNKdS/fRfV5Js
	CKV7hwc2gEC2s8l70IkdGR80WXnIbpMavOFatvn8K2qhMPG/c22uQCvutry9XZmbL0r85MF36ua
	Jp9cse0J44MP4svp4IhTHV1KUvwrlzSTGvlkmVIBQWhvN9a25UE204Wh/XZkBNoxskw217hoEn4
	SQ5iHcbhN5pjmR+WWQSAUQ8NamnLFd5ur5gogJznNQ85iBF4nALvwe+1qxZLcZoEIX+6rgTBdD/
	rrXSOJSsMcb26GTBYDU2BKMJtUjzaNU2kTuanxM+prmS3dMsUrBscRVnlnBqTqmdw==
X-Received: by 2002:a05:600c:8b35:b0:49f:bd3c:bc18 with SMTP id 5b1f17b1804b1-49fc572f15dmr69026285e9.19.1789827937433;
        Sat, 19 Sep 2026 07:25:37 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm53940005e9.1.2026.09.19.07.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:36 -0700 (PDT)
Message-ID: <c173168c-f3a1-4712-b093-b49b5f798e13@tuxon.dev>
Date: Sat, 19 Sep 2026 17:25:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D
 driver
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-5-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:52, Cyrille Pitchen wrote:
> The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
> driver to use it.
> 
> Acked-by: Nicolas Ferre<nicolas.ferre@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

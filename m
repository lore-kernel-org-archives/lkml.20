Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C94F2931ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087708; cv=none; b=meNxVTguwBx6Wzzsk1qOpAgpNvDXnMHoLsH4yAgP4Pl/Gk33Rloi0oOSfyL4Uxsv+iWiSIgvqd/muN5RKNC3ati5mfA8r8ZLDLv1kmkDcllihMDJDZmKF6uY7zsDo6Q3nC1qe9jpeHWG3u88qDOET7Jp0Vr/UR9KX0CdZBX72Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087708; c=relaxed/simple;
	bh=5QUvirxnBbcXVaWpIRvOp+xlEii7ODtudQKqtm0wib0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIqQ06goEP+3xBc/YKqc2rEaLRQis/rcgEk2pVmRF0z9bHjIsbUQIKD2mxRwZmuAsB3CIPRLro7pSYHXLGhNnMSO1xeKUQHmo/nS0VFdgOVBmjl6exZPeRgVdXDGQJ8dG5ptbdeRFlIPlN7TlI28AT3xhV5VPwn4n8YLL+zfwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJho2FDY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJho2FDY"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso316890a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789087707; x=1789692507; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DPZA7vd5t7QEIfkeBG49EyEomkUElo6uwu/PYojC2Q=;
        b=aJho2FDY2tzTby88iGJ/KVr7BTYNH1Q+/t62XSgv7r83qZVfWl5ZCBNgRyRczdH58A
         +WRub4aNILLkgSTbL88JjYo9u5d0i6aZcjhiyjvARMxaKTcdRi+Kou1mCxVJzt2MYuPB
         I65MJ1VKkskyJQY9FPqprhleM81oVeudFzw2waUQdh9c/vZyydcT+Uolc+u5LQXBDUUj
         87J6EtjVdnZYShaSMkbVNlkblvQ23TYpf+7CkOMuP6lsz4NsXNU33oE4GNkajct+AYeU
         LHFqbEpLLNaVghsYCtimt7IPx0k6fhuiB7pqJbKF2jNcsZ3Y5IptqWnRZjv2VC8pojSj
         Sn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087707; x=1789692507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DPZA7vd5t7QEIfkeBG49EyEomkUElo6uwu/PYojC2Q=;
        b=axFOL9hWoJViuUf/q7txf9/gmaA59DMNkIMWoh2pvIRtSGqBRJ9pQg240mALViw39L
         /XpRLP4u/lWWLB7lODJVUW8ZjaLeFA0PtLQXnbzkneoPHEr+PFOr930tmTVKKpqUvpZ5
         uBI9D1ETKHkdTcZXFkwPJfmc/ifbJ1fzlE8h4vPEG7qFflZoCVvrcan8BWWN9aRCXuLQ
         tjsie6Is6c1Y2HOja2XDHf1G0q3oqiW63qbIpJlsQtSnjvgGMjd1JGc0fqgazb8fI6Xq
         dPu8T9l0hBKSJIkOpo4w9iUdcRpA/AsyNpB+AZkqjKo40bYCzv6s7Obq3ZxFYQe2rhDN
         jyTg==
X-Forwarded-Encrypted: i=1; AKwUvBzEoo1oL+m1lJ7P/uNVcpOEc1dreR04czaqo8dTZ2y7gnBeHK1fIRehDVyW/1dt8zAEddPukGwmkbr8Oa4=@vger.kernel.org
X-Gm-Message-State: AFuF++k3F/2OQLoxqCKBLZGqW06sxFKwR01hF6cX9dQVo6mAyQzzvF35
	uWK7jA04fytYGtJuLW1raPcQohAT/RsDEAXvp9+rZJJWoZttXNFHMzd8
X-Gm-Gg: AYBFou3qpbPm7FzEQdG/SjODp73Qjps0p8UmpXGs+3Rw8Dvnk2Vc2BP81ftaU7ya5fN
	+pbeqBrJ0wnBziz9/a9Ej3BPYYQcwtJC6EqpTNw9xEfxiDlCr3vZEzRBXgIL1vSV7PkGgt+r082
	tBXKPXOeWnT3R5p/MB5JwAIBMLsYSELeSXR9Yt32hW4G/2IlvyAniffJoXL+kwHVGP/o0oBOyZV
	uRfzB4JrQvBVfhrjI7hTYj5Jw+2h4MXHYik4CMG7SyMlAExDPAbqj9FPthxjKRuYMgrbanruO72
	5amWZcKDGkbGlOWwtntL8QTK0EcDvUVZu6yE2Pifd8BtYK/3oWZ3PeIxhXLq2RbiOgiZ+WdzAsX
	qnjteGTG4hIOBDNU6u8px0iavSJSH1tol6OgIJ9ezaxFmi45jmvtH2ox7NwtlFAZKwe5+yCJRAc
	bqHBiaH6eOCabvbbUmyi1vpgvyKiwNTiYjfwyF7HTa6weVi7H35TAOh1oFxeljr+pBu5LyqvDU0
	b6m3Kitz/eT
X-Received: by 2002:a05:6a20:b08d:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3daed217b76mr3313536637.2.1789087706544;
        Thu, 10 Sep 2026 17:48:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm2164759c88.0.2026.09.10.17.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:48:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:48:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rong Zhang <i@rong.moe>
Cc: Clemens Ladisch <clemens@ladisch.de>, Gabriel Ford <gabriel@gford.dev>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
Message-ID: <0bf3bb99-a37f-4d8e-9ee2-1346240c89f0@roeck-us.net>
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>

On Fri, Sep 11, 2026 at 02:39:25AM +0800, Rong Zhang wrote:
> Model 20h-2Fh are mobile processors with single CCD. For example, model
> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
> 
> Including mobile processors in the model id range of Zen5 Turin
> processors leads to bogus reporting:
> 
>   k10temp-pci-00c3
>   Adapter: PCI adapter
>   Tctl:         +54.1°C
>   Tccd4:       +148.6°C
>   Tccd6:       +148.4°C
>   Tccd7:       +149.1°C
>   Tccd8:       +149.2°C
>   Tccd9:       +149.2°C
>   Tccd12:      +149.1°C
>   Tccd14:       +22.0°C
>   Tccd15:       +22.0°C
>   Tccd16:       +22.0°C
> 
> Fix it by removing the said range.
> 
> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Ok, I assume this is authoritative.

Applied.

Thanks,
Guenter

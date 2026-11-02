Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605628;
	b=aVw/COYPcAgsxdTWCY8sVkMK0+30rfpcDB0A8JnmRoCnLR+vu51Wmu2vJWvF9vkQkzVA
	 MT0+SzlECc8QTYye7h23xQS0sS8wiRYbHtGS+72zyM/2YRvrpEfVQ+dJH095qMHrpB4cH
	 9IOLk9wiki/G14B+w9cKVxmZQ1iXmrGw6v+kDajYSvkyJ2yf5IVZNS4CibWni7HJFwsJE
	 flosbWvYr1V997JHM1CZyxknV3tAbz/7UDAlCXhvF8jJ/UMhPOveT1mu3vBx9csQCKEYw
	 YKpQuI6LFMZAgu61CENz+Ad+/uqymGvSb1kFRRIKDSAmaf40XymwK1jMopz571/yXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
	b=Oe9vS4nOBjg35O+2xBSK5pPNVCQBv+UY5I4syhc66F5qDhEqj87b+f7zh5mg/LfrIMKl
	 0utt0Y1T6iR8YYa9KIQWiCnQz69hsAxKhV/xaELJljGLmwBTjfMVjx1sAy7g2JimCGBLb
	 VasBPF6R0nz1TLU17Y55GrrpXHoA/QjBWu9wH8jmTBNUmcCmR5GVQ3XyQJRvhjuLM+gzt
	 l/eOnpKDcAXOyWoKjppY+3nGPQN8B3RY/3YoA5kPXR49n9T40C+OwiAYuwhvuoVnfDlOI
	 UFFQ8+y0Z/7YIJ4sRqJK2ft0drA7xiAgqObtoLuroYEv3KN/+USf4Xd+4OMgX7yK1Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iIEUBOrt;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D53606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=iIEUBOrt
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so28138815e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1793605625; x=1794210425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
        b=iIEUBOrt9FAz/xBOJKXuYWcx52czJmqQYqfmNykzUjIn/tnMG8lzBZYXcIniv5onev
         LWl/ro7iSKrWTm5dOOJlWgzRQvNV0cdp8LQ5pbY+I+0P0EM+GtCwmdF/6aUbucd26V4f
         ZAg/4fajYQXicJYkQ0CeVpACm2VY2Dh02cZt4V6QSvRiRcTepwGLGc7VG/0mzBUHYbFx
         bPnqPc/1fD9mu+v7C3grCfFPzSx/ufRN6jzLFCvcFYPLmfAXIE5VOGZ8dvtwQ/LAIX7q
         iKxnaaHIUIeYQ9KLrkSRWqjYQIjLIR50eLDYi96cfZ9B2s0U7FSHHsuBKfp4BSoR8mSu
         XoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605625; x=1794210425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b14LYTA1S9BSayGB97Mc5Rl9r5j3Im/STqBEekhF19E=;
        b=uwFY5hvKLauMWJyKqA4W3++Z0nATHNjplIr1Sv2XEibZ7qqGGuoA0Sg59rjNonRopl
         RTsP+HER56dvzuGyGWzIFajanlMUArybyYI4JnoX6Kvgs5scqqe8IZOgzXOunAktzZii
         vLwkDrFjhdQ3xaix3LtSrSypRedSxaKYHCsYeF4DXLAS2UdXOCO1SgRWj5k44fjJuv4A
         bG+NQwuz1NGK/RTIeVgMjk6SJL6SLaOT1UkCwi0tja6e8+ZtP7TswX1XS1SYyUYw/CDS
         1bv+C9OR80PFLs5Zh9SxJaVHRMRGgFlqJZVXy/RTwZBzqAMHjCeIeUa/seu3YH2AgxgM
         mJ7w==
X-Forwarded-Encrypted: i=1; AKwUvBzh6RK5Z5VP7Hy+s3geq7JAJGdC3mYwhE7D2l5maXFbPwu4V9RviZ4PKGKrMpUezraLKz2NR+1gvYM9hys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhciqCe1x4ZUkMsWK/Nn9Im9mzUvMaDRjiCSlqhHGdD/rdL8MJ
	Q/tVSz/QsySP0BJ/skfbN8A+rZKfmacKVjoFB1ZbnRhRiWTdk4O4t6aAhDYNEA/RU9A=
X-Gm-Gg: AYBFou1Syj7I4410pN5K31ycwmttcFk4ZcO1rxuZdAFrl0kWvpvH/DSTorijIeU1zHp
	D9MTemPLX8Fjk/eid1Jv9STuG724f5ECXobOG/De7e8NZxWsUCnhcknKwkKFuSqNSqdfPp4J5Fe
	iSA0dFJxZ1dXF9aRy0ABCCeXQ3kTpmRiC56T1YMI46TFnY7rwR25J9Sm16RVwMbeXgDlnu19C+r
	vjJnWxC+jhIOjm0uiW7hTq6BZ+krSapIzE54dA+zPLU/SGgjPuMgJEBS010awWKPX6sTyf+Mvik
	LX0Qn8J0OWEqkVay1Y7sLSuC9irzWa5nhVhmISbJPJPtbK1ZSMN0rwWF4rL0FBDR1SLpzsUbJLT
	Q+AbqtNwLSbZ0B9rcWbt7DBsI8OlJfEjFxwXFKSvyYo5jK28NQL7FYUcRbdrPG5VAgY4DUMlLPz
	fbGk3EVBQUcvwfOblLaJD3v65gW5+lCfeYqlCW8hTtbKWi6mxUUAqA4aNUELE6IdRKm8R4P1RbG
	2X6dLZF3xwU47UWlKAkCtkEtadundKfmIWOXubLqyQJr+il8peZGn5QbyVu0abmHDlFu7QS8CJR
	eV0Xjo9YeRcJMB05dkcEG6PbgHwVrtMZ4paU
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr211826405e9.0.1793605625126;
        Sun, 01 Nov 2026 23:47:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm297766155e9.12.2026.11.01.23.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:47:04 -0800 (PST)
Message-ID: <b11c5b2c-3be0-413f-8573-5f62284bee68@tuxon.dev>
Date: Mon, 2 Nov 2026 09:47:03 +0200
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
Subject: Re: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/29/26 19:51, Diogo Ivo wrote:
> As per the Renesas HW team this register was unintentionally left
> in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
> from the code, so do it. No functional changes intended.
> 
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

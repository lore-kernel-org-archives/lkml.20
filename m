Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093582;
	b=ef+NSHpIxX7t95f2skwbVbxrmD0FZULpjjpLECSQMaa2PrSEFnjExEBqlM2rgmE3Ru7g
	 J3D3WY4TYbZhlvjpgscGDn8lYIg7reGY3ckDYBR05PxcfaAysrK7UczJRas5g0NUJE3z+
	 iBvr4P8RUu59QmzrO8Vzh1wweciStzi/3zWUTQnZ7qJ6dJaUrzoj4MesNHd0SlmruHMcf
	 TopNZht2SH6/NRNv7ibu8PZX5ewyTdbOKziqY8fnVbVmQMmjQOHM1MO3E2cetxa6UUuKK
	 pO2fxr8oKDgpsqJfxgcuZD1dZEe3JzXk+dylV0TY6HzW/OdK3IA9wc1IA2oJ43F0Jjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=PF69+SS9PhWTeKC4YFDrHLixVGiRvKbZmk5tU1R2LTg=;
	b=cic8wJ46i4E1kiywDrskXRfNc7bbYwVf1Fc2irZDh4Tya9DKkXQRU7KRj8pQcaFF2pRk
	 a0g5VkW4BbUDshP+d7fmLd8tbDtMh5sJLXn0gtYhpw+cFW4LrvprBBgxc9NXf1feMbaI3
	 IeqDQdYeiH0k+J6tXQv6sZRi1qzzsZHyJ2zwdll4fsEy5m0EIkwC+yvzFfFMEyW+PPzJu
	 Z24RLfU+2ekrrq5xPpf0oM0/hIDdoSpltadGMkfdP+sm/Dgr+zBiVQIhR+i4SB7sBld7V
	 dp4QNVK7YkHQHkfRG8AenyeggDHLoXvkwlhmnOdmNuYNPGM8YU5/AYDX9/dcYJslaPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Grf1uZT1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9019B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Grf1uZT1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so109286c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093582; x=1794698382; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PF69+SS9PhWTeKC4YFDrHLixVGiRvKbZmk5tU1R2LTg=;
        b=Grf1uZT1ki6mWyW6f7JfaUBUTdfJJZNUf8KE/6UoQdKUEinzHOM96u/IGcERcgjFY0
         rLSUqmsJMkefK4LraaJljvg3j70lHLDRHxLLVNz5lIT49VfWCVCqlHxOdvmS0NqjQFga
         XLj3HKGtvxFPvA6YA+dS5ZcjUx+KoqG6RnbJDOR5Nrof2Bz6y0Wjt2vk+Y5cSwkLHsNX
         uF1m7QsrQPj8o79znxlTlw05OSLIT4co/1/FL6H1zpIELPqFWoBJLuwlkmO1AIN5GNMA
         Ms6Ieji8QrTv9JzHveGngRty2/n5b6LlsyBknRy/BrHM6J+x0mO2Mepoga96eXOUs6uS
         vWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093582; x=1794698382;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PF69+SS9PhWTeKC4YFDrHLixVGiRvKbZmk5tU1R2LTg=;
        b=04FENsWwo6pQ8lDwu3F+A4zm7ofGtXhFBN4qWkO5LJsUdlhpUc/LsNIk5QjaJkDdwh
         97ZuchafC8nO23vUtbiO/su4pG80JsNYLKdVWE34Bzx4m5uDhiYvTN+X8oT6iMaSK+Ld
         IoeWeIRP7foXKI8/J5r8WyJDWP9bOceI4qin8Tv23VFJ6V5hLAymvX1xds8+91NZu2+z
         y1HFEwOiaW70JlKoeAl443RjeYM6uYtEjMzXUSIbRr4cs8bWpZPNlCkwSlDyds0aRzIq
         PDRLNOXZP66dvjVjdMhUxt4E5frDURkpnETRn7H7I/zLTgYJNcE8uqeEg6GViUotfGwc
         J1rA==
X-Forwarded-Encrypted: i=1; AKwUvBxY8C2c5tYS/a/82X7X8Q+i6nvCTcnkdNObOTyDSbnUfkhqDsHnp5goHmv2JZoa6TVDqlTRYLDSp1m0vpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PVEY9XRsQb8jdfwq4zyxIofqSoTIFk3T7iFta1INQkZJP4XRm
	ov4oV6M1B6vVqkSfKOwNKSjA02wAkoCwr5pqTFjGLL8/s7h8PnJsTuhC
X-Gm-Gg: AYBFou2boxw8RnzcKGpC1JXXg8djsAC0vteLBgwdSK0tVHG7VJmQu4ZnKzDOl8i1oqh
	4kElb6u+JQxpm/4xxDWeP4mREvQFfUpKpBog6F8s8rF84MggvGZ8A6O8iC6Zstl7f40cK+RIW9d
	LX3yhFDPNyj5icCv9yKtXex/VcLS8Z8tL9cufZ/Pz9y9xu9pc66ngZtifzCPjVIMhDOTN/r3Ng4
	hh4HY50UdPxjIhhifht6SH3svCazuo0ICjgVPeHOBV36cGojs+7Usgyl06mF0pAWpPNiAlZTB4Q
	igB4yAxmnboJgl/JeUyG9qAfmu046HoYyNq3N02mxRJfwEZMvlYqkz+Bxp1rSnWnW9WSlg3k98j
	bsnOY9ZceZr/YehOfQmemRp1lAeDGI+GH1loyeRMhMu4tgAMB8/L6f2OroFtvdudGuNzrW5g6pv
	4LnJ0pazsr9MiKnc+8SgQS7/jnJJmDtQo3yKEkR3xceLnDxhsT7Z+zTRlN9Z6zuN/3E5qJTbNjT
	ThKv5uze6NJm1+XdSgeAWVS+YpuMBrnJhukbNPufSdrdEjzWTc2UUY8lPAGtkew/R1epAc9dcBO
	B4u+RPnDBMr5dSauZq5e08JFqy8WY02h+mX61gSrwboJAjfZAO3ZQpm80HVgt28BPTvG
X-Received: by 2002:a05:7022:5f05:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b39fe2ebbdmr64845c88.1.1794093581391;
        Sat, 07 Nov 2026 15:19:41 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:5a4:1cb9:242d:4f00])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm1483648c88.9.2026.11.07.15.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:19:39 -0800 (PST)
Date: Sat, 07 Nov 2026 15:19:38 -0800
Message-ID: <f7574ee1581d609d45e0ff35e6d908b0@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: amijoy - mark amijoy_phys as __initconst
In-Reply-To: <20261107174739.369375-2-blum@kernel.org>
References: <20261107174739.369375-2-blum@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Thorsten,

On Sat, Nov 07, 2026 at 06:47:38PM +0100, Thorsten Blum wrote:
> amijoy_phys is only read by the __init function amijoy_init().
>
> Also declare amijoy_phys as const.
...
> -static char *amijoy_phys[2] = { "amijoy/input0", "amijoy/input1" };
> +static const char * const amijoy_phys[2] __initconst = {
> +	"amijoy/input0",
> +	"amijoy/input1",
> +};

While this technically works because __initconst only places the pointer
array itself into .init.rodata and leaves the string literals in .rodata,
I find it too subtle and fragile. input_register_device() retains the
dev->phys pointer for the entire lifetime of the input device, so if
anyone later turns amijoy_phys into a 2D char array to avoid pointer
indirection, the strings themselves will move into .init.rodata and
dev->phys will become a dangling pointer after init (with no warning
from modpost since the reference is inside amijoy_init()).

Could we either just mark amijoy_phys as const without __initconst (it
is only 8 bytes on m68k), or drop amijoy_phys altogether and do:

	amijoy_dev[i]->phys = i ? "amijoy/input1" : "amijoy/input0";

in amijoy_init() (which stays in .init.text anyway)?

Thanks.

-- 
Dmitry

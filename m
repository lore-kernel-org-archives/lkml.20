Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.231.200
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794842767;
	b=gz/ACSKHghXdIOkYnEwRY1RSYJ0fAV0v9d+ACiV8en1LpTdy5xHibUyt+AzUI2ICMwda
	 Ol1Stg/ccbDwmMgQA32daDTKTuSL/uog3/ZzEJXDhAj1+Jqf2Fa9cyRqryuychwkH1Oh2
	 Hid5lWpelInjtJHKY5vZwta6JP9BpipKCCv/kCIhTzUzoDDWrnbIO/pG9NAKWpl9uSMCl
	 yE2x+izTjZPq/SWXwvkrvOum8xMHgCQIck78LfVVPk6owHBejLJWXiZGlRMmajXxXb0pK
	 783anuAMgxYWXWxgUoR8HwcRRPrlJLJIrT4ehowz8BuXMpRx5i2LDzQtUZ+DbKmi+pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Iq0gvta/Q6CQ/D32KI0+/Ff7riJuqsj3tfy9XR+jzCE=;
	b=J1aDu/rg600oOhermbKPIWU0pCFeV5h+AV7YLmrPF0+OP8gEiOvlY/sKedFFqIg5mb+i
	 jybMpJun7Q0USxaDcDRkr3yYrBnN/iM8/vdRogPi96Vce8MuhLR00Dtb1aJD5dTc49oto
	 stpM6qLECUZicg66nvrAL4NDfED8/lu2+PTC2MP3sR5ORdoRU6yYc5sL9Y6Bz8fCy31jX
	 JNMu5/pvnbWujyRTNDWJZ7RAzVj6gUxopjVKlXTwebmXqfehrIqSInTy7MbDTwCKxzGZW
	 8XSHRpUDzrhYDVevkrDPiY1hTqCjTC0jA969aNZ/SYd7nRAZ3DwyKTUYeEMvx5+UWqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VAcZVJfQ;
	arc=fail smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17CE606A8A9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17CE606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VAcZVJfQ
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1273010b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794842765; cv=none;
        d=google.com; s=arc-20260327;
        b=R9R61/jUNrzd2OlFQF9ogrYtgmAqzBlPhKMFrtB9W0WWUZl4BlA60IJobbyS2XRJtU
         b3AT1VqJK7q613eGPnaVfhZEzixwoqtiP4KEyvUaa4cQY55Z88oE6WRfWE9EIQiJhX6n
         2Gt+O8EvJlZQKZYTedcE0zjmkIbNRCITyf7vU6kkIYXyErAl7i0qTG+A0LJXQASs3AYD
         Fiteg/YWSYqCWPpixtGRCRVcOYrvyDMuVZqu3uWAisgGkiEnn02WUboueeF8+rgA+BKv
         sClpdqx8SigO/W+486qySHwXtQbCZjpvh78uZXHuWwZP88+BY8H4v25UQpwk01lXYxdx
         IwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Iq0gvta/Q6CQ/D32KI0+/Ff7riJuqsj3tfy9XR+jzCE=;
        fh=7CULIW6F8VE5CErc0He6DSe3HpwLkHW28+rTqRoQxfU=;
        b=LOX6JRNVRq6y9UqlzEZuaL2QvxQHwM6JKrnhpWCrhKXgVDHwdN6nwqEUfk6Lu8q4kI
         5cAOi6TiMefGdQPvQvigagalB0U2pQEPAfBtkenEpVxKlRJ1CTXmHUkHioCTs5vZNXfL
         AsXf4zTjaChF4yeLc/0UlgTKsstFnmP0C00BpWBM4oA0XherbcLWOdD9yAXHumRUUgBW
         hiYhtjs36uyn72rrBOYfTayqEgt71b1Jy4IuoF0aq46QlFBhaPhG4bsUKkxOaxtGeR0G
         5KlniDvo+XZKxVZsyLJQdAY0eeODA+1hbSBuuISQdW8cGFzBQglsTy7jpWsMUkwSCON3
         bVCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794842765; x=1795447565; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq0gvta/Q6CQ/D32KI0+/Ff7riJuqsj3tfy9XR+jzCE=;
        b=VAcZVJfQcVpNw9B6+eo7YYDLhUeLrAVYky8jyUBvVckKs86KZ7U5tvkWPl1+OzTt2l
         t7AyoOR7UKHMC2B/xRQSnTOHA57DVUrTMSP88JGWxzLpxSOp6R34+eoVMghw/zeyxEY6
         bAxriFQExR9zERYlbjPUVSmQnQS0mH1C7Xez6c88+/jDDhwUxB907kXWV2Gv8NICp2aW
         8JxMY/n/2+d86xjSwzu8G6BUQ2oH/yny67qxhDKM7Hon221vdr0dtx6VBVfeILwGQ1yO
         Jqqn0QP0n+SmVOf/D1LwcLiCZFl4/gdECvrHslgtER1/1PVEAlrZzxhzn9bGdlK7rKzK
         A6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842765; x=1795447565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iq0gvta/Q6CQ/D32KI0+/Ff7riJuqsj3tfy9XR+jzCE=;
        b=dIzwgLgUDEArOwQrn9VTJ1sbGxlaLH32Mc13AMP8gfvTZirC7+yEj7PynbXgoWOAak
         AUMxMskct+lN/a2r7mHXRYT+A+kNXwUMfRPxIA4a2ar5cZuquZ8XLnQSVyoEIQnzDE6N
         7g4AHChzq1Yo649otbYGE1uVxxmBK2aWGcBkvQnGNbSahGNAE+pCQjGZDUJCddQ9UCYi
         8wLpUAFv8i7HTaTYKMIdELDHK2/poc12WuR8qqfRWFKz/ZifWDVd1uEdCfQLPKtckWo8
         65J8s3yay3dgTgV1/gP4gJpCvS4Ae1j/UGEwlaNLZzVc7Uq7Ala0wl0/jrNY0Svod4DI
         nimQ==
X-Forwarded-Encrypted: i=1; AL+hErExXgWIQIwnPql+N30s+h08FROQZc7ijg0oOYLmLMCB+Yacd2pT7S+uqZEnWrHNWa7AQ+meZEeSRXr1OW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6vU94VpR09zcrE8Py2gScloHuIo+fgDknHrCZbaSC7543ro+d
	MtBIxLNZmdhq7Q8/0TaIJvdAU77TlStrRsGU4ZPJIYpieSgqWNNwSywvt8jT7cBpak4K2EjQ0WE
	rJ/h8NvEAUTgOhegEC4BFm7V4AlBAY4Y=
X-Gm-Gg: AYBFou1M4tFOvYxIcp5d3Gt1EFHtoVcIrioQwsVe5elkTfMXJKaNxrXX3TU4NS4LbEb
	pihGKszZHKVjA/fhtcj5ow5FLc3IIfQQ5avJszVLpkQDNG5y5GK/18ZH+o5osrSQr6OgWtEEFnh
	hM4sF109Us6eSwACAn5tUxNH2/t/2zLFKgWzlOwQrfCd84/HXLM/6h+W5l6/XCDqu2WaYTag6HG
	1QQqcfmgm6j3g+H5lk1HUpnauIjjkI7R75Zh/0T9ujkvDYTlSmlpSvqfkD6golEgzizQ/sK5Lok
	+b4skFoWhHA5xEGeZX/yQpUInDjbpdbQDceejQNSPwaoYAOXHY3kN2Xyp6fc3k7j0Ae1as2Gmz4
	6BXmy+hkab/aEaHSBQsRFS97ggiyhEDfG9lzfqwR110H2G4EbW1VWwq9Qx/2fh/iknJps5Bm6qu
	2J7Ze2krUBYIUyWktmjuyFH2+oZ5N/UcxktlKPKGLJh5Cj0eu5oE62
X-Received: by 2002:a05:6808:199e:b0:573:f2e:2c17 with SMTP id
 5614622812f47-5730f2e317cmr4461889b6e.45.1794842765588; Mon, 16 Nov 2026
 07:26:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115164658.88420-1-dennylin0707@gmail.com> <20261116133927.GO11319@unreal>
In-Reply-To: <20261116133927.GO11319@unreal>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Mon, 16 Nov 2026 07:25:54 -0800
X-Gm-Features: AclHuK-4XlKSUrW0xgWDDO2zpNonQezzc7VHG-Gcnkk_w1j8JkN8KqPTBfnLU58
Message-ID: <CAGEkeHfdRtDM0Ziwe-cJp2qsAs9vstUv55HQ=ydzZByQ7K0Wng@mail.gmail.com>
Subject: Re: [PATCH] RDMA/mlx5: Validate the DEVX command length before
 setting umem valid bits
To: Leon Romanovsky <leon@kernel.org>
Cc: jgg@ziepe.ca, yishaih@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 5:39 AM Leon Romanovsky <leon@kernel.org> wrote:
>
> Thanks for the report. We are aware of this issue and are working on a fix.

Please Cc me on the fix, thanks.

Reported-by: Hungyu Lin <dennylin0707@gmail.com>

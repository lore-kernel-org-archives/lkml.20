Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298142;
	b=WIGU92TEPL992HMvTM0pBW1vcolPsLrIJs0oudIXTZqpmuJiX79Fi/n7a4I2WxDM5w1i
	 dyLOdDSYqeI+iF99AADMMX3LfG/8UIoKKEnV5Mc25r81YUyd/KKxuRdf3+X8qdmBGmZlD
	 Q+rWRw6I/lzCSh14FUFgE4HxC+nu7wJgURYRo/cIIPd5Onxl0+YS0hZyCP4a18nuhdEin
	 5B+TFd7+LG2dzWZYh8vBHykweHPH5DCXziJVI/BysZEF24V+ZxYh+XwP/dSQ4X5rOOPGT
	 dz779iQ3L6D7HgLwpxRjfVeJ9JjfyNVCgdKFL+jQbSMg1nGPCP2NNjMwLO+P+alDbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j0lfMVo3cPVAp5JDNDwKQqogdYL+QezhiKu+RrquQQQ=;
	b=bNfsItObPvbnVUan9G1I/ckPh1ykH+56COcpOg/7c/9x6Trhcjy10rTVhFHgnGw2x5uT
	 TN+rEmgGqtCjNFtmN6O540OoKpzTtDB0Z/RMoK//uc+v4Ju+AFA3FGDeZip7a9EJTeJzr
	 aIhohYgL4FQs9wD4dVACiMvHtQ92Xnr6QhmtY7uBhAO3QJXs7n97TmyBsulCVnVCi+H3k
	 uVH3ZOdBQxpBtpPrtZw9K+oci0Y36zZPA0MvTLNUrr3kc4xZxY7Z8SHOP8AhixbSWJRKk
	 63WMzjopoC4Em59Xjh1yv3zZw7rWj9Sv+FvagFb9XX6M5Lmb3X4zLMHKqOmodDTYTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7lsMgPq;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 571B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7lsMgPq
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988c7371716so790740241.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793298141; x=1793902941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0lfMVo3cPVAp5JDNDwKQqogdYL+QezhiKu+RrquQQQ=;
        b=f7lsMgPqYoGXQVEXNwMQ6Se0zCFaTo4CiLFLZOkTxV5lrJrY14JP2c+QceQzTgb2xN
         1RopzC3NFFSqYeFMehsKj1mxByOw9CGw5Nos19+N5QFLf0Bt06/8q/hDlJbGt51Br+JY
         THG7oZp5RNfPmaX8d5WQyjkjncjyUE+TN/E0xpmkdnHgf3HW9x2+XMX+RGnPS+B83Z6V
         A395mbYQQS/adBoslcZWVvlRjzRW/ZTWH1FzQHgVOy9CBJbDebqkVfNpCOPmT6sHWqNs
         atNJRg7LwA1VoKT8ee1nFLpLVAr1uEJ90eY6YsxzwQCj7W8aKCrrZRM2qMIkgAmyGcWG
         0ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298141; x=1793902941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0lfMVo3cPVAp5JDNDwKQqogdYL+QezhiKu+RrquQQQ=;
        b=FThIejCVM6Bqi7vqN5hHCjTmTzCDqFga+YNT2oldqFi+Mt9dQuXZxfZjP/aqEa+X0A
         Mk161W+4MI+FXTNt9J1EKa4dA/lY3YWJQcfit7nEO9DFLsSeKH7fPYLXxN6Ua1fKmNDo
         LViPLy1c3Jo6p5FyF94SIfoM2CV1VZH4Q1BbLJXSTwWBCurKOtHreeOJNz9qQas11WHl
         5jWiN75TiYJMPEG2RPwSYjNYpKfZZTEiXXQf0fBQfCrLZzn8CITUy/a1H+/oAnULTxak
         kXuHj+zJlz+WV0xTBMwFacNkWlICbO97FoQ8lo8ED9FqCUDcwR0GkayEVovyL/NjryjI
         lA6w==
X-Forwarded-Encrypted: i=1; AKwUvByDhDArEknbLaQw3wCDqw1KSwn/2UJgx0MN0UXV6CxizEt53tFBJNhFjpyy+OAR9r34vabYedia+3f3+jw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl7l2dGDBDHoeDTiWuOonq/vzTiM7H5Dm/s8X82S6dNuxO6UNx
	Z3orqjIy9v3DlQM+pjg3kQqPxwRp0pfEcWrFLr7WC33KRjPj3vPejtvG
X-Gm-Gg: AYBFou0Cmxwivd9aBlHngNSrC0+JDLE+V37ksT4mNA3wnf6XhahiKXIXWSsvkOgKjWX
	GlTq3hvGuimFCX09nD/QLv6Z+JGUFww9qh+62+QOTzu3h9MWsimx8uI/jypR1qprGcikSBjQ5Eh
	imoBrnqLouFBUWImsxyEx0KDHCd7c+HuTQ5SwP+SOOkW061qqOOrh1geuyOndH37eG9kJ2JGlDs
	ocLsFJ5KNWdrv5BYhYA+lio0t7ju/FQeSlxrVp9dShn4J+8MWKOkkrLzqfSKjsY3fpRvW9uzcfh
	I1zplT+/Tv72n5hQTeihOsHzDGod4jqHjCeturPhq2mnexABuDoOAiYbCWy/QPO4fEM8Xb6jZpu
	xS2HqkckQX4t1xrjIamyOewFUgz7IkitFWc7CqHsk+jFyv39LfJrVoznVdscKGw2gpAGZBoRrZy
	fSw64ieAiOBFlRvXkSrFiohmZmM6ZRmHbNsDVT6ddicAKkUbLB6+MPz0UK73dHYMF4TMzYQDwOt
	eLkFGXcRwU/SjOtEfahpYItLv5r79YK2Zw7sdXrEPv0sLs/dhhCb3MviAPr3VLt2NFqoBt+Cwis
	ciTSfdmXekPu6Kau4g1W6BHRa3BAPoqGs6LXEN1RQVjuXnR11uKVFKNaPyaZgW3Xus4YyFRfdIv
	QMh+okzVpOTMNKfjsqWMMAqgW0kYlzSgXDB9g
X-Received: by 2002:a05:6102:6058:b0:7cc:95ed:30c9 with SMTP id ada2fe7eead31-7d0726402e2mr64503137.29.1793298141176;
        Thu, 29 Oct 2026 11:22:21 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992452cf638sm590014241.1.2026.10.29.11.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:22:20 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	Raul E Rangel <rrangel@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] serial: 8250_dw: preserve BUSY-safe fractional divisor programming
Date: Thu, 29 Oct 2026 15:22:05 -0300
Message-ID: <20261029182205.3453032-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
References: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

With James's BUSY-safe fix reviewed, would you still be interested in a
follow-up series moving the idle handling to callbacks in
dw8250_port_data, including the LPSS conversion?

I have the refactoring ready locally and tested it on an A733 board on
top of tty-next, but haven't rebased it on James's patch yet. I haven't
tested the LPSS part on hardware.

Thanks,
Vinicius

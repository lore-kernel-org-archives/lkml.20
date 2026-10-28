Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171861;
	b=hoD8HcK0/jwTeHnG9L0kFzJAar5hp/R8B95DI79dIE4aVqmXzrZpbpO126ZUsbcuM2Oe
	 Px5ZejAvoaBGawsLVPvbqdDBdDz4wgFcVNdk5zQ21kgcNZiVR1PBlgifWkzqu+DSslkwp
	 evywvNRUFwAxYRaFUvD+Q71p7vgI5xCQkhoNzoSDrGOBIJRT9Fmqzjby4pF8BtdKptMTv
	 JvR3jNe32/qS52I8uTJ5vhd3GF+nYoB/sLY+mFnLZ++z+8Maq85bHGechuey177G2+m6F
	 LAmXks5j2nSEYSD/GHXcB82rgjrtqUZ5TMuaeGyDb7YBcZhSTxFlDaxBWtaunY27Yag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
	b=HQTJdXYn7DGV2VvoGpwthl/h1E5TZXzgq/zt7fqX5MKLP7bAQyvxTeH+EyexKEl/bu43
	 3SS4h5U82Ng/7E+9D5AFksOU5/HDe8vly1RkJpSbQequwU5h8f2xqunXT5dtRO+xnwdJ6
	 fNLP26zWppGylqO1yOFVYAMGuawdeji1K1XX3OpkcwaX3JesKWuPIk2S26En3RcQ0NwfO
	 Ah2Gc7OBMqLh6Bm70aEAdoEPSiEW1GgXCiCebvbUOizOKRVT6qtWzg6RdMpQm/HXkeGCC
	 Q81AwaID6iocqDB8/MuAeKWomxXnVHI36iaRvDoo7JiLOOXF4NL0WWmEPIgsok281DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69DF606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69DF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mXYTeY1D
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3878905e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171859; x=1793776659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=mXYTeY1DFU0B3UNUDpGvH1++9XqRCHBN2c55fDs3gaMOQO47WsY0IeKIoXEOK7phre
         qDRnMs8ytOMr0qtfMOSb8TiEdkTuTi3zrvIo29YjRcHCIyNVRu5jvmrnw+c/7+ZTnZdu
         g+m+dlrewe4oGQ7cM44EPt9kdHQxTNGMX2vBj7nmA41j8BZlObfZrV/xzfLKEfzFF9JV
         zX00cy7U2P/7MMHvf57mTP9FPWSpdqrAGPOP7VFbEtS+I5HsiFc5gBOTKp40co7SyViU
         LmvhwSbNkcVsBfy3XytO1tE7SOLtX0a18awiJgg9Nhufe0Sw0QKxI65RIMv39zTiKOBc
         rFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171859; x=1793776659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3qKYmW+KpgKThN2slX/odFU810T68LPK+2Pye7ps2w=;
        b=OhSGLLrRyXI/VXJwrKGEtvVbgxyxFRqXE/kqOeWiMnm0D72QF6RLDLTRDPl4TXCAjU
         zda6s3DQyh1VZdYK+5ceYhhM6k8H3wly5p6ibbZp9YdabvK7fa46Mnp4wTpzc7ehtMMm
         mQ9ECfh3MFUh5/nUQumanhzQ7UCKPkAtbrg5q/xybm0PX5pZtiIJZvGc7T6jeYp4uhv3
         lX8Bjl3yrg82kso+s8a4UwkgfAlNV2UWGBoCQ0+0/hDpmpE4daM1GyJmB0MlpI5SMSsJ
         VXPZJwQ7BvmjBcsksoHrMSEgXrdGrjGTZJRA2r1tpAwHmcqaI1StxOuKynatlVldk/u7
         e77g==
X-Forwarded-Encrypted: i=1; AKwUvBwneB35xxIG+7+1j7HwsT8SUxUK3unbsciwydmqdl6QXHKSd8ZJC8mvJTrHuVFWPrXNyGnKn3J/ZfAEYbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZtU7Zlhd0rGlZb/NupwSHAOR/p20/AVc2Z8KUR3KYuLOI5yL5
	t/OBgQNbH4q4++YxpC645Z49y8CRkGWUhuq1pC+rLqbSwFVF/ataSEwA7hTRLMhrams=
X-Gm-Gg: AYBFou3l3PfMxRXcXtZ+I9eHem1RuZeL06kHoqxtJkFcYY8MsIEa+/CA/g18c/iFJ/2
	qTnZTPstKe7ws/3Tq1tquQx4iWDoKE8aPikFowVv0yBcuchsAnoQFrk1KRabi9H7GMFiQ5RmEfK
	EXiApIuop9Ho2yg564OMREy6i/FWt3D5EcuLt7wcrm2Up1G+PK6JslLn3MJ77lqLTxxdPwZK+ac
	ArXK+xYodvd1fy7zz9KqBef+zk9qKmGFHJUSgejMJlpJyUry3wXOZGHZcBDe37mHN+C4azETMy6
	JufilAkza+vnFAjlbkmBzQiDKJKH9U0H8Q/LWt4Jwqwwy5dE34YfFr6nq6Zj4MDDzbewr1RXP+S
	Xn3ZBvM0j/uXTWjklcHi4Z5VL0DRIyidOtojgZpZ8GD0AyQJVyuwbjYj18qKl7iaQr80xPQym4u
	5E3PZXPK4ajO+6zjg8a3uSQhfFoPdCEwzuERtjCykMpiIhnel8ND1vgJRqmagORvd4i0w7bY4sy
	oyO5Wt+3C9RDzp1C3V8DGlOKxDF/OCaIlLCqDA2FS4fZMKsslLJ1WgEVWyXZKsoNhXI2qsbHeTy
	Xd7c2GSkFHWEvwSCirEdDrifCGGoX2EuvmzPCCzueT5yofnr2op8Q9QiwKFImGf1JdA5c1YiOHw
	jylMB9npQa6+Wzyg=
X-Received: by 2002:a05:600c:198e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a967ba8856mr25106675e9.33.1793171859280;
        Wed, 28 Oct 2026 00:17:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d7cdsm20719315e9.3.2026.10.28.00.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:17:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:17:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
Message-ID: <auGhPHjanNTkkzG-@monoceros>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
 <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bf4vux6swhzzilrx"
Content-Disposition: inline
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>


--bf4vux6swhzzilrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 11:36:58PM +0800, Han Gao via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a lot of unneeded
build dependencies.

Best regards
Uwe

--bf4vux6swhzzilrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoY0ACgkQj4D7WH0S
/k4lEQf/aQompiZrE8lzHamk+WXWr2kv9iqPDmKByLu358ny9EKvV3eNOG0y3m2B
hMQ9inmxBjyfz0TMb3NkQtmXVKnu41A8A6mcl3B97akrhcvKxPDgsn8FWhhNJiBs
s0jrcYuMILEssk5h7k5Ah8fEdVAXbDTp88j/afUmb9QfOZxjaW+SXfLYigacUFT0
U8Hy6rX3B+GESX5uvdxOY69bn4dHt7Qwr56FksGQtIi7Y9DbyRhhMRnwCy4pCLnw
ZD9t3GwAHwOm1fdsdqP0zLsJPukoZPNmbT58FjRf45TfYHmOSulG5O3oszd4ElAw
wrbitVSdlgy1G4VvYAZKJRQLV5gF2Q==
=JnXH
-----END PGP SIGNATURE-----

--bf4vux6swhzzilrx--

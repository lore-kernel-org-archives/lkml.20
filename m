Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461022;
	b=UvOioKRnHLTYtS0gpWh3UWwEgUYSFn9zavSIzVkAgc+GgLsNZi1GI4gzEPJiGcIeX/ue
	 6gziGiLot67nt5G1nX2w1cLiNdvayKXIkkY8rTS+HySoo9dFyW0ISxD+i8dx0Cd6yHEki
	 DwFiDc1JRoD3yUhXYLnFa9n2e19U6y6p+7+XQ2Qedve3IjsTZ7GoKCVWhRaK2boJJ/3ON
	 U3mt6Ib456K0sIqPBOGRqXqz2lIpj8CLimzwC8CDEjzv8Xsu4AaA1gg7kQNQEBQJ9lGxA
	 nN7xOMKtQhQtS/YiJwSvEakGHFuROsXFCgwzA/qFt2U7evcsWtgnVl8IupDXGPxx+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
	b=MqMDcJlxbEz6h+Zk1ZFkjCqln1lL5jKFZda30g92ZSKd7w5ARzrx+H72awuvCN4lf7QC
	 1D5M7W2LT4NRqJm9nx7eh+a54N47l8EWi4cNqijLY510WxF/TI5I2CwAzo34rImNOLeKX
	 /IgmKjXLdPEzkhQrAN1uoe0ZJdRqCfV3HXLTGaE9KXJOG/Id6jABvUNjRJJFe1fgY6WGv
	 9+T6Sow6zAvPjMNwAqV+EK1tv3+bzI9tN2zilpj9vONcVaYWdXk/QqczDufcuyVEi2Kik
	 tkxI68OWoBswgnuOHe45JDW+6CZ4vzWs7pMQKZTDIw8KXLAx52PXXuhXv3VbZGufQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WZqDWUAv;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A73606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WZqDWUAv
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-366421dc8ebso121535eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461021; x=1793065821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=WZqDWUAvz1D2uFUD5vVpwK390WzmGPECmRzCwK+eaSpdniyU0CEzgt7iVMjKMZOFr/
         j+fqL/KXeDdBKDWyKb+WDLjEMDh3KxIs856Httdzk+UZ/fBSVbsUOH/r/4W/tWs6FVZn
         hg18PtV+W6n+gnXMMXOBjGPV+GUv6sjngGF1XqsR8VTDOzKNgANt03zRik6Tg14euxSa
         pPUVhbHl02K3hQrCS8N4YadYBpwaF38wUN41zsmHoNaWKEAzE3Cfz1u0X0u+MRsNd+vD
         Cedywr1wTJYH7AgjHKJynk8Sqfy96SwXR8k2cz6Iq3ZfppX5FMr3kmlsYiX6NwjFF5CG
         dXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461021; x=1793065821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDWovBO5t1R7cL/YqgMZtu04YVJnGP0rNvIJ0GRt0YA=;
        b=Rj57Pg98DgD8ulE1C5t5c7jvK2T6t3ozTeUKWFdXonKGRkiZbaxasz6pyTAw1/rDO3
         B6gbYdBJkoaf3I5uSY7hhC8Ii1o8vXc4bERk8g1olD2OevWfMbY+P1bC3wOhdST9pcLc
         abbeLBfKdgLdvw6qkxATk2bSDFN/x4u9crmORaNOXcc+0HqtlaplccZ7dMnm/Sw5IgaS
         hwwF84CaNqn2sVO4xImbWdhB71riFFtItHMFOzhZ+pMRj5rVWQOzOPXO+/5wkjPb9uRd
         RSYGHzK0MM33WTZMDNMYAMLkYP0c4m0y1zj4fSkL4/ysrjPudOweSlAHTgJXY7yMWuE1
         6/OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjGcx4V2dXKca2WfsHRY8nivavtLsUhTFNpm375PVN3z859e+Vb/hYWGlGdl+5idZIWVHwY6dm823P+ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh40ThUYK4AtOj+UJLLx1i4vhr0zskbq80ZCrG+uqGY/SVBX8B
	OtGCrAThXZYviqDnc6LRKw9mml12M9k6RhPygd4wnB+HMkm2xkjHwffR
X-Gm-Gg: AYBFou0Qg3+h5wLmFBbte77lMKoBBqAF6fp/u5oET+Ofm8dBZhv3yTimlxzz+2EmlKa
	dBTXosjKeRczrnOswuVZssQtgoUGL5ebUG4lcVS7FLe8GqY6eU0G/BM/eKYbK01VTOIMpqesFEu
	zqMIaOzhkoTxPKGGoD+HdrwoU2KhZTTkJ7Eur+a4nemqVLzSChhMLLKk2u9xr6BdXaK8/pvLExg
	7fMjzyYwGIV1GJPXmzc3iHYmmkpmbjNDQdmivLDWaqs9wlfD0Heb0Y05SH4T1kwjSelw8sZa6kR
	ruqf7Qc79rHIhwrjcLymvy8S1KmSJZPxfiphKmn0bhxM6YdEuJWttej/2mgm/VuG4F1dp8/k5vv
	YIvbl/YIZ0bEIWjkdU4uRJ3ILXpJ6/bGfrRYPJinDci4nqpWflYY5X5CKoxaCnKVfPEZD3zMqx8
	RRM94ZPRCpjCIJ9Ys5cX3lhZeJIrDQtIPXQNlTiMgWoK+JIXGfVWoBOByjVperk0JMsG14TTODK
	GnFjFJYrmiZ
X-Received: by 2002:a05:7300:e7a4:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-365fad8dd2dmr1501089eec.13.1792461020849;
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm37187697eec.5.2026.10.19.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add
 Allwinner B288
Message-ID: <b1f2e857-134f-4bd9-84cd-fa05f43a62a5@roeck-us.net>
References: <20261012100816.331033-1-pmazzini@gmail.com>
 <20261012100816.331033-10-pmazzini@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261012100816.331033-10-pmazzini@gmail.com>

On Mon, Oct 12, 2026 at 11:08:14AM +0100, Pablo Mazzini wrote:
> Same watchdog as the A31, which it falls back to.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

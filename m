Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047766;
	b=1w9rVV0lz61LOVsa+o29Xs58R/ucD71ozD+MgqU7UzW3YnKCBVbqcPqfwtPwn7CBkvt5
	 TvtkZAj3PTV70wOv8FPE3g9QVjg+T0czAIxbUXd7dtOlxDeVhrzbbJPZIH9rwUtGlmWGk
	 S3Q64Bsdx711wx5URQqgd0CJqsRqUsFTkMK1fTi52+jLYOrlQbf3V5eOYDqueq8JNbpwr
	 okSZ3OYXDb0NTahOXZsUxs1v6NZidZ6eKNuuRp7P0KgdR8jZRvvR4ZxAUYFYrsUrxLvyF
	 KeW9vG3jKFsB5MMgo22JttGnZUoz6Bbtq6sFtdvHGbl4xzdxGgdrDuk8N5pe/jnS79Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
	b=5MEzSdP66qbb3VzXDzfg1eGG6itJauVS/ylGIO52oVpnjjO3BJ4ntZQ1zyqCRaJyLVI6
	 BuO5L3ehTDj+Bd1Hmrbl9v01gqviQdLsBJHJ/PjBYkbA8imE/S559fhMErzlnbO9Jx3q+
	 RK07fHWTbsEnV4azqChik6Tf8RixeyUsS0+f/HXNl3PTvWMn9JP78MthdAZ3+eZihfu0V
	 IsKEj1tYkTPrO3bgPbTDkuyNolgYIjMAZ6PXBdFzCnJJqa2+Kui0L9LsLh2zptXKaCoY6
	 y8rmt4tSETkZg9PnTlH36iCJAc/ifFXka45yYAgvkAYyyCaBLxF4sd+gVX1PPAILbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C5606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C71C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-157fe9d771bso4153898c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047765; x=1793652565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=SOm2J0YDd8dr+H9nWsHno0VM7EdMlOfYVXZInbi4/0JQ1GeROjXQ7SEiGpUM7Z1ZlY
         Fa6i2etjNxG3BrGH8VQ3H5azkFRMcBeIdpXEDFMaNkJ3FzUnVrWCyHBa1N9PKlx087T0
         7OWUSppxowKbI5X1Gv7wYQT4WEXfnKWNrTjHpl2H1I6cNduD0qRzZcktver3FxaM8Oye
         41KC1y1rDmEvduWsQn/rtADwfrdMpg2WD1FCDMdr3olFPgZocnDNTAuEy0QZSwSFE7y+
         RKG/Bc+FUqdgsq+Z2Nd628GL+ZavCStyHCkJAeu1FrnndjBchAN0U9LZUU0RtJCgB1vP
         IXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047765; x=1793652565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=FF4R2buXNaLy9/a3wq1Z1yEDcQKsCsF9bZPmD650ZGzM3w599cEjeKJhf7Bpki+zZQ
         iuoq1YdVB7saAcfJttxZjD5LfQI0EA+cgDU/cZ1yxplOw0OJvq0MwJe9ju7K7KpNXgAO
         h0d2TKh/0RYq90TA9DKCfiuWDmjs6K2Fo8dpdRg/5ykRtrS2w+ieZhNNtWr39E8dRFbM
         NYFd65qGYJM25fEjulO0R2a1/W5AOuoTV4GDbG5996WK/vx9soDg0qUmtezL+ybh/1kP
         +8EzUY7H5LnILY9CR2BqpSMf1HL7ThuS0EEdRsYwOr2etjPHiSEtD3D0qszjdr1Iiooi
         TGNA==
X-Forwarded-Encrypted: i=1; AKwUvBzVSZX6kUwjC1deV01JWENv1IMt7ZDKXuvn0EnCVcvQLlqn7YVXX3BCOTUlsxWeO+qaEsZ16GzSgrgRO6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh/hQPlilci+J4K9ukjEb5jCRD5JunztUGNwF86r1ayokras8n
	UbD7H8urzNyaL4hFpfB+vTnfVPR/PGbaIt7+OVbwN6q8yUx+4fxM5PeY
X-Gm-Gg: AYBFou1xwOieE6PXFby0WNcIl1vV6I2v/TnzIvI3LDvOiK///cUH9x+TGSUz9s6JuWn
	bjbXRG589Chw/djfr/CJl8gHEKGy01dXSJUbw/KFFGLXGxBALYsFo1NjXt//+yKBQJS6mNRWQ/z
	Cc8rsrnJkfSAECVt0jX7vMGpXvRy86s9qx0p15H7uioHIeCc71EtT3JtiKcpzTy01D72YRToRwF
	PVjdeBtbPWpM8KP63WhoQBDHUXo+B/P1LtYtlTCObjsoJp0YhP8Mk1LtYsPzprVepj1fCbNe9Tw
	qJ+a3tGi//AD/z0hFrM+XhXzKpe8EZLiomPjdnA66CH5wAWrEkBQxVGLS61OHAZABOYJOrkEren
	uBz8vRiG9Vex8r+EcPXczH0Pbp5Q7NXJE5bLG5CMtD0/SacVvEP/bWMKS7b82HN57iElzIkceXT
	R4rpPeyK0jdVq3jhLGx9IaRs6vnIwIuZHBlgLIf+uXb3OoZgp5iYRWDT2iAVO0tJXYBHM04+UCl
	5zMDIMjma/gyzhLqCNJj/RrBEZIX70DWYHcwb1cM43lb4A1CnD19sbNefAamT7TEy6oUA==
X-Received: by 2002:a05:7022:5f0c:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1993580f7fcmr11112099c88.13.1793047764607;
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm24328463c88.19.2026.10.26.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL
 telemetry support
Message-ID: <d1a1928b-5a30-4612-badb-4a7db7b4f991@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-6-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-6-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:16PM +0300, Vas Zayarskiy wrote:
> Add read-only total power, total current, input voltage, hotspot
> temperature and six channel currents for the Aquacomputer AMPINEL.
> 
> Decode its 544-byte input report through the existing serial-number,
> temperature and update path, with power, current and voltage handled in
> the device-specific switch. Store all readings in hwmon units.
> 
> Select the telemetry interface in probe by its vendor collection and
> input report layout, following the existing Aquaero and Leakshield
> probe filtering. No match callback or HID core change is required.
> 
> The separate keyboard interface is not supported. The driver rejects
> it in probe, and stock hid-generic yields to this driver's product ID
> entry, leaving it unbound. This intentionally limits support to telemetry;
> keyboard support can be addressed separately. Channel labels follow
> report order; configuration and alarms are not supported.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter

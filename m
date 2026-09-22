Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BF554090
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089321; cv=none; b=CjGaEmntfhpGjzMtKJz9AjJvjEZjRqfugVUgbjKeQnywoA0hWjSTAVHAQFs0aKlYfdDdOpgF+V+p97ocQ2lNHyrQ6Qv5lIO0znGYfAt2hyL4rGbzgNF+2O+n0ytNy9RQphS0MQmkDbj/zEZARvDPz4AsXAf/hT+ZPIj+s1ysBk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089321; c=relaxed/simple;
	bh=nJaInej20W9dzeQHSkKI/1OjjvnAws+MmFssGn7W3Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9mhg6JRYh391D2rx4YJOn+wgb2F2je/nUGqINFXr1CrixIALo41yn4SowTK5NS5KO8Gg6WnuYv7iLujL9SimvAFjvxxThvUpCi62Z9R588TrzSq3An/7q/IKspPUCO1iTWyUdd3bliQoJoDVLfOhFfF4w/UCslzw0h2xricqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTwAL2XI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTwAL2XI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so31953995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790089318; x=1790694118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LPDTkB0QGhdPj3hyMEadxYVUHPg+JvQ6bPrYQoaa3EA=;
        b=hTwAL2XI+1Q2PWSsIRnU+1NhMqw6409K+azDUXGp5ONJwU2xqXBFSzE4CeG1EczfUS
         bJXSwgVQJmRgjWk4b4LTr0U251LoZbzIfkObUP/G3PTNz8jDRqSLCbvTpwPHP5fmWqee
         i9LJlFQ36i9rIGgbhaV9cqbZWuvMFXtKgfimamfE+/yKye9zhv5g+g/owN+R9h7QR3QF
         EfEkxvazVUMI79a7GZyaNnXZkTzSpydAHYYvu22Idu7D66JmlvEwmc1LMExYBDwVaorN
         th9fzRKDAByp1q7B99aXWRDUWWWpKsPFlUa4RfyIJp0EKV6mj9HlA2oiWiPrWHqzRH2E
         hOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089318; x=1790694118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPDTkB0QGhdPj3hyMEadxYVUHPg+JvQ6bPrYQoaa3EA=;
        b=Ej26opvx0yXQAN7nmBvEVunAb/R6cE4CYXG6Kuo3PC0XgHs+Vquwcb+v0gO+MfAdyU
         gHdI1HBOAmCckf+7G41EF3/BVuwfLfjp8UcxgEe2J2uaJhhWiLzJtEqRrEDBVu6HW5wX
         Wg3c5xtSnT/u70T1H5AIcDDYiGudr+cpmRS0pP5HmasgQb3XY3irEOUqW+iB/Mvdhl92
         MEPHRWWKNeNT2mRmiGiXfrcApfCO+be1aVJY+TUFpafRp/sjjgOcbGgqB/mWo5vq3Nb9
         FujOWEtQa2Q8KnQY+t1CRzzr7HlVC7wtiENpdhBk2ukYz5EuY1ACJQH83A+QVnyrk0ga
         tNww==
X-Forwarded-Encrypted: i=1; AKwUvByqoIoTQrg36LnrCe4ywJhgScrQiwkiEsB6mJWPCi4wfuRarv8LO4EsbQwzNMwnvgNlxL+EBU+ekCOxvtU=@vger.kernel.org
X-Gm-Message-State: AFuF++nipmce1ct4SbJQfwdrVpt2lD7NQHZgUHLY9jztQr5PJOX/12UE
	JmJSRUWcaxGFNTBN/Jj+Wet0pJNDemmo16lUNdM2OgmnlQxaXkOUTGhF
X-Gm-Gg: AYBFou2aRVyxmHRJjzbespCgu7f+twkz2HuBNn7G2yniVEy1d9Qj7qny96k//+PI0nV
	cn2LWPJ4JBHodChZHly3a+jPQUQEJ+Bv6FNnhyREK533TJUPt1ArGv/NKz0WqLQlsjRCLQ1yWyx
	vY4Pl0XfhZE6RPV1M5PTUFtcY+CjhJtZrsRBcVZ9ikchqOPUeiLGEjLe4eRZHHjAbCIxCfxDKCa
	6hU0TBxP5IkUCp5Y9XkORaMvJMU26koteSMwnv9MJ5zH/d+Z4shXxU2c5mMdNLZUIaKw0UqDkQc
	0JSntWNea8rSLaiIHcFBfIKOD6jOtIEW2VmmxPumwb4od+dIuO3qdkWpCeNkyfiaaZz0DfPiCZy
	BKKUYWVRkzYBX9XqInTU6RuOzudG8a4tqaOHDfd8wgBdw87JEbyx24ympG5FYCWhZluWzLM1b6K
	mO1a3aqDb3lKZLY5UxSwg/4KrycHgXTDyaK6H5Q6DJyVmGSuy8Bsp2wlPgmC6xl9FmDLODc/5r6
	TCra/39HpQXYdtn7+d37Dv22dssFSxSnlgpNakOGwOv8uwqHbR1Qr+yUliNo/v2AbcvIQ4W+cbF
	ydJNBnthjF1s9X2EG79TRAhp5eG7eAyAc+VHfA1YDd40zNSlAHzfN2F5zmEtkIvYJTtuvfh6A/V
	MEeIc2Vq9ilCTtgSHCh88ZEWEyRxhUjIrMBBZciNUdB3qHeb2ezxClvUAFKE/4Y67Swd7Qa2kR3
	EREoRi
X-Received: by 2002:a05:600c:4712:b0:49f:dd10:3c71 with SMTP id 5b1f17b1804b1-49fdd103ccfmr19072185e9.11.1790089318256;
        Tue, 22 Sep 2026 08:01:58 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa9dbd6sm62767365e9.2.2026.09.22.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:01:56 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Tsai
 <ktsai@capellamicro.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: Add dedicated CM32181 schema
Message-ID: <20260922170156.00001c8b@gmail.com>
In-Reply-To: <20260921232752.3136129-1-robh@kernel.org>
References: <20260921232752.3136129-1-robh@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 18:27:51 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

Why not additionalProperties?

-- 
Kind regards,
Joshua Crofts

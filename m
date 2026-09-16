Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B234F27F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571110; cv=none; b=on2ymlyARlGqPXDSZUB3Edh7RAXF2/ZnVO5AEYJ6cobvSGs46EwohpQ8zy/V2cxQ+u2au7a+DoQiVWTi6mR1kRZOmjadVngvmrRxIERu0j68vDMCH+9fA01BoIuGpQTQo0abpdeFtU7G8+1Yl7RKGLm2LBfTXkZbcxQdaP5XVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571110; c=relaxed/simple;
	bh=UGH2BzlDTaQAN3ngnFgegpzeVSHQi2yZ8hlwGyKZ2nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpacFATv6esXxPePU4nqq7b6auuhPQUI86ecrNpL6kStuvdfJUt9U9HvRG2ynLUZMzTFW1xm/hnRxf2GsnUtXrj6Gp9BIGkEklFclnW+kH8FIFH8We7jtbYz9GpGMCfLqTcaL41JrMn7WdDbRHEBoONivtoedN77qEt36kNcRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvnJhKQC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvnJhKQC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso791991a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571109; x=1790175909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DSGg7k4lXbnMmb+PSQkP+q66W4gnIscXzR3JqjEjm5M=;
        b=gvnJhKQCi1EL9sFh4P9gym2zHyPis5esjYqD7qh0arnMbgGUyAJOX9LuuXZSw/K5dL
         BO+qburCP4ZYAFa1DvbI9OZFmWApaA2w8oenGpkiwvRQ4b1ka1egAqVSukimP99uk1FH
         RHBmez8qc1YbM3AJjP4zpM2RpSVnnUK+Yw5+nVWWmuF7uxi6els2EAcEOLaCb+i5e2ru
         dqUd/XrfuMh6hKlZsiMDSDIUy7ihAjl2JlrkKD74cNggvjeYsrSwJhvfpat/mkd23AB8
         wFlp+/rsTYEsSEnjNVGmpvd/Th4cwJgarj3b1G4Sk9WKD8GCUqS8lfepxTty6TtlXbK7
         uxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571109; x=1790175909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSGg7k4lXbnMmb+PSQkP+q66W4gnIscXzR3JqjEjm5M=;
        b=nDx2ksZYonbFTfcKf5mp59AqLEIgZRbL4XmerTcqCDVZIYRlMnVoowM4OBYoU96pBF
         VAvMpaQln56CpTRP7uzk7FVRYk3lTfLlhhZANLpUzowupADckDULLEkcA+vIEvRZu5SA
         nnwKJUjKJKstaa2DUiazx7yZb1sftsltLIos9FdD8waL7HTHC6PfWL6/HjrveYgx0ieO
         sFC8euxFzObhKKX1fQGMeE0SOgSQzDQdc4AdYduD4wzTV6WK2okh5tLEBQ7zXbhmrnqj
         T0B3zGzRIi1RXFwYa7EV1jIjIWBTmK789gTSOP6drqKVz889xyuHCEryW/y0KTNfSUO1
         dE6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwnpxuzrkrQ20N8BUMh/1A/iHCvXZV3IiRDgli8II8uVPnLPvia2FGBAXMmMkgS2TBvQVarBvglnN3gzE=@vger.kernel.org
X-Gm-Message-State: AFuF++kihuZKYkgPTWc6xQcdtNMgFJ2iOZRiVYNhfvIok/JEO+9xnbhu
	/8HivYUC4qz6uU4IlULmPx6jlK8B1YDBvZrsNhHd+9sudNvSIWgGg06F
X-Gm-Gg: AYBFou3wb1iRyLZWKhWBvQ6j/pKoQiN3/q7WuNx1tnwaPKUJL8L24AysVOx+k8RvsVq
	yBLbrbJE26gh6joS1NNWhy2ZC362M3BgthaLbRjYgw9ZpsvYrQVfCvhWFYYthLG14iuOKHoCT9o
	Cn7A7aCOCqjoNqOEEhirqDsW1tOo/FPRHl/nwGeqzs6QqNh8C8xneBhuDtlwNXBKjdMUUxz3LAg
	g0enWmUbR10gOkczCallUBqvmwO31pvtuRC9yVeG0bFMvsNvh2toBFJsiknSpjdxEjIZkDTLJoS
	7z1ROK86EXGsquWWZYRDVREl17YotZQBGfQm1C/HLGZwpYmcaPePoqPa66oJhz/Nj12tV1KRjJE
	8KC8Qhx7IjwObEI3EEqdNeR1u7jD0iRg1fKsItIitjNlrF+BGVOIzuLfYZRb+5jhKpm5hDvMV9+
	51rPiUpUywHhe/yRBOt0eqg6+fE+z9EPFSckaIJXy9x83yqhhRiZVIs0IpwhzWB8YAhUnizMuRx
	wm2HEeXYjza
X-Received: by 2002:a17:90b:4ad0:b0:39e:3559:12df with SMTP id 98e67ed59e1d1-39e35592079mr119891a91.1.1789571108738;
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb9f395sm5935562a91.8.2026.09.16.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 08:05:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix use-after-free of alarm_work on
 unbind
Message-ID: <9ff67a19-204a-49f8-98ea-0ed839ff02a5@roeck-us.net>
References: <20260915035409.4177780-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915035409.4177780-1-congnt264@gmail.com>

On Tue, Sep 15, 2026 at 10:54:09AM +0700, Cong Nguyen wrote:
> fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
> it. free_irq() (via devm) only waits for an in-progress IRQ handler,
> not queued work -- a pending alarm_work can run after fan_data is
> devm-freed, dereferencing it in fan_alarm_notify().
> 
> Cancel it via a devm action registered before devm_request_irq(), so
> teardown frees the IRQ first, then cancels whatever's already queued.
> Guenter pointed out cancel_work_sync() still leaves a window if
> something schedules the work again after it's canceled; use
> disable_work_sync() instead, which permanently disables it too.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Turns out this was already fixed with upstream commit a2471ed17b0e ("hwmon:
(gpio-fan) Fix use-after-free in alarm work").

Guenter

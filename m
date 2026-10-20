Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521348;
	b=OIqFFFNx/wOKOVOMeWjCLdDLPzXjdGqZwviuTqndIe8iCYJZsEq6+t4x63Lf1z6aeD3m
	 myIyRGXyK3qcUrZBdP/dU7XsfUSHpNO8iq4UDMKONxg7gBKNCp/p/TnigtbDmGbXSVhDd
	 sUDjTvo+ldqaJ6w8AG6L7WQWLGbQfO/RLf/4aY9gECSJBSXxtZ6SOllAuxBdoJcF4QPW/
	 gTLr2p8i0vQet7icps8zsuPrN4f2uKtUhou2lEfz5Yoc4Ltpn/aqwA2WRVrjRWj5Q0E2m
	 TiQDLO9j+glLCbrwFnLqZOO3IvEH3xCR8U3amDsLQym5w6Uy2HfhvmA/A3jTi8JEvmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
	b=KaXhLqjXawigAqt823AOuc8T8d0SVczsTzimKcfscQeNRPNoquc9hR8kV8rw1fLZb6wx
	 Ke7PmOjrwhZIflFPGXwbZLfOx1mdaAtaEAeqivyPcixAxK4bs1ESRk1tYgFthurm++0JK
	 I6HxCnJh0yZHioo/8XperGp6hYO5xJOOO7EkhHPFhRYNmu6XFP9PO3aKhrpcnKWh78caw
	 cwcX2GuozBY7eIdiRwgp4QfkErTJupnu8rZmTY0DqRo8a3cTCIos0WKDahA/vSA/oHMZg
	 9jYgfb1voZgT2apOdMkXgjZ2J0ac4fwp063eXSlgTUUonVYSn0vM1GK5VlQ+AsSVtkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhnTFu1T;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC80606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhnTFu1T
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso302359a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792521347; x=1793126147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
        b=JhnTFu1TeDRkBXHoYIsw9ulmTkE+fbuH5mj2ByzKgPZZuwEJN/jXbxBSpvJTzytQyF
         HdVubb57dUKpj51ldO1W4slgCsC/UjO7nkFqzX7NCwhaF/vzPf7wQP8LwesnNKLE9O2B
         gE/Uh08g/4Pt9DLWR10xxJZW2GPqqBpzoNzVd3FXxiueKf1P7/aa1mjRxpQPrwBxo/p7
         LA9ZLMwfNmJ4gCPpffcEquJPNQlMCkCVl+xWOIfCjPo34d1kcx0JYgTJTsHeVuYkuH6X
         hgmJuWiCL0KuCCYWmidVlE/CtxJBjVOLNcvvP63BpUmavIYF8hOxXpSq4Gewl6lS65l4
         6IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521347; x=1793126147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
        b=wO1DsKK5+hXgprM4lQqmW3gPgX8rKCxTRK8pp4EcZfAVBGM6cL1KU/pNP5jJhk+eTU
         B/SVtzpvPcNbuULY8XL2E6LrrWd8kuidSdlQ9ETk4qN0J6SuINW7FnV0jAA344ekYv6M
         Kd5uPA56PxnW/fWsci4zU26vtyQ081n4uadYdhimF4FGFZsGUCDOfHmqLyJTeUl9/TJf
         NYUTykqF7HfMiFOWIdkGnu/dIGiWR8RTUcxQ0vgPR17ZE5a2IcxllXSqTMp9pBdKPyXT
         c4h0+pqbw6VV8jTbzUGWEMiAZ+MGromdHoQCWUg6WU9NR7/puli5tYPH15ZIhFfsb4my
         TjVA==
X-Forwarded-Encrypted: i=1; AKwUvBwa02SJbr0ZW/BSoBp6K9ttSo+5h+8LVwElHlSf8ekHN83AZ701UI2ApMq9AO1LEPnohFOqretkNO1/ku0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcH+kwiIT77vJL3Msdpdv2wrfFpVC5RWK4xB8NsvKhsQvTTJ2a
	fCcnwll4FJRL9bgLpr5btOeYxv86Fh15AuD8wIfbgSdJGiZTX94JGtaxfmMkCQ==
X-Gm-Gg: AYBFou3527Z/Tb8rjiKVT+wiipp1qcT4H29tSXkj8vfSvlMBnftgNuU0auHngpIblVz
	JeQHnKBPeuZHUG+8XSH1J1sgg8gqKH7lq77lLbONCoD7qxInFPRuzfFCK+/sltZYkAoqu0PONEk
	6VtAkz4CDRzTtXjI7ksd3aorVSaSQF64bYa10hP2Fj3Zybmx3eVZ1LIRloWg4EE5yFukaz6KTOa
	sC9OeICYaE2EaXuvC1tp1KkJYn4F8202JSHDo4dqqj6bHOvQ9gIFZo5qOdgoHRgdow/Q3L2hhV8
	sII7wGwHsio3M3Is04obTJAExjyd374k3Xq4g44J7AcKPyfiwZGKnrYIxLhZqslzB/mGKWfcTQk
	7clu4wI38fiRQ/JYki+MsSVVCcMRSL8PoWS9NBsRKJPFrlaCPYYNTcXFuhjPoYy0tMTG9URCEYg
	of6gs5oTRG8O9TQza8G94Q6Bfi5RlDahnHuxep1krM3RxUjui4RXJEd0CL4CaKIwuHQz40vioyN
	E3Gyojb+cQ5KyKLv3eD7lg=
X-Received: by 2002:a17:90b:2d06:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3acef1792f7mr8928974a91.53.1792521347516;
        Tue, 20 Oct 2026 11:35:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm701396a91.16.2026.10.20.11.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:35:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 20 Oct 2026 11:35:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: xzhangjr@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
Message-ID: <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
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
In-Reply-To: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>

On Tue, Oct 20, 2026 at 09:39:35PM +0400, Ximing Zhang via B4 Relay wrote:
> From: Ximing Zhang <xzhangjr@gmail.com>
> 
> coretemp_add_core() only logs create_core_data() failures, but
> coretemp_cpu_online() still records the CPU in pdata->cpumask. When an
> SMT sibling is processed later, the mask makes the driver skip sensor
> creation. The core interface then remains absent until all siblings are
> cycled or the module is reloaded.
> 
> Package sensor creation is similarly attempted only when the hwmon
> device is first registered. A failure leaves the package interface
> absent for the lifetime of that device.
> 
> Retry missing package and core sensors whenever an eligible CPU comes
> online. Determine whether a core sensor exists from its temperature data
> instead of the CPU mask, which continues to track CPUs available for MSR
> reads and hotplug retargeting.
> 
> A package retry might fail after per-core data exists. Keep the core_data
> array alive until the hwmon device is unregistered so failure cleanup
> cannot discard live per-core pointers. Publish nr_cores only after that
> array is allocated successfully, and rate-limit errors because a
> permanent failure can now be retried.
> 
> Tested on an Intel Core i7-10510U running 7.2.5-1-cachyos. With
> test-only fault injection, two package creation failures and one Core 0
> creation failure left the unpatched driver without both interfaces. The
> patched driver retried and exposed all five readable sensors. SMT sibling
> hotplug and 20 module unload/load cycles also retained the expected
> sensors.
> 
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
> ---
> coretemp currently treats a failed package or per-core sensor creation as
> permanent for the lifetime of the hwmon device. This change retries missing
> sensors as eligible CPUs come online while keeping the CPU mask available for
> MSR targeting and hotplug handling.
> 
> Tested on an Intel Core i7-10510U running 7.2.5-1-cachyos. Test-only fault
> injection reproduced missing package and Core 0 interfaces with the current

Is that a theoretic or a real problem ? "Test-only fault injection" very
much suggests that it is a theoretic problem. Have you observed it on
a real system (without artificial fault injection) ?

Thanks,
Guenter

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597071;
	b=ifPLJf/Ly0nsRajid5QKXYckiFJMq/HP7/cQ743zHkWGDFqCOHcYEWOMJSkRJM674m1x
	 xLo9zw+09VuKiMLBWF4HOzvB4T1lwBt/f1gkByAglsyXCL7yXVTcOn0G+zrWzZl619LUT
	 +z4MyfpLjN8lPCoIosrgdcvdjTrmmY2ipnofJ6eDzz8j9o7tsIUzXdLk42ZRM/jPqLe/8
	 fyusQcKJ6Axbb8KFQpMtvGeubRfb6C45PTHdIrFsa8jt6LpwziiqJWtYQ+Vpq0CtXNZWD
	 FAYz/92ScbjKmPUfKIHqaWUhrc0rYwcQTqVCLPwUWA0q4yqEI0UChWxdt8JEdcifoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
	b=bdbxPV3VnAe//Z8icugxrlOHTf5GOyAlc9j/CawS1UIRZ4qT/IBcC1Y8ybRjdIDHGoQe
	 D6P8WdGAMP8dsLYQmEiYIK/lU4t28ULrxbwW1jykMK6d15RaxIYfPnje3rEmUIOzxBGld
	 2BR7QOilbBUz2cuDSGwpLlZQxg6gh4d2UVnw7d0GGTF4H6puquQAYELSPAhNgO+QOnMHW
	 EuvhuppIyHyysI5dCEu8Djrm5MidsjHV1J4V0KE3QslQXMNSaane7J4Ww9YXoB5+pJGA9
	 BlO0Ffxm8IN4839eah793Wkv1atDOyg6LwuWfEJ3wl8N+Tu/AtfoIx7+f1ierrkwfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U8WOfcfn;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E678E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U8WOfcfn
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eabf243d05so338395e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597070; x=1793201870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=U8WOfcfnMnpm6svYe5iJa9/W46YR4FzI8Nlj+7unkM7m0rftH2FoogDPMK26ILs3tw
         ms9az8/IEBxBnq5+p+y8QpOkfxpbjyjMZpObKISMc1AlVpCtroY8L7HpWqaN9LJp7Av/
         ikv7zKxySdsv74p2R/3OFIolqJNaymhzG9OFqPY65WDonlV5Pgagk71+wfZENoBDReGO
         0Wi0rN+Y+MtHE2ZtMEgL2lJ1kLk0G8GP+JFXuGcKj/x824ojcSSn035B408ME33gWqMJ
         ZSHXqIvQVikv3S5cRgsmonWb7b9tVLhoIH2cIzqoy0U/9rhbqQ6VhgYDS/9NOK7jFZHM
         qLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597070; x=1793201870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=DkM5/HVkRs1YDA2dtNJQUQYmt6aD25ScPaSLFpDzha1eOCTQtNT/DE0UJz1ie2K2wy
         Td2CH3UGx+1rW4uZ5KQnX+n24cnTMURZkkZUIpk91WHTNOv2yexvbUoXHhAOQQfW8rRf
         xzSRlvCzoxLo4DR7I3uu5Vi33AZuqaKzbt5mxOPrRIV1vKu3I9xDMm4KKMke9xF0a0oe
         +w6XLE+/XNIGchBBst7p6G+ahO+DARXKkE52OgCXjosBS6f/xT8OAi399RtnA403sJNO
         oWc/ICJJq33yXB7aI358LNmWbWajUv1WRAP14p2hT+2MEVqiMVDYQ0n+JzfSiUTWa8e5
         pS1w==
X-Forwarded-Encrypted: i=1; AKwUvByWSq3oV96JaQ7Y4DIVYnhfN73xmm1hCxofZuR7PinvS2qwOCrcfINdTQvXT3hor29YriObwVggK6JNpZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwTzhemBcIIC+x9WFVVogAA+aToS9AGYzvSqPi7LhyqA8uYBTw
	ilOVwlaVG3hyV52Mqkk1By81EYl234EX/DdS81XXLPtv9CWjqHBdvKWu
X-Gm-Gg: AYBFou29GyxA2lIEYlyEHzRbyWmkT6H1S5th3oQEpG2G/VnhEHE56BlG0UK3G4r89m5
	nVnE52jNOrXEk/KyJX3gRerR8EQCf99wNNWOzdrwxaFLpAd0KuIHq3NPqzTVu16SvV1cufsIe22
	Yy3Em6y5I4V8XgFQDZO7eUN3YmkHAvbHPa/Xh1lyo7FNLij2KPkdqavGWLgB5lmKJozPPgYWRnT
	BuFky6sJg6bj2N+6QfE66rvrYLNMfSDg0Q9326lkt93ymJxfE3hqtEKIJ0Uijex3Me2lnmKbMWm
	h+vSS7jc7e/vChQSX4qXoKcaduu5ZPFVMXMP9g7CfNJ5BbWt+57lSVOgiMlvJP/aCqQUnUZEivf
	mp22NxHpgkDEXDaaXwrZQKO6NhtId2aTV0IoT4oJhezhchX4GvVTeCH1CT3aP+AwNDn1uq7zIdP
	wU9mG4DZ2G0HGN9BSyVPAM457dMUGpCnyXUOCqKMz64XWFzdJg6TBzLo5sykyeMh+GICAiFxUqc
	HMnKQ/W6W78Yjm0DryrPcHlNnLXngMZK6nrX52BFyXJIzbf8WBz9rWnXVoDCyFImd5hKqWA5VVt
	397a9YrjJsqKjp6OSEw/5x4wYbt35T2YEqgNQ+eC7JJoP7hE3wa5f9ieUyV1iFI=
X-Received: by 2002:a05:6122:3122:b0:5ea:db3c:4a3f with SMTP id 71dfb90a1353d-5eaebc14cdemr1063889e0c.2.1792597069786;
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97f0a94sm3505688e0c.11.2026.10.21.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 12:37:32 -0300
Message-ID: <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjB-BnXclL3FcUm@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local>
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

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Ah, dw8250_idle_*() are already BUSY-functionality aware. So, what we need
> is to provide dw8250_idlej_*() callbacks via struct dw8250_port_data and
> make current 8250_dw::dw8250_set_divisor() to be part of dwlib.
>
> Patch 1 (dwlib): Add callback definitions for dw8250_idle_*() to struct dw8250_port_data
> Patch 2 (dw): Assign new callbacks and use them in dw8250_set_divisor()
> Patch 3 (lpss): Introduce stubs and assign new callbacks to them
> Patch 4 (dwlib): Use dw8250_idle_*() in dw8250_set_divisor()
> Patch 5 (dw): Kill now duplicate code pieces
>
> Would it work?

Yes, I think the approach works. Two details from checking the call
paths.

dw8250_setup_port() is skipped for Octeon (skip_autocfg), so 8250_dw
would still have to install the setter from probe.

For LPSS, I wonder if the idle callbacks could simply be optional.
8250_dw would provide them and LPSS could leave them NULL, avoiding
stubs and a separate LPSS patch. The common setter in dwlib would use
them when present.

I'd still prefer to keep patch 1 as the small fix with the stable tag
and do the refactoring as a separate follow-up series. Would that work
for you?

I don't have LPSS hardware, but I can build-test the LPSS side.

Thanks,
Vinicius

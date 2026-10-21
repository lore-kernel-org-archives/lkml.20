Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602257;
	b=xWdE5q0aoot0hQMYaozXeLWGdThgAwX7huGISm0T4cVpOAXzGygua9P6rfPSSqX8VfRU
	 rgPC35Q1kYVreFOE0AMYpJtb7rHPFOI7BN0NMs97gcRKPFW1Xv4ZG4ICYHAdaxar/z9q9
	 sutRSAMVqEA2lYbE0CujwQHUXVKQmeaA9uq7qiyBe2CdMJlhYXx2QhmJLKOgbTWqoZX4S
	 n108pSGcrvHrMVT6seLs46iWWJfh40+h8XWZpFsdEtLVAy8vJp8Zw3nRZ9lW6zVWAy6QM
	 FTac/rPLG3/LQ8AL0/nPi0Brrj/sFBxgMtuZm6MDk7Qvswt5bRWhu+1/nPGMYnDu17w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
	b=AQ3w7H11EcxgHiPctnsjQtP2sveGncEjAKwgFlYNSUCViuZzOJAZRTNA8ZaegGCr+bpc
	 oKr0y9ZErJwhRVpC9rgTV55QasRm62PkOek8RBWkSsf+CIPAn8kUTSnH+VZ1roNLEBAHE
	 SMOhkYeRAS5UIbG7ySlgRQK1fdoqvhG96PbFdQ20FYIZdpXh529M778qFUpETKW0cLHJL
	 ICJg/DYjHyzUKSBnTSxhAq049+oo1WyGlpkfgvV6hTGdg2XaLeBzxJivKtRLtUtAjkaW9
	 4XJr1DuQg6+xXkS9gzC0Bn5K0xZAOm2N9ymebwt6wYjQL+KoDc7ndwaPsNwFsLUZsZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhTlCR7v;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554C2606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XhTlCR7v
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so352606137.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792602256; x=1793207056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=XhTlCR7vSdYc6xYIXY+4YWo5PctxS/eg+nF0tTI68R0wVdyxDVGBrzKBf/vP34pSvJ
         XAznc7rukb2wtB1NqGIS5vQeaCB9MBnXyvKRfs83ldM1IPeXlB79qnKE6vXs3lHq95u+
         ogvPuri41Rl7agULw8/F7KE8DKjinlMy2SkfjdDfTwRNcxWRaoptKoTfhw692uooupYf
         HyD6hwViiseOQyCZWc8633SnsTVBIYggx/vZpkyCnhr6pmhXkmCNT85aqgpnLHEz6cRZ
         Q8nKtiMcg7X/Eu9Xtswr36jVhpGiPY3wkZz7dmRtvVd/clbcMzf2UcmXk+ZgzlfO2ekM
         ucAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602256; x=1793207056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jz1PsVKfLByVoOLZveZuQnHIhjOghHzTozlXRwWyQFY=;
        b=WSqfr/rdC/ssPfoB5z7lZeH12L2kR/8ZkfFu52lhmX7IBZZzaacpfg6UdZ4pBU5iOG
         HQfSg2HHOAHT3buqDYXhmiB4Kl3k2c/J00R87CXgJiBlV+vzAP3VP6/x8xb/Y9QGsnmN
         6lexOyger27oAfa+TaGOHftUWFo2Wbky363c0YcwAarxRUYblI9ndcEjEbw/Ife0I8ar
         7gztvhZogZO6dkcje0SOYn0bkI5bDHjcblnUMMfEf6SheNdGtFhX765RV7LxAl8XcJPR
         NKviulhFQIeYP0IVXEuh7JQkyizYtL1m7XPh+Mia5MRx4jg2RG/FzRZSHnN0bkKJB1Kp
         AOzw==
X-Forwarded-Encrypted: i=1; AKwUvBxnN2FoB/LlkLzJ5ZQwRe8fk91GXR3jP1lEEcrm9NVOVQUDPUNym4CD3D9SMmOcRlVXGHZ7ivO56Qa3vuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwuxu3BVuM35vNUsepHnpehtbupWElCzMizQZUtupYnH0D73z2
	LSho9OUCA/2W8iR7avH1PPnRtyRQ/iUd1jRitvEIYCaCgPFMUr4mfSwM
X-Gm-Gg: AYBFou0KarnU5D2WDHSoNnM0FgFT1FW+KX7ufhapTNyJPw95wrdpBWtEMcSvFwIAmJH
	vGpo/rwTqMIK9PTYX/+rGoeQUYkf0whoZTO0i7+KwfJtIVXsTOdD6nJUPw9XqVgoLexvK5OWB7E
	gHNFh6LMfKgHVlo3vTUeVs/CQ2rRK7azFM60g9D+2KtpwOu8r/jeV6oGNeAXKG/vONxtiQ1hHzS
	bJGOTBayPAaiic0XnrxjElQLyeCNguEjbZkGBlCJftsxhEapwUiarlGyhTrkNEknfpu0HVVeko4
	Bqy4WwIniKDr0B0kPIFq1SFcZK77eOrwumI/9OuRaY5mWr2Z7mKtZOi5OU1SBeWh2lWlJBkvp5L
	0J6etM2609fiiSNG/DNUkQXSBW3PSPQY/nf5WlibBVP4/ZqB+9ty/BaE9o7F2scmcYp4ys4i2Kk
	X6J5c3oh564W8tbPnpuqCBEOuL0fKSTYD4cYrqHpHII2x4kzqfnXiJk1wALYb6JuS+vc8AJKilu
	oSSn2Htmfi1p+tosljGt0x/+OrchaRatjEOh3sALJ/r6s9vOkOezHBM9bXT0vt7mv7oZQvTODvp
	hNHSNi0OyYCP48h5M2D9+MNeickS1xT8e5r3sp4HX4sSdfFaxhZYDI7YDVT6Ng8=
X-Received: by 2002:a05:6102:149e:b0:7cc:9d46:f091 with SMTP id ada2fe7eead31-7cc9d470bbamr602076137.24.1792602256305;
        Wed, 21 Oct 2026 10:04:16 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc924348c4sm3367159137.11.2026.10.21.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:04:15 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 14:04:03 -0300
Message-ID: <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjqZPuAbHDdaexv@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local>
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

> No, just pass that as a 'bool autoconf' to it, and assign those callbacks
> there, while calling dw8250_setup_port() unconditionally from _probe().

I think the autoconf approach works for Octeon as long as everything
dw8250_setup_port() probes today stays under it, including the RS485
detection and UART_CAP_NOTEMT, not just DLF/CPR. With autoconf=false it
would only install the common divisor setter.

> I think it would be less flexible, also it will add an additional branch
> (actually two) each time the set_divisor is called (not that it's critical
> but just wanted to mentioned that).

The idle callbacks have to come from the drivers, since the
dw8250_idle_*() functions are static in 8250_dw.c. Stubs for LPSS are
fine with me.

> I dunno, I prefer just a longer solution, but I don't know how big this issue
> is that we need to backport in that way (and not taking the whole series as a
> fix).

On the severity: the IER restore comes from a7b9ce39fbe4. On the A733 I
saw hardware IER left at 0 and the console stop taking TX/RX
interrupts. I haven't tested this on hardware with a real DLF.

Given that, how about keeping the small fix as patch 1 with the stable
tag, and putting the refactoring after it in the same series? That would
keep the fix independently backportable if needed, while mainline would
still end up with the structure you proposed.

> I have Intel Galileo board that uses 8250_lpss.

The Galileo should be useful for checking the LPSS path.

Thanks,
Vinicius

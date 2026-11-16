Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843943;
	b=1tMQD0+pjZ7Jr8WdYC6hc6va+Oc8TJDV/XaJFLTwNTjK7GPBcFk3dNS8hGCUhUEHf8oL
	 Hmozy8iRy3LYMoST52t6nPV8afPpWHk6uDV2+pw9zModSMuritwypjnlWEkcEfMMwNtvL
	 tBeOgI9iEaoN4mFqLQnUTSD2UXjw7cBX5kD6+oZjmizN5ibUd8d7zTpILr+5/BSORsGHH
	 xcrFNB+RpHaZ1Fc0G12p1oDLn/peRmnXm2H6sMnM5tDjaeYSXTmWeoYWK+9yQ0Vji98YV
	 /TzaiG4eKeitoVoRIR/5cPx+daR+oQrq6bEr87A4GIiKV3QvNo2fKZ/UOnaq/+wk2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843943;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=SiNrAqc/BZUqhBB8FQVtyueEYGeedQ5p+wR/UUS266go2NqL6SL8d7gW4YJzILvfD4FK
	 2RFDFPzxbHl+ykYJ+HfOtt7gIY/OeteaTyIuaNGU8oCApZkRjGEodv9KCfP4FU9Kf8EFY
	 fTn2Y+a5Eo+XwvPseRai08rpAJSz80KH6aNC7eRo+u8XP5QPYlcqc22Y1paVvWl9buiXZ
	 E2Q4bMIlPvkMMLDNA7cbL1MD2mA2MFAJm+XWMYsKj4l1VqnQRj3zOAFFEWorV3Zkjq4SS
	 Y5GZuFLKUV+HtRliGCEjHYInwOc8C6XhMZs6t1bfWiFBIl+2l1XyRk6BZpx/1gLAyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Iv7O1+Y7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D25606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D25606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Iv7O1+Y7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794843941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=IpxnSV3LeyhKw43OXzojC97bBiBsgfWDFXHwvur6D75GzEn5hsBPO5xgssq8GbDBaGZOSf
	lwUBkiMJAU6Zvx622pwtFvT10P814IKst92PANBQAPnPHiqm5rCTORzbh1Ky21I0fk53Wx
	IPtSQ2g/gRjsbtF3kRG18U6MwWoh74Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-rAE2Du_fNiCW81Xz_e6Jeg-1; Mon, 16 Nov 2026 10:45:40 -0500
X-MC-Unique: rAE2Du_fNiCW81Xz_e6Jeg-1
X-Mimecast-MFC-AGG-ID: rAE2Du_fNiCW81Xz_e6Jeg_1794843940
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so658122885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794843940; x=1795448740; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=Iv7O1+Y7KYAcR5tb7LvKd8uweN1+OmNT4EtvYrGqCF7myjSeOSZHr3EIByhGh42SLI
         NjlovhxGr1bQfuD/s/cWySASYBi4t34fMgQXceoVL/yMg0celGlgbSFghPs5Mjo8v1WK
         1nsbH0CzXKI6eg8euY+sOsKRVyWUiRFXDLMB7sIlF9FFVVCFX662VG/QfFcN1Ps+0U6M
         fdgLqnFf3bD+P/IJjVHZMqZLGOXAs5Dpov2U9SOP7lcKyQnOVE2j0ltkmbpkOhFEaMYH
         FOj3edf6kRXFCtlqF5zYaT0cMEop8GOmwlSmxoxoZFyjRoOyjq0OFG7J126YynJhwHd7
         FS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843940; x=1795448740;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=ktx/mWTqJnfllikboVlbgW7hPndlWDECIHJ81+NyyqfxHInIV7STlLSAdJ28qMOk26
         OZzMgKD4aa9B94OFYjYRz5QGPweyV4ngRHrxr1WGtiI2xAY91Ycv4QVA366Yj7dboggO
         5kP6LbfZXNtVVTeoKOyqPnSd8IYPQe4PjwCLmwAIP1WPzCT8yxb7dP8AfRARiZXVYbLx
         SBZohWuL0uFlICoxS3XOqKfBpRYkL9Zig/DNX3mMz0RW4wXeb3u3VjAsWslu+VifeKW/
         0kYc0UtxOvuzz8eXoK1SgbEiPFNDhAizmqTaWG/B8A96Oh1qzcQTdItukmpitIPpuD9g
         IVgg==
X-Forwarded-Encrypted: i=1; AL+hErEIMmlfPo1oaNSDjMo90XM1GcrhY0sjs/AIBYM8BOnxdmsN32zYYzCULWJ2rZQk2Tq9796Jp3LkBV02uSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fsyty9N4h4la5YU3d47ByL6Fnf+pkCDemwLsc2z8rDHcVzI3J
	Cd7hVXaUj/SCM8H7ha+gaTWoKORAuiDItKO7YCNqTX61mfZLjmK1gBR2q6APkJEZL21eA7+jk3r
	cFe85cbXRGoq+FjuBCc3XQoo8AYsvWYVxZPgc2wyCD/cGzKQdRb+NyFh5MBtzvvm1aQ==
X-Gm-Gg: AYBFou3jyRDqg70mwx5J8UTde/k7iqgEl+HE8056gM5wzykErDJCdgorGLKjdpxONDd
	l+hkcKy9y3pWSr4tyUgwKMOGpy3GJ+asEj03PIoq9SnF3H6CBHn4FnnlNTTvqZFpgunuOzv1K2e
	Gtq3HzdDVpGCCSK5IAeggIy0tianQ6gniMkasmThT+bZseFB78YvUbTayU7/9z7i28hU8jHFDl/
	q2q9SGWeUgbzPYHAKevhEP0/3d0dNPysUDjtxYvE34SL5FglTs/RBAwMTpKJEuHZXrXQ0VpH/Em
	Nt91mtODqgVpmRCnarRzNBcuAf605s0UG+7R3agU5+RTUWDiqRVGLNb1xNyvWF0yn3PnaonFhsr
	nUmGp+dzLqMarI/+4RDQaylxdS9oAjWzdBb7WrsH/9dQHqzdJq3aPFeftA6bVy/9cRVdJmMOQo7
	HMhWQ1pPP/9PGQeKfB780AK0r8pRSBDr4OX1cSv5vu
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849362885a.17.1794843939918;
        Mon, 16 Nov 2026 07:45:39 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849341285a.17.1794843938440;
        Mon, 16 Nov 2026 07:45:38 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm877596085a.32.2026.11.16.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:37 -0800 (PST)
Date: Mon, 16 Nov 2026 10:45:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: zl020895 <zl020895@163.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
 <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
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
In-Reply-To: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Long (and Arnd/Krzysztof),

On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
> >So how about this:
> >
> >- Have Long post a new version that splits out the creation of the new
> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
> >  provide an ACK on this?
> >
> >- I create an immutable branch that contains that the two dt-binding
> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
> 
> Just checking in -- there hasn't been further feedback from
> Arnd/Krzysztof on the plan yet.
> 
> Should I go ahead and prepare that split for v12, or hold
> off until Arnd/Krzysztof chime in?

I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
see if they respond, and if they don't respond within that timeframe,
then go ahead about post a v12 with the ARCH_AMBARELLA split out into
it's own patch. I think that's a good change to make anyways.

Brian


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782034;
	b=WriPUe2Uq+02TaukiW5DrqJvFQDitsRN3qXHzXuTtZPxqlknGuwpfrBd7j2yxlzb3Rbh
	 0Vt/Y8ZbC9zRNfm/KEFNSiKLkibQcTEqVIWwGR+gQtohmOt6pAQ7A9Y/VyLJqYB5Z4edC
	 eiyeLBDfJRU7avP1d8xCdRBGM3A7xgPcHK9nsKjxxYcS7hNKs+TcgOrBaO7XxQRt5StZy
	 n3lnJ+xbJtT3UQA5ezoG6SjfgQClhhxY8xuonMIt0UeO1+4WDLBFgkuo2UgD2HeBwL7Dr
	 L/SyQmbFr+YkExQMNdqL08X+9A0Wz3DaC50czt2njIQR2vXS1IaQZ6h+4gD51GzJupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782034;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
	b=ImWHQCVP8eQirNDMZIqrpuHLQVApXEy5xoPTDwxSnIc5rIsuLrHQth9x91y+1hS2s6FR
	 8HGpGezGIL0MT5b/NdJ6wNgC3mSdlbCDQzFAtf6LT5LklM//aJg0ov4+cn9pGX1fR/UXf
	 yyGP3SV90WZHEr5N+FjlZSXejiGLb8/UG0aG6fdboTrBlPfIDPa7+J11KJ43yzfX+uRUw
	 0W3OYIJ79/seenxVTpP02JV1mnFIDU6j8GbNO31Su+arX59ANXxGIkYFYYD/vmxjySTvo
	 kv3Qr+txnB8B4JyaqZV4xgPaIAk2O8qbIg3rrJ9nCowEXiSk25/Nde8p1M7/fyWAhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A0606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8253bc5a613so320534a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782032; x=1794386832;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
        b=T/Cys6b4MjHyhSl05U088YkGzW5dY96ESo7T1pZyUYtVxE8hGzp1AQvQKIH+jHGC8u
         qVC3j7fkJzmz6ZposDRfmnel7xDwKa58DD6z0CgHs1afoFtwrlXmWwXc5viihw43l+wW
         aWeuqo5YL5ZaQuP3tzHH9hWcqYlJqE8O82VzcAFVadDxnYXHYAqVixlxHqiyDxSc0DAq
         jsaRoAEsO0IblIxNJC1keX5L7qNhYUVkcoGSKSSZjo8cc2+Aanp3fr8NoGginTcRVVwa
         b46OE9q+tebkGubgdFRiy6eu14zD4sOaIAyZspYho83NO9aSkxCqRdcM/LeIaW5JV9+S
         aAyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxicyIT1aQmshKEMzWHeukabHyzZuXBW8Amz4NRVWYpLFHHUvj0rjGCRc6JNywIi/4emfy7ozIjuWwithc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NPbbX9zya5ciyiOVIOyT5gCRJLxZ95whXdOagSmCXA0Hkd0UH
	UIiRBTd/HXCM4//ZGs+b4s6kTWhq0WT7jQ5Hqf1sqcENRxnU4GY1IICi6GvbOTTR/nM=
X-Gm-Gg: AYBFou1ixlt2gzOwt3wbgPpaSeuqFftTbQ3IZgTceR5c5CRXoLEFr7HS30Ppt0ybNR2
	sADOUAFDYW8uiXenx+xYcfMZRRt+f8t2EMzZTxbbNhc1XcTLi3aKX7rmG1mpu9DTihH0fAhfVrY
	RTmLXIXAnIRhIC+NJhrUeXg3RdnLn1kDV2jMpgbVhTzgEOwwzPeKMaCoTYeDcY8xjr1fCvLbVqq
	6CjQ7CJC5LqLgMo0d0KGqZJZW0Yc+//I0ZS3HrdGL5qPbhq0u+G9+jTLCFnlEX1PKaA2luJ6QeN
	GTztqALnSD1xgdeDfmkf8tbmxaW2LYiVBrMevuW4V1SzfauQfb3YWjkt2twGqMh/li3QhDkJyuk
	J07kJ0uvNvLTyrzXwZLMYLwtIFAnbI/ar7Z7Syld1ty0C4ggHcejHw8IHVn1NKm1ObLn1mEshh/
	m5l6vVKtZf72Hp+CKc7GZVpOkpUbJk/Io9d9ujDgqrv+nOXdRTzOBtgeaBnxFa5Nql0BSmhQDrr
	ep+/qbrEv2MHaegXUuSYuxkacoP/DRUm82lwa0Ua07tajXNuHb0CyK68lz3pZTOw+oxptYUC4m6
	c42xhrSTr7m6tS8Bj6OhEPhC4HX+yFBkVYr+3eUC+UAOGyOoyvRGoEovqEzlvneQYZlFIp48rhQ
	Vek67/wWX2T4dECM5yK+uDad64nKFKrE7OIqIYVoy
X-Received: by 2002:a05:6808:4fce:b0:4d6:9222:99f7 with SMTP id 5614622812f47-5640dde6011mr11564153b6e.55.1793782032466;
        Wed, 04 Nov 2026 00:47:12 -0800 (PST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdebe2sm1156758b6e.16.2026.11.04.00.47.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:47:11 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843b6f8e2c7so580933a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:47:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzT30PlF1FP1SyXVa+0po5E0/89/YhrD1rcWF+8o5zsBNhyMPos5hQtFNQjfgH+EXX9DHA9tT5K/huoC2k=@vger.kernel.org
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id
 5a478bee46e88-36a7b3c4f8dmr7297124eec.24.1793781644445; Wed, 04 Nov 2026
 00:40:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
In-Reply-To: <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:40:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
X-Gm-Features: AclHuK9Odzf_wS7Gr7Do7DU0hVIY-1521pU5hfzHYwAlyguOls_NqIQeDv60H-0
Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> This is only used during the probe sequence, you can simply pass it as
> function parameters, this avoids using up memory to store that :)

Thanks, v2 will pass the device to the delay helpers and drop the
member.

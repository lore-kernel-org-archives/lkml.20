Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849810;
	b=J6UmkIjanBFwLYcodBgzNQvUIC7JNN+BHGVymigvV3xtazUvoDrieWv+lvSsyLTfyXIF
	 +pg+XN0FQdimlx69Y6UJcm2QlB7YVW0qvT3ZDdmZ/4HL8Qz4raOG8Vh1vwFvBZCP0cfLm
	 6tAv6Gsz8vKCRHZAyFeCnEAlAdjrVsIyQlVfy/02K8cEkXZdVJLZ2PLTFWodjLvUMLrXa
	 leFsn0DRFhNHShm2BA+7APmk5Qo22K+fA2BWdl0j/8jeue5ckX7WSZnkWdttHDylnArO/
	 G4BADGkUTqZ9g8Jj+NFFm7hmaWv0winX/iJealJ/QgaDIk2lsTCHE/i3j2fAImqVJog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
	b=Q6/s2ZhlTAqt79m+DxwKSj2iqsn3YrdffweqUwfnkkVNrfc4Yhplr0jfJLq1M5HHZtpL
	 W9NIH5jQyw6XLwgeEIb3y4wai+bPN/YAtNDBSx9lz5xZ3yiLHJ5FPiiVABc0+kRUMGUFh
	 S9m/s2Zc+uHG3m8I7S8EqWR+v7KKYhc7Qzm1lPWTntQ1I+Dp5muTv6BK4z9kk/ePSLVWX
	 gM04ssiPPdv2WeVlNX98eS6Uy602LVo+/J51616IaYopzsSljasLzk05Z4b5gJCH7fb+i
	 c87/ETUP+MSr0dteGixCQ6ot1fXfKvhEycMuGNAgTcJYUMIOksbzxyG7bDcw0afud2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E7606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070781f63so706259b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849809; x=1794454609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
        b=xHJZfiEsvEmV+igpQQURymPNrbUiz8fMpKEtwTppdGBl8QeRiEYPYYnCN12cVOr/06
         hotfMUSxSb1Kwypd5eRRbew1TgKLymfKJUGJSdjkdjAHOs8khc+GqO/acKPDr1NeLkdA
         FdSW0uB7tI6c5aDTqBabsXBrrZCpdlcAeL5hJe0/nJbMr+y9XYkrq13DquXGRStjUDbI
         dVdyhi+FHO7mk7SDELfsXg8x2Vwb9ShotlwO5iFmgSjnwXPZVgcpWk7JgGU0l4DWyK5t
         2BFVn4anLPSIOrYIOXDdaZT2Rj03Jf2B6g+Tik6HhEOSLCPKblZTxZI5qXH63dK/c5v4
         VfNw==
X-Forwarded-Encrypted: i=1; AKwUvBwXlwl0HpIN174aNSAXRX3FuRNPDSx64qjEqjfNcPTqp61CC96P5wR3+8UCw2cMzwrXlybeuckUCsn9NoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zpf96xXpcLMhMOrq9imvV9MAS9C4tUnUehcD7nJdVH6ib5npB
	etEr7AWrvBAbYpZw5BNgBG1wHv+8GKO4WOVS5G1H71nXvJ7XZP1prormI7udkcPh
X-Gm-Gg: AYBFou1V7Gk4T2ku4oO0kuZ7UYN8zMQqbb8/OvLnNmhAPp0R/rDHCpWWmvQY7zifhWz
	eUXKnfki7MWGBK1KznDTnz0h0okGIwUFdhksAdD27qj86+IWJGKqw7sIn4uO8Lf1NSletHI27XH
	tndJc5CRHz8B+MCyoNPB1xMhgLN1tTaPY6hq1Bl+q+Yx6WjQORGekCHtxuPbMk9SWDLcC/lMbLa
	T/MLomCMzyn4xU/ZNM8lE74LLQ6G23wqt8i8z/Vt/uVghF3PRht6MiJ8aYUzIR/Ht4kItMTLYLA
	lJVpUMSc9f6NsARW+FajZE8i+1czExapI+Ni8j0aePmime3S5wgTr1g+15nwHMBJxCVXfPzOpjp
	NxqeO+BBIFCuVZE48Gz077Yhl+FalpGJesJH1NlvCFZ1EX3x51dw2AhQQRWwXNvcRlAhGCANzox
	jYn+rbkzBKTSsVBIV+LBJUhiRjALlL9MlxeGSijMNpCJXsQGcvqHDn9xyd7sbCDoMa7q1ZougNA
	bl7Paerjrt9nbp++UslzmmExX+COxBj8bMAb1y0kBm8edrgAMjCMRiif+BAYe1tmi5BIKJTXdfb
	dxbSPpjiTHwyDWRtlK8C1z7cv+vN2+OMQUJJXKgYJdpE3Rrw5mrgqLaD0nPd6jHo6+OJ6LfKs4J
	hJ3WLSXQb1LgPsQ8Cm3/zxU4hOUfFrhTQH8pnoeMyKavuPUwCEIJvurVxIzxN
X-Received: by 2002:a17:90b:1c0d:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3ae8957a07fmr15747449a91.5.1793849809163;
        Wed, 04 Nov 2026 19:36:49 -0800 (PST)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com. [74.125.82.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b326add7sm1462238a91.8.2026.11.04.19.36.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:36:48 -0800 (PST)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14fc585291cso1433417c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzwq4Lswmxy2hEV3JYV6qxDnxtqXej35xGSipGW0klwfH2wIaiasbIc3OVvNc3b1gHbRjzOhfbroRnSMjE=@vger.kernel.org
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id
 a92af1059eb24-1ac5d1d058amr26264865c88.22.1793849807402; Wed, 04 Nov 2026
 19:36:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
 <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com> <20261105-dreamily-quicken-31e2b446a942@spud>
In-Reply-To: <20261105-dreamily-quicken-31e2b446a942@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 22:36:35 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
X-Gm-Features: AclHuK-3idFUv5nBVANz40sgPgySfpizpIMP20bnEM1ST-bN7ItPz_5x2_r8WXs
Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Just link me a tree somewhere with the dts, I;m sure one exists ;)

Here it is, on v7.4-rc1:

https://github.com/The1TrueJoe/linux/tree/sf19a2890-dts-v2

and the SoC dtsi with the twelve managers:

https://github.com/The1TrueJoe/linux/blob/5aca36c1b028fde1794eacda4cb6c1a5f8e9b96c/arch/mips/boot/dts/siflower/sf19a2890.dtsi

The branch has this series and the dts series, with the v2 changes from
the reviews so far; v2 is not posted yet.

> > If that should be one syscon node per block, providing the clocks and
>
> No probably not.

Thanks. Unless the dts changes that, v2 will keep one clock and reset
manager per block.

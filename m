Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823032;
	b=uPZjODRJsDjCY6RcG5BeOk9BvuaIRceCfwMdC7chQRPloRlqtjJURiGW4vVF7gJNmDL4
	 IArNFiY1qaRPKaOos583l3ND7GyCEQSuIDzX1Jh/IoSsClrw96V9ztUKOqmP9mSsUX6Mu
	 1pu5qjHZTtouPkpIQw1QDiLJgCE1BQNxlSXoIAv9kwb2pSeNUwRJSg+fErlmPeKGut68+
	 nkeOJ6GIzTir8/7nmHTWijiFZBw66hjSIysLuRjBu2ZnIGBY6mSW0UqXBN7s4N1u+BbYU
	 gAZwYDJpqrvcdHX/06ei61oIdXL51A7FPXNK8v6rfc1h/842DvXvBWdtrR4Fvgajuug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823032;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
	b=4R0OriRgfZxFaLfHamby81GW295q2Y6n9hBBwxSvfrVqp3Ck4BF3WKog+0h4m+4kgRFt
	 VLZ8ffPHgUXDO5ghanxe65XhEqoN8DsUb1m/JfvuNit5gTcrzNU1Nl+rn3IhcFdNt0caJ
	 JfSTtAzWbjhnw7ZzEeogWRORZlYztMEIdPkVtu4kOxP7y22ufwEUMiTAY6TF4TsGtV1kb
	 qbq1ZinsRNql4X0GogrI3imriuS7NIgN/YaQnXO7MA+wQBowPA8kWocl4BbpdEy+x5leC
	 46P6P/9QgIkjF/0k0gxnaPc5WhlOjMwwrc+VfHvyoLeE2KXA5u9FUnMH/57OYcx9dlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D46070F39
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 840D46070F39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso576495a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823031; x=1794427831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
        b=fk/O4iMyF4XQ+fvRPNSRPkrlcwNZ+7lyDZKOKPBKuwPE556ex5bXekRHyTYt2VQEq8
         18AW17PY7S+xKIET4Oq+q656FSEnt5+BQY6p0df2kTYvvX5Ru7Kv1YkhjbmVwzo76LSX
         VahSLD49Ca0pfJBBuPlI3vGzpV7cYREb9e3b1FXzm5oLtxjKQGfi5z7WsRIyAsLEMDWU
         xOuB14YPiqKnYf4cctyJ1S5/1HgEn3/5aWHzgEvcnHZfa6hZxKvl+j9yrhfQeKJKK/6A
         ttMidMIDVFHRyAD/DiEXsmD7UDpj19wDdLHRcJNpTUrux+KwWa33vbNlhp+TLTib9p3n
         5tJA==
X-Forwarded-Encrypted: i=1; AKwUvBxT9QGdkFKmHoBXKzeVbbNCYsXyX5qLzg8N0QH834f6IiJJ07TsKzu8n3MCWNE4MwkvNq45lEr9ACSTQW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iWiz3YzUDqRxbNltZ2QqIZoRa80ij4QPASU4LKSyOdrRFAz3U
	tEYipv4jtkoN9AkxXqvhyjJC4Aoc3Bq+3C2CeaRXTrqK+hvV819JGZLSEZt88gdH
X-Gm-Gg: AYBFou1udP9TOCwfYhenRrOAn/oG/gxBS/51DWsH0pld8OgweCSc099K7aaEmgtKnyi
	Dv7/YPgyitI3RZ9teTAxsUQT18q7N/SPHdScj/ZQRjzQuYKpJk/l/jIHqkLzLwkBwZtfRb8EGq3
	LCjUH71jd+eRK8+xP6TseTviMTiH/4vxHbvSPKoUBk4ZpIfFDvUGnVGWg3Ns/tStGZ8VCqlYEKk
	HawEsDsfkmm7pRmXbOZ5KIOoESpkHeAANyfMzPaob06eGzSlnx2VqN5qbRBG563Z8Te7rqWhvx/
	TJRMXueWisDs9F63JGfa4n1kVu7WTsPKTj0kqBXSIJCF1iY0PjIyRA9Jlt8W1o/R6j0RXWIbKk3
	ZyEF/NIUk9nhUspaHeJvOJjgAfjkxpBa6wlwh8I7O91/b4MOd1AY6Ho7g+OytP1jj5FQUcMx459
	vZpHm26WAfT4+ubAbwtWdlbDY4SVJoJ8hxgR+mWKxapazHyjh9C6Qy2FQKpRin9jhdRCnr7qgs1
	gotnnLQbA8d0ahXIvDyaWBc0/Q5h8HbH1bdlgmeKfFF+dusF/maWNTlvRCA77aebDktnGHJ5Grt
	lEx7UD9Y/usKH76RsgXiBjvrIB5FmcE/slc7FRtSa1zScl+4m7BBezfpZKD1kgDxqkOQkmph3hF
	r/NJmNnG1KmdZdQtC2v6G/41EigdPcRseOVfhRuJW8RA=
X-Received: by 2002:a17:90b:588d:b0:3ab:9c73:147 with SMTP id 98e67ed59e1d1-3ae8970ef58mr14269653a91.14.1793823030845;
        Wed, 04 Nov 2026 12:10:30 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b2b57sm429330a91.15.2026.11.04.12.10.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:30 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2504350eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwkxkxycHVAfTCNF+mdRlpvyyPloG7aq4hNr7zxVjnG6s0J8LJS3zUEYFwKgKXqW3M7HRPlw3+JcHVezgc=@vger.kernel.org
X-Received: by 2002:a05:693c:88ce:20b0:36a:1f8:a5a4 with SMTP id
 5a478bee46e88-36a4241f808mr25514235eec.38.1793823029345; Wed, 04 Nov 2026
 12:10:29 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
 <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
In-Reply-To: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:10:18 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
X-Gm-Features: AclHuK9y6rKZ3LjTVpypr_d_uuxBPp6tSISF5kZ9UZgLTLqFDDhVhOAbPmN46Wo
Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These are reset lines from the same IP block for different clock domains.
> They have to be asserted together even though there are two lines.
> [...]
> The gmac lines are for two sides of the same async axi bridge.
> Asserting them separately causes a bus lockup.

Thanks. v2 will explain it in the commit
message and keep one reset per group.

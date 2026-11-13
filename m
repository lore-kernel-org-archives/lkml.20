Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530254;
	b=pS+2fseszFQ1V5nGRxUUI2fXZ7zsHA9ufcTV/Mabo3KNiBwM3jz/+2BcZPMEM7uRsW69
	 Se8kzC6C2cB+FAxETgepRFzwBvVtiYpuJZWo+Y/nzNlcIJ2+f7h/yhABSBtArhGjQPvDb
	 cQwycaW1SSMnNu517jyPdeC3K8aFPEIPjwGKbw/kMQ/Uyu2HWGbMH0JqmNYCcGal++Qyq
	 TBVW8/oNBy+EE1XID/2gOLphPM6B/1SuVe43xU6EDg4i8X+CqifHTJomGHtLG0tjd1RGR
	 Y7DT3OoZRFec9ieGNrvzYuqCFyI84aKoSXlIuaRZqOE1F3ucDYcjlsq4sCmnDY6nZAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
	b=k9LBrRhklfygb7ng8wC2b30r90K9N2Y7wtpf97V0U5E8FQB++xCDlp/glooIv9OK5tMd
	 gAjdKOnXnx0U7CcgTjutRtoZ4bOo3VhtDjbTRez2aR89tyHHQfuKEp8WJLKIUHpK9vDxd
	 l4e3J6QhvOUP7Bdd2Oqzp634TlVEbi2mDSUzex9cs0CTvvW+EK3KgNgSgDVbHWGvwCujQ
	 CDRO81XbnWslkqmRrUGfUWjnw2wQQczUJ0ljcYRRuBYhX3fSt5cdCB5W52waeAuLBQ4az
	 ctkU3Vlm3B1BaZKhxzgU+QTOa2Kes5CzolWiIpwb0rT7FTetJrCEZYwJDJ2pad3B/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY0yCinW;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9471B606B56F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9471B606B56F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY0yCinW
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so5594995e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530253; x=1795135053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=eY0yCinWUTqTSYrncmqmmCjvm4o1MIXWWt89QbqMMmPRCBbup9AC6IhsdAq/6ImTEU
         sG/ge1Cs1Fa4qGAFpq5LQ6UK36xbjkXq3bpJ+HTWj41H23XsCr1F6cZJROxJa/2Qr8r/
         MhYsJgTOKEv9zozWFQxvKTXas/h0tKzZDl9vWkl3JAb//05XypuDsFNJMgkBBW1BjnV6
         ZSRzva1/tUttfwrqzbfIsx3Ctd2wbR2TdkDM/3iXWtScISLR7z8CAKDR4O1jb05JSkMD
         Db7gNt6on2Sw+W/9stkMZFokC0cGRkGJAIMD04RBB/6MCbbwU2a6VNut1rXxv4gL09D+
         q9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530253; x=1795135053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiEUMAMTxco0TlFyeXtyTWroWf67a7kle4Uiif5GCnk=;
        b=D9rJpf3h9qesHs5+kHrADemeRLeOPIEUQIOYmAr7qvITaf8rcvl44DCq0HsYfloYzC
         LlCNM0tL5Narjrv3VVD6XgvjBr7lQx24g/r7hDzbE9pAn6HWanGdIb3LGTuUqnisQMmF
         M0znySJvZ4swp6ZPsCGyk7tWEtxwMcn9+wse9Rv5Rlmc8+7o/XZ+R5MYx2f2+SsyAUzj
         +l3mpvqK7+4CBqIJZUL79DV0ocJgmtmjkhqH2H8BIO47cPeO7uWmA9xgWHMbiHKZBuw2
         vzU8X98NOuFUnl/SJ6iQqFEcvpWga88EYNBoc4XXHDdqcvf+5P33Oo537TqLPAWoJmMl
         kFGA==
X-Forwarded-Encrypted: i=1; AL+hErHG4gqalWI2QuZNhi1YKJqmoKM7pvxB/Ijld0f7GHP8OUpKLIjaDdF6aPuH9b8M1pB06KzeUc7uAxyMPjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lXQUeZgEsw5Z9z/umq7nbApKVsq3FT7U6WlB9GcAxQBsm7Ae6
	7ghXM246FIJZVgbjt3ElVPLovV8Ah1LHplzSv2k07X5nidns9Dirmo5p
X-Gm-Gg: AYBFou0IhyPVPrPIqE1v5eRVX5e4wDpTSnQ8Es8seDoYi8giBHUYWLoWULKXaakeGiD
	VAhQVlnbhsgF4RYcvUzTgNtycpO7p6+uahKiSD157wsAxKGm3a0rM04RL08vjVEa3rP8Ko9mkdv
	5RIgH6ACze9RiKWvWzReKWAX2tq0haJ3JGLDdhis87cu9WTtg88Iouy7xH+Ij5FN5YgIxPUeWfU
	Z0VMRJuzQLKohnOhQlNQgGtswEpMMKsMlkpYAA9VppCe5kaUFU92SX4fUt7GhlU0wOJwqOCVjf2
	7+h28yhU1qX3av1B2FIkFja1Pvp/7AVZruHDkVkBmFTR3gnagK1FUdXc59XBDYoRo2jD49TYlux
	gO4EB6qO3WSIxIAuiWRUAHOG92xJHckDQvgQx7uFDWxW7Fn11CVkuHoBRzyZWpD90TsloRcZJSs
	NOJbjZQd8PqKtRKfgvrZde9d5KdqbN69Q+WrDAF2kyXhlaJWz67YyOqw+zirBV+hUA2g4ZUef48
	TTX/8k0uZELmI3JwXdzrMPlgRQ4tAmyK0UXYPHeCpqaaSxIAW7ruiVSmN0YIttHOGQt4Wurl0KY
	BXpIQ0cNBJz6zFramSn5y64S1zql3u36JQK8RPtlMMnl12Ns23bnXYO61Yml1h1WF4Jqni+N/NP
	0q2wJe3NWK/KjT+ba2OSAOjK+BKdgB+aYf7LyVcrcxZBogZbFuWbAFwj+dKlNkAPNtZQR1WJZO8
	NwSOB1ZXJGxve7vEJV
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2290702f8f.31.1794530252965;
        Thu, 12 Nov 2026 16:37:32 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm1875000f8f.41.2026.11.12.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:31 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/24] dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
Date: Fri, 13 Nov 2026 00:37:30 +0000
Message-ID: <20261113003730.3667609-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-noble-sloppy-chamois-c71dd2@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-6-ghahramani.navid@gmail.com> <20261015-noble-sloppy-chamois-c71dd2@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This belongs to the patch with bindings/schema.

OK, the next version adds the reset header in the same patch as the
schema.

> Drop, not a binding.

Will do, the _COUNT defines are gone in the next version.

Best regards,
Navid

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919658;
	b=sYGoifIHRzSLPWZ8IvVXla3KqIEuldf+q2aB8/vzno4y1iQu67X4J/bZOD0aJk9g4dN/
	 mztzsiQSu6H5thL3f0npWnLssxbJNn7XS7JhdWaN9dzhf+JO0yNV/RxztZqGfVLd8YWIp
	 Rcn/dVNq/Wh8kCZdCCSd23Rjhcdya4s2ZveOjOjeYJw693QPrKm4dDg2vZ8DWJbnbKXVe
	 6apLxD+U+qPvl94yaaYGMUgzqP4bCeRM8z/rHoe57YT+MkHrQUseOuLxaHODvq7ofhdMU
	 WVgwCqTm0EuUZMYu0XL7IvpdSaA+D5qe3Yzgo6jC/ajNQyMEiPChUv+4pzj9Uy2b4Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
	b=kJLq8ewIkLO9qRL2cOoQIz5QH52TEUM+PUApT/3s6dubQ8jkixjxJIi1QiBTA/PfN0I7
	 WAdWPJC/SF8+JIbmSOSpUT/o6Vn1ITslRLvivyK7IOl+zjePTL1uVmiLLW0PLqP5R2ZhF
	 /RpUbql16zFHQWvOb3jwx00TIK5P5kzDmgZchnDIKzdB84+DiTiE5WII+jtW7448ZGbsy
	 M3gG2Zqd00Cr9doj9r7wSoM4AIRRxzQfUB6f6om2oc/XYerOGuPMO0Vbjb8yogIfNTCs8
	 Debom8leO1HvRUia1MIoPUp4Xbe9nVcOP4RHpBhCv8isMVY5McE/jvVyMXdEvXO7QWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GR//esP/";
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A1B606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A1B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GR//esP/
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso474142a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919656; x=1795524456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=GR//esP/c4jjW7kiru6z01qnxOfaFo6rWysyC+LikP/1AVwDdpHcQqSz+pIcMSZZLL
         rGUV3uBrN/ccnmzI8R52Z4Oeg81aVtcX3vBb2DF0cDUxgjk/DXT+msphxH1pfVcr0lsQ
         yDvdqxlzl80F0AdPjBiECfnY0M0O9euYkDkZxrG9V8PqqSLIuANgdUsb4eDMZOsjqE7i
         QWVyyrPvamr6xPGKmSQQBuzXyrQJby/WFvm7nHdgO0G1Uvk2MX4MXJwdwBXXWKBv/DrA
         PJ2GLNHpXXGTG2b2JjZy0uSFrWV2Oh1i7GlvXxKrGOGIZZU4eeELgJR3VfZ/TBqqZdR4
         S3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919656; x=1795524456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=sEeEWAMgLullXtPpQl5EXzK3HQRU3ayNak2AjeTP59RzUq8DwGCaCSKqR1HEoPb3Fl
         PkJk0GHqJUxsKrfRBOGlsfxOD/C5B/LZ3U3gmbJbwupzMi8NVNqaebaiJ5Dy5y5g9wSP
         FR69DiMDxZUxqv86+r6JsbAjmvRB4cFVGuYtVtwn78VC8pKOm8rxDpSb5xKaeFnYmlGw
         RitSkLOFrQc4U1tTJKR1OZZJZu3ydMKobi4SzojwYYiY6hpBpsa7I2B9Ken7leoBn41Y
         r5vQM4XuxDPdNjLVxQ5pRoZIhrh0uDuzgvl2BW2HyWm28H3xPw7AVJ77dVqoCDOHeJ/o
         BkLg==
X-Forwarded-Encrypted: i=1; AL+hErF1iV+SY9k2oOIqUtXvls0FF09GfecBEHFFHgN/STVZ6DfgC80TP5fmsWq8yghXe+P3+uGIrIIFI1ldpiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z832NhQx1vMYJrIygtLYngNsnge60eG621Tm/IGO8HvIEPsQ1qz
	iKLICalMfcIfhsgY3YP8/arQSfxNdXjWf95axPxoSOVk8PUAsV2sb2hm
X-Gm-Gg: AYBFou2cmnWB8mt84QeKhIr8tGA8YKGKnZd7ccpvURUvR6Sn6COnoWO5/j0sI3o83kD
	g2iZe1kYQWA7rWOBawNPjUMvd0E2qJaPM7EF+eSdUn8xM6YXLcMB2ESZNy94uli7C1ul3jsjyTe
	orgOE/plqFdEhr8cgRGpJ+0XqJnihcwRFgTkbU6XrFrc55pq+d+Xh2ZA9eYeqPIgjwRHz547c9F
	Pw48W5bvPknoqDH6O6v6eeklt36Kx+Oa4jvTO/IGz5VdPVfIBbA4bfd/v8JBOH/JsZfPnLEQvnV
	5gLrsLmBVL2OOlMxsA+oegDRmZ1brm6Wr+MwW5GHLtLBxra00DsOCGfDMjXtnFaSLHoKvDvpN1u
	TCbsaoCARnXOWe8rYHs7OEeLaEbA1ogPgzFP+COdK7A4kfgIR2Q4JlVsQcM5lK3BYtB/v+iLmvH
	yiQTeZ0OLYladk7FRxporxJhwP+cBmwjtLR9+EBVhOS6xLSV0/kuUtDQKVzR9M0DFUmlvMMaUcX
	xpLMqVk1pKaG+hoIPkeYSFC6p3IM9ZbDmAQJNorZArfiqb2NMUTLF/gdLnSPIgbEBM6XyfFknoG
	AxW8jf9+T8KcBJerky234Qo/1pRQSMTLoTUHjL4X7JIueFZ1JsamlLP/Kglj21t4oIVzMvQFkxg
	cBCC39jpiZFi7NFc7
X-Received: by 2002:a05:6402:2347:b0:6b8:7d2b:4dcb with SMTP id 4fb4d7f45d1cf-6b87d2b5390mr750722a12.14.1794919656177;
        Tue, 17 Nov 2026 04:47:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b87368c70fsm430430a12.23.2026.11.17.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:47:35 -0800 (PST)
Message-ID: <6afc4ce7.4b925a68.31e7c.7768@mx.google.com>
X-Google-Original-Message-ID: <avxM5Ldccuc6TgM_@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 13:47:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for
 fwnode PCS
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <179491941687.3291.11313796890436002644@kernel.org>
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
In-Reply-To: <179491941687.3291.11313796890436002644@kernel.org>

On Tue, Nov 17, 2026 at 12:43:36PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The RCU """bug""" was found while evaluating the code. It's hardly possible
to have such bug on real world scenario since PCS and MAC are currently
tightly coupled. Nonetheless with VERY BAD PROGRAMMING it's still possible
to trigger it.

It's both a fix and a prerequisite for having standalone PCS support.

(hope I don't have to repeat this message for the next gozillion revision
of this series...)

-- 
	Ansuel

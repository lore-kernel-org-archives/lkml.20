Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26C4C9E02
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768639; cv=none; b=ewDwa9T1BW4A/7yyj9NE4sjgb0pOu/NeJI0z3i3F3TDG5hj4nW2XiUTIPbwL01YtnvUHS/6q1ti3Q+OaE8pg7vqYfUkgFfdAJ1gMVmXgUHcB/1JBPWVLgysAqEjU8Ao6VrGuqMQG4iPzadgbZJTVwh1R7QXZ6YpM1CvBETz72v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768639; c=relaxed/simple;
	bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pz9GpYLHWZ7rsDzjvRL2p9zLJxXPz0J0TZFQH1rzntePRddcPrbFCV0brdl8i1B9qdr2Sxa7ZymVuta9e3CckiEopfp4ivIn9xFVsZR0xv9txR0BSq5roR6JLm0k2L2kDvUyMCfH++ussnGhVzTz3xty4bJlfmAuMaFfMc7LC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0xr9EMI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0xr9EMI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so3301741f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768635; x=1791373435; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=;
        b=J0xr9EMIfzbHfnN4mWrWc69XfBZ+MB3Xy/I9zajTpNP3eOID7+WYIwfsDXw55tvcFd
         zrhgpXbSXTLq1nl5ZMzPd+fNlwYNQteR6FSYIT9Y3zbWci+hV6yCePiSLs1+WCqwqgbB
         xYjbuRpukQ8TNWQ7lzCRCdo5m+4DRkSzQpUd4n/iuSOxFBg4MErRBpQ80R/sc7ebUei3
         Ng7WqhHdWtS2M6GfZ2TnLv/0uphVTgM4eO/vtO9dgcWko9K8fS9giASHDevrSBVV21sL
         FVE1DVHj0dnU2DTtJFxDsgXQI3jUpie9OlBZuGRt5VAmePyd6oQOnzGQVFjlFW26Z3FV
         3QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768635; x=1791373435;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmynuyHJU8N1Sba7vOKf17LXlfDtQutbPwLTql25A8s=;
        b=Idtl0NXXsXWDI6SXPW8z9gFRzIIP3pyBbGPHOWl4e7Q3vhi3GIh78rsxEP9gk5aSFX
         m+/Urb3HjxjcYmzNK+pFTNaibeb9sxWvT3DC0cL7xwW99qCI77SehV6FvYHoNyrSc937
         /rI5uqseSluVzVMk179Ozram2e2v9SkysuPv3qC4cr/qWxSU0fJgyKHooOxAO6NoizqW
         6hioBPU3MoVjU21YtyJCqfqJvzvbb4Z0a/8y0267Gq6XZ442mhCPLmBGVmgNt6P7PG35
         rSAxeQv4phnDhCjz0QAGMASmp23H5C+wc4PKrx8pH5jDWpIzaU0CSBYajRhfa1b135bj
         TEAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1wf8/kz6qW9xt9WRsQPzZzmPml3Xa5uWiLcf5NIXqoKP1CDYyViXRxO4PPw95GU94lSYTgpkbsAkK3Qg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBYOKRRNRqmue6WRk31Gun8qU1j4sxgVz/lrTvJ22mZaAQslso
	E8M2ybIpQmFcKD65P64dJchr7CPINCVgKIZcM37vMYobohQy8lvRl12W
X-Gm-Gg: AYBFou0IY0bT8AP3MX99ZIH8F9TRC4FbhcwibUfnBWet7cIXVtOtSV/+L+MeAvXkIIW
	knhMoUXaq96nJc94rV3R6fVukPTfJiAbOyJyMnwP2RQW6fwHoHeSPnTh3yvaAa2YUXCH+8P8pM9
	gWyAAVIIRQS7t4tN5p3lkX4ftLvLWD+8CO/wWynZhYepmkfDNLdBEOEjjmjMk5f3MV1qXruzrRu
	qwrU0xWLkDwJe6KEl0jhSyhGMc0O5ND8EHmrsBpUn1x6jm8dnCS0tBBoBDYQJ8KBagWldyr7JD2
	zPxS5+pk3ZqtcOpDx96mczmd8A3Ag/6YYXiYG6JPCVws5pbR7crAy9NiJip3OmD73D05SltDEz6
	FkRv3MvhdzEWtHII09bBtRYH6MwyzFYlskIj+1pItz2G+CqgMB7RplCq6mjsuYKNs0NSyTLQ2Lu
	Rn7NsWMXddLwXQxNmwcPbkzIV3tSGRWMejSq/NYehScvjXJBzuEpfnrI2rfeUN0cdDbb8lLmuUL
	TxPGBB646eBe1rlxGHosToJnICucCtK36vdd/ojZ4I=
X-Received: by 2002:adf:e00d:0:20b0:48b:2bb:aee9 with SMTP id ffacd0b85a97d-48b02bbb14bmr1650336f8f.11.1790768635262;
        Wed, 30 Sep 2026 04:43:55 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949cf1sm3005415f8f.5.2026.09.30.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:43:54 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>
Subject:
 Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
Date: Wed, 30 Sep 2026 14:43:52 +0300
Message-ID: <179076863241.3327419.16233537387530771884@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 01:36:32PM +0200, Arnd Bergmann wrote:
> How about making this one ARCH_CORTINA_ACCESS to match the 64-bit port
> (saturn, venus) that Jason posted at
> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-5-jason.li@cortina-access.com/
>
> I think this would be consistent with how we deal with other
> acquisitions (storm->cortina, freescale->nxp, ...). I would
> leave Gemini as-is because changing the name only causes problems,
> but for the new platform I would use the current name of the company
> that last sold them.

Thanks for digging out the history, that makes sense. I will use
ARCH_CORTINA_ACCESS for v2 and keep arch/arm/mach-goldengate as the
directory name, as Linus suggested.

Should the DT side follow as well? That would mean a "cortina-access,"
vendor prefix (added by this series, as Jason's has not landed yet),
"cortina-access,cs7542" and "cortina-access,cs7542-uart" instead of
"cortina,...", and arch/arm/boot/dts/cortina-access/ for the dts. I
have no preference, I would just like to change it only once.

Thanks,
Fil


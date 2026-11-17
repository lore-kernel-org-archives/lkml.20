Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903669;
	b=3ulu/TzzPAQzMyQ/XZmlH7YSN2u9R54xN5ncpbMgrNwbz45K5WeUDPp17qYzq8L0xAen
	 rD2tc+lvuiDAp0slmE/YYKPxqRDEuTrqVyjW0VLjL4C3aULg6qbigDtYQYOyV0JxV4rkR
	 CDugZ0YD6EXhMwSTsdW2/7iB97/J0ovzUiw2zV5rqHQlJB2a+JjTVivDljUyQiwMP1ees
	 3ACJ0jUChVcrJQXfEINXHMNtwdCuUWKWRAik26qWQCm+R2crFTVLXGAthDGqSDr1cbo1E
	 wreZL1W3a9aGNiyWFiw44oKDafjkSVCDf1DLwmfCMqvvGoSiHn0RBbu1rMCbjgmDfGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903669;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kgD+tUTOk9garvkXT1JZE8IpV0ytjaEat0WUrpK1KAE=;
	b=RT7HyrzsLG09W8hb7lAhTueD3qulPxq9W/VSQd3wsSwZ3zO1OacCvkrZwIzNcCuPsBlV
	 4MYdVfZYxKtdsPZUscqtfxgIWDKRr5Q/KTlYNkj2uGs/qb+HJENDKM6diEFCdjE8K596g
	 2CKc4tEyOIdNy6BEiHKMz72ASpGpj1VrnfjKpPS1G4ykEJwWSa28wuRYydUZ5NsNEliP+
	 32rVk/QSyqUcmltL7s+szB8DDGfdTxrySIlwCCMEUSEyEAMGQXxbmFd65KxnO6LCZwb5Q
	 /e/PDwI0Vu0SMTj5MhRhD1sqQtKa9uKc55cEaTCzGaBtElh6aqHv39tSeRW4/txLziA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89d6bd67045so389557b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903668; x=1795508468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kgD+tUTOk9garvkXT1JZE8IpV0ytjaEat0WUrpK1KAE=;
        b=qwajjHRNCzKD7w+WnKvPaYbWifYDPcDp7hdy+PU+A/IgMJRA7s75LFRVBc53zvF0mn
         neWjNxmVya3JVEcW0iO0w0TunINQbrtEvOEGK6y27fK0basZk93KWQOVJzVb44TlkMAB
         3NrTkT9VK2nbFDguSKpazjPOfwFStn+9XuDzEA1X9LS9MEuqfucY11HD2qUs+rfUSMlN
         t8Hy2/fctVqPL109GBoMDN88HZqKohpBM9IjHdPPvOnKPw/yJ86N7HJWfC6OhXWkCZMw
         6euPLM6SfxGh72dCBKiznCXWBxsYeLPSWn2ia87cjDL8+z7XKHduew2wmu4GEWAuNsMA
         jpQw==
X-Forwarded-Encrypted: i=1; AL+hErE0PDx3Y5297MH4F2cKm19I86qyBMs1nlqwToIIOz7U54+V12rVkO1Umyahm3YsQoN288va2b1zpB3fVBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qbLnCKU0VuR4etjEp7kYwR2slAp9+HgrsnIJN5AlQys+Fho4p
	y6rnbPs7ddZObrar4ckJm82JWmTfBoevvl3GI1gR4KeQCcEMieFS4QWW817y3vpE
X-Gm-Gg: AYBFou3Loxbh8asFhVaCOmvm7F9GHWkogh5+Y4irQA52M1gFQwrT4eq6MTUuZxfOMCo
	N3U7kZaDMl3nJkmnBUhFB3cbkXobuxU7V8Qc8MW+D5XMMjXz6WrMGzT9TJ9cJrLc3pjroibHick
	gQO3fnT+5a4cuCiDLXEJGqrw6I9039xpqxm2wSnj0TgdqmpkJwpEHDzSSBulsd9UAHzeyMqMudN
	fjBmgGVaYw6iZHrtSHyiIq5KsnksrPx5rB8AYa9pKOkgS/xyRuHQebaYq/BJkKZoiciKWXXpSzM
	Sg4URWXKyX08gcGykCx6v4ee+HMBXh4GSWbzVyXZcJeo1bWkGrLFOU4tF+rmyUExBy6OZBicKag
	CcwAKmEaOPDZkXPq+sSe7W3neRdbri22vnYSE3Jvw1EWxzjwooMNj6PCd05NHmpsrheClJqaPfE
	LflwZi27D6daxRBqHuNNjP0zl/pzZwYzn1fxXq/zaTZ310jbQpbfHkQZh+qj2lxovF915N7tbW5
	TVJNN7vMPgj9c75TlGZABNnyEnpk2V93UGmrbuVR0EwD2Ou5wla05Pb3bxB4oLyrSvJEMNetv6e
	cDHAiCxWa2+ndd4Ha+Un1KIxRzHvXnYLe2UZPobHSDqMQlhVc90LkC7xYxT1WZ2t5LhBsgM8wGq
	m+7JUEa9UQQOeLNQALGYO242bb7FKku575O/DVOGZR15hzfgyEsZFBBNwkkUfd2cClQ==
X-Received: by 2002:a05:6a20:244f:b0:3fa:71b:173e with SMTP id adf61e73a8af0-3fd2ebbee0dmr1479808637.31.1794903668241;
        Tue, 17 Nov 2026 00:21:08 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdddc55efefsm4687658a12.6.2026.11.17.00.21.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:21:07 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380c28f9e35so701451eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:21:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6TYvw9QqogBUMDr4AAc90OlLu0Uibglee5y6jUdACQxw9wE0vQ7JkVkTxaMo9yCB5E9RT5AsP6NgAuHY=@vger.kernel.org
X-Received: by 2002:a05:7301:2ab1:b0:36a:79cd:12df with SMTP id
 5a478bee46e88-3810c843192mr1761148eec.9.1794903667144; Tue, 17 Nov 2026
 00:21:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-1-ef6b7c06d4b0@telaak.dev> <avwL_iuTyEjaj0hs@ashevche-desk.local>
In-Reply-To: <avwL_iuTyEjaj0hs@ashevche-desk.local>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 03:20:55 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ53YA3AbkFNCw=OXDSXnPM=CF1_WV+TatUjx0Rbwff0KA@mail.gmail.com>
X-Gm-Features: Aa3M54pifUmPegO6YEwH8eX-E140QvER9X4qv2NjEXyp1YoVc6uiJAyqJ3gFezQ
Message-ID: <CAPY4CJ53YA3AbkFNCw=OXDSXnPM=CF1_WV+TatUjx0Rbwff0KA@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 03:10, Andy Shevchenko wrote:
> > -Date:                October 2016
>
> This is missing in the copied case.

Right, v2 will keep it.

> > -Contact:     Peter Rosin <peda@axentia.se>
>
> This is also, but I think Contact for generic is the IIO as a whole
> (maintainer level).

Agreed, so I'll leave the IIO list as the contact.

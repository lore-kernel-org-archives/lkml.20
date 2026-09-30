Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228924E36DA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773533; cv=none; b=cIhcJlyHRbeMbdrkeXHDrljs3boRRDhxiZ0B7LWB2fm+/oo1+JfJQciTo8vlumQg/Amre7FWtZhyp8ebsJfTv+IjUmUWRzgQNSDbYYbYjcjkO4BFzlZVNwGVwyXzo5mfFaCdhkvmxlD1fCF1YKjxV2K5BH5AxBCj/WJzb45mwsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773533; c=relaxed/simple;
	bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XxCoKfEL7kSS4pT42W+6dronnYd2bJQpg1Owygy/7nMXSOw0BOmAZHChn2oZP9uhmv3/ksj1e5oVA4Xqge9NukNNgikSfNd1zqyxnuTluaoo4XjX8Zft6d03vH0zi2usGQ18JE/ekfVWz5n+j6cAQy+PyKAQqCPkujUtPm/t9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T25AcrLJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T25AcrLJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso4153718f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773521; x=1791378321; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=;
        b=T25AcrLJaYl5z+dWaPATAmi3IpaHAZk/ucAvn8V2ZGyGP5Aeq8AnmCK2YnegLy0zQ/
         WKPZPwYGqTvtgWSTwcgrtC2PO+h3R/AMxTpRRwkHqlzmp0yn3pxy/BKkqjY+crf14E8Q
         YvI5e2OwSfkopLy6S2+83Lmhi2tKO8CfW5VMs5c9CpmFC6D/LPoPM08lDVd7KQ9tZDgy
         FwcxVxZ1DxhLtMIkDmd58zl08enD37qlIz5G0UACy3ZdzxM201rNyofL5LTH9F2bn/Ai
         2OmBUyD8EV9MMca2WXAtX7cJlZKJGYDwUDkwTAoEy2Il+LQd5037A1gcjRm9CERnWXD5
         yVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773521; x=1791378321;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBgLWAqG8Nsq2TBy481BWH1d2sHsXvnlxtN5vEIpQJ8=;
        b=CfMNB/crutKGDVh4KYVofO3Ut57VKLJIJbJuGoiLyb0A80eYfVi0QVN0WC7GUfm4ND
         Ar+Sq20hn1zuVVD3oBFJSSv+9481IRqxOyRPnslsyb6W6ke0FFgL4TX4qoT+lbXOdk9C
         XInwvifmUFKKxwMmk6ew+jlXdEGAQdypKFNAdCPpbu8GAaNqYfB1Wa/j4gI6B/NmHf2R
         rzbJjrBNtvbRrhqdUTTzJ70g0K+FnOgv54ghUJlivPw2o3iNyHk4G4edJelvAJ9rnEkK
         6aHJPO/n9tKkcvnHs4cH7rprynlDXe3AfHHN10TDEeUQ0QgcJqcqHMghnHTrJp1DCDCo
         XpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyMp1qZkaadbJf35qXGQFPDOUSs5zPVLIX2zmrnl/ZrzBQSUC54BnXvel7mdMqBL/oBWy8Zw8oGa1U6WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeDogmGePI8x9yew7EfbKQAdSMb2o0Q053JAf+LYEosI+DdY1u
	xKcDMSD7mZiY5iu8q8Mwk3ZZ+GYWysc3JuiT4DCdJbS/NfSWI/7VKnGM
X-Gm-Gg: AYBFou1Mne+cwdFNoC/nO+VzvuDu9mB2CPpdT/4rf/q7MOnFjkMCzKGQxsmqeJGWYrl
	oGYxxVw6d9PToyZw6MsM4H0AAmlSoesO8cJE1kjVsl0Duypq65EWjD0wMw8QAoLonwsarVeimsJ
	/14A85DOJRE5yJSwlTz9DXK4qX7Mk8Gc/G1Q2C1a2IqU7I9VwE4ertd0CyYDXC/BnIYG0+P+eO9
	/2KCsBZ7QuGiIiWoIF4H7h+EoY5ko4KuJFKUHNMyOjn/BntqXTRUEXpWK0UlsyzV7AS+CF27lxW
	cObpR0CEvbAUzW+duApWiUC9Maa6vuLGS8iDdNRUap7avWRBWVZ818973KnWkkECVA/Tp4Z5L5e
	uAVbTmpFGfXk5nvqCQVwJ+FpK/Xgk3+zSfNemTtUZZCYbBBr9zMliKmKtjfw6S/ET1TbHZ+WxV4
	wW2E7bM8EzD5HU+kWvU3OyxOCXeqCM+YU6J0qHtVGoHP+0ngPG56XYBNXm+JFKWq5EgRif/o2hp
	htjC0wFQWWGk/FbvqktIVofKuiyIJGk
X-Received: by 2002:adf:e18f:0:b0:487:799:c04a with SMTP id ffacd0b85a97d-48b02430c2dmr2681615f8f.3.1790773520942;
        Wed, 30 Sep 2026 06:05:20 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm4914950f8f.10.2026.09.30.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:05:20 -0700 (PDT)
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
In-Reply-To: <432b697a-d931-4523-91e5-9b45a08617ec@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
 <179076863241.3327419.16233537387530771884@gmail.com>
 <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
 <179077030602.3399593.12266354979192327093@gmail.com>
 <432b697a-d931-4523-91e5-9b45a08617ec@app.fastmail.com>
Date: Wed, 30 Sep 2026 16:05:18 +0300
Message-ID: <179077351803.3424620.11498774337540482054@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 02:55:43PM +0200, Arnd Bergmann wrote:
> It sounds to me like this is different enough from the generic
> spin-table that we should keep your current version then.

OK, I will keep platsmp.c then.

That leaves the directory name: Linus suggested mach-goldengate since
mach-gemini is a Cortina SoC too, you would go with mach-cortina.
Linus, with the symbol now being ARCH_CORTINA_ACCESS, is mach-cortina
fine with you, or should it stay mach-goldengate? I will use whatever
you two settle on.

Thanks,
Fil


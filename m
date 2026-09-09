Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21354CF4A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955727; cv=none; b=gc4ChQSVc+v8O5bJIpdkEAs0NV9UXsAzjrtPyPK4GSZyIKJM1SDHNXeN4xj7dmRqUewq72csoCPLZTjtzK1Np1wDgAkWvOhhHSlT8tEfPIkS4Ym8VlD0vDADVBLZUXu2gIJK9zINYo5trD275DIQ/x2KRlrfWRS4h46hvGvCWJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955727; c=relaxed/simple;
	bh=bZxxw56AVwtZnpwP8MD7EMIUl3KPinsdzlvWzVY7qAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHHwLY/Pj4RmNEGj0fbXkr12zLZP7pA+yHPQaTMF4LgbaIWoCG86NljoaGjQTmdDscNfF6No6AV2hNntmQsayfGpncHUkfPU1mFrtERvNjx89zffTNCVXap+nK+EskHTKL/A64VcHJnJLX+OrRIh8X/7l/Pa1RXmwF7y3/JZWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJK7nNTR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJK7nNTR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so80836545e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788955723; x=1789560523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZxxw56AVwtZnpwP8MD7EMIUl3KPinsdzlvWzVY7qAg=;
        b=eJK7nNTR30g6iX6af2Yfv07WlKO80eEddQhnCvuZZEW1YFjDbLmV/rPEJCIbGJQIyt
         aPrh70qmtCoLMPgpeEYFLOrSYROZX9u9qOV8w8/iNxMHtBqta6Tma50+SMUVdjm62HGd
         ogGOFY2jxBXGscMsV03EkkD+HtDaSTLDDH6h+bTFnAPoh3lWrzMh6OvkrpdBt9iECgQH
         cUylNyc4zCkb4TQngjDCStJBjcCm/Gpw8ioe9SSDyM03MyD73U6X5L5gTd3/5il3S/bC
         BQNd1MYTAS6y69DOjqvDlmdI38zYwHTalrYlP7SEQGd1w6Aq+j91gMTNUsBoioEIUA2Y
         kzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955723; x=1789560523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZxxw56AVwtZnpwP8MD7EMIUl3KPinsdzlvWzVY7qAg=;
        b=LN83SMDaeuupaE05Q0O99pJvAWxRJhuanvdzqJEX3a5nN5LZxeCrO8Jze4C9MOk+Cr
         9fIuq7sjRWDURQ4jaIdbQnTaEC9fBoCMNp0EnwkEaPaFGgRHsRJuhy5hz21Y3N7dkjHo
         DfhHMTMsFUB8WUsAF715QBi/gXCEyhIH3y1CYwBxm6hPINcI3iFtt4VlcG0i0K7IsLCW
         jEdz6/H4QFVxt2HfRie938QEXBZg27IdBqLMejKUq5YDTBZP573u5rAlmmya7LQyuk1D
         U9stDwdOYJgN3LPVhkRbIUTDDJyPd0O/ft3CipqBFUtaLyf3xV0+Xox9u9RW5l/vkZAE
         L5YQ==
X-Forwarded-Encrypted: i=1; AKwUvByg2HmkWjHxYlubSQHVBVtT0GMogbznG/pcmw4g8pbQoF8B5+X657rh8CqD3jB0udl0vt0q+Gy36n88/oU=@vger.kernel.org
X-Gm-Message-State: AFuF++k5XhC4B4HMiHErOd6HR09+s820Sh4U3jDfXVgy0YIYP9vFSJxb
	Rhbu/U7Ff2mVdDJYpiutO8aCrTJZdLRZPC8UCE4oqLh6nQhZOL4o7Ac2
X-Gm-Gg: AYBFou2WUzclMXmQvr7XrBqkFQbWvsYAY98EEbsTmC513c63PDCDYq8NYQVqladsSQX
	qNDUkcWGwiTb80Ie2B+5m08CDJB1yNWQmQpIDqumv2oktw+TJ00zKrq/ykypOq8QUVo+rBpj4ok
	u/Jr+3p0FV/19B+2h8XUai3oHN/WBJDWlFuBoVMEmFuhV/3F2wJif/zoLRHn5xK9psLTtjvlQcl
	vl73pmbwIrgIXNMkBAg11vAiFMR/4yIyZAoyrLcwJ/jocdO87SaNFJuM+zw31w8VExscviMyHCx
	gVuln7dOaA07jqdrCP78jMHeQK7PEXAaFHLFojyT/ssOffFDAX92vu44dPPYpCwTEr5TbX3u8iQ
	y1VbGfzNHvfzoNMjSx7sLIURMk2X2ZQim4RWHgMzui+7YGnYDKSIVQSY6W2EUh6u0R9eldCFZb/
	AWJ2jWiS3JgZUgQfjciuL+hLyApRc54s0vLGfBmTy2FYFw1+4CMjYCHOHvsjT3AYppZ207roMYs
	qHS8MKl0jYvSCMxDJac
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr123017595e9.12.1788955723370;
        Wed, 09 Sep 2026 05:08:43 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c51:e108:176f:2adf:3ca6:dc52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm655154905e9.9.2026.09.09.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:08:42 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Johan Alvarado <contact@c127.dev>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: realtek: rtl8365mb: let the SerDes PLL settle after the data-path reset
Date: Wed,  9 Sep 2026 14:08:38 +0200
Message-ID: <20260909120838.33380-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907191945.806751-1-kuncy7@gmail.com>
References: <20260907191945.806751-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Withdrawing this one.

The evidence behind it came entirely from a single Archer AX55 v1, and
it was never separated from the chip-reset patch it was sent alongside:
the cold-boot counts I quoted were measured with both applied, as Johan
pointed out on the OpenWrt side. Since then the case for trusting that
board has got weaker rather than stronger. It is four years old, it has
one confirmed power supply fault behind it, its cold-boot behaviour
differs from its warm-boot behaviour in a way Alvin rightly reads as
out-of-spec supplies, and Johan cannot reproduce anything like it on an
MR80X v2.20 with the same IPQ5018 and RTL8367S.

The 98 ms wait may still be right - the vendor firmware does take it,
and the constant is in the vendor SerDes init table - but "the vendor
does it" is not on its own a reason to put a delay in a driver, and I
have nothing else left to offer for it.

If someone reproduces a half-alive SGMII link on hardware that is not
suspect, this is easy to bring back.

The chip-reset patch is respun separately as v3, retargeted at net-next
and without the Fixes tag, for reasons set out there:
https://lore.kernel.org/all/20260908174403.420507-1-kuncy7@gmail.com/

Sorry for the noise, and thanks to all of you for the time on it.

Best regards,
Stanislaw

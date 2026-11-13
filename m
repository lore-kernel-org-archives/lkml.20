Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794555964;
	b=Wbh1EeswbHdtHWFufBAX4GB7LuIi+isuV2CDBxFnvBxUh0MkDeG+YhrhNuC+mgKdgTBY
	 gC2jgb2kkEIiVzQXPkjYBzZ5vk1okcIQvcvzW77oP2Ta/PbFJTgbpSiWQUTBvEw6jB2XV
	 RSee5Pz+yqaOIY0IPO1bwkDEgg16qNl8fnrkFwk1IVz71XVvatnfjPuboMGa7qLmmYMwi
	 FC5+bpRW9rGAW3JKUcoRBPOj+gPBWtWxJUigDfaBJhU/FE1uCJJZON13WXwyMnHFBScXy
	 TxJYxzp7uzASCVjPD5Vpi6B/ctHZnt9lD/R0SSr3HrktDqA6TlwxpKOLBQVJbc+7yyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
	b=dvQ2YA5fvZoZhO+iez2BJLOeldokrVIHjldvBZgYfjFG7O5cQNzrqik8+nsVxpk2PxMy
	 I4WYemS/iV56JZ9Bz2u7tvrfEEetG+DSNFx+pCv2Mp3XO594CX768bBhzoje43H/Sk1vS
	 yNhTJ5wYWcEwnhH9xkhLIgz55z1oqlhS8+UOtUAV8GDquKvuCjYXBT80DUDcjGhRWuBO8
	 PB0UvigNBSOGatkfI9vBbOdjVGz7XibSPtH4ngiLMl0JY8aDMFsaAveifBfo3a40ER5Ly
	 6shyE1O1RWJAwTtktCLMTiqkW/maKUI8M7KlYGFR646YrgFvgS2b0FCeG51JOzEkPxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlV5pE4W;
	arc=fail smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD3606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAD3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlV5pE4W
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c05727a58aso54175e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555962; cv=none;
        d=google.com; s=arc-20260327;
        b=q1lheE4mCagk2vWuVLTlQDAMFG4L6pOzpSAFDqx87JSo1cbsHARC4knY9DRf83ibtM
         M7JrlRBmv6MW7q7rQEPmJGbAWRliXhdimhTigsfiaR9KMUnFilFBM7LuKkzpQJSBsi3l
         CRR9hkfcQvfQWCvTlvwCyWrlFjESeuyeXDQ4fR+IKd7iex3BF9i7I9k9PiCpc2J7Q95E
         5bE7peDNEk+WjXtowmvVIcz0e59VZ9M3Fa3fdtvVzlsMwoC7SrHmNOfOP5h2boKhR/y7
         0vVBlYIPNU5J3PMXcm6wIP9Sqnfytr2PqlEWi9j0BJRaol+8DJH5Elt2qpU+YuYGygKo
         JL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        fh=KaI8FRXjB/3yMU1IUFi/p6DyrHINR2hYPb4u3xKyNKE=;
        b=I0aYBkuRfKaQkr3EpOKa9p/EGJ4jcvA1TrlZ3gsKj7B+TDn8P/53x5kCDyJg370gJZ
         yu+CQSW48IBLb8rxNqzaNlZJjRygmdX16RhaHCQEuitEeoe/z0OzSqwpvieOBRp0h/AS
         GRhk5if0uFDwUCeMZntd0mDgdIMsTqajWteNXvTUL7lMYCkAyUoW0YX9Z1GLIRze/x3f
         jmaL1O1RQIC25PVP3Nl2NCCnClXdvc+sLwIfE8vaP0eLstSUq+TNHjFVRi/vqGy+SJ6R
         CIbiLTWsoLyAv868+V4vkF1617dsQ6Fgl3DIRw6Mhqc+kq0YJ4mVRz0Tx/NODclC3rXv
         wYEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555962; x=1795160762; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=DlV5pE4WyozKzf3B5GLFZflBg69H+ArJqhA1q9Onj5Rac+wqD0MqfXqqkk6+0utQfH
         oHo7TIF5iYCLL7Fc2hNjSjO3vs05ewSsUTy9mcDMZCSmSpieIyKszHgDUvZML6v9noul
         NBHlUnHbzeMPl1O+MFM2IVK/LfZVMzJ5t5d5ScnWJwJenfTp9A4CFmtbZAsuZ05M5+Dw
         YUEvm6L2v/VttYbRFz8v8XDWJU72wdYRJeCsDQHfd6j4exyXF1vggZDlf9+JBqbO979/
         cnJbwKnqRKkZa/GSdZ2NGD5cp/idJe3tUyaEJ9aF2nraqyFZYntKX8truvnL9g55l841
         Qoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555962; x=1795160762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=w7EYDLpWEKu/FJMOcjAya2vrV6g2UMiKliLG1rO0OEHwkCXp96DDjB6H1RKcTzzQRj
         Q9VFpv0Smk52e8ZkRwXumJCLMGWgyb3BItaK/qAsc3jHLlp/drTiGJG5ZEF1KheKVoUS
         MKjiTW4q1lhcAmhG5yaSc6LJP9U8LZvmi8Dktwh4BeM5Dk1yyRbY04+p7IYQsy5lLpZq
         FP4FGrX82hZ7K21Ho16aJc74bid3eFnxacwDUXfVED9Z1newL6nKRDNsFRl91YKxFzYt
         hS6jYQvOsUQhFz6ONpP75uzG9GsHQlYXVk0cKw4QrPGJrkIFGfI38tsoMTOuYaFGP90G
         TVbw==
X-Forwarded-Encrypted: i=1; AL+hErHLdmSsCvd/nXCAyelzgT149e8b6s6EHXevGS/0+m+KTKcLEOpxZxmV2MMRuKZhx45/3x5jF1XetFZsSys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7MELa5oIbdzzY+/ORl6pSJiD4bnDwI9H4PREMdZkhkn5ve8kj
	y5AGcpilMjpsJ9rvFFO5asKXXhQrJSTar/TwBTg7yrIrzZutIL95qNGoSFmlfqjhoe+rid5YYxS
	WVd6kDzZeg14boH4lTF8HoGvfFedsqi4=
X-Gm-Gg: AYBFou0nL0KZuUK9/UbOhqh/K0bF4iSnA4eHOTubh5FDOaX96UHqZSD9xEr2ki6EJr1
	udjzb9Yz3MKOuEyotToBxT8AHWSJbGxxrQv0/tGtmQowF+cdO8MTq3PR4vVUpsDBPc/GIO1P0RP
	WxjlVTzUzIxkWKAB0jfJtCeEOcKgvPUU9AJtOgdu7QHmVR1ghwAWsbwvm6qs4UYcIUuH4UEBeQO
	Ka9xrzwAaUwfo9ZUs3iyj3ZQWTQQYqDt+uL5cAgg4JTO22S48kSc+561Z3dqCElhB4/A1zz2dlf
	Qv0W4gdRxahThRko5IZBqg9frIq5+0e3ZA7LZOgtQDcRD5+nhMnAN8Ve84YiV1DOnrO6sKAXC/N
	cAZLmP62/iB3CBMhaNqykZyvmdVB/jr5mL9u8+RtqjMJn7lGYYCwCHxzXskUnjf711S3WMCA=
X-Received: by 2002:a05:6512:61a4:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1709ce71dmr805206e87.4.1794555962280; Thu, 12 Nov 2026
 23:46:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com> <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
In-Reply-To: <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:45:50 -0800
X-Gm-Features: AclHuK-IYiE1aDGEHibGFo-Q3L4DjiCYZIfUZ-5mDw69KYbW_QlhkXjxqGYSAjo
Message-ID: <CAEy9hNX_E0riGS-TdDogDWMv3-fpAVFLAjx8F0cvq4Q_rH3REA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Fix use-after-free in the
 MDIO mux error path
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does this bother anybody? Seems more like this should be for net-next.

No user report. Sashiko found it while reviewing another patch of
mine to this driver, and I have no board with the internal PHY to hit
the error path. I'll resend it for net-next without the stable Cc.

Arun

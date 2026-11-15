Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705664;
	b=E/5hFxPmS5oaGNcZbklZ4GcTyBQKb0wLswiIN+eRpDf7Xo1ckVlLjCJkugGHok1hk8C9
	 8l5okfz6ClU9i7H6w5nHnM5QPamWz80hfCdfkoDzCaWEx7ZWoC/1YGMo6UgzdeuGRjw4X
	 MytJoTKEkXPk++ZUJDOPBpWs76Jy09GEbUyU8HayOlqcGndGcGjUQqnYAorOB+76zeXPr
	 aT1TpxLHXaS0wrTG+JiFza52PEQvN3C1kBdDMtTvJk32oDvz9t8IiuBo7u94jWJQPtAjj
	 eEtkhdTclfVIvcjB9TKO6/xfcJXziWPZCH2GSTB+Mp/4oq85sv2g/uRdBAqyozuovzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
	b=RQfIyHHILsC+qi2biu7bY+pL8VevmTlqY1W/JZPIg3X/srKSwJwZrfZ5c6Rxy9gsNMhb
	 fzXyqynB6jpgwkZzvAlJj0z+zJhqaHlCjtPRPa2+SLV2uu7H8SYnca7q2xaAV82gXEySc
	 Y2pCs5ZBPk3BUiwC1gWlvMqWP7Vu0CC/Hvc5pwHPV6kXe09ILLlukJJo7jsS5JDVLhGVV
	 MC8O7HcjOLjnXeiUJgeiaz6TW4aJ+y/dCVBXpH3rCH9Ni/8CyBNC2e79jSe6ImnNzhgSN
	 iuRpbCgIAgS+bRcyEiNtRDWgEJP6FQYeO+CC3PfMn4DCSrepHvnmE7qCtl2n79bPLNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8pKJuQ+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902B606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A902B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8pKJuQ+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26920105e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705662; x=1795310462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=l8pKJuQ+VUtQkgo4OK4j8ZH/u2K5AGocT+qsHepJ4GnOlQ4wQPwHwael2d/C0h+xmh
         Ahux88zXNVMjsEbVU1wrBxjH2GFl3vT9yFPOzG95Nk/D9Z9Ufb0WomjdwyIxGA1+m0jT
         FkcQDjrD5Fn5GkJL4U7pTkjKbe0YowqEMQ7ZUDjMEuxRPJ9rFIk3vlQwKpBCN2da3oJE
         7YNmv1xWu4xc8VuBaMREZOc8flKGuYfJHy/OOrp81cIo9rk6oUyLewFXmsQXr/3NwUCD
         bsAaZBBHuaZhAm14/sAbMuk/rrNBxxPoehhx5+QSJ/w6JCWrBxGtrVKXBksuRTJGEODB
         I1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705662; x=1795310462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=OpI/lB20rEBB6OgdN9J+dpqNWPm1fRzHwCiM98XbcnmjU/PZUVfUybWrv3HtVgPXRT
         rGeuX28p1B6p/iqZroQhTPFJXLTyARqIl2Zi14Pg7BcyPN0hk1tUENLTpDHaokpHocsN
         5RUsQjKj8YMohU99CVi4ULCQ1982ROguDfM5RX7dW0fHJAKgYRjqbF5n5OhrgkTvplih
         YjNryP6AfIljMLNzBT+yXT0GCoWJf3gR0iREg3D4fRMOc5Ie2ALooD5i0tVxGV/pbKpw
         N+lciai+pAEPBTQNjqBLodLP6qkg5rQvrCwwGEmSXh7T1KIC3vEcNq57PVskd7f2DVcl
         5Sug==
X-Forwarded-Encrypted: i=1; AL+hErFxA5snXrMxhSKdHMQx7hQQI7rdoJvmebJTOu77Qvjadzo7uOJZwJPtQ4N1F4EbE06ewIVaLP1rvXGYSCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PPOMLvhXnR51pcCxImygA7hsTY2aibYEI7EKinELg9G++Kjoh
	OYAsCtYV2tX2NhxQV7YX+sajjwWxbDTjgmEM7ChhQiuyoR7CiLZjCRlH
X-Gm-Gg: AYBFou3Tf7k6RlT/3nyHhB1p/EGYYmNFtXtiGs2CV3m2OhVi4ktrGk1vYYqOoVav+VF
	ob9KGl9Da8xHrOGEWmIUv8q3t2c+V5X3HhgBqgo5AVBsUid7nB7Bd5uqRj5GHFYg0OOHcGYxlR/
	/e1mptCrgbbvqioQZp+EYTdPKE6jgiSt/bv6eFTJlNhUQGsoALk1rUJdbZSiZvf8lqyN0LDW9lY
	sN6YABT683HuyRNFZLLkMWrra7MKvNm0S5+RQHjOIndy4CEbsZSrDUZAmwsZmm3YjZojoeRToUs
	GpRrHjTL+1DDMYKqVfnXKnXPYupjba0PhNvovmyEYmD2o6zy/Y1RHMe8t4bw+k0peRyGG0OvGaT
	PvFv8CISP7OwSkt0o15vK64ljxEzcKizKyAR6PDuweruLU2OsL08mYiE93eIn4XWeTU0Hurwpbv
	6UL6bVZ4y6967ZsGBOvjfvUtpwqGEUpBXPd6SFxXNGWetjyF2Qac5PyonuhkEpeOE23Vs67qnjC
	AODZd0Dx8NaOfTn5KrrQ9P7pduEZMymQ0vOvW/e1lxTa/MXAHITbgMGhcsKrh7Lg3vf/KzJWouC
	CKT3DfpaS7Hld8iJP1uYS1vyHP8uENl8mBOOkt58EsEfUo4UXokWU2jZHAMw6Whamdv+aUmbh4T
	jvScn+c94et4XGYuAxJSHrAnWlaoNN9gFDlWmTwDpmBGUbozZbEG7koqzutFpFbvUlQWtkvMeN1
	2Euq4fiUTM38Co
X-Received: by 2002:a05:6000:2889:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-49c7072cb5cmr16023280f8f.26.1794705661826;
        Sat, 14 Nov 2026 17:21:01 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net (lfbn-ncy-1-251-132.w83-194.abo.wanadoo.fr. [83.194.94.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm12967006f8f.34.2026.11.14.17.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:21:00 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 02:20:59 +0100
Message-ID: <20261115012059.1022197-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
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

Hi,

Gentle ping on this fix, sent two weeks ago. It still applies as is on
sunxi/clk-for-7.5 and on 7.4-rc3.

On 32-bit sunxi the N-K-M rate math wraps above 4.29 GHz, so the clock
framework reports half the real pll-mipi rate on the A33 (594 MHz
programmed, 287 MHz reported), which broke the PocketGo S30 panel. Any
comment, or could it go in for 7.5?

Thanks,
Romain

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091411;
	b=m0kLPjifZ5tKBV5Lgj0b8X0LPqX8W9YiI5B+Yn8HGisv47V4Aw8R2Q9IaPTbfCs0FvYX
	 vV4AB+iGgIVuv9eMhBFfCnm9y4I73ujeiWDUEFcgcWIElfAvsaHPz2qmYYrvGMrD6YJjd
	 MYrkpeO08WI6GRYFvm94Sy3aUh+tNPulM7W6lc3RpGkfFYYLFyROHE3UD7mKD8egyA2KA
	 3x8kdD5PY6tvczeuEh8xxw5leylDpTQPNl9czlpjkS6IwO6DX+sIJDNcdbhQmDS8inVf/
	 ljxlsQFlknE43wr8b1QCwkBiStqCzn9uNVJHkhrnm1FGGDQ6C20wSxkskdRlyc5xF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
	b=nWsDhshSRQDF4hePStmBT4UGNWuMQ4rwfBal5b0XPSIMNe6KscfgjLXHHauX/kxPaD/X
	 jU04C3NaFZbZIuB8f2HYecWCBgle5TRGD4a1tsXM7uW/0fqXP5pgn4lS9D+adohPVJbIi
	 +a72TGgOu8PYHkApdT429i4LLdpTAyMqEe89WpEayJM9aHX1bbKIOQBnD6/hzn0jT5KEt
	 0TDf2oi/MGrzgGmnRBE+sSjv76WKiqzatRjbHl/NOyP3MDkEjQ82uU9sJv87kbGjYRNDr
	 YJVvPf1UZDBBikv/g1GTVTlC1dAJCxZtfPQGYhiSGnzUlvYdJMw6dixxCu0rUYEGVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKD5i7DA;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E377606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E377606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gKD5i7DA
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2eac4936dfdso3273445ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091410; x=1793696210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=gKD5i7DAr0WSmZ3uf3JtlbEqDMKJPGB3mi2KuhgnRxMQQzVOcCdZwUevcjpCf6vNa5
         MHLE/2991Qk7m9S6cwCexspEE3Jit/3n1ABXJoFDdKxzUUJ/erjLHXv3wIHbqKzIopxt
         l/tv3BJjR+oDiJEZyOXjYObNarFP3MFhgk+sN0XVIc9UEesuNHgi0oHlGe+YR9v0J/db
         8Hb9G0pndHdfICWTNuzwtdhf0Zt/bI1h+HNNDNAJO+MiIq9NhgCzhJ24kjhrzqXnA8Z3
         uxZxB4zU2I43pd4T5TjRoN59h1VbxwqKrTFsyqXsajuk6jyz1Lm2ovl5Ms69fYqtZ/d5
         mOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091410; x=1793696210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOH1HE42SviJbPJezzX4tQBmmbjpayWa7pABk2ZxVhU=;
        b=JYB4WfIiQujgHDYzMf3K1zhi3iV3Emb0uDvX/kixDZyzfkwwZ9eW8HeQfuRQWC7eq+
         dlarg1g5to8Jdh4fdhLCXFfD4ymrkD9zibdxxxFYtnl9wTd+yKS+EyFGfIKtlswfXfWq
         2GqadUwD8xV956L6YAZxcBa8+GZ0jMZ7PzVf04kfFVcsEVoGeuyZzwARxfzNmZYEQ1NA
         TZeovOAGuVtnRqMElaJEdvwcW5JuZ92ZeYrXV+ID4OSJIihe5s8vcrNG0hZOqf65AbCf
         BGM1Ps/TwhLXUfqRBRPXBhPDPY5CjcEOGUz6ZZ5vQK60K7pdmvsE9KZQBD0vWsnUOWxh
         oxQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTtOxMzgFBNFE1fAgNViz09hdXxRErGF90GtF7LnijMSPbTy7/pA0+IuAPsLpcOZoksWnVIxXec4Hu6Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLKcSzOPE5oNqZYsR8fJfXfKviU8aBOwYD+64MKWeb3AWNw5so
	5E60HPzWYZnp5y7pdMeMvSOo/AtNz/vB40EHBtb/M9tSnH4c6U7lX7Ay
X-Gm-Gg: AYBFou0hlsczc3XEuODnMAhhfbQNZbsWzogtI8JoS1RHquv9o5y7u0k38WM4dc8xKEb
	OOel39CLmfUre30QQy75pM0UIH6Q/2Pk5EXHT4LSev40vecaeAqJXW12e93ZSia2fk70meua9wk
	Jl7jeKFQ6uD15j0+8AZz/0r9mH88Lk+BrFLkLfNUaGDzNKolKn76YttrXSqZf5ryrEPX1V362Xw
	0J4WX2ok0hVscla4qTFfwwuPusf1OHfu5zf7TOZFNhd7eVZKSXF8SKyJxmLAAGSLCAnJVtJeauJ
	dNPU0JIS6szkcPWuyngSnwEyq+Qpwj8SrDs6ltq0Msc7rJ0yAvDDomo/295R5F/MuI2eZGTHq5o
	A6Xu/RxsrUFiftK7lTjv1lLcNsNkEcOQptJwn2CSOGO/ZBO5Tpxo7n/3Vw8K73Se+bXVZuPMCZK
	USX6+EH7FFp/L6Jcjl0c77T7JBHevP0TXP/Vmfwrn/rplDoDXyKElobyxSSDADcoY4kyBlJLvsw
	otm3rm86qzkScD8R/FqCs33rmOexwzlOwQP+CVWZV471zyQLFB8wGHVLT/mMvriCsFAw6wxYDfN
	LWURcQ==
X-Received: by 2002:a17:902:f70b:b0:2e9:4175:306b with SMTP id d9443c01a7336-2ea9c08b095mr121636605ad.1.1793091410353;
        Tue, 27 Oct 2026 01:56:50 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm5623875ad.59.2026.10.27.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:56:49 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Tue, 27 Oct 2026 16:56:34 +0800
Message-ID: <20261027085634.380872-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
References: <20261027-angelic-caribou-of-wonder-02ccc8@quoll>
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

On 2026-10-27  7:48 UTC, Krzysztof wrote:
>Maybe just install the DTB under new name if they are identical?

Thanks for the suggestion.

Installing the existing CoolPi 4B DTB under a different filename would
solve the DTB naming issue, but the model and compatible properties would
still identify the device as a CoolPi 4B.

This is my main concern. Users running Linux on a Sige7s would still see
"RK3588S CoolPi 4 Model B" in /proc/device-tree/model, even though they
purchased an ArmSoM Sige7s.

I agree that we should avoid duplicating the hardware description, since
the boards are identical. However, I think preserving the correct board
identity in the device tree is useful, especially for a product that is
still being manufactured and will receive ongoing upstream support.

Would it be acceptable to share the entire hardware description while
keeping separate model and compatible properties for the two boards?

Best regards,
Jianfeng

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853276;
	b=XrT+6nGV1j21qEgvQY+/Z7n6IsVwrrJeGNlD9/IxZK+pLCvbaZrZ369V8L6axJYnvzFO
	 sjaKDq9EnTtpNVqHiVZnCuoFiyWKjBKfvN0CKF21ZVYiXBcxA8NauEpuYHDucERslxQsU
	 T6DJqFs32DGifzj2ueu59u+EYn+NBB1RsLA8Y3JEeV9y62IT89J1ddU6RWb6fBdqsHbdR
	 ScR5QJjv75mVdmgXw6ZBg5VsIJ4jcQ/7QGbE7VZhD8vgwvooTK9OcXXOBAdX4kyo00Feu
	 fBjyGT4VIRucHUZtIOf8AdVEFST93yO5TXeSfjN4CwEkeOQC0akWHSyW2Q/sGmAgJvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
	b=UnQZFN1InJ5O8uNyco4oe4wSUUqviSdbgM0bKDIXg4ZQqVcJHoUUTQ33Obq9cpVvbl5f
	 UWeW5WTaNcn1Lc/bA7XyB0sLcDN1TeHftn9JFKKvEhga4JYjD+JtLmgxUmKJG/L+LyYpC
	 dkl8X65ja8KSVELB5LoOzQEUPCfsnqqk28NX/mlnPL1Wv3NViLK74MvgbT8Z7NcqSszuf
	 tSm4TyYNlAqrBnSuZkug4x7xwBUDVnVEovGYTyUc8equE+9BCiL1UkfIdlTaajHKIR8py
	 Aw8nmTJ8ZWvC8ffAnWKCrKlLhoSOiZTAFjoM+Lmac09t18mw+mGBVD26J+sc6ccRzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC3606A88D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAC3606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3JkZ1RQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1590426b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853275; x=1795458075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=v3JkZ1RQEG58gy+eqpxPbxT4r2sOGl+3RM02Ofi2whSprgoglF1t5NJzEdx8sfFa6V
         Y/CwvO/WJHi2dcQl7L143L1IovUE6y9/goX7nZbdD6HmXrv71AVVxOLcPGHccKnPvbpw
         g9BsGkaBia1RGG1iffaOjrKO7wzfmlrR0pUWwnQiBAnk7bOtcngrh7hZW4orFLM+GXyh
         oFR7OnXSA1Kyk1Jk8SaztfuO/ien8ulpHEGVKgVjc9S1Eh3vycBMe/pE7M9U6X9TQUTI
         HJ+l5hcSm27NIv9Pf778NMmhtrIdiGGD9nqKGM3QEisGswQ2XaP2JWerPGeh5agfIAlL
         A89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853275; x=1795458075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuJbvNF0FrPMLXejiqbdViekL7UXyCU2votoGhiD3Qk=;
        b=xfglVmdDrlEdUJYB5ao+mSQFf6LiO53gD3lwjkFe0DRWkDdiiN7ZlJaDyqQHbVAWQl
         kQVVZ3veX/bdNcO/jZlJHOOUGdeiI/H5juGH1Ai25AqPFpA0PkiYRWuMLokDiKjlmZkG
         26oH08y12tfjCgXHHK8OQ2SVsCwIYnf9UBrf7Wl6NrYmf73/N8+fYOFRbcwgdH5SXld6
         84pF+QavUVtATIZ+1jNxKejhcaPdGgLTCYDhgPXvFBNqtLZTGfArPD1rAytXxk9BGxuX
         N1O6v/pjteoZdfyjtzagvTBEfnOFmA3TmIH8yqjeN1z0twVBc7mBrkLIUVB15c4GMuCP
         pXiQ==
X-Forwarded-Encrypted: i=1; AL+hErFYBXcKHHwy/gNNSi5+mU16Tz7INRpb8pJYNHHfrorcrk7dI+EIzA57ECZOCcpolVqAqlPiDoQM0dEh2Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PbWjoAhDVGEH+9Z7QaFsuhPqn5+hPNoSNH+4nPcTiqlcHbTOw
	55bziGd+ilVMbRsM8a8XgFAtgmzsqA5ZRpFMcpgSM1Myc0nYYvbg4W8A
X-Gm-Gg: AYBFou1KyJTCev4TwwwZUdbaxWFrQR2lhocvxZY26Mmu/67W3yXcVGqvzs7KKhxJ/DJ
	D/wqo624T6+4sInAR1MkXaD/X4tMcioWgTEzSx3HMyc0SZcrBUptC9sVT/oR9R60ZxRQJH01j+K
	IDWv/9QjgzKUde3cj6ZsdZ2Pg69TgLxxUAN1mCHGmR64ZJ/2V1NYkPT+SQ37ZXNCt8akeKR2ljG
	S9caS9k9E6xuYYa6lULermZBd13hN5YoXSZRuLb7Ht7w+TqgKlgoBOa3Y4Xp6a1K1sfigucLEDk
	3L3hp75x/+evHCLf6VDvcwfpYViuSva3D1E+uqhmndIDQRLNh9O2jFy9AuLvQyLDQP4dB8G1wsc
	CHz5o1tL/PgKlqQjWiq0mqorF/Hqq8spzLBlBCOUVf6GVLn/qVsaB/azXXHktGOOPgfBrUKpaIa
	WQzvKJMcpSspeVS1eZXTw5VonWdmHh+LClxnefFFuzslW6VMOOrRVG280Ab/9ahLkv1UpDQyt4c
	2f+tDfY2puv5qjThptMaxTfVeb5TwpRoJB9IxNyYKwWEEcQfWC2xwyo0UJpVKuHr1kfBVo+5APN
	6SSZsQnwpIfJGMcmCt72qoL03dS5LhX4VtIDXKITx7Zv6S5PAKc6UuR+X/6ro92POMWpIUoXVfA
	O0jXA/ceapBdmsIhdZueh7io4OU8YcAAjhVt7
X-Received: by 2002:a05:6a21:8cc3:b0:3e2:ad2b:8f69 with SMTP id adf61e73a8af0-3f7a7ec1f78mr9948935637.67.1794853275248;
        Mon, 16 Nov 2026 10:21:15 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0f3f4c7bsm236378a12.22.2026.11.16.10.21.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Mon, 16 Nov 2026 10:21:10 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r4-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456531820.2199510.7014507677375597007@kernel.org>
References: <20261111041904.48916-2-ahmadexp@gmail.com> <179456531820.2199510.7014507677375597007@kernel.org>
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

Patch 3 is the first consumer of patch 1's flag. It sets
force_32bit_access in the typed platform data for WiWi's XIIC child. Patch
1's proposed commit message now identifies that dependency. Other boards
retain their existing access mode.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com

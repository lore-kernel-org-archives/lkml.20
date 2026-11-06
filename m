Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977332;
	b=oz6AU5l05MN8hmCE1rH/ScAlBhBEytZ8/D7dCm5Mey5CGIWDQ4FhTI/AXrDnNjaocl5Y
	 PSQiQvzOe2IyEhxXWAoPPTdpNUmIGUktgwXZb/J67Ob8Vx+jTqOCTQc434ZvcUHOrRSA2
	 XG6cVWu8hnLyFkafA86bsaWKlWeKarmQOcWft19jWed+T+G+CdtibLcz+QyRiaTiyXCQ/
	 K8jk0CuFtRXWspeFbyIf9kH+kFkDWYA11TanD4cRQ26Ozyq5rYMXr2Tr2OBVbUBX2APZj
	 aKVZtcbs5Bz+7gyAsVJjKMhhfQoifcS0nSuDgPURcRUjrJCxPMJIWXcBUVnHadbxFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dOu/2NWQh9vClv6nK56jM5d5kc+2f+lGVJwuPSF4THs=;
	b=F4AIrNiSD2zLWwN1QkrYAc2p4CeQB7TnVcElaGMqQq6n3xkB9EP2FvhXWvgPWI67l+3J
	 XgLqecx3ZZG/h5UJ8n7vbN/rTsNK7o4vJ0JdJBZCLHURZzuJnwvYpIAC9AKoJPw6RPWuE
	 CQ/1fycvOMi9UcmL840ec/zuaJ2hMDRZ7gsLOV83moj9tZO180OUhJKWZ8709fgN0PZ1h
	 ChLLDLP6hz8RBRc/9NcqxVfVgez8RoxTNCthdQbrRvIvNoE1Kkjg37lfwiJCt3xmXiUrZ
	 pVVP+hOXF1llJTMD3IjHkx5gamHQbTFoEUtYnN3dtJcsns9XgBTTMR1pXyiAXi1NYxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x59N2/0/";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F968606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F968606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x59N2/0/
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso1023234a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977330; x=1794582130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOu/2NWQh9vClv6nK56jM5d5kc+2f+lGVJwuPSF4THs=;
        b=x59N2/0/oMt+6dPDxQNirfQ2nUsucWp2h6vVVnsSJJ83aTWE2kQxfOqOYNxiZ1m+04
         JxIRUw5yr+NYW7WhN/+NCYkRjsxPOvbvXQEwMcKot7TJ+6jjfSHqNhPJZe1KNtb9TSzq
         2CJ/0hJYXu70QlRjxwGh5D/+/zuJzT/kKtjnMih0Ttbu4B4Oj72ic816XCA2m1sj+Irz
         4MwkKw3p+Fjzu8Kfz6nxbCq9mUUxgz6zHbFxCzfJsDHF5usz/judR0U3C7rA3Rg4itzN
         CzmHWgNtKr/GKDMQtl1HPfEeE1hstK3uxxagu2c2IwmfIGO8c6WIuGO2xQU6+hhSdJgc
         d/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977330; x=1794582130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOu/2NWQh9vClv6nK56jM5d5kc+2f+lGVJwuPSF4THs=;
        b=RramZ/K3C7F2QGh7bjYNPPY8XHbNFTEIr7omxb2burm2N9t60bfMgRNpCeLyQS5gOR
         ugspm3KFE7HXLUQMMJ2umFNPhb9l8lQknhiNwih2etLf2D2rjW3RmEx5BpNaEedI7CR7
         34aLUi0/anvhHqHhymhyPt9N3Y7u38n8LPu2vk35MGgrEVmVb8lbU4sdMB9cDS7Mi7jO
         h+IgE05SdFNB+PFJSnLIRWBu+yuwtLeUP9qC2jkRTlxqUpPzeNguVoxPM+cgV08hfha8
         f03AYsOU7IrUj9IY/l4s66M5yYmxtCXyhPsZrZ6kUBKBRsknIEPEnCYGwj8o/vV8Kzss
         R2ug==
X-Forwarded-Encrypted: i=1; AKwUvBxvrEpMVBR2yx5kdFBd1g7ZM1pJRyGVIgXEdyKgvjVonpcIhZLBI0zQizNMbcrrHQmSsubv1phdNsFtaGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tnxqwci7WPKhhjGC7F32f/3kT8O2xTs67LRXawA7s1DW0Clo0
	dRnjXEDxvvrP0Cz8lUvNI1rZbE2kiv5VychT563rbXjK/VVayPkM6ZJA
X-Gm-Gg: AYBFou2k+CckzC8dQUvCZCfEpnQfZDcU6RCdLB4EZ5rR4E65s+l1Ca93foc3dPtrg7i
	CYfSNaDXD8YXuP2mUgzEcexGANrtgonJ1QdZe3l/qlX18n8aDzu1x18ljBrHMlTN1uDC3XGCgcd
	doAjL9tIHQ33jEmopwPm8KZ4wG3z3rGigrF4Gt9hdsJ9+m7yrgN3Ybzd+lrLXeut9Dsa7qzjIqU
	LedcoIR259VBg/n54dTfHgE1Z2Z3ZjtSL6fHpyC5t8ZTIpIc6TC5U2ibtP25BkGDdSvvyjR049+
	8zI+Tdm80XjEosmMxVZrfzkjhXZsT8WkB15NrkXQZQ+F3oNP0rUYow8W4r8j+hwkWpo9Z6hJ9fY
	FSknSLkCVxZgVDwJHy6MUW5gqGftR9z0ZodWhVLzjeFik625bg4pxoht9ov1nd/oF2lJpV9UVw+
	/wkoqwP8QXA8UY73bDHp6pVs2x6o5R1Zuiu7DVDRJc2oDFK+iH9HTtTgCMG9hnwkXq+XSL4wJP3
	VLGkd8CUyYw9F4VPn558iezXbf6MxC1wrYMJDEM6wKJPow8McaiiD3muijosdr1NPdMIrlAX1a/
	9DnITSvmVJQxMrw47c1Zx+KpES0Wf1+ejv9drHv0A/49zuOF0GcS3YJpNV2v1zHFj0jfIJ8WTqF
	lnY4j4biXNwrJlgKCWTrD5AIZhna3Ih3wgT/sBcQDS2QP8kmSKR/c9Q4/SJmojQDPrN+LvAM48F
	4QND5T6NkC06MNIOx/ST5PDQ==
X-Received: by 2002:a17:907:60d0:b0:c40:19dc:a248 with SMTP id a640c23a62f3a-c4d34a63f06mr254682266b.15.1793977329694;
        Fri, 06 Nov 2026 07:02:09 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3567142fsm86109766b.34.2026.11.06.07.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:09 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: use IVL in VLAN 0
Date: Fri,  6 Nov 2026 16:01:24 +0100
Message-ID: <20261106150124.3630781-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <autLlP81HFeMyICc@analog.com>
References: <autLlP81HFeMyICc@analog.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 04:22:58PM +0100, Alvin Šipraga wrote:
> Yes, all this makes sense. I actually remember doing basically the same
> thing back when I was working on this, but it seems not to have survived
> the final work by Luiz. It would be good to get his input on why.

Luiz, do you remember a reason the IVL setup of VID 0 was dropped? I
could not find one, and the switch only matches the driver's VID 0
entries with it.

> So I'm not sure I like this function being added to the vlan.c
> library. Semantically it makes more sense to me for the main.c driver to
> actually call rtl8365mb_vlan4k_port_add() for each port, so as to
> explicitly say: "all ports are, one way or another, members of this
> neutral VLAN". Then you would get IVL automatically.

I kept it out of rtl8365mb_vlan_4k_port_add() on purpose: making every
port a member of VID 0 also sets the member mask, which the ingress
filter of a VLAN-aware port then checks. I only wanted to change the
learning mode, not which frames a filtering port accepts.

> Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

Thanks!

Stijn

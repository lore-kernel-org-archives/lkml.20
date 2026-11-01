Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551625;
	b=PB7RsA5yXRDkh6fhIlAEIjPc6XtqHKMksQJFrjfD7z2qrfrlkfGpy5+L/EyUPivyYWB0
	 UWSIvxpBtwEsWOeuBycf3IUi9ut+m9zYYqWDD9/CsUOqOjnXY0fDmYHIorVbZcAQwZ3Yi
	 h3r8vbOu1cTx17XbICzXouwri74u7ohCAVQy5vrOoZ7fB2RrXG7r3/YdHwjM4/MIzgWz3
	 Le1BlDbVMHMMG3fMcgUOJ7TSX7mdBumBnoswJWXdrMZQ2P8NG1h9E5itMO8H7Qgj2Pguo
	 UX5md555MZJOml4V/Miero8O29YgBUa/jmfRScZq76FoRkVIc5CGRKsXoOe1/f9Zjwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yCpDQ9WkrXKZMxTqAyMxj1pgluHTummJfoylPYQEKjs=;
	b=aTKjKQyg7Zzbg9N6GBonklETtJJlAqOQGxscaF2BS2lAg6H1omGAexMFZneBt7JB6D4s
	 mpLxtKIpoQiYAvH0sGLx7K3a6J/x/BmkAr2qbujebXsgbI2l/so29aEZ8xRvag+hGwz0n
	 u8toEuNvxdsKHHD9M45GBPBTBZHceapvsJV+FLS3Q/KsXM4K40pz4wKmk9VAlPZUt8K9a
	 +cjd7s9FcLYXHh0g7NgdGPxFt52d6ofYXan42XKcVq4msX+d3GJ7+uogZBGtA5pmHdAAD
	 rn/68gK57chOZZa22YkNo8WkV2VEZ6JYnSA6ZeHrD9KxprSLtIBLgwGMRJPVuu25EzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bLMS1MgL;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAE4606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FAE4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bLMS1MgL
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso2951292a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551624; x=1794156424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCpDQ9WkrXKZMxTqAyMxj1pgluHTummJfoylPYQEKjs=;
        b=bLMS1MgL33QmYJJZIpB4ajm+NZ+eU6AmPNtEFyOZBbZNN7BZa1Yu29rZnVHcF7n1IY
         EZ1b/nOWDaFwrJ69PnnvvS5Rr4eSaHM0cIuql4cr8BUTxtOT6py1mUGBu92y+XBlBUJt
         8ZO7RdkY25PlK7SgiG8y9wgXDY9kx+onmRcTynIkvDCedq0mzazX048IOYd1IHVvgBze
         1pvDzFVKQbvbHDW6S/FCI25uv5G/0NjM3jWXvyz8jB4eAdzw9+l0OuoXx7xPC+8A0m7S
         mBprsTHYaO6n0igll1j6jlqWCXlrsjweaZGlKkjLdK583BnS9n4i/zrfB2oDeBwUzRad
         kwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551624; x=1794156424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCpDQ9WkrXKZMxTqAyMxj1pgluHTummJfoylPYQEKjs=;
        b=beU3FBhnoMNWrGVEhxpiLMCubqZ9NBUUmmW6Le02tBdUAY1P+UO6FePuzTjtnSz5RL
         S6DxYIPxC+mxe+BCPe/SCqo3k3MfgrDjqcVLhjlzFX0tJwrUo+8KBrcfIyZNWi0G1VeN
         XWbTGZx17PgLvvVCOF3x6kkRfzxaFYvlmD1hCckfS/w2ftOILPGHVewwblko3imvgVBf
         WCGuA0AsyNQAsDE9xARtmt00vlOGZmhW9/6+KSlVDIxZsq7+LuWUq4nZzGBS/Rl4/JOe
         R4ZM5lg3isQtXgee58ExEuk7QgyM2EfOVWPRbuG73srqb/dn3DUtG8C28365g0Ek6TSN
         Pqyw==
X-Forwarded-Encrypted: i=1; AKwUvBy2Y2EzOJF6CetEZE08iydgS6sS470q27g2uLdu+HJ1Qlqw8pcINTxkWafao7gqWjWyoqB5NORjNvLN744=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A8vuclwpO8b6wYhazaI7seBGX5OXsErnzhtSK4u5utzachPTc
	cN1pt1r2+3BO13SZRAvKqpRLTCMkRaVKoRyObXOYQ+de6mQN8sDYpVkM04k4JsMpHg==
X-Gm-Gg: AYBFou0hv1IBz7+re3of3R52wp4YsLecGgSAgG+lYA2faey9AvNjfhqP6/PY2whsm4U
	QpQcp67doYZetQVGOD09jbKoMCMVhgElJSzFjhRnCMZKBMwDAbc9C3B0mXH5UmMwb1nh+yz6Pc/
	2oZ42b5xtMwt5ZOh7d33ntFR8blaG55PzXF/RSgrtIMWuxgPbuk/7jPb5NpGf4OxF16R+5vN3NY
	g1c/L3R9vFdWM7ecNidW6r4C9RBdlp0pyFAT7NTJL9c7MtTbmE5iM45OgumWE1PgdLjh2cx4ymL
	lgAGrPivGKzB3p//lcmogOhw/U51FZ0thE6WZGwZrPMtrPaHLSFOAgSeEzTdMzEp3pp/hMGx9ex
	0sMXxjJylSivLUfpfDP9coWq5zVYh8EGmBGvZIIcn5Xta9c7YUjJXiqBypxDOdofFHAqQ4iT8LK
	GcQgiaqAgygZCqMY/lOzuxjPOyht8pS0Xye8PvcRQsPCfDuIdhpEcNIcOywJd4EdtQcvkqW6Zov
	JUUZPTBVv2BRFdhQJpuZvLsq0Op5vEFz5W2qA/xshYSmri40+Gb1ZULfkqb042n17WmpW04P6c0
	qGFTxphc/iK4SKRbsr8HnoPiHDY3AyXxQ9pqKbVy9VlvB6ol/bO9Oa8KTllf+SuwWGAWlA05iHK
	3PD3r4ITC1nUFhoDMWtyWI+90pim0PrW0o2btt9yCRkh5OD2beBiayuVKOoG3Nqlk3D67a6uL1S
	Pi6McYSb3cXsA5bQYJ1OKQD18g+cjKMr7bVq5UBrm4VvcuvQCj9oDlZwkk6fIhM222VDm8XrBSA
	YbTL30mmLkwYSaM33GznDNP3WABBDSm3loqTJPOP1IHvnjrigkvJWtOzdMNNaxCEGWKuzeAHQ6L
	J4pMJLAzCnSgPvmSX4z/
X-Received: by 2002:aa7:d0d9:0:b0:6ac:5c83:bb9f with SMTP id 4fb4d7f45d1cf-6b4d46766e2mr3892238a12.9.1793551623964;
        Sun, 01 Nov 2026 08:47:03 -0800 (PST)
Received: from Desktop (p54aff790.dip0.t-ipconnect.de. [84.175.247.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm2371052a12.26.2026.11.01.08.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:47:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 3/4] ipmr: set up GSO state for tunnel vifs
Date: Sun,  1 Nov 2026 17:47:03 +0100
Message-ID: <20261101164703.302017-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179241582899.3135.13813714752467284187@kernel.org>
References: <179241582899.3135.13813714752467284187@kernel.org>
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

> What happens here if the GSO skb already has skb->encapsulation set?
[ ... ]
> Would it make sense to segment in software, or reject, GSO skbs that
> already have skb->encapsulation set before calling
> iptunnel_handle_offloads()?

Agreed. v4 drops such a packet in ip_encap() before touching its GSO
state. It was dropped in ipip_gso_segment() before this series as well,
so a GRE or VXLAN aggregate sent to a tunnel vif behaves as it did, and
the inner headers of its own tunnel stay intact for the other vifs.

> Should this use iph_set_totlen(iph, skb->len) instead?

Agreed, fixed in v4.

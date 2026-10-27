Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136452;
	b=Ehz9VHnQRyvZPMWD4HlkGjc39SIyzIVc0jpKmRNUFELfLlitpAUywPKdGU4t64WVbOFL
	 3N0IoJUDlQtX8Zv039nl8QxwLZ8wWJe/oQxOFVIH49OT12VKRq30JFPPQ9tzZ7vDB95n6
	 4Q9U9BB1kWHAMcIrzf0dN9E4Ejppicuq2w7/y0VQMxj7N/F24W2RJUWM85H/Mx+6kuiRi
	 3xhoUFozguZ/5SEyoKKpiFdaBb3FQtThFHFoX2L39R85BoqZfHdHj0qQu1lkS0/ZljjHn
	 auYo3krR7Wz2Ftj1b6EAZd1GVA69VoWzTUoHahvcoXrn/Tyoyb+KROETTz6ptKqa86A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zmfjQ+QJFoW1j+qRFoligu6O+sZZbd+7UWwEUgPrfjk=;
	b=nQFwGyyIGdYiCa5SOHTqp2pkrdYsyGE0sDTjT4A/lZSf1R5R5PpFemxC7kmwyzAmj4BX
	 6Gpp+4Au0bu2b21kBCtuFQiw6BFj3iUEwlIfgfWuKkM4kMSLmdPGGZKiXI7QofHssvskp
	 1UY8p+YkU2HfxIh/iSgMrritbb295Ambw4sDJtKTiaLvlj2xZOZI+ZJ92k/BtM46rbjh6
	 nQt4WRvt80sBM2P4lUaIGzrjSApSnVOBX2YATdBM1OnwvJun/NsVoz0vbiAq1m6jShC70
	 eU/IR8rHbdmXzC04CK4gr+6g2S7LK3U//efvBU6xmMGCWmmAgr+iNEuiFsiebG5uE2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBsaAymq;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE769606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE769606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBsaAymq
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so344095e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136450; x=1793741250; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zmfjQ+QJFoW1j+qRFoligu6O+sZZbd+7UWwEUgPrfjk=;
        b=HBsaAymqvQ6e3C208Z9epw6vz5FpkGs2UPqRvGkcy7eeT8xedN4cMAjHC389rdsTp9
         0ulWpDKH8JyQJhAzOmpR4u4IPYt9w+s09bGYW65H1hL1H5349sFtUf2cZKLA+rLzCJJb
         rHvT820FBKpXmgX6vd3Avr2PUb9ETGrcpQZsdXR1YF1Us2uN9mlmggnSVAk0RebLwjfg
         7flLpT2gMoFS6t7vhwQqTzI2BAAERs/Q2C/hJLn1sDd8oGWIa8c4xVhT5mKUKbVj//MB
         m+p4dr/juATYVk6KgVJxCQctQY/ODmt9F272gk7sQ4fxrxtaMcJ2zlBjbW8Q7JT+RYmm
         lnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136450; x=1793741250;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmfjQ+QJFoW1j+qRFoligu6O+sZZbd+7UWwEUgPrfjk=;
        b=khRHl3XwkQU1uOnwkkqZLyDq0Sc9P9dFsMBNKKpVz6Y7kzB4Lbc3XYCWg1jNJc6wOa
         mx5It79P6Vzm5gi+KBamBHw6833c8pYgtscqSgVSmv+sCthrJNbE0KpY0UDDZFWl14F1
         tzuJjGRPz0UDhlTPQv4MxPmeT8lsTOb6x+WicU+N40ssb7C2GqI3vdLkDjnTPejxh6rm
         0JG/sI6Hc3y50/g05F57CX8R1OVtzD+AofajLpS8PEopMKNyZymrO4FF+gkHKNzkY7Qr
         IbqLrUSgxaU00L0ZBajWcheG9ofd1RIS0sTLp7qUWg32dmIP8C8UyQMfdDN6sNhWkHnU
         qZOg==
X-Forwarded-Encrypted: i=1; AKwUvBwsb5w8wgsycqeKIsCtHXw9/PJoZa+IVXniw5pZJ+2TaRU8R6PosJMEwcKNFBAL24xdtUIcNVFcayT/eww=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0fp+zKdSCNExORulsCDuT+6Vlrcz7uXclmYaSIYxZn+FN30tS
	k0H6arFO3ZB088GjN5jlULtkRgZqbB6snJeow/7/ITQK4crUQqc8UIG1
X-Gm-Gg: AYBFou3V3hdfZ08ifwR45NQGJ6HEJoGfHvJCh+la6tONvlsWxNeJA1SzHHXZ4EeTlbz
	009ojp+4Bi9aUNhnCEaqOcK59M38UsQZeBIjsv4YQ+D7YKoTkNW+r/i37GbNCE4bK5dDfdQ7zBc
	eo2DwQW8poKZlS0SOHyvgKUDyAMJlAMQhqqlvZYjGuzjh7koq4mCceAxAZXt4XY/FBTb0Hz82ah
	LqdMIVLSTc5EHIc2zLZqHdWg+JVHfR/1fWREeLBBUE0jABiuFYkGBaHorHS3biC0lzUQndVjgbZ
	W+Q1w28YaJVFTf5sRoEsXXcLCdu/T4lRUTbWvhB76crmUlZJjZ4rTK4D7q7PbNu/ofbDNzAiEse
	btbOokstptTHBiiDt5owDWREYejKmcIDOu7gS56ZV2o7tqjPl7+5nprXXwyjmZll3anYC/QWASM
	x195aYh5njRzDb9ReNjdyubvND6H1aFJB5Vy/B7CSL617IxcxAMv4qa7Y4z939/8A3wMSUHoqOx
	PqrENbJrG7h1UL6KD51S00TifRw1gAjvCsg+8jFlv7BmQ73uk+l1G4bB9kutUfVqPqckA9Jr/yy
	nC9tVr/iMpKeeSCl0qQRA0k/FqUVrX+uQIw3XC/2LJauJA==
X-Received: by 2002:a05:6122:3306:b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5ec4cc9d3d9mr258607e0c.21.1793136450614;
        Tue, 27 Oct 2026 14:27:30 -0700 (PDT)
Received: from 16.15.168.192.in-addr.arpa ([187.74.25.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec23067632sm12770415e0c.0.2026.10.27.14.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:27:29 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Boris Pismenny <borisp@nvidia.com>, Sabrina Dubroca <sd@queasysnail.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/mlx5e: macsec: free SC lookup entries after an
 RCU grace period
Date: Tue, 27 Oct 2026 18:27:19 -0300
Message-ID: <179313643925.89661.17416575088535677375@gmail.com>
In-Reply-To: <20261027142601.GM257209@horms.kernel.org>
References: <179285888829.90275.17386097105525068016@gmail.com>
 <20261027142601.GM257209@horms.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Oct 27, 2026 at 02:26:01PM +0000, Simon Horman wrote:
> This patch does not apply because the problem in macsec_del_rxsc_ctx() has
> already been addressed by ad17ad50b8dc ("net: mlx5e: Fix use-after-free of
> the MACsec xarray entry on RX SC deletion") using kfree_rcu.
>
> I would suggest taking that approach in macsec_fs_id_del() too
> unless there is a reason to use mightsleep.

Thanks Simon, I missed that ad17ad50b8dc had already landed. There is no
reason to use the mightsleep variant, so v2 drops the macsec.c hunk and
embeds an rcu_head in struct mlx5_fs_id so it can be freed with
kfree_rcu():

https://lore.kernel.org/all/179313582625.87630.11382992904624255106@gmail.com/

Joas

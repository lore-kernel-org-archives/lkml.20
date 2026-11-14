Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794686372;
	b=YVYtjZXNAgzgUAIOFi383ptf6egLjLsPhIor2meWBHn/uUXa/lm0qGmEIni9+z15/iS5
	 AWnrl5YQp8ZMeCN/46AMEBFeufEMhrVKSncfOT1HrxxjWFrWALFgWvxF71gcLy9BuUFUt
	 reBi3Ipx0u6rEpNkEcuxwYnKJhWCmepL7e4TJYTH+CMBv1sKrqPQcfUNCbPs4t8L4ZnJM
	 nmhQwzLmB95aFGXDhB5eVR86+v/Tud0ftft/DFdGOZGMJ5abhy0Rd/g+LcMfywqbnneMd
	 pJHfqCzRNEv8NjcMy2AQhONC1wmhWhbr72TPSW6ZhInzzPCeOn7tY9okY4QOQAs0YeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
	b=h+kLgg+PoL5bHDzjb+JdX65yNRI16Q1I4hHq2lspFmzAuqnj68h5tye7Hd4WfjlnK1D9
	 CgQqvmr6BHT8U6GmBolZbtLhp+lan1scqFmLk4IQX8LHtU30/vNdsTzQBugJyx18VJS74
	 66fy3cZLspLuo6TF7jKBXyJP9GvbC8HM1gApJzQ6H+rS8J6KfGIXNzHzHvE+uGtLCEgYM
	 vzquokdtSpkqHW6snCrFPaBnXkERJZMA9eY0dyirs5ckUfhHj6NVi2xipuun9GsRGon8X
	 DSsiLWHftPE5wE1ho1f54Kac1Df78MYbjk0ZKVWcumK2jOGzi37aVDD8qkQ/FIN/5Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Axa3Dmkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDB606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CDB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Axa3Dmkk
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8082af2ffso45423a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794686370; cv=none;
        d=google.com; s=arc-20260327;
        b=WaVRz7c/8dPHz+nmifV9dWYSkL546qJ0KE+hLSTPYsv11jvEsE55FTJE1NZzzWAkPh
         rV3f+9cFmo5cOPtIT3MhbUah0jvkTfzN8aSaEs0IGUmzFI0tK9XGV0ojRPuc2hr99KC+
         7Yv4/V8LGq7Hg1r8qaXwe5as8iqBdzF8pQJ6MbMKG3/2Fk0vIzrlOR4tJnCGkW4LL8rS
         vQIeQ63/Ih/ercvyHfD6OXAlPHFKR9S/tgBQHZL/ue8A1qv2Oz0Y0FCleh6Oqx+BnSgN
         3TClAJwErxTKLFEjM1ngc+vBtODJenpiUwRhO++Ua6H4IUb7cxJpmqrECgISpCWZmkmu
         htag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        fh=0gH7TJTdonLwfuaUai0digAdOp9D2jA6Dc1hDUo5VGc=;
        b=azGlOBN4S4X46EYeG6QDdQUJMs8gMowHEKzCF39KGu1ACo+CxtVTK17aEdyEpw/aAq
         CgVKexjn09Onul+isOwyQ1KAZaywZzzCzyQNWOkQcwFsBzsPFdPN9x38zjZhfXxOEvYC
         4sXyE8sZT676magW1L5/LBcEYAUwGzJ50qeF/Waz7+j/yJG0mQO6I/QEE+RTJJ5uF//D
         VC0VgSFrdgZyRChna7e5QtP6UaN6gcC3U5XdWQ4x8DjLaNtWFWl/s7GOqs53YAyj8WmO
         ZDHWIaJk2hID38GaYq4w/Aj+USOlPKWrZU5/+enN0B+IOAew5iDeLJocHzzww1cyBnEJ
         d/Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686370; x=1795291170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        b=Axa3DmkkoslFogfdNXB/3Y6s5zTqnqdgrbeuW6Z4aVIs39yyJmN1YHx02WcezqfyAB
         2x2+nB7mKedd1PBkymSJHTG0mW68fcOV5u9d+qSORJ1Csl/vIB2eeEAgByLx5U/FpX/B
         bzhRD2CFO5JuZilDu0J2hxZnpbklilA7OtyZDDMu7PIQsnT1m8BV41/J0AGtGHOlG2/Q
         OYl98C5KJhk5iA4bGScFPEiOMJ7T+3fsEyMuUJKw3yucTYFOyOs+Awy0S8LXee3BhGaO
         6pcMzI5mX8vMHQPL5eRgse+NCDT8Fe4vJc3KqYgWb5SIZEY76MSoh7V6AMqkctKsH4W5
         Xn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686370; x=1795291170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        b=z9Yeq7KK34B+3SQdmE6Kgil9JPVWjbDkckmkhq63Qhv/AjYlek0+aihZersCKjd0xC
         c9pBRQnxtTPsHqURRLIXrw0Zz85f8IDjAlODKMkH2LaNwCbvgH4Se7Y2oMEl+C1GFrDL
         jsgcxZDDKY7nRsffYoA0IE0D3rmvynsmRB5mQEUpQ+w8GEk72r7/jZFydGG/Shg0iFcR
         vtNElb+wraAgabHiVEd/Akf6a2YcF7Qj8UPFy4UzghdM6SlbxNFijSBB/R9bXThdLaGX
         8UWj6uS/H6uP9nksh9CgIA09OSSbOI3Cq2Cl7AIBfHXsG2tRgA2zKxLWi3LsLL852Gdc
         RTlg==
X-Forwarded-Encrypted: i=1; AL+hErEUY0ixOlPG/3vzK6ENuDOuZ/Ht5g7VHN5Fht2n9LlCE1JyujlygYjTHR7EOnDOZMXHQd0qSc5PBtAZDqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hpUVmNeAwYCGPrZx1DEAMFsMN6tvIhZ733D0kCJmAqLhM+667
	5fOLvjJv5SDa7dYRdz7uQaTQGC+ym10SGdO3VMjdWfwQ2cki2vkjOwVy8APv+si66ZcetXxUyku
	d4yO2A+DoOrY5yXd09UFSyMyy3naNzps=
X-Gm-Gg: AYBFou0lq+eon7DjXlYElpJdiX20iESp/bLXWs3aMsbzlwnELnwYHn/xVzlqQm9XGTh
	gVWXhwr+T99jFxHufR0jNdUgtOink1M5w8uJ2wCbezxJYVjXjkV13m1fpi6VQQpMsx860oW/amF
	5PUrMiUTuDWoS88VAoyzkaHu4KbU0BUEMZOABECPzn+lgSy3y0Xu6TPkPy9JffPrWKq78uAmtK6
	anRzslhN+H5qyXn+oy5kGmK0EEe1dM+xuUln9mI6RX99dJS/bbgIRztKfotnC6IljxAB4saCKqU
	imyUEazqfH9VxLLuyX+ZnoNNaBCai6N/p6FmTysGph5nRZSWVM59m4rvuFN4O3yQppXS9PqIqK2
	YgjQfC++TtLxeTuyjvh0OsCjknX8NUnzwLzti
X-Received: by 2002:a17:907:c05:b0:c2e:378c:8ce3 with SMTP id
 a640c23a62f3a-c509634a522mr529891766b.32.1794686370262; Sat, 14 Nov 2026
 11:59:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-4-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-4-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 16:59:17 -0300
X-Gm-Features: AclHuK9tTdMaPCT4_EVDhr5kykymtyOgjut6ABk__VuqEE-znXptrRsUfuy9rmU
Message-ID: <CAJq09z5=CiYX18kSjM+n1LLe38hPODiPpemYLPyWtumETmKY+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/10] net: ieee8021q: add tt_to_pcp()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Add ieee8021q_tt_to_pcp(), the inverse of ieee8021q_pcp_to_tt(): it
> encodes an 802.1Q traffic type back to its Priority Code Point, and
> completes the pcp/tt helper family.
>
> A driver that reseeds its PCP classifier through ieee8021q_pcp_to_tt()
> stores traffic types in the hardware tables, while the dcbnl priority
> ops exchange 802.1p priorities across the DSA boundary. Reading such a
> table back therefore needs the reverse mapping to restore the 802.1p
> value, which no existing helper provides. Because pcp_to_tt only
> transposes Best Effort and Background and is the identity elsewhere the
> two directions are numerically equal; provide tt_to_pcp as its own named
> function so the read path does not decode a traffic type as if it were a
> PCP.
>
> The first user is the Realtek rtl8365mb DSA driver, whose dcbnl
> get_default_prio and get_dscp_prio paths read back traffic types and
> must return 802.1p priorities.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - look the PCP up in the pcp_to_tt() table instead of a switch, so the
>   two helpers cannot disagree (Luiz)
> - check at build time that the table has one entry per traffic type
> - kernel-doc: cite the encoding table, Table 6-2 (6.9.3), not the
>   decoding Table I-7, and name the IEEE 802.1Q-2022 edition
> - kernel-doc: refer to the enum doc for the Best Effort/Background
>   order, and document each return value, including the stub's
> - keep Linus's Reviewed-by: the mapping is unchanged

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

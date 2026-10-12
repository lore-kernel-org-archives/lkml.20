Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCC542376F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841681; cv=none; b=Tuh3c/ei36CP1NeY82xs20sZW+Tgkv5blVoIwQOEnHT75RVEg0amIpeG+2FUMk3b2+Tg5dIEBW4JG/CuCci9ln5TstSyUFbatTicQ2bz+Ob3HC2LW1CZ9JvEkS+MCsu4nIWyq0lYDoB1f9z01M/A89dq/R7fVopDAc80r6CFjjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841681; c=relaxed/simple;
	bh=ktj/+d9kmr9heuPWAC5SUXsfJCR9H6zAT5QW6YLTp3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAFVpEw9P6xq6x/B2M1K0wPe7rhR4QSEGwFZjEeUUaZaUDOh1P+nEkK9dSUgFyqXY2Q9OFLR7GlXWHpIRzNsM8uTx8ivvE0O/FUR7gzkJ3VMtoN8cZRK/JA03gTUfErT7PEgMgxN5N9Cr+EB81fImeamCYjPsvuts+uRSiEdf7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=yPaKbLUr; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="yPaKbLUr"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35aca4e7547so1060527eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791841678; x=1792446478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktj/+d9kmr9heuPWAC5SUXsfJCR9H6zAT5QW6YLTp3k=;
        b=yPaKbLUrZT0oyby6vP8Py/OMNg6p06984cgIySQs7ZAqX9hQVnyDQGYJS8IjBTkfg2
         eS525YF5bkvlgqRiStTcy0IdijGICJtOQw1/NVju7ARkZLYh1eKPfqlhxf7G7+8kheUP
         V4eoju7cvvg8cviY3AGiL6rLqHHV5EusX2FuUaPF1yRgjT/46ANOu7ELLRWupajkxjnp
         2+XTGyWrdzAnOQQQIo/UapJSUU8sBCD8csAj7SnGXP6tpmvBxJ995JZwgwqldz609+/B
         tvVTYkuvDXPguertYbOq6TgqgcsxBw8p8SPEN1XjuFgmtlgpLmua9ckfrzy1H8SSecnb
         bhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841678; x=1792446478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktj/+d9kmr9heuPWAC5SUXsfJCR9H6zAT5QW6YLTp3k=;
        b=Yv7OuzLUevT968Q8WvAUY6RTy1y6jK+FmUClJOJU+uKA5tGqPIbtO5fgRDnJx+Zxbr
         TYiOT6TLf/qgjXFelN8wpdBAoICozVe4S2VExIkbEjl9vdrR6daHpH0OOs1MrO3keKVv
         VFTQWMFnWzeSQai6/fCqpPEd3+yQIP0PGtTBobZ6zyzYHOV1NeEimS7uT6ahYn3AITtv
         J/K+xqwnyzAfkiRvnkqACi/d6U/lnDFItW2TS1qYKl2cjAzkZpumzlZm6JDCjJQ85dLE
         7NJkJhQOLYccrrnFB72j7VI3qcboxKwIYOpaIJkrlOX25PJq1Rv3ZJhFDGlsS9s2rc7B
         EQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrxiF+YlD96IIsrk6HTXJY196iCS1hHEDSbmPKjKlb07duiJXsIEG395DoiUjBlNK+nIGJH9UY4JGojtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/tzAQjNVFABeQLthfrMPByDyVtDlDxLWfCDSrew02YqzmuuEL
	+YGRPlCHykePR1QxwBQsQaFNVM6ReBv4VAuXBe8NHoWUJsLX2LYIFe4BKup4tNRkWaw=
X-Gm-Gg: AYBFou3Mlh0bCyyrgMdXBxjyt3L80Mw0JfF/42mIQ+it1u65HX8bRtp+W64YqRBtozZ
	K8PyINQwtJogknfNjDJuMtRqY50W5TRseJu2jvegEwcamzeL4BA2igYt7L1LmpXhSUOQZSLJJn2
	A5cjchbozOZyQZTLOZnS4TrM2z1V5onCfJgwcGP6WZRNH2KdukR27qQ/z+3qbmdrr1/oKc/Gfw1
	e/wcR4aSZalVAx20bbwfD5RuL/srsTscQ0ofwI+cosmjZuSl5Q3CkjT6NSbJUxhZasPdyu+2l5I
	Q7vybHyVOPhOiDtMoZBll0S9GVxLryC6OKqDLczbqxeAp6y5YVf4FaBeBjXxo41GDqkI1kJHDQM
	7ssZIGjVjGw7PlPokZyM/h17au67vCjd2nSL1yJgck3oBMisRQoq4nDiOhxNykfkq/u8ngqQrux
	aD4GqzhbvK5mIRTmwnWCSgVlAnlW8uwOxf14yGcL06HSI5PflNL5k86BKZhpbBeewuHTKgyn0Nz
	h3cFXSjihjvq5Gw9Q3U6M9JivbcuPdyX1GrgvMCEtvQxOmtjYhiapNoy2K9b/1H
X-Received: by 2002:a05:7300:b293:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3537deccb0fmr15103050eec.4.1791841675412;
        Mon, 12 Oct 2026 14:47:55 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm48900150eec.9.2026.10.12.14.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:47:54 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v3 0/6] amt: relay tunnel lifetime, validation and request-path hardening
Date: Mon, 12 Oct 2026 21:47:51 +0000
Message-ID: <20261012214751.3723472-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125943.558629-1-omar@blockcast.net>
References: <20261012125943.558629-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. 4/6-6/6 are carried over from v2, where the same question was
answered [1]. 1/6-3/6 are new in v3, so per patch:

1/6 (gc_wq re-arm use-after-free): theoretical. The Sashiko review of v2
pointed it out, and reading amt_update_handler() against
amt_tunnel_expire() and amt_dev_stop() confirms it. It needs a Membership
Update that has already found the tunnel under RCU to arrive while
amt_tunnel_expire() is freeing that tunnel. I have not triggered it, so
there is no trace to attach. After the patch the Update path no longer
touches gc_wq, so it cannot re-arm a tunnel that is being freed.

2/6 (Query or Data from 0.0.0.0): theoretical, found by inspection while
writing the IPv6 receive path in the net-next series [2]. Sashiko's review
of that series asked for the IPv4 part to be split out for net. While
remote_ip is still 0, "saddr != remote_ip" is false for a 0.0.0.0 source,
so a 0.0.0.0 -> 255.255.255.255 broadcast reaching the socket is accepted.
Not observed.

3/6 (IPv6 literal in an IPv4 attribute): triggered, while writing the IPv6
selftest. An iproute2 without the IPv6 attributes puts all 16 bytes of
"discovery 2001:db8:a::2" into IFLA_AMT_DISCOVERY_IP. On a stock kernel
the command exited 0 with no error or warning, and the device came up as
an IPv4 gateway with discovery address 32.1.13.184, the first four bytes.
There is no oops or trace: the symptom is the silently wrong address,
which the selftest's capability probe was fooled by and now checks for.
With the patch the attribute is refused with an extack.

Fix testing is in the cover letter: W=1 clean, a KASAN + lockdep +
PROVE_RCU boot running the amt selftests with no splat, and amt.sh with
max_tunnels 1.

[1] https://lore.kernel.org/netdev/20261009213749.2226283-1-omar@blockcast.net/
[2] https://lore.kernel.org/netdev/20261009122426.551178-1-omar@blockcast.net/

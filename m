Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AAA2AEEB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936020; cv=pass; b=JhZGmRUXZpOWhH/6iEPdaaIGE2Mz0Bbb75bHCFD89L5egQZgCiwihcgjaLm9qpl7/pqaKPjG3/nNdUl2h1pq87zXNao/DsYQbmOJl+mPtmSPBLj3KFwJNlEcVx5tPEORkDXPRLPDJbFAMF4SVOBseIhcrCtyv5bJMeGxLTgOxT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936020; c=relaxed/simple;
	bh=R31dQDnJ53ap5GeH4hbi3ZM97krFZBGuCEodpNOsenA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHkR01AGRcxHwXkrB4srdVIE83QjxL4ShfvchrQyYVvVEaL+9A1sX1Qqz1vmuTKuaa8Fue5abr1U+bOZRKItHrnly9/FgmP6x2qHSvipgpPrvZzSHH/QCLIbGGdoEYWiqgRZ1pX2WYo6lpFu61dbinLONyDSv4LepK5koc9Kgtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzoImABX; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzoImABX"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba437ee7f7so1692852e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936016; cv=none;
        d=google.com; s=arc-20260327;
        b=DTLak6V3oInLTX1yzPBRSWITf0zfoIsE0xupd+l3+L6uAwOm+chZIWIHNyHAgBtz9G
         /N8lfOoRL/WKN+bFdagScPsJH/uvYLi2Up4uOKNoQ0wRVRQOs9C/P+4Z+UiTnPPcyFnW
         sYfkAMw9qf6eLa0WmI9kuXMTSHrQTnMlgX1FfjaH9cgnZaSwKzfgcXVqyQvafyoNWIb+
         GJhmysva0GVwdVJTa8qKyLPtgQNF97WirE40Zr0TWOrWMgHTKI4QmmdgNpcGIb8LYesG
         b287of6LcDh1iWK7M9A6cGdej7oWhJtghlmNQJowXdmP6n30fxXFTpTHysF3UrLF0jmr
         xKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        fh=0Of0IqA6mTzRhCljKNwNGhd6YYzrQOk0tZTXI9esQ9c=;
        b=GHJoIGtv5Fm0GbzRLU0GO3MwTWJ6eEcbk8700gasKS6Dq1xVjkCXcmUY3lZ+wJLy6R
         Pfb9J/RWuGrFQtf+9iTmd7gC6CHIO0ISqYBYYzyiZqYDEGkn68yDwUPvgA390p7aOUtB
         UDHzX8n9ReZhu3iXM9LmvwcgJdjdmzGsoGOVrq5aYWFY12DdBMmk14rTl4Rp2Dqnj0M/
         P7OXnGFYARpmX8HDVjHqWBvammIuVGCPoH6EnzKWpS7kWcJ678Kh987KKQ5bycWDKm3K
         JMHn+8EW9jAXW3nk4Cw2EAsi9y7UDN9s/gNvz1dNeck52Y+Zq+RuY1wHU+uy1acMwfoq
         Ajxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936016; x=1791540816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        b=dzoImABXSK2Gn5sUjxkaIb3Ut06JZ5GtduYxFB+DlVlZxUZXLMXBxKtl9w5wb8jKmN
         869QAukK38CFKwy5AW1Wl/eSoSBulkQ9FYMFHJPXX65uanH6t15vx8mYbkA2Rp2+ETQc
         91gou23YDlaZVvHG9ZnL2ad6tnx7JY29xRZ+wMVqo6syg6pc5xswPPskxc/p7WiI/HwM
         5oHGaMz9xGzb5IvxIpqM205iFpKjvQ2fPi1oYxKrsI6Q2IeerGYiXYF5Lm1fjAPsQHiW
         dVT/sBCTxzfQu4ULOo9wOWQgSUGEy+aaADXdcPdak0rAqz5Vu/qZkvHos4pdlou5Jj8l
         KxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936016; x=1791540816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtQs44M5gzBLsCq+UUJQkpTtJc7hzbbbWNdnDCJs0yY=;
        b=lc/ZaQl1cc7qnePDP8BfROJkROE2m2W9+b3U6gQ5PvbUjA+TqxP66rfxTixoEdCqK7
         BdBgGTeTE6053ib8ZbQrikrEBN2sfoz/wBplaVK9Isw0QCqjREoLVglXXJYHPmPfwmcw
         bDli7/ElBCkisynlVdIdiIo+PS36/qUFdsKKAp7ifNi1J3K41qa2ervDiFub/qKCGzps
         QjFdDOChc4N0SPE9Kid8SI4wx6i8WrVsIEVyrnz4HFuz4LKvN8il2dGjB4FlhMQ8Ktub
         knHYzVljNpRXPXG7QWRAE7MdxMghbHhvi/aQF3HUg5v5kyU2iDja6BRhJtZDOGAMwa+3
         KdsQ==
X-Forwarded-Encrypted: i=1; AKwUvBymT3LrsCwtpDqUPobNIFMaZYM0KpZyX9ZBvDkarHGQetbrB+BkszlIDUiSl+E5CacbTuoBAbdoiRpXeEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtk8yMFYOJoCxrgTQjEOTufKyCrXPAWN3ku3djJ731AYrJls/V
	dyW/tDBZnxtZ2CHMFPlDhWZ5MhbdyUAUg3GGFoRfknghL19In5vfBSHrG4bnqQJmC9nMk/VGNSQ
	X4+80QhXckookWcwQdLvUptR69oiaJaA=
X-Gm-Gg: AYBFou0278aKJ5cnZHbYKSX1QVU908/zbjWsU4ytht3JfVzjDblZ716PyZMt46Gkb/W
	3ixg/X52BHSciCAtAVYCRLaHr66/BmT5hU+hCNQJPFAB7Pk41sp3+6Mi/bPdMK+hX8IFylt5inc
	wnQFU39B3QhTzs2We+7PPZwt+KNZ1w1YoR77i2lGskwhCG4e1U4s4VmGdyaKjt5eMC5UUaE6/Bo
	ZctvKxYYbrVMylr9PKL5Mo6QegaZD3wMvCrMvvo6woIT7sfoS4BCan8fkFCTpTDAXkC5FUardKs
	q+mJadWCX5dSruTUOpyfhA+cbFk+B5naa7l7s01GRRuUunbsEU3l/rPhgvkwHCsIGtCFBmg78At
	TmfCEfY/DLs0=
X-Received: by 2002:a05:6512:2346:b0:5ba:3888:705b with SMTP id
 2adb3069b0e04-5bb9bb22cb8mr661934e87.54.1790936016247; Fri, 02 Oct 2026
 03:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-6-sigefriedhyy@gmail.com> <179089748368.434549.14167408771777474746@kernel.org>
In-Reply-To: <179089748368.434549.14167408771777474746@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:13:25 +0900
X-Gm-Features: AclHuK9nykm4Rn1HobyHFdYa8n2y3hHFC_CiwY1QwI6PRZQntiimuWrJxRLpDDc
Message-ID: <CA+7S2vJCT+PzSvFtmL9disx8t8nAMZvEMULcL=97v4p6MDyPcw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 5/6] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] The patch adds `target-netnsid` to the getmulticast dump request
>   with no condition, and writes doc text on which request semantics=E2=80=
=A6

Fair, will mention target-netnsid in that sentence if there is a v10.

> - [Low] In Documentation/netlink/specs/rt-addr.yaml, the getmulticast
>   operation still has a `do` section, and its doc still starts with "Get=
=E2=80=A6

Pre-existing issue.

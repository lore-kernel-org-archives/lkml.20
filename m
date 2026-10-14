Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8456853F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001969; cv=none; b=gCpjyxwrPf3LvE+FtoExYisuHnVsvaTvDe/eeGbaRVj59FY/mLJggYE9CgMv3O26JrpR5gA6ecoZA7tbDTtwwnGQWqCqNxmcwaHKwG19P/yjgzHLic5/C9jAqyWTFAumvBNENtTvTZHi8Vw0tcTiyyA1U49lyXoYCjkV5qCL7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001969; c=relaxed/simple;
	bh=xLy4bwJA3p4oGwSxkOP7algz00ABvvlb2hL7FQ0tbXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEBZ0uZaSVDZLFQCA6NsBV5FD051X9JZenj4E8lptBQpdEZjkBHjcl4lMySK3bA1wtTtYotkjDi47fP3MvC1wqQXeJr9GLpnvLBlDtRhTcB7+9IqkTrWRWb1RwnGyzjFqwAbF6gEisPe85fj4YFKGTesiB0JE8KtQ55w+FAtL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=mcxCiTw4; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="mcxCiTw4"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a64f28d0so84255616d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792001967; x=1792606767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7wsO3zLWdRB4GlI02kHERXU64Q1Nav35BL5ro5gRHk=;
        b=mcxCiTw4lZJIh8U/OXoB6J70gl5U4J2msmzGl7f4VpgSa4sFZb2o+FzALZjjUAC0Ng
         Dy8VvO5LTI32n46fuv1RfgQ9Zkv2rv3SFX3o/m9O7OhKnePyftas/KdC7zytsgpJh4xJ
         ci2OI8Gy0Jwz4wExAWokrjz3PXfDwTsHdAEmDHpDBmheddrni//eLjLBHY1lPVDvnh4N
         TtsKzcF/WE7VMKVA7tdwO//4VSaNqC4GTlIl/tjOBX/uOzsTbanWVGX6iSrQ3JZ/0OsZ
         495mYKhcx45g8VLDctwl3rnIkhbi2Qb3JON5fBw9wllPBl2J2XWDlmVaIgMVD1V8KsiP
         YkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001967; x=1792606767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7wsO3zLWdRB4GlI02kHERXU64Q1Nav35BL5ro5gRHk=;
        b=W54QFBCjDyJ+nHpapYEfB255buLWTmSJHXWNrhiLRxL11M271oQTIY822zMtq5uSKL
         /2Yr73Q8VjRbhf2StI7Ep1UDAP1A/I2WsZW5Kl4wXkcsNkhiq20OBOH7k5kY57yo+EMh
         WIvtfwZe8KChO9KLW1/pHNoQdfmTvPpYGD0b+RLsirIRzlxvxAP3yCDeZ7QQShefyY4j
         WmUtdGbcDB6qBYBZ7Mw1OMjM6zBUvUVEgw2dNiEzEEKupTiSQhet7fRSaLCXn/pN9BcC
         IZyiz+zP8A1X4+VhKb3EfNqbSjKwl4ozLW4UGvWl5H4o23ic3oCHBbALDOi5bm/ogAxr
         8b+w==
X-Forwarded-Encrypted: i=1; AKwUvBzPgMA988vLV4/lk/Lg0S5zoSe1hsMu8XjhQPNqLLQsP12BbHpZ6s1z7nYZhaT1/3yTUAIQ0DKjlvcPXf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYInhQ25qMOA8h8X+pLWtEBiWI3kkiVcWPoBJVzNIXDNaGxUHkuU
	Xs9UMwh9WGwko2b11YI5OSNnwA1bzkAoBKj5Zd8T9LjGnzdPLSiC2mnfLZ+WdNbrPV8=
X-Gm-Gg: AYBFou0bJDVzuOO5wL05oMGBI8PMLD9H88aafS25c4WvLgpWZfT1z62K5MM9h0d5kW8
	zG/92Y9I80iNBPkvT/Roj6OTVg0QT610JKLohmDuGmr46fFDbYxLAEtXtsEDCNvpPqT9QXBPP1R
	HOe03iKVrHE7DX+Wa0JfNwoyj/CDWn5PRy8FT1GixtpF9C8xUi1Wf8O0fQUJ+t+uRsR8PLKbn/m
	YusROdaYL7LkQvXVp/48QmCE1rrZDaNhZIEXlkauxiiPfwiETI64zP3iWFTc1AAV1oekKHy0Eju
	ny1a+2dTVODZgbiqYutJi2KzdiT8pFAA6QH2nIRf7cESOaviVYR0DB+LfA3ew218sd/EBSdfZT1
	+pm7Wc6GyoWcODWibaJZtQVq8PUDyPxX4DVfqwXWkQd9ucJk0Xh9g1+8K+Ob4JdiE6t1Q4u095Q
	sflD+k4mkqFmb1YXl9GTaSFZZBk5X5W0tpdpFKy7GwZuow1Cpuqn2rQbvn5YSkXucU5k5y5pKPt
	bDRKK+hoL/Y5ww=
X-Received: by 2002:a05:620a:2728:b0:93d:23d5:32fd with SMTP id af79cd13be357-93ec1499888mr2303090585a.27.1792001967385;
        Wed, 14 Oct 2026 11:19:27 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508205csm553393285a.35.2026.10.14.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:19:26 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits() report
 unreadable frags
Date: Wed, 14 Oct 2026 18:17:01 +0000
Message-ID: <179200182107330.2.7762063370688204320@toxicpanda.com>
In-Reply-To: <179199883858343.2.17884063473154560573@toxicpanda.com>
References: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
 <20261014135154.05de968e@pumpkin>
 <179198668564919.2.10323410751655182155@toxicpanda.com>
 <20261014173042.0a74a25d@pumpkin>
 <CAEzrpqd9Pna32K8i5Ug3tP+ZiRa7-0GmyX+sn=OwbZ_3osEAsQ@mail.gmail.com>
 <179199883858343.2.17884063473154560573@toxicpanda.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, Oct 14, 2026 at 05:27:18PM +0000, Josef Bacik wrote:
> So 0 can't mean failure here without changing checksums, and v3 will
> keep the explicit error return from v2.

Scratch the v3.  With the code staying the same, all it would add is the
reproduction details from my reply to netdev-bot, and v2 still applies
cleanly to net.  So v2 is the version to take as is.

Thanks,
Josef

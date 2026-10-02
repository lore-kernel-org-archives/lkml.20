Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239A947D94B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935963; cv=pass; b=FbgAj92eky8vX14cYajmDuz4t85ZXKVVZnea2ueE0HqudfaXu6eqgro6KosGG6cEv6DS34bjp9kBOmSu6BxnBSw4OYo5B8FBjZAYTHZ/oAKqwbbMhziFqr5+pdz/LeAb3tfjG5GrP2ih4aUzRoc2WIZ+zz0KIUPj2labsJ+eb2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935963; c=relaxed/simple;
	bh=KfWkAC7ciIkbo6PDaSl0uLznVmfVh3leTBBxkpyFSjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvb6rjVrOxkHM6FJF4eBKVvme12ApisnSwE96zjcgnj8yDWJ35En78LHAfR6yEb4CGC3GaIJgvsL0G0zWGCFEHLFs1yt4bvSxmP/F3EY1mqTAtIQEK1EmRxHVvnsW2cf6zws4Jv7oOTilRLpcdzekstcghvvqz5Rrz8o4m7RDl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCzZsjB8; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCzZsjB8"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3feee1d2so2351550e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935959; cv=none;
        d=google.com; s=arc-20260327;
        b=T4Yy7+eRsBIVjH4ZY+2PkvZSrV2VkHoHx1GBTfpIzg7lZz3RtfGm2pNtMWtx78EOJL
         GK7lSFHe9HFql4HniDgBYyjBJwSJ4ibGH6PqJe5nqrOvaeL68RNK/M0f6cPbIqOp6cfY
         cVADKJ1DoDA4zH0YwfHHrG4Nhnw6hQ2eZZAW7uc+8x1h7i8GhX9cQFn31S6rJ2y9vrV7
         qLmQuF8nDkxy4xeOQAKNCU/YlMkSXR4cAwVDgSdbB85LjZW3rdBISfvBAF3Ee6dGTSJH
         rbBX3/Vnvjrt/FK+Ju03XejCdZTJMH6U5kENRZmqQSD4aVypcB6RXpJYlLw4nmF2J6Ou
         CCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        fh=vmRC8eqbAtK2yE8y6uA29C9z0/8dXGsxPbmRHrkRz0M=;
        b=iAWMOqaoZdgKil+XEDEmImVIy82H8Taay9P6eLkNfVkxZQ/kXf/osxwTRnI4IY4b5C
         r2ZP//UROugWadIzZC9BQwshlTjQkgh3p1XIRdwpUCxlG/5BvrkYirWgLYwhdLWV/dxy
         kk73YiG/CRskVEt91Ts0zO81qPZAPFTGz8xPnoauykVK9HLaUzvz9lT29Xfa1kbeGVkb
         UgoZNSwV4DbnUBYcHHBU6dabOCsbXCuUJS53lrScijgpW7tOGR0/OTrjMqVBo4BOr1ko
         OYG8IaiG2IafAwkHMhvryiOhgAISksygEJFnhXfCbzEJh3tW/+or5oNk9y5BKQO7gaiD
         imig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935959; x=1791540759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        b=hCzZsjB8PgyB5anSul08lit+C1jRucuP28QGt8obp7RKjLP8LTCmMQN7N8uYA6LyGP
         rHcOew3mJhljYm+OMCgcahnkIEwcg1w0QTn8UmVlLhTpYFYJFjDXkYc/s0lbmdrrZ+AH
         MEXwLHnbm2mh1+AaNIjvnuCoLRGsMC2mLt2ECGOU6PpnyjTspPYC4+PQh5IKjCrydNoV
         0jhYE57svlhfk5jVj0gipUf672VTSgB1hUeso49UWBxeaOEUX3d5yZ4Tn4RBFl45mC2l
         zTI0OzHvT5fiX3XeurrHIqGBJifGxJTRUjg34XfOJwOy3Adg3c/t+20j7euNiDNq+ads
         sQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935959; x=1791540759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        b=oornzhitmHiB7JP68RldbKu/mHOmugpE+MeEdMcYUk1Mq/iToXSzhIElqGcUUHqqUa
         +P+P4y9sjoXW7yJoU/0hVtRjVyzmVTCUaBO9Ib0pf1h9FLbR1b5tNtI+i87WzOmN1bq5
         0C7Cv9o1TYnp/44KDoIWEG3MGfQza9QuiR+/t/PFn5fT3MEf2OCeGy6QVxhl7pLiMv4d
         qVVXyp7rU9t6DUmdzK0u5n9frOikCn/nd14kfUqFgqkwpTgwhFAi0EduvMn/cuE74RGp
         ZGsafdnOp2UQRB6a76wvBQoBbOy1frHyaniSN8ZiOHnTe8TQvKiX/5xoD8A8oRQRk0LY
         2vbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNT7UOlTPFv+W4tSISe1iQ4RAdw8g8Kv/SAe2XwFokJV3ZHkwSlEm1orSXvIj5nC9ogW7Mu0sClZWnFvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdGVasxxp1kovdHvHH+d+tY6h78VFdH40BSATnvJyuHahJJmJF
	6i/WrhpiyDDYW9HxdLTmkqOJHFtKgu9hd37Eb3+V4dPMw0GLR+d/vyJIbtLIL422BKrms/oALUk
	WShEgKHxrZzPLdeBgQhD7tQ+sLLRak7A=
X-Gm-Gg: AYBFou2BWiDkpNgbftuax3d/9qGvmoya+dqYt2guhpVP7zoVpD7k+HyT6DU2lBfSbrR
	JggNhIE2HUoDn2290OTN2Ib/Zs1f7q1YhyJqzF/nrz6ztl1AcgvCw9wf4CX6GbhdqtFcH912FKl
	yDoGr9o2nNBkICOOeWALXWEKwjKn5KvhctcA8xz0epLmGJV0tn1NTvE4Tl+ria0F+gbg1T5uynT
	E5Z1uWoqvdxcHGWhM1WoR5Z5Srp81fPjGwLpKhB5zO9/2VkBMqhu2I1hDNr7QjtTPj8xygyed4W
	Bb0GuKXwMa8gUeRafVNNRjWKFYgx5ZB1fz94vOPU3nTPnDU2Wi87hZJv+XtFfcrAqSm61XXmE6o
	ITAGzeJfGV3aKagrkvZBd0w==
X-Received: by 2002:a05:6512:a93:b0:5b6:1a7c:aa12 with SMTP id
 2adb3069b0e04-5bb9bb1da91mr722330e87.42.1790935958794; Fri, 02 Oct 2026
 03:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-5-sigefriedhyy@gmail.com> <179089748154.434549.15968186317991628500@kernel.org>
In-Reply-To: <179089748154.434549.15968186317991628500@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:12:28 +0900
X-Gm-Features: AclHuK85FbqNwq-ELq8SKnyUcRuKjUZjdyqLDZaraiuSRJzWpMMsnKZCTynBQIc
Message-ID: <CA+7S2vKEVD5HUnotmTZ764iJXEWbPXY6bDp9i6p3uzm7ZFJkCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/6] net: add AF_PACKET multicast dumps
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

> - [Medium] Concurrent device removal can end an unfiltered AF_PACKET
>   RTM_GETMULTICAST dump early without setting NLM_F_DUMP_INTR.

This window is in unlist_netdevice(), the device leaves the index
before dev_base_seq is bumped. Moreover, it seems it affects the IPv4
and IPv6 address
dumps the same way. If it should be fixed, it seems it needs to be
fixed seapartely, not a new issue introduced in this patchset.

> - [Low] The commit message gives a false reason for not extending the FDB
>   dump.
> - [Low] dev_mc_genid is only bumped through the __hw_addr_count_*
>   helpers, i.e. when a dev->mc entry is added or removed.

Agreed on both, but they are nits, will adjust if there is a v10.

> - [Low] At this commit, Documentation/netlink/specs/rt-addr.yaml does not
>   describe the new AF_PACKET multicast dump: - The ifa-flags enum stops=
=E2=80=A6

The spec update is the next patch.

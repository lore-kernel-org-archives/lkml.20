Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793105102;
	b=yCUTuACAw8yQrz48YBFYSnBnXY208xmGs4Bf7ryrAUb/FMJU0rnrM5Ao3DKagCan30RV
	 x09GfkjKeA3fmn86bWapl8QoCKleSi3daU3m3ZHzql9nlQeYT8rW6M3+hFAfzCOVBWTa2
	 AATSccc3cCM+yN+WQMhW+WxKtryuh5ykl6fcGI50a/+V9SRKKaKrb+R+C5C0pfqV6wRtb
	 1Bp5aH2EA3C0P5QdvdwIq8OozdLh12+Jbzmb7C5dyleChBFuD83XSM0bbuNFE21aFql4w
	 OuPqGCyC2xWArchpAcwi9dqK5pJ0LnQdOPzd3WaF95OUNJ3cXRaVP5sY3MtodmbYUwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
	b=l26+ABC2YaJDRpOodbzvHuHhaqPCITuO15iXKJDjegsMLGgn6ewGG4VQ+2B4jAwyxgqB
	 qGmXHJiUxol4XjDzaUdXkspnPTdQ/lhhY+o0B6nKOnrITr1miNo5fZ9N7c9qct4Ze2ecF
	 bMUHFIfEdDZ3drj10dRlaRMSQe166LO0DjdSkvMCkwEzFAPgI0tezV7K/Sa4xkhFnVpBW
	 1Omw1gQLk14caMDK4ksuV/NTT2zmaHy1Am8l5sZVT4weXHrx8vDaAbh8d/I3wh+pdXn0J
	 0Z55F6XHNdRIQKSnNKWzlgorJItR0WARUFcG5arGuZlB7KeWe9L8OgFR40YW6YQzqcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ZUOBzw/p";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0FD606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZUOBzw/p
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so2938801b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793105101; cv=none;
        d=google.com; s=arc-20260327;
        b=hG9PEVhjkMsz81ae9GkvcfMTU9gbMI+dCQ9WocEJvdREN3EhM5yMkr/SiPMJndXihM
         GK9RKVCJNuryIvc1aOJt3X4ofCNZuBgZLKydc4hUJLWRmFdUFTwu9m73l2jnoLl42JLT
         G0ydO55+WOfZh6R0nqcwgar9kMxkzZNITgrcSV/w4v1891cOe+e+8y1VkTOb273zoeBG
         gGOyU1tXfQnjM07y04Bahe4HU8d3bb8BlAVrmxf3HooBiqJ3HM9bm/1I2O6UvDlPJ+HP
         M6xXkR3Y0xwXgUTxE4qoTu2rfeAI0TBFZPNekTHkSl+KVQ3RgkCTxlSW8tedjqEOgw23
         HZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        fh=9ewPCT5m0iWi3eqwIkhWTLRCdPRet/n6ITSWq+cBihU=;
        b=pKTQWlGgcsxyIcl3c30jd/xzLBZiWqQVmZZsc3wvOaPgvknWC6TJ+MEK1SkDgdrv92
         zaacaUt/JBGGc4TfteiLHXrgI4vTyEU679orWw6mI/WyuGXMx8lpMOP9q6/vkBZdwYi2
         8rZlauXceeQCMx8CSpNBI240Hbe0zcEcE2jsdqONZNjU5WgHfZcVzgPxyE74GvPKT4jm
         rag9ltzM0rNzzhyQJ/iIANgCcjN0A9k0Vdn1PiDKAP35PyILq1BmShxZtGFB9UDBY5ah
         aXoge4mthYGp1Hq9Y0fuI1hu7rzt8NDG21XRqEeF6Hv6lsx/AUEw6bKGHMSp6hfmBPLG
         RndA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105101; x=1793709901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        b=ZUOBzw/p7m8KeeHwXA3quTJfFdIULTmM3ehGFEBoTt0YEm9WBE///XebirB9K+GcjT
         X8AyRearg10v9L1140F/+9XhKxaoWZbyNCgCOek7RexPA2Jl6fe4vHkeaBZLZ5fPeVdk
         SPCF3DJCaDtrzgOE/xQQl1PEs/DwnGYx5P7km94wV5jKtF3xgEn+pkvrf+KON/rQyMgV
         wNEfYgR9EJPvqe2vwSxUEk3ChxmJ8hUGdkiQCudrvt+u2YHLkd4TTVXtq29eNT2T9MNZ
         U3zCLsfAioeNg4r4A5z7xASqQH4Ke6OwLCHlGPszXIXRZYpye7olhKWw6AHYQ2BqXU82
         7nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105101; x=1793709901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s3EYuBTTmVhTSEPj6dV6TX9HIoyvSVBfIfq2lIa11uI=;
        b=oAbCoUwoqUmk6r3iiH7V9ruDrp6SgotwZi40amh3/O99SIi9qbw/C4nHIW4TPb3Y3K
         /Ayo4/6tA33EGNuyFW2lEsmV02mSKR+Mndd+66OryiajDmzbDHRcsvUAlS+sGpQ8ixsE
         cmofIkVzzF20Wy92Rgj96lwjEMl9LFAmFhHq5YR5CXZ7iUmtgFvVdIQqaNGZSp2a69t1
         LjXJR8a00oX8eg4nZZOYwpxpI/u2jyX5c3FAZc4VSnwdjz/pqw8SLtDPHAwB9V0m0HbP
         yJxsjzrfCdhd0EF/Z9RbNcBKmR0A3w38m5f8ekJSR2sftqfDgXE43P35DMXjnuphEEza
         rWbg==
X-Forwarded-Encrypted: i=1; AKwUvByoz1mdsM2ip5tNFxZBVBFvD55kgogFP0bC/fUDL71afhJI2gtT1WN0bIj5YyDk6LDGupIJ7z68lk6DZko=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuWWQC1l2w7qIegSvxDbA+Ou9Y4Ujy3P06sS9sU0uo7gzop3px
	vfc2G0YvGrpFR2H0TAeGKbLrUqMDoouccUT9inB+B9ffbsSzGbOtA4V5qaiZhZTlq/ozoSV0Xsz
	6LWLhqgUFedyiKaHFps5HaerpBj4GzEs=
X-Gm-Gg: AYBFou2P54PZYidaho3UirwmPBZSTX4Uz2maP/YeZ6AWI1CTsFHa9rZ1FzvIsZvC5dt
	tVZpWHayFx4thCgEBsC/Z6nk5wMiKw8OPS3Ejq8lL6HEQldoPBF6H0CtAtBLkGVcWMnMGMtnfii
	+GPbpJ/PequEXcD1d1bqXC/AZtt8Zc2tw2MPSgp4PWGdxPZ/s1fNh67neTHamzCNUe0uA5wqlTC
	JoiRG8dzv7rMr0nz3dvoWMzkuVqfY2fWOrAWUaqSYqX/nSOuLtFt9ugjU4UG4mRk4jPSrShZf7c
	oVcZBBjSoX5BYltHm6SFsZaaGtLMaVE1rZ6BesQK5m56JpAyMS3L9Bu5bUqEo04ISyqg6EL4NIs
	HAh/EVYutgDvSbHJfkem+UXAPe8bzDQ37GAZEXXgjxwabQdpZhQc97wMeT+spoD7TpI9VcdVC11
	9GvBPJWp/eaOjpccLTXc3L3Z8=
X-Received: by 2002:a05:6808:4f07:b0:552:1042:5c35 with SMTP id
 5614622812f47-55c0032ba03mr6286078b6e.41.1793105100960; Tue, 27 Oct 2026
 05:45:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-netlink-dump-livelock-v1-1-478214a635d2@gmail.com> <179310175111.3134.9177648236285208856@kernel.org>
In-Reply-To: <179310175111.3134.9177648236285208856@kernel.org>
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Date: Tue, 27 Oct 2026 13:44:50 +0100
X-Gm-Features: AclHuK8vtyo3SzVDHFGolZX6XEU8zK_Jh7QNOxyA31mgL6WcdQ5ELfLnY30XFg8
Message-ID: <CACgZWq4DV10PkksLhDNp+RxtTGNyuA1m1YmzTZJgkybb=MfOWQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] netlink: retry a dump skb that does not fit with
 the minimum size
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 11:49:11 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [High] The fix is incomplete: the ENOBUFS livelock it targets is still
>   reachable whenever a minimum-size dump skb also does not fit.

Agreed. I can reproduce it with a small SO_RCVBUF, where the
minimum size skb is rejected as well.

v2 will rework the admission check for dump skbs instead of adding a
second allocation size, so that a dump continued from recvmsg() always
makes progress. It will also address the selftest comments on patch 2.

pw-bot: cr

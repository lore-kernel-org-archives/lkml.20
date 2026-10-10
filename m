Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA093D5C2C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639612; cv=pass; b=n8mgVL3mz+GkTy+8bnC7O07g8IGYQAUTkRBSnWS+0qJd4p/ZmJdABjzojbQ+oPf4zEywV12tirSXw/1ymRbuRQN7dHAcE1Ss9qXFWSjDmOg5iZSRaKU3bnnzIiEc1DStIPKcxhOgbGPj3ejv4ORA2ZYbLfPTYuhPG6taThqproo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639612; c=relaxed/simple;
	bh=iYqhoVZ+Jyml4P0MGYzZBl9up/LYhbapQ8gAv8jGngA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uv1Kqzxuoa4ZoQo5/PP9YzpmpQNFMTtzLOWFUUdeXn2/Vwvl/9N3V3oV5DtlVgJMDRtRVCpvII3T6Jk8032DvfQI4DDjlfS/YR9NMYkIxN/JYsG8ueecQXAib/jr8x0bt55XX7AhqQYKT6Xkdww0tfM8JwPLENBXK3I1NptUrz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXAZ9GWq; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXAZ9GWq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso434177e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791639609; cv=none;
        d=google.com; s=arc-20260327;
        b=TjbxpdPiUmoyfehj6ND/bH+RzdDRW2FNy77SWDANPGKDoC3LXR6ATL/84oTXg+LEkd
         GCZMj+QFXA6pRjBT/P+fl07MK2SgGd6S8XcdiDb+E7Gj+gj5SSjqrJONaeTlp6iTQ6v8
         G5eqWFmzO6Xy9msKbcEbU2uga/qoWjYqjIJ7xN1od+SiRiA4E2k152BRWB9TQ0U1W77A
         mBDQbTU4mawM0CJi83gM7WWZl+H4t3w6uyod5FasaLU01ez3oa3PX/jhhTE4BmRBIt+4
         jKeqUIER/HRGvK5cbGyX3ZhEFYM0n/nAbZ3/KiF/iYJfxTTbVRbLaaGWSDvkq+fcPlt5
         3/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        fh=I57sL+hHxBnewfroymLfp12usuJ050mMiS+J9rmSN5Y=;
        b=G5PqBAM232PfdZKLjTWo58NL8pmWntyoX4tUrGWBZqDWrpMe7oMlNBI/hQg/orzmrI
         gGVvNAvlXQcl3avkieOkjnjlLCA1//j+/Yz6muFKmckBBHZ/a+tPCIRpHHkr9qMbUm90
         2je5k830N92I3rywXEwrTCehm0e97eFbPkf5HnhuNhFN8Sezb+McN1NDiLY5gl6Ez9KG
         TXfADD4VVP6JylsS3VplJZO8BBGvpzN0kZNFNz5jW/1zXTtvW1zib/J015AiCRxn5Rgb
         01QN8bQZ7ysL7hqc8Ty6KSVTFK9mkKDc8X6Kysgp5jwUG0uI0wkXTYkGdyy5KdnhsfDn
         2Aag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639609; x=1792244409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        b=ZXAZ9GWq2w2N/D2wWSTnlOkfEAe51ltRLDrYbuiULJDm7BKDbfNcqJWB0jDk7LsJjM
         zpSXQMq21iq+Uq4i8loxLMWjHSNKMJN5vv3+jzIc+STsBnF0cIELEho0GZTiYEOR4jsi
         3J9Rs9gsSPM63oCfE135zN/SgdVq9hbvy2yta4oTJ1JHo1HNhDajWflXmGiG8XLuDl69
         HGSLHWTR9gUOvDtkqc6O58y8bw44wmUW5ejuuNyf0AV4OrrVqWK48M92yJDeGDYzsTGe
         UECbrTh73toJRj+3j/J+SuN3rtW6enoSZ7iIctMYVc6JKYEbsu6meBwLNhxeWVVF97ec
         brkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639609; x=1792244409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OMPvqt3i2+F+trWLfv914nMC+RGH+n0BOpujrLH77w=;
        b=Sh494MxuhkqH4+474yyF38KPZDJNg6MY9iAGluHJ2GDjEqgLMXr1VAR7bTCjbHwpp0
         NwUoLw9p+Xn2QKrZk61EkTWM6lpm8RZWGJParAx4SS1lB9kwTVzsL9w24W+CiLidDlWO
         D8AhOe9nziS2C7ERsmN0WeQX5KDNP5Kn24S/YEVY/zuWjekOZ7q20c+PRhwshOKoQ4/i
         0ZEVo3NeT6V8IiickAXuFrWIL3iXiZlrlvdSySw2xhc9VsRrg0OvQerQf//bepV53K2u
         bO+E2C5QPplTV9ei46KI7h70LsLsFWs0gDBo/YQkJLuJr74rZdaeVIsGItnYfWIe5ocl
         jJ5w==
X-Forwarded-Encrypted: i=1; AKwUvByRY7kO+2trtyqBZ26vxSEjncm76qY138Ixr2FlslPUkwu9OOvquPZ0a3U1+LCwgaoB6YQUG6BgCKhyLHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdYI+MevFGVemngam/kreT1mtogwCWCvtYVcDJD3B7sROIw2KZ
	P8zEeuH46/PD0ZLox38gmrqS4gzFfmpHqXPvT+6qqickpZtMmn1njeXrmbq35q2lZ3qVqEPwYMG
	wzPpmfjTt9N5Uzk/GD2qa2ebqx4hHwVY=
X-Gm-Gg: AYBFou2euIFwP48eD+3kaEDtV2u1jMyhL/4Sx2KZ8755tbnOwf+ahfXaRputC1xKIvK
	FFRBwBt8IciKog/eak/jKrWM98rmcsT5OVgIAMuQJ8iPpSU9CVF82lkjjqJsSb5J8jijQ/QOIk0
	c8klw5aS9RtgWE11Vrk9kqS/NH7GaCw4TGs6h8/YIjgfI6iqgwRNv4f1Sz6ZKfRDP7hb8sBNC2H
	WTxtIEQlIJV8wOZKjx2fnSzLdjgja9WVdliF2h5kineRgHvFGbbYNJQX2QgE1s/BCh3d6oGikoZ
	8IQZL+eSnotVEVw2y3PmvFDiyrZITRdOzSyhwvI8LAr9f1wFkxlwm3NzSjMI9bR0/9c9e/Epr6Q
	MoxPwuDItERs5rMii9BAmDGpiUM61Qafrknl68N+v0y18
X-Received: by 2002:a05:651c:54d:b0:3a9:7f37:9bbc with SMTP id
 38308e7fff4ca-3a9c535761amr10525921fa.11.1791639608635; Sat, 10 Oct 2026
 06:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-5-sigefriedhyy@gmail.com> <179154713266.434549.3119718667275543634@kernel.org>
In-Reply-To: <179154713266.434549.3119718667275543634@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:39:57 +0900
X-Gm-Features: AclHuK-8lTLLnkYqyGO4ub-KfSnA41bLKl_MgKWzh-nerGwP6xbhIB0UlOeiU2Q
Message-ID: <CA+7S2vJEYr7sbRqf=QdURN+gLp=5aaRGXG3iprA5Rz4-sEqj3w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 4/6] net: add AF_PACKET multicast dumps
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

> - [Medium] dev_mc_dump() (net/core/dev_addr_lists.c) calls
>   nl_dump_check_consistent(cb, nlmsg_hdr(skb)) once at the end of every=
=E2=80=A6

> - [Medium] dev_mc_dump() reads the generation (cb->seq =3D
>   dev_mc_base_seq()) only after the walk, once dev_mc_dump_dev() has=E2=
=80=A6

Both are real and are the same problem as reported on patch 3, will fix in =
v11.

> - [Low] At this commit, Documentation/netlink/specs/rt-addr.yaml is not
>   updated for the new AF_PACKET RTM_GETMULTICAST dump.

This is done in the same patch series.

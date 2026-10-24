Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792818984;
	b=3wZbZA8XJLGpBwAupD1t0isQGN4BTpkrZtNwU0eMckwpvezMROrnAmq7ExOvq0Yaac6y
	 y+HCqgIsF/aWKR4oIvN8aZiIxoo8yt0+f32PbL+H7pPAOrgkpKm6BBnzcdb86cH8ZhTGg
	 uLKgutBd8C5GYSc0qNrorYkGynR6Assd0h0ULkH8rfHrdggB9Kj+V/dMyiCblWl0nm/x4
	 COA6+6WfksQi15YMyCTsnnHXHjG9Gy59l6uWITyw4G7oWApGMzDXgYs1lPBVNNyuV3ocK
	 j5OMoTLZkAq0C/yAqNXWXPJJvDRAthldWQjK/o+I2aEN/OjL18tRpnjM7Rab3GLGOKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xK4SMVmULID+nciE/Lj6KOvW8I2NZswUGNT0We+t9YE=;
	b=ms7qVBHB7a/bVlU2aYEewaGPo0/WuRzRCsWNAMoqOGEi+fygnCjWIFjdzFUsWdIBiG00
	 5v6ivQAj35aH22BCuxrXpfcZluApjacNnOfCtnpRWehjRNrbFv4Yyf4DKqaPBOgyy+0Ep
	 2hcgkdU1LmNzsaM8+rTYilTIWkmghGLP31aE+FgN95Y7leIix+hnIOT8EkAqxtMbN+ryp
	 1i1xag+TorCweGSquPU9DcUlVNLT00+NAMXFpLE6z8yUCR4qtcRzZqrrrlYGhcrQf+aD0
	 bJh46e50G0Yb0TsNg/KBLVQRtEdJwxFIfUO+9kFvsB/PuAcOPQlN/v0eeKd8+c2MCKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b="K/EmFxXY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=K/EmFxXY
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so2454034c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792818982; cv=none;
        d=google.com; s=arc-20260327;
        b=KANzJRaXuMzAA4vZmDmrTKJQOCNBTXbKoxkqhnugHeEYDmSPRKC4dpV9Fuc4AWA85h
         tXKI5FLVMFHlZRqGoW5Dr4Vpcm+uhYTlBiN8vsxGFrqWLbulx/uIBfDIHRb+ab4dqONU
         /KCRKkPlX4JbjiP5aleIuMVGyB4o2rWY50c+hLdJ0v3WzJmAEiHrd+S02OaXv0ONhn5J
         jqPv4ZJU6gWoUOWQIZtyxOJxI0brlV3qn+d8rQz5auArcjIj1NMfrdOJDr//vxcHUM31
         NR8hg+T5Y4V9qeZhGxeWWa8QyrGqjbSuvFwRRtSTZG+0180GFAqqJOTrww87PFUGl/tw
         XoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xK4SMVmULID+nciE/Lj6KOvW8I2NZswUGNT0We+t9YE=;
        fh=A+4mTkA18hjLI4TGzxwPp7qAfhdYjXQkzUKhtGyXRmI=;
        b=EzJ2ogCEF3Gkn5N4PfBlyfsZlOULdg/iPfwEgw0BdCwwWWo0FiiWOxy1mJLki8l3pz
         03WssFudzpJim05AErtDC68nLAOss0Aa/ni9yoYatMgIFhh5FhYYP/Aq3Y8G7Qw9WZjA
         AuAOBGJIJ4QBToBt4aTB37R4NmcavBUx1n1fAus1DuInfAFL8F8uUSXACbmiAbnbx1vg
         /+BUvPuw0BL1qU7o33tp04fMqE1h0jQmudzirCMI6S7okb6HPjJM3VX+3B5vYWtxBHt4
         Op4mUrHemXz9YvtNckJRD4m0X0Tap9baiCyaQFBj3SACv97w7iERmY0cvMxx7wBeVU3y
         1egg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792818982; x=1793423782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xK4SMVmULID+nciE/Lj6KOvW8I2NZswUGNT0We+t9YE=;
        b=K/EmFxXYJLoLSM8hzo5GFgUhAW14+F6AfkR7S6g1KmFpgECEFIc8J725R0nsQ4v8VG
         ZCk0UHDQ6r2VbQxSwlc+BA3tT1xLfXCuvLZ8ICWToJU3KDmMo7NWDTj2wOHUgnXyBsO3
         i3ui3QyiQZJyA0r3hLXTarZpRDtIyUKRD0DTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818982; x=1793423782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xK4SMVmULID+nciE/Lj6KOvW8I2NZswUGNT0We+t9YE=;
        b=Uw7NKvUY9DpzgB/8F35LNJbneiXcLAWp4NImwsFqLyKz+5HwnQN0hVzfS3LNnGymSK
         M4/bjuDkZMJ3uYFFCyhceingoyP3lLBSRYsHW3Gyuqit6womyOVLSCIs2Z3jlay1LhZV
         c9uoJ1WFDbTjuo9CbfgoXDZHb6sQkLgTRnztWtEilIMCyiZNkeLgilTSREw+g42zDZ8H
         fnQE1ObNe/dLgptAljrWwL9DMSysh7EPgqFeGLks+F1srrMzSdBPmeROFK8EnHk/Oeii
         3MUStIbAIFWCJJRqfoh7njX/vuyWTqLueYskJkpj06XpmuJFfzzWznCGiwIDaCvJbYU7
         xjKw==
X-Forwarded-Encrypted: i=1; AKwUvBxkFZyrqrCnF9o/5p9c3FLo6dBnvcgLddY9JaL/4tiEOdWZ/ilWbSsLOoDuFufsXYuY9UnCNW9C9DYs8DM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEvRfQpNvlIKQk8QbCyrk/siaFjuxFCHAIrtqIJIIG2X4gjGYE
	O2NJB5WjD53P+anOQ4LYDcDi9e4h7vot4pS+zp81QBJeA6igQE0dYZkuKSvZuef0LhKg1tLtOJ0
	sFw9vdQx/gAxz2K0ee1CKszUS79eXxa49PhqhqN1Slw==
X-Gm-Gg: AYBFou00kiR4ko80SCNCCUQ1NenR+vOX0lc1RjuSc+nAY7kNX/A+VvVyYNviszvNbGj
	8QlewngL35N4QcbjBNwUSVxmm/evcT6ByYgo6CwdcF5M0P2EEKta1znHGZL4Vs7SGYhzbakgxdf
	5h0alXD2GCi6jV9ciDFaG/1AR3/4TudB2UEdtA54wjLO8Zxoyec/1i2Yn0DtUnE/pDs+XDhWxXT
	U+pm6/s/71UqDXRP+vrn+Ea9iCRBfKbEgQFNwGm9G+G8OzV2LCmBCtKM/VSOQ3CBd9JbHSoaFG2
	bPxjLcg9lyAgo2ZG8Rm1oCtWNydhOwfjFPlD/DZq+o1n7xj5RpTEor3D82XsWYe3wazDrp/L3+E
	pQjcOZxBoZdsyNiNiGdcS46S3ddY3dgM+ybOjav8=
X-Received: by 2002:a05:7022:7f14:b0:144:c112:5f24 with SMTP id
 a92af1059eb24-19936a5e5ccmr1673320c88.25.1792818981855; Fri, 23 Oct 2026
 22:16:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022100159.525910-1-daniel@0x0f.com> <cd8fcccd-aa70-46f9-b497-ec3070b5f8db@t-8ch.de>
 <atrsI4aaq9t4BVra@1wt.eu> <81607eb0-596c-4943-a8fe-d272fcd258c4@t-8ch.de>
 <atuJZwT7LIzceQ2c@1wt.eu> <5a82da39-1f60-41b6-9359-f08e6fefdb6d@t-8ch.de> <atuo-ZOI7koEs8RV@1wt.eu>
In-Reply-To: <atuo-ZOI7koEs8RV@1wt.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 24 Oct 2026 14:16:10 +0900
X-Gm-Features: AclHuK-5C_aN6bR6lBP7A9AgnpS_VUQ_G6cYB72lUcgFDDghR30PHJrxWl6o2c0
Message-ID: <CAFr9PXnggcsL5JSV0ASXSfvcbkt30-g1kpTrsa0PDWqgdhcsOg@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: sh: enter _start_c with jsr instead of bsr
To: Willy Tarreau <w@1wt.eu>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Willy, Thomas

On Sat, 24 Oct 2026 at 03:35, Willy Tarreau <w@1wt.eu> wrote:
> > Maybe we let Daniel break the tie? :-)

mmm I have the same big binary (Quake using nolibc + a thin DRM/KMS +
ALSA layer, some libm bits from musl) on 32 bit ARM and x86-64 and
they were fine so my gut feeling would be that this is an SH issue and
a few extra bytes is fine for such a niche arch.
On SH this also seems to happen for much more normal binaries if you
enable LTO and get unlucky which points me towards letting the SH
entry code deal with it.

But also I'm still working on the static PIE thing so nolibc can
create binaries that nommu can run and in that case it would probably
be helpful for all of the code that runs before relocation to be close
together.

I'll have a go at the ld solution and see what happens.

Slightly different topic but related: Another thing on my pile of
patches is some stuff to extend memcpy() slightly so it generates
word-by-word copies where possible without passing -O3. This helps
m68k and SH a lot but everyone would end up with the extra bytes for
the word-by-word copy loop and the check if fallback to byte-by-byte
is needed. Would wrapping that in something like "#if
NOLIBC_FAST_MEMCPY" be acceptable?

Cheers,

Daniel

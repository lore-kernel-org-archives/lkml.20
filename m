Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792930080;
	b=X9KiFbPni5t2vtQhwAdZjs7z5k1F5mfpTI0I4kYBz7kuPDS+tnfxXjqTJG6QPYMSpDP+
	 pp65aKba2w6iGMMMz+kd7aXRiWKxusLDEHadNTEFh7FdhNEbb8ROvv+TR1AmgmPHudZ08
	 QBtugtthGdfzCa9WXpQYXQbdbru1iyfkV7qPOffrK2hfk9D40Yxa+Vq/e+w3ll0oBU7wM
	 VrlaTmSZpvjFm0LWQXUc/zJSi4Wzx4EZshzPF0EtzsSXDavsOAZmNVKy2WVNhCAAFqVuq
	 mmgM0NWbBoFAyHOmOB5GFSS40fncwwojDB+pw2tblqfTX1maJBBcdIv1EGLn0Jh0c2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=M3JXNvpeQJ0Bux3cVAUHFgm4T0P8AxWV1g4g0cgJ8l4=;
	b=eDf+huR2fuRmEDhDNgo+n/Qj/5H4O7tTIta2su7ucXFBacm9frS4whY2mzeWJD5CKIE/
	 yeZ/Lh/Rt1a0D+Bh7z8VyfQ72ZZXRxaayfiMsux9UmGwATtPN7zx96/NPF1aRPL18yl6O
	 cGdnquatA7uKsyBgQ2eIIJU3xzoGpzMtDG63ZE0j2+4+JLDpAtKR6T2/3TIIThczgBJwI
	 FtHPYJ3GcnIg+p3V/CEpZsXs9irhl47I+OPBkkZtYuZptTvJj5GWyPj2+U/BVH36q+i0G
	 1oWRPpDwABSfBo/FDBsyHmOAJUxLQsl5sf4NtSYVm4eM2mrgKouvcbYod+5M07guTSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oU2AjoXy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AE606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oU2AjoXy
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59622so1395083c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792930079; cv=none;
        d=google.com; s=arc-20260327;
        b=Pd3/4qQEG1BXg9LxsHmkFePX/1iT8Jk9vHZ91+zDej00jo+YnPmJf4XYg0ZTHCHo0p
         uw6a/3A2sbtZ3gRU7n1lNGiQ3SKx7eQ2fZhjkyHThIB+plA2bMUh/z/L1duN2azGAbGv
         lGKNE4yrFvGVWVNYqMT/4SVY5TIFxvPHZZ0qwebuw3yU8w3AA1yW8n++tpqD5LBaMtlE
         xnr1DLRpAoDTW80CUsooLPBP6xwYa1JqqNNhtKuOT3fC+g7ZqSZ1tNSz/rNFmym8p55b
         28tANduQlKoTlQWnsyiP7IAMieam1FiGT65q/Cbi6W+3++efr8IEV73v8yj33/mY6nL4
         xn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M3JXNvpeQJ0Bux3cVAUHFgm4T0P8AxWV1g4g0cgJ8l4=;
        fh=Nh5XSUxgTIYBeHUW55+SrdKdcB0qBmXTza4Vg/kDOa0=;
        b=X/pVGDOMY65GgcL9VO2+yzqDgn3stA5VxIH8rmRrpLwvrMBDtPFVqRIQxNBIViU4Je
         tW/Cfb39jmvVgi6fJb1m5GXx4ABWqr0gw3qq0A/X7qL3e6b76Aok+f+J8tFxQM1n86Ji
         LkAxZXFV/i8QCQHeiC5thqDSbWrKr54u5F5r6DK784tIEQc+gIoo8hKK0Psw8dObrzzS
         f0vYEHx1nLxB1TmWthWFJ5kjno5bj57Ose79AdbtZ8TYLxNFivK8+qycXWQNKkbK7UmA
         ggP22T5AfTwnujzqiK72DlkhGUSY6IaNwzbhXJbQsGyyIgaQCQ045qGtOercMwg7gl6w
         gFgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792930079; x=1793534879; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3JXNvpeQJ0Bux3cVAUHFgm4T0P8AxWV1g4g0cgJ8l4=;
        b=oU2AjoXyOh4AFN4s1Bn7mmT9HgFQjpfEbr4mHT3Uy07uCDtbGd6Ay27PHXlO7gwxfr
         TBrJhd7fkOfA2nEHRIQ3648B4Ta0MDjYwX5aS1GWiN7MDaYqB/L6sAYeIDvk+6LwgbM3
         BOWEkMGY63mxxGu41R3+I3D9AJMTzBXpzthgkkS9EOeUnaEV1dLoYdqs02Gq26GcUcTY
         z5gBpSIVMVGopw5TtCMS6AIMghMKiQI+C7y3LS99WLsOk+UPv0W1zx+mE0jxOLjGuGwh
         DKEC0cP30Q6PoTQr1mh99Bt/ZZRaMYCKekOJ9SaVu7uZLM6LqnrBp3CSoG419L+1H6pn
         wNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792930079; x=1793534879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M3JXNvpeQJ0Bux3cVAUHFgm4T0P8AxWV1g4g0cgJ8l4=;
        b=Ar/s2sqXCwL1itiSAUReP4vpkWtF4ncPWcQb8BeOMJsEeUcS/xXCtupQXuMFK74Sbg
         0+mNvofDEnOA3LXSkBY672CTvx1jyKsttxs5OeA6kNisQ7mwfraAaz9s3xG9MXmXuZoA
         XjyuArkHC3y34H9pVOOGrmv47CsETUCBP2Rv6vLNWC4A5ZQsAxOiMlkmbxiYMOoLyv8s
         Mnszo2hm20AjyNu4ZfLnTPC0nU8d75kOB4cjn4q58BMhfEi2wyBXExjYFx3jBBY838DE
         HBDFHb4KRFolJAHFvjXTbfi3UYJUoTE9m6hGg0CpNOf7Lxv3iJkL+KPwaXYX35uddIMl
         DKCw==
X-Forwarded-Encrypted: i=1; AKwUvBzyr9HWBe548pFjtoBSXV4xUxNUFNK6MgIZgSkaN5MRvUD8Es7s4HLuNUk5+6+Q8sU143eIlbsA9WsJInA=@vger.kernel.org
X-Gm-Message-State: AFq9FYImcVfLNAzxBRkquIpgf+QMWo2R7SPmLsXmfN73DtuaCBZfnT4J
	4S58o6M0Fha8GcjIlNRiGkF1HnGsffthBzuma+k1EKOb8DOPzve95+Zw6BtbckPzou+hm+rkejb
	Fcb0oRm6BChUTKq278iZTWODMfXZEFTc=
X-Gm-Gg: AYBFou3y+vaehoELEfE3k4aBf0tC6lVt7oXCFvBfQi+2DdMeMmeKDF6FRKvpduCAAfX
	8T8X3nEsiK+F5ajlAy3CYk7+ykxdvJ3eN6R/f7hm4J9ctfbBU1jBol7dBos/lGXoEvwDo76eqWk
	Gs/nQsf1u4YlNyjlW+EFHdyg1ieauvRnHv9iaUW2wxMF/ukTkRS9xc3Vo1ukR3ARdvz6o+vHU/n
	2S6L86CGAaMExNWXtwXrHVWjT6t3nCrWxXLq7Z67yz6MSjFuQhImmB2FYVOM06WOn8QqN7ACD+H
	mJMMCVgeibtWgQVUPGCtz931kMrv8Q7HwuZIJSEmewDtf8tcCLyThps9mKbbSr9qEicBNTS3Vq/
	T9mnvzUDdptUqUUbuC6ZHEIPkpS/Ok9plqZDKq37IWYDBvF5q4SUdLxa74y0=
X-Received: by 2002:a05:7022:7e8b:b0:16a:1fa:58cb with SMTP id
 a92af1059eb24-199290fe419mr6619027c88.1.1792930078752; Sun, 25 Oct 2026
 05:07:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022103821.89552-1-timur.stukan.linux@gmail.com> <53031.1792761889@vermin>
In-Reply-To: <53031.1792761889@vermin>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Sun, 25 Oct 2026 14:07:47 +0200
X-Gm-Features: AclHuK_WZtfyfMlagRSV_k6VkUA0k3YKf5SpRSOG-2I9O3pGGcYq2gny_lQ8D3U
Message-ID: <CAF+_u5C0AAzR90Fqy8EW0EQg25=ntgpxhwxqh0rDif6d46qK6Q@mail.gmail.com>
Subject: Re: [PATCH net] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: Jay Vosburgh <jv@jvosburgh.net>
Cc: netdev@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 16:24, Jay Vosburgh <jv@jvosburgh.net> wrote:
>         Reading the description and patch, I'm concerned that this patch
> is introducing the same sort of issue that 1899bb325149 was solving: two
> state variables that end up becoming unsynchronized.
>
>         For example, here you set link_prev_state in one place, inspect
> it in another, but never clear it.  Thus, once set, it will remain set
> forever, raising the possibility of false matches in the future.  Not
> necessarily from this patch, which appears to always set then check in
> that order, but from subsequent changes down the road that inadvertently
> break this guarantee.
>
>         Yes, that can be resolved by clearing it after use, but I'd
> first ask whether there is an effective solution that does not require
> keeping additional state?
>
>         -J


Hi Jay,

Thanks for the review.

Yes, I think it can be solved without additional state. The previous
link state is only needed when link_new_state is BOND_LINK_UP, so
bond_mii_monitor() could skip committing just that state and leave it
to bond_miimon_commit(), which already sets the link UP after the
speed/duplex check. Then slave->link still holds FAIL, BACK or DOWN at
that point, so no new field is needed.

This also seems more correct to me: a slave becomes BOND_LINK_UP only
after the speed/duplex check, so other slaves processed earlier in the
same pass never see it as up before that.

If this approach is acceptable to you, I'll send a v2.

Thanks,
Timur

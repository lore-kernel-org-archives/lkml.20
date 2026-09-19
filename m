Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890012E7387
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789912; cv=pass; b=ia3hyq1vsPM4T7sG2YC6Glrd+5YkQbQTBrSYHtUy6LNPXjmeAbUmRt4qu4aAdFVSaiWrY+8BflCGi71/OVv6O/FjkrejqD8k+dMSkcAWrbvYwhsx7YqW3/PKFJy7328QmoVbLLqObCi4H1RAkFXGRDpOa/07zx741s4vYBeApTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789912; c=relaxed/simple;
	bh=hTa0cJ+wIISdMRyCZeKr42I5DMGv9YFDWO/5UDkL5yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiDZHB6+luscVEVuZl0fAGjeCWJRLDg1fpa6DHiXBCJ2U9BHQ2Wv5ui8dhdLkuF9dd1QYfoaGC1QF+eQaW905XCxf08a0w/1ADBMCCMLjskMigPwrMt5aaqX5jy2q3lBtzD+VVQ/ssXXQL7Jk7iIxSG0392TJ5rRXDipwDXtLyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE0sPFU+; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE0sPFU+"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so9819981fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789789908; cv=none;
        d=google.com; s=arc-20260327;
        b=sJTvjB1aSrypd2Y6uIDDWIqWV9ZuLCCF5mimRDfj7cguMqJKoIExYbIDnYAovAxDpc
         z4x1Gev4xG/V1oVhTCkmPNbZjHJtJTNudfHwCsG2VhlIg9sf7/nloTJeHU6v6N6DewCR
         jvDi4yKtvctqrB3uW3aPw5Yvp3xrMIbVDk39JJDV7atnVBDN3f/uFw9b5DRyD6aYZdR/
         yCrb2zBY4UF7+BDUNlgisSiA3OVfbHDPvvHfnqFozgaq7sF1U6Pd0y2flNyUj0pkuVBS
         WJ0LHYqigqIyr+Ce3LEuDjHFXzGiBktlht8qx0wB4JpfpGGREDCzAjAWEhxwCioR51mN
         RYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        fh=IEuuKPrZIwG1DMKY2dHcJPM5o5C7yq4BbYMvwc+8n9c=;
        b=gwkQ0HnNZhU3p53qblIlW9JZ9FaSiCFSOcN5I7eEYyYZ9vg1ebR3h6fwHkN1bVhS1R
         pzQWeomY+QfsNvrEeshbsDVqD8vPzi0yagUHgk8t0IqvVVVVhTgxA+whIdHnWi6P96T8
         n81xj3r8SW8tzfgcXRecipLmHquNZORKazDZcY4/mgeQQZWehT//3+4Bk9N1H1elVn06
         Xjar/EfhNs8xMSfNGgrIwWx/RklR8WHZHis+54WkAYpxIBDVwloJcRW7uG3tsw3nFRY8
         sbhgQdefya7g2Wb7MwIFSBO8G7ummVExnoN32KNT3M15zt8HbL57vFq5Y3z9XWmiNYB3
         7hPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789908; x=1790394708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        b=SE0sPFU+pO3mTQhHf9uiqW2UeedlYBwWgy8bF5AmtJ5ZRe+fcxsQ/taGTlByMsSgck
         0GPZBloD/ibEGEDFaDbh3haX29tvyWXB9PZShIOHVpuGdbIp6A8X9B9zJ/BKz/h/YEb5
         OYFzk5thtO266BJY3AfFKtR6TndIru0lS0E5pfD/f7sc97G4ifLlw/2Gbj26ugiQCB1U
         IS4X9IZlZsV5AhEi6iwLztiGZP3T8PW1IpJ6M2S5QYZigu8R1KP3+EITNK8oqhwfsAqO
         mgfeFyWROM4p1FPKBr9Vmsr/SX60Ab0KPJMr8dmwpwV5T6O/fTBIpyNa0pPBiLaZDHLt
         e4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789908; x=1790394708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8IHx8ZPAeKtnfGboiRf2eSbCOa6mdkGIwjEr3hxwU0=;
        b=ECEXCWEE4/JACsdFk1YpheWMPn1arUw57zviHxiIQhTnPMDrWVog+rblJp1363VMFe
         I0fzbEDqHPUEiGMO/GaJRHdJJbN8aPJHjxI3EqUw2WSVjjEqbGmWZwifgaECWqCivPEG
         xKf4svC95bvWb62rYeF07o33833h8gZ9DYCHGzvL66kJWAns7GIoMxcTHvA4Gt65rlPL
         RwvQB7FS7Sn/7QCt/o6c8LdkdLW6P5U+UCS1E4MhOGlfHqE/7ZS5JOfdiO/KqODyW/RF
         /Nux3MC2Rb8KddG1T2tRf1uKh3kmAWdpmdTtsru89B8N+NahiKorc4YKkBZykvte3Xv6
         pxFw==
X-Forwarded-Encrypted: i=1; AKwUvBzSDjW9jVpmOfCvo2hFwiNr29e4MJaZ9Yr+ule+BXCE0FLdAE+Ro/j4QaRJK6JTItcOxuOqTa8eJSRdwt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kg+AAUx1QCjEzA3QwSsJDHXf18sBFVgpZsu8EBOksHlI9nUTLs
	gAEcMxRn5Ei0klmHyRq+/Pia4bQHeOXvdZBekUJz+JN1Gw8IMVLRmKtQjDkZilGpYc1gqGDRict
	fJewGgRGrdoXKJcO31CMW1yRQiuaZny8=
X-Gm-Gg: AYBFou1OwQIYB00GYhOHrk0MoAmigEtbMxItbK6RQyeGK1+UbzbDk9KXcQ7sBc55R9K
	TMcnDDyfpyZatAgAPEBvtv7I/Js6y+L5jjGbg6xkqYruiONaJU4Z99gh4OrIIZV8muo4Dh//oGh
	YVsE3QrBQpwl3iqFhJBw3CvOMvjhoVTFsFIG5DTeFSBM96YQcRw3fq2br4hUVVNBvxJvFbW/CrV
	hc7UZKEPPb7Wuk1MCisk2UmPg21ETrPrtRmmoxve4iwCUm0pCU3xz4f8O8rAOi60n1LJk/rn3bR
	qmHjs4bI2fQPEqQ0zrYpvNkUNaYeiwGMZqPz9eIsIHeWimqWN88IjOz8gqPoWA9tXCbVW7ZGEkF
	4iPKKcGktXtotTF0FIruwZKz7SlQFMU0Ep3PF0mqdCkJbwQ==
X-Received: by 2002:a05:651c:a164:b0:3a3:74b7:fc09 with SMTP id
 38308e7fff4ca-3a5fbfd82ffmr9833281fa.21.1789789908286; Fri, 18 Sep 2026
 20:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260914014539.5015-3-sigefriedhyy@gmail.com>
 <20260916184909.279f5cac@kernel.org>
In-Reply-To: <20260916184909.279f5cac@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 12:51:37 +0900
X-Gm-Features: AcwNN1UgzoXHsJ_bxhh-rzhr-yWoPfk627Dv6gK26WB-RKglakSDcOZfeNpQwmE
Message-ID: <CA+7S2vLLNCQ=+rcGUyd-jt8ErtaVWgSxt3Ctoq=pJz+KZE62QA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/4] rtnetlink: add AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon, 14 Sep 2026 10:45:37 +0900 Yuyang Huang wrote:
> >  net/core/rtnetlink.c         | 174 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 175 insertions(+)
>
> I don't think we need another 200 LoC in rtnetlink.c ?
> Especially if we make a precedent for AF_PACKET and someone decides
> to even add more code later.

Agreed the logic doesn't belong to rtnetlink.c, I plan to move it to
net/core/dev_addr_lists.c in patchset v6. It seems the dump logic
should sit next to the dev->mc helpers it walks.

> The AI report about consistency check is probably good to act on as
> well?

Will fix it in patchset v6.

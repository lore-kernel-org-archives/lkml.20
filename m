Received: from mail-oi2-f35.google.com (mail-oi2-f35.google.com [74.125.231.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990FA38B7CD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134958; cv=pass; b=eI356sVeltFQD3gfJRPr5BXFDPT0HxA5pIcXfFuEp0qfQPe1viWTpTlW2FaycfjXWxXlXOHf1e5AWP16OIeURaWPlAOtYHeRA+guQFvqoowG8MzzqywgtSu+LAmPP1aD6l1fZdAVJRhqRyauO5cm/POtDU6QIGJkenluIRsZ01s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134958; c=relaxed/simple;
	bh=RRS6qEKxH+NimVpjKf06V/2sQCHRd4tVB6c5u/RsNs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5OT1U361NWRZorTYzTx9wASAfgM+zAM0chf3LLLSrHSL1ddsVEeexP8phfJfjKRmoXfpx78GzvieViYARpjqGHnRmrEtDSt4YPimzJMpghkRDf7mBTDQ+Yux4C36mE+zKuj2HMwtbpARvdrVjzmFln8kAeB1znocZtXVwIrhjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7i14aG2; arc=pass smtp.client-ip=74.125.231.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7i14aG2"
Received: by mail-oi2-f35.google.com with SMTP id 46e09a7af769-8055dcba0a5so136231a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134955; cv=none;
        d=google.com; s=arc-20260327;
        b=jNJIuCH6f/26I+7r74erCX6acURezvnwaU111dWvxv24baEE69wyUxWptqMJJEdSGs
         42aUVySXZA2vexgZsihgPgLZi0p7hy1d9iYNgYNo1P4J9kCfEin2IT3YQg55Va+9+O2p
         UWWhtz5WamCZJdY+b0HS8jTiulAFTnLsauQ+zW0X0sMs0ln/BIC/WXNvWERxHUrumGRv
         bqZa5dfxf3dlR2CkikhORTnmWyOzY/k0NZ/kmFEdASjZRFbZOTUrAspujj4L67pPqmBg
         FqbXMQpwOxf189A3THd9QmlHFeFBeySLYyorItDYiSzHSV+OVt1tWzV4kiFBE06VdDcq
         9BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        fh=3fkqoOq4SB3Cu4sAp74Dp0IRkwVFyQ6jyUlEWN6tAMU=;
        b=EvrX0PfYrTr7k/yUXwgquPzbTqwjRqjCGQNZklvy2T2oUNDWSm2TFBBUMfSSNVvMbS
         nYbKOh5Zz7SDN7UwX1nCMl2WXAyXb9sdVRk3k8NQ3QrD5idInyVEhcB+1UmuCH0/R+jV
         HjM2LzBdA18nnYp9y/arEKI9O/Rip3T98RP6tn2EH33EJpNPMlmTUowSZMuhAA/0bX3H
         WUb1SnyRsEbZ+/luGWn5R032SkyFm1GZndXLpTxpezVGKY33j8jQX+EDMbSnNH9DYbGr
         F8vRE+9ryq8Rew1ssR0E1Y3pnjF7SU+3GTqzQp6UeY1vZENvQ5SuTyrmscIbbA+KxG8A
         3IxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134955; x=1790739755; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        b=C7i14aG2bdgWqlopi+nQc6ZicQsDdeRNbLRI4NoCJsTi5CbKDln6oThZL7YI/ECfeX
         /2dMbXp6OVHkwj/KS4P8IFVrkdD31J3A5fplmByd/FkPwCLQxsl9bYLvk/yy1Gj9Y9qz
         HcKm8LlyC2xDeAKgLNADlIUHQ1ChrpWMN7nHrZeG63A9sctwXxekAQQ2BoI+UpvUwSiI
         k/OguCoTP+huCPmOLX0rUeZCEdgjM5UjaXifFevmz7h9qlvmPkzMI5/GkQS1wl6277AK
         MNS4Ezr0V43VHo5Hx5sqZ5B2jTVAHsk367MmZd3pt2sGUOBVo+HK2nRJtrVaL32+CCgn
         mdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134955; x=1790739755;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        b=1Ko6cWg4POEL+UfFaNqRMAb9W5XxoQk6poWNtPm2/m2BZcJzcdXHopfwdgzUwSQKq8
         bsOw3R7Ky4uZ7Nc3gAoKuOtYtetPyDmRwT0rWky7L5InO5Y0WmEfSJgA7xxmO5KVFOK7
         47SXdYg3thXIGh9BoQeEAK7WnsIU2oYArOGD/cOxAA5x7St8pAj6VlAvP6JCK+ue/dRU
         7I1ZUBdGGZEkIrAGGF4ouDjdzU/UYjBvwPL1FZ6Y9OEVNSU9jSRXoKv4CGC2qH1zgHzr
         dno+KfgFJ271KBdyYiC1VOUxibwzX9l8LVDIYhBW5FUrHZPGK2AJxh1F2AVm+7SSu8xx
         b6sw==
X-Forwarded-Encrypted: i=1; AKwUvBwumSHkeStpWk0T1G+pDKEQoDSJer/KPCJRjOQ1vlGASdwnW4enC0wj8NjBYMA9VW3twF+S01x6mE/Ug5A=@vger.kernel.org
X-Gm-Message-State: AFuF++noatG0ImIdzOJP9cIjn770Sl9q1h16XeS3gzh8CSADiPqe0o3f
	Np2X1iaYL/L9LnRj1tRvWiPQCab7xJjoKcPo8cyJlJHHM7xgmcZgK6jjE22pyeHyvJJbtU8Ejee
	BbPTagl3WRV6jQgVR2UOR/H63HL6Z/Ws=
X-Gm-Gg: AYBFou0ho3Zku9a+zBu2Nf8IorSmKHoXUu4fUzLqMwrJlHx8Q0Z4BblsFtKMOYh/abL
	/PGegpEF/7zpmbbfY14elNJ1fEly8RGrFVLxj+HtXb7RS2LVu9UgZwNLsLIfwPZj5aNzT5KGWvL
	a8FsFjmAZEXEzRLnHMkqv6qmhC3jmKyAsSk6Kl+coXpx6dajQCev6QwTTaSl6pEqLWu+VL9OuL1
	GZboVlt2qyCx55SqLy2M4HYKj03Qvepol7Cov9Tdtrjls9LwpqsN5+sCG+embucz0P6UnvYKdZx
	1As2XDclMGNKI4m06j3toZn9Q9/5+6QiZfNWzDI1o9Dqq87t4mCuAYzgEw674j939+PWaEeUVsi
	Md1R66JaGZLB9Oc2hlKgucU1rsSnpkCG4MSvObzw4vJm7
X-Received: by 2002:a05:6830:67f7:b0:7f9:555:1def with SMTP id
 46e09a7af769-815fa7a1a70mr1301644a34.11.1790134955518; Tue, 22 Sep 2026
 20:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-5-sigefriedhyy@gmail.com> <179012275175.2160803.16091441325063775173@kernel.org>
In-Reply-To: <179012275175.2160803.16091441325063775173@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 12:42:21 +0900
X-Gm-Features: AclHuK8TXSgkkQWPa_o2Ozz0Yhcd3LUGBcSyKUw1APvq-PmiuvaOCRWU4_ZVJVI
Message-ID: <CA+7S2vLn07uAcPQTV21eXOsCMmG6EVOaM0NBAkRtHcmeLZf7yg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [High] dev_mc_fill_addr() (net/core/dev_addr_lists.c:1210) emits
>   IFA_MULTICAST with `nla_put(skb, IFA_MULTICAST, dev->addr_len

Existing issue, /proc/net/dev_mcast prints the same bytes. Should be
addressed separately.

> - [Medium] dump_mcaddr_l2_check()
>   (tools/testing/selftests/net/rtnetlink.py:113) issues the new

This is WAI.

Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C6530E1C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952559; cv=pass; b=CpvHc31fDnUF10/8zmyXzZHBvu8y7rDViEe68KzWcKli2ogQVxWTr0EaBxDxjdsvKSV2ftSZWLQQiJbXmJv+XihkpocdLaymmPa93m8QSkUlbzdGmdlsJBysHqh3F06fg+LP3BPN8FqhJDZlTHL5hkaKgo7hyKs+oDmx8xDBVAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952559; c=relaxed/simple;
	bh=+j50wNv2r3xNtSsPdNlvPp69DU3jj8cq2MKhSUhc5Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeiqONMYKQu4Jw/0vkI/uq8psuWsVLF7f9f1R5mdV4aVBh6fjvuBny5sMeviEBE5vm1Js/dSIG6abRxieelb3Jue1+pc4RUoZwS53r8GqUj6KJQaOPJLF6GLJZwlT/3EHeuutd7KpipqT7kdcF/xPHwx7ZGfOJQKMDHjP/nc9AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C63zya/L; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C63zya/L"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b778bcee05so378378e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952553; cv=none;
        d=google.com; s=arc-20260327;
        b=BKb6D2qgWTKYxdbeUhINdMj56z/nAyGazpQrbTowoler8ApT0Ii2Ek98/fMuLf2X4c
         psXtxRxBvLiHngwfr1iAudClwSLJaDkIqOv2TN0yC0BOll4ZJ3kCZWxPgQSDJ0WiFZD0
         n0F3eifb3FxJwiq8fLv1Q+BKB82byi4TWHJj1j6oPPo+ZQVPOk9W3mHO+GByZozw5cBF
         eQdSRiKnc+Vv9ass4AzkKQEV1Lqwi5qgBgrMblTvW5BrFW6vRSzNcu+H1l8AJ2e+qgQG
         p84lRdmhw/2Szbdp9tksZEacgxKX1hM6KXKhML2ZHw36SgBVw7AGJ/jsijOXfFo1IX1Z
         c1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        fh=YzLPfatccseHry6TMVL04mdAcfG3iuykQA1niaCSrjw=;
        b=TTAo80yTntE/t7g9j7hCYgSnDqwvis/vAabIHHwNH9/g9z8fdaxXbvLV3L1wQvu681
         HTBzNMVnWJZPYoPCIyM9/gTi6V4H0C+ykcISNTVHj2SigI8+q14rAFSCNj86Kyag7LB1
         uMQbWdPT2T5SbfVk3QSvHeiJ0acPFp675nLCuqZscS4aQ8fofngo6BxbH297QZIzznyU
         FMoskcNTcTjSjOyNqEnOqs8nOHg7MTd7YTv4npjQ2nOLBps1h7bmnpvqWFj9XGDPNfC3
         BfXOtdBuEA1mmn1/m/wKRenxLu922k62U2QJN1EnBEMqYC1QwHD3OToYbaZMCvAmYoXL
         P/IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788952553; x=1789557353; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        b=C63zya/LpWmCGXJ1ydVUM8LXgdoY+CC82am8T57E8i3/V5F9xluwuc2hR1pjWzQEs2
         F8u00psAJXRgzh7vjx61DAZtcnQNVcqbOxSuWdJPkIbMeV4z2NVb8OTpY+dyDVv/TkBS
         tUV15Gxh9lmoN3RwMUP8O0OY0n4460nL+qIigFIboYrsBiwBRvR0uZ0JKJ8uEb8eeJnm
         qdqPQkvstuB8WAElfpkMca/EHjnoGLOl+e6Nw41snfE0Sw171BS9GQ0mUJvDUvXd1Bom
         d5uB4V3GTcnnhg8yTkOUTgWfBhQGzq4EtQrA/9okQ6uuOmc5NlG4liq0/acgJy3xHrTQ
         3jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952553; x=1789557353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y4cdUU4wdLJreuRLma15s70p7885T7zuEzvFUDm+iJY=;
        b=jUS/jv54f+EgLNrrYrsGIT+j0vh3qhdpjw01qzj5rJR3q2gN3PnX1k7xDAJeTAaZAj
         ZrITDmjJHEJ0C7B4AUo8NNbr76PbGf7VHQ+bFtxg6qKEgn2AI715J41+xZiPKmYIoqu2
         6OftgP6/RsnR6Xc6W+pTMKa7ZSGvjnUw++xLfsrusVLXfs4hXOQoLwXpplMAvv7lgo39
         z7bciLETDJ27M/xzllImd8pwkhfLSq/EgCPRSzFfp0mEzg3yNR4wrWvENxFuKzd712KY
         u/lUTXs8Yo80buPji9w4z/XZxuTA3yYrGqSmeOWgV6xyE0w5i/8Mqy9EWrYtxYTgc7Zk
         +7tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg2EiyAmwaBKZt80mCEDZjvRzerJ/ofyq1k+taY/WxhTm9rb1luth9iMUqCYIL9ER02F+vFwyOrL9ONM4=@vger.kernel.org
X-Gm-Message-State: AFuF++n5Ff5KPvmhONFHChNDqpaXWd9beNlllqqye3p4YilN1PTVJz1U
	aCujrFalteWB585xm9xcxOJ8UNuVV2bf0YA0R3T0/n0l5akMywGGSBGC+LJMA4AOcwJZ86dc3+8
	55qvMMWgc6uF/yy9mZ76KHXbgDvdLhCg=
X-Gm-Gg: AYBFou3ekcc40X+8OiTXM3omM8MCxELVYBuSFrMsiNEC4NFwAW0nUhXlPQ0Ztz/c7/9
	eWmmR34mPvNrFzry1P9REP6UkJZ0UJhR6T0OBai3/ji5nDfpHRkoH69QhMEGgP99GnCXr/4hHjg
	BzSgsOg2SPoj+xj5o6neMYnc69KeuxEDqU8UfPbA+sfDg+VNv/DGAGpiLTa9tLbpSe3Abkf+q9U
	fW2yIERxmZDSOK1pghc5XfGzivXj+5Cr9fgaXE5bChzboRV4IgNrrMvCC2TqaDVV7LLY/oz4Un8
	U4BUrcykGm0zerH6I9s16u1k0YBJCAhm/TusbpxFrtmhMbLsjik3FH578kmOzSkswrOMtZMKhrA
	xxAZx8qfolDEORx86AoDvAxUcLYNzlFmXT5axMi06PW4=
X-Received: by 2002:a05:6512:108e:b0:5b4:a9e1:b8a4 with SMTP id
 2adb3069b0e04-5b616f4a238mr5849435e87.25.1788952553103; Wed, 09 Sep 2026
 04:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-1-sigefriedhyy@gmail.com>
 <20260909013401.14408-2-sigefriedhyy@gmail.com> <175b6b01-2f8e-4b77-8504-6f26d9f8df98@6wind.com>
In-Reply-To: <175b6b01-2f8e-4b77-8504-6f26d9f8df98@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 9 Sep 2026 20:15:42 +0900
X-Gm-Features: AcwNN1UbxNJzD9rsLIr-ful2KYX9yromNjRe3aj1Ks5MUzUlvT_D5TZcbmgqvTo
Message-ID: <CA+7S2vKm=4_JBocQPq7OCZ6ZSaVOVS7UUzQN5Rd_+ABAFBkQ_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
To: nicolas.dichtel@6wind.com
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +  - IFA_F_PERMANENT marks entries added with SIOCADDMULTI
> > +    (netdev_hw_addr::global_use, "static" in "ip maddr")
> The global flag is also set for addresses added via dev_mc_add_excl(), ie by
> some drivers.

Thanks for the reminder, will fix the comment in patchset v3

> > +     ifm->ifa_flags = ha->global_use ? IFA_F_PERMANENT : 0;
> I wonder if adding a new attribute IFA_F_GLOBAL would not make the API more
> understandable.

Good point, IFA_F_GLOBAL is indeed a better API that will fixed in patchset v3.

> > +     struct net *net = sock_net(skb->sk);
> For consistency with ipv4/ipv6, it would be nice to handle IFA_TARGET_NETNSID.

Will do in v3.

Thanks,

Yuyang

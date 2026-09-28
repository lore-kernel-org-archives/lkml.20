Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6E4BA1C0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597203; cv=pass; b=Cpi37wjTSqgrRjtwW9WxRmY0YASIm/ecqUzYM267Ypk3pgK650ebdEKwK4tSGYL6ltLjfSy6l0SVgcNbPlRfEsufci4V2TVQvsYHEVUUfEzUha9zGgT7jkqLABjZOegyp4ww2eP0NCHXI5RTfBtddbpBjkpkUWqxi2mvnLCW6Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597203; c=relaxed/simple;
	bh=4evASwW7P7CNOZ4MoQEq5aMRMPrIibSAC6+oJk6cUto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdrlCAx7dhhYtJqCDaLCDBGxOMRFjKhM0gHWZjBgbwNYGODFaxpPdCjM8eb4VKwos5GV+SB8/aLZ3XPRxQN8lFeySeOsAkXLvZ4bvAiV/gllbi4ZYTeFzeso9Is34284Z6rkDDJ1Q7NNrewLe4iDeCyaJMFJUetoR8ZC7tDU3/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMANEXyh; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMANEXyh"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a651f928d9so20625651fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597199; cv=none;
        d=google.com; s=arc-20260327;
        b=ZxmlhngD5bEY31RELELalNSobeMJ4fP0L/zfGEUd9uI8gnh1oUePFG/6kvHnICypmm
         9wY8nRbtVkQY3bSnevZf0q3FDR0rOPGGwXq+Y+Eriris1PayGZA3mR5XlyPesdjqnfCo
         P+8gPSQqztl9NU6UVgUuJdkK8JW2xra7eN2v3g1crJK27DhCWq4T9FrO1ptMjAJfSrtm
         WfA5yuZoSf4kNGCNWzrWbyYftNSWxZRNikU14TpoqvEXpeOwMdND1GY1qKKqPD+OsqxJ
         0blYDXVMDmYZR6WZKcZRGqTuFywdcRkbrRz58IqpZJch2g0MBYbLLbhFXnjkYWUfC7EF
         7Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        fh=CO2O5rKQyJV7pHJJVbtDh7r/ILX+ATmGSxHZHw00WEE=;
        b=sxtnUpfMZAokFCsuV3vCmL6SIjQWlIT/zS6D5CEQaRoEMEuxUGKI6jLRJDfvfhHMJI
         yY/vdH2/YR9RFras796ahHqgmUmE215wjZeD4LiuuvlV8Xu97/thQD3adGcI3ORZtOEa
         pvxpR1RloaMJtJYpHroghFrHta1ZgAGQriActYqIHphjKYbNOUth7rYUo4/MilJVZ/FS
         8ZtSkjkScrJUkWHl1RasGa09pi2Fs8hikQETg/eNC0lJw2Ds3I5jkGjfgGzvTPgZ9Dyl
         DWYn0uPotWgKLW9GStHdxh+FTj/gbtVeHDq0WQ/dnktCJ43iZzDAAQnLTrCuUlbFI1CB
         lcvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597199; x=1791201999; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        b=iMANEXyhN8X9Fx46yLOc4dsg471HFwvd9drJzsZaLtzROzBYRSL0eRM0t6SiAgugeK
         AmnzA1dSY+NUpWCSQv1W76pQoXwTzWqGDIO4HG9Y5mhyByyhkrimn9KABwKwIvwfTIqf
         VoaveACy9JUMsgqT7mLlroF9Dnu5fDbvNrcZ7W85SuEj6kRV6rZpTXHddey6uLyjDjZa
         y2EqPbD9+gBX868s4E+WPaKsLnSCMOLIVx+6S7cfCMPvuam0viNy/Ab+Av8GLn/HMNr+
         Cgyi7rrU8SZx8tVYZNWs5FMoDFZr8AuEfpY/EOspnKXE6OpZboLGqWpYsRVRMI0F6rdg
         8Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597199; x=1791201999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        b=TCnAad9DnelrIVe6qh+VUpv8poSyk5FwT43QENhY70dezxG/HnJGN4sGcSr8v4MBg3
         5SEU+YQMVyMUHFZyrKooXp804jlJie3K7scT1WUmzKf/2ISgNaqg7XAWAwrFIxZXNQST
         lzcktT9jisHlIPdBsfL9WqJ8PZronY4vOA0C8CSb6CH2Hhz51raz71Krf0pu+QM58yzK
         hIZf9xfq8ThC7MHVWZEzLN9/KiKNzv7kORApeZD++SteFqWCVfr0uA5TvCtGnHu/WzJX
         Vi9DokJTo52d3FUwUrxiJlCU5fm39VNcIkPYjeKCgiV7uFCNqNX9lVCun7jX2CaqS9Xj
         TZcA==
X-Forwarded-Encrypted: i=1; AKwUvBwK5n3OcqSxnEOdzPzbQbsYjBZpTAIgEsBaJ6KiHpH6PnN8rrc3jHVuSrjNJFmrZW1E/MEU535zWwaj6fE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyytD1WTWxw3b/4r+IipvPDJVsiWP5nprvQWKIHuAiVliCWgzd
	Fh7kF/ex7xqo61Cwy8mqBtqN/ygrsTqhoqaz6hexgAaE9dpQqX5F2wNs/r5JtGAJ+j+pUxY9XOc
	69PrZV2QEIpk1vgJMb6ZWiwHV86Dx018=
X-Gm-Gg: AYBFou2MLf8Ds/ZtoCIO4weryuusba1ayX/kLFcNl0oZ0VO4Sn2eWlu/G8qkS/pKXs+
	UN2eFkFtHeapzSuElQH5T9ad27eKDs+auD5Byg0sVIVdqRU9rVsdPzTlyw3AIA7lr3WreUVqQ9O
	YLhjjsDPd7DgZ7u06PuAJWBAcspOiEH/6bGNpl54TlfPF2+1TH3mfOkssWMr7YUG0OwD9Rvc+4j
	umIXie7bnOzncc06z2tTLogsbWLZUgiVEgiJgjpQIXL8zusZ6kbMMjCoFTDxjWR2q5dxazCBXKA
	Id96/zMlSuOPN51CLE4HdBQ+DoEJsLenQzEOUyFzVhPRN0nwudT/J9s/SARZVSugOPTsfFfBjfA
	tDNxyXhEfqpeXBFpnXSusWUa+EgHaJbipwRyxl8yhIg==
X-Received: by 2002:a2e:bea3:0:b0:3a6:6590:fe9 with SMTP id
 38308e7fff4ca-3a665901989mr11898161fa.23.1790597199210; Mon, 28 Sep 2026
 05:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927002427.4519-1-sigefriedhyy@gmail.com> <20260927002427.4519-3-sigefriedhyy@gmail.com>
 <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com> <f72a5150-4c75-4d71-93a8-8b261ca9762a@6wind.com>
In-Reply-To: <f72a5150-4c75-4d71-93a8-8b261ca9762a@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 21:06:32 +0900
X-Gm-Features: AclHuK8vcBPbo8FWQrndniQx12n1nqnhRIJrnPMscvT1DLMWqohrVqCxkvZ-fP0
Message-ID: <CA+7S2v+hDjbJV2akWHtospORWSwkPuLWeDzidUADUq9Mh-Ag_g@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Renaming  struct netdev_hw_addr_list->count to _count would help to check all
> > users and highlight that modifying _count should be done with helpers.
>
> This comment stands.

Thanks for the clarification. I will use the helpers in
__hw_addr_splice() and rename count to _count in v9.

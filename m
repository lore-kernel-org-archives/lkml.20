Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398946;
	b=LWdScOaHtvO8Yn0qA+drr2MhFgb1uZ4tzq+VHlYX/yzLpx2RRE23acHhwq9ymrGlUzsC
	 cLrrgZGSlRvSqyRhaUe/8JD2UUiKBwU6i37qgeDZjHJDyjtI0vkOVhKLUd+wJhHQF5U6b
	 onobV076EJP/WG0CuzkF3koI4IFWuYm8p1ZtK5WbrNwYeKBrxwBzARpRy5GzYTquAUU/G
	 8VGzcNosUOWChu69ujZLPX15f4sZLDDMzUiLsVB8BcKIps1IbDDTpc+0URZuF88pQ54xz
	 1GsaKvlLVVPNuns+9ZHRhBFHPgXewD9BpbIvpdRrYJ0XRJxzreBX//+yX9dHHgTCjXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
	b=Nbu1j+AJTOpEo7kXwyR39TsqW+kP9SRIL29uLeX/l3sBfWU/uk2UvDapqqGdYgoXr+cH
	 AvG7isJl3vqHCAboqDTISaXzFujNA9dfsu9ay0zRGOdXd5aT80V2SwPvV5GJDCS+QI5hu
	 cFCJmKq43rWBAXQ+E5L4ijt3JMhepr+Hn2TYOndga/KrCkz+C9l4xNq5YONLlmlB4XUMF
	 0XjGiX2inzQZa3trBr7+UlEaG09WWe8pqgxyFfWLBeKzzmQHMnvmudyr15RJclmlNyfds
	 YjvzUGd8pOlsavqbT+tv6knkdwlSpJ47bAHvB9EHXtbPLuyMoJSQ+WbKXaMv7vsfB9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iaGytAP;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEC4606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0iaGytAP
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06c60065fso867283b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398945; x=1794003745; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
        b=0iaGytAPbeI5fAusmFtYFGoODd2Pg5dBYv6EA4h8rGqis1I/kVpxyMNfJE85eCvMEX
         jSBtbOpj6Ft5byoDf7xB829YoTOwazmdit0EgiNdTYE2eSsaQotwIiYsG2ABsmbQOWPI
         eRKmiSgmGzKK7uj4DAK0XM5YkUSuZySm92VWCWxGIwJpkp3g1H344tmn1VBQj2sQWjrn
         L9NuDrjqW2aF7b8RSRyxWkLJwYE5mx/Pclewy4n5MS/dFx4jgUp1n03gA1qXgWvkC2Fa
         8aXoo+o+6Nc4Z/6fX66d3Qujo2ZJiJNbayS5WvqSxiBSCA1RrVGZv3sGEfBnWPESZd3L
         VrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398945; x=1794003745;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOhv0H0wKDT8tH3E7ShVIFIuKTH7HC8Fm0b689izP2c=;
        b=Qo04jTtbYUYO9cZ0akSprxRvnHx27spl8hC7dIxaNijnklBUpBmg4IuaUM9OGHo4ZE
         uQETSvLhtuFsYehnVne4Y4Af7UY768ozu1MnKI5zxXBW5FX+mM0GE+3K0mzjjGZ3Y5iq
         tNzJxnGEZltN4uJbMj4MQ/kA6cHlcdnUTvwuHUcByQDFs0TAIO7xaA+79H/KADa1n3qf
         Ho9D2Ldwucb8ZAoVSMLBJx/BmrXN7gCoxYR3sf6HMzThub3uRYBd/BAu356SBH5d67gu
         siqSDf40pL4j1Y+l1ub2Fiuroj1lnmPnLCGQHl9wkeATV9n5zcnJ6ZIoX4p1BiTdaBhW
         z12A==
X-Forwarded-Encrypted: i=1; AKwUvByA9u1BJL98Vxr48SYVvDt+FxfHFw4pApaKhtO/uvtyLeFh9/V/YSBkGyweiYja27DJ9Q8r87cLBc/nZWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3oFVkdj45B9zT6aZz33KUx4tTRU2W2ssB540rxogQFyBh09qy
	cHVr7+cTwuD9yZ0M9gNeoMPvNHOtIDYBPSGmuqNcKn7nLkFVN/D8zows
X-Gm-Gg: AYBFou0NaR+mD+WbLgEM9maRSNxSaJr0904fwYF34G48/V678oCwQDdodnxDfe/p2f8
	vMyV0+/JvYvz1viKBMvsI9KVQbj6vXiGCo74haN6VPKB0VE8mjFxL4YrTjPPbZerpQALxG67+rD
	DXVBaBeqFXU352b6CCx9J7M6l3cVHTW18jgw1ANmcyZFlSv3AzpnvA4s2541jIuyJwJ30A3JmUw
	s+yxy7RYDM+ciY59fZi7xRHIYhJ9osDx1bUlKIA8nmR8jqu7jR1hUSmWiSYucpjqDlM+Pt7LFTR
	lxoCvoGe0H4IqfKSmJRIRCzDwUgMuvijJZx9IMqW8Xud4DnE3IdzUSz+7QbajwOj4de39p6n2HH
	/Bp3kdgDkLWOKSqFGgw/JPd5PPfDuvccZhPFjmouQulvuqVikQJk4IXehIRDiWnTyG4QliKujbw
	FhmyLi7W3KBfIv+lfav+Cv23aK3/CjxWSzXKRWlXgtzP/pjo9jKwFPt4LmEqVpREJ6nDnNaw3EB
	CR+FkVAGo1H+RUyWr1oqNt+AtmUa2QSGv60STxYn4bEf0UrJTYEeKa3+8LxfRoRJRVE+04P2gua
	5GtCOnthZqieVhrlp50XW+u0ijcDNF81+PPjR3ZbYFygkE+ycMJ27aEtdIxm4+1b3/4ThaX3bd4
	d5lHsIhJkfjc3EMLIQFp0ToVnZ9HtiKuWRQ==
X-Received: by 2002:a05:6a20:c98d:b0:3e2:86b6:9be9 with SMTP id adf61e73a8af0-3e928d4687fmr3155562637.28.1793398945278;
        Fri, 30 Oct 2026 15:22:25 -0700 (PDT)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d38eesm414805b3a.40.2026.10.30.15.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 15:22:24 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 22:22:24 +0000
Message-Id: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
To: <mikeba@sentinelone.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption cause false
 recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.sentinelone.com@kernel.org> wrote:

> Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
> preferred fix for fentry/fexit, or would you prefer a different
> mechanism for reconciling preemptible execution with prog->active and
> the per-CPU private stack?

No.
We cannot disable preemption, since progs are not short
with may_goto they can take 1/4 sec.

Sounds like private stack is the culprit.
Should we disable it?

pw-bot: cr

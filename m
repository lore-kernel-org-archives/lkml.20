Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0764AA1C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551712; cv=pass; b=RsfFAYdKTvAclyMxNZ1X/Ci2rg/ZWKFEAcPAyFHCzqVHpuEvS2M8LFk5EQlwnvUWgNa57qo/7Y8yY0ayDBpWqJE1Ob3RGyebDdhk724vVY2VYT8GQ2gmD0ZA92SEh8roB3pJGhA+HvQshybZSWdYiYlKfd8Y6H3cR+OHVlwqdgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551712; c=relaxed/simple;
	bh=dd0XjmXLbr6av17ldrfsndZXMA3/+aCy2CJ+JrZ60SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNzW6vURchTQI9VJZFkKzRoz5QyPINbQwqOtvkHw+m0SNbkEfTXhUOOSj9mvZLLym15dUiPU3+6YIRgNIkuxcHUVKkjMGBy0WpbAUy6ioIkdQDx/YsXvY3+GElxIfg25USvrp9ygK5Ex8cgI48Rn0j73yV8Utm1ZNQDgF51gmIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qQck2Eax; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qQck2Eax"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso83349685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789551701; cv=none;
        d=google.com; s=arc-20260327;
        b=czX3m5z13UYnpr7pTMWsDvT5Ns8z3J9JTe6SKazgwkdWpFQr5kuzh3Rjm+Qsq7lgN6
         6z12qH9HkzPF2xgMbJFAByl8dbDsipz5kPelWJCF2bgExNkwyfdqURj0v5sJhNu53LNI
         Vc9xW/zO8hLeQUvRFsWiPqOBBGcTIb6ppcW0KxnHO1gcbkaV+8ONDmnSDgj4RzJPSqHk
         YsXZsJT0UlSCKTsuelTKmH8YMQAJmYk2jcMhn9V54xMVqhIT4fPGQ6TlYxG5RcEKbt2Z
         y9H+bgI795cmMOCqzy2xLsMDpUGLYo1HiDWg8JVIOO4eqT7Jop1wR0ASd/PtXWRYRgso
         AEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dd0XjmXLbr6av17ldrfsndZXMA3/+aCy2CJ+JrZ60SY=;
        fh=xrDzM9hxwTDCK/CjHZGrcaC5aXzrdZW9CRHh4GygG44=;
        b=qzFEfCPtzp3Jt/Oqgtm5v+P0QwO383CHvAIAkLUzD5JjNz+1lEVMP0uoskzPuqIOSL
         7gknsiuYXWzcFfOMrxcIRKVkb3hdR+vBl5pcM0A+pS9CIV0HkM2NQww8x8UYz14oLnV2
         kbucAiIBZwebXda8cFvZwwcF+1TBVkHgOt31DI7fksBjCtmFMf4pud5hgRqjq9urvFA6
         9qYDErbwGerDfKKzcsYpArswQAQDiT9Lof3WmRlK6voF9DSoLxAKrKDUxd3TeOT3NLNu
         DdbKYneyVJ5iNR9+73Y+x4YrFZRIMG+Db0g9lbwJlH9mvSNO+xTs3qj/pq90tuQ7A0Hb
         l9Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789551701; x=1790156501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dd0XjmXLbr6av17ldrfsndZXMA3/+aCy2CJ+JrZ60SY=;
        b=qQck2EaxCKi4Uv0sJjK3manqk1cVY7UTs+3b6Rg7JosOC0NAhCZTy3X2x9wUG0VV7Q
         WcNv/i/HyuUlGMTnc2y4LJEMccBKJsEiITHqf1vysluHNcpxRYbmligHei4FYY4IJIV/
         QAr5Af0qjKwl1UtvyZaLvQCUEcZ6CpiU0WxdoAXkDzkP9lS3eQXamwqkwX88tacqgAID
         7XoO/Fb5o4U/p7+Xna7qIIL9Pn3KoSnMxvsv5/ekXojPfgns+1kJxR6QNqKQX3PD8Kft
         9O9F5sxZF3abTKexlCbyDCQy0usdH+BmLkdq2dp+QZv8pbE6/+wIulSeb4BaD05Dwh6d
         oBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551701; x=1790156501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dd0XjmXLbr6av17ldrfsndZXMA3/+aCy2CJ+JrZ60SY=;
        b=wDxZNjWKzi+jj+WC60YUiIyiiNDdNtiBiCnEEEt65JkY2AFnL6RGNbbbK5vYcm/B0n
         s1qVtLNcNSeaRgCGMuSC1tEdf7s+MXN7fmDzEYYxonvlzpRyQUwHoqez5idM95WQE6Vh
         4H7RbwA39DEGAziKl9N5ZyNkL6h+S92rW/u9R5gpNGKB+Fbivyefu07pNlYyFMOMCsME
         sPHaDWpRV66ipTm8/XcmD1Y0DVFpRKSrNRtSvqzaKBLzqvzRpnAGtvF6izw3BDRfmuds
         KcomOx/kdNvLxIU39BKDbxJ9zAHE+PfZ9qjiUjIqL/TdDM/PXOQDcbxFPVz/WZJlaPkK
         Uvhw==
X-Forwarded-Encrypted: i=1; AKwUvByv2C3zJ8ROlxONdc6HJa4o6Ea35pO5jAccJ/xl7Lq+bTd+Wr6x+alSxkOeA0WOkoKao3RQLRoZbYEY9cY=@vger.kernel.org
X-Gm-Message-State: AFuF++kuaDIBmK1wQmzn9+ckqxwMKsYySkajdB42QejGJBT9m2u76Cbv
	RtX7hmT6qc2QzLw2cEexJoqwmCwfPJ24txLENsgtuK5n3AgYjKvRBqcTZF0AWiSt8j0NM1W1dvv
	SL2xlIRvgEpWkrrnw68HoweSg+JVP9xMckr9JgSZV
X-Gm-Gg: AYBFou1jRu+R99bnwgggCtAWr6n0/ubOotBK1Z4XMiiQpEoEmp6VS+RBR501n1rjk/N
	pPJ23m+QE17xpz0lGscqq6iyFTd+NEDvjaJKjhQXGhSEeqDuqgbBhfoqbuyYbxvIc9VONgVNYbV
	fEI2GjW8A8iWeMoaYYRMxAWjjg6jzIxJjTLZxxrz5sbbuXuRqwuQamWuI/SzltTBWUA+z//QNII
	0OViiMdapSq7KexSj1w+kZPmVQFiYbL+lLTtBQJtQFy3zrGE35Oml94QTHDtgBQ556HQANSKONB
	c1/l3wwgFB4Th9IP88xKriuAwKNzMtvxe/aZqcr2sITEAZnY7ZTEfR6N8ZxHefBVnSSqnQ1+UAX
	ULFaIi9qGcpPwGQwSdDIMleFQF3tA9Stg//4scpd0gC1xw2siqZ/XnXAtGUD3m7FjSYQ=
X-Received: by 2002:a05:620a:72d2:20b0:93b:c22a:e98a with SMTP id
 af79cd13be357-93bc22af796mr17857385a.2.1789551700440; Wed, 16 Sep 2026
 02:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916041102.1914333-1-xmei5@asu.edu> <CAPpSM+SpeOa5uo5rffXejDa4g9VGphp1GvirJgUWze-O+cQyzA@mail.gmail.com>
In-Reply-To: <CAPpSM+SpeOa5uo5rffXejDa4g9VGphp1GvirJgUWze-O+cQyzA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 16 Sep 2026 02:41:29 -0700
X-Gm-Features: AcwNN1UxUZyShrWWdOdzZP5TvGhMt62DuqGu9sAhw7uSD_TZmpKiYAfpJ3xalwE
Message-ID: <CANn89iJtyY_ooHfbqPw4=GVwXQeEc0k6RxS9dJGnA8TZgu8rSw@mail.gmail.com>
Subject: Re: [PATCH net] bpf: lwt: clear stale IP control block after pushing
 an encap header
To: Xiang Mei <xmei5@asu.edu>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+ff13a35f73bb7891@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:32=E2=80=AFAM Xiang Mei <xmei5@asu.edu> wrote:

>
> I just found Weiming post a patch solving same problem:
>
> https://lore.kernel.org/bpf/20260915170147.3943392-2-bestswngs@gmail.com/
>
> and that patch covers the cases I didn't consider so please ignore this p=
atch.

pw-bot: cr

Thanks.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816466;
	b=bzqth5HvIw5Se09fY2Wgiq6WT4gifa9MA+DNjcs1Z0g0VAv94t5qwGNLXq9TndDSvtZ6
	 sIdqFVzu5najo509zelqGxUermNYcpXOxRmX34peKi1h6/Xwy/cHbJ2ugqneHqowCnM1S
	 C4tIWaiCkHNHUVMQGHadI4P4mz0Hj4y8IH66DXgpLLHGh5fOJtgZ8Li3yGeiKxUdZdRsp
	 n1TopED5/3dEyQxsT8xYekHZlfqJGsPlq+WwolbrTg2M9HG6Baoz75/NS3p7bFQ9rfH/8
	 NTy9fy7VlHjXhWTpQnApxB4AyZc9QIm7z9K8HZFEfzMFsTMZoc2RxiImPe9yO0g0+eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Pb6xr6a8f5h8gb6JGzQgb39t7gGon62SuzmS0+FGP8=;
	b=gTmeMu+ePKdXcPdVxQA0JS6Wg0m1pFm0oRdYahsoYbBTWPytCFWul1gp3+rHezYPLLcL
	 dKIYiDdlBN4Qsxpd1BqC2sYYvr19KXNr5Yms/vXqVTwauv9pV0yKGWJ32GhDRFdwbxW4D
	 EnIDXrwSpnxoiXS1+gCva9lAPVrj8WyG6uvrCoz1wKszS4pFgRoJLTHJUPfeej/+TNCUy
	 hyGW+AoBn9xPPZadYPjDPEyoEWG/pN4FD4ztNdAUd4bO7WW7oYa1vnNnDSSvOORWc9iKS
	 pBr3EF9aWYNc3k9IphstC8SgBTDQ7DSyAO1JTlXXFZ9U1PGacyIHBiQS6/aT0JcRk9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=fkMft+mt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DA3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=fkMft+mt
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40f29667e6so554439966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794816464; cv=none;
        d=google.com; s=arc-20260327;
        b=nRkIcVyDwKht9UqoUo7J9c2ZvB6uSnJbpkSezDHIGg3NTkRvlNqrag8iihXuY5SZG2
         CtGo2LXWHLwJj8zWMzKJ8fCCd5kYdhw585VNh61MT5PPdeSOIkTUT8etP9LSLfGv5N1B
         DpvWzKokxCTEL0PIaWy9LGchFVCkH/lxVT4dTWXqhIV7R5HMIoZqSTQLXO0AT6LEfDCf
         Ve0hO2iVA8gGdvaCOeqZ4UwnMve60s5K8U0JrEnZ7O0hQcexg4+LjSkenQJQCe/VpWDh
         uDOsFZ2zlKAkr+zRuE8O7HpAw143pOrwpRqYgW3Z6kBgHtKgXiZV5bluLnauz8hlqfoh
         Eo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Pb6xr6a8f5h8gb6JGzQgb39t7gGon62SuzmS0+FGP8=;
        fh=Gn0RtJ9VUlep6PZ0Be79YTceh+ZxFb2l52mMn1QQnWQ=;
        b=cX+s12UVVnjkJYwotgxaRtg+e/8BzxDrl/Zj5kGPlbjijCIK8buUPvNMs+ehzQCIMa
         Q4+j+FuZQWegsUj9H+8/r0/Yv4TJ8/6TSjbA1v+s/YBIT41OelkgvNcxxVe5dkjEw9b8
         7/iwfhO9t5o//VEjxdTfMxyrsxRFE4FeoarEzMXhevNLS+w16/p9UAlyLid3zNP/R7H+
         HAS1HJwds5ab9ocIJQm9+CYaQc3eswuO4S4o4uBDmyFz8JfY+hbK4KNg/OyJarWzm7Ti
         DlHfpJmsj23O2YV2QjvBFQ7l0JfxqUxBRi35SezyZFXRkd+DW8/Sa4zUyYZZVxY3pXaN
         ctsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794816464; x=1795421264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Pb6xr6a8f5h8gb6JGzQgb39t7gGon62SuzmS0+FGP8=;
        b=fkMft+mtE1J8XMiTvZ73WrQNp+eXjncIfS8lhhso7HiskD77N92NpIzFpZmq4yZyWI
         wY1Im0FiRgMjfaHeBi+oxhIuGSWWVh0czmiuRPcOD8PuuRWaXqq619Wjj5h3iZJgQkkt
         T5RuSBGDIBfLEcF651z/zCD2xrunovPKvsHr6ADNRQPtIZjYFeKeOsvd00OyqisxffE/
         mi6tbmZVOBHA+tH/jopAE79JDSzYg+HxavS5dITmeh4apHaqofLismWxCfIJ7nGTDfou
         zgSYjZgbtKsqT7jozbTAUp+QUy04hHx6AlVotuU7LKtObQZMLzd5y3eRtQzS0yEVpKrt
         xcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816464; x=1795421264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Pb6xr6a8f5h8gb6JGzQgb39t7gGon62SuzmS0+FGP8=;
        b=jGzDVYXIMmjo5ienKlAsmPgKV0wd+t2tT8NVpE5ZjHS4qb+wfmDb0pQii9A2IWfiEt
         RRdwE46zS/IGqwE3ZiA2N/bVSBvttwxo4lE9FT1byl4DGiVB6Jclk7Yf2fxvJnVMmz4r
         2ntCfFlOMnf/yO4bIErEjQctgDcbf7LecIqrA9RMeocXJhZ7gmZlT/YMjTnMPwWu4SQN
         g8OoirNV/vZyLmgGM3zIQEbsgbhOcQNoIPymDd/AW5mqDeKGzG12Niv+uDczo+NpR9ae
         FIy4kCClu9qF9jLovqufkhYJEAbvxndjrW43AEX2uwN5it58xjk7S4kcEErDPYSK+x9t
         b04w==
X-Forwarded-Encrypted: i=1; AL+hErF1ULqXds7CEORC/DF2h/h5J0bDdenTSs82I9LgQhrJ0f1clSFK9QHlNc7ojv0fuCrbN2jdzSdaxm3+9/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/93lRJIsp5mPOA4cqtxt7oWQEFsq7cGt/Rz4ScN71XxJmT4xH5
	d9BgqBWhgPJui4HEeL75jdvHPctWpzxkQObjx+24OGRaBeKhalQfamPKlWSdOW0EmK3ZE0Zi471
	b8qwmnq2/c/Aaqd1+n4BlsdGrcypeVmASSALCIyhs8g==
X-Gm-Gg: AYBFou0GBdzAsFEk5gT1bO7GlzHOAuT9hdwfKrUYk+juhtd0nLNqFrBEfKiar4FF5bb
	3yNAohy+q+YwuUbSHbZkhvnzIusGPbjz69AFymwg3VCuwGbw9JLD97nzSyFtNetugng+hJ6y2XR
	8wWCfG7zJTvo5Qvg26Fcj1u9zGOQWhIEvpWA36XbPcgThPzlrlXLFEVKHyOm4uD3NyXoZiZHwnI
	EifexM6CeUREPHyXdnZWlqqJKsaI5RoM05dIWFUdYLsY8v8uTMpn1RJj+e2oRz5ne5zC9dHM7j2
	eLGF7lNTZT3Pz3Q+7Cdy8g+bmKXpTknDZ1jY4T0KoyQVlYYjrTmZ9aBGeVGMs0acW6rtuOOJenU
	EThy47BdA6pnC8wQMyGlFIiTwXQ9hKNCs46EFXu2Aa4OKQmbPPhMk0laZ89kb3uGauQ==
X-Received: by 2002:a17:907:c06:b0:c50:8d2b:4392 with SMTP id
 a640c23a62f3a-c509674081amr685735166b.49.1794816463797; Mon, 16 Nov 2026
 00:07:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
 <20261103113711.1832834-4-max.kellermann@ionos.com> <CAGsJ_4y+LX-CSnDJ59VT2nc-i=rB=4iMuBQYawMCktk-_SPykg@mail.gmail.com>
 <CAKPOu+9XP8CP-EiLqd_Q-F6EWUQPgi4Ysz7wu8LZijR+j0_uyQ@mail.gmail.com> <CAGsJ_4zp8WJosxkVwRtfEvySBwp38bLd-0g6cV0G1BPb2V=hPg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zp8WJosxkVwRtfEvySBwp38bLd-0g6cV0G1BPb2V=hPg@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 16 Nov 2026 09:07:32 +0100
X-Gm-Features: AclHuK8pcuLrqZJfU1rZDi9Fc8JwweuaSuc_E2UFqy4M0KZNmfZJEbG9gBYu1Ng
Message-ID: <CAKPOu+9+NuwfDr4ii2nD2Uk2DWFLqJsDro_O=FW073oEF-eBew@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:32=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
> > For me, it is not entirely clear if a stable backport is really
> > necessary (thus I did not Cc stable).  It's not a bug; just awful
> > performance when you have thousands of memcgs, but few people have
> > that.  But that's up for you to decide.
>
> Okay, thanks!
>
> I guess we can only reproduce the soft lockup with thousands of
> memcgs being rapidly rotated by artificial test scripts? In real-world
> scenarios, would this be more likely to manifest as a performance issue
> rather than a soft lockup?
>
> If so, let's focus on upstream mainline development first.

I did have soft lockups / RCU stalls on a production server; real
workload, no artificial test script.  The workload is ten thousands of
containers - it's web hosting, and each Apache/PHP/... process lives
in a separate container (cgroup).

> > > > +       if (at_head || !last)
> > > >                 hlist_nulls_add_head_rcu(&lrugen->list, head);
> > >
> > > Do we still need at_head now that MEMCG_LRU_OLD has been removed?
> >
> > Yes, for the "!last" case.  This is, unfortunately, a special case.
> > If you prefer, we could move this special-casing to the hlist_nulls
> > API so callers need not be aware of it.
>
> I mean, you might not need `at_head` at all if you rebase your code
> onto either mm-new or mm-unstable.

True.  I did already rebase, but did not post v3 yet - `at_head` is
indeed gone, but as I said, the "!last" check remains and means the
code doesn't get any simpler by the `at_head` removal.

I'll post the rebased v3 today.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group

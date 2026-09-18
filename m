Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F4471CE9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754166; cv=pass; b=Qz9r2wFJVmHat7kI5QxWbXBAw9X45/umKR60kHooQcs4GPAIweRWFkQwOhqem51nGn9naQBCYdvbWuleIlEaYjAdZRd2PQtEhDQQ26HqbSLc2MERRLE6DS+H+dIKra50FVl5bNGY/4zO56wkE9PBTgXq82S3R49pS9lBNhmQWMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754166; c=relaxed/simple;
	bh=K2wCVeSuchgF+6YBCtVhNSkh+TZ7w975CTM84EpU5d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tApYxX9VQSF5D5OpCCMpxHv2tBX+Ih94vzODmABm2NS/4wP6fgpyO+r2GQQ0ZXMwcoeOBp63fvbfKocziFleZObkHX21hGFCnoC5xWaCIrAdNP759KOH6JrZHPL/Gv5TGDjNN6AnMRBBLcVeGMh7jiiKJl6zCM1I4nLzG0qj0IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDMDFFXJ; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDMDFFXJ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso773959a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789754162; cv=none;
        d=google.com; s=arc-20260327;
        b=pggZ9QrZNCd7bpy7DQLrSVmsB70AdeZ2mcfgWTE+sJXfrwowJBvkNpl/LJQyNB3BXj
         xGRcEe3JNI/W/9rz377Js2bJyh3JWD7hQAt30oMaOXagnF5EI/xPYZg8KMJdvFI1HiXB
         uZ5i+xPwwbaIb5cPvdpG3itxr4BxjtN0Ktok8BHFhajV6FzkzKRp3RVopvB0Q3Vj0znE
         ktoyUiamUkdTyyuIko1C+ldjSjjQ2F1lQvM4TMwVX6sm/iN83Y+pA2lrqwIh1MmNWBNL
         wBwVJ1Z1GA5NFJxDmzQDwANK1jvvnpgVL7P97yHSM6vLDRZG3PDUIHZTPtD0MH3hUtuB
         agXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K2wCVeSuchgF+6YBCtVhNSkh+TZ7w975CTM84EpU5d0=;
        fh=EuMAZksg/kLQxuOL8r4wnyBPTxPpwE9EiSFYC3y6Qj8=;
        b=siAvlEldooK5j8pOcevvzzEuk4c1JjFCJ90A30zDIt4eLkpKE2Tr6MVD1scOeHIeYc
         QZhkFFrSPmibY5FQ3cGwDnMgp8Ycf+Q42ILVkhq3uV4gfSj1UY6iPfkK53/c9jFqKUMg
         4vddhQU6fTIM5U4UWAtxmFOm2x3jQnqB18Ba109QcYDOmwB/U4gKKNyNMlweWwUIXrnn
         MGM7dsJMqZIR3ylHXQDMo4M7PNVOqdFy8Y11Txgo9UNQXdz6i2CbGjC+VVOtVHlgK9J5
         /dOeVT7pNUJL/8IBYILT8lxAjjzQPpAgWYdvHwuiNS17YulBrgGgY2siznf9ZNah6o2/
         EKww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789754162; x=1790358962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2wCVeSuchgF+6YBCtVhNSkh+TZ7w975CTM84EpU5d0=;
        b=WDMDFFXJJ6GyYsFRoPt2FYWUxc0Bnp5s2QYAbajuLMFWSGwnf+lDXYi7ttp3i2aPkI
         78DbjrMFNiE0VKZ/w6kLuSubFsCOU1Vm7iY6DB9xittkk8Wx1iFi8gRnlee3Xxsm5CwX
         LD1STote2VgVca56xRaeFevMiPIDZ5UKgqMtqF6Ue410jExndN1vgy5SAsEXr4vA8O+C
         rjH+d1K95Ij+NyG/I1WsKCEvkhXfOmtnyAdbrMN1JCLq4Ox/p32KI5Zy/u/BI5Ty9flf
         sGqP83Tt96tqnMOdW0DOlzxPlLiQWGvE0HO65yjyqHYvN/12L9s74EtdojFKwTuClZWP
         AK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754162; x=1790358962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2wCVeSuchgF+6YBCtVhNSkh+TZ7w975CTM84EpU5d0=;
        b=rZb2CSy92pLjVwMQUMtX0WqqdDHnIlmJXdIfnfNlGnB6XcN3SSAZEefY0swY/1rKet
         UzgcnN+EmQQk5GoWJFZ2+16XBLPUCLB/63YKziVWm5ySR8oi37sSfObW5YGr420agLRQ
         cqsugZwHllwj4zBrG3u8dizyHdiafFqLqk8UpPIobJ+vbg/YJGtwZwno3pvOtOEu5fPu
         F/u2skryEzk3JB4uROibQKdji0frDv2cYVScahVnZjwk5zuJhUYX3zW4TE3OdA+dGwdX
         6ZnT+Sc6z9nJLF++s24nA+tHUACYBAuOX98w+UsrPCB9zrjLdL/sK1Ox9pP3IvrjZVmS
         lQww==
X-Forwarded-Encrypted: i=1; AKwUvBzxnbqBxIQANa+bqpIcctTpcHK+hnxRrGJgPwhswmHVKnfFDGFxbKqakGP5auMgcx1UnZ/eLU36F/sDIIY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxzrqsPgIv/EySoz2eWKzScXzUZoW1xa2K5zdUfv5xn9gM3NSn
	o5eYpREHNCNRkv1NfmA3qbg1NZvQKjLQX07mqapnGsBIHac3Bbs3A3zy3rLO4+EvZ7GSiVW69au
	lEXXpDoR/k+k5CmiNaW45PlVaKz/nVOfNt+9/VhCU
X-Gm-Gg: AYBFou0gkW6XAG6MDrwFDzGkkI5y9bRp0jCR6qIKrmg0ygHIvUMSmR0oG1QIGxbwO3O
	BLYNNYgB317MxuAaqWI7sLStYIN+en9rMq5iBFjY38Uhb/jWXgoflBYKkk+oMacf3WFIxh4yjNi
	jbyBhxB1fp4dyUi6hxRYypdFbXyToGqYrUEzwiVS4m5UhoZMszqu2gU+BxyK9TnP1oIdgEOuQDy
	gPRJhFm+ak6XNtPyfKWB+5yl2o8MDRhbqZk934EeJhbepS8nyVSer5f7CpzcM9EfG8glFk/b0Ra
	b/immyVngw5KfosoIff378LAKzRKDa7QCX5KsivbiDTZPf+Mysvz0RzJNmorjl/LLaYxs59UqVB
	2fNH6UAV8CMth70p09d1KB7rL4Gclw4A9fJlbhraOFL6n2xiQb2xNOHXgN0gS6FmXRD1UQqo3IV
	6tlcfwF/nqWCtBOUUZrRUYAgO0qRqlS+2I
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:7774 with SMTP id
 98e67ed59e1d1-39e6c697961mr979973a91.29.1789754161489; Fri, 18 Sep 2026
 10:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918153604.579277-1-mbaragiola@linux.com> <CAAVpQUAmGAACd1rBomaY-B2vRiE-VX9u4JRCteVB-940RhRtbg@mail.gmail.com>
 <20260918170042.609084-1-mbaragiola@linux.com>
In-Reply-To: <20260918170042.609084-1-mbaragiola@linux.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 18 Sep 2026 10:55:50 -0700
X-Gm-Features: AcwNN1XB-YqU5k_r2rnPCRh-SjsxnReIoR_iBjfhUznrMsSgjovAPq_0TRW9qgs
Message-ID: <CAAVpQUCnoHDvP4eK_jRHMDS3EaFaKi7XJB9k=xGjGVbkvwrB0w@mail.gmail.com>
Subject: Re: [PATCH net] udp: resubmit encap packets for secondary mcast sockets
To: Mariano Baragiola <mbaragiola@linux.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Anton Danilov <littlesmilingcloud@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:00=E2=80=AFAM Mariano Baragiola <mbaragiola@linu=
x.com> wrote:
>
> On Fri, Sep 18, 2026 at 9:21 AM Kuniyuki Iwashima <kuniyu@google.com> wro=
te:
> > Did you see a real problem or is this triggered by an AI report?
> >
> > https://lore.kernel.org/netdev/20260415203624.4057135-1-kuniyu@google.c=
om/
>
> Hi Kuniyuki,
>
> To be completely transparent: this was identified during a code audit fol=
lowing
> commit 3cb8d4b9bfeb, not from a production crash report.
>
> I recognize that standard FOU configurations do not typically have multip=
le listeners
> on the same port (returning -EADDRINUSE), so this primarily affects
> multi-socket/SO_REUSEPORT encapsulation scenarios. If you consider this a=
n
> edge case not worth touching, I am completely fine dropping the patch.

Since the patch adds ip_protocol_deliver_rcu(), syzbot will find a
way to trigger stack overflow, so I think it's not worth a fix unless
there is a real use case.

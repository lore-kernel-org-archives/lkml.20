Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBDF40D590
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764878; cv=pass; b=oG/19VtsxGe7Qv7LDV/ChbF1Ipf2X68vmK2DRCz+GXj1uaxQJK6LYsLcAt2z+lolfJ4NUqJmwDd9CZj07HO5MTU/wNzcHoDH6Wwp00Ukjv5ix5qKQAiyaSCYOpge4TQqyxH5DRz8jxBDS2SS3F3VmMxAvnwKBzKTPVC/94T+Vw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764878; c=relaxed/simple;
	bh=Y2ur+9djzyvL32htqpN4jDktQyKA4StfEKcENrbnevU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxgXiIIHSuN4OiZEq8eNNmZvpDOB9/wnUO5YC8M8KEdLTOn5BoYYTS5NOOnnZpmBPovwOdn2Q+emr4YV2HAcYif72WM+J/lCxLqISmn1vVsrM+wpRqEOdTwDGyGrfqJf6RXFCJYHxn/QEDvxOo1XKKtgoX2nyY/NZvup2R4hKLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5WmuwoE; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5WmuwoE"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52ff7e275e0so33550831cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788764876; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/qNtBrHlCLsvElOQtbejdS5d43ImDTW2+kD+xsdrlygGIryhtl51DKGOgCGjFWHuj
         I7EHKSP2z+KyrSbOW8TfNz7MqtYAW4npd9JuSVSbZCQo/oBSZNeDPuHxViCLBiKnUttY
         4ExV30Qv52R+VNSw/Oh3qwoYU39UoWN+IXb+U9WzL2DNE4d/zOiwlbOJL3HktZqVXn41
         32woinean5wRzlqlMUZcuaNCeM4eo1t90eRpwyHqTxc9rKvB4j1WdYHiYi0a6WYCr47y
         u/CL0p4RQZ48kUKjDGK/G7L1DkPLOsI7ErRm7v8c+FK4TKsXymNWhIPKH3sl9BpxcKZc
         Al5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hqvu5zoZvKKDOuz/BamMJAjw8ii3eTJFwC7iUaWUsFM=;
        fh=4Rl7QMNy04zXJENw+BrzM5pHumbEZWlYHuUVVuEy83I=;
        b=JOVwMLs9jcGnwTqI3yJfnX4r9Y1k+A2mMCt+ic0TNlmHvI6r90cZIbzijksTd6FSJG
         ziPDHgVIz+vmklBrNMc2xDk7fswvMQXgkRAB09XLWXmWPOl1Qhmqh9GzKmzuDGfdbu1m
         ue4fqfRMFADl2EftERe0fDKC87wh0NKnqNeihHWH2OvWKwzfZm3YFlnZswiBzk3lXfxE
         qcoq1HWefJNULCDDtUBuZvxTfLBc4v6sE3kO6TA297smz2cG9iRcjP+vDITHIcJJCwzS
         uMq+RSF/sKgEGbVpy5s4jB5LxpH+iIcpcE7xWVilWWGvgcZEc59sj/IOtBAi2f6KTG0t
         kpiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788764876; x=1789369676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqvu5zoZvKKDOuz/BamMJAjw8ii3eTJFwC7iUaWUsFM=;
        b=T5WmuwoE2Wmkif6ZHlr7z75zgfDcYmcQejKwGE+psT7vyXnOrEs9W5puKXDeat0PNp
         fvicIfeALAW5jAcrtvsAomYPHv35SfUAQlCf7dTKVFkKEwLJoKgUkGgj2/iLsMUNEfBQ
         RuINvu/5htOfsXNvzOKPPOB2ihCv4PFBS3lK2NE2z/SSSUiTqCs0EHA7PEA41Q0moMwU
         Mz5wLGFmBJlZ0SK26WVihBEEkZG3RzoRwjMHB1DyVX/tn/NsiWI9HA7vaocARvMZ1828
         pcTRCLmY9ooj4sYd1gKHcnS3J1BhHZZ2Of/1HoDE5XcfCSXDuuIxeGMpZZ8ma8iLFuRc
         dhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764876; x=1789369676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqvu5zoZvKKDOuz/BamMJAjw8ii3eTJFwC7iUaWUsFM=;
        b=V25ZxrfMc6wGoICb4Sv6Sh2bS+S33s7L0fZJblpmZdgrfYbyNLRzY6KfuAUrqEAB/6
         BDjkGIBzg/zTH8wGez996HufQYnfzwABZuVOy8Rw5Nj5iUkZp6UhOs1MsxSo/KiKCIHB
         Tb2GA4DuGPMpjsPQJ9DWmuOfVxKj7jBzT/Cvv6Wibo3PlowYHTE2CVJM1FZKEg+DTgmL
         ZoUwQxtgjo9GYlHlmtUvWnCL/YSKpHZYteWxSdKrEmCCSVudLR9dVbuyaOt38qKOvYn9
         uGJeVNqvoPdu0ShPcWFRoSvwwHBWmfgui9mHa09hu//7LTeZGol3X3cSn6Nvz9U7w87n
         Btkw==
X-Forwarded-Encrypted: i=1; AKwUvBydLdEhxfk1nuD6IJEL3aWph5yUNJdE4J1Q0gXMfoJcBoyoD/WS3VmbdsycHgKlSdI/dC+cc+0VTQtYkUY=@vger.kernel.org
X-Gm-Message-State: AFuF++nlvBig2TB8saVyIWUfhVs+1D1h5aH8z+K9hkbKRiVWlCAIPhbR
	JQ7G4vxbndEwI7VfegM/W0xgwdFG2Qn0eRA54TpelNix3zR2ZcaDugEZZAOOAzhnoEL+f0ZcQvT
	+EaeDl1rF1rIWytOKiGJi3LiVls9W/i8VtVCRAP/L
X-Gm-Gg: AYBFou1r6cg42cCx/8ta4Zn1a2uJ3/9kQyMZa0stL4hE0heu93ZVOPhNiZYlf3IF1lC
	H5da+PfI0E3WoXfGMGWF8VUjfoBipxEAOSfcobMHwfcgFuxbnZmUs+0w+h7t0Y++WRgdC04lTXK
	HHFiMeU0QXoiwptngtjr6xUya2tdFcxP3v+SghRFYALnq/nP6tRobHZW0dEdydO9LBgrL8Efjkw
	Z7+31UVRK4uc5bS4Pb9QmiRBWd/vzZh5pRsyKAN3OEXm1Rd4tGFNZfCBBCXnvHEoOh2iZA0Z8EX
	o/BSS50ZLoG1cS2M/iFM+LCw5rs8JZodezEdob4H6ESNgs0YPpUI7hry9pui9ccCuIk4RV4oqwb
	46GXzrzaHddzmLTEPpJKOG3UcniUQBWrG/vmO3qg058G4hmtbD/wysb1dZA==
X-Received: by 2002:a05:622a:48e:b0:530:42e4:f280 with SMTP id
 d75a77b69052e-530549f0484mr242761321cf.41.1788764875411; Mon, 07 Sep 2026
 00:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788668475.git.zihanx@nebusec.ai> <e8782427d0b3cd1854ab8d141eea224b53db55b9.1788668475.git.zihanx@nebusec.ai>
In-Reply-To: <e8782427d0b3cd1854ab8d141eea224b53db55b9.1788668475.git.zihanx@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Sep 2026 09:07:43 +0200
X-Gm-Features: AcwNN1V6FVySmL5DFqzL_7zCey1PZNw_Qi_Gx6_T0FzTqcJVGcZG-fCSLd-LjtA
Message-ID: <CANn89iKdX2-a+VhWa4CyDODSZByk=r5VRq38yQhLYBFRQ1Wy3A@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] udp: diag: bound bucket lock hold time
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Pavel Emelyanov <xemul@parallels.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:35=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrote:
>
> udp_diag_dump() currently keeps the UDP hash bucket spinlock held while
> running the request's bytecode filter and filling a netlink response for
> every socket in the bucket.  A large filter and a heavily populated bucke=
t
> can therefore keep bottom halves disabled for an attacker-scaled amount o=
f
> time.
>
> Collect at most SKARR_SZ matching sockets under the bucket lock, taking a
> reference for each socket, then run the filter and fill the response afte=
r
> releasing the lock.  Resume with the existing (slot, s_num) dump state so
> the next batch can skip already-walked sockets.  Leave bytecode filtering
> until after unlock; unlike tcp_diag, a rejecting inet_diag bytecode progr=
am
> is the expensive part of this walk.
>
> Fixes: b6d640c2286d ("udp_diag: Implement the dump-all functionality")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: LLM
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
> changes in v2:
>   - Drop the hash-list cursor, dump_done callback, extra module
>     reference, and inet_diag core changes.  Dump state is only
>     (slot, s_num), so the existing handler get/put around dump() is
>     enough and udp_diag no longer manages its own module lifetime.
>   - Batch at most SKARR_SZ matching sockets under the bucket lock
>     like tcp_diag, and run bytecode filtering plus netlink fill after
>     unlock.
>   - v1 Link: https://lore.kernel.org/all/133b6aee9e2c908c9da37d5585b3d2cd=
016906cd.1788187473.git.zihanx@nebusec.ai

pw-bot: rejected

Please limit the complexity of filters.

Anywone needing complex filters will implement them in user space.

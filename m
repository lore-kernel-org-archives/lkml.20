Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284BC33938D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013657; cv=pass; b=RgR6sWPq52+opqszU3A4XgEq2Izb5Dr5vk1craVaSjJ+qpsMpBW9+IrhoAnFKSau2fjfLD3cRoSeobUD7BqZsCTFOVXbacaa3gX2m3yT70azpq3mie1Sq00oZTmZox9Qvkdtvjykr1qBbQt/JhJtM/F14YCtWiAfuEIPlq1dN5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013657; c=relaxed/simple;
	bh=PfbASwnYRFDckXUlVC/ifoAWFmyWh3yvGwIK5j4t4Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQ39q2KppcGVzNWfc90Ji5+is4ZBgQsJz3GnxIhHy/mlVjNVgnUU/SVbAyN7rW8FxRbqFupUxnPhf708P9M4ova7vQ8k+vyyt26hJwHGJ6+CzJP+oJ+rK9gqKmPXakU12FxZJCiap/yvvlnw/Rkv/C1w3pqq6pHMa8rTYzULb9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzRMhbT/; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzRMhbT/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc147d86bebso710097a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789013655; cv=none;
        d=google.com; s=arc-20260327;
        b=glRKI+0yNh8SvMv9sz8BpSKa4XjBA7Fv40OoI+ffGjh+OZdqO8MOlA9oTXvIGKSiFa
         cAK17LswvyavvJ6R0Qv7u5l6egg0xSMlokGUSXZMvjTI0B2LEikaP1znQShKStm9C8IQ
         vALWujI5MemKWLDLrZcs1YXEEQ6wDSg9GSfAbpdQEGaWeYsz1FQ9gmC1HjzXAVCLXxUP
         kj4IXICBBrLJ+KWRsQAGtB3Mwq1hoDyidnn5YWsme38e00OhQPc1wrV2pNM4TKhoqYGg
         9CXSW2mrxse+lSL0Qpdt5ZAx77dPin12drVzvZ+SYhku1OA1S8//fMnJJlbYg+z/rFJE
         Z3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfbASwnYRFDckXUlVC/ifoAWFmyWh3yvGwIK5j4t4Fo=;
        fh=rLhs0CR597M4/vNuOpLTVaATdX3PeIlrtGKeknl7ovk=;
        b=cSHuaSs/FlDGdRTnBMKf//37CmvNek9/mG7m18xKZ04Z/9bSfH/4Qi1NMOuK754+tC
         Gu7au5SZnBdp/E4L9S67OlAyRPFjjRsZK8esMWxVwY65ESaRKtZvB2mfkXZFi3WIKAOq
         W5PsDLT4hQW8CWJ+XjOjAZYMc0LafKac4QqMN0iMzXQROrK0N3DkFh/rDlKm4ewpHTfO
         +EveyoqCc694ldurUCzmwwZh0KHOHpOVHcjeeAL3yYhPKbkm31ZAZbYc3KyfKWT4basq
         Qa9bIEjfanHzHtdtTk7GGjGokp4cjQh3H3NIgRWkhb+8JjWNLLVmpmhAgQuoEd2zIIWg
         TmJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789013655; x=1789618455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfbASwnYRFDckXUlVC/ifoAWFmyWh3yvGwIK5j4t4Fo=;
        b=dzRMhbT/4WSBdYt4p+UNMBCgWiHNmOfmnCh/4EzpwuoNyUEKo5mAHVh1yeMjVHO6FI
         bP/muVJOLbEMT+x6LTLb6HJk7lbhlmandyGa98XVuB+QH9wpZxFMQyheLE3Ua4/2MaU1
         gqIKZxtBbVYAmywMp0QG1+gyN9QZaGEU0+drhCmP4XkMc929kFvR5fPWH/+BEhHEuhAL
         bMgr8D/YdfpqFCCAxqWQCfk8UwWMNsHduIrCzBmxghxN6/Dnh5AFzNoxvgK0bHOc4U+M
         qau5XH+uSy29Zolnjmj+63GCrsyEtVEq1cmpBrLp4HH1CN6KQs8du/qQJ/dI8+g+5hu8
         APTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013655; x=1789618455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfbASwnYRFDckXUlVC/ifoAWFmyWh3yvGwIK5j4t4Fo=;
        b=LQz5kohZ5NHKp6IPglHCfPtIxyuup+x6J+gSL5XtZpiNWt53vwVfDedKx//OOMb4PD
         Nvy7k8Rcx9IQkj2/baA2KRVqAiLwT6FdqQPSuBqNewGHhpTLbXZu7WjYbU1qkRmwCzqW
         aSJ4KITYUTAeM1UH30+i+em/p4GlnWpyy/sg05CNBL7QsCFQktLKdf33yPBi2fA7IZyH
         Y6s+DEltKVTl+Rbr42aTiDm//7x8pzO4ie3CW/KVSzLXRkk1XMUUceCHn2qQ29ihUk0E
         4a27UR1btto7dQdIpeqZ+zekxvkbknSTiKj5cEgCBuZd2q3mUbiM2P9b8c0AjY2YpavC
         tWLw==
X-Forwarded-Encrypted: i=1; AKwUvBzNPm3m4q6lnIQdoIXXG0w6f8raS/3wGb7YK/TQjjjBQsTzcRWWV16WQbRpXcWrjnI87D9H4aQL66EV2as=@vger.kernel.org
X-Gm-Message-State: AFuF++l2nG6bK9XtExHN2lG6ngGbHEIEHXdzCpCWVWWb0HR0vRbSo4ja
	PYUbPaYb/SRq3cIWU/F7eecPR0jZt1TpydEZt6CiAP/ZAMWs/ADPgGj8ZgW/KwSO/kKK6nQcsON
	LyoFy5OOopikBVFH3KfJruRWob9dXCA2rlvM7uMfY
X-Gm-Gg: AYBFou3HSOGz7EjEVGYAshTEflN8djkEwMMUoeCeRgdq9TKm9Fwl63Nf805/MwS5p8g
	jtSbINqaB+064Ln4SAlbnpdIJqWZwzf5CNNf1LL17Z+qdkpGzEiTXQNvCBed+h1g9uPSj3JWtzM
	RGwod5kITTjQS3xMyI0c8trYM3ZhjLKZRImS+yUS2Acr6Oc6ybr6w+ALRPEb7z/Pn03BpP8El8W
	V6FG5MyR320aFaS1eyFjy37ZCv6b4KUp4/CP4Q2ciZzrvE9RemN3NL4DYGhGYjyK+qux38BOx+4
	zf/FqpxfEzXx05Z886LCKjkEUPR7aLAbb169nE1ceMVwRezMI5uZ/Qg1/FthLmhl4DQTB6OfnO9
	+uugtYPMPr0qtLhRiRYKZS9AMXS+sjoiwfPVs2XEM1RkiLe4WV6Gq1aB7aNV0tDFMtb8KW2PqlV
	TUQc/ue+73ExFDiPzo7XYyMK2s
X-Received: by 2002:a17:90a:fc4f:b0:396:669c:b5f6 with SMTP id
 98e67ed59e1d1-39d7796cf16mr3552487a91.12.1789013654775; Wed, 09 Sep 2026
 21:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909-work-unix-passpidfd-v2-0-7bd342abb2d1@kernel.org> <20260909-work-unix-passpidfd-v2-1-7bd342abb2d1@kernel.org>
In-Reply-To: <20260909-work-unix-passpidfd-v2-1-7bd342abb2d1@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 9 Sep 2026 21:14:02 -0700
X-Gm-Features: AcwNN1U7qcy0Xgw28VWEZVf5s3od5zIgdwEciEhER1kE6b7z6Yof-RR_xDF3wvU
Message-ID: <CAAVpQUBC0zZqv5iECj4YvE=oA2hWR1kbxiG6zOBBNkaALwQXEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] pid: add helpers to operate on a struct pid array
To: Christian Brauner <brauner@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:43=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> We're about to extend af_unix sockets and coredump code with the ability
> to hand out thread-specific pidfds. Add a few simple helpers that allow
> to operate on multiple struct pids up to PIDTYPE_MAX with automatic
> bounds checking.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

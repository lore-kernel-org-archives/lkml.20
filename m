Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D024387359
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765521; cv=pass; b=gxMqWAe1fPx+ziQPMNXm/3xk9QYmcGvM3ZUxy4Sm1L1yXEhOrfFGvUvxKU7s3prOJX+dfeTjB2x2brHYI9YnfHVfWwYk36KnMjfE3ubtyD35P/aGoH1QgKstiJuXRbjXMuZkvVbdiksf4ZwkGe6zPz9/BZlWJ3n1yFINUwYNKBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765521; c=relaxed/simple;
	bh=xvQlLrP9VZeFA4X51ntM8S07ewhUqvCn5cruzlZ0VS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGrsne+X41xbzEK5FrRz94rPn2wWOr+OYPc5U+d64EKX68ezT9Z+JMnC4yWXH/Wp73JmfYi9TjWXbq3dIoFSgotB1HkxgwWfnfHqndY5kyIY3+5hoGV5LACQSy5+qtAnbvguP6PSsT0cqf760cElFnqtAJ1biddujK0AqAnsQsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b68vdhGZ; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b68vdhGZ"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-934944f2d22so67203385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765497; cv=none;
        d=google.com; s=arc-20260327;
        b=DTVwFaaX9poOCXh6cd+Rs4uiCYt5zkgR8SnWTXWwTMG1O8mxKKDqscZaG6JFhwZdT3
         9yj2IofVJFHu3UJhEcTtUcevMRK9dvxADCuZHy9skYMNhQ0ePlbjPRP7XII+jn4yRq1t
         FPymVGVF7sjyLxD3xplS+rvqiCZYrNrmZEQY+R/07xOZDDExKC7UuY8LZTyZY6C3xlGd
         JaeY0AYeOYVYn1eZhvABdUHeQoMoUCcdE4s3yGH4YlLqq+rUD1wQKsBow18435rDF0Xz
         0Rjf4p86vpyD8/jLp+dSOyb6+k5Smws65PKLZD+1RlXFmDjNo7kPRvCAzVgzpwbMtTyG
         AmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKiJ8YX/Dhk5jdEkQwRVwdmfmTXscc4IZXpiaOIYJVc=;
        fh=QeM+Hl/v4zv/rMdCszMId9DKZZ5eEFL5nHLeloi5Ess=;
        b=ZIzhRFHFgGpYH7K8dI8Aeo6ZqNfndgNstlZR3wVBafi4eF9cuRG2ZsMZBGjsN6fqvw
         1bzM1Z2czoMmvrqvDx/qxKpkUACUWIGCnBzCjwnnvQ2n9Pve0uuD6Fjs7VZRgMUBoHJg
         3rk/UhR6JFg08IPSmhr58B10PLQjgUQNNrP052G4Dvq1RnEntfudFaxSDaMVsdHpWtg1
         KyscCdT36Oe1RpzVNjmMHFJb0cL3xKc0Or6+eQyu/Civjjj7/d+ZWZEz7FPLINI21r5Q
         8QheJ+5H6WviJ2TxnqMHpqrhrUeD+7ZV8tq/ZfuDVyUJXM6wECwdEdaiQRwmQOmnDpSp
         +OPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787765497; x=1788370297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKiJ8YX/Dhk5jdEkQwRVwdmfmTXscc4IZXpiaOIYJVc=;
        b=b68vdhGZgBqiRqH+9o7YVSMh8DtrwpzcwpovG91VcybnYoOwQrpqPiS91LIp0YEKwb
         JB57gPOmCxXA5wrW4ACQdxIk6cgiMRKRxK/BPeb9Z0OzjVEaKZpjJyLytaHkIDNYhjea
         niHSz1iquDjz1vdhnwlE4SM6P9G0YgnvyxWKY0rUvBru4LsvJ5jXLi7D8T2eJnV7ri73
         aM3b/1FWKTekqo+3gmXuc/Cw7xHEfT4ErGKqYqg+lPMyb7pIf7MMWgwA8Mxwr4d2rYPD
         uAsqhht7lAx9tqCUHEGdI4/cgGjoP9Q2Ah/D80KxM6g3wXN4Qaqh6WQR3ujaxU+AS50A
         IaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765497; x=1788370297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKiJ8YX/Dhk5jdEkQwRVwdmfmTXscc4IZXpiaOIYJVc=;
        b=Rtv9QWgVJXmGqq0umJu2wq48tORuMspYCChReBhRCpRUHvZPmLYa9jPIBGPhOJE3/Y
         M2TefZ/DPGsq3svnCm8ovGfJMThXQc7VrkzsGuzmErQKZaNoukUiySgp+tsicfJG+ZIi
         V7vGsNPfgEN/0Y6y0SMPkAJzCPTiAhY54y9skYQy5DNIQ9DitKY362a0NJLoTQvIx6xk
         DK3M7e5mgBpjxxT+SZoDJ4AXWo32/tVxin+H8IwOEwJAmV+FRyGsWsIXcHm58FjYeBlo
         yygvon4lTiYTNQuNyb+iu8wEvc2OigT5z6fgQfIwZKGdD7x5m3zrpCVMIiDV+zd9cDiM
         IVFA==
X-Forwarded-Encrypted: i=1; AHgh+RqUD5LeXMwcR/gJeUO7qfcb21DBH41KnFIH46FqiY24PaiE5G72/Lw6RMBB34HEZpKSJ68ZlCGYad7Baao=@vger.kernel.org
X-Gm-Message-State: AFuF++n+FsIRTBHh5i14c1rL5fGZ+ve7vuwa2UrJgAlf6TL2rm8pJ0M0
	aNtZsN4k6kd2mcW6xYoojIIrIoD1gx2YgzrK7k7nlexn3ht+J/3wXT2Bh1Eb7zK0mK7Yl6ciqbo
	cBePJed2MY6zOC1Qgv6b/pUJ2anrOfYpDu/ZtMoC2
X-Gm-Gg: AR+sD12Ptgf73ohI4N7KOM7PRjjZQQ21XyfUPO7KLpkBXTMa4bYu68kQdkMTsbMe8jA
	wZCFWXrW+xStNGLAY4Und+EZb6d9n8wf3JwUr40vG+ffte9eVJJobXY47ofv0c8kBniDkYkZH15
	YXlxg/yzxh2yNhAwdtK910muCy9AKHLtQFIo04BFJ+OBzFt1CSE8+QO/nkvJ5eYm0y3UFqfpLub
	AcbE9AunbhjLXgC1cJ7fOpGX+UJewp8r23K3ZLBLGFWQfOIMM0uhALdBQYvWfnop8+Gxm75ZsbP
	oEUSUlDAIc9nL1ycGuc79C38aor3hu5TH//ri/tuxkFQCevOatls2tesCVjLwoYI6Pc13D+eKTX
	JtQlq9ag3odYtRJai1VnE3jNo6k7ZZCh3dRnZqyLzWzGMtzgg8SD06S5hhfs=
X-Received: by 2002:a05:620a:2584:b0:934:9639:3a4 with SMTP id
 af79cd13be357-93780439e3fmr788607485a.41.1787765495949; Wed, 26 Aug 2026
 10:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826171344.4133-1-blbllhy@gmail.com> <20260826171344.4133-3-blbllhy@gmail.com>
In-Reply-To: <20260826171344.4133-3-blbllhy@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 19:31:24 +0200
X-Gm-Features: AcwNN1W2Vlibp4Upi6ckUE2YnF-7NI1e62marZLJ6U_CKljSBV7tC__IgHY39vw
Message-ID: <CANn89iK9NyWmpuE8QM5W_t3MK30GZf_Wgbr+JsUVARnXZBgN6Q@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] tcp: fix use-after-free in do_tcp_getsockopt(TCP_CC_INFO)
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Cc: ncardwell@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, kuniyu@google.com, horms@kernel.org, matttbe@kernel.org, 
	martineau@kernel.org, geliang@kernel.org, yhs@fb.com, kafai@fb.com, 
	andriin@fb.com, ast@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AutonomousCodeSecurity@microsoft.com, xmei5@asu.edu, 
	tgopinath@linux.microsoft.com, kys@microsoft.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 7:14=E2=80=AFPM Cen Zhang (Microsoft) <blbllhy@gmai=
l.com> wrote:
>
> From: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>
>
> do_tcp_getsockopt() reads icsk->icsk_ca_ops and dereferences the
> get_info function pointer without rcu_read_lock(). With BPF struct_ops
> congestion control, ca_ops can point to dynamically allocated memory
> that is freed concurrently, resulting in a use-after-free when the
> kernel dereferences or calls through the stale pointer.
>
>   BUG: KASAN: slab-use-after-free in do_tcp_getsockopt+0x2037/0x23e0
>   Read of size 8 at addr ffff888013701258 by task exploit/149
>    do_tcp_getsockopt+0x2037/0x23e0 (net/ipv4/tcp.c:4564)
>    tcp_getsockopt+0x91/0xf0
>    __sys_getsockopt+0xf7/0x170
>
> Fix this by wrapping the ca_ops load and get_info call within
> rcu_read_lock()/rcu_read_unlock(), and using READ_ONCE() to load
> the icsk_ca_ops pointer.
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.

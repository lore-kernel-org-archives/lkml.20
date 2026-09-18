Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CF4E8E07
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734476; cv=none; b=kuPYgkNaVuynuCxe7L0v2rwp3yp5q0Ectq+kRsf9wKumYxdltTu49OCQBjpoqESYYg83nUILsWbaiZFMtL0O27AiyWbpJZmICLCiVkHdhGK8u1GPuTFVSzEdX+S0hK46CHhglAy/XbPx+iEACTuCz0iVUCo+iTuNuwOVMt/zDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734476; c=relaxed/simple;
	bh=rPmI3FNZkhe+GHeaM7hnQAaJHP2GLzCXFHO62JGnIJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aW5r0QFOi47JtRUi222oFZou7pHTx2FrRZ/qYzTehMLjUnt2tH16gS0h/vdD3xfylmU84rtd4vg574Dh5QsfDF/cKVK/luMAqdFNc0ZYLqjxz7SIXN5JDGOGh0RnPdNvoHiYaPw/CzaH7v8i+5Dc57mQYSu/9XYI49FsGbB4uAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYiqXQ4A; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYiqXQ4A"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so464284f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734469; x=1790339269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gvjMDdsg/k5nMEjyepG3LV70ieB2SKZbmKFwt4EpOis=;
        b=KYiqXQ4A1EqCwD9JcPNF7k4Zs/0c2rp7vnnqEnV8aEPoUdzBDVDRXN7UeU4tEZ4rbb
         7t7xcIL1LJChf4R+0NP5RN77iJTNhRRG0seXsD1RzqUEh/9StjhVcA2mmJ+kEVpvg6mL
         TXG9YbaOBReuZBTwOkf7r5aYM/6FsGmoVtQi7BxvoGxtojk4jP0NUlMOrGzO9lx+6egI
         y1rfx0TofXqLMF2s51YJGxcvXOGfGcxoaO33mXXgmj38UU4sI65gCJNvIB3gJvIfM9e3
         lg2tzfJceXp3bjupqlvwlPKEy23K2smUZ1NVW6RvzQH1xBCWiLNXj77rK3Vr/7hhcLIA
         CtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734469; x=1790339269;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvjMDdsg/k5nMEjyepG3LV70ieB2SKZbmKFwt4EpOis=;
        b=N6HQB4hNiemGckk004+gkBL4772CtjwpSEnMw0eFmun+keuRHLtFpfoTiQoU+8T/jE
         A8RWcdmFi7QO+0qj4Jv+dhYVAAM40Jcf9g72y6/GctGBi5wJpUXuc3jaRLguiQi1SAHQ
         2blf2CWe4VjBXb6fhvEXVs5l9uxKAk0GKHsCrFiEswMxrgdZvYZ6WcvS6rv9/BaGa3IS
         KpZiOwP2r7Wcd3qlNAoN3X0EmM5XjUkg5UWrQeSY+ON7i2kMX5k3UUcLcqPXhJuIyTfv
         tr9+PqJilyeV49I34COpY0HV1nmCznfVT9VpOLN2JuuCRnCWG2JTpkoJWb3VxEVBffey
         DrFQ==
X-Forwarded-Encrypted: i=1; AKwUvByUf7gq5GsFwnhFxnnVGK9FYHsGXKXpJf6rIm2jhgMbIW13GX56rN/IiIZ1EJxnpFXvQdENNZTCfXFwl+U=@vger.kernel.org
X-Gm-Message-State: AFuF++k8vNRHpfB68QGDJAlgKnqTD2ASZOQYyNpYBp6NLhgT684EfPjV
	tIsPmsZgsLjcYg9FQOXnQmZIFBycaxp5zhSENX8O16HA0WM4B4aCJT/V
X-Gm-Gg: AYBFou2bGCQf8F7KyfMLT5YWhxJmXPaErg1lCjVIMzVNInYOMxt2PQazVTuh8mQSqK2
	cwx+4ONqVnCOtOx/izCHSFhAT5Ww/vE7bXuiYc+UHCxJmUu6XSaMOkUnXjoVB5zI4spPfiS616f
	Uj77oUYXzWGAw9MJBDXRo2VY4QA98GqcjlKD2FA2wdVJkPXpuGlShL/4f1+W+kEy+4t6lA0ARN7
	rlBd2n4KyTTKGU49kjCMXdvBhaS8wJKWMWdUBVU6pC0j6K18JGzXM5HnBrb8xAvs/E3iYLNwxnq
	txc9bg/s4MBy/oRD/ujHqeFebDJtsoDcBYiKhIlBvbzpemuTrHZoXOhoK9FEANQ8Q/sbsLodZJr
	GW8yl+ge8FyzpBMXBvcdw3Y1VQJFWyGbnO56pH4HiuC/vvCfSKe0DS8a/q8K39hogFBi0JWHfK5
	zIfHzoEIZx3lyBEbG5oNrmHvOBK8NOdAuQIFpJfFJEYgi4qGT7Bml/kVSZ4lHOa62C6C01YadOg
	tKhSbD46DU/EMT8H9Rk7YjFPDAJREx4YG84MTLB3qAsJuM=
X-Received: by 2002:a05:6000:990:b0:485:ad55:208d with SMTP id ffacd0b85a97d-4871e263f69mr7176550f8f.18.1789734469024;
        Fri, 18 Sep 2026 05:27:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5636sm4043259f8f.5.2026.09.18.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:27:48 -0700 (PDT)
Date: Fri, 18 Sep 2026 13:27:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: quanyeyang <quanyeyang@proton.me>
Cc: Quanye Yang via B4 Relay <devnull+quanyeyang.proton.me@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, "Matthieu Baerts
 (NGI0)" <matttbe@kernel.org>, Geliang Tang <geliang@kernel.org>, Mat
 Martineau <martineau@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] tcp: annotate lockless access to
 sk->sk_err
Message-ID: <20260918132747.6ac8beeb@pumpkin>
In-Reply-To: <zEvCcu9s6PbTRajtbCvCik2zCOJsXozLWWvYsLfl6AV4IJLyXmS63i5nuaCmqk_5DsRajMO3IjRtFpOSpmRY55ByjpBJ8NmtwDk-kSpr9bM=@proton.me>
References: <20260917-mptcp-sk-err-net-v4-0-1f04f52f2561@proton.me>
	<20260917-mptcp-sk-err-net-v4-1-1f04f52f2561@proton.me>
	<20260918105142.3dc675eb@pumpkin>
	<zEvCcu9s6PbTRajtbCvCik2zCOJsXozLWWvYsLfl6AV4IJLyXmS63i5nuaCmqk_5DsRajMO3IjRtFpOSpmRY55ByjpBJ8NmtwDk-kSpr9bM=@proton.me>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 10:33:04 +0000
quanyeyang <quanyeyang@proton.me> wrote:

> On Friday, September 18th, 2026 at AM 2:51, David Laight <david.laight.linux@gmail.com> wrote:
> 
> > Don't they need annotating with data_race() ?  
> 
> I think READ_ONCE() is the intended marker here.

If the race is with locked accesses I think you need both.

David

> 
> These loads are part of the I/O control flow (stop send/recv/splice),
> not diagnostic or heuristic reads. data_race() would silence KCSAN
> but would not restrict compiler optimizations, so the load could still
> be torn, fused or reissued. READ_ONCE() is a single-copy atomic load
> and pairs with the existing WRITE_ONCE()/xchg() updates of sk_err,
> same as tcp_poll() after e13ec3da05d1.
> 
> sock_error() uses data_race() only on the fast-path "is it zero?"
> check, which is then validated by xchg(). That pattern does not
> apply to these peeks.
> 
> Quanye
> 


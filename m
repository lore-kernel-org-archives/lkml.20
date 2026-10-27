Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117852;
	b=zlRQy3ooCfuJ7bm5JX+3+9Vlv7P3wrliy3qI1fsCQ3KLyLgnaUtiYz+wUqQKqQLaPY7r
	 g97bJMYspALuEbbfO7e13v1wh/FbedXGPKs6BDbkrGnFeB3DBct/1eLC4jZpwOgWs31sd
	 smjhn88OOG4T88cjnZWXzBQgibddU54LYQliqBC7vjTwi4/OQlwKCWgULf//DFWWJDqEH
	 A8slEpCiKjzfvvAQTZ/IG4qLHQcLpNwXEpmgycpmuWwVMhB55K5To6iSAugtQscFkY/Ye
	 //HzUoKwSCXauvqj0NRY2rgz+GDB/vmM9hd9yiZlstuGeJS9tjKMnWROq0Hm7y6tnqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117852;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4+5GjA9xcyojbBFlKgNz6N+IXdxCy/xs/OXr6GA6okg=;
	b=DVMqww3Ym/5dH7YbN0/MnRCqPUEjOm6VNiOqPV1q4dnIlp9G97kM7a1S4PkW9mvjO9EF
	 Q9zRXHAdR6gg19R2aMXUUsd20aiLij8MlKL9V+/VCByDk+wXa1V7cBe4Ks2zD6hGEaZ2f
	 y/RbxzW+kUAvS8vGI6F+LxCcIdK/w4J2uph6rELKvGeMUgBdX4hHEjJBHHVpOahTZNgoq
	 IO5smSmNVvdenoFEFEwhPRhDmTtu4c6ruG+PwOhxz8OvvTmsAOnJmIAaIDkDxY6cZAd+u
	 d/PZ1Cp2QOJWC8sbyWfHYg8pEiQcfq1fKrGNO1jvnfhLKF2jdDBj9YTYk7rd3yFWktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKQjrsVJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B28606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YKQjrsVJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8031F031E8
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117850;
	bh=4+5GjA9xcyojbBFlKgNz6N+IXdxCy/xs/OXr6GA6okg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YKQjrsVJMOkTMVqbR0ZtC/1j9AQxIjawdY/VHCViS6+cWLYYtciat/HvrXwXHS/OX
	 OaJ85fQsJzARtCpYmpPSykEMUI+W0keFd7lzkHMAfQPWviGlEN7Il+w/xuyskh1rpH
	 D357fuaEJrhJUV5r2eqviJWIOUQxnoM/U14o/cxXdrvPQS1/PIFns3kOoY60/YXtTB
	 k0n2cjt3qvtJvEsAYda5zTC4ZzdBXIzn6+kO3Qa00by0M34KoJIkhyeHehbGcICCO7
	 7DLs+QQxMPysQtpxaM0zFqFo5RqUI7O9+MvFpZH2enDkLzop78C1BvISm1cf3jucUo
	 /KCt9znlG6B8Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso103338e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:17:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzPt91048BPPqFudynup64nn3K6cK0C640gDti4EXixAKQEmVrSPAc6lInRv0xXCRBD+PIN3cZ0ehYDl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWXrYozGdSI1Is4Fq7FhqfMUbzQgUDP3mXxGP8pj+8ql67qYsD
	YHYTcBEzZivM2tUM3Bym/0q2HM+3CfydOQFp/zrh15iOxVJ4UH2ABb1ZB36pKeCgGciGZCLKjrG
	Fv4gWwgY69Wr9fSn8jPWonRigYrDc5tc=
X-Received: by 2002:a05:6512:33c7:b0:5be:54ec:67bc with SMTP id
 2adb3069b0e04-5bfb716df84mr3863890e87.1.1793117849540; Tue, 27 Oct 2026
 09:17:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com> <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
In-Reply-To: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 17:17:16 +0100
X-Gmail-Original-Message-ID: <CAL4Wiio4tt8aCP7u55nusQBO25=nWkysVA-Qy3woPuByE0=pug@mail.gmail.com>
X-Gm-Features: AclHuK8Cngv15UoUB5IJUWV2oDcpXFoB6P2PPN_P-Gvk6dnv9iQE6eKqsWbk1us
Message-ID: <CAL4Wiio4tt8aCP7u55nusQBO25=nWkysVA-Qy3woPuByE0=pug@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] netlink: check sk_rcvbuf before charging the
 dump skb
To: jhonata.poma@gmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 oct. 2026 =C3=A0 15:04, Jhonata Poma-Hansen via B4 Relay
<devnull+jhonata.poma.gmail.com@kernel.org> a =C3=A9crit :
>
> From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
>
> Since commit ae8f160e7eb2 ("netlink: Fix wraparounds of
> sk->sk_rmem_alloc."), netlink_dump() charges the dump skb first and
> queues it only if sk_rmem_alloc is still below sk_rcvbuf. Commit
> a215b5723922 ("netlink: make sure we allow at least one dump skb")
> added an exception for an empty socket.
>
> A dump that starts while something else is still charged to a socket
> with a small receive buffer fails with ENOBUFS and stays running.
> Every recvmsg() retries it, fails again and sets sk_err, so a reader
> that peeks before reading, as libnl does, gets ENOBUFS on the read
> after each peek, never consumes the message at the head of the queue
> and spins forever.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

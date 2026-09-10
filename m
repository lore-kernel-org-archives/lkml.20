Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759538B7D2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020058; cv=none; b=lwXXJsv2AAWYbRVHaYo5xiQ6h9Xb9RA++JYoItEoYF9oTbDjLn+geph4r2iEC8vCWz4C85cGrTTNYoSUE29+ctqsRlrFuHWx8WEw+wfSIPJec/evvyHGFtw1i+aiyW5p07eQKthXbaz6CTSAsI9B+trrcEAGJMiAgvH7C30TVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020058; c=relaxed/simple;
	bh=MxAqlA/knN+CndJZ/K3X/H4mjkYMVHTPTMrBAOCXbFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4oC4/NUR/27ZQ/kWyHyw58zWeUlu9trBTnrllMgp3rcO9AOt6G8RGxEi8fmhD16qZ9+xmkXY3dsBcMI+QzOwfHmarQ3IAMAJX3P0NtybHEJBo5G2FY+0ev8Z9b98AFtVEDFXFl92hxDQpqQuU41gtU27yuDDy3HZsXaZrUK3wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LAEjRrtT; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LAEjRrtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789020045; x=1789279245;
	bh=/FgtSlZ0a1n+PC8Bdzhevp2pL1qW8IgHZEYddNfOFuQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LAEjRrtTGAmh5+tKltaEtj9Rd3ju85iroudxfDT0Nojt50DERxEDbViBa6id5h48g
	 8YB2vD8/eHHpzRHpHFeTuwylpOeW6mowsYQaoRYbAF24niVNEY0etxyPtQxUOm9ndT
	 JYV00x1mtF2YAVBhGQrrTiu7cY2YHotFhxy9K0XeQghccwRIbN+1nQg4r16Yr5MSE9
	 WobVZ+iZWBzwycsP1Z0he8xzaPzTqZW4x5La+gLg9LYgVDecivUagcGGfJEp7tI1De
	 EYtkvvQcQ4e+bYdf2+YS+01yUA6Me1vraNEVuS1iGIyftg1XTP3GJ25DTw8H1wlR2Y
	 kyb68dFppRO9A==
Date: Thu, 10 Sep 2026 06:00:40 +0000
To: Jiayuan Chen <jiayuan.chen@linux.dev>
From: quanyeyang <quanyeyang@proton.me>
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, Geliang Tang <geliang@kernel.org>, Mat Martineau <martineau@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] tcp: fix data-race in tcp_recv_should_stop
Message-ID: <sN6wec7nmLx2G26awdnGyHpCTUAWzwRWNPoIy7LZrlg2a4wK9m9yAJ-di5ayMuixX77NhR3jnUMLWCf8JEktcjh9Y3ZENxgwnIssWgWnRbw=@proton.me>
In-Reply-To: <8bbee583-6f21-4817-bfeb-2d60057380a3@linux.dev>
References: <20260909-mptcp-sk-err-net-v2-1-5044abecac90@proton.me> <8bbee583-6f21-4817-bfeb-2d60057380a3@linux.dev>
Feedback-ID: 206494642:user:proton
X-Pm-Message-ID: 238750b0fc0bed8c945ff3ffd923e27d315b3303
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> The lockless writers are sock_error() from SO_ERROR and recvmmsg(),
> so every plain read of sk_err on a TCP socket has the same race, not
> only this helper:
>      tcp_recvmsg_locked
>      tcp_sendmsg_locked
>      tcp_splice_read
>      sk_stream_wait_memory
>      tcp_bpf_sendmsg
>      tcp_bpf_recvmsg_parser
>      mptcp_splice_read
>      mptcp_recvmsg
>=20
> I'd drop the Fixes tag, target net-next and annotate all of them like
> e13ec3da05d1, instead of pointing at a MPTCP commit.
>=20
> Eric, Matthieu, does that sound OK?
>=20
Thanks Jiayuan, Matt.

Agreed that eb477fdd6803 only moved the existing load, so I will
drop the Fixes tag and retarget to net-next.

I will also annotate the remaining unmarked sk_err reads on the
TCP/MPTCP recv and splice paths (the other arm of the same loops
that Sashiko pointed out). I would keep this as KCSAN annotations
in the style of e13ec3da05d1, and leave the check-then-sock_error()
TOCTOU as a separate change.

sk_stream_wait_memory() already uses READ_ONCE(sk->sk_err). I will
double-check the sendmsg/bpf sites before expanding further.

Happy to wait if Eric prefers a different scope.

Quanye

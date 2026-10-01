Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D47503BE0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858705; cv=none; b=pA5m7Q2yZnzz0YPJqeDb9SinE1dz9Ln143ui38pO+wztahE6lGOTQPN9Y4d2JB/LBz/KsVNCrs4LoMocB+NPeTB9dVlWU0UjIOWj5DlLi5awf0vrRIsPNmurF/MYXxmI4j0p/k+6YXjoFknXpFDSAYJBUTFntLDfxSR2LcVUiM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858705; c=relaxed/simple;
	bh=WWjTMgSC5KGQbeApXNyVF/VIJzMcscBaz6Mxej++G0g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FtlY3hU9DK8+HqJki9sAAkF12qbxuBSySRbab+QoFfW8OoqNhP2OTttN+CZnHTVfKNO1X5Z3Vh0zDVIVM4i+EPL92msbxhGm7G2w2h/UaJsqj0PXXG6FJBsEswBGOPXYoTVadJTqAsUm1ICsplyTMLJWgkFSKcYM3O02rpHgx60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kmxutjMN; arc=none smtp.client-ip=109.224.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kmxutjMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790858697; x=1791117897;
	bh=mghA0OKeQMpp54Wtporm7vn5uGTbfZHVOnG9LgIUzjA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kmxutjMNKHm0SHBTcgbzNuLuLApgV/hehr9MUOUHiKiVAkUp0o5IH5g1YOVIkM5Pq
	 Q3AzrH1r+eFbAInVDlybZPBp75PZrIdkFErCWS+ftaKQ6pgjeq6rs37ccyJw+GY6c7
	 a1bnMWc8UpSxxCPbcBFUagr4ThoDAsOXvC7uy2QPeSqdOLKWbvUVdTWT1GDUfDCEKc
	 v6sCtd2Qa1Wdf9ee0fX4XaTeGbjN2cduKLNOXwRD0PCwk7f4++IkYvfRimoYZjtXhm
	 aDcJWxfIy6+dnIOeUr2Gy0YS0F1+7OvJ4uFKLuVh0+YC3xRNwjHviX9EOURYXLMtmG
	 C8KaBmVI2aqjA==
Date: Thu, 01 Oct 2026 12:44:52 +0000
To: Paolo Abeni <pabeni@redhat.com>
From: quanyeyang <quanyeyang@proton.me>
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, Geliang Tang <geliang@kernel.org>, Mat Martineau <martineau@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/2] tcp: annotate lockless access to sk->sk_err
Message-ID: <qXJe25Y3RpKh3OU_LwJJcDAE-DYt4P5dVJWcUw11W7l-DE34S87MQLIU2Ig2LyWnzs6ESlMso__YoZABF7PyLlGqm1F82aQ1It3usBru4_M=@proton.me>
In-Reply-To: <3d9d442f-f168-43da-87b0-010ad5a78365@redhat.com>
References: <20260925-mptcp-sk-err-net-v5-0-0cac04d6ea48@proton.me> <3d9d442f-f168-43da-87b0-010ad5a78365@redhat.com>
Feedback-ID: 206494642:user:proton
X-Pm-Message-ID: 8bdcaf95ea882c5c7f7556d8f3fbc15ec42f775b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Note that there are more possible follow-ups in tls and on the write side=
:
>=20
Thanks for pointing this out.

I'll continue looking into the remaining sk_err accesses in TLS and on the =
write side, and follow up with patches where appropriate.

Thanks,
Quanye
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925-mptcp-sk-err=
-net-v5-0-0cac04d6ea48@proton.me
>=20
> /P
>=20
> 

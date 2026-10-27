Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092935;
	b=ejM3f7AI0o3KsaRCuzpLLvltJrXLMMO1CII4lGNkvdVOact3Wg8BmMDPmQFW5z+YELtD
	 IHnwBlCrrxDu8Kii45SXPRZhPFhAS4me2DGCX7TOtApIaiJsHOa9YHjymV09Iko39v4mQ
	 6356kP6JkwhnL2YT9Lr3gErqW2dUbAO4d7xeSheHs+WmamZ+RoHuaFHC1vIyTNH17xBo5
	 fz9BR4J36//zTddF/U2R4j0eLsy2OervTI6qj3j1Bm89M19zw6bCH/zL3qdXaZWWEguOs
	 iG9eoNWT2KwHTc8nES7fugce8DvZd0qx2moYw3WZFjQBdFaNGIdJbh1AEd7rTSccobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092935;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5wbVVmWcm5uyGXGomrFfyWmbiAFVDweHi8XdGjAXgF4=;
	b=Jr5ZeIOigSYzszX4+/h07nusS7CzWqzN2IgYXh4t8DOJF4NrPtTDTpfRTkN5N9szm7q4
	 FXTqj7nj1hjEko1BLeRwFBIwoeek3IsDhthJOvgyiIMlWREAvAgEi+h4P1yA/Ig8/eLS+
	 k5pxWOZXtUezauikkYuN93iYRCyO4zw2D5dDpL91fVYXn2OXOqhSq+PrbpbgPn2wlFKvy
	 SwS+M+TuZ82WFpKkOvXGa3FPGzR68rOnYLef66ILPxVq1lUTIsr1tgxzsyZaYUAKwiutf
	 JL+hwegXH2DFip8QvrwJC8WWcXijKaD2yWYenoRQvb0dq0EwdYhUBHX2uk2MUyq39DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NntJ1JRD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F138606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NntJ1JRD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C4F1F01828
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092934;
	bh=5wbVVmWcm5uyGXGomrFfyWmbiAFVDweHi8XdGjAXgF4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NntJ1JRD5zuaIH1sEJqcaDk7B0Ax6k/eRn9dvAeGr0nrl6CxXhf2Nu39GqD+C4+AQ
	 BbzPLzahtw396Ew6Bbfq6HyC7ff2nf4JA3ywd7i1ppBpAELifBEpVgfp67CNXPNdT1
	 9V8S92ShdHt8BjemfEkXIHxMP8gU0Uz4cl7CaDuJczuPK4/YGfOUiBocSR34iZoHWb
	 1Y5wAOpxXwHapV7bNZlPhtaIMGgg75oIkW0cZq+TPIBBAJVtav44yZ/ctmzO8It3j0
	 xBJqO1LdLHfv00EC2r0Ib0/PVuJFloaWushhK7Okhv5HvFlCdZ3apigbPnn7S7zem9
	 YMgwmAqNxLfpA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a9e87ba696so27437021fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:22:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfKC6rZv55XraF457E+POOxT6dgEbQTNA3RXCTNiKlCeMwUrJfxDXI/KPSixiKmfWQdG4o5aQAMmtX7Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSkutn8UnQsTegcwxwZOT4uwyfQZsxAOzOMBl9uSe3IDJFqyTI
	4tHlOdjFTdQq4mqJ2jfDnZ/6Fb7Y2UOESbyQ/B0pLcOxYMNVt9CsOYj1Xswwb5hVaF7bksmUqcl
	RpR5/qz4EqC+jomY19FKa8hoEmPNyigA=
X-Received: by 2002:a05:651c:1445:b0:3ab:4c60:897c with SMTP id
 38308e7fff4ca-3ac6fd59c08mr21629081fa.27.1793092933744; Tue, 27 Oct 2026
 02:22:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021235732.1313305-2-kj2864@nyu.edu>
In-Reply-To: <20261021235732.1313305-2-kj2864@nyu.edu>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 10:22:00 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq0Ti5kAr4sRsG+XV6XJDMJkhk0eMaQW7n_AZAbghDOYA@mail.gmail.com>
X-Gm-Features: AclHuK8APDmMNo0ydcpfXRwiZ53y6y4WHS1Nwl34pF8p4sVxWR75dI3yGh_H4Dg
Message-ID: <CAL4Wiiq0Ti5kAr4sRsG+XV6XJDMJkhk0eMaQW7n_AZAbghDOYA@mail.gmail.com>
Subject: Re: [PATCH net v6] net: ipv4: add zero check for snd_cwnd_clamp
To: Kaho Jiang <kj2864@nyu.edu>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, edumazet@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+71b6509cb791e531@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 oct. 2026 =C3=A0 01:58, Kaho Jiang <kj2864@nyu.edu> a =C3=A9crit=
 :
>
> When RTAX_CWND is locked, user is able to pass 0 into it.
> This could lead to writing 0 to tp->snd_cwnd, leading to a
> division by zero error.
>
>

>
> Fix by checking if user pass in zero as parameter and if lock is present.
>
> Fixes: 814d488c6126 ("tcp: fix the timid additive increase on stretch ACK=
s")
> Cc: stable@vger.kernel.org
> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Reported-by: co+71b6509cb791e531@bugs.sh
> Assisted-by: LLM
> Signed-off-by: Kaho Jiang <kj2864@nyu.edu>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

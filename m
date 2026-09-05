Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38F3DC856;
	Sat,  5 Sep 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605891; cv=pass; b=N9GcAlTwwxbGNi/mcZXgncjYNNtEWiREbIfl86BLAym60hlutVtYEBZP5Je8zndM6IuQTVqbdql+OSP84PgGVJqGt4fCkJTL+8DrZCW3pph7SyKgLZUbM2FeOhCxWQmQprY9skTcFsdy+gRce/c9T5HacviSvuWsrnHa1hETH9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605891; c=relaxed/simple;
	bh=8/LRCf2d/Vb8yj1T6vOnmEEE07PqtOSZJGPqAQuSuiQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RaSmIaBaDiBdpfSv2Rk4WjTqn16HtoOvGvtZZ+79/7FADImgCeAjWNo4WOTxBY1Lyb6vV1+2RfAl1sM6TnPy1q9zPNU4aAik9I8C9q5SLODbZGrut5JcKmSVQjSosOXT+NyFK2NKoU8OKlepWduV8RxyZPWHWP203aGCHdGceAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=eqv17CtE; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="eqv17CtE"
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hcVfx6zmwzyTZ;
	Sat, 05 Sep 2026 13:58:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1788605882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGf3EGNvMC+tCJO1atmXj/XjW6IrJkfyCoTSb8aqIhk=;
	b=eqv17CtEASYM38q8/zb1i35g50Q3asRS8pGm6zfhVbGkS+W2Cj3stf7lXP8qHbVl+4sOjq
	cbS9R9wh+83hyj6up0IAgT48lHf6tYPnRY64cnqzi4qFHA6Z3fQBd7e/DiNnKgfczyqrAx
	qRLs9ZGFgafsFmPUjAMQW07VHiJW/hg=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1788605882;
	b=FLP5bVagObojUp0yV8P76bAIi9YKKxgBIh/j2EKh2I6SVeM/nSB6lXrj+v8rQRO35nLTFL
	hZio94dbw+xI2MSRDbUN3YLzU7AwcDamB0ONHD/8S6CkKN/XX9EsvM4AToHwW+thZs62N3
	2wFX6eR9Q4UdySPpf8fdhswXEYotCx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1788605882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGf3EGNvMC+tCJO1atmXj/XjW6IrJkfyCoTSb8aqIhk=;
	b=DtlXJAyLnN+HykwaaGU6x+dSlcdqz/kqHRDwA2PEU3CniToYb8ma+vxPVoe2iuqYQtdTu+
	qUPKaFZErlZP1vc+N57yDBQlmKCDbjRxfl0vEFwcUfvo4RZiL41hFAKtiy5Q8ilZ8+nFGg
	yffEpoQeshWyEjWi4K4hPoMKgo4Fbsc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 65FAD198005C;
	Sat,  5 Sep 2026 06:58:00 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Sat, 05 Sep 2026 06:58:00 -0400
X-ME-Sender: <xms:tfWbah5TQKB-Q050Xvn_LROh9Yc8w52AZAVvShIfr_av3nmO5oN5kg>
    <xme:tfWbapsrR4UUjK9IvN5y_dgOz889aeYtLr_YFn4YGhsqRhmXRO7zxj1Nf5GFKpqP_
    xqe1O0snu9rdOlg14bjmXZjcwYZ9N2oZO-_Cq00oJTe4rgSTBEhC5WF>
X-ME-Proxy-Cause: dmFkZTELQ3SQvWgUATuEy9cPGDpMSwyORhxHL5EyoGz4mQ0tjQ2VPPRI6D26AhuGC/0AlV
    PTPBEW281iUHFAgAuTVVxwrMqFHVCaSkNf6L9X9DVaqneok3ZOj4gmKcKzzSYV0zwsCQK4
    0N6ZNJAKd9220k8PgxwyxGgq+k4BSZ6tkjoq9r4I19hOpZH/YaX/bmNv968AAL1ZEazzQR
    +IJajjO7UQ8nxqioRXnLoRC1ZEK45qIefKf9Ip/e3CZi3nusUN+EDKAmXLAGl3lOfBjeBX
    wWBJvIvI0XW85xldtqP8CuySRyaOv3HcXLCl5cP2hscci3cpL2plESjUb7vzGPdYhPYFTx
    YsAKLuxNXqufHJVULMh+mZLF1XqVh5ZvkcCe9hyc/m2CJuuKsYeayV0nrKkgVnqgIKAE2P
    9LIgaoYcrpULe9pdHKC9pNJ9JkJzG/07we+ME8tFz5SGgTGM8RN8DzTK12BQtfe8QeNQIh
    PDCPJAozcP+QnALOm/FakGthLxFq1rUyMTWOwy4UIvcFwMvd6g+jn5hf7OSKRb1BjuFwiV
    MhN+yYtqJ7iTgUgzcAAFFugSVFwQlC9xJp6+2uS7pjvtwHClDtgGrez3iXEy/VyMdPEWWV
    JJuqURugfQ84mhYBud1YZgJ4y5jnkddqafsYjlGfZERcakTQoJkJTTrjnxNA
X-ME-Proxy: <xmx:uPWbarlFvTiNKzKyU7_YbABY3FgBrPbj1Ux2wT4SfLUvMT6iJCes7g>
    <xmx:uPWbatUjTckt8OLHq_AR6bJcvib65sm9Xmwm44VUhLG3w4hAognx1A>
    <xmx:uPWbaoe7YThptqpQ-GxxnXfsWnEQuVJM48SlgiuuDkPK8wttGFdCRw>
    <xmx:uPWbajlu8pOVaDvDHAstuMT1LiVTEVBiFhVkcesroMDA4sEluUTmlA>
    <xmx:uPWbaiBiy6eKwjQm9U55aZnbvOdluy1tzwAJ6qOwYbpnaQ1b8uSf0Hy7>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 997CFF80083; Sat,  5 Sep 2026 06:57:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AWdxuz6OZDWw
Date: Sat, 05 Sep 2026 13:55:43 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: "Jakub Kicinski" <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Simon Horman" <horms@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Andy Gross" <agross@kernel.org>,
 "Mihai Moldovan" <ionic@ionic.de>, "Denis Kenzior" <denkenz@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Message-Id: <4531eba0-e44c-462d-8fcc-b189f6df1f31@app.fastmail.com>
In-Reply-To: <20260905110727.0ff502e4@pumpkin>
References: <20260901131934.225991-1-juha-matti.tilli@iki.fi>
 <20260901131934.225991-14-juha-matti.tilli@iki.fi>
 <20260904184038.5c1e673a@kernel.org>
 <0cc80b04-1bf0-419a-809c-e16be3f6a933@app.fastmail.com>
 <20260905110727.0ff502e4@pumpkin>
Subject: Re: [PATCH v6 13/15] net: qrtr: limit endpoint range to 16 bits on 32-bit
 machines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, Sep 5, 2026, at 13:07, David Laight wrote:
> On Sat, 05 Sep 2026 07:21:33 +0300
> "Juha-Matti Tilli" <juha-matti.tilli@iki.fi> wrote:
> > Indeed, I will later post a new version with UINT16_MAX replaced by
> > 65535.
> 
> Makes more sense anyway because it is an arbitrary bound (rather than
> ensuring the result will fit in 16 bits.
> Indeed, it might be better to use a different limit.

Well, on that I might disagree. As of this commit, the code will have to 
cram that into 16 bits on 32-bit platforms. Only the later commit will 
remove the restriction that lookups are limited to 32 bits total.

Node ids are 32-bit by definition, so 32+16=48 > 32, so u16 won't help.

Of course, there's the possibility that if the later commit is what we
want, that this will be squashed with the later commit.

I looked at most XA_LIMIT users and they seem to follow the policy that 
allocations are limited to usually 16, 31 or 32 bits. And I found
USHRT_MAX -- that's what I was looking for instead of UINT16_MAX.

So I still think that "limited by kernel memory" is the best here. While 
I can't envision a system with more than 65534 QRTR endpoints, I'm still
uncomfortable with setting the limit to a low value.

So, the next patchset will have USHRT_MAX. Soon my patchset of actually
having multiple ath11k/ath12k is ready for review so I'll post that too.
It fixes the memory leak in Mihai's original set.

BR, Juha-Matti

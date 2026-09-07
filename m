Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64140FDAD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766246; cv=pass; b=IiJSNtCQlKD2/mAjF5f+4Gdq46DB8HRRThz1PjZ2RsLRGe1ZrJloPcBYZfxBTnsCJDM/SegB6TushYxlEuC/f7XRbSnV9YN8vV2Ls/v0RcKHlj/DevCdOpWcI4mAgJRuZHnEdIY1Pm5C62NHGNjI3uKr0bSTCIfLvmhlIgG/EHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766246; c=relaxed/simple;
	bh=ws1lt2A9wuTY0mZ//UjpSJvqUAKan2kCqa9w0DLo52c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K81fd7YQbNYgb5ec+6LjJ/XV/yx4uYJR4YJ7QPEJqMGSH0rCd+XipCx0BO27lj43fu6sAENvh44QMNrziw6gTmG5BlCkylkqUmXcpx7UJoMfePkAkJicU9HM2YMTG9Jvy5cDkvRgI1Xbizkrl7XUzI1P3dOo9PYn20crAflnPMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=r2xJc220; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="r2xJc220"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so28723541fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788766242; cv=none;
        d=google.com; s=arc-20260327;
        b=QO+PNbJzVUAo4OH4d9LjoWIANng4GAa+NYO7j9o45u4iyYhgTWagOUyovDr0ZnZTgo
         SpLXg2qmGL7mwFjWcovvUcM4qyc9WF+n3hgfknIVPNMeIjcn9up94Ajax5pObYgwJeUt
         I8uNYrVaYqxoCXpHKGizsD3dqfinO2rsEo7u8DxlhWGVYSRhqj6FXXJVAixkpZtvUQpV
         k8A+BlVq/K4eb753gF9ITjXyLIuYOTEFHdG6c0ovlP3mATla8YQJ3/XLX94Xd5HP5CHf
         JOa3aovOcNpQ/AD44u+uEP1kqFLGxWxKQ3Z8CmmiHcsg8EslB00zUKtVvvLASNmY1h7X
         7Riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K8pzZlzdqRIT/RWxSl/nFSJH5gf6fu3+T1v+V4JsYz8=;
        fh=63x8HV10ZwKPdxJbYr0A8AqvWNZrL3rZPmwI85b4Kng=;
        b=LwGAnlagwn0+aMCV9iyqT8fwqLe7grit5Tg/+PmD/3p/QoRLDBeVzpX8Od4sBbo3r4
         CRlQpt7nIsM/hzzS16sr2M6KkGa32zZbNB7BcJ7TytJCeyzTl+RbR+d9Zm1jn1hK6v6z
         ooIKc9Er3BeHYZ5FYXcuOgXk5u8Rb3ehiHE5fdu8yL82k4XUW6gvdwpreVHttON+/8zh
         5UxDeVUcRY0oznROPh14pJS64JtRsh9wJ29rIladXb5KX3rUOW5L8Oi0ft3pHwp0fOkr
         EAiIPa6gaE05wOr7vwwynXdZ8xBr152wt2h1OlvyPLPAxPiCsRkX1dPvPTO3a0lCKJAC
         n7Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788766242; x=1789371042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8pzZlzdqRIT/RWxSl/nFSJH5gf6fu3+T1v+V4JsYz8=;
        b=r2xJc220Zc65Y7W2MaMaq3YAsTrjViOVCgIePlgRrEVuKOUCWhaobo2ZN7lFvrwJmH
         jwhgA2Ey/xrqrDsX0hTrSZArRxWNUbTJ1BBoXFDAuqPVGWS3uzGaKwJtrj/Q46uRMssS
         o1MQx7lWWvmkB+Y5OpNmQAepBU7XbVWnx3dk+9NRACPts7fAe4ufO3sOWgfakB6qSATi
         BRw1VEHwqp+x4iOmusvYYb8A47gpu6ssJcKBZyybXPBYZQ2Kj63vfBr+ZkF2Or4l2THO
         Q/7Q/eobjosfi0XLUIJxdEXDoTfrjgRLmSfIZn8te4/DI2fK1mfOnuavwXgBtxjZX36d
         suxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766242; x=1789371042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8pzZlzdqRIT/RWxSl/nFSJH5gf6fu3+T1v+V4JsYz8=;
        b=cLR1dfTQxgHV0FEcM7VAhPHXzFCAkBDuNmJYtiKhC//ex9K3efn5kNg3uXB88dsQDA
         yWi7ShT+sGqJvr9qnjW0d8ZNbDJn7CWbXOc4rJ3ySO3fiDx3OUwPVnLC6nGc+vzW/SyN
         dELUEIcDiBop32ayztXA6a/jMpn56QPgU6s/x/mk9qYPZ3I7TzjGYHWFzmEqR5ntl731
         g9xB6PgjivyCuAfM2Qtec7UQMe3zGyg75mFAtmbK2ujBzW70Nywj/6lV2fZbKKoQCqGn
         IaOb4hcU52+cMDoD4Par1U/iQL+sFZ2rTaC7Txa09aRBkV5vJ9xbdz0URGL1qfpDZ990
         Wehg==
X-Forwarded-Encrypted: i=1; AKwUvBxQGc4nMOXeaFV0BICFSfG6bKPNNZ1DvXf0mq9XSp78YYkpLvkcyidz3Yyvo45WEzXVFCiD7fZN9geeEkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nYhjjU/msFPQ7VV7hp+4eeJlK8aW2j7+wT6RBWNUl+CraL7eV8
	lUCfZq3oO/qw72856ezZFWiRMHmjSNUi3zidLcICbjbpzK5edIA2kMomZ/p2GFp92m9mxCeKPWI
	CYaOYfxIEKaKmNfpcGXf9zngVkjR2EskCJPApczZ7g+s=
X-Gm-Gg: AYBFou1fkPlfaGjLK857XhCWLQQe/pdVg5CoRdvMqMhgunIeEPrl3uj/lxbVTJdf5Hw
	lHU1De0Db+cvt6k7TIG9wVhjPOutOZKD0oKJDbLs4fGvfzuTdeCIWPjwCPkxgmFUyJtRxN6i52T
	es1lMJn2BbqC6Fb1jMz1ZgcfRTAsVjnIAcH8GhUHL9RqccN+VQnVQ+qPcToI5kK4e2s47EWSO12
	nuOjaE71kJX0LnshhCMghAQX4wSY7x7rdOhmTPOb5HouJIKit4ArA6O9ZnQji1rM5R2SoLTstuS
	iSRqUfh6eW4vCOST15Nyv2/cYi2cRH7z0UqiEm5cNMb03MwnP4FQaVj00+Jds2dPQpbq+1TmOFs
	=
X-Received: by 2002:a2e:be1e:0:b0:3a3:314d:1169 with SMTP id
 38308e7fff4ca-3a371b39b13mr25408981fa.1.1788766242436; Mon, 07 Sep 2026
 00:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788668475.git.zihanx@nebusec.ai> <e8782427d0b3cd1854ab8d141eea224b53db55b9.1788668475.git.zihanx@nebusec.ai>
 <CANn89iKdX2-a+VhWa4CyDODSZByk=r5VRq38yQhLYBFRQ1Wy3A@mail.gmail.com>
In-Reply-To: <CANn89iKdX2-a+VhWa4CyDODSZByk=r5VRq38yQhLYBFRQ1Wy3A@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 7 Sep 2026 15:30:30 +0800
X-Gm-Features: AcwNN1VDHzbFiSzp25pLBVGEmL8dzveakPy4WZ3YZpO1QfoeCh76H4bfuzwlclo
Message-ID: <CAANe3eQpztNQF_e0qHXxAr+GM39tUdU0FS=1kO0h5LY+v-iVGw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] udp: diag: bound bucket lock hold time
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Pavel Emelyanov <xemul@parallels.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:07=E2=80=AFPM Eric Dumazet <edumazet@google.com> w=
rote:
>
> On Sun, Sep 6, 2026 at 12:35=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrot=
e:
> >
> > udp_diag_dump() currently keeps the UDP hash bucket spinlock held while
> > running the request's bytecode filter and filling a netlink response fo=
r
> > every socket in the bucket.  A large filter and a heavily populated buc=
ket
> > can therefore keep bottom halves disabled for an attacker-scaled amount=
 of
> > time.
> >
> > Collect at most SKARR_SZ matching sockets under the bucket lock, taking=
 a
> > reference for each socket, then run the filter and fill the response af=
ter
> > releasing the lock.  Resume with the existing (slot, s_num) dump state =
so
> > the next batch can skip already-walked sockets.  Leave bytecode filteri=
ng
> > until after unlock; unlike tcp_diag, a rejecting inet_diag bytecode pro=
gram
> > is the expensive part of this walk.
> >
> > Fixes: b6d640c2286d ("udp_diag: Implement the dump-all functionality")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: LLM
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > ---
> > changes in v2:
> >   - Drop the hash-list cursor, dump_done callback, extra module
> >     reference, and inet_diag core changes.  Dump state is only
> >     (slot, s_num), so the existing handler get/put around dump() is
> >     enough and udp_diag no longer manages its own module lifetime.
> >   - Batch at most SKARR_SZ matching sockets under the bucket lock
> >     like tcp_diag, and run bytecode filtering plus netlink fill after
> >     unlock.
> >   - v1 Link: https://lore.kernel.org/all/133b6aee9e2c908c9da37d5585b3d2=
cd016906cd.1788187473.git.zihanx@nebusec.ai
>
> pw-bot: rejected
>
> Please limit the complexity of filters.
>
> Anywone needing complex filters will implement them in user space.

Agreed.  v2 tried to make the dump walk tolerate large bytecode;
that was the wrong approach.

I will drop this patch and send a new series that rejects oversized
programs in inet_diag_bc_audit().  Richer matching can stay in
userspace.

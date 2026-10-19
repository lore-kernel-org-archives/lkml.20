Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431515;
	b=HF/dNFwfCrHJvvc6AQMYueLTTHB+ObDZwMeE1O6Okgspd1qadHbMMgnqF44zVX4n/umI
	 V0+ZbiVwHVpox2nVkQUGTVTvEu7h7N2Xj34dRfqDGg7Vv8a2Deq2Hlv4rer0oF370ubk8
	 6yynQbBZRVXmPdyMfXksFYESweH2Xkg8qd2LMEKI74P8NAPwZD26E3fSA3rYJyBptzu65
	 yMHKY1RVygePHNr8zkWenqrVmEPiN5A/eGm9ovEacs8TMbq4trtz/vOCWAt1EVQjUwz+A
	 jkHub/6FtMysyMW9gM3m0EREAlmqnOGq1yqKTIBWdwhXe1cfyIbo/oTrP34Tgdvbljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431515;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s6W52NLboX/AFrON+F4OTdfp/qkLqq0IjDzO/k4MGLA=;
	b=WWfEn/lyqrDAkwo6LE9YS/KKqTMD27dQ+bOnxnrPfEkC3IHVLNjDQLgcxz0L4Sh/F4s+
	 lhvXSGsotC++autkzAFfM+9eUw2b25kbvYUDldru9YnGGXslfexPZPR0efQEyIGKxj7X8
	 Obli++hKTclTKMRVGi80QhjzjPvQgjboR3HtlmIiqDLTOA9R6c9gATGUo0DnKiOSry8hH
	 jUVArXnXy/MRAVplYhCpXgRl+F6YsJWc6EESNg/KhXFDVO/mbP8ain5chT4mdL7V0ZLZE
	 I4CFDkPLfI4Dtup7fy6Yc1P8IJSpuiUcJBYD/07CsUFS5QxfXQL0ohwFBQ6jTm/v3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbsDr3kV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C305606A330
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbsDr3kV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2461F01577
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431514;
	bh=s6W52NLboX/AFrON+F4OTdfp/qkLqq0IjDzO/k4MGLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FbsDr3kVT9I0w6k9SF5ZxWq2MbBiWKCgI4YoK0iErcif68QqUS7X3h/x5FiwrI3Ca
	 MdC5DZpHQPvhAQn/aLdexPKQLOj1pWdfroyQPogJUIIUeUmYAwo3Xg53EXaHMF+W9P
	 FMK/NaBBY9u9YieM0lT26TBDNz40+nGJTRfMCZarwcxLlZARhycl9tAlOSSMA5rthB
	 m4Li99yORqeciCLayBPkE8NLE/PbRhXrqLfNuW9S+Z/EqQlLHBH5/FLAQOLGHBTA/x
	 vMH/QR2+bZh89JWGXb2TUGx6HCht4GNYEzPMeBEggYLJmNl/J5V1Kbe8rl4Ojv1q9S
	 MaFyMP+gh9fww==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-475920b9ca2so640907fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByU1SKtxvSyrxx35+110QE0gFgLb5PSyvNsGafubWExZ6/NZ9Re2TfNmot7fr9uyoZN4aWr8HgR23/RHvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOJZsxsXNdajePdPE44ianIy8jEkIZ0BelFXVjBovZnrQXAoFB
	bvoa3k/hU+2xl6QDYDa1GiKj1XVtBC9SXHMkirNdCVcyjNr23afJPXrUL0ofb69CQUcS/kpvtwY
	ut0q6L2465rBMd5NZCi4yVAiu8jCxH6w=
X-Received: by 2002:a05:6871:385a:b0:49e:670d:78a9 with SMTP id
 586e51a60fabf-4a757b9621bmr6971161fac.57.1792431514134; Mon, 19 Oct 2026
 10:38:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019170225.729789-1-vlad.wing@gmail.com> <20261019170225.729789-2-vlad.wing@gmail.com>
In-Reply-To: <20261019170225.729789-2-vlad.wing@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 19 Oct 2026 19:38:22 +0200
X-Gmail-Original-Message-ID: <CAL4WiioPv0k+MKGwtX9B1TGPmKv66rvGsYn1hKBxQG9Rie9qoA@mail.gmail.com>
X-Gm-Features: AclHuK82pczAE9KFR8j9a3CaRLQliaZrf66et_YIl0AKM8Sjxsa0n1iyw5RxUvw
Message-ID: <CAL4WiioPv0k+MKGwtX9B1TGPmKv66rvGsYn1hKBxQG9Rie9qoA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] lockdep: Introduce lockdep_unregister_key_nosync()
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Davide Caratti <dcaratti@redhat.com>, 
	Breno Leitao <leitao@debian.org>, Nilay Shroff <nilay@linux.ibm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 19 oct. 2026 =C3=A0 19:02, Vlad Poenaru <vlad.wing@gmail.com> a =C3=
=A9crit :
>
> From: Bart Van Assche <bvanassche@acm.org>
>
> Add a variant of lockdep_unregister_key() that neither sleeps nor waits
> for an RCU grace period. Instead the caller must make sure that a grace
> period elapses after the call before the memory holding the key is
> freed or reused.
>
> That lets callers that already free the key's memory with call_rcu() or
> kfree_rcu() avoid waiting for a second grace period. The qdisc code is
> such a caller: all qdiscs except ingress, clsact and noqueue embed a
> dynamic lockdep key and are freed with call_rcu(), and replacing an mq
> root on a multi-queue NIC destroys one qdisc per TX queue under RTNL,
> each currently waiting for its own expedited grace period.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun@kernel.org>
> Link: https://lore.kernel.org/all/20250203175939.3133477-2-bvanassche@acm=
.org/
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> [vlad: rebase onto synchronize_rcu_expedited(), spell out the grace
>  period requirement in the comments and changelog, describe the qdisc
>  use case]
> Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>

Acked-by: Eric Dumazet <edumazet@kenel.org>

Thanks.

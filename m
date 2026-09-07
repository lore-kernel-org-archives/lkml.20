Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6BD33BBD7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790629; cv=pass; b=YfWbZixOG5SYRi30Rc+LXWgDvM7legHMVVEQrSg7w2JLciPAUgwLOf9Qtz69kUWHko/f2iPvDfNISqLU4PVo9PQGEQGsv26ktiR+OeWYr/h+52kmL3qVdgDWlB3JkIzsLamJNH7berHnbdAVFq69faKpWzQ/T6PggO2usf2N85w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790629; c=relaxed/simple;
	bh=r9qKwV0zAtN+2SVkQpm8iG2hqEmHFrMaHaQiAf5LRMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRIDiIn2NtcMVzH5qZFub/LUIKTmLScLFSVyeQnwf27lLdGhIBKK7wEPcBEmRi2+0bIS0fw0O4ey8QM+Lf9WBfcOjn+p/dEJk/KTvJ5ePeex1K265PPRJzrsmeOefF+hFjNZiu6+bGn/4LdlKH2eDofvvqDJzn6UMbIsr6xF4bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=kY7UBq1E; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="kY7UBq1E"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39f20d19895so25031081fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788790625; cv=none;
        d=google.com; s=arc-20260327;
        b=a2ADV6h1cUuvhLEGlFQlFpafbT5rn7YZEcLy5pROplaD6XO85vCQwgg8r3Wai29y/G
         njk4AVjHIqz9cJTuEtd+dFTORCVsFF9FZY7x2V6jsj0JrIRGM9rsxuhD6svn1EqWUieq
         aIQMwka+Jk5yPPoC10LuLvlAp34L5AE7EhxYSDzGCUUwNqyrhY0F/Fq05dgfHLdSHMlM
         7wpOZD0FBhoRLVDfhmwD+h1xjLCX0Dlrv0c4QWIcyZfAue4IBAaTMJwl5EfW9GDfip+m
         +4guTlg/aFtbApT1Awqir/aQ6QfvgK4Tlj0/YLiyRLXgLQNlZgIwhzoOPDSHrnkqmiIj
         vj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2WxJHHlkD8fUS255uW+8IwBMyK5/qJDdXTRBzJeCF8=;
        fh=Y5JnC7DD8HGPBPxSoTWIfKbk7xTwiwYmM9790a2hOSA=;
        b=VP6oVjcLfZ7f9owMhATFcdauW67gtaBZHtAc2JMBZjNCcCpTl0Yxxqv2kFKCRHhwTz
         LYh62s8/03z04IQnp0oiPEjWCsz0CVsIpfTqju4tnAeqBRLlHO1xEFUo7H4oCg7pr21L
         OkgYVn2j2/bjxeObb1OIA9HYcfQi9GPloygCw8hagcmL+VWtCWc62jnQRqJHR//2oVFm
         0dekOqp0GGevRdV0+EslQ7tA1iELVLS4RLgXl/XnHE1/fTe6i7in+lOmHghqKk+FKiOY
         QbeMw/oQ8yez9Vp9oBT+A/HRx16fvusteb12Ela1VguyjU8ArQediHrlasolHmlKFJth
         mvqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788790625; x=1789395425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2WxJHHlkD8fUS255uW+8IwBMyK5/qJDdXTRBzJeCF8=;
        b=kY7UBq1EB/j5MOJXO+63sSKGBKtvZfYjD8cWggylmec7OZ+HvHj4+NiXvhlMQLNibr
         AfFpYoe+n6War0K+6lmkIJgAKujfdo9cY0S1sp3pwkxyRZTEEuh62sBnfD+lOFWwjXt8
         APR9oo1mbn7WkPozSbAnxVGu5KkqmjOhU1kVOo47egQN8LPX/o2wTmFQ7qyeE9Q1GMYJ
         3AsDanjMElX+NEPMNf9qZzq0U7ccF/yUMDGQRTm8KD41K8VhVyO10Bl8Xvz8CA6/D7M1
         X7RP9vNImq0lWPj6Q2Lne6R3tPGfYECGDth8PFx+iIvUeTxcpRDQET+WydCyR2f3HHgt
         DSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790625; x=1789395425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2WxJHHlkD8fUS255uW+8IwBMyK5/qJDdXTRBzJeCF8=;
        b=WCn1jwY7Kb13bRfYZnb6Abh9gDUV38lJ5ZNc3NlBOBko9GmEdZNKKiGaT8qWAXfHvb
         3OVgKHFe1jEPPZ0uskkriTYPdi7NSMxgtZlJqeM7w6DQCf1DNA2vBLxWcYULfKSfDrBL
         i1dYbkvjt1vEOAywJszWcmbV1H/TBdxmIhEacaWo8cW6itQqRqjsXyWFfcN6MfhqXVKN
         KvLrn/htAGtdNPjAt4SnTcL1bXHAvW/AkxJH58YaZw1SU89ybPfigZmi+Po2NV5LwS6z
         bQ3dXVIfejccFuPgInxR8WALKCRehIqVFrwr6EO/CLwtBLbq2UJqkPcpA+VtBk1GcfPO
         iftw==
X-Forwarded-Encrypted: i=1; AKwUvBxvodKp63wwLrwkt38LTJtfsT0ZUdGWjdogvXVovQVXq5YAWD4Q7mrEZwIH0wSW/SAdbi+FK+yT2iC9s7E=@vger.kernel.org
X-Gm-Message-State: AFuF++leUeEVxw+/0Qz/7DR+1he3Cna/WevJZmm6xBeY7uaYQ73YDzlk
	NSzQ4u2FdR3bNn973HzRDVLwOxFVz6VgkDhShpTxqdrlS7RY/6UvodiBfAGfnhVipOm2Ozsny7C
	WMzggl8/PCMLpsbxu7/XB0v902I93m9DqLEQQde3MhTQ=
X-Gm-Gg: AYBFou38sFkHde4iPcyP0DMSvx3oNV0qQwAypgjc66ZEAYavaoyKFtDBt2WhZQNsOKl
	LHKEr4AnyZDt7TF8mLn1QQAxNA/TFdPTQg2s09sBTjnUqX0nUkxDO8VwJuaKQ8md1C02hldgVUD
	piZP/7PnJU9ZYwENEbD9lohsD1E7aW80Zl909Ghg8WhclIdHNevHrqT57bs7+l4+tAZmoQwm3kS
	OoEHKDxR1AItio+zdo06Xrg/fQT0EFwvuT6x3+KSjXrSL39v+qkO2rIb2zm3evdoLvm4HndqgbD
	VDv9FU5UguXLD5Ln1rbFzWmQQWFc+B9FJWw6+6GbufPrlOl63+CuiL3y9GE6bVep6cZczvEQXD8
	=
X-Received: by 2002:a05:651c:a114:20b0:3a3:749e:31a2 with SMTP id
 38308e7fff4ca-3a3749e3344mr14616981fa.22.1788790624930; Mon, 07 Sep 2026
 07:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788775605.git.zihanx@nebusec.ai> <d1b0d3a224167afa0ee61db0c9f778a2d12ff9b6.1788775605.git.zihanx@nebusec.ai>
 <CANn89iJjUL9LJPipeCZKq3F=Rjhq-gdCKwnuW0pkvvpS_ai7UQ@mail.gmail.com>
In-Reply-To: <CANn89iJjUL9LJPipeCZKq3F=Rjhq-gdCKwnuW0pkvvpS_ai7UQ@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 7 Sep 2026 22:16:52 +0800
X-Gm-Features: AcwNN1U7aD2O-kbEJ_AiTgXWSyU09QYOnbLUYfF4yEMau5bpeNc0TtL7e78gZZI
Message-ID: <CAANe3eTxK3btTfTA9M0UVxJ3FOavnv3jgd3MUjLPoDNJMicg=A@mail.gmail.com>
Subject: Re: [PATCH net 1/1] inet_diag: cap bytecode filter complexity
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Vega <vega@nebusec.ai>, 
	Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 10:11=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, Sep 7, 2026 at 3:53=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrote=
:
> >
> > inet_diag dumps run request-supplied bytecode through inet_diag_bc_sk()
> > while walking TCP, UDP and MPTCP hash buckets under their bucket locks.
> > The auditor currently accepts an arbitrarily long program, so a dump
> > can spend unbounded time in that locked section.
> >
> > That fact is already present at the git epoch: tcpdiag_bc_audit() had
> > no op cap, and tcpdiag_dump() ran the bytecode under the listener and
> > ehash locks. Later inet_diag extraction only moved the same code.
> >
> > ss(8) filters only need a handful of compare/host/mark operations.
> > Reject programs with more than 64 ops in inet_diag_bc_audit() so TCP,
> > UDP and MPTCP dumps share the same limit. 64 is a policy cap above a
> > normal ss(8) filter, not a lock-hold budget.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: LLM
> > Co-developed-by: Luxing Yin <root@tr0jan.top>
> > Signed-off-by: Luxing Yin <root@tr0jan.top>
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > ---
> >  net/ipv4/inet_diag.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/net/ipv4/inet_diag.c b/net/ipv4/inet_diag.c
> > index 34b77aa87d0a4..1ca528cd3e72b 100644
> > --- a/net/ipv4/inet_diag.c
> > +++ b/net/ipv4/inet_diag.c
> > @@ -725,6 +725,12 @@ static bool valid_cgroupcond(const struct inet_dia=
g_bc_op *op, int len,
> >  }
> >  #endif
> >
> > +/* ss(8) filters only need a handful of compare/host/mark ops.
> > + * Bound the program so dump walks cannot run an arbitrarily long
> > + * bytecode sequence under the socket hash bucket locks.
> > + */
> > +#define INET_DIAG_BC_MAX_OPS 64
>
> This is unacceptable.
>
> I am tempted to say that any hash bucket with more than 1000 sockets
> in it is a problem, not only for inet_diag.
>
> Since there is no soft lockup, this really looks like an attempt by AI
> to break legitimate Linux uses.
> (Or slow down as your prior versions did)

Thanks for the feedback.

We will drop this series.

Best regards,
Zihan

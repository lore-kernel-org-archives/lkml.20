Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05453C2B95
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789283652; cv=pass; b=NurvjgTJ9+2LgHo1T+Yq+CigAr9c+YYlUSutJJfzJGGL8WIAMpal32xqB5bvjITxzl6eoV8oiId2/t/O6QIUHDPNkaPGJvz6UiF/z/gu8mTWWIjgEUI26r5xm9QKDmYgZ7vGbefXvxOUpcgca32ONVol2zEJ7KWQ4auY69Xh52s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789283652; c=relaxed/simple;
	bh=37ug2nMqVijwXjDMz+dkuUWa2OB5OvqNxj209iQ0QhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMuX5qvtZtC8T22yWXzGoEy7fbSXSFTJD0HF0zTlwGfx4b6nV9mfMpSvze13GeX+kLaRLMER6YwNE/Ib62BCxN5FufRVZe8J4jFKxNNNTqZ12OTXYu0gnQ+j+yrGkWKD4lIKrqnF1ARwCXE4eNt/Je3NXjsYgRFEvbtRhE09G18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=W5N88WAd; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="W5N88WAd"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b6840edcso6304801fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 00:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789283648; cv=none;
        d=google.com; s=arc-20260327;
        b=rGEVlALikkHlPs/e8+gdZcFYYNkptrs9bamSQ48W05erKE3/J0I/r2hS3LiI2UuS2B
         PPQWfu+hhFdz4m2tBnHkrBcrK6EWySHgAYaToosQUb50SZUrNGdFlYOesP2Z/17wjdEc
         r0NkcPo5IYKZVy5mQxqPXHOVcPolxavk+rObyTlM2nG2xE7azag7fc1PhWVDaiVq6DUC
         og+Cp8bLl2OlPEorlD1A9/zptYnB7EFY8nflwkNPgYvXtSjF65hYsKkLpcI0LGsiZEkS
         B834U+d8cpbPBdtpCy7xCbFebKSnvj6tFEK+oMJS3evkLBInmnO8YdNwsRhZbXO+xmC9
         XhOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zc6rn6hBg7Dbx72kKEyqG0IA3oFbZYoVZQLtRzcZKOg=;
        fh=DUqmsMDKUbsnAB7RyjDqC13hYmJaNFerWLXovnyIaqA=;
        b=SezuO1OVOkUhIMi50gXFkYoWEtrneJ+upza50M4B8xR8Jo+c6sgCh5ybiVseyC3ocM
         3eT04DqucxKA5N8kMxknamZX/I8CZn6cgzBOBU9d9HbDMmX2wRsQkqIs0pZctMDnTpJn
         uGdmO3aRlcNbgah8btOX1jtOyoPrSj4cUmN86v7MXAyAveu+QFgnfWYecm8yCqmWShLD
         gUd4zC7eTaLAn9CsD1R/bhV6R3fQdwJC6NYUXSehs6ryIKRW/uAKDAGyCrxBdV0RLsD+
         Nw9Ws5kDTLeTXVlbmjKY7iobhVzkMnYN2YYJVu1hAN+dcS5ialoThy7xDKnFzvcAiMTC
         efwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789283648; x=1789888448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zc6rn6hBg7Dbx72kKEyqG0IA3oFbZYoVZQLtRzcZKOg=;
        b=W5N88WAdSLB/LLV5+MllrleynP8UTzD5IVug07B9VXEVXlZhejamBLAWaEIo1kQNjH
         GnjePwnoI1Fn9Nf8qU4tshKUSHyR80ixzy81aRmSZrk3c0ThU6WQONsY+K4LN8cRlPxe
         zJtwP8l+fnEq9qVl1Z5alg5KY9kgwQiqlKzm5sQJx9VfFGrkEYPpTIkjR5g8AYBt0FJ/
         HSvfwhqyf4Ru001u4tJsqCfhhGjeNngzVgWjBN4aFEgVwRCghl7LUy9YjC7EcIT+E1qs
         THHZNTIzrR+6BXm459mfo1WZLKIlylVtkrHj1P4gRPLTyF2fjCTflotmyGyHnMZpPZrT
         +Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789283648; x=1789888448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zc6rn6hBg7Dbx72kKEyqG0IA3oFbZYoVZQLtRzcZKOg=;
        b=EpKTvtmmjScCvPzx+/pzMRu7Wq2MMCBhU73FUGqWuk9yEUp86+MwFo0Wv371xMHMZw
         8MiQ3AFDxugalWvsn6a1jHdXLL+g7V70AZZSBMxLUeWPLjppxHA3uXUrUeTsKpqie0KN
         exrqKD9HmHxYQCNwR3NlL16tJHYHNLksHps6jdYWUJGjUvArOqHylezW60lG0VR64pQP
         nh9nBq+LIv+/4Ydi3Fu0/WxzkjdDg41c4reYfae8Y9YMav3d1GvwlqnEFOY6228lIrPU
         i4KVh3ZT6v4IAf5GTJyd4VoVDrFd8zcqqhqLRIJ5tmSXjkP7x39lAe9m+LF92bUfd2b3
         UH2g==
X-Forwarded-Encrypted: i=1; AKwUvBwu+OwMXYzvsjWGSqYJB0GzNkEGmnVHtgShccFRh6XgQHa4CNWQOuBw36tmGSTY5+tmb1o8ezpyvC0Uef8=@vger.kernel.org
X-Gm-Message-State: AFuF++lNjGyQMBglMAJRzUVLnjeh8X8vDXUcZBDWhZGPEuqPV80rTnOc
	ruZl2JD7LEFir/aa172rKdskaZvKKa7yiFrp5d2YysmPc2nvU4lToYR5zSyBxg8YD8oaOftE8qO
	ICkFV25hCi6irihu70lLl0eBj3g/Z0X1oEClAwuKiTTE=
X-Gm-Gg: AYBFou0mjMPyiHUB6jR6JenQD6LKd5wHZHpSLUu2tMLQlmMsoce4bqPCCLbRFu18HMR
	LyBV0GPyd8nhVJvzh47XPyJTtgfUlcyw5xl8Sd1yd8Mp6K6RiSbNbSp/ufS6//88npGNSK1BS3x
	fwVLsT3IWXUpMOoyjytxlzQ/8awrQFvS2kNfdDdWCj3qPE3XeiGOIGlVLEMf40LuRgbBTH+U3+A
	P41EYCk+DldwR75PCoQPJ60ds/euMdcK/n370XsbzOE6TPU76OPP0kMj4mjvVz97zo4/DOtErh4
	MBzY0x6+O/1wg+N9kkOJpri9E4RMOzHW5PQP1wi6kM0LqbBCxd8OikSgPNN8KJ3buLAj82UkdlK
	MkeBmWsier2Q=
X-Received: by 2002:a05:651c:4cb:b0:3a1:4f33:f60e with SMTP id
 38308e7fff4ca-3a5a521976amr22625301fa.8.1789283647218; Sun, 13 Sep 2026
 00:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789110326.git.zihanx@nebusec.ai> <d99cb205-24fc-7446-55ad-4ec9d79aac1d@ssi.bg>
In-Reply-To: <d99cb205-24fc-7446-55ad-4ec9d79aac1d@ssi.bg>
From: zihan xi <zihanx@nebusec.ai>
Date: Sun, 13 Sep 2026 15:13:54 +0800
X-Gm-Features: AcwNN1VXwXGHgzutYNNcW-pu10V6yDK71GNfucz-I1ocWnp42Hrzm0uFodmzH7U
Message-ID: <CAANe3eQFtNuPpw1_W11hDf_S22WK99LD_FDSijt1Gu85_hELvw@mail.gmail.com>
Subject: Re: [PATCH nf 0/1] ipvs: avoid stack overflow from recursive
 connection expiration
To: Julian Anastasov <ja@ssi.bg>
Cc: horms@verge.net.au, pablo@netfilter.org, fw@strlen.de, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, phil@nwl.cc, 
	netdev@vger.kernel.org, lvs-devel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 1:50=E2=80=AFAM Julian Anastasov <ja@ssi.bg> wrote:
>
>
>         Hello,
>
> On Sat, 12 Sep 2026, Zihan Xi wrote:
>
> > Hi Linux kernel maintainers,
> >
> > We found and validated an issue triggered through
> > net/netfilter/ipvs/ip_vs_ftp.c. An unprivileged user can trigger it by
> > creating a user namespace and a network namespace. We tested the fix wi=
th
> > the same trigger. The change applies to the generic
> > ip_vs_conn_expire() control-chain cleanup path. For the reported trigge=
r,
> > it only defers recursive controller expiration; testing showed no chang=
e to
> > other IPVS behavior.
> >
> > We will provide detailed information about the bug
> > in this email, along with a PoC to trigger it.
> >
> > ---- details below ----
> >
> > Bug details:
> >
> > The trigger entry point is ip_vs_ftp_out() in
> > net/netfilter/ipvs/ip_vs_ftp.c. It parses an EPSV reply and creates a
> > wildcard data connection using the advertised port. If that port is 21,
> > ip_vs_conn_new() binds the new connection to the FTP helper a second ti=
me,
> > because 21 is the helper's control port. The connection has
> > IP_VS_CONN_F_NO_CPORT, so the next connection from the same client to t=
he
> > VIP on port 21 matches the wildcard entry instead of creating a new
> > top-level entry. Repeating EPSV builds a chain of controlled connection=
s.
>
>         Hm, may be we should also avoid such long chains.
> Probably in separate patch, for example:
>
> diff --git a/net/netfilter/ipvs/ip_vs_ftp.c b/net/netfilter/ipvs/ip_vs_ft=
p.c
> index 9e3e005a8263..0622169b5970 100644
> --- a/net/netfilter/ipvs/ip_vs_ftp.c
> +++ b/net/netfilter/ipvs/ip_vs_ftp.c
> @@ -237,6 +237,17 @@ static int ip_vs_ftp_get_addrport(char *data, char *=
data_limit,
>         return 1;
>  }
>
> +static bool is_control_port(u16 port)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ports_count; i++) {
> +               if (ports[i] =3D=3D port)
> +                       return true;
> +       }
> +       return false;
> +}
> +
>  /* Look at outgoing ftp packets to catch the response to a PASV/EPSV com=
mand
>   * from the server (inside-to-outside).
>   * When we see one, we build a connection entry with the client address,
> @@ -293,6 +304,9 @@ static int ip_vs_ftp_out(struct ip_vs_app *app, struc=
t ip_vs_conn *cp,
>
>                 IP_VS_DBG(7, "PASV response (%pI4:%u) -> %pI4:%u detected=
\n",
>                           &from.ip, ntohs(port), &cp->caddr.ip, 0);
> +               /* Do not redirect data to control ports */
> +               if (!port || is_control_port(ntohs(port)))
> +                       return 0;
>         } else if (cp->app_data =3D=3D (void *) IP_VS_FTP_EPSV) {
>                 data =3D ip_vs_ftp_data_ptr(skb, ipvsh);
>                 data_limit =3D skb_tail_pointer(skb);
> @@ -529,6 +543,9 @@ static int ip_vs_ftp_in(struct ip_vs_app *app, struct=
 ip_vs_conn *cp,
>                 return 1;
>         }
>
> +       if (!port)
> +               return 0;
> +
>         /* Passive mode off */
>         cp->app_data =3D (void *) IP_VS_FTP_ACTIVE;
>
>         The only problem I see with your proposed change is
> that we may need 2-3 timer ticks to expire a DATA->CTL->TPL
> chain. Or it expires on the same tick?
>
>         Alternative would be to jump to the beginnig of the
> function after successful timer_delete() for our cp->control,
> i.e. to use loop instead of recursion. I.e. ip_vs_conn_del_put()
> can be converted to function that returns bool instead of
> calling ip_vs_conn_expire(), so that we can know if to loop.
>
>         If ip_vs_conn_flush() demands faster expiring, a
> loop will work faster. What do you think?
>
> Regards
>
> --
> Julian Anastasov <ja@ssi.bg>
>

Hello Julian,

Thanks for reviewing this and for suggesting the FTP helper change.

I agree that a loop is preferable, especially if ip_vs_conn_flush() needs t=
o
expire the controller chain promptly. The follow-up is split into two
separate patches.

The first patch changes ip_vs_conn_del_put() to report whether it successfu=
lly
deleted the controller's timer. ip_vs_conn_expire() then follows the
controller through a repeat path instead of recursively invoking itself. Th=
is
keeps cleanup synchronous, avoids recursive stack growth, and does not wait
for additional timer ticks.

The second patch is a separate FTP helper fix that prevents the helper from
creating unnecessarily long controller chains. ip_vs_ftp_out() rejects a
zero port and configured control ports in the passive-data path, covering
both PASV and EPSV. ip_vs_ftp_in() also rejects a zero client port in activ=
e
mode.

Best regards,

Zihan Xi

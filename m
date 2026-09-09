Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC42931FE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788930540; cv=pass; b=c6m4yhlU7LGBVuaVgSuulad7w0LmHecnaiqXndDyeyWrMYgchPcN6vy4wzLfO5ASHNTLPzRYF8Sr+Khtnm1Mif2CP/moAJE+o5hTLSVPg6qDoPNuoc8XxiFQizKxoFv9xJIEHnaKTm5ludv9p2dmefcflvBixYOyDJdydLGjFwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788930540; c=relaxed/simple;
	bh=HezRIAx0sXtEI+YT3JY2PBlp5lPNNul4wM0VNcCw+wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcZIUL9OyWOy0djv3TndhMPrXD5hZ+fXVpozlOUm5G0F45oC4+DtfBBQVqsaG5zu8iB3vx9kJ8GEZO2uUF6mHm3UcCxEXgj0tMMHzKzPSi4kdKDSFtQbMjPVxXq2QZxLwtCbqNr1waUnxtY69kzIvheYx7ZnOtaOkeucDOevV80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1BsHc+S; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1BsHc+S"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso6551280a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 22:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788930539; cv=none;
        d=google.com; s=arc-20260327;
        b=KE04GS0u6/gIDmI4GYGrNpC7W8PK8T5h9wUm7sY+lWPff9DnDbFVop+Oe06h933QqP
         J44dsxA1X8sjzqD/DdnE1Y4/skKJQiExe/dLOAD5RDmBxsVOYWSvZh/KwuddfeaccJzn
         SqZoZApy+tu3XgrkuXjCELLmpXJTFs1AtbBH/LO0GBSUymk46QDOS0UTju7CgCmMD65c
         Xb9He+R6wIeUvpOzA/7megaVGPeAw7GepxDdknDYeHod22jKXWWPlO4b3EBokeWSTe1p
         V6cRkbqrjvS0iSsATxEgDqnelckGRBnaEtWacJEGtfqyqzPH9nfHfDJ+X/9aMx/zUqzG
         MyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/lw5mO4gsU3bTOqtJwjVuYg0yHunzGXi2m1syQJ2Qk=;
        fh=dOsWYuqk2Hn2KU+xdNCthx9m7g6sT4XJKR7mJFCdBds=;
        b=aV8F13GT7zq0oZovtws2wcuj2ZCrQeCxScEtL8/WLgmwYWRSwy5YclQo1MBMlEE+92
         QNZbsJUNvvpRDmIualLqN9V1pLI7++KYf4pNEM3/sc0tQGHQ64+wVZBe+gxHEkCI2sqd
         /XV4GGr1LDmPLpMqBGLoyYBdpwfU3JvW8b9RJcAfihHzuTMJQw7ndGAIMuVUvqd5W/kK
         k39zZXW7Cgn00rLWOgcEJlYt8Op+/EKrbh9JZCrB9pOv0H2tRPT9Ax48MrZKYQ0U50ET
         2xa/eJZIlq6pshV3KKOQYUSogPl/Hanxd0DPgQpJnaNxo+pbEoGQN4RQ+276fbvFtUPs
         OnNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788930539; x=1789535339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/lw5mO4gsU3bTOqtJwjVuYg0yHunzGXi2m1syQJ2Qk=;
        b=T1BsHc+SQdk94m28uUKbjgUzkkPvEmLELkLDd95mqwOr0lN4iXQAdZXDSzV4SISC8u
         aHCatXEMmQsWPR8TqdhSL/ud9uo7IXK4OZd8+lOK869Rz1uMA0p+lq3d9ZPpqHXmKVtc
         dqMFRJ/kXeG33O4hI8/W+eBHycPLdUdmTHpcqYij7DE7eDUc5WeNLl0jLDk2dW6tg7nH
         ahCbNgFnD1tfkpksGg0GgpVZQMyZfo8iET239Xq/SaBldHmhYB0r4wTbjJ2IKb6qK/xR
         3j9TgCdkEnJKICt+AuOp9MIhluAEcRQ6gxl5ZDfURuH9cwalSAEqq+ZiDNle1lQxAcVq
         PZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788930539; x=1789535339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/lw5mO4gsU3bTOqtJwjVuYg0yHunzGXi2m1syQJ2Qk=;
        b=m8FBiBtp95CTZ1zYvfqoe7/BzPsl1Elt7ORXPrfjaJ6OCWHVLMzQwwXWN/A/Zf707p
         reg+E54upUX5O0yHa205LXrk5EGJPE8tRuBYq9J+fWTPXC2tLcGjrruEcZurV1QujSYV
         AtpArId6ONx4TLCfa44FtAgatQG2adgnR9FN2/y0HKprd7vfCzdTqczvledZgWdX5OWN
         Z17mQNkCdUXdTjDMQJzEfSI3WUwyAE5JmZSi9cGp+4KMI0uqnteutTCwEwjuyVFMqPHl
         J17t67BhBDhXxzrulo5nbKFjBbpFSyrFAEPK0xbeheW0wP+QOVdCpxgJXH8T6wLyWhFh
         w/1g==
X-Forwarded-Encrypted: i=1; AKwUvByylTweMiRccWr1PpFn3LxTiIlQ0MX88xC3uKvkUFFF6WSr1cODgGb2MGlEcNzbEW1n9p/nEVFrlpMIB8I=@vger.kernel.org
X-Gm-Message-State: AFuF++lYzw7tQ5R0NeqjWnl59p2IqnAp1cleldNaEssIY74/RzGCy90k
	ftN8NlT3iHnJUOL7gVYqqrPVIa1gl52osuOy4W7I3Rs+wIMHx1Q/cugBKCgUghHt5VNanokomp2
	dloGVAG5+OOm+zqEFS8TYqWuBgIFkuDE=
X-Gm-Gg: AYBFou0o48wjd16XhTq+2sAAP86rHxqqqUcBHzw3b+DF3dWgBiwQKjuyNy6GM7Y/S4U
	twDxI/QVmb8fM4qEND26Q/QuiQv0d5lEXIkDo+Bk+2VAn/gVw44PT/k1z5aMcIbrzhDnmPkzZ3z
	+XLcbktBbcxhUTVCZ6vzUoEajHO31NCjKGiP/kpg2fxEg6i06qDGmTWPiBKiFo7yC2sXkna8jEW
	bRRbrQAFG7lO4QJ/oI6JggxLLgBzhoVR638KO9Bke+5MXxSjZxnF3GlNc/ZikEO8Q1/hIM6OeU2
	xX7jk/yduYZdqJzvsl5m7H9xsNnQm1FrD3MOWovaDcwcqLSZ7V5UCMEalbbuIjFoQ9339tEFJZ8
	99F4FhgB7p0V9tCY+gpR8DMFvtqwtJd4WLzDnRAtdkUdQkZQZBgJ17ZfeoPG0tiYWDJeRIHMmqV
	iCd0JQbJyhrpB5NsNOv2QS
X-Received: by 2002:a17:90b:3fd0:b0:398:d6e6:4671 with SMTP id
 98e67ed59e1d1-39b262981a2mr47513999a91.25.1788930538817; Tue, 08 Sep 2026
 22:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906030429.2085375-1-xmei5@asu.edu> <CAJwJo6asOVa21T==+n7qdso1DBvH6Y3rXo24DdieAQS6XeTutw@mail.gmail.com>
 <CAAVpQUDuHr4WxEOUwikYqdG9FncoY09LOMGDPciHex2bQ51ePQ@mail.gmail.com>
In-Reply-To: <CAAVpQUDuHr4WxEOUwikYqdG9FncoY09LOMGDPciHex2bQ51ePQ@mail.gmail.com>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 9 Sep 2026 06:08:47 +0100
X-Gm-Features: AcwNN1XYHOLlrXffZ4dyL2xhSU8WgL5jBkszIuyqQKj86r-XafJfRNUfbGQgShs
Message-ID: <CAJwJo6b72cdQixQ9Xodx5mhWLVvHgnaULvZ0JFjFhSwDuGvaBw@mail.gmail.com>
Subject: Re: [PATCH net v2] net/tcp-ao: don't dereference NULL current_key/rnext_key
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Xiang Mei <xmei5@asu.edu>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Salam Noureddine <noureddine@arista.com>, David Ahern <dsahern@kernel.org>, co+2c72469dbbec34af@bugs.sh, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Sept 2026 at 05:44, Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> On Tue, Sep 8, 2026 at 9:31=E2=80=AFPM Dmitry Safonov <0x7f454c46@gmail.c=
om> wrote:
> >
> > Hi Xiang,
> >
> > Thanks for your report and the proposed fix.
> > I remember I wanted to write tests for re-connect() on the same
> > socket, but never found time for this, as it's not really used in BGP,
> > as far as I'm aware.
> >
[..]
> > > --- a/net/ipv4/tcp_ao.c
> > > +++ b/net/ipv4/tcp_ao.c
> > > @@ -857,6 +857,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, s=
truct sk_buff *skb,
> > >                         return -ENOENT;
> > >                 *traffic_key =3D snd_other_key(*key);
> > >                 rnext_key =3D READ_ONCE(ao_info->rnext_key);
> > > +               if (!rnext_key)
> > > +                       return -ENOENT;
> >
> > I think this is quite a big hammer to fix the re-connect() issue.
> > In theory, we could even restrict connect()/listen() after TCP_CLOSE,
>
> As there were too many rehash issues, we disallowed it.
>
> 8cc3aef0cb19 tcp: Do not allow buggy transitions between ehash and lhash2=
.

Thanks, that makes sense! Two tricky-to-handle corner cases that no
one uses less to have in mind :-)

> > but I think I have an idea how to address it "properly".
> >
> > I have a draft of a patch; I'll test it today and send it for review.
> >
> > >                 *keyid =3D rnext_key->rcvid;
> > >                 *sne =3D tcp_ao_compute_sne(READ_ONCE(ao_info->snd_sn=
e),
> > >                                           snd_basis, seq);

Thanks,
             Dmitry

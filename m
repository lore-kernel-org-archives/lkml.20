Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AF9356766
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765870; cv=pass; b=A65LLOIQf3aYRpgqRIGqtqXHskq1aqCL1h5mJkEv51IDLool7ceDtOMmDPYkuukvgoWVAY/O81BEE4dMEesmAohGmq0UQjtGbHPXS+2/xdaXXEBvn1Zs30fUJGfnkc50jDkSJFTOtvGHJ1deMfgFWQrwAi4lZALhktzsWJG+O7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765870; c=relaxed/simple;
	bh=2yE2vKhYco15cq1LAqgS54dJAg4li6tJCb9pHzWm1p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAck0xyuH9UaMz1zeZ82ZchHSTmJ0YP5m00M4+40n8RBh1gH3+E1iZYMCAG0+p+TADhT2dAkdrysDIEq5ZYiFdyRAYtpdGYmxwRKXWbc1hr6oIYftNTCtrmhYx8K6fij5Sbti4ZOu+Kqe5gRQHJVODQ4txo8bQRtZs0zVQHOre8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S8ZiJ5Iz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoxd58ru; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8ZiJ5Iz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoxd58ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788765868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yE2vKhYco15cq1LAqgS54dJAg4li6tJCb9pHzWm1p8=;
	b=S8ZiJ5IzRswZcAlOTqhqSg8tZTG1pVm4aNsPGvgcg92Fj6H/mjYX75htO4w9cZWz6/rueM
	J+Pt5DaG4gXkI47eWEugo5Rny+0+IVyyKcLuOpXOU3YQHfb2UeZ6e4JfqFiSwOoZrllVub
	+dG8ov1Jgf97752WqpWRCpPEn3PWpuQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-Vtb2c1GmMaaHQuWdoKYWlw-1; Mon, 07 Sep 2026 03:24:27 -0400
X-MC-Unique: Vtb2c1GmMaaHQuWdoKYWlw-1
X-Mimecast-MFC-AGG-ID: Vtb2c1GmMaaHQuWdoKYWlw_1788765866
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b5e2f31407so1421468e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788765865; cv=none;
        d=google.com; s=arc-20260327;
        b=ai6EDpTuuhDQLfXZ3UxXwwbEbYQWnUqviwFk1TljAC/UEbP/E6JDzR1//n104zUAuu
         KIPT9RFkXovE3seQK07IJhaV8s57LkbZRwlB4f8cmIZWrEdb2hFnrU7G1s2wXgsucRFi
         oiFy7X6NrTTPgq3ZBy/XqcMIlNnTdxUinXW9sZ3HWAIHvHZuAeyr9TL3orzZi9UGTTQ9
         P6pxbYdgQwJeTrRfOyrA4QoEbVsNfJu2Db+AKi59PgBNvPL4dcyOgyh7U7sKIusmnJct
         4gMJiNf6T3or89vyIgnBzKWvit7Tqn5hKdJx9pFoh356+rIyY7wwXlZxqD6BHw8oS2DF
         oMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2yE2vKhYco15cq1LAqgS54dJAg4li6tJCb9pHzWm1p8=;
        fh=9Wjt41rwotl+zKI3XhRc6SumUZY+SLnuM5WPraTlG+g=;
        b=QC+BG/L5DE4MWSmk1JHdwQdt8z2LIIRCNcBxcGt2W2oSE4gFe1R+Wm+yUE+VPpGZg/
         2bgEW9WX5Bh4BActX5EYFaZPXAqG5/sYljsh/LTzB9jbJ9xBt90YXqDF9JY31Hf92IN7
         /TM5uiqyw6dCdD1WeDWcqM4X904HYPT5aiM+JtveGAe/UDhJpGNTCWUCr2fjii+x/XPv
         VhYR6HH3Mk8dgmCl/ioX6LejrkwMIVRB9XcAp3zUoPQIRTXFKA2rjbjSb3mj5bI/UMXx
         7Hy9MpfHJNEa6bDRHCJ0tw88omgvYv4mO66XFto/jzKKUTD4Ow7CsQf3iPVNKykgtzGR
         mcjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788765865; x=1789370665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2yE2vKhYco15cq1LAqgS54dJAg4li6tJCb9pHzWm1p8=;
        b=hoxd58rugcbos3fUy937odZlRxzHj1/bIMqMzSFELEg5KuZcel+xJEnnaDNOoOmPFd
         mDaCOhHmen42HudHsm5oNlBUTS2ZfsZNDC1l0w9SsDvV33biS37YAMuV9uFNOT5VnV7I
         8FANAlpNPHsamJX0tS6bTlM04rYJQcBAZS3Y383RZQezNPQWlxNPjcNZpjA+dRCyW4kg
         a2WVKhj38n/nii6Uk8KZmZrjvVmHlJL9cD86m5ycB14WHO89u4BF7netwX6AoAOatbL1
         lMh8FEiu1HwJEhmAOhmwX7xv4WouSrBiT1O5W9+MaMz+c8JnWkW5f5nb8XJ9Zm9cSqcO
         8kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765865; x=1789370665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yE2vKhYco15cq1LAqgS54dJAg4li6tJCb9pHzWm1p8=;
        b=oFNOKgiaYTd1yywdj3+MsrJQ3wpfgSLkEqqn1iFO7AnlRKbDmsPDRTV0irFLmhb69P
         kz6cqWTND6UHW8axSjnt0qppLDJ0cvmdrAj0jnPF4moitMSBdU1U/FTiXUItS/b5hZRu
         5ZSzaXrJ5QtUv54ckrvIWZZHXDa4UYxlpGcbJdn4XNBqGksJU2LR0oqeVrpuUKPDgdvE
         HZqLQSxvsFuZPDzxbbE4HkW9oV9v1K+5LjXmxFjT8V0bPIiHJ6yBM7iafBz7Ja3xIEwi
         8gjSWS47xAZi6I6dBOBF+ROW8rPgxscJ8WP4TNn4Qp5tt9Ib9uIMmzFpxr+C4mQkCO26
         8ELw==
X-Forwarded-Encrypted: i=1; AKwUvByHuUZxB2VOYYEtWhaW+NE96Xsb4Kvi/LeFIb/62R6gHP+UPfUHaBN0+UJsMmhalihmIwhuj+uh8T1Cer0=@vger.kernel.org
X-Gm-Message-State: AFuF++l3LgkvVcQqWRMEu2vQcHA0SAlAy770TKA8BK0j2J/i2noVlZkp
	YdJbNFiv3Hwghgz+hhyc2l7R+WJdY1pF+16gDtvDn+EdHOhuy9Zq23bUPBcpV+owy6IAjnh+jkI
	MEO625RWF9dSD67AAwt79x4vUmvZStJQPfX/a898mliZohsjE0JmtCs0lleyQkSsgWeUXXx8FHk
	COSyp8a3qVx+BaW+f3vaiNst1IRoBt4qEJpgxZDXJW
X-Gm-Gg: AYBFou0dHpr7YqscNKwwiXBOFtPy/X0WZfbxBGcy58ML7OajRxcoGpcZ8yglsEyH/el
	/TUrOiku+dD7ROGonzHkgVWcXfML1mXz6Xan8HzPEH1qIFcnuZ9pzq2/YqaQQqGPcZJNVn2FfoF
	3AxXjUi1xQFB1DR/+urax/mZPvttOcs7SE27S5Shi8ZknS4jksYdHev/t6
X-Received: by 2002:a05:6512:3f0e:b0:5b5:e86f:3550 with SMTP id 2adb3069b0e04-5b616eed114mr3346342e87.9.1788765865576;
        Mon, 07 Sep 2026 00:24:25 -0700 (PDT)
X-Received: by 2002:a05:6512:3f0e:b0:5b5:e86f:3550 with SMTP id
 2adb3069b0e04-5b616eed114mr3346309e87.9.1788765865162; Mon, 07 Sep 2026
 00:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903121057.80006-1-ihuguet@riseup.net> <20260903145631.GA182962@shredder>
In-Reply-To: <20260903145631.GA182962@shredder>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Mon, 7 Sep 2026 09:24:13 +0200
X-Gm-Features: AcwNN1VwMZKu46IzJzKROmEYRy2rjJetX0BeFnxsi74O5FJcBryBFl6vpHj-5Dg
Message-ID: <CACT4oufRecaPSMTJPK3yJurmaEaMN5i_CArV-mHd=rAA4zOJEw@mail.gmail.com>
Subject: Re: [PATCH net v2] net/ipv6: don't route packets with unknown source address
To: Ido Schimmel <idosch@nvidia.com>
Cc: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@riseup.net>, 
	David Ahern <dsahern@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, dcaratti@redhat.com, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Phil Sutter <phil@nwl.cc>, 
	Daniel Borkmann <daniel@iogearbox.net>, Junseo Lim <zirajs7@gmail.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Xuanqiang Luo <luoxuanqiang@kylinos.cn>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Leon Hwang <leon.hwang@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, Kees Cook <kees@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Qi Tang <tpluszz77@gmail.com>, Joe Damato <joe@dama.to>, 
	Breno Leitao <leitao@debian.org>, Li RongQing <lirongqing@baidu.com>, 
	"open list:VRF" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NETFILTER" <netfilter-devel@vger.kernel.org>, 
	"open list:NETFILTER" <coreteam@netfilter.org>, 
	"open list:BPF [MISC]:Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:57=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wro=
te:
> 1. This is a behavior change, not a bug fix, and should be targeted at
> net-next without a Fixes tag.

I see it as a bug. If you remove an address or its valid_lft expires,
the expectation is that it's not used any more. Anyway, even if we
consider it a bug, it's certainly not urgent, so it's OK for me to
send it to net-next instead.

> 2. What is the motivation for this drastic change beyond RFC conformance
> and parity with IPv4? IMO, these two are not a good enough reason to
> make such a change with a huge blast radius.

IMHO conforming to RFCs is always a strong reason. But beyond that, I
think that the current behavior is wrong because, as I've said above,
keeping using an address that has been removed or expired is not OK.

It's true that it's difficult to spot all the corner cases that may be
affected by the changes, so the tradeoff of fixing vs risk of
regressions is not that clear, I understand it.

> 3. See [1] for a list of regressions that AI flagged. Even if v3 fixes
> all of them (which means a much bigger diff), I don't think such a
> change will be merged without a proper real-world motivation beyond RFC
> conformance and IPv4 parity.

I will try to address all of them; thanks.

About the real-world motivation: this comes from a customer's bug
report, who is worried about packet leaks in their production
environment. I mentioned IPv4 parity and RFC compliance because I
thought that without those arguments it would be very difficult for
the patch to be accepted.


On Fri, Sep 4, 2026 at 12:38=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> breaks a bunch of selftests, too, FWIW
> Please make sure to mend those if you want to forge ahead as a non-fix

Sure!


On Fri, Sep 4, 2026 at 12:22=E2=80=AFPM Matthieu Baerts <matttbe@kernel.org=
> wrote:
> Just in case, do not hesitate to look at the new countainers that might
> help you running those tests locally:

I didn't know about this, thank you!

--=20
=C3=8D=C3=B1igo Huguet


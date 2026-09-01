Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838073B95FF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273334; cv=none; b=JBl87Y/+63xWgQb3ElUV6wvOTJGO9dkSDyFMTv702fAiBT+nb+yAjrOmq0cWMGQts3M025vvj73iHAH4k9pUhcoXmMss6JQuLHt/pbKjKB0ROV7J8sDOewEQ3yRH1gUumtxBTE66JRuOol1i9fg91z1+7Bx40a2LaWIxI/xV1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273334; c=relaxed/simple;
	bh=337HFZz+bQ1i1VtRCTa9268AZ4iIQczmq7C/N3wjRoY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2lz7qXayhM57IfSXrZwKyBbGMpsIn1r6kh9XxVm/AZLIYMUOdPWs3hyvu/XYYJnDpM4J06NZpXPT6eJ+aK26wmurUYUZtWz+Ir6FbhXcIeukUZf7h3Y8W+EwxT7jl+oxy/78ySBPykRX5PdeRlX8Zl5Blac3fO9D+TrTR4Ss/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWvQhX+d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWvQhX+d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so10846365e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273329; x=1788878129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybO/GPr2/hJm9IOXOpb1c3apJ1A9Dmdvx+NqcPUdbWE=;
        b=kWvQhX+dm20cmZd71GlJ/SNjjr3GJDQkseI+JaUXyAf7sVmjLhE3I1W52hu97/ySnG
         iCjRgN9vpxrUu08I+UZTPtOynKtoehoV/CL1TH8hk5ksOXA6LwYmgf/4sB7O2IPPSNej
         UwVnolzIqKyYotsMdigsxjnu2ooMO/wV9riEmKDuGKMF42xSoQqEPNqn10Xg8K6lAUyU
         8yjVnBZ7ywHY9l8kwv023ziAOMJ2ffcJ9wbVRdsP0K+uKasl1MBvyk79mwGUvz57ZljP
         TQ1hioEe1lwnR6YbIz+zpjR057pJmYUbSC58RAGjixZ1Wyl9iZMlwf3y9qwE3R+R8iU6
         gFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273329; x=1788878129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybO/GPr2/hJm9IOXOpb1c3apJ1A9Dmdvx+NqcPUdbWE=;
        b=sPGYw6aZlBUACJ2pFTqnfQRf8MGXQR6eaGzoEAeNyws3lK7gAJwnrukQz6LY3B9zUz
         PMUUMx2UYsKKQTOjNRpCEUpMUNgBLzRg1NqWbp0HkubhAtFJ7WR8Ki8G253yOH8XxVXm
         QsWD4mW/5Xb5raQJ5Q10duv4wC15DUMuqgOuuCDMF4upQQZtVNDzMreNGpPHLKpNBTTQ
         YLLQ0pBStRMsgLsjOp/FbefjX8Z3SBygPsxHQ1iB7mclNbyKLfY2AWrog1J6bKnJRHAP
         PZQsvPYSVgLIdDq/p1vj7f2GDMZvlU7sXNt4RlPCaJzqIQISVWBzg62B8cgSuviI8Bv+
         0eJw==
X-Forwarded-Encrypted: i=1; AHgh+RqVyHflJbopm4ZpPtsihsrCuEyitYeLEVivImbA3i7OR7qkO+Pc3aQOwOF2dnM9xn+ifdyn6fzPbFhVvO0=@vger.kernel.org
X-Gm-Message-State: AFuF++nCT+FWOd/b6Z8mjT/vKGX8En0ZTAIZp7XnFvuS5lS1hiTcZO6P
	81ekLHrByhgl1K1yzXUGNh6Snz3QR4yixtKkZu648NH16O5oU8LBDa6o
X-Gm-Gg: AR+sD127TIPoslCT3kbIyVnYjMch3ZrB/PmowDBtBYWdwzvcyadtg9HtmVg4w9nj/VE
	wUO9COGkl2swYp+SiKX9/D6eWnpz6wpsB5UPy6ZZguT8pgokmSTLQwtfkT6TZZChO7CX91Rwgnu
	YzLTM+HtSrBcKKySDGVSsAaZjIhUoFunm4Y6aDUIGhg6ozMNPm0edcX7Lm8e3jTbzB8tdjgAvfg
	7minGnup6yLZt3AyK6xQNmqOdF1k8vEdhxPa6YYGSiTHcfPCWJmSSVHrtY5jNWTop6t4Cg6nceH
	OvHoeK3vYRhmV6jlSr/M07l3oI3X08vTNar1vxxVr40HQ3/S/wBCqoObu6do3S97rGPte3iSz2X
	3EFvopFuBCnOR/uXqvVxqhqnL9muFIJxULX5nYOPOeE0GCw8r0WxwPBf0fjvd79Jo258XX+QKAf
	qzovlFvvcuHnH6RFBGsYy5wZow8h13a7hK2Jjr+R3ysfg1dMjiA72vapiYB702728Y5J+O8mymd
	Eeao8JkZNFXhPV73d+it4H53A==
X-Received: by 2002:a05:600c:1d1d:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49b91c2dfecmr525571945e9.8.1788273329280;
        Tue, 01 Sep 2026 07:35:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm360366475e9.4.2026.09.01.07.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:35:28 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:35:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Xin Long <lucien.xin@gmail.com>
Cc: xietangxin <xietangxin@h-partners.com>,
 syzbot+80dfcb1a2235b3efc877@syzkaller.appspotmail.com, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Simon Horman
 <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 marcelo.leitner@gmail.com, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sctp@vger.kernel.org,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, gaoxingwang
 <gaoxingwang1@huawei.com>, huyizhen2@huawei.com
Subject: Re: [syzbot] [sctp?] WARNING: refcount bug in sctp_transport_put
 (6)
Message-ID: <20260901153524.3e92df3a@pumpkin>
In-Reply-To: <CADvbK_eY4S1HbdNHuNq9b=Va-TA_6rNFvnCvtOUZ0sF-AWN67A@mail.gmail.com>
References: <6a7d8773.c5ad36c8.12f49d.002e.GAE@google.com>
	<68cb4941-3668-44f1-a889-6b2f023b2a08@h-partners.com>
	<CADvbK_eY4S1HbdNHuNq9b=Va-TA_6rNFvnCvtOUZ0sF-AWN67A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sep 2026 09:45:42 -0400
Xin Long <lucien.xin@gmail.com> wrote:

> On Mon, Aug 31, 2026 at 11:47=E2=80=AFPM xietangxin <xietangxin@h-partner=
s.com> wrote:
> >
> > Hi,
> >
> > I have analyzed this issue and successfully reproduced locally.
> > The race occurs between the timer callback (`sctp_generate_heartbeat_ev=
ent`) and
> > the transport cleanup path (`sctp_transport_free`):
> >
> > Task 1(Timer Softirq)               Task 2(sctp_transport_free)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D              =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > sctp_generate_heartbeat_event()
> >   refcnt =3D 2
> >
> >   bh_lock_sock(sk)
> >   sock_owned_by_user(sk)
> >   mod_timer(&hb_timer) -> returns 0
> >                                           sctp_transport_free()
> >                                             transport->dead =3D 1
> >                                             del_timer(&hb_timer) -> ret=
urns 1!
> >                                               sctp_transport_put() (2 -=
> 1)
> >                                             sctp_transport_put() (1 -> =
0)
> >                                               sctp_transport_destroy()
> >
> >   sctp_transport_hold() =20
> >     -> refcnt is 0, increment fails =20
>=20
> This should not be 0, as the transport must hold a refcnt to start the
> hb_timer.

Isn't there one hold sctp_generate_heartbeat_event() and a second for
whatever 'task 2' is doing.
When hb_timer is started it is given another hold (does it actually need on=
e??).
So when hb_timer is deleted it's hold is removed.
But the del_timer() is happening before the the extra hold is obtained.

The RHS (task 2) would need to hold bh_lock_sock().

Try giving sctp_generate_heartbeat_event() two holds.

David


>=20
> Also, the delay below is under bh_lock_sock(), so it should not be the
> real cause of the issue.
>=20
> Could you share the PoC for this issue?
>=20
> Thanks.
>=20
> >   out_unlock:
> >     sctp_transport_put() (0 -> -1) =20
> >     -> refcount underflow warning! =20
> >
> >
> >
> > Adding a small delay  after `mod_timer()` increases the reproduction ra=
te:
> >
> > --- a/net/sctp/sm_sideeffect.c
> > +++ b/net/sctp/sm_sideeffect.c
> > @@ -373,8 +373,10 @@ void sctp_generate_heartbeat_event(struct timer_li=
st *t)
> >                 pr_debug("%s: sock is busy\n", __func__);
> >
> >                 /* Try again later.  */
> > -               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20)))
> > +               if (!mod_timer(&transport->hb_timer, jiffies + (HZ/20))=
) {
> > +                       mdelay(1);
> >                         sctp_transport_hold(transport);
> > +               }
> >                 goto out_unlock;
> >         }
> >
> > Any feedback or guidance would be greatly appreciated.
> >
> > --
> > Best regards,
> > Tangxin Xie
> > =20
>=20


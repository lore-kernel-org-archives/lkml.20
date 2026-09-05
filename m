Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC834252B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788623363; cv=pass; b=XTWTbGCZRDkOIABwfIfw/ux4WqQu+RpR3wDcEMEcOzExiIy4R0Zac4DX7rw1+56YN3WdWt3Nt6xx1dbAef5APdH2pkGx4wPweuqYwtbq/KGwAm1nK9gEHm73uFKo8uoBnLN+VZHPMvLMftFvbvxHEqzcSH4O0NBKyXn6/7w4T4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788623363; c=relaxed/simple;
	bh=2LwFOMHYcHPNL5fcYnEFfP+h7yQAgL85lT+A0zfsnu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wkhua1rjgcorhQNE/mYixdEEjX7N/W7mjiL0jM1fFnMgih9tq/1iPE72BA+necndzaA5BPMrlRgmwgx2nDfdI+Qw1pIK1QPMJCO4yIt8jtcTDpD7lVFTEKVYYA8zDua3KG12b6huEVM2IQydW+BfN9IZDJ0mIFhzqMTJHwGRudI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=Cc2KkhV1; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="Cc2KkhV1"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a468f4c547so5703751fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788623360; cv=none;
        d=google.com; s=arc-20260327;
        b=UDUOGeTmuHqn2cusFwPCwV+ghDZ8ZNbvTF7dniHbkuPDDYPLIvUCAseI1Icl13w0Eu
         WJ9YNSy+lIdS9mgb+F6QP0D+aTZqrOqeMfUkTjsHxVTZYp3nPwkVG0cJNRFEuuNR0Zan
         KKQ1J34Js3jO0QLdMch9UrKZDbdCadKbpJpH6gVd26WQeqI247N3NkyYzX4TxsKtR4w0
         mYn/nLhiWTjUptTyGB3++dcnmmdDv+0SxTgbe5lHq6OlYOW7F9ud6OexqIXkSYPPDACG
         v8qjF2MrxFD53ox5aAiLSGxgwZnrTjrUUGohHGudrAZ+pxVkqPuNdfOXoQNNe/vQrwid
         MsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7P80H4tHjRKtSyI0SMuxw7P27fwaqKXH5g+cij3jlRc=;
        fh=IDQuAM8b3IoN4eT5FRIPkLrXFGHCvklB+USY/vR3ErY=;
        b=qV9ONPk9zl05cIpnSEAvNPwy7/nQD9hTT+HuCS2gyXoI+FzUjr1EzPzh58ySTnsAIp
         R6jIxUc6taQlORFRk8H5LU4lwDWOdtw3Jj/DbLJ/KOwAyULrZsFgEypDwKf6CdCE0tbr
         nenUqc1TLu11Hjt6UhU7RojbAPI2GVS0oEmHKXHURac+UGa9sPUqA3JuaKuLoUcB+f7w
         fQ6J5vYnjxpUXdRMu8nw1rng4fEOvTVXZ8YgAp2U93y898JuzYVFWmNsJPWkTEmaOPFN
         r3gUlDSSangHg8A4YiIOcFthTVKADHe3DQjyyHdgDv3WP+XaHK9tUKfK8QQF2juNlB9q
         4LcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788623360; x=1789228160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7P80H4tHjRKtSyI0SMuxw7P27fwaqKXH5g+cij3jlRc=;
        b=Cc2KkhV1j+/18WC5hFEIUMGnWkUluvOifIbnfB/BiExKK1a0NeQB9NP8P1nWLvIRqQ
         T2rfWqbjnNniAmkm2sqnP0aRl9XQx+qxFtXty1LjzrShELKmiELlQmgIn5PsuNsFzXqp
         Av/1e0AOe/tuyKe8apb9iB5ALThFvoPyIy9Go2huNDRTm779l0Nn/NRDVJyXBfHJ1BrP
         7oFSUW1UhMXgx7OFyEAY1PxAPsoL11yEy6CLxxUwZ8EzoDCD3gf6T8qF8j+6JL5dUKWX
         1w4K6nzf+UGqrx0iOQBSgpW5DJq44zfnIigafTokLeFpYrZJEXAbbJdQBSYbjahwZCrl
         7tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788623360; x=1789228160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7P80H4tHjRKtSyI0SMuxw7P27fwaqKXH5g+cij3jlRc=;
        b=ei0MPpvaRIsriMtf0DKzRum18bFwPv5aHplfp2Hjy9tvoa6WxF6CD9Pnbee2LRqd0Z
         V3eoftA7vO9KOpIRCIugX3RIZMLscUSU5ej2e1AKQfqUVr2FyGxwkiLXX1UUiZODnM+T
         2uyOevW/rTZgZEsvahujdtliuWctuu6n0zyTmMYqtTj6MqzJBSyBEoUY4LYvN3S4hMpl
         swFb5j3NprCtVya0tJk89AGlgByQk++18ZKof1Rs/UgrMDM4LPuhlKYzaNEA1M9zjrTY
         rz9C7cwkjageDYZFGHyVh6lPyTX2uhHnz9ZsVNlbdqcXWQec4eVLGETQvgQhUsh2SnWj
         YxkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcp3Aaud9Ccn4Kg46Djx++TJNME8o7eeldx+WzBCsETcrwaADaNij3SrPQTrX0j4Yds4D3yVduudQQOvk=@vger.kernel.org
X-Gm-Message-State: AFuF++noEhsssbKITWNBIchoM6vUpPQjIyGNKuBJJK9LKZX+V1PCfRKM
	Req8uWjJUZCQQven13z2cWUn9hTT7MPXWaySD/jq/mu1m9saWtlhXW+svT9CT3/sdpYZ72Awk2O
	JBN4uyj1qrS8/hiXrB3Jg281ekDosZ4Tn7KGAC/XeVog=
X-Gm-Gg: AYBFou0kciRL3rkwEXx1KM2Qy+q+jah6ix80y7OkMHWBo3kq2A/jmCeo2p4FbZI88xU
	q9rZjpDQ4mhnPLkYniC/GHIJ8YJ2Yquy1d7drgr0RztDLam9Shq9XqGfwtcNcr2Poupzq1rN1Uj
	x4zYMYdj99Z9328MjEEu2m1t4ISelrhIxY4SEXPEDhMAF6MxoJBN4eRyVW/6ji6HDxagZpJnDW8
	qGaPmAeka+jdjqlGSvnkSWh1e5M5bM9JbzqVc1/uGzCGrLx1aWJY6ceJ7VFw4hYRlCgz34oS9zl
	eUqVh3Kwbe0AqJ8KoEty0Sdl0/gG0GtcPq6VfR6BDSpYgFrlhgQvPLG1yTqMA6oGwd3+AfyzlNc
	=
X-Received: by 2002:a05:651c:19a9:b0:3a1:b1e4:419c with SMTP id
 38308e7fff4ca-3a371baf690mr14631721fa.10.1788623360266; Sat, 05 Sep 2026
 08:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <133b6aee9e2c908c9da37d5585b3d2cd016906cd.1788187473.git.zihanx@nebusec.ai>
 <20260905151227.75099-1-horms@kernel.org>
In-Reply-To: <20260905151227.75099-1-horms@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Sat, 5 Sep 2026 23:49:05 +0800
X-Gm-Features: AcwNN1UcU-1X1BFtOnvDk5MJ1fV5cvayGVe7JghclzXcqqZSvXM9lAAOeXUWdos
Message-ID: <CAANe3eRpVGnYpygfiQTsXd2VmBO43P-P1RfREkdDypgXBZB9Uw@mail.gmail.com>
Subject: Re: [PATCH net 1/1] udp: diag: bound bucket lock hold time
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, xemul@parallels.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 11:12=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/133b6aee9e2c908c9da37d5585=
b3d2cd016906cd.1788187473.git.zihanx@nebusec.ai?part=3D1
> ---
> udp: diag: bound bucket lock hold time
>
> This patch limits the time the UDP hash bucket spinlock is held during
> netlink socket dumps by collecting a bounded batch of matching sockets.
> It takes a reference to each socket, releases the lock, processes the
> batch, and resumes from a preserved cursor.
>
> > diff --git a/net/ipv4/udp_diag.c b/net/ipv4/udp_diag.c
> > index f4b24e628cf8d..18cfe0df654dd 100644
> > --- a/net/ipv4/udp_diag.c
> > +++ b/net/ipv4/udp_diag.c
> [ ... ]
> > +static void udp_diag_dump_done(struct netlink_callback *cb)
> > +{
> > +     struct inet_diag_dump_data *cb_data =3D cb->data;
> > +     struct sock *sk =3D (struct sock *)cb->args[2];
> > +
> > +     if (sk) {
> > +             cb->args[2] =3D 0;
> > +             sock_put(sk);
> > +     }
> > +     cb_data->dump_done =3D NULL;
> > +     module_put(THIS_MODULE);
> > +}
>
> [Severity: High]
> Does this module_put() introduce a race condition with module unloading?
>
> When an active netlink dump for UDP sockets finishes, inet_diag_dump_done=
()
> invokes udp_diag_dump_done(). This function drops its module reference us=
ing
> module_put(THIS_MODULE) as its final step.
>
> If this was the last reference, a concurrent rmmod udp_diag operation can
> proceed and unmap the module's text segment before the thread executing
> udp_diag_dump_done() executes its return instruction to return to inet_di=
ag.
>
> Could this result in a kernel panic due to the CPU attempting to execute
> unmapped memory?

Yes.  If that module_put() drops the last reference, rmmod can unmap
udp_diag while dump_done() is still returning to inet_diag.

I will keep the extra module_get() in udp_diag_dump(), and move the
matching module_put() into inet_diag_dump_done() so it runs after the
callback has returned.

v2 incoming.

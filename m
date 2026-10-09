Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110D4E36DA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554747; cv=pass; b=XD5z33Dw5HtO4zScArh37+Bz+uZpi4E7ziyUpVtEQ47SZtXjkAwjwqLeBarUuZ+4kQawAXbqYDmd/Dtf3eZcRGsRPSlYjSKYU1ySJFmIONRJ4zrgFN6ylREjlrd9fLs9chXwAbfOG8Bg3JLaLdj9CQMjD4S6JIKqHxM2lDrGdxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554747; c=relaxed/simple;
	bh=g0eC2vaOEHw115QB3uMDWE8jYWwdFfWrEyilLWxNSGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQdtZCY4kNnhM9XERZUqlhRM7GR0RAUayy0DCZuVpE5gX8+IJlEbmIHikmtW52TzWB8icwwXpTqQEB4Uq1GebN0xARN9bCQt9dYi4FfFC+f8culHk16suB4m6SkPD/FgpnM8F50KAg2Ik9HwTXigpTLZE/hSileKvRPKlJDpZQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IElIO5iP; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IElIO5iP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86aecf49833so1224475b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554744; cv=none;
        d=google.com; s=arc-20260327;
        b=bJR/sneOjoIp1MVkQ52unALqNRBNVVmR8vEs6Iww9GZ6aEaYiuLI+96HQtRGr/oYZl
         AStcIHQJaoQjKJRdx8h+jh5m+ytzvni5Uw/rNhBumP2/iyNe5Xo8s+HTeEZhmCijRqOU
         dbsEO5dtTkoQQFN7RdU88OPqgqggFimplyhWkvAKgcxy3RbxIYOsLkKkB6Gbx81tsXnE
         rkNat31YU/ie0bgU42pBt9D3s4x5d/0jjiUpuUrvTJakN7y5IJP8qk/t4XO/QDx+oQ6/
         in1PTOPHZDMJ8Z3l6oi4h3tghGfjIqmCizTrlugnal4PnXmJsnUh7Ama3CJuStWtf7qt
         5zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M8HEugKgmPQjEw7nxK5HzNHe/6wrYnXYBTHzBEDvBLc=;
        fh=qz/9RGVBAvSOCf+2f2K141qRqwWjwa3L50TUwJBPdkw=;
        b=D0uNXXLNctCL3P5q3AzREfNfzsfnzLJj7IWsbhuuPYnbK7F7vhZPd5qqu2HSznfBbW
         2UOhRj6WV/i7q6nVjvJhNXTRFEGvaK8m8YING0skKvuH297m7ZCQcC07DywyTcQ9la3R
         /1ZGXLMZx6Wq7VCfTPmLKXcDUvKOcdpxZEnq8VRcJePtkPsGAzM9ZmBZDhHOZrRMQDuC
         lhnsjt5dxoIehB3fvqVMbOJcdIn2wwu8HiQ2vN3NyWt/xAq9W1J+Ox9N/28uHJ24BAE9
         PmZt2A38OmX4eT1CIFcMTxoe+z7qbn1HmtegAdL30QZ/+lcHCsw4mWahEuG9vEYUHNvh
         NEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554744; x=1792159544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8HEugKgmPQjEw7nxK5HzNHe/6wrYnXYBTHzBEDvBLc=;
        b=IElIO5iPaf6YMuQITWOI2rtSOJc9be5XahaNlb+Ki1wASbC0I5ePZK1v0lBcjbqXaC
         4NtPFGb4f/52zskwQhBl3dpl6z9ed/wluf05OflBROo4XeAbYzA7115QYvKgTDNlMf9f
         OfvnYFzOKXAzUQsO9XQd69kemlLaLK2K1lwbzHNEg+Op7O8dMZOxv8fVDp79F5YoYBcK
         JdU+KiFrFNHrMuKHn5PzjTD7XihdqItz1HysyHSwy+lZTuwBQqLdhiEcvbX8pvyCnGTE
         1kNYNwp3dPfN6Sv/P5bjvqgV25Q6LxJcjByEkeOMEbRaewownZkoR56YZkBAXXFDWot3
         3x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554744; x=1792159544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8HEugKgmPQjEw7nxK5HzNHe/6wrYnXYBTHzBEDvBLc=;
        b=Lu/w0f59gjmUiqNtltIJzHYQKOE48BJqMlzf98qKqKxzVV+QVdJJF5OPDdbVBXIm46
         ivTdOXWPdpjTo4F5gH/W8fBgiSaJID5SgaA8Oym4Ls1iIaPQTL8UayIiljS8CGLaQcUI
         e00FQXet0AwunXirDDl+7rn39fBEA1SNrqdKLQgullZcQpYNYykyCRkTM+yTprz0qkm8
         JdIPu0gvTe4BRx6JwU7fEvjs86n4TRNUw6i4qyHfdcXhH6NzMQDDWhXbRrI45Tc15X/K
         8TmobG642OtIyMlqs3h6EGXHwaR/16MhHjB8X9Kx1DWxq4U/omezYc45DKUbDQHk0xhd
         sCEA==
X-Forwarded-Encrypted: i=1; AKwUvBx0y35/4nYs20Qa3hxynSk3Voa1n+2t0K2erjFb3rTVP+ShS0oXsY1slK+p0ttj1OWtcdva9s4fEKp2MWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHvJayyeUDOOESWxkepPRM5kAugo5jlZHif+wJxFKj0o4igbu6
	iSdV8LStjC5Y/o6U2IiNlYrFCxBSw0zMozPSM45daGl2SMyARKoOrJubePGYvfkHJ/atJSk8WV2
	GUfQvugd85UdQyvmD/ZOU7qa86/dfLzw=
X-Gm-Gg: AYBFou090r+IUyB8Xg9lRwNP3vTr3tVVJS2Fnt8flmyxZ3EziWdwgBPtgz1R8D2vLzX
	ZrLlAFL8tiMvEu0bB2Ph06CI09ZJxBNOuJvtSjGZZ2jk6OykAbYVIGcwTV5gJL+xl0e63SLdLNT
	m7yY5SgVMwIJh9zEazZcE86pdBdSngt8f7Ii+UTDRCMzbAtKvG1ZpqTnnVHN+JcLpiUrN2uFc/Z
	dokyNBI8k3ywEE57Q1J4FgnMaANfjY1GVHhv9okjCGAFdPqa/XR2jSp0Ex9bGHTgZpN/ngbKGw9
	cLk9X8ukclCb4jr4v4CHs6mAG3dJE+4fLjwTPVnuGiqIrroYYyP6gg==
X-Received: by 2002:a05:6a00:2da4:b0:891:7c71:de8 with SMTP id
 d2e1a72fcca58-896a4bbf46amr1808697b3a.46.1791554739638; Fri, 09 Oct 2026
 07:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008133252.3750-1-nashuiliang@gmail.com> <CADVnQy==0Vor90buiY8U+DNYKjxyWRQ94zAq9=aKhyAezsB9Vw@mail.gmail.com>
In-Reply-To: <CADVnQy==0Vor90buiY8U+DNYKjxyWRQ94zAq9=aKhyAezsB9Vw@mail.gmail.com>
From: chuang <nashuiliang@gmail.com>
Date: Fri, 9 Oct 2026 22:05:26 +0800
X-Gm-Features: AclHuK8p1oAeDJ7ugEFlpvHfyJ-pHlTg_f0wedjvM2AkCjxB0FHx6nsfLO2wzEM
Message-ID: <CACueBy4VT9WzCnseKEnYUA9U2YGZBxY-CLxrZpRnXWHcUdMZwA@mail.gmail.com>
Subject: Re: [PATCH net-next v10] net: reduce ARFS flow updates by checking
 LLC affinity
To: Neal Cardwell <ncardwell@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Hangbin Liu <liuhangbin@gmail.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 10:14=E2=80=AFPM Neal Cardwell <ncardwell@google.com=
> wrote:
>
> On Thu, Oct 8, 2026 at 9:33=E2=80=AFAM Chuang Wang <nashuiliang@gmail.com=
> wrote:
> >
> ...
> > --- a/net/core/sysctl_net_core.c
> > +++ b/net/core/sysctl_net_core.c
> > @@ -560,6 +560,13 @@ static struct ctl_table net_core_table[] =3D {
> >                 .mode           =3D 0644,
> >                 .proc_handler   =3D rps_sock_flow_sysctl
> >         },
> > +       {
> > +               .procname       =3D "rps_feat_llc_affinity",
> > +               .data           =3D &rps_feat_llc_affinity.key,
> > +               .maxlen         =3D sizeof(rps_feat_llc_affinity.key),
> > +               .mode           =3D 0644,
> > +               .proc_handler   =3D proc_do_static_key
> > +       },
>
> Having "feat_" in the name of a sysctl seems redundant, since most
> sysctls are features.
>
> Also, the name seems overly broad, as it could also apply to other
> RPS/RFS mechanisms leveraging LLC affinity, for which we might want
> separate sysctl control knobs. I'd suggest perhaps something more
> specific, like "rps_llc_affinity_for_set_cpu".

How about arfs_llc_affinity or rfs_accel_llc_affinity or
rfs_accel_llc_affinity_steer?

The knob only gates the aRFS (CONFIG_RFS_ACCEL) hardware steering
update in set_rps_cpu(), so scoping the name to aRFS describes exactly
what it controls.

>
> neal

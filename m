Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7754E50A6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555710; cv=pass; b=ILpuq23AwSod/JYDG+b5K/KnqcfcZW/cUsVriwySsAtzz78pWwypowPtjIGKO7wr5VanDUH4iYnLSeZjOSRZrjcSWubx/vMLdYmRvJXgP4ys4XOuJJxgsCnZZs1WS/tKSOaOo+UbfIszy9U7WUUBTVC3td4uaaIS+4uEnQ4jS9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555710; c=relaxed/simple;
	bh=DjLH3NHRMpRoNuKKHe/cz8XjgzfCVIY+JqxNaz1KntU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii92abFfySWSdqpV/ZcXMCcVVWVGKCDkAbYOCmPYZ7fkQNoBE8m5KFb5xD07cz60bLBmGRmhwxeZAQBIQIbpeCzNd+JjzXNFEIzr/LrjqH5lDj0LkRW6Gy6FeQpsgJrt0F15GkFbyAB+eEI7oU/+dyNvK7Eqq+TsUokd9dJgmw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=abDhmqMY; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="abDhmqMY"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso11202a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791555707; cv=none;
        d=google.com; s=arc-20260327;
        b=W9EYXZV4DkgTUMEwg7ux4KYPG+Bn6mPr6Y8VttcOlzII/z61G9ZVohjEbT1hla/RgZ
         bqKcgcInFCEjRJdNDxbgQthBPOQs6i1vjERcbuXUcEGNnKVeqXQ+9+8EwyAAw82MzjUS
         q8/f2h6k1PhGXEeOUbaPC3oNvjFb2lD9mQ84AA+/vsVg3M+es0/abDS7SV3jgsUFtukw
         NoFyw1z9dnjfiQKKsqNT5N1hzb8W/djh2UNBiohxPLKWfwYzmAxgScaeKWoIqfB8uRoh
         LS1LWl0qEBlvZA5bUuyAMK2XjEdus68kxxb35NIOAIzg5FdySNmPJdLeoQsEtEeQpC5m
         +x4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+Pafe7r34WKQaUOmtVa7F9TC3dIvP/um8KR5+3ODs4=;
        fh=XwGV8SKkAjbt2TPvlgauAqx1faUYEiMzIgxHQHnjmPc=;
        b=CiWpnitaAFR9cCR/ssuZwFKcGpXsBmhSufshi+1lIuP0but4fuyZOXWI3ClviOBRBE
         P8lQj1r1+qcIWmsowhRN8imqd3H0Ct7NxyrQQ5aQmgX7r+YokJzAK8kgQRjxYThpOD7y
         hxYsD7qANVl0QENhq5Z9gWBDWk1XTJ0XqETwHV3JNg/BOj6ziNUw8UuCX++6yjitDdZn
         OQGF1S79r7WiCswtngusfXvmRPQsiPXD6/T9DCru6WPyGLec/Rv7Rw+2LM2Muiy4ekAX
         ovGmhPAEWV9bYvhgEvqi0STghZQCuTcez4jrvR/i5Dc5h6CSfaTqTcsKMpeFZybO1i9C
         vZ3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791555707; x=1792160507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+Pafe7r34WKQaUOmtVa7F9TC3dIvP/um8KR5+3ODs4=;
        b=abDhmqMYkWCTXBppl4+EGs6RiXxAyec693hGa+4nYUtHilJEbKm6vc2a+t+2XNqeoG
         RKJ70I42KkLmM7ARRY9zVr91+m3mTyxfTIwS4I7nLZUMdDUR8+IjBlK+WNl/JiQzyR21
         wXPceziaj4EdVS8KrYyqTDWxgERR0iBVN1REsV/nTGHonv7TjER9rH1+mKXnw19ZBAH2
         exYCA9eBGI+MdMr6A4mILxzw7mAmYb9DN5n8ZbqGYwiTTlebhEvUIHJNQXMgCOqGnGJq
         vwwI3QvMj43vhDoCG0ttMyhzo/KmOGjESJVahXAiEoYQmfGfAO6/Ot3Y/qUINPEsLTux
         Molw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555707; x=1792160507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+Pafe7r34WKQaUOmtVa7F9TC3dIvP/um8KR5+3ODs4=;
        b=NHFpRUvYqhJyFFI2gDtFJJqIIRjUhje28AXvB44PboUccND7sSXushoHBg1GshBqli
         oSiY3iugvzMdrBPOJoEfbFjU+BxS6ZC9qWPsvPZ91QFFLLyf+2VWtkwfIvguIM7pSwam
         KdFX1LcAHv8/SOnGmt89GHztoXgRQZkajLqGXf9CIuTgdPvIefmh6MQy64alURlUeKoH
         F7demZ4b+QY+Gg8HttdQhDAjBATUsYtxm8Xlv9PIK67UGKCf5QYrdWQKHSZmWEEXiM/J
         PZ6BQXHPK2gNPOSAN9cdE5AzkWc9abc8MxGMwZ7GkmEhmWOUNPWWbTtbpNra9W9TWa51
         fF2A==
X-Forwarded-Encrypted: i=1; AKwUvBywhwZm9Rgxa13k9Q2CPVtVpUUPogXRMx4oR604NKjeZxs9yQQA5l8/05cUwAcE3tKmEfnZG9RhLllZDc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw7CZ+4BJknSQr2cQh/Fxa17Ru5yr091V6k9lXSPVk1pt13b4Y
	MRtSBraivRaPgAiOFdRjmfHhBBdfo9j6utPKk1SVYVg0BHvIzJ16t+AcJgzhXUH+Rpy0wXXL7QV
	K5q8EI79l5pnUv7HcyiLsr5qiwpLfIKXztelX3aAc
X-Gm-Gg: AYBFou0JiR/nfiAd5RkPv3CE0/icAAVMu4S0J97YVA31oLcOMq39KhrdGSFFfMXQn79
	sAo6lfFZIJ7D7B+YgIsmegIigjMxpkgTcEpliP5bmOSE8hrCWG2LQ0azcErZe46sjeUNWVjKUR2
	ITiayfNvU7tcVg0AOOPuIvHboMKlpQSgRBtk+vP/iAoxm6wS6E6ZrmqpfAJb3xHJ5ySwz2UrevY
	YHU9DbhDrYBXY8Uted0p0d4KtrVIIC5XydGU7+5d9NIX9tQjasX/uUa0gj9W3ZOwJeR2pKHClPX
	MasTrMl+0FNBpD1AZsWj80Dv5CHr8XtvmlSv7CkcGJft8i/3m36IDQK10p3cmEE8rJpxEFdvFe8
	QX5xUAdJRWItldjCNg7r2KI6BVi2C+jCPlZBPIa99sbSl
X-Received: by 2002:a05:6402:1803:b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b17b931bf5mr40890a12.11.1791555706842; Fri, 09 Oct 2026
 07:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008133252.3750-1-nashuiliang@gmail.com> <CADVnQy==0Vor90buiY8U+DNYKjxyWRQ94zAq9=aKhyAezsB9Vw@mail.gmail.com>
 <CACueBy4VT9WzCnseKEnYUA9U2YGZBxY-CLxrZpRnXWHcUdMZwA@mail.gmail.com>
In-Reply-To: <CACueBy4VT9WzCnseKEnYUA9U2YGZBxY-CLxrZpRnXWHcUdMZwA@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Fri, 9 Oct 2026 10:21:27 -0400
X-Gm-Features: AclHuK9NsjUhV2RVv6Ss3vMpmfuUatpBCp3Pc4xX57XTudISj1wSKEOFjlYyIa4
Message-ID: <CADVnQymbtXa1kxjhJDE3+Px1jEXY4_FL0rf4aj6vGv8gkGygiA@mail.gmail.com>
Subject: Re: [PATCH net-next v10] net: reduce ARFS flow updates by checking
 LLC affinity
To: chuang <nashuiliang@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Hangbin Liu <liuhangbin@gmail.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:05=E2=80=AFAM chuang <nashuiliang@gmail.com> wrot=
e:
>
> On Thu, Oct 8, 2026 at 10:14=E2=80=AFPM Neal Cardwell <ncardwell@google.c=
om> wrote:
> >
> > On Thu, Oct 8, 2026 at 9:33=E2=80=AFAM Chuang Wang <nashuiliang@gmail.c=
om> wrote:
> > >
> > ...
> > > --- a/net/core/sysctl_net_core.c
> > > +++ b/net/core/sysctl_net_core.c
> > > @@ -560,6 +560,13 @@ static struct ctl_table net_core_table[] =3D {
> > >                 .mode           =3D 0644,
> > >                 .proc_handler   =3D rps_sock_flow_sysctl
> > >         },
> > > +       {
> > > +               .procname       =3D "rps_feat_llc_affinity",
> > > +               .data           =3D &rps_feat_llc_affinity.key,
> > > +               .maxlen         =3D sizeof(rps_feat_llc_affinity.key)=
,
> > > +               .mode           =3D 0644,
> > > +               .proc_handler   =3D proc_do_static_key
> > > +       },
> >
> > Having "feat_" in the name of a sysctl seems redundant, since most
> > sysctls are features.
> >
> > Also, the name seems overly broad, as it could also apply to other
> > RPS/RFS mechanisms leveraging LLC affinity, for which we might want
> > separate sysctl control knobs. I'd suggest perhaps something more
> > specific, like "rps_llc_affinity_for_set_cpu".
>
> How about arfs_llc_affinity or rfs_accel_llc_affinity or
> rfs_accel_llc_affinity_steer?
>
> The knob only gates the aRFS (CONFIG_RFS_ACCEL) hardware steering
> update in set_rps_cpu(), so scoping the name to aRFS describes exactly
> what it controls.

Of those options, arfs_llc_affinity sounds most appealing IMHO. But
let's see what Eric and others propose.

best,
neal

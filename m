Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972AB443C38
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791027; cv=none; b=Kg0ufPZSuVKqCDhaI9jLUhf78VZA8H9k0JmCxwvGt+OR9ILEoRkkYj30FKFGJUrS6LidTCA0zexNWZigdTm/xXA1TbDNmkh2QNSOGXJTEmbcVl4X5clS9GQ/g6DUQOd76FE61X5OK/LUKWEGbVKZgYvaZRAEuK+Or123cv/67TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791027; c=relaxed/simple;
	bh=s4EuUlD807bnxeScR9jHr47Ctn6TStTookbXVJY346s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kCoOmas2wXx90rjzLdloEijRSuMU5Bn3sYQpF0trnsCwl9CdZcWLueM6bEWx8GrbuzSYtnQ3ERi+DFEGuYB4FcVgHCELAJD54xXEV2bs1mL5MSqAxs66qpeopZpodohaEFm4Xl8gBFWo8uHBlljTUlonxWUmc+M8i+Qc3sxz+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLJxyGDU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZzZ6yYnk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLJxyGDU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZzZ6yYnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791791024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s4EuUlD807bnxeScR9jHr47Ctn6TStTookbXVJY346s=;
	b=hLJxyGDUtoYVYN8ja+zg2GsQN9V7/at03gi5snQop+ZT+DvlUh4mLXNJyYdYO3UBwTMh8w
	fZI+b64aBYXkvNQhXWS6RoloXurdalFx1r5FYgXLtCB/56g45SCdGrcDJbsjWuFkKWaNjf
	+MNFUT7EuofjkSwkLR4LzFsybMxxay0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-zgzWB7KEPY26Y1bYG6ArjQ-1; Mon, 12 Oct 2026 07:43:43 +0000
X-MC-Unique: zgzWB7KEPY26Y1bYG6ArjQ-1
X-Mimecast-MFC-AGG-ID: zgzWB7KEPY26Y1bYG6ArjQ_1791791022
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a17e77c5b1so12311525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791791022; x=1792395822; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4EuUlD807bnxeScR9jHr47Ctn6TStTookbXVJY346s=;
        b=ZzZ6yYnkf89PlxLAuq28YvUirFjtjdY7n/p0cQo/ZmtZJL5tbGW8t2qnaJt1cN1adv
         uT1+UQYFvdmoBNb/JDn9kbrvT+zLLSeTLAKGjkqo54B+4hMZlN+9l4cCJF+FsXhU2uQf
         PshGemPUQYPmpybiygdJkcifbZOz3ulERWJAwiypU6kKA8PlYz8K68kkwYD5FnElSCPE
         gPGjqBjdmGGIUPUyKgraCOnsHEqyU3W+22w0GqGFMkPbuf1VJA/TgUqRNa+iNQUBsSj5
         kL9289jcapErxAVoIkMFqDGqGWU37BJjdbm+UNHhGslfiobmU7mNOPILvX/W6BRHHizp
         vAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791022; x=1792395822;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s4EuUlD807bnxeScR9jHr47Ctn6TStTookbXVJY346s=;
        b=CbvDagy/fqlhkU3lFxEpHMrhCsGJ69i53T2Aex9dejJQyEE0PgqGecunLsam0/X38S
         ZZVS5JGML2+X/ckXSD+ZaEpxsq5Rre4l6ORcdP9BeimfKM8D4MBJO1KkhFok0lZnmrmd
         2e23WqrncxMJqfbzSj/+HCz2Ieih/2/PhW23VRRMMXPP2yPt4AIkxm7yuKrgNfX2a1+N
         G4BvG7iTTwoOAniJtgGDnsY6Sjlgirm0s7B7MZftrBQcch2SkouSUOt0tdZQQ3sVZhmk
         cvWhs/GrUt+kURwOsGHvnzyt/d6eyEp6ImSc2RAS0te5e/AJSWc5Crgyo8LFOsPR+Ilx
         3Zeg==
X-Forwarded-Encrypted: i=1; AKwUvBz8pg7EUZrGwdiH2G3uuYWtWBvX4TlZTkcveQH98P0/xKrIhSnkN44uks53VImsvfcnpRRrSVqMdDCzybE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7OBt7NpJuhAIePJ5WUJMcCTvcOSuMztxrm4PLEeJWObJG3vKx
	H+ZyMF62C1sXX1H+oHHAPdoTJTT0GFDPnockcPunmx/qaIACNT3rLsQGPeBApdUtY+a3hkiEVDr
	IT5Vb75y6n4vcbBNroTq4IwuH+SX7CyffygqpBGRleespJaDAR8UfjQzFs43PB93FKw==
X-Gm-Gg: AYBFou3+Rnxgbr8PvuiHCA5cbcHG6+A0rOq4sHt1FcrvOpp7b81I2skcXyA8kEIQw79
	VOdKzd3ZAyw1XLXqtkFuPyztTkruW5zYl7ZSVBGcrf2Kfd5lx0NM4dxexkT/fbhfDcc3yZqLUyt
	qynQTRL4rWO5F1+iMsVDrrp+UGFQhLNf28UZ1182ad7fU7ZYRkuhSfe2Lk2pvJRp7EbCTgWvnav
	O89RqjF8iwzZu0TTf6ZyZUB1YffIWRR0b9xPIGNAFdIg15TcFG+W1K7Op34KrzjOcoR5/iKQKNU
	ipE+Es3KjAyPRxUn8wWp0vtferNi9wISSoF8ev7IN8KOYnYiNhA/Ik0AzYz1x75350e/OnTiNWH
	X24/Y3+XBwl8awr9Wurl2tzCeXMP5
X-Received: by 2002:a05:600c:871b:b0:4a1:a2f3:e6f7 with SMTP id 5b1f17b1804b1-4a1a2f3e8a9mr14219165e9.29.1791791021729;
        Mon, 12 Oct 2026 00:43:41 -0700 (PDT)
X-Received: by 2002:a05:600c:871b:b0:4a1:a2f3:e6f7 with SMTP id 5b1f17b1804b1-4a1a2f3e8a9mr14218605e9.29.1791791021306;
        Mon, 12 Oct 2026 00:43:41 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm147510625e9.2.2026.10.12.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:43:40 -0700 (PDT)
Message-ID: <daeb0025bab5302505fe64379c0882f3b20b4c74.camel@redhat.com>
Subject: Re: [PATCH v2 09/15] tools/rv: Copy stripped bpf_atomic.h from
 libarena
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, Wen Yang <wen.yang@linux.dev>, Tobias
 Schaffner	 <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Date: Mon, 12 Oct 2026 09:43:38 +0200
In-Reply-To: <20261010204327.0656cde7@226.227.38.69.naturalwireless.com>
References: <20261001152042.124445-1-gmonaco@redhat.com>
		<20261001152042.124445-10-gmonaco@redhat.com>	<87ld89wtrx.fsf@yellow.woof>
		<4F009BB7-58C2-4AB1-8FEF-61FA4B5281A2@redhat.com>
		<87fqygl9we.fsf@yellow.woof>
		<76753c2dd66792ec6eb94d00741e61366df426cb.camel@redhat.com>
	 <20261010204327.0656cde7@226.227.38.69.naturalwireless.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Steve,

On Sat, 2026-10-10 at 20:43 -0400, Steven Rostedt wrote:
>=20
> Please keep both until you know the BPF side can do everything you need.

I agree. Also, complex monitors like timed automata won't be as easy to mig=
rate.

>=20
> On Fri, 09 Oct 2026 12:09:42 +0200
> Gabriele Monaco <gmonaco@redhat.com> wrote:
>=20
> > There's a common belief considering BPF a prototyping playground, where
> > "real"
> > things should eventually end up in the kernel.
> > Now, I don't agree with it (look at the many sched_ext policies used in
> > production), but I'd want to assess if dropping kernel support could dr=
ive
> > users away (e.g. industry/automotive which keeps popping out) and under=
stand
> > the various not purely technical reasons.
>=20
> Where do you plan on storing the repository of BPF programs?

That's something I would like to refine better. But I'm planning to keep
"official" monitors in-tree (tools/rv) and encourage to upstream monitors
nonetheless.

We could come up with a separate repository for "community" monitors, with
perhaps a lower bar compared to the ones in-tree. That'd hopefully encourag=
e
collaboration where possible.

> One issue I have with sched_ext is that it did exactly what many people
> were worried about. There's a lot of schedulers out there without much
> collaboration. It's the "copy one close to what I want and tweak it".
> When I left Google, I heard there was 20 or so sched_ext schedulers
> doing various things for various projects.
>=20
> One of my main motivations for scheduler governors.

Yeah that's a good point, though I'm not quite sure how to prevent that.
People could do mostly the same using kernel modules as well, however.

At the moment I still didn't figure out how to build monitors out-of-tree, =
that
might encourage a bit more working in-tree.

The difference with sched_ext here is that this BPF implementation requires
little to none kernel support. For all we know, people out there might alre=
ady
be running something like RV monitors implemented in BPF or whatever else.

Currently most of the logic is supposed to go to the shared headers, but
monitors can implement some custom logic too (you already need to touch the=
 C
file anyway). I'd like to reduce reliance on custom logic as much as possib=
le,
that was already brought up by a couple of people. This way, hopefully, peo=
ple
would rely more on the "library" and share/request any improvement.

But again, I don't have real answers to that, and I'm open to discuss more
sensible solutions.

Thanks,
Gabriele


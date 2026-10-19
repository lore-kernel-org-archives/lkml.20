Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30D48FF72
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398840; cv=none; b=cZbxjtpevExiHSS7cp3UO8prnIrGPt2k7ZmaGyqwuuGX2PoWpvoGPrD4WQPm4TxVzWDXxpc4btOmaEFww6NRG9WUO+id4S25FhZ9I/oyG3bEbGzhQ+qSv3HbfPYk8H9gwOmP3cTwtHgnkWvvoHC0oc6MILt8d0dwNJe3tDmAhdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398840; c=relaxed/simple;
	bh=TEBffiA60KpOsKvv6gRiH6uLBY9Oyjb5oBpoP4L/vm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qd7Iwobix1MiYMlBl9oAUvda7whDPHQBgPk18V7a/ZkUg2fQUIz0pDesh5NCEC/FmyE+BrVNmfUxVa/IHq2shW3Id6ElXS+Z041jFLBt8OU19DFe9ub9gc6OpD6Vcn3SgKswGM66QTlBxjsDRMsGEbj7wnGeX0VQ7aWLNA5Tb+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6ROcTMh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pAuryIzu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6ROcTMh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pAuryIzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792398837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TEBffiA60KpOsKvv6gRiH6uLBY9Oyjb5oBpoP4L/vm4=;
	b=A6ROcTMh+jRQI2GEs4KZg3sciemHiLs7vBWu3f4YZNoGolpyTdx+q99AXJ4LG4tQSQ+fNK
	Cjw2DXrorjjO4Z7mmuYqACg98B70dRT8InnkEDZRtOgbUtYuzS29h4YBxVep2dzsBLJogV
	+u6A1I7JxY5HiZRvotQUZK4ODuuL/KM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-KuCh0sX_OFmw0QUNo8fMiw-1; Mon, 19 Oct 2026 08:33:56 +0000
X-MC-Unique: KuCh0sX_OFmw0QUNo8fMiw-1
X-Mimecast-MFC-AGG-ID: KuCh0sX_OFmw0QUNo8fMiw_1792398835
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso11136635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792398835; x=1793003635; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEBffiA60KpOsKvv6gRiH6uLBY9Oyjb5oBpoP4L/vm4=;
        b=pAuryIzuZ8ELR7X4QHzF161kb8womeM6cQtOWt4nrXISk2T4Ri5RPOTSwf4r5jiN+6
         od2MDtaes2bGKWsQGAFkoueIhkrMA3KTcSJjA6rhufTaKAMs7c7EgaVCv0230aaHlt3w
         Zi2uZeoMYIQp9jxrRYKPYhZckHCAxOxV64E90Bz5z68yWiY7JV+HbYnguqHOIC/14nYf
         LFqxjxdDGFtPerhbQU3jfMxSA5Y8tlbdapNn9nVyqqcylVuVE2wxLb7dhzMJHIfKuf4C
         SJ7OvdrFG8Spb2601q1X6YzZu7+s8Vvvq9a94aceaT3E2rXDN7rKPhYWnyonizMA9krB
         nLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398835; x=1793003635;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TEBffiA60KpOsKvv6gRiH6uLBY9Oyjb5oBpoP4L/vm4=;
        b=xlMJbfvvg+5nEiF5wfzbYAwMHIstgkTU9PLUnkjkDTIDfEvwLmoedakpsZ2Fe2YB3X
         HRcXEEnR53kGjMChF4BzipajGjy0j0TG9cYZmZNrfpmcq3kOeqFHr/yGLacsW0b5mGa8
         bquJjFH7O5WyfcV69rcNWw5MF4MjjO+d2DiK3vBBazK+h4MRPhrTsRMD0EN0gZ0D3Pnp
         sSvTDPwa8iUS4PtzPk06vSAmsJsm1L6EG2gRkl+arlxB96IoOfMjb6lMekx0+nvsft2O
         /7++lirUon+Gx/sqI6D/GVzv5bdrJM9mgk8A3tEB6TKvBQN6RBj1o9dtnNA2A+7Uw5up
         ACuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxYfFExsX1m0tkopolxn4tw/LNp/7B7my8ikdX7tPKFbUf1kSBZ/8XuZzp3sbkTvHdZy6+l+3bUbFPi5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl6UflF87aUvpNp6pJBhliCRrFySZm921OfuO2tx0XUM+/2ONI
	FStY2NKF/ljf0RVe1I6r4Uz3UJa8kNhoJvj6ZvZWrhnZmeeECZUyAkWTPeE2zPu2+YxtMvTW86b
	JlAg0EEP0fFiKlKpySu5reHhYSIO/b4kCHgC4X5XcofgPiUZZfUfCBt+Bn5pynXQrVg==
X-Gm-Gg: AYBFou3imSsNw15LaH9rKq6J7jo5RHT5lbVKZDseD3KH6IVCz5pYJdHVto0qLEbiYU3
	2P70W3FCJsl78bwvuOOFiXOSbIq2FMfzZc5uIipW0wmTB/2k9OiWvKtXosC/KGfw2S8s/pV21c7
	5T1A/n62sDPgSPAlWDE1F3hz3DhWiqu87YUrUmXKJ9l7WrrogVRVZMUS1EP5q5pKeBFiDHiP0q1
	h9MlP6jVFa0EqQNB3xrvXU8GyJwBsmtcFy3c/JsHrbi1lBRUdEJd1i3Gphhrd+HPNJ2ZoMcbpNZ
	h4o9cO6nMyUrJri0ho4U5puOq+Ehk5t6cHZdrx1ueCqTKU5ZavEACxwUZnyHxH6pvkiSptqWjp1
	yRZMrdRxJgEL6UAMQHi+OfUnLSg==
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr153032015e9.20.1792398835047;
        Mon, 19 Oct 2026 01:33:55 -0700 (PDT)
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr153031635e9.20.1792398834683;
        Mon, 19 Oct 2026 01:33:54 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50ae5esm23907875f8f.51.2026.10.19.01.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:33:53 -0700 (PDT)
Message-ID: <b76dfd3e5a118e30ab25910f243db1cbcedc1c00.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: John Ogness <john.ogness@linutronix.de>, Alexei Starovoitov
	 <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Wen Yang <wen.yang@linux.dev>, Tobias
 Schaffner <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>
Date: Mon, 19 Oct 2026 10:33:51 +0200
In-Reply-To: <87bj8s8ih9.fsf@jogness.linutronix.de>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-11-gmonaco@redhat.com>
	 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
	 <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
	 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com>
	 <878q3xtptq.fsf@jogness.linutronix.de>
	 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com>
	 <87bj8s8ih9.fsf@jogness.linutronix.de>
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

On Sat, 2026-10-17 at 17:23 +0206, John Ogness wrote:
> On 2026-10-17, Gabriele Monaco <gmonaco@redhat.com> wrote:
> > > I am still not clear how the rv tool will replace the existing
> > > in-kernel implementation. Right now violations call printk(), which
> > > conveniently show up in kernel logs and consoles. More importantly,
> > > there are the rtapp violation events, which makes it very easy to use
> > > ftrace and perf features to record traces, take actions, generate
> > > statistics, and dump backtraces on violations.
> >=20
> > The plan is to keep everything you'd now do with perf/ftrace as plain
> > stdout of the RV tool. Right now you can see the same ftrace output
> > using rv mon <monitor> -t for in-kernel monitors (only deterministic
> > automata).
>=20
> IMHO it would be a pity to lose support for ftrace/perf. I use these
> tools extensively for my daily work evaluating real-time systems. Having
> the rtapp RVmon integrated allows me to easily and naturally extend my
> workflow to include rtapp violations. Plain stdout is hardly a
> replacement for trace recordings that can be imported into existing
> visualization and analysis tools.

Yeah that's a good point. And the trace-printk can only improve this to som=
e
extent. Thought that alone can get you stack traces for free.

I think no matter what we choose now, having extensible reactors allows to
easily add new violation actions down the road, if we see it necessary.

> > We are missing stack traces (which I'd optionally add only on errors)
> > and perhaps other events (e.g. the -e in either tool if you aren't
> > only interested in errors/events of the monitor).
>=20
> I don't see the point of reinventing tools that already do the job
> well. I do not mind if developers want to create their own tools that
> provide some small subset of existing features. But I am concerned about
> removing the in-kernel RV support for ftrace and perf.

That's valid too. We'd need at least the rv tool to start/stop monitors in
addition to ftrace/perf. Kind of what you already do now with sysfs.

I'm trying to keep this use-case in mind though.

I assume you aren't interested in the "event" events (transitions in the mo=
del),
those are useful when developing models, at least in DA. And those do not
trigger a reaction (stdout only for now).

Thanks,
Gabriele


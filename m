Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25593033D8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071118; cv=none; b=qipquq2/zktNEMWKSRfwHVCI/c7q+nEvTLPjZzwZAGnrCcLchs6O/Hn+q5JLAEUbd9kpprOGdaOAOjudCQCmYeOZHLmoI7vzp+hG9U9qtJ3paKF0jDPPsyYM9gAVE0YAAok1ko4lILiACybazT1YsbFLEWpUC9HbFkKjo6MSSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071118; c=relaxed/simple;
	bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pj5hw3Heq7gougKLSHXImupxGOwJCfGENSRSZQSjzTzDKm5AxvaG1USIp4cjrhlLU25o+ytSzfOaPGpYlB4IZp3YqAu5HbOmUdmlnMpFKr22i+roqnD+L+II3GrmmXhJ7gQ2jBb6G894pyBXB/D+iuGQvnnQ/l7HGjFLX0dd444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jf+Z+SKU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNsHiQ8q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jf+Z+SKU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNsHiQ8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792071115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
	b=Jf+Z+SKUqTE2tLwGJa+lIU0TOJxBAL4sUbZGOGpkGdTqhzFTRWq+nYiphXcrb/bntczpVj
	AixSIpObwI0mzKv8RruAZclmwv6uUUcIvayXJ7Np/mSRx7Q+7roc+g+hOqejoOfAxSbMAu
	udUfTq4xKlHVzfMniI3R8kxQ0J6L2sI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-PU6oGuctPsu71lpgHoXyYA-1; Thu, 15 Oct 2026 13:31:54 +0000
X-MC-Unique: PU6oGuctPsu71lpgHoXyYA-1
X-Mimecast-MFC-AGG-ID: PU6oGuctPsu71lpgHoXyYA_1792071113
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6acb986a43bso6105993a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792071113; x=1792675913; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
        b=jNsHiQ8qtZ1AQbbAEY+pTUhXZLsnQqJAgrz9CQzNN0vlNBbNs1DXOrnL7QONZwJ3jt
         v+yLEEZ9Wiwr4AI0mYUfcVDGggC4lFVmrMteca3KbFDjE02oy28KU0x2g1/cCq5ZdmCQ
         FhbP1zIJS9q8gcM0qZWL03ssugBux7qmAxV9Lng79v/oE4pl1/ksi/39M/pgNtwx5wmF
         qfYPlyzuwlijxyIIR58hifT30hB0f5Kpw4uj9trlURGXQmaeoufcfOq1BS5G5/Zd3dTu
         so2NekgjcX5kQqwZWH2h11ZXCvwiKbQ99q315EH2ENIW3ikV5t59fICzdihhuua8PwaT
         2EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071113; x=1792675913;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KIU1bRrcoVVbS8IUa84eRSPGoeUTQ2rkJ36Chjo6is=;
        b=VHq1yak79VYsNCvp/Cj8SF+zkFoLcOvfVkUf+gvgK92TxvE7Bwp4D1LD5fhY2Lv+31
         oGUeRzz+la+r0qIRiSMUxSdmW2YjNUunUMFJBb3a/XWAZZavrGOQnVZurNNdV3xyTW1E
         JAa3EOmpWWoqe64c6q3MJNXpTsqnIGZ2aN98DOjrtHJHamC9uLEFty8ILR5o06Dgce1h
         Hpte9MIb6HQGulQumAHGHMoWv2GOJapIqI3iml5FtJ65gCWncbFtbdWLde1foGjZTt4H
         mLS0vaQoXokeS4BwCzhIT3Zvm2eQU8T3lPUPvlPdaOHfWO0lQo5OqG+YZed9eiS5ifwa
         fpyA==
X-Forwarded-Encrypted: i=1; AKwUvBzXOi5LVQXj5MmNdo9680CnJaqEMaZ+uSK0LL7tAGpSpazq8HnKsB9oy+/AtM8pmM98G0py/LFOJHe3DkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8zLGW/HIq5fh1fLoSp0eLRiDJGBf9jpcQHQwTX7bEAGSnakID
	3kLqM93seDhd0ft/pJQdry2imbITy0yzU80lm+Miq6oNCWOyxD29L1OVHzIyyPgrr+YUoxcttSC
	fX716IRh8kae0ChpceE7PdI1YbgUxRr8euvLHzjZB1pR6TVdDg/O0JVeXuGugpMxDGw==
X-Gm-Gg: AYBFou0Egu+ND7LH/JxydZHbHeWJVJTm2RkHM+1iK+jJJYo9R7mNORRe8Lg21sYRpN4
	5a5iZddXlxgrK1zckLGCuXf4frW+4s2/YPzELW1+1M4+yngpRyx3kHpx+1wmH5YnfuK5tGo4xv8
	lAJFGAm374G27TrAXFpgEJJvdDMwCDhbrHK7vLWxbAcja45HvTA+TQILpb2vSEHmz+otsKm+oc/
	upwqcQsSXGbP1lsuzN4vtPuxCUmlF2WGJrvs5Y73gRivnacs614fQeQB4aguVVh6uzpZ7G4x29j
	BX5C+TLS++X/1NwcEixIcVjQIkpwylJIu7GXizPVsujh7FAnaBGy5C/f0EWO26q6fsN34ZqpA0D
	DxPch0RigquxJVeSphfiSE2Z2Kx2j
X-Received: by 2002:a05:6402:2381:b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b17c2754e6mr13047922a12.34.1792071113183;
        Thu, 15 Oct 2026 06:31:53 -0700 (PDT)
X-Received: by 2002:a05:6402:2381:b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6b17c2754e6mr13047909a12.34.1792071112780;
        Thu, 15 Oct 2026 06:31:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df2619703sm6019856f8f.24.2026.10.15.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:31:52 -0700 (PDT)
Message-ID: <5af5de33f57fec18c8026f20c131830924438dca.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 15 Oct 2026 15:31:49 +0200
In-Reply-To: <3ac898ad-b367-449b-bb0e-841a4fc6c190@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
	 <cfd7123a-e83d-490d-918b-154d45aad92d@siemens.com>
	 <aa16855bc9ccc6b776ba4f513b86e3eadf889f74.camel@redhat.com>
	 <3ac898ad-b367-449b-bb0e-841a4fc6c190@siemens.com>
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

On Wed, 2026-10-14 at 21:27 +0200, Tobias Schaffner wrote:
> Nothing generates NMIs. But from the linux kernel's point of view any
> activity of the companion core is NMI-like, since disabling interrupts
> from the linux kernel does not stop it from running.
>=20
> Our co-kernel keeps control of the real interrupt mask, so Linux cannot
> delay it. Most of the time what Linux disables and enables is a virtual
> mask instead of the real one.
>=20
> Tracing already works inside EVL, thanks to a downstream patch [1]. It
> is mainly fixing all the points that rely on interrupt masking by
> calling the correct wrappers.
>=20
> I would expect that we have to do similar for BPF. Some of the checks
> already exist to cope with NMIs and we would just have to make it
> recognize our stage too.
>=20
> [1]=20
> https://gitlab.com/Xenomai/linux-dovetail/-/commit/2fc39d2bb5d9ca1c0e8987=
94fc0297eb04cf67d9
>=20

Nice, thanks for sharing. Yeah you probably need to do similar things here =
and
there for BPF too, but perhaps some things (e.g. tracepoints) would be reus=
ed.

> You are clearly much more into the topic than I am. I will have to take
> a closer look to better understand the BPF data structures and,
> especially, their locking mechanisms before I can answer this.
>=20
> My use case is, so far, not that strict. It is more that the bigger the
> tool gets, the harder it becomes to argue that it does not change the
> behavior of the system under test. If the tool remains simple in the end
> and I can describe its behavior as deterministic, there will be no issue.

...

> It sounds to me that you think about moving the complete RV system to
> BPF. Is this correct? In the end I will try to follow if you decide to
> go down the BPF route. Possibly after some delay but nevertheless.

Frankly, I wanted to keep both representations and I'm designing the BPF se=
ries
to share code and keep both in-kernel and BPF maintainable.

But this was mainly under the assumption that some use-cases would still re=
quire
in-kernel and/or BPF wouldn't be able to do everything we need with the sam=
e
quality/speed/determinism.

Now, I'm still assessing it but it seems BPF is good enough, at least for t=
he
use-cases I tested, this assessment is going to take time as well.

For the time being in-kernel is surely going to stay and I'd really value
external opinion bringing other points on why it should not go away. I know=
 the
industrial/automotive use-cases are the strictest and if BPF doesn't fit th=
ere,
I wouldn't drop in-kernel support.

So now it's the time to line out and validate all requirements.

> Should I wait with proposing a v3 of this patch set until you made a
> final decision or do you want to merge this in the current RV system no
> matter how this develops?

The good thing about your series is that you're using very few dependencies=
,
just like DA monitors. This makes it straightforward to use your header dir=
ectly
in BPF with minimal modifications.
I'd say, continue your work towards a v3 and in the meanwhile I'll try and =
see
how to align your changes to be easily usable in BPF.

Realistically, DA monitor support won't reach upstream before the end of th=
e
year and after that I'd need to do the same work for LTL and HA. That's goi=
ng to
be more complex.
Only then, if everything is really smooth, we're going to think if it makes
sense to migrate existing monitors and deprecate in-kernel ones.

In my opinion, your contribution stays relevant either way.

Thanks,
Gabriele


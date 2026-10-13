Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB237E5EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876377; cv=none; b=MQjParFBVK16FgOCo6S9Jw9EADpgelX9mSYOKnw5pFfpBCkORvkq7AqV8kqjLX+JJe9+QN/U3OknLqkqYmfRvzcGD6L6yNitSFb0zP0eqD5KjehFPiQjH/ADgPlMLcRyf3d7hfVC5zk0w6SJKeGOWsgHXElIidzeGRwXclxWsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876377; c=relaxed/simple;
	bh=ewrmg3I1S4qLQZ3a1imZbYrlzGASU5GuB3jWVBat8jo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rnf0llKAERTKgdr6ddWcP+RlcSbbR1SgwD7F0BhSK5JYRyQYUqQYKBhAwEm2UBUgSf4lUPhaBWUXpqN/UNhXbuQ6RY9E9nP5GVuqodFxb9hx1Q4JhQQ4Jbgf1leZZk2uf/KE+YHadNvCF8PmbrxADqlgjQfvyQcCxPwnermyiHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmXqOZB0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYdyhAei; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmXqOZB0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYdyhAei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791876375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ewrmg3I1S4qLQZ3a1imZbYrlzGASU5GuB3jWVBat8jo=;
	b=TmXqOZB07IF/EZjbMLZahfEWxd+m/jZQKzR7HFYGA6F13blp5Kg0tM2M17lNE/AkQ0gzo5
	Aqp+fQ3d9GUhsRz2PtN0YbO8khq5Dee7OB4GrUawifw62dOaa4K0u9ZqZ6OzyTFmCop5mY
	815rZvBx7yeQqZYBmibslOOFTQ7IW9c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-VYjmS9ZmPCiYswJFqhC5mQ-1; Tue, 13 Oct 2026 07:26:12 +0000
X-MC-Unique: VYjmS9ZmPCiYswJFqhC5mQ-1
X-Mimecast-MFC-AGG-ID: VYjmS9ZmPCiYswJFqhC5mQ_1791876372
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a01c621dc2so20330705e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791876371; x=1792481171; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewrmg3I1S4qLQZ3a1imZbYrlzGASU5GuB3jWVBat8jo=;
        b=OYdyhAei3xLoL/LLz+ezlSVbZqiQ9PYQ4/2BpBAMYl9YfQiwnBtJjk0hJElWsltTcI
         gJRtwyE4ybWoSe9G393FeQUTiCLKXCftrP6Zo+b7UNYm5tMPxutxIUq4SowtgQKFzJgI
         tjra5tLPi9ai5mTdXL2iUDFzzJNDVMi3R8q6aw8WniMDyTnG48YOIk8adC/yS6ijyq8+
         W6F16ArcRHvMS6usmPMn8k8ngcw+LuiE+CEFla7rI5DblUr3kIlbYR9/q+fI5Azww3FY
         6i0AIriUVa/3GUgGC6WCoY2tY64hERpzEL4M9XBbnGWJroMAe0TbqAr7jaqFMwBArdI0
         GPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876371; x=1792481171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ewrmg3I1S4qLQZ3a1imZbYrlzGASU5GuB3jWVBat8jo=;
        b=Wjxc9j3NiqdlN7yFn7pGqa9eKCDL/ZCgqmFCgVZSVBs81LXwX03DmIMFtnQAhzPo2G
         RR8/IcLZKprwJGSCif0blAftgpLpUcA9s7oo4OU2Q52s8GxcvS2Xb/G8qPOByx4kBYqM
         bk3MXGFDGhNWgn/fxlYcplV8k3qiIt7HwpyRHldlaioq7Kihg4/oOYv/kEbcNU0EFeog
         su/pY4Qdg5zmBbcSb7Qcp5h5TVbyzXH953EcOj+X3lM3vnv/z+1Mu3fHvfGMG8xuaFW4
         j0WSligsxnwKKa1TvnwUpWwMq/9fLP82z3BrxK7JJPKsAh/AKql/zoo64PX7qukKhHLb
         n5kw==
X-Forwarded-Encrypted: i=1; AKwUvBxTTC0vi7GqeQPTU6PPYh2nfZJAo82FigKy9K7LgcqUWWjyE/bX2Rc3Wn3CeFXHkDb75R51PUSCiA2mtrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfb5uZsr7RXKoTGNeH6Z3g4EefXQs1wHSEvXpip9tdeyIeGCpn
	e1uOrD2veDxLeVamSfOEP8j2wmohebUip86O4u9G9CPHQ9Pd7BxSXo8q8GGNqTCnFi/1AJkajK+
	tePQhl8/S16wY6Admmk7kwEdCMV5xkBA4k6sPqaNa0NuNovgMuApRyjVfgAnpIbZ9sg==
X-Gm-Gg: AYBFou0dGwikBMAUY23rUFa8lYyw+6P7sRwXcEjy7NK4MWyyP16fdlmRBiP8myRWqC+
	eo2ndqyqHRk887Ij4dw/GlqlZ1yoeu6XIVImC4gOT6Bpq0W0PaMG/43SDQgUlWPSocsqxJLixYv
	8l/Aoj8BDM4UNZZhUdf8qdwtedzDcUoPk/wTmagcxL52K1yuPt3SrGRYesa4Ws5W4x/VKU9CEuW
	laxPsUDpTQ2mIC8Qgf7/ZVdpwl0BGIl5K88Yaii4r48Vjt+hqPPbiGOm99G9vatbzNnnLsLULrM
	56hdUk24f+/12KecvLjUMlxEASUu4VZTtGi89hj0F2I1RP8fwii33u2I5Rjg2btvh/b13qIlnRK
	kt4NqxKDhAZo70BdEXTenRpk24D8f
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr221459705e9.33.1791876371598;
        Tue, 13 Oct 2026 00:26:11 -0700 (PDT)
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr221459285e9.33.1791876371161;
        Tue, 13 Oct 2026 00:26:11 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd733fsm3581160f8f.58.2026.10.13.00.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:26:09 -0700 (PDT)
Message-ID: <aa16855bc9ccc6b776ba4f513b86e3eadf889f74.camel@redhat.com>
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
Date: Tue, 13 Oct 2026 09:26:07 +0200
In-Reply-To: <cfd7123a-e83d-490d-918b-154d45aad92d@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <4759c9b0dacdf1f9c0cf47158895860dbd0ec401.camel@redhat.com>
	 <cfd7123a-e83d-490d-918b-154d45aad92d@siemens.com>
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

On Mon, 2026-10-12 at 18:18 +0200, Tobias Schaffner wrote:
> > First of all, would dropping RV in-kernel support negatively affect you=
r
> > current workflow?
>=20
> I am afraid it would, but first mine is a niche use case, and
> second I am not very experienced with BPF, so please weigh that in.

Thanks for sharing, I'm asking this question precisely to find out all use
cases. RV is itself a niche tool, so I'd rather not squash use-cases away!

> > About this series, I believe we could implement the same using BPF maps
> > without too much effort, then the rv userspace tool could display them
> > nicely.
> >=20
> > What do you think?
>=20
> =C2=A0From an implementation perspective there may be a few pieces missin=
g,
> both in EVL and in BPF, to make this work. But I guess most of them can
> use the patterns the kernel already has for NMIs, so I expect we would
> find a way.

I'm curious to know how exactly you're tracing EVL right now. Are you havin=
g it
generate NMIs to linux and catch their tracepoints?

RV attaches to tracepoints and BPF would do exactly the same.

> I have two more fundamental concerns though. One about verification and
> one about recording dwell times.
>=20
> Regarding verification:
> The path I verify is deliberately kept short and simple. RV fits well
> because the probe is a plain function call and the state update is a
> try_cmpxchg that cannot fail, so it adds very little. A BPF program
> brings more machinery into the probe path doesn't it? I fear that adding
> this would force me to verify that the new RV system does not change the
> behavior of the system we are trying to verify, and I suspect that could
> be harder than verifying the system itself.

I had a few conversation with some Functional Safety folks over the past we=
eks
(the same people Daniel used to talk to), I now understand the problem bett=
er.

Their use-case was even stricter, that's why RV didn't take off for them,
essentially they're trying to prove some more isolation from interference R=
V
doesn't really have out of the box.

But back to the RV vs BPF case, I'm trying to reuse the exact same code in
handlers, so the verification step should be mostly equivalent.

Assuming you'd use tracepoints (BPF can have more probes but vanilla RV doe=
s
not), I guess you'd need to validate also the ftrace code that ends up call=
ing
your handler. BPF adds a bit more on top of that too, not much though.

Then obviously there's the data representation: we use BPF maps that can be
quite complex, though simple arrays (in per-cpu/global monitors) shouldn't =
be.
That would probably add more to the verification you need to make..

> Regarding dwell timings:
> The numbers you presented look very good. But wouldn't we lose
> determinism by using BPF? If I want to use this as a measurement tool, I
> need it either not to add latency or to add a constant amount. The mean
> wake-up latency of EVL on my system is around 10 us, so an observer does
> not have to be very variable before I can no longer tell its jitter from
> the timings I am trying to measure.

Ok that's a good point I'd like to investigate more. BPF shows great perfor=
mance
in the average case, though I fear it could have worst case spikes my quick
tests didn't show.

I'd need to run more numbers to be absolutely sure of that, I'm not aware o=
f any
internal locks in the simple maps we are using (though I only quickly check=
ed).
BPF maps are clearly heavier (memory indirection and/or function calls,
sometimes mitigated by the JIT). But if we properly set them up we shouldn'=
t
expect big determinism issues.
Nevertheless, this is definitely something I need to look into.

The whole JIT thing shouldn't bring big problems either, once handlers are
compiled, they should run almost natively, but again, I am not too familiar=
 with
everything that happens under the hood so take this with a grain of salt.

Thanks,
Gabriele


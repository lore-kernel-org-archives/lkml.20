Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793642523;
	b=27X9Fte8lUt2ENX6INZG/00M0Rbc+6gZIxwT7CCoRmravyZJMkQt5cNupje74RYQtHyA
	 SXrSnb2tvDY3PZyaQV4NButhh4la5rZzO4OtBKUxtgQxA8rXWu41gWFYBuLswCSBKROXN
	 7qj1eHM8bNMJN8fj2p87uA2tNmj2/xAnTSM/CihFt/h+sTVlfZBSCCvlSx3vmP/QxZ+kc
	 utXzDZoJg+v1qhzuYzGoE6OVse1DAOoI7V1qso1tMGYdlVd/i69nDPTmwDhI75qAillEi
	 zjbutQgNqYtB4cI82suWC/MPVIyS34DHxmFiO4avD6HAjh+k1jyG8u1k1o1MTkqfeDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
	b=ETmsqhs1uRh9ybdQcvoa6srWhO3NCYTWCrwH+YBpGqyid+LYttO1j9ZZP4+OwA0v0+ly
	 3dSsIdzeQDrmLosV7qHnIboVPhywOBL4hobZIv7CsQzoAvScTdAJNw/yQfLj6MnNIaGxG
	 qR2e/SzADg5sIueyCmWRbCk9XhetDqoJUtunaQyjgOAajGl9GLKr52vpr4coJ1XqVV4gY
	 Et5/sbxIEBqvVQFTcC2eO4gvk2B52taJaTHYYn4o0JlrFbho+taDw22JdOiC/1p6ua0Xd
	 Xt/ujjg2+czi8rymHEapJ1eomThZ1P/hNvyZ/kT64bccuqIQ2joUXRP7wiUdxl9UIhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QvbmQj0z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B1606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649B1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QvbmQj0z
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so492611cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793642522; cv=none;
        d=google.com; s=arc-20260327;
        b=MMLZ2lYKyEgyqBcGNoH2PAk7qU3+oHKRyec4DfbAYdNB12YHqOMXaS1ANfaJtEEzPp
         htLu6tdIYrf3GWhBJQqpOyBZIDQ8+DKXyKPCvR0QdF91Wa9qXk1y7pH1Qbyzbm5fVaGd
         nr0FHbE/u0aOeQB/zrrgx0fTvMCGULZFXsYwJACfPWzEQi0aNkKv4Wb5c+sM6mqShZ3s
         AGgivsUshW5MCX9DMF2gE17l5qXjGZPs4pdtNsQWq56PwjqLY3Z9oMhoqQxeNi2JT4Ps
         lGMLl5bQoYwEPd8z218EU1Nyiw8ivI7R56LkKUEeLrip8aUKBiTZxvOISrEZWP2L1Z8A
         Cipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        fh=5A4r9WNtIXB4naac0S2iH40BgGj0786lucLzNdNc4Qw=;
        b=mqJ0Dt3V/VgPR5OeIl+deKPsqNOBx+6ooq+zj+8AEb+zGi9pv+t0Yj8/a/fO1KdD3f
         2HW2qjr4opU6NC5WQIT59nSBA14mtc4nQ7DI+syvxASNhUgYAkFKP1Hn5prLl+C2vUCr
         ZcQ3tJP/FLyDIrO/MmiKF6FNmJxfSYvCmdU2jfEzFPxIqeDxrVB74ZMop5K/+Q6yFBNV
         F9N2Vsz01zDsXtOfe7l5I4JdQ6pcJ2i2B6Ng+OhTkQMEAEb4QSBf30rYIvebiW60UgVM
         VnEuUxerv39/oBmV2DKGIHZO7yaKf9aFhUxeqfNGknxlqJruHgrnDL70ZU8BsAx+f/Nu
         0rBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793642522; x=1794247322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=QvbmQj0z6L1le+6Qvx/RqdIAXnfDLesNwtVoiSJ/7LXE9J1zq5B0RrEcArAB3oflBl
         hOU4rI/TumzEAloN1odCQbBRzrLS2T7y7fwGH4KtKsrIORJtAdLka3UQiCaIFNLcb4d6
         peGRJppUCgMsNT04e95I1uapVS11JDS7irhCp1ccRQimWEAZcCzPMJlu+NhDTypMzxfn
         TGAHY9zwAbEOQIYJ5uHCsOneTyWF7i4eJxtrvQKQTKBGt7kjbatlEfX4oCq6+JowjrAR
         NnbBVUOa9O2yUec50autxECa/imz9+UD6nFnV8fjIJmmb+06tr3eGnDiO0TZfeWxwCbm
         W+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642522; x=1794247322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQVpUc6t5sX3lie5+dJjcoUcVnf4IiRYmAm/BtKdX/U=;
        b=OXWsulUEDlOG/uXKNUrKJ5DAGPHyMirnQzWGTgP3Qa2DawzQtTAvPK/bqsC5IUcAMe
         LDtbB9R7rUOyHbHqs1azHTMtxRpj5mrYrjascQngSkz7CZFuRjDDKoVrii5n2Ee0rAND
         cZp7LZQPtnW/GLXL05BalDRqx0W+QX3zbBAGE3PogcUVW0oGhPeH11t4ETpZVhM54dUp
         +Pceun8r4sz5EG+13wEx04aZjhZcG8uWyJ1iHOhKbutcvaxiZ7UB4hqI3NRw1MDKYwwy
         mMt3rDqtv/gx3aqpCCOnjPsjwC5N0g9QhHQxBgdS5GnwDwGErFcNWL5y/Rz799WoRGE7
         EeDA==
X-Forwarded-Encrypted: i=1; AKwUvBwQREZA97fpeknfd7gnU4mfhrKYDGRF6gbUH5TP6LTdtS9+aTYsV6s/6Ysn57Gj8AS4mVecaIyBJaI5+yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z++yJznjNmhze7bVOYYXbU6rGb87Ha//Z4OYsCIJRhukTEcCXcG
	29cmn7/kfIUCRBgoPL0XyM2MomAEeVd7/BeUVu5vL9XC9yGUb04REE8PH2hN8WZEcNWfuVwoYae
	bbks2e/v2VAVmZuOkkucocGgl9GRjOuBluxXbm4j6
X-Gm-Gg: AYBFou2q7aJEZNer3UzaqCAqeUyHVsCA5R2o+DF7Kj/6Ref0uG7c7+lkd349mXv+PNA
	jrTljGmEbJfMQu/ujO6uajciAq10cdtvVYTc13w2iQV2TTbm3YFCzM3W5qZ5r4X/upAQ+YMKLRb
	pudheWpDumCKBl6Lgc4E9jhVgfakQxy6RrcbWDGKO81d8lvColmfXPhGUsVsZsnsG+xRlI2DZOK
	43EK7OLsbS41BUZajJbBXvEPUrr5gs8C6XKAki+n7y+d/11JjqCmD7/t+QzQp98MGNccJ6R0V6o
	xUw8sQ4ogvw+ZkOswwY5MbJGq90TNHxB1EE5rCBTygsN9mrP2MxG8zpDjgjf0oPP7hd6Ff4hleG
	Y5e+/8a45qnIaFOoInyIiwhexdKpzYgvOdpliyQ==
X-Received: by 2002:a05:622a:4a8e:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-5412cc33acamr89708631cf.4.1793642521680; Mon, 02 Nov 2026
 10:02:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028183137.537812-1-colin.i.king@gmail.com> <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
In-Reply-To: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 2 Nov 2026 10:01:50 -0800
X-Gm-Features: AclHuK_6VTP6biNXJIrrQGQQoebrT5vhbNV4kO_dw17paAXmuHsQGGvuUXwy-oE
Message-ID: <CAP-5=fVqUNoSQ72Hh5Zam3tyqooxpQ0+puAtTvr6omzmW3HZaQ@mail.gmail.com>
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
To: James Clark <james.clark@linaro.org>, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:52=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 28/10/2026 18:31, Colin Ian King wrote:
> > There is a spelling mistake in a pr_err error message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >   tools/perf/util/cs-etm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> > index bdcf94813129..65bce2450549 100644
> > --- a/tools/perf/util/cs-etm.c
> > +++ b/tools/perf/util/cs-etm.c
> > @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct=
 cs_etm_auxtrace *etm)
> >                       continue;
> >
> >               if (!intlist__empty(etmq->traceid_list)) {
> > -                     pr_err("CS_ETM: Unformatted queue should't have t=
race ID\n");
> > +                     pr_err("CS_ETM: Unformatted queue shouldn't have =
trace ID\n");
> >                       return -EINVAL;
> >               }
> >
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>

I was curious how this passed Sashiko's review. Did Sashiko flag the
spelling mistake but the fix was missed, or did Sashiko not flag it at
all?

Thanks!
Ian

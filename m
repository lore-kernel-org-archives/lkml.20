Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587743;
	b=OOZCUxhHqWA2giTxQ9qrWu+tce9p0tov30TEmmXVvlOuLulSNZNAptINSBsgFvrd+om1
	 +h+ycA17pSiAOJSTl+/5rnTPJ3eDqKiTpgVVitgGV2tr+4CaJi/ozcgLpzEaEWnxs7j3W
	 hdhZiMe0fhZTQNBqlZSGh/J4t0zBXbDcwv6pYOIoEEOwfWAz1J3usqqDrbaFw35vWygiH
	 IiNKN8Pc/w6+OwwL21oDdiiL0oQeCEE9PBp96xVWGVTtAYW4LgKYkv0VroP90ZWj1InOK
	 1ercHEpFMKtwzhRXX+iAAVdqIdn3+SgFeSB0A93Lk8kL/zG6mGrkHixfof2Zi2rarjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
	b=1A8NrLqeFunIzMKgKLdTx+29Mt+EkxI82yQXhHWJItxXXWHY19D3/IkZcU9NjkMpT+MW
	 xWfUGfV0GWVD24YdeUu2/Dx3JhWaKwvmP++5mwijobcB3fe6GSQFD50cPTRUhr9Bf78yo
	 5m+OhFPHEGB5RZUkFCeGM3ryaM7DGZS0NUpQYwowzcvc6SstXRRWlbqR05AVZ4Pkxl8bp
	 c0Jgxb909vzmYrBjY7+Al3o/uEyYFxU7ajixfXRmcWg7DWblZeP8I15Pl1LFTbnGSsC48
	 2IsJ/sKpwYrqorKD8ripOH3qL2jnRkTsJFnNlPnCl+jo6mF1AY+tYqMEP9zBXX2sx0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BzroyGQE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D874C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BzroyGQE
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so426031cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587742; cv=none;
        d=google.com; s=arc-20260327;
        b=ZqXyxzNWGhLEHuJTlgBPqGKAWVige+ma4xs8SXThIAHh0XhtDzhB/dfAxXEL61RCTh
         RMQaqdCzeqYWX17hT3ZurENQxN2c+mBopKBj4A97RW15hqTZYnd5RmGdbcqQqIJ2JH4A
         BD0UJmLT47AA8LhWecdltGTCW7BWpzUTbb435SNxygf7ACaL+FRVbARJddPY1GBLxQji
         mi7fjthOmTf8Kr/Z5Lx18oNbLwsX7vtiTVGmUnrErcNvb3bXlHKuOsNgO7uOVzWtHC9a
         JDG0tzkv6k+ymDCGx4WRW57S9QQ+2Qmp39Tai7BoJ1jSZYscXTOJnd7kLZc6ALWtRiuu
         zwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        fh=pHXnmMqNQuErD+HBKCy66qkbmx1BiZum4nisDrQzO90=;
        b=O4920w1gmY/59X1gPe1x5Pk7yU43fplGCJmDuCOuPVbKHMzUgUoTngCbihDvgbu2N/
         InWhy8Yx9sfQu1LUWKHrJTBu3yskG1CCkPKwBZHu7/phxGGna73FLuAmpXPwwhsIddMZ
         24nHPgbMRucTOIhdn5dyxmmXCfBmmy351vCRw3yw0UuojJw/5pqYJ6AcmCJLeFvQyZmi
         RYWgXbsmbuXX8SnvQx1qoSRxbQV2DzDYXh3OS/20Sg4k9PABav0fENm9XSLNDVGM4z4s
         WdGq6tldfQBurPZFuJq2rD2sXKyZtFPGnXITXC8FupPx+g6CFscOHPAMq4VPCJPq6QyZ
         DSRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587742; x=1795192542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        b=BzroyGQEclR38tAAhozFMMhmB0SRz6tvHPqBp2ub7NhpVkg5b3TfyLZB6azeiSWCLD
         4wmL32iW/VAp77UJ6xll9u5GhVL28v+7f56VEFjbp96HkyuSuU/Wzy08bfeV65iNcFO0
         n/7+klqKK37IdN0wCxzailjWpQL9VXtEmPdwfJbcQMA0YOtnSE2PDsDkC9sSzzjJmPvm
         CbnQmii0HGehhLl5qAAXYjIdHes0nheJzO17DhOp4drrc+0nP7iQ4zwhjYrs+E4K0mhi
         2Visqqnt/V7IL6+HmTLckQ8jbv7qb1hfWfnDUSGu0BwpFuGuOS3BhOPJHEnWgtAG+yzT
         rBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587742; x=1795192542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Wvtz9D6vgbM+u/1wpqOZ954b+KYcK1dv6Mh68QSbho=;
        b=YcR5tkQbZdB0F5zL0PWt3qPZrtwJYbEk4P6lntAo+twrrAIgU0+GpIXKlHb7JduJ/q
         70lg2vb5jn4/DK3S7PMKHmX6WPDkvyWw6ByQzwVwpZATl8wDo8/GOQo0j4qqiUD0LWyB
         uFvPKPjGILdnzCEFzkvZa8McLgnPTFJJI0U5X7JvAR1LlZ99r8j8gTEmR4LQZirCKmI3
         T9JICAFlK8BZMlDhIY8BEycdJpMtK3EpDlwuC/iVCF8vK4He1rjD/rliQgRrcLHs68ID
         xZxEOEkFuGjXdIAEmlKZYnO1fZUPap8eNwdQZn+BvVRSZIjuZnfRnYgN7ppzEn/frDGe
         iakQ==
X-Forwarded-Encrypted: i=1; AL+hErHOK1eDpooqDMQsTSvRW3hI+kNVkM4uXM6PgX3sddF40kASeyqnIXjquC/V8sUOcbOJ+CzVrY95SuI+dRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WbgawAParr4YGOpEylPZd8daC+UepyWg4HkN+m9e67Es/4/Ds
	86XGziuqN7qIzGPDNi3X5c33sP5FzEKv/R0j/xKw0tM5XxcyUQDHwsGdQIJ6GIZJt4qtazZ3Hbg
	NBB4566i2qZL8N6FUTZkxzkEsn3u08EtUhS++PS/JVLtMYOtooi4dZu3zIT8=
X-Gm-Gg: AYBFou3aeWwSaCP9z9GsZWWqLEp0xFHot326BHUBFU/62HJ3FETkLCgJloMsy8YwLsn
	fHraTOC79nchRqZ/STOeQkvCxlQrT1x4WtbG/g+Apo95DJHadowlrYeDbrHrY5GVxoJzje7LBGg
	4ewy8TZjbQrBibPDV0NkPA080TBphmvQ4lZdU9oQ3Hw+ZA7ZEFCWBjWm/8NJWvFGFqbFgG9lV+l
	APKMVpHiVDgZYqkb28u0Sg7+Rf9SQfXaxm3pnaRNtRgSEKh3QNfElDGYTb0m3UMAEnqcuDEU7Sx
	4AKfCeTpP2I8+47KPv+1z4kDGArDeN43gIZ6rPD4vwuC+Rj+P3NLrtBal517Hr9yY7NQKucY4yl
	XmhAwY37ELrqDhabklf+ikHCbhD6MhrSk8m95zv5+bSe+dim/BWp8lzSlKAZ4uWBvK6rcpjH0+t
	cpxidIkM65VjXc
X-Received: by 2002:a05:622a:4d9b:b0:536:78de:775f with SMTP id
 d75a77b69052e-55b44e0a79amr14925261cf.15.1794587741025; Fri, 13 Nov 2026
 08:35:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com> <20261111174213.3526604-17-irogers@google.com>
 <avVl_JNcFqq7sZvd@google.com>
In-Reply-To: <avVl_JNcFqq7sZvd@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:35:29 -0800
X-Gm-Features: AclHuK8PfQbklhmPM2_Vg84I7H9O-DXLd-KLmS3zmzOFzPck-cWzjRORBggtnwY
Message-ID: <CAP-5=fXFBqUgsC2Uug0BDBLg2Cg6O8C9ULF95j7kd7npeUhG5g@mail.gmail.com>
Subject: Re: [PATCH v12 16/20] perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:08=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, Nov 11, 2026 at 09:42:08AM -0800, Ian Rogers wrote:
> > Replace tpebs_mtx_get() and its pthread_once() initialization helper
> > tpebs_init() with DEFINE_MUTEX(tpebs_mtx) and static initializers for
> > control_fd and ack_fd.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/intel-tpebs.c | 91 +++++++++++++++--------------------
> >  1 file changed, 38 insertions(+), 53 deletions(-)
> >
> > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpeb=
s.c
> > index 5cb090b27fbd..2edd8297fa1b 100644
> > --- a/tools/perf/util/intel-tpebs.c
> > +++ b/tools/perf/util/intel-tpebs.c
> > @@ -38,12 +38,12 @@
> >
> >  bool tpebs_recording;
> >  enum tpebs_mode tpebs_mode;
> > +static DEFINE_MUTEX(tpebs_mtx);
> >  static LIST_HEAD(tpebs_results);
> >  static pthread_t tpebs_reader_thread;
> >  static struct child_process tpebs_cmd;
> > -static int control_fd[2], ack_fd[2];
> > -static struct mutex tpebs_mtx;
> >  static struct cond tpebs_cmd_cond =3D { .cond =3D PTHREAD_COND_INITIAL=
IZER };
> > +static int control_fd[2] =3D { -1, -1 }, ack_fd[2] =3D { -1, -1 };
>
> Nit: I think it's better to split the line when they have initializers.

Done in v13 (along with folding in the __guarded_by(&tpebs_mtx)
annotations from the next patch).

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >  static bool tpebs_stopping;
> >  static bool tpebs_enabled;
> >  static bool tpebs_cmd_in_flight;

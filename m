Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793826586;
	b=GFpxz8TNLwAjzY7VmMioCtPfIK2echKPoiWbNR61SulR72P+VtT0g/i+v31gfMSDatsg
	 6SS+odqIffO0t2NwFBsYhIfSp1gEvJojzafOiqtf/xF+/h+5OpmonUboKgD7/CbrM7SyT
	 ccsGWUj3Lu44Y7x0YvH7MdTPbEPsnRrn2vnX/A8bfc7E4JaqLWvyX//QeJhja8gL3Rm6w
	 A5Ld5TeDtOiKOiC71VZmFJuDH7NJDPAqiMs3axvJDTzK/PtxTpIQsJl+um3hFjEgYqlo/
	 1wdAq90adgS6EsY8cbcazPBGbq+UDz64WgISXRHpAjYywwJLLa2RVppFDLxCTnMMdmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BiNdbumrOd1SkEa6d8Ju72ty6OWDEKr6FE4yt3e0p8w=;
	b=x7qCuORMtcv0XsIa6HdkQ4/fIGAAnIWyEFZRCiafeSw3MiZYGaINRpLjYIx2S+OXAa6W
	 Sj1jVHsjz1J5LWdvIQfF3YSTR8gqxyl0j2ySxs4q+Ay++tGlyGDmj596kpXh2PFFS1t42
	 swqxfb3Oqb13zlXMNodQO8A0iYfto8rFAJLwM26OiYsiMM/n/AeDtFdK9Lqc4SyMIsiYd
	 NHm8pFVrctxUP2vfoiXVJcJh8/Qpi2WgL9VytUY3wHpd+WNfEFJhlv6OOKS3WiEdgz7ua
	 v0Nipci7ZZ8wTLiWWxNHl8nBBVw+jj7FTAGjvGI7Ee7FdJYDIqLlNdkozi71j6skJRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRwj3MeN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C042607B9F7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C042607B9F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRwj3MeN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so1554953eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793826586; cv=none;
        d=google.com; s=arc-20260327;
        b=HhHKp3GmB9fZfdBhASV1xRkwEkaSLm8vzK28l2BQ1bG+jgMoCPeh+4RzXyonRXdXhE
         6qnsU3054eTOZ+PnQvGtcIPlM2enuEb5S6wk4A7Elgj1B0pyR7df/sqXIcrBGqTUgGLy
         Qc9awONLA0af6iyaiGE3mW0+nZelJcqw5vUtkz1iKBMekvcxWar4c1/0P9RadTGHPaj6
         YToLxjGglCAktBVn1fxtWv6pfbJckyVwUiUiIgsh6YpbSbUzG5YIriVgwr0+g33abTPw
         ngtjhWyvMiVHF8JVbLoLE815RXKYxjRaGqVYkIGd3hoMSKT0snr8MPjVeUnKjmDMP/fn
         ouBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BiNdbumrOd1SkEa6d8Ju72ty6OWDEKr6FE4yt3e0p8w=;
        fh=exkbna32Qkitg9et/dXOVkEU55sYRbJFze0gwFnmr7U=;
        b=cPPf4F7HUmRdPz+YUIvdrUS1vyr1Yu/A2Rrpds4rZ84fMLfYPmexiu86CYCD6Fq+u6
         GpbURjzOyHwI4Va8QxeCww7lS+w8up0GalGRF+S8t0uCcCUjy20TaPUPy6KzC8FHFgJ3
         BZQyn2rADoaWuRsCsQskLt6E+UaqYn3Rek4m326Z3yR1idfg7sj/ztdeODjHmqh1/y7y
         hsdHih0vkAtvt0eE7g+BEIKUiO2G5/Gm75vBlT2rEPg5kNGY1JyOkqIZWaMHi3FKJCo0
         2afXTiEEA73mP2uTxRGTYLUy8waguC7i5nT1y7bcHJ2V0bZxRegoLGNPX3haaoCCZts+
         ohKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826586; x=1794431386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BiNdbumrOd1SkEa6d8Ju72ty6OWDEKr6FE4yt3e0p8w=;
        b=rRwj3MeNjWM0dHqE/pWNUvXz2va6j4DIyFL4slC2zvEoEsmnqhlbQIm2z9/YBQtO4Y
         mPuiC1FXZSSOwRzAnULW6qnAQLAXTUensK3N9qFZa2pcRQNE5FouU4TwO8oqDf24HpRR
         0KLZ2+AVv6WB2x/nQ0Z/01AbM3bov48ESgFJm3LD+bFVp+7COuG1dLDpcI03V93Chw/M
         1LygzRawRcgb2xYSBbj3wvgUBEIVJtk0Ds4+YYCq3gMkh8HgBmbpsma1Zsh3JBgaBX5A
         7tTlZ9YjcX2+ZRU9WUh2ll+H057mzbqdJ84SnYCk7I+Fa8yhabzDfV3K0ANCId4Iiaao
         rnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826586; x=1794431386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BiNdbumrOd1SkEa6d8Ju72ty6OWDEKr6FE4yt3e0p8w=;
        b=2LYav8qO09JNwj8S1YsPi0yKlNucPJT+Ro/F4iCUKBCfWz3hCCi1MONh4XxDVAxrRI
         a59Xdmb/z6WLa9pdBSfRezp5SZysqj1DMy4jXfLzK5zvBvRMZ74awhVOJTVYYN+Xjd5v
         994x0MlywlCcUbkS4550W27wGCy8/OaqSlWRNgjX4kuKfpEVUftsWdsN+VkJHqpw7YGC
         7EuNiBSx16wmOydaygedEUAN8JNhgJHp4kL4qSw9iYPS9/duTvk7KO2UGP9LQg2Fgj0J
         9PmWBaiubSnIkAN4n85AVqRfsnZ4Vlt0t7OrgWkNn7lw5jOy2b+X1KE37MXXhkQTN1Xs
         vhrw==
X-Forwarded-Encrypted: i=1; AKwUvByAySlHFwGERqEUAlpuzVHBCbuWmQMv9rI8gOD1NpAupHzK4LTHOhEssMe4nHtj0k2+zyA13Ixav+XUcYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3QnreGhl2oSjlbVEl98snmnXd1HinE1RHDsvZ3///6wZx0Eg4
	j3oXIrAN//XvcBVXIllkRJbk/QCfRjsKIdhxkECxLTRO5jjQos5Cc+kriIbQeHhckXXbPWu4yVY
	/yWjy+XxGKOo8waeKtvpDACzJ+mOw+aA=
X-Gm-Gg: AYBFou2luPxQdRZ2hEzWeu5QSbSH6myTX7k9pYKiUJocqz5GV6F8Ae1qGWMO5gBcyCK
	URD2P+/mYnl7sL8edG37h0S1Q7RYknxfI7WHVZlQVH5Ss2w0bAyVBodeKJ76JRt6nWrbkelUUks
	x+YToWn9zu805QbUADZqH8Gz4Xqvf3kJ1zLywmS96XmhltXcMCxbjGwDk2slh0LwJBCkRGwpt0B
	S7BLbVctQeizXkV26geRD1dJ0ZQWd/3jbXuMQscYSXd4K1O7AnUWqX9smz7iZ38DjfO6KU8ZmY+
	qLdF2AwUWQ6OWD4BjfURp0fDb+Zm9hlEi3Fxp+qUUSon+TlK3qSHJAzzbRkhkDIyqJn+mjOS948
	RtjlIFJo64+I+QyUwgTLxgtUj7Z1KOqqugFLIb/DfzSKWd53C9UiW7ELT+ZUBiM0tq1cp5mgswd
	p89HefBgfxeByYfOQ50kk5Fz/yZ9fO2V2J6TwPpyCCL4TT11V6Tz71DzQ8Uz8Z5Bs0b45e7FI4z
	GkkK+M=
X-Received: by 2002:a05:7301:22a6:b0:369:f9c4:1fda with SMTP id
 5a478bee46e88-36a42489041mr32982434eec.27.1793826585524; Wed, 04 Nov 2026
 13:09:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-perf-output-v1-1-df33a0368cf2@arista.com> <auuZHBawk2--flHW@phoenix2>
In-Reply-To: <auuZHBawk2--flHW@phoenix2>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 4 Nov 2026 21:09:34 +0000
X-Gm-Features: AclHuK-D9hZgAv3P0BlPu9bgWKZEFr3G6b2hTXFkQu-_WGog5aWZAYQ8QHEOYEY
Message-ID: <CAJwJo6bKK+sOwwj3iaxh+JA2+EkZ2HHhmfyd6gaNQYiQoQGxWg@mail.gmail.com>
Subject: Re: [PATCH] perf build: Override OUTPUT when building internal libraries
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: dima@arista.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 at 20:44, Arnaldo Carvalho de Melo <acme@kernel.org> wro=
te:
>
> On Tue, Nov 03, 2026 at 04:55:21PM +0000, Dmitry Safonov via B4 Relay wro=
te:
> > From: Dmitry Safonov <dima@arista.com>
> >
> > After commit 1572ba36fbca ("perf tests: Improvements to build-test
> > performance"), building perf with OUTPUT on the command line fails:
> >   make -C tools/perf OUTPUT=3D/tmp/linux/bld/perf/ ARCH=3Dx86_64 LC_ALL=
=3DC CC=3Dgcc HOSTCC=3Dgcc LD=3Dld
>
> That '/bld/' is not reflected in the next line, copy'n'paste mistake?

It is, yes. The path in the build system is quite much longer, so I
decided to cut the noise and cut it in commit. But my eyes have
failed, and I should have re-checked it on the short path and copied
the output, really. Heh.

> >   ...
> >   make[3]: *** No rule to make target '/tmp/linux/perf/libsubcmd/libsub=
cmd.a'.  Stop.
>
> =E2=AC=A2 [acme@toolbx perf-tools]$ mkdir -p /tmp/linux/perf
> =E2=AC=A2 [acme@toolbx perf-tools]$ make -C tools/perf OUTPUT=3D/tmp/linu=
x/perf/ ARCH=3Dx86_64 LC_ALL=3DC CC=3Dgcc HOSTCC=3Dgcc LD=3Dld
> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>   BUILD:   Doing 'make -j32' parallel build
>   <SNIP>
>     TEST    /tmp/linux/perf/tests/shell/base_probe/test_line_semantics.sh=
.shellcheck_log
>   GEN     /tmp/linux/perf/arch/arm64/include/generated/asm/sysreg-defs.h
> make[3]: *** No rule to make target '/tmp/linux/perf/libsubcmd/libsubcmd.=
a'.  Stop.
> make[2]: *** [Makefile.perf:827: /tmp/linux/perf/libsubcmd/libsubcmd.a] E=
rror 2
> make[2]: *** Waiting for unfinished jobs....
>   MKDIR   /tmp/linux/perf/tests/shell/lib/
>   TEST    /tmp/linux/perf/tests/shell/lib/perf_metric_validation.py.mypy_=
log
>   TEST    /tmp/linux/perf/tests/shell/lib/perf_json_output_lint.py.mypy_l=
og
>   PERF_VERSION =3D 7.4.rc1.g45e09a6dbb2d
> make[3]: *** No rule to make target '/tmp/linux/perf/libsymbol/libsymbol.=
a'.  Stop.
> make[3]: *** No rule to make target '/tmp/linux/perf/libperf/libperf.a'. =
 Stop.
>
> Minor stuff, I'll fix it up and apply to perf-tools to send for 7.4-rc1,

Thanks!

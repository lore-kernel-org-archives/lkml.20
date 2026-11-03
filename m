Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793738176;
	b=j5PV1U88lALSoGtpoZTv3yI/WdMgdUl0FgqMJwNYY+pgdCcOmf6lSwuwHkM6/WBWjTBU
	 G1ZCFWzxS1jzbeDPLiTQeg/oboSNU/QROCoGWQcSmw+33+GOhEYNZOr0vDz1NO9oRy19O
	 fXUSZvAIF/db6BdVRSjkn+N6luWRp3MvdztPdzC9MbBRQHgPbeOWAqjDidDdRSZ1/HGWb
	 0sfB1asaNEw/GdxmVK32uUvWZLDkh5gM2n+U3tJFgK0YfZHnWIQjjy4QjmXd59yvUBYQj
	 WFOLySZPYDIuNkLzzoWYIto+twQIqK53W4YjgixCWMTCblu6ZQjM9nuaYCf/y0UiU+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
	b=3jfzlcxUW8Q0oL5CddsGRi+pLHJEuihRmZELfd3tl99ap82s2IQ4APDN8eXW6Ys0Yeis
	 KNMBpBkLzSlemXdGi3xRBBDw4CZ8Z+Mlo5BMvJqb/KoMxdWPbK0ILUeqQbCltCpWB0zWx
	 FoYlKNgeEmKWjaY+yjo1UmpvC0z+0akN1F0sr9a1bEyasFyqvRg+o40sR4WwbydcrZmpv
	 j5HTsdDnCa4M/eGsU/hT6FOfzTWM2rh5/BuCMCvVH+fHWj+vb/+PJYeprRaaU4h7KGaKs
	 kXh1AzGfLWKfhHpU67fxDv5lMItbO5+2CA8VcsBw483iKj5jERJ+fdE5VcS8cGvRteg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bf9JONb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E245606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E245606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bf9JONb3
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab53a99771so200181fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793738175; cv=none;
        d=google.com; s=arc-20260327;
        b=jpSXSugByKh/Kvo3D8N1XgGJHHXAqEf8RCczOFpQvNlHqXBAuL0qV3m/Wi3a8B7oYl
         mgDWORyvT9Sltv6qucg8DJu1NgXeA8UwmhtJwKsfOkX9lNetUzgwWiI2RIZVT3vd6cWt
         wbbpz8xKxEEcrl6B3UW0zxZ2igmI8DQtrZaJeDTCuKm+xjscaZ9Q9wDSsluiY0qwKQnb
         epGC4yBE9SxN4nkvOouzlfOLyd4xoc+0LfHrYornOSCkfp38u/JpdkzOKKeCR1M++2Cm
         Z0jnss/WiWBHwYPcuYh5q1fOiU2+EF9TFGjs4hLmi2ukrQ4OrZ01AUXP17if0idGPl5r
         KpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        fh=FYFB1CMqsaz9WalrNU1TjOu97HCwAEyrzzEd4XfdZDU=;
        b=k52NajoIe+sd+TnWNDKBzEb2/ZNFw7T5CDv13ZZV34VtW2mT55mjEmGcJffBqO2b9g
         VAdt9zPXIk2CoFvJgaXnzlFJY3BZMoNHIpE76KTXqkFiC6r/J5LdHX5r5n4uaLS0uOi9
         ZNCc9wE7yFPpNYgn2t2+c8WNoxoXolI+shJsaFuLpHZA8GBsB2pQZTF4e0cQAMAdHAt8
         CGeNxm+n2NQEBUmaPZh0AUSO5XFuNpHOz2M6zdcXbedTNJLQreSkLfUCKw1sNPXNyco5
         a30ABTIvPqoLTqcoKBdVLP3Z9yAbCZ3NbQvdXbpnYiSvyxAOgp3t1915ScozsWFkSrCL
         ihGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738175; x=1794342975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        b=Bf9JONb3tnHnffKYegeTecqFiyDWbdgWPTHUTayiSdHMFN5ahHLEdrlOc4Ka2yqU16
         r0wPdQz5WWPa2G8gHOqWH8WQAr8mDq1kdwkoPYPNgpyUTKN0ONz51fv/I+1MVfySyxip
         tC3LkYQD2rm+4thrZvujp/3VARnFED+6alYiLfHH1AlxX2CrBTURgD8BuzlE30WHqMks
         3jpHP549hG6Q/+M9EffK4JCNFIsFomDb+6hivIi/Kl9BWD3Tw/6FKwk/0A6TvPGE9HlW
         Dn4vT0JDBF7X158LdSpAemHTLXG1PUX0fanexjTn54/EW+UTS3TP74uiomxJHa2uLc2T
         mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738175; x=1794342975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQ4+oRgLtbqlKeiqs+JELHHN3xsV9CKXX0CLSPpUZjo=;
        b=XfK+f6tLKandu8coCDvzUVzwhTwpfY03TDVmTqu1duO0FYqnf3RdczFuoSITQj+/hv
         7NLs5JM/c6jK7/IP0OkC0ReVzYmMX+Tndq6LeUzOJRsTzSrtIO8DZ4zuPWtVXkkuzeVQ
         9PJxiH8n6OdJcZTizuH9A8V3hugi2IxtAVEiZHmtwQAr0tnBxcgFCD4bLdsTWKt2uAEn
         8P11fCoKbPGjwOqE7f5OlyswOSL9gHQ4YxXiJCZFvmWbzhFn/E2ZAh7v4B7IHzIJ2qf1
         wkW0/m6oXUe6iFGhTImNCq1NF7n6gQY+tYw09J+1wjGl4CGso5p1ah9o0Q4Q9x0ZLZPt
         rUwQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8NNbvbxnR+MpLZeth7f0smlxZ5Y0u3JEH6YT6d1/EI6zl/Auixg3U5tDS4el17xLEVMtkQhrjmkgwMz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T2G7/UCUCzV4GLL5kPL0r0DGHboJI31685IMMbg+9QRwj4Ttk
	ywv9XrBqPfZAjFItrl4MMtyln4N2KRPKYKXt224JFwUHac/4/TVWqtgV3Jg1Sq1ekKkvrG9qfuO
	7UoiQiO+n30R+S+q9t5H2yjwcbydjssg=
X-Gm-Gg: AYBFou0YfO1DdLmwpMMBf85xqhamFGjLswSRHuYivSx5LO1Vhr/q5dLJFC1r38Enjbb
	N04m++1GLL7Q9gbfHOpuR7pIiXQd95cI67ukTwhl1hZgvi62a1BaLi9j0/rjp6OyxEBRWazXXw/
	IAoU5rGy3mh5iiwRMDecgAjlHWyaifj6rU1vv3xQ1WYNeyRAisUWdW+HPL+7Lsn27HYqBf0vJhL
	ALeoN6V1VBu3B1Sx3FNZe2cEQuxpxnlthXf/u/7onDeIG5LftPGaFtsvq3KBVum7oPcIh6gRJA0
	fuVn5kxoSVDpTMuvFoE/dA53/XXsqL0zAVv7vCNrDaTVQThcY5i1eRnOYCJq1roWx+8FAqC7V/f
	I6SU2S6sAPCqhx7PCpOtqbYjVstUl+IJAYa9+Jrg1SimOmu8xyhyYXB4frBmbAI6OxIyt0tzF5u
	IXUIPKaHlvAFZ0qxxfCB3LWcRumCCQB7fgmEvY2sN/8IecI7m3fxTJ
X-Received: by 2002:a2e:8a88:0:b0:3ac:4ce6:8b73 with SMTP id
 38308e7fff4ca-3acb7acf227mr31681581fa.22.1793738174621; Tue, 03 Nov 2026
 12:36:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
 <20261102-alpha-profileme-v4-5-61e00f5e1da8@gmail.com> <CA+=Fv5RgTNGzApgq-YcPZ6u_My9-c8T6xMjb-_yuQRV5C53T7Q@mail.gmail.com>
In-Reply-To: <CA+=Fv5RgTNGzApgq-YcPZ6u_My9-c8T6xMjb-_yuQRV5C53T7Q@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 3 Nov 2026 15:36:02 -0500
X-Gm-Features: AclHuK9vlMkzNd2fjRaApLlEuj1lZIne7iaoIdNdKx6zdWRN1ZXEG5eUPUtd56E
Message-ID: <CAEdQ38Gd4sDEtbUqSoy3QsFeQb46Bg3CZRzmPiGFLbSqLpxG+g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] alpha/perf: implement ProfileMe sampling
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:41=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> One remaining question, should we accept precise_ip=3D3? For a PAL-mode
> PMPC we report the interrupted PC, which can differ from the profiled
> instruction. Should we reject level 3, or skip those fallback samples
> when level 3 is requested? What do you think?

Good catch. I think rejecting it is right. Level 3 means "must have 0
skid", and we can't promise that while the PALmode samples, and a user
PMPC in a kernel thread, keep the interrupted PC. Dropping those samples
at level 3 would hide ITB misses and redirects completely, which seems
worse than having a little skid on a few samples.

AMD IBS refuses precise_ip > 2 for the same reason (its fallback when the
RIP is invalid looks just like ours), and perf's :P falls back to 2 on
its own. So cycles:P and perf record's default event still get ProfileMe.
On my ES47, cycles:ppp now fails and cycles:P records with precise_ip 2.

v5 refuses it with -EOPNOTSUPP.

Thanks,
Matt

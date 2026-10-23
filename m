Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792773383;
	b=zXbDGkcfxM1Sjf+Dq+SSBJfXpwwc/FuX0WExeLAmMkxk5K8Ubk109qhAYtxOUau+QDZR
	 lDGZYGySn+gucLWaPqhnt0e33oWPgyv4BQQo4gJDb9jf8rKJ31ED263NoIVIro/VJm8R7
	 0Gy5S6u1Ry03EZCivDhYgIEExZlgizIDkatsKZDrBB8kzLPQGTivWakkRInymqxw18SuO
	 flnv786M7nv3ot+X/uhsxBGCL7dgjlzqZffwyqWXoUxhpkKhdA0qsKFnydrqwLPLRGTNu
	 I/VXOnws9Vy9e6F6Z1/89xG0lThQ84/RAJ8otF3Iz8I2jAQ/UbtppLN2fn1jlo5GxRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
	b=eI0baEzqj6LqdWGjdhWOjQva0g3JpjsheCxA8GhAhkA5MSkg84P1AXP7jBweX7FqME3M
	 aA9juJDPZFIL84X4ZQg+ALoQhTXdOmzexOHwTSlEhSkov6CtfmgYwrw5rM28FFboT7oML
	 PAScZ00h2ST5GTSdBvR97m1BPBw3Of5zKItHh3Z0wdhLQn/vNSkGQWFKdLxgVp19RFeWq
	 33UJrzxa2M3p6dg/uZxycYQMKVbpB4sl5hQ4MAVyXwnCDRxmh9jtUQCnrryW6waNiLvdn
	 1XjbeXWIFYCR/HxRTI/LZdvU3bhQwieXl4g50bR4iivvH6NbHccLc4Rq8rh/l/KZxlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="kYOnhQj/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C8606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kYOnhQj/
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5337c7b9937so373651cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792773382; cv=none;
        d=google.com; s=arc-20260327;
        b=TemUz6nZRVVNG+E8pmaozjtmPkNxWimv/Pg5wUbuPdy+9h+CvxqYMJ3+GyUhfGkOnY
         i0jGi7ifzxu0ExWTmcrT9u6wqQi6yNYfJT35fGSd1NLhXTxUmKjD2KIGF2HthjVogCyJ
         j8PY0Dg88vm5OvPhNtWdN5V3baKszo7cksg1iYQygBIgPxE86MYUAvBgTcSZeV1pPaeD
         tAPUELYeehnO3pYgJWqQJ51FhWYTlLh0HN/XED237bOiMsUVHZWKdpEgUW6PlqALHKCQ
         l8xAP0Exgo/R92JCnm4wljMFqNT3qyCJ4MqwcKHl4uCKvUdHvZhKleFOdxtOT7fCh+Ho
         iVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        fh=65U2zZ1e40f7BBNBCRLSlo6/zqVKLdWRwap4VFvww28=;
        b=RkeJ+I62Pq1RzPuJ+uh8oCKE6FeV2E6E5vKHpe5fkw2VUlY6IElkaEP56IZxn+njR/
         nUXM+8HBPIzgFwvKMCBrAlq0cn7LAc6BN3XwHOZ3w4EmtxLmjJVpB9D9i63ts2gGD0bA
         YXPhNqZPIMbY3o3amX0OY/nJJV6V50oMPCBd3NICC9E37TPO1hfgSvzNiOcCeiTN1uEw
         1N/Y59klfhDIPpxNz3fFiuu3iVYyp/+zJ1Bj6Plw+p1t/NY3l5gJmUAQvbIs7d140WWu
         hnU8122IfKqHgyiB3OHv1ClcZ/JnpkqOjfgp0qZjfk6NQudKEAfGcV+fxu5xN8b4jA08
         rxRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792773382; x=1793378182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        b=kYOnhQj/ogjjwa1uKOTGZH12sq2xwa+4X/n84jQULPO1tiJEQ+DcHPSXjbvNJYzDPl
         Ect/kvPL5WfJnQDD6Du9tBsWOGFs23nErQ6yH0+Ds1KwjyaTLjowTDqska7WXWMpTfbc
         7fAbGq++2EUHZo2NZOd5f9K+/C7zWW8bfBwsU5tmnIiSrEtnzhtQkqw0atVCpKQm6kb6
         gwhEe/BV7ufIQCa1oOwB0WpU6v8rjSQ2aLE4aWl5Lejko7RK1GmIpd3W3J9hFt7YwTEC
         kFKzZTQn4I6Cjw/VJ6Xe86v0UGJlLCr0G5hmxWmR8BQ8scko4GKol6TSVLfwDgCMSUMW
         W1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773382; x=1793378182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Usf2vtqHFMLa5VutOOQ/gk9DwHwlTcl7zL/PTMHYhxo=;
        b=qpWhD/eMHkuS5otiH6t83HmC2uPikqXF/ZFT6UYfwcrfir1jq3K6Dd4sUGT0crLArr
         j7FVU5LclC4GBf4v5xegL7oPTUTyGRip02f7BFMux+v4bqhq2N1hg1Zx5Th/Ru5bWX6C
         zzDIsB525pZ0gQxBSbX313uZvo/98mmampK/QsBHDKNcNRnNDNJdSJ6yxxD2tqoCImvF
         1AYGCIedQv2FoTEq5i6JpPzguAkaBUX7NecSsTpHm9OqnzWvWfzfVs6o0D0xJF0dbdjI
         9bMOFQ6BBUlEi6SMRFui68AX98fNtNnu4GCJLkWOZadi6s8RvXYXcrxZL6v3UOE0caBf
         KrYw==
X-Forwarded-Encrypted: i=1; AKwUvBx9P6pczEUq7A1sRBhBM+MboMyZZddmU6VGBhgIwn3l4/jyRFIvT3UzmB6vuJg0tzQQdAq0UfXj8OD+Cao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiGdIP46KxpKZpy29AGqWZuSyDTUZm1wXJ926BsPeeY3GZM7SU
	oo4M/UC5qOORPXRVRKsPomurB+BaAWZ4usfUZNup05qeAiiBHModBQ463VDBYmQ0nKQ1H3IDRrE
	U0/u9dkRkzheVsJQNJP3PVDfrOfWnsBFzRiAJbzYg
X-Gm-Gg: AYBFou1oeZwnJeA1wy2InXOS4nLlkecajP8UscKzpQPv05SB08MMnK33BTzimp5jo1x
	JZ++gZJI+2/F9nHBsXKA+sfprEiKK6UuiWYb/esLQxL/RgKR8rR58I0OVFzPf+YVhrQJ9grNezA
	1cwsvyBtZJS28CLhj2vHPJ9eL2Ku65/oNex0tvx88X/7jdRcY2jBEHI4NNxSwrJ0b/A6Rrkdo6V
	qiqf884DgOUX5cOatOI6ZmN48WMzfij9hszaLhc/zqzgwmqmdI2H7smer31K0qCV+BqZi4KSqhV
	XFOQk11GSHB6Bh4pk9mAyRU710rTN8jWINK53s+Zg4uJwRDfhvABmuNKy+SeqmG7Riwa7GWRU6i
	ayNOGHGQ13qisECJ/6X3tEHqmDakqstgTB4HBfA62MdgWHULL/lfjwuqR61lOmkUFYA==
X-Received: by 2002:a05:622a:5984:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-536c204fccdmr19376021cf.0.1792773380998; Fri, 23 Oct 2026
 09:36:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
 <att_boYgsUyMVBQQ@gremlin>
In-Reply-To: <att_boYgsUyMVBQQ@gremlin>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 Oct 2026 09:36:09 -0700
X-Gm-Features: AclHuK8WDiSB5DLq7nz-VotGGBIQIYDZRwbhaBSVewZSiH6-vm_k_QRci59FMgE
Message-ID: <CAP-5=fX2+o1CCV7pEx9=CbAftRse1m5uTLmrTxQ4NWrxd_SnTQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/19] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:48=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> It doesn't seem clear to me why you are constantly respinning this series
> without feedback since v2 (AFAICT)?

There is a minor build issue that appears in the tools/perf build with
kernel header code we try to keep in sync between the kernel and
tools. There was discussion on resolving this, and I believe this
settles it (the tag was carried forward to the newer versions):
https://lore.kernel.org/linux-perf-users/CANpmjNP=3D4T4pRpoiW_Y442KQbWyVtEC=
UD3_SYs5ZYrdwkWh2rQ@mail.gmail.com/

> Also not sure if in-reply-to is perf style, but neomutt is struggling wit=
h
> this thread at this stage :)
>
> Anyway, it's no comment on the series, but my workload dictates I won't b=
e
> able to review this unfortunately, so could you take me off cc- moving
> forwards? Thanks!

get_maintainers added you presumably due to the kernel header change,
I'm happy to drop you and stop the noise - sorry for this. Fwiw, the
different versions are addressing locking issues the annotations are
throwing up when adopted more widely in the perf tool. Whilst I'm
using clang and internal AI to minimize this, the stochastic nature of
AI means that new things pop up from Sashiko.

Thanks,
Ian

> --
> Cheers, Lorenzo

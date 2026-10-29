Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793304778;
	b=PPMLdvGRd1nXhe94U9TT/BePMigfLfEhITPjh7uSoHKBoNEmj6wcVtFkV2Z2i65znmbb
	 fU3eQjzG8AbHLzkbNgaVzq2ofWLuCUKeeopxCFhyEkKed8c/9mILd+JOU+/ZLRzbR9Xqn
	 mv8THXRfqtM24JMCnYnq6noRVKOd8MUqDViGfZFE/k3XMFY3STbPldXMZU9xQFOQB48ZR
	 QJbzWUoZC+uFpYV25iRuCxrZdISYXkCJMPSoA9DRyXXn4rG2fQ9ncvLN3w8/fpxcTEj5k
	 p6OB/gAJXwC/xHhdOurGiU84oPuWM13gm9lNccXkY72urfgBGFR31TLsBSeLModjCQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8bWnlcqpeSxNOXcW7N0zFPyW3Tqj3tlZ/k1Vs+K85mM=;
	b=AvaKM4bb3rybnR/3gN2/pvy9kXo+pCAwP6pWeJZEUbWfZUFtkpeR0l+U2JGjlCsRJuQp
	 h47MPzYFQ8cETb2NjN7OyNjw/6jLKoW9cYMOJlHBbYB68ybOQd8Fr0wEAD9n6hV85DTIv
	 w8Srmn/9c5XYRIbbgYd+1SIEcIvHfZL0D3disaBrtHdbxgTElXdINb+f41xX3LGvisRUv
	 sMnqibIkqPXnzZfUrzPiWTHPhnByCf93iRUlqFRYsC+5C6HtsFrWR7pTx4uBqTADsl8Eb
	 r6mxKfnjwCi4vYfJOOzUTae/w7pf73P2K0EsradDnyfKfgqZb2WWLWPXx9XfWfLwGMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ecciuTBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F01606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F01606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ecciuTBC
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5383c97c8cfso14641cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793304777; cv=none;
        d=google.com; s=arc-20260327;
        b=F6g1FeLpaDF4FahXV+6tzSzmWkfX/b+dFpaid9DmeEuXFkLwfoLTg1aszK5gCq+UWv
         Ap5Zy8ABJ1My8ylrvwpxHc14oeQASy1aVKuSAO5NqBLS7+pzQrX3yPpwDeDRux2O3bls
         iICxrPhaD6mxkOr5p8JLsic2HpjjgZ3K6IEU/qEYdymnInXPnWvg46CUJwNZOmTtdlsu
         +fdSGJZ82I2/IFD/lDbY7cAF0V9jrr1gGxR3+Uw7U6nzPu+ie356fHzaLn4GundTprG/
         2/7dvcgXpHtN1e+siotBWDSXxnvTBItMztvM970e2pF/eqUoHnqpMnu+JjM2yhtzaFow
         pOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bWnlcqpeSxNOXcW7N0zFPyW3Tqj3tlZ/k1Vs+K85mM=;
        fh=2t/WyI97RJIdF2BjYLMcs9ANvVPj8ChCnz6xQ4Z2ty0=;
        b=ab/LqKFQ00oEUhJAxm3VoR/Y3L5VOMVzjXvqxjQVaCPBzzHdq3Dpigq7OM17rfwyzm
         XPyIE2MfwdbT61S0M2+Tzm/pg5kzuz8XojJ0AYl1x5E4OJ4FMDSXE3KRrjStmVuJCJYz
         zjjZggj8an+97yQXlJtVzzQEcaTa9USjQmM3B37raaYJR6lAz165zpMvqa00llBWgcpW
         QuMxna8pZ0CtgKO5OL4o9M4gAznW7Noa7OrTRCi8VXfCb6rnDppwfwiJz9rqaQph6ZIW
         zLBOtJL/RGnJGk9Aqac6eKm/gE7nO+zc8g+YVYZAQ368cZ+OL9av0lUpZF30D4sphm/d
         WsvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793304777; x=1793909577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bWnlcqpeSxNOXcW7N0zFPyW3Tqj3tlZ/k1Vs+K85mM=;
        b=ecciuTBCqVosdyC5vZpxUYD2sVTPc+IBA634hIVo2LP+m5WGZltDkR8OXGqSltutPL
         Q1xnmtM9qmFE7abAcqoMcltyKO7zlJiF8gU0T4VrEDBdaBPXePHwzw83gzUufxWCikRY
         TYLck7Swry0p26rMh6t0Fb4yyVcCWxCMUqnli/tcNu/6E0chnqAnSVDJuUhK7ihYpnaA
         nG1HzLpOMXT6oiRpKvIv45Dm9NU59XvHr0sx3jHZIi3+6cy2euRk4Ewn3Bnddaz8IRXr
         /U4awhDvQI1p7iCJSMoti1VsJXO4sBq27nLxn7nJB8S8tS7VdjJiUl1ZuLTEm763lc3V
         lb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304777; x=1793909577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bWnlcqpeSxNOXcW7N0zFPyW3Tqj3tlZ/k1Vs+K85mM=;
        b=M8D4Vw7hO+31Rm4o4x52vYEx7e3HSkwUNLFPkwRXn9Vy1tog6iF4BLTtABWqjTXchc
         nfJRykiLBDjx/Sg+0DON5GUyKzrsXEkV74QVpahli/pVNUIfk6w67Ti64kvmnz4aakep
         JwVQU0xXwNeHd99g3X5w61qhI8hNHx+Kxn8cXb0Tg4u6K6HGriqwZkr4ejlm9CsJOCpG
         Uf4tf1DDK/XWSon1bjiVNflh27A5kLIYKnMDiUV/6zslptvvjHbtI/SKAo0Z14SB1+J5
         odsokCCjxUG9h2/CIYqP2RTLs9UGWskGIqi8BANwJ7s0Bu3tuZmcRqv7RiblgIw8v68o
         rdUg==
X-Forwarded-Encrypted: i=1; AKwUvBx6v6hXsAog4g0+oUnEg6qzcx+wfu0DPyI9sbwoDzqJqq8hMQP60gtC1asKnCysY9KfQ5G6mPSDdXpqayc=@vger.kernel.org
X-Gm-Message-State: AFq9FYINDEqEul/uBDFmOz5C5cvKIhCheceRGtvp7sFI/yhjLKa+Aj9F
	R/dRtQkb6yEQPngu5oMdjQint3SmfVB/YpboOL0kzOfENDcrrCOSoc9xXQUg1Lej09BUgzlzsv9
	LbLvkyuUUN/pGU9olA/gmE5e4iIUHLkCH93l8YbfM
X-Gm-Gg: AYBFou0wLxShNKImOO20ZdwzWn+QmyL1yExBVwJ875MawzUFml03R4f3FAhqlAWGT0D
	nyU9qDQupc/ycHJCDScG53WdD3elW3fB8ehWFhp6VhRH6JkAc5tlGziP78i/acuftsr9CVja+9E
	svllCi9fVZZ/d9uXzxPwZ0uA3ivzyQL0Ho2NhmMJYX5WTSRAB9vAvm11gyOKhEdBQgS/LnLOg+I
	h8iwukqOnmBNyJ0oiya+L121tYUCL5v1Rdi4ohX3HwpWDAb5xgAYOURsRZMeR7u5TsYDoblC1ku
	iphhUECtSq4a+5M8QVTGI9t6WkRFM7j9gidWmExBqmo07YUEKz+FKU3ci+bqvEYM5oqSklQCniI
	3AJnt9i6vBZ2oISQ/ekfEYdfp/b9uBSdI+bgtJ/YBLctfbFKn/yfqtWlbV4YHW74Qjwg=
X-Received: by 2002:a05:622a:418b:b0:530:e335:4ef with SMTP id
 d75a77b69052e-54129c3a014mr30493781cf.2.1793304775935; Thu, 29 Oct 2026
 13:12:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-perf-tools-next-v1-0-a75a2b64a15e@akamai.com>
In-Reply-To: <20261029-perf-tools-next-v1-0-a75a2b64a15e@akamai.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 13:12:44 -0700
X-Gm-Features: AclHuK_VHX_q_V8G3T6Pzc6cduP2r3fHbp2JuReLyIFbTTF9f_ewsz7fsH6vG9s
Message-ID: <CAP-5=fU=rb5f0X0ArWj3JRZDwrwM2Q341RPG-UJmYX2tUSpUbw@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf jevents: Add IOMMU PTW & device entry metrics
To: jlefkowi@akamai.com, Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ben Chaney <bchaney@akamai.com>, Matt Pelland <mpelland@akamai.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:06=E2=80=AFPM Jacob Lefkowitz via B4 Relay
<devnull+jlefkowi.akamai.com@kernel.org> wrote:
>
> Adds AMD specific metrics for the IOMMU with respect to page table
> walks and device table entires. The metrics cover ratios, rates, and
> percentages with respect to any event which might be triggered during
> a page table walk or device table entry lookup.
>
> The metrics target Zen 2+ processors and use the standard amd_iommu
> PMU events. They have been tested with a benchmark C program that
> purposefully thrashed the TLB as well as with 'sleep 10'; both of
> which work as expected.

Cool, perhaps consider contributing them as test workloads:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/workloads

> The changes are split into two patches:
> 1. perf jevents: add iommu page table walk metrics
> 2. perf jevents: add amd specific device table entry metrics
>
> The specific metris added are:
> - lpm_iommu_dte_miss_rate
> - lpm_iommu_dte_lookups
> - lpm_iommu_ptw_reads_per_tlb_miss
> - lpm_iommu_ptw_nested_read_ratio
> - lpm_iommu_ptw_guest_read_ratio
> - lpm_iommu_trans_per_sec

This is great! +Ravi Bangoria who may know of errata around the PMU,
etc. There were some Sashiko nits, but I expect to add reviewed-by
once those are addressed.

Thanks,
Ian

> Signed-off-by: Jacob Lefkowitz <jlefkowi@akamai.com>
> ---
> Jacob Lefkowitz (2):
>       perf jevents: add iommu page table walk metrics
>       perf jevents: add amd specific device table entry metrics
>
>  tools/perf/pmu-events/amd_metrics.py | 81 ++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
> ---
> base-commit: 1c90f0a3c8a1c4e38f9edd97af9e20848805a7fb
> change-id: 20261028-perf-tools-next-8fd1d433316a
>
> Best regards,
> --
> Jacob Lefkowitz <jlefkowi@akamai.com>
>
>

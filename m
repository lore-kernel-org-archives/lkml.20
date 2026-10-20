Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792528382;
	b=e8FU1nx7WBp6cJKZcBya0AfAT3bNR7BDd9Uh349Ub/PFL3s1ta16Zl+23B0pQHZIJsy2
	 63DpJbkdKu0/Mw74PAJNvFIlMoMuACln83TYMKqy+BSayjPRJbku3ZTZBZbpQXXeKoUib
	 qa6B6EZ1qfkEsv7IPVo8AY08EbCrNOzZ+Uu4EA8sWKlntACfo9+BHDAHEnwEOGlRpaxWW
	 Ww/e5G5WryXuzaPbKf3qmuwe32sYrWwTND/dul+yIAkWcFIWMhvlWP6hBvvdLBtSVLrmK
	 2WwF/iJSCjitWTBdPPEiK6MmWUnTuA+pu0wNkAujpOW5k4zP5PZfoLFVOxt6kTn7FbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
	b=BP/MdjhHVzVrH6wodETNYF5gXCTN29HEGqibTVyB8DGw/HnLMYbCaA7I6S8/Karsbl+a
	 eZLBKdmC9YOn48aNu6UPZtGLFLxS/O/8LAPQV1xn1+yDsBSAW1mkfK7Bn4tIj/shVQ/3V
	 d0ERIKKV9hATEaeyGreW4bR0juMwyIcrC79PZbYIja0UcQIA64nBQhbvLL5xBf4lHyO7t
	 i8bfkKEKL5CHtqv+Yaor0F00Lcdf+FvF4W+r4Rx6UA5mCNTiD7tGFZRjJ+g46SpTa4A4E
	 4qS3Lts0+7PJ6R9Lj15IqmNVYozq/gAQHhjiZZdMK4KH/cthB0WKEsHBBYDo0p+etpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INaSu8fI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=INaSu8fI
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5337c7b9937so83481cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792528380; cv=none;
        d=google.com; s=arc-20260327;
        b=pLxNXmlEZK/jmG8deGVzIW6CxF+O97vc0IV4GSAiBZaZu97tQou5ai4r2sakJp234r
         j28fuknNtkfOzY2ezSAn+WTPJsthfeQqVlncNxBPmIkZGR70vZRC3D/2EWsFo/YpQ7kO
         T/Ug9n+74fwBk9SqA3cV3+9eExWGMyys91iJDW1n6XEWWj9ZAqqox8QPeBvOV0e0jcqk
         cp3JSPAs2CPRRb+yoABZ8wkLwpzxErGyydnwkW9F+jpZJO8+wVLq9qaw5BrnD1wIONCH
         UZaKq+vb56oRn1gjPhwe2j7TU9pCw5WYg/ikak2HG7E1iyKXFMRxF2NaA2ZxY3/fiRTg
         i7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        fh=FkBa6wOiNqc7/QQ6ki89tl50M+3LLaGzojxDGDtw1yA=;
        b=N+DIe3MAI0M/OVYbDg3TLBZhxxJyMVm269wjztG13wLteFciD+Y4A4nMD6wgNXzOD1
         Ao2Qz9VuxjAZydnTdYurjwS0UGBDkh5QVYHccDhw8pXppOulMbejsLfzDGT9n7OwAcXp
         6iWRgQ40uctCesGqJvQNa3S3Zb7UtbLMKWBbc6ATSJRtBvh9FVTqe+JwWF7EbPLFAd97
         W+ji34gjZxovHLb/CZfsqliogqe5A2k/ZEea4r5LJy2vUXwXttdDQwyoxPds0QQcxEB2
         goaMswiHli0sbnjMXeXTETFfiwjBtrcBuMbOPnrMLKtdkwhv5gIDeAuMtzW2wPLsa9T7
         YOdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792528380; x=1793133180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=INaSu8fI/7lJBJ0KTHaoc6xXLKw/+UVbNqMVNmC0u3YPecgPvG7my29CGG2Hf86BRl
         UohI/DvxwBADAiDrGI7Mo7R4ayl47O2Df2mGk2mBN3zupJ3q/D+Lwyqd/66bU8J0N1uy
         sr5QnQO4M+IwF6/P2lwJO31Xo6RDR+NNZMDcAL2ds0LuSZAj5Y034e/HUIGdO75taV18
         hcaxzj+JdGcisLATb70lncWRDsJkkjxRhhpWsejh2R5gQgzl6VTY2YKqdlPdMSHPd4Q9
         zFXbSfbj42NLZ8+s3WdSCUl5szgPNA0/UUKA26SntDhmhjTJwJXF+FicjSHwMHyXNPxN
         4ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528380; x=1793133180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMefv3/6k9FkgL+3cbApnvKoEevqgboVZWdJy3KQ1RU=;
        b=FRia/koIwIi5FJ0ZbyNkAsEKo7cHRUr8pI5Ckyqo3yhaddEvvyLj9KPIa6uEXUjYAP
         wfANgp4RZRYwfpPCaLGdZxxztY9W00oR0PoMgME5Il0Xruu6A9Y3dj+UCMx+u8s5oa31
         zX/kuT0E5FSAeAbsMMqo0KPyrDtukVL/YU5u0fgwtSrifHzPzc2tJqhZO0+p/CC+7lK8
         /aL5G+ygw2ZHdqn4vD/1uSgp0Bs1bP8aqGGmw8zoEzY+ohOaTiuZPS8+zpjJOfMoKxrS
         NMGfAFWjrxLuH/rRDzroO4mrAN5ChPLTYL6gFyDGgCsM28oHsFXHVaGxnGOk4zn61xvg
         fArA==
X-Forwarded-Encrypted: i=1; AKwUvBzZGPlbzs3ma4EmrttDXX+lcBwPM3lKg2LmKKgo14DdVxNE5AQFVYHV0pHz6d0ocJZp0buL0DUXWhb1AAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsaq5AHAP6ZffL1lJ5Wutk8id2u+sTv185B81ONfDkDUlqAQsV
	fK/WyIwTDGt+I+zZBDBAu1SIwOSsLuM7QncD6q5drtOlqYdozUEJdH+flfz+hUNofG5wXbfqCg+
	XO0Hb0x9pF0mMvfsIp/nzaXDepVvNeBNKwJre/6zt
X-Gm-Gg: AYBFou3ViVA7fhSBuhZlmibpPQzEy0eIkAyDI/QoEQO2vLSIrLVW6aYYwJCFJ643hZr
	3cj9PfeLHDxRUat/3HqwAm1w7Pv1c99rwD/Tnt0JuviHce+HxnhrAzVgIAwmq6pH7ffZSYy3Kx8
	QKEg/njcTgVKuPUDNpmaYQLYab13BYV0wK+vethIYQTzGAnem4BArZi9fszhy5iOuTFkY3+sudy
	cF3vUDTfL8D4x4stMQxCHBUUstwAdyHP+YVcvz0r+idxeilkXWx3jT2rvssp4PtYdfc5sG+k0wT
	9oUAABD7Yqio2f/2IG/ZvZcH5CVeAq6CbCGIBGBUQDrXleAFawzOb9+KJss0HMcXVb8gdPPTL4L
	lNPRZNgSA0Q==
X-Received: by 2002:a05:622a:1b9f:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-536882804d2mr9529261cf.8.1792528379608; Tue, 20 Oct 2026
 13:32:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2>
In-Reply-To: <ate93zQFkfAecIv2@x2>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Oct 2026 13:32:48 -0700
X-Gm-Features: AclHuK9CSuFZK-b6UAodiXJykR-dvBn1qDmPctgNXXAV69jhyRNTIACuSsADFoU
Message-ID: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> > On 19/10/2026 17:42, Besar Wicaksono wrote:
> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > > PMUs.
>
> > Reviewed-by: James Clark <james.clark@linaro.org>
>
> Thanks, applied to perf-tools-next, for v7.4.

Hi Arnaldo,

can we not take these in v7.4 as there is unaddressed feedback:
https://lore.kernel.org/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=3DYUPE=
XE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com/

The specific problem is that the NVidia PMUs have adopted a convention
not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'. rc
stands for root complex. What ends up happening is that aggregation is
broken as the json is claiming that pmu_name is the PMU's name while
the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name.
They've wrangled support via the json by claiming these are sys
events.

We can either:
1) support a new suffix convention of <num>_rc_<num>
2) push back and ask the driver writers to name their PMU correctly as
defined in the ABI:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices

If we do (1) then it would be nice if the support for that could be
contained in this patch series. In any case these events don't belong
in sys.

Thanks,
Ian

> - Arnaldo

Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1193F484D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951686; cv=pass; b=DcgEiMejMRUo+lvW2vR0hYQFLUbqgBaSVf+8g2nwNiv2EYAW1tP3tvsSneIsTSUfeJFU+SnxA/gppJDBL73hE75k467Di75JoMhzBnA6FS7gpWYt8IGuQjOlGRCnMssFXjMPQzzzi+N0fFnnzg+2nR7+x93qmETc049elKZwNso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951686; c=relaxed/simple;
	bh=cn63L5SFcW4uv11BCKaKFb7NgF9TokUcHR2wfHkyl4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYzimLp75iNM9DBQkAuBMmPk+MiuTyYYtwwJRL7YTNjPXJAY8pqXk6paPpUdgsbRYHHoB0y57CKy/NISxlAYya0Od6s+tbg+LfBGbC+btGgYhgWEnXVG1Q/T57oVWgyBbHao7eq3FoM3c4TfHNlmFj7KeQSP+KWHKENBvjTCQyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckamKxOS; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckamKxOS"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so1019361cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791951684; cv=none;
        d=google.com; s=arc-20260327;
        b=ERkoaQfBct561vyiQHUUmNJdtYYHsbS+ct4t+tepISUxR5K6mysXTeC7l6eF2UykZf
         yRQq+TLggT7bVhmKSnPjZLIJvHft2e3DPIdjmi7ssWBWfx8ro+x1AHcgJBnnb7B+u0Zk
         7bdGCd7EdCI/m3aSnG8eDVULtsD0HT8HfVcyKHXhHiqWi19OKIoEBXtOcme94SMXpM5t
         t6NWGTMsd/kOqEyYWDYNf5gZwYoAW9S0H49NLgKA5l6EXhLX2niljAocF960sbBgJIY7
         cDD3FTRGVJu8FUfeTJqmkelhHv54PNMNKikdDriLK4FwyDoWCphZdr3GRgCsXve1CjlP
         sVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2grbJw/Issi66ell9ynhnVcAT71hGUf9xcfUvHsRTPI=;
        fh=WoKt2SVHY4bBFHgP7haguSM7gY3FGCb7b0CmEBRxCSk=;
        b=D07lJ2jr5lnqu9imjkAxih8Z+UEwFuqPZW4hagjcKym6kQXGjfRo3gXwgv94StbI1r
         7yeJ3pkYS2UGhGVRBnxHp8jRFbzugpORCeXheBHGSvBSFnko/SaIy8OhOHHzYwc/HE4u
         lETIRNv1Wzk69ZGSuS8vDHnKoJ0FcJ/Nvj9EsAdaC7U0Wba9sTPQtkbwNatsFhU+SWNr
         2zTvv2uEEFtJRFhsw75IdeOdp8pv1C2K2q3a06My7njNaxtI0HifpFJqcqrOI6/R2iZ2
         n3GzLzjJJILN7QiwwDzsmkAMGihOzNnKTvmM/5Dlo33xP/qw173cQHIT+9TIUTlnsF+T
         8+aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791951684; x=1792556484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2grbJw/Issi66ell9ynhnVcAT71hGUf9xcfUvHsRTPI=;
        b=ckamKxOSS5ZVtXVHuveq7kbmhD7Qt8WJ8Uz3xyC39ype1k2EXlMS0MNODY3n5qf5Y9
         Ok524oLIvlOHC8coZJJs84BnbCbwFMtU3Z8Q8GtJLtAKGauwU3JXowqGgMr7RCJglBnF
         ZCzVsTkeWyzGxVo/2H2U74scwQbkbHivz/hXZC3H1aj0SYV6eH4dpTal8Q+jkyOJWpwY
         txSANywoEhEYX5dpvCCDHm7HQRgJLhK1vnjdXYcYmu0BP7jJPsWmfi6z7XF5hpWDhDYo
         gsSQmpdu1vSMjQBeK/soP2rXjFJo4Z0eyOmTaIedSVl6OPx1O02TmGkA4p7QJzzETq2E
         EaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951684; x=1792556484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2grbJw/Issi66ell9ynhnVcAT71hGUf9xcfUvHsRTPI=;
        b=rPbmsXI5tyIAneOW0ZfBJ8VZF5BVT2U/2UII/YE8EGDVoQxECWz6EAlYoKRARF7QdR
         q2HtximoRznYL7wERxVQFftOvHhsvKWlBRMCWQNXECYjfZf2S7W8MLiuLfjSgvkToXvf
         Llk7lAlOQfHRaF9Svr8N61ZzbOuIPnivGSqNZCNzMkLbpI/hWfrcJTLKqlFfmCCfeWFo
         Iclbx52wsXYmztxjYVel0ROAOXiubsg1hzsUV7oK+0PEdE/Q7DyIooE6mBM6wTGpTrbm
         cjJz+SZmWUPxlOGCYV9nOga5GFTywl5cRByOqPuKJGr94rQCS4ZFT5O8HX9H6PHDgd0F
         OrVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKCyEbk0Udnuqa8G7PEG7osoHVjkNqaImxPJzamdFPuF8wvoSrp8odo6/+OJ9mn08ea4aJZqPawCQ5w8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA6uaUtOZ/bfte1JHWNFAsEUwXSk0rNw+9+i8txMXOh6HKuMdQ
	fJeVDDRTFboXGJF9MakYWC4ribeegcCFd5W49UL9X6LALz0nw/lJ55LND2zf3Gabx1Su4Qve+Ll
	Utp3ErWb3L9+7V7h+mUuvuqZEqT9OFHsQH9AGc+Ud
X-Gm-Gg: AYBFou2RjDix6aCjBxtlElB5VCRo0aFIT4OyLXw3E1PNFemxM5EayM4pD8AuTraBs+w
	7gvkLFiuxLzQSVoyzo1hsUa7tifUSQlfn24SLi6Ye2uHP/XgR8l06E18r2EINXyyPcElgnEgJtD
	3U47M1RsI1PvTPpntateVsKE7G612104BW8gKEOGAyv0imaAIyJaY4hEELibx+nAT+TO0TA2kWO
	F4Vh6edjrkfxya95CX1+Fb5yQhzulAC8kCl6PHapwH7AuZV7JiXtu7o19W+1H+Sr/3bxCiPZ4n4
	5MH3oIgsBTkxjWn5mf6H9CVLTExbefF2NDUZ/JWJzFulnoe0zVvvXFw=
X-Received: by 2002:a05:622a:4cca:b0:535:852e:a94a with SMTP id
 d75a77b69052e-53602372601mr6443441cf.7.1791951683567; Tue, 13 Oct 2026
 21:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
In-Reply-To: <20261006-james-perf-timechart-mypy-v1-0-e2c7edf4dd31@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 Oct 2026 21:21:12 -0700
X-Gm-Features: AclHuK9WIXj2sByPsg3xQovB10FYGg7q3yTP2FKnRU4saVxapsfo9MvVb8B-joc
Message-ID: <CAP-5=fVypGeXuKw1vJMaqGhpUtF3vqPcdKpo+Q61qZHGKSj2Ew@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf timechart/treport: Fix mypy errors
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alice Rogers <alice.mei.rogers@gmail.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 6:03=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> Two small adjustments to silence Mypy static checks.
>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
> James Clark (2):
>       perf timechart: Fix task row type narrowing in goto_task()
>       perf treport: Fix profile builder type narrowing in progress callba=
ck
>
>  tools/perf/python/treport.py    | 5 +++--
>  tools/perf/python/ttimechart.py | 5 ++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> ---
> base-commit: 1dc462fc214907671600172280c2e79ef9fe6fcf
> change-id: 20261006-james-perf-timechart-mypy-e0069393c0ef
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>

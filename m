Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3580381E84
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536865; cv=pass; b=j7HVIKfmxKC2p2Ha+OeJ+s36T01Qf9WGV2kQ8Oh99/AGZz4UwsU+AdBAuLwUM/PZ4FP6FXKu+QEHUUUq+xRp/BgPL0ZIV0wXQxyB4iyNv/FhIZhwy1mCCT5CDY+gDWu12aSCc0WCxVhcGbZVxAHP8+LK4PNo4eifNsmzDH4ZVug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536865; c=relaxed/simple;
	bh=p+zh2bzF68CPu34Qj0MIgenIKNyb+Zlsh4hE21X56RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UStR1MiCDFGBNXWSDVuXyAZwdV/lckWw2wiSzoANQMIK1IEUuyktvXb6jEMBvit4Q68CwMPSkkpfMFSdljlEYrretEwrFH2d6Zx7cq23ho/AaNF2IwHU5Fx5cN/wTbAeX3hoQBqU+edudo7yNrM53YMtpw2hPJkygxz7MopOZzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eL+Jzm4L; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eL+Jzm4L"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52e843c64b8so275331cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788536863; cv=none;
        d=google.com; s=arc-20260327;
        b=YTonJDQ3HOJF7a8u/xprBGRTsP6NcvF08OSeWzP89gZSzNjJvLBsr8MSuYhtkKgy5L
         Jk3IMBk5IwhOpuoJqcnJaM2C9gxPcn0a2jD9U15OGI1fcLUcHNlh8jtpp9hV2wRQiAYl
         gpsvHHIM/lQsEBx+mCP64jWfcjRAcTfd8s8EaUpZFQbRRjLFeFiOckxX60CBdArCqbeP
         xQx1YETXb2dGOw4J457BcbgqHwRQVFK+DIjUCd5eAzWAJSaO8mjTBOnvqVea+kQXD/oq
         0k1E1PKY5pCm7WdBzJzYOtFunK38ZlSWyRvWeiXvzrUxZhnsnDU4/OPqrWPNT8Aj9ua/
         cmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPT68QRfKVLmVSBV+Z0zwKsA2eXY2NxVNEpWEIXhKXk=;
        fh=p9OqJ2hMiRyP1KsU4o+BtieSy1ODldab7SxwKZTdQSE=;
        b=IwnNccxbrBI3JTImPvo4pwdlz0SUMj5cGouKBuXn5cg5qbnuplunAg3xVMSaTXRmHR
         mGs1YUBOC4m9bTY2b312sAsDtyprtjCw1QCDU0wyhQuvHhrh9QpFG6o7Nv0dSNRaiMuC
         fGGeu5Lfmx/C0szaJw1PhlBavMc1v9z/LWZvMnATCkn15MZSNn8ZtnB5tkRKyiEjG6DY
         8LN7xCxDrjbEeCr+YOz+kT6mjBE2aDgaac6J8pAEMqcJOzPH8NTeaf9FSeGf/EpMcu/t
         DdoFzlAJzgND0FH3q+kn78QKRnNUH9GMQCjnsnbLtB9UF7HZROgslMBg3cwGFWzWkg53
         7XEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788536863; x=1789141663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPT68QRfKVLmVSBV+Z0zwKsA2eXY2NxVNEpWEIXhKXk=;
        b=eL+Jzm4L80uAqJ/l+5uRrLZV1QZAXxrGuraxN5pVLCp4uCn7U8eXJYjb85Xd6joI6A
         NXx/nbRuFggJA/gU2w7TA5lnRTww54JUSrzd1B29nAl/VUiv5IAKOxIPUr/DuKekwgTg
         kfzhctwNpuT0uR7qx1SMYIYYuQPeM0PvKc3K3VTKgYO+Et/xMsIwea7VHzLrh+qlLwjl
         +YE8jHGjShC+rZqcfudCfNdwa5twbTIzBB9cuBZMt/f6X3PEzdWdS7RVls1jX7rewBHb
         r34eVKr3Z4w5L5MY+sm+DxalqxHY4GHa7sOVc6p5VwxL6ZTWZb/QUJkZCQgqgsQqnIHB
         XCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536863; x=1789141663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPT68QRfKVLmVSBV+Z0zwKsA2eXY2NxVNEpWEIXhKXk=;
        b=TVLyvhfpvSn1UzvRNFxgWUBw46Vc0EkfKGQWeVIdWe6CU2M2lWS5NSmxYyYMSYzSVS
         cFNFG/451XuRBVyrq1l2b5xNjA9BIqqNSnttjLV+Z4Ek+/Fx5/v2foKujp+gyhILriIY
         7t+V7fM6tGqjKz8T1v5TeoXjMVEZEeYRuWJooLnNOpfB4FyEbc3eF6gPBh/t1vk2+yKF
         OkdYTbSKb3pUMDHys+l90sdfiSxJ1SdU862Ola8wSKmgMhjCXnNFchLjPsaSec17x58a
         gHrTSKn8UZpaWsOLREBqZqqQD57BMBcMxywtFF1p7+Nbb1SmdCPcJjpxR4b1BNWpbjGI
         9KZw==
X-Forwarded-Encrypted: i=1; AKwUvBwvdaKIhd754ZSa03B+yasq8mTEaMR6Rl70QrHLMTMpurylxoQpUm2NmghUWoA3fyCdy2nTfUsQpEI1BGc=@vger.kernel.org
X-Gm-Message-State: AFuF++kcq0jHdA5Wv14mjL79HZozeUxXhtVuyNu3fg5b5UrZEPgJjbgk
	69KgqqvOXud6sXPb8HpCYhh1xV9qmVcuKnXeVi+Vb/DoTcY69C+FvI9cSafZEBqLB2DBbZFauKD
	/YpL+vygMc0/G823/ZcVTIcCLgxXtMhUR8Cy/7I73
X-Gm-Gg: AYBFou0h1CiB1H+qxGNQkoQRpnwuIN5kbWl4YhLfKUcMz50uVeSnJ5v4OWHRnsbZvw5
	1LlhCvycOyuIvrGH9iKLAcJ9ijPi7BZ43b4tk5rHc8iJ0K7me689TuVWa7dBv2RO/yTmmkwls5e
	Wv22KZMVdBe6HrvErChpD2YkSfnVcAWJYWeUOXq6+v2z+8IN9f1PIN2OSZ/7pd8RYTJXooC8Yb8
	3QslxOqKQCMBpHlNeOdWuhkBMkyA2jGPlabhrDGpnCB22XWwBcbJMD09ZuOKyLmBzu1Q4uqRPS0
	6jyCYHdFG2Hpz6Hn0QAZp8+OsXkRdmP7Ms4NqbOBLrHG40cp8WDQfyAuNqIr+8PBnU5WP3d0YOI
	=
X-Received: by 2002:ac8:5885:0:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-530559ca407mr14443271cf.10.1788536861883; Fri, 04 Sep 2026
 08:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904141659.224248-2-blum@kernel.org>
In-Reply-To: <20260904141659.224248-2-blum@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Sep 2026 08:47:30 -0700
X-Gm-Features: AcwNN1VSiKV_AEbMzp_nMXjvTTquw6BllzUYWamLFbu4C-WtIUHXX0dMd892YtI
Message-ID: <CAP-5=fWj0YAUimSwGLrZpikH4dHkWSsupyE+esbNg6rM-m1sUg@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/intel: Annotate x86_pmu::hybrid_pmu with __counted_by_ptr
To: Thorsten Blum <blum@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:17=E2=80=AFAM Thorsten Blum <blum@kernel.org> wrot=
e:
>
> Add __counted_by_ptr() to x86_pmu::hybrid_pmu to improve access bounds
> checking via CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/x86/events/perf_event.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
> index 71ed5b2acea2..b66691a4fc31 100644
> --- a/arch/x86/events/perf_event.h
> +++ b/arch/x86/events/perf_event.h
> @@ -1050,7 +1050,7 @@ struct x86_pmu {
>          * unique capabilities.
>          */
>         int                             num_hybrid_pmus;
> -       struct x86_hybrid_pmu           *hybrid_pmu;
> +       struct x86_hybrid_pmu           *hybrid_pmu __counted_by_ptr(num_=
hybrid_pmus);

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>         enum intel_cpu_type (*get_hybrid_cpu_type)      (void);
>  };
>

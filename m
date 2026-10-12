Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980654CEE6B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841556; cv=pass; b=hQRjvXJ5LAfE4I4wFtgylMwJMSqAP9WDutvBaG9oyUy5v8zBCbhaKlTBg15b3G+QRdUvHD+mB247F1zhZh0p1ni6QAFv7Loz81KL5rgOpp8ixKxa+A+uln9n/L802dmE0zVFEfeH5Jqndw3mO0kCKoIWj00MBZM9pee7C0Gbi1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841556; c=relaxed/simple;
	bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by2RjVOsk2QkD+pT8piwXcsokNi+74ZifKFaVr6jsu13hj2togc0vgsWqPd53fv15h+wZ2SVWJCeeeUZaA6DshPMhQQNz6XdYQEdBywHD50i6USqF+peYY9YR+G6GfnkPzVn3b1Z7Yk6/FOgz+3JfEIC9BjX1aCj7e1+SnioVVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cb9Msbdq; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cb9Msbdq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5337fa12431so564761cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841554; cv=none;
        d=google.com; s=arc-20260327;
        b=esbn/GQP9B9Qd2zQ9PofDzCCM+RdrYrHtl7I5qNKeS4ryswi+UKBl0xAqD7YsA9SCq
         7v1TglNPhzhZ+Vn1YZonymA18msIy/D0pxyyncWeLvud7M6NzY6tvo55mxV1tSQgl3qR
         djvMZThPrQOpGyt7QGydinAQoJID2e4Da6W3+rLch4ICg9dZf7fxow+8AYjDltL5Ksak
         o7K2gS/D3AFVfmM84FUxlZPZUWrfdUJk0tcYOVbwZsgkcdOjdy92uzSiOf9MDX/vakNx
         GbmiCTyNnKbMbGAdnbLTUUPa9nAFSpc4tMo+B+ZiblHjVTDc57bUwpbUkw31PYTYSyKn
         Rt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        fh=L/IfNCjXjeaEoNNZxKHXRTTddRjG1TvK+0Hb3mqIIzw=;
        b=ELCg7MMrDb2td1ZTxdEucByWBbpVxOeRj0TQto21cniqhSMQi3ABx36ecnLRErLQ65
         5bdONDzuZVON9TRM55rf6GyWyaanmS0uRB/D60D41W9A/Y/yFtyz+/oMTt8YUQSiotTu
         krbiqiI3f84ch6/eugjRebm1H0c0e2pBw6Eys2N+Iove1NCkOsyPllgmVPEnJMWsy+Gv
         lbRj0YyL0mO73eaOeb6jB2yr2ms+dNwVDYH6Z3XIzUs76VQODJIo429kJfN9roAukfwT
         7ve58p4dIkHpxOM6RgPUqp5taXaWBkj7tRk1IhxLv45oxGMMxXeRsIypvISKB7yRsJWy
         saaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841554; x=1792446354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        b=Cb9MsbdqZseVKss4qKjrRHqmyH/0yT0HG/9h0rVLI249Thyclm7QQeYchd1NPIhs/k
         DPRrvsokjYPw4lZWztWA8O8n/NI5NHrsLEsRLi+CYIG+niX+JLP1VeTYr+88dyx44YvW
         NLj5jhJWdKBh+doOsW0qDtSIrlFa8zFfmwaerjmzU4xq+6JeVVEqhNLX1466yEvFNs99
         r8AJp/3mvH/63o9GGe9NqLcdpkGfeJJmDV6Lr8w+GCwksHaxlVWJBH/HKILnTQdZqC5P
         ov099KLBxFTvmL2R4I10m4vNP/78XkNVNO/65N7i8uJR2J4sxfStkJFPyaq0KeyGQFSa
         VutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841554; x=1792446354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        b=e71yWXRSXM7Xa44K1ORRLpZ9AiDtOpKMoYoMSkmo3STqHqf4mQZrEPh+jFtkXd/zLp
         bc2GGbBe+zQBEJsa6Y4lTbzKjsP9DkcI16nPAZ624bXcNaL98JDYyguTjaRKZ46aDTbF
         1fGwjQgPFy+jk7IumSvCq/+y18GpGswHBeyeeudvSY5HaWbRtQQGPV9T0yurO0riQpk9
         CCEIIwD/3js8azavcHA396y9SygZOmlmiDqTUkRVfQwZAGvaeI2iDpDAupzDXcbNmVTz
         0Qs3wUOCWNJOeVsw7KA5IpGHIh9SOMECkjHCiuU+6hr3MR4ZIbdXmKqJszMXuC4anYKa
         imYw==
X-Forwarded-Encrypted: i=1; AKwUvBx0E+czmTqzVn9QIw6VBm2MAxZVNDIYEer5wp8hnWiOB++1L6DPXelnjH/BRdPb9O1PbyHAESIy46skh+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIQhIv778R8p2Ely41/2FLlMJQ5jC0WplIBEp5c3YbTc38XMWZ
	YqtxPdDkdXRlMqKAZri79QpuUd7NAhQtIf5D4WnRGpkVzQEk8XKuzoSlSRTrV+XbGthzMa1I+1v
	TE9R1kvhrgJuObbfGX7f52Ss6mfG7RESKE1ipNF4T
X-Gm-Gg: AYBFou1YbW/nVv7TkuzHTcYbvNpk/fTwDjpwF19gdEZaoXksPVBZpb2Y1dh7wLtGCDy
	BeR+zUOASJI/xRRhvqOPC7HOPyiXJ9B85MW7spy3RfIUhQBSVafjdI8b+hPt2BjiJirWybx9fUO
	AwB5Qrj+IzaLjSpsIQ8QZ48MoBY1t3pZIZHczI60FRKnzFYJuxO0jszSYUMEC2oYboox+1B7/V+
	IWGeaCUjTRcJjOXvRj6wbP8yt6bqesQEDCy2tUnLFxuOFBRsL42dZFPLlSrSTxF3g4eDxrkSpoR
	oCSFJx0Yjn7PYYxdmDNPMScuzSLLk4+KuV1aKzJIxC3z9S0iabmyAG/hxfNDqCSAiMR5H5CyWHV
	FUZUdnOobX803+SyXIHYD
X-Received: by 2002:ac8:5a95:0:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-535b4ecdaa4mr34353401cf.8.1791841553813; Mon, 12 Oct 2026
 14:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
 <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com> <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:45:41 -0700
X-Gm-Features: AclHuK-KhF7SQQ_cSO4Vi6bo7ImPeruAfj2YPIigck0H0gWHJJaIzIY69ZpCKsw
Message-ID: <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:41=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi again,
>
> On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmail.co=
m> wrote:
> > > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> > >
> > > Best regards,
> > > --
> > > Matt Turner <mattst88@gmail.com>
> > >
> >
> > Thanks for doing this!
> >
> > Register selection, recording, decoding and user stack dumps tested
> > on my ES40. End-to-end DWARF unwinding remains unverified because the
> > installed elfutils 0.195 lacks Alpha unwinding support.
> >
> > Tested-by: Magnus Lindholm <linmag7@gmail.com>
>
> I just pulled your elfutils patches and ran some more tests.
> With your elfutils patches, DWARF unwinding now works on my ES40.
> Both existing and fresh perf recordings recovered the expected
> leaf -> middle -> outer -> main call chain.
>
> As documented, samples whose CFA depends on r15 stopped at the
> sampled frame, since r15 is unavailable. Tested-by tag already given
> to this series.

I'm finding this fantastic and exciting to follow! Being greedy, does
the cross-platform DWARF unwinding work? perf record on an alpha and
perf report on, say, an x86. It would in no way block this work, but
I'm keen to check Matt/I wired this up properly :-)

Thanks,
Ian

> Thanks,
> Magnus

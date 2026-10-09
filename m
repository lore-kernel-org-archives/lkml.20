Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3048986D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578393; cv=pass; b=FOu9DBwIiLAJLpQjF5ttp+7yM9ZniqN0u/udaSe1dLjSzuEEieqPzfLAwuZOCHzHXYTjDj4FM2q24X3udNTGQUp3rJqxAzOLf3T5GshYg5+IYupGWCJf+GVZHzLtK4+xZT0vLTfQ55+VaZMXfLUGc5dHvE5hE9oWoWamq64mDlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578393; c=relaxed/simple;
	bh=8tnYWJwgyj9+6irdJh63aEtFW63R/VoOhn2vsUtMqyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlBLncwFqubREKklMhm7JxQwfmZozBrXJsX/XpsWU4GdLaosrlxhudfa9Y4WVLBNAtBkqRvhna4ThnvkKSLK5VYV3lECouyhDA1Rf0/vFiwuQBt1MKGoqputhO5+4RN2ul2VEt9+Dk0pAPD4it4hs3tC+6zi5xrWmAaUR0q/9Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fesIF8Vf; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fesIF8Vf"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5337fa12431so430521cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791578391; cv=none;
        d=google.com; s=arc-20260327;
        b=IHKqRdsA18/kJw9HxS4zA7gDbddkQ9RWfeGRGZUGy+VJItsvE9F51uCtm5xQL/JPNf
         qPAt5VN3sIRZQaYE1PKKKkv2WcDRt0Gfh7rB1DLjFusNvHlaSio99Emzdw/95/5iy2/p
         QsfnaFtYEGWJfh5LBeseFpRqioq2WHkU0kZ0I+/etfbGXSMZ0RIhEWiTnhrpxMBIQi9B
         wVWqvqXPCv17zPEfVzQ4Uc/4gQEbmSk5VTHIknevbJnth6iriGMDxa90xYcd39ml6H8j
         a8/zNct0ORyRrJgw1XrJcIutW7CiOyVck679U+y6u7onSo6Q4Hk4hSVfqLjjuQwqh8b5
         zuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkRNRybafmhhapVuq0k61d7/RJN669rtzPusZWQpGK4=;
        fh=5zJbp/Ds0w9LH53BTQanr90FfCue1zyBoyM8lOtPW2o=;
        b=Fags+C0K4qTbZLir3Y85GZy6Ty1y0/9iOX7JIKdpyQiW+BmxKm/b8y1hgkJ4TDrbD/
         Qc/1LRBZ//06Z2e2HlucKlTdJgtry6RJ2NNDqwA0vNVGbb1vf61tdA2r+GUNPs1MO96t
         Pw/Eag1NnoAgeC4/HPO7yahIosMv3Rxjl8bay6L6/FFpYsYR7h0IWtgjFY3oxFME26/1
         A1YcoqdQ4SVyUjj4tV24NK/mFGGkg7LknggL1t0dwCmaVK2bwEGfdDOE3w1eohKgmRNh
         aqh9vkIyNHQNYdrCUJh01EXmILc6dP8z42V0q9iAjxRZo9504oMXKixirPX2WX8hYryJ
         jWoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791578391; x=1792183191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkRNRybafmhhapVuq0k61d7/RJN669rtzPusZWQpGK4=;
        b=fesIF8Vf6h0xE8PpXGBRstKbv8+Q355GpIxZhqrVl/ZDb3OtbJIiAuFzXHUXnYpatj
         1M60dknQh0GdWYVKNAU5/NGEsZ/eyIBYTZZ6+jyQQMVwn07Zl+AxuCMVlMp19OOxyOlj
         vEjK+XspcvHWYEkwUR2AMWttm4hxTvSYM1YRbjTmlnk/YvQdcbmFd7SAdSFoyHImwWhR
         hkcohAMKNcu7aul2OT/JcXi5cEEPRmZtwCdrPfC+KdR6HLYg+2au1aG0CyhjevtMCBnq
         aAsMbk4nSuwbnq39Uq3cdCOza0ISxQiMq3G+G+oppGjPeMcOGd71+MswcUSYV8ampWeb
         0NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578391; x=1792183191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkRNRybafmhhapVuq0k61d7/RJN669rtzPusZWQpGK4=;
        b=nT8kS1Tauq2iuepy1I8sOALPWP85PsriXlr7xj/Vg7KYNomiPs1yqqtN8fLZG3w78g
         QBkdNZyucLow6gd5hmAS9MWW94gWqQrh1GoZ6Eg0RgvxeIKA2gY+lHZqSpq4/XvX3DR7
         aRNusbpKjzwgZtEgjtp48uG7/aVi4uhENFQ9V8/u/jUkL56ing7MeelU+bTvBeObpGCa
         UX0zdmzjPOEbB8i+lb+4LzrhNl4O9Y3Yd7Xgcn+vCw+487s8sGxiwvfZZxH8WabzvEOa
         slUNaZRajg9EBxK+wrLJcMVRuXj6ijHdAU2TcydW2jmurqnJPWlIRQBVejNblMMK9a2d
         cQ9g==
X-Forwarded-Encrypted: i=1; AKwUvBxQT/Kk6xSfVPRngePf/8/tT2IYJM7AoeqwoiGlqNB68AmorTJd/xKLT0c0a5jegINVWZauIEALS5z4dSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbGHllgLUkkh8pBf8ScEAM16P7obXANshjvH7hYox70pE2Bbtg
	u55fxzX2PivMK7enO5xjN0g+Vv/a5YGagX9v6jJh08XlizJHqY4k/lmvTeKnzMyQjdepocQIUTn
	WqwHTmnxbPZDvLudfBDiFno3sJidXyaySwbgKxFA3
X-Gm-Gg: AYBFou01ni5nZ+VOLbnE5BDrKNHjUjyfSpeqW0s9ue3xXo6bmu098PvnmbuE5i3XYqi
	qaqcC+vRcqjDsPNDD3hlTXs+G2bhCw8EL/AUeIdhG2WAd0vRacHY1a94QSxDkWyezf9jcIMZF1n
	PjPFN8Lk9f60pk036IFpxIyRFHNpWXqA3JiX8Q63ZReeiAQwbRTO6DuTS4rPHCvuH2qPdBFG202
	/hd2yDrTz8rVABeu6SWXumOvC52m3GvqNiGkkyB8sctQ2nNUfn9kh8LdNlSP7NBlk4596FQ0bIF
	fkqJDSN6N6hR19Mdtge5YnyMB5EWGcU6/RPDH5Ttc4TMLGwRDk5J3KOX
X-Received: by 2002:a05:622a:1a8a:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5359ba6858fmr19513161cf.1.1791578390107; Fri, 09 Oct 2026
 13:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928010227.1903673-4-michalpl2003@gmail.com>
 <CAP-5=fVe=VxnxypQYNt1h-s+3=Me8D_fpBL3LD1Eeb1cGvUc3g@mail.gmail.com>
 <asVUvfhz4wG5CnZC@google.com> <20261009022236.992515-1-michalpl2003@gmail.com>
In-Reply-To: <20261009022236.992515-1-michalpl2003@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 9 Oct 2026 13:39:37 -0700
X-Gm-Features: AclHuK-9TaY-TLo_hZmsqODHVv1-o6LL0BWPOnj1Q70w_U0FqukOX-ka5eHdLCE
Message-ID: <CAP-5=fW1ObiKscQmWD3wNRmgsdszGO1r8JFE4hUj2YK8aAJMUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] perf symbol: Grow the Rust demangle buffer geometrically
To: Michal Pluta <michalpl2003@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, acme@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 7:22=E2=80=AFPM Michal Pluta <michalpl2003@gmail.com=
> wrote:
>
> On Mon, Sep 28, 2026 at 2:43 PM Ian Rogers <irogers@google.com> wrote:
> >
> > It seems changing the scope of this variable is unnecessary.
> >
> > Thanks for digging into this problem and exploring a fix! Previously,
> > we guessed the demangled length was twice the mangled length, then
> > added 32 bytes for each retry. These were numbers I pulled out of thin
> > air, so I'm glad you've found them to be wrong :-). Could we estimate
> > the initial demangled size better? Could you get data from Bevy and
> > Typst? I'm a little concerned that a demangled symbol of say just over
> > 2KB might require 4KB with this change, instead of 2KB + 32bytes.
>
> Thank you for the reviews. I'll move the buf_len declaration back to
> where it was before.
>
> For context, the other demanglers in perf don't size their buffer by
> retrying. The OCaml one allocates len + 1, as the output is never longer
> than the input. The Java one allocates strlen * 3 + 1 and truncates. The
> C++ demangler (libiberty) starts with an empty buffer and doubles it,
> but it writes through a callback so growing doesn't restart the
> formatting. The Rust one writes into a caller provided buffer and has to
> start over each time it is too small.
>
> I collected some data from release builds of Bevy and Typst and a few
> other large(r) Rust projects. For each binary I took the defined symbols
> and counted the number of attempts that the buffer loop in
> dso__demangle_sym() makes for them. I ran both the current +32 loop and
> the doubling one from this series in a small test program. No symbol
> went over the 1 MiB limit.
>
> Builds (mostly v0 symbols, plus up to 148 C++ ones per binary from
> linked libraries):
>
>   bevy         0f38358f573a  cargo +1.98.1 build --example 3d_scene
>                              --release --config profile.release.strip=3Df=
alse
>   datafusion   acf5c89e6454  cargo +1.98.1 build --locked -p datafusion-c=
li
>                              --profile release-nonlto
>   materialize  54a6aca7b5f1  bin/environmentd +1.98.1 --build-only --opti=
mized
>                              (clusterd and environmentd)
>   polars       750bbaa9054c  cargo +nightly-2026-09-01 build --locked
>                              -p polars-dylib --profile fast-release
>                              --config profile.fast-release.debug=3D0
>                              --config profile.fast-release.strip=3Dfalse
>   risingwave   be77a6149e97  cargo +nightly-2026-06-21 build --locked
>                              -p risingwave_cmd_all --bin risingwave --rel=
ease
>                              --config profile.release.debug=3D0
>                              --config profile.release.strip=3Dfalse
>   typst        9dfd3a08500b  cargo +1.98.1 build --locked -p typst-cli --=
release
>                (v0.15.1)     --config profile.release.package.typst-cli.s=
trip=3Dfalse
>
> Firstly some data on how often initial guesses are too small and how
> many retries they cause. "retried symbols" is the share of symbols whose
> output did not fit in the initial buffer. The other columns count the
> extra attempts after the first one ("total"), and the most any single
> symbol needed ("max"):
>                               symbols   retried      +32 loop       doubl=
ing
>                                         symbols    total     max    total=
  max
>   materialize clusterd        295,365    5.66%  3,500,913  17,844   27,96=
0    8
>   risingwave                1,051,376    0.87%    297,151   1,561   10,18=
0    5
>   polars libpolars_dylib      276,797    5.61%    247,424     236   16,14=
9    3
>   bevy 3d_scene               218,042    1.09%    205,030   1,135    3,49=
3    5
>   materialize environmentd    377,085    0.51%    117,485   1,539    2,30=
2    5
>   datafusion-cli              175,020    1.10%     24,304     125    1,95=
7    3
>   typst                        36,504    0.12%        907      66       5=
0    2
>
> Only 0.1% to 5.7% don't fit in the initial buffer, but with +32 this is
> very costly. In clusterd it adds up to 3.5 million extra attempts with
> one symbol needing 17,844 retries. Doubling does the same job in 27,960
> total retries and no symbol needs more than 8 retries.
>
> You asked whether a better initial guess would help, so here I keep the
> +32 loop and change only the initial buffer. Its size is the mangled
> length multiplied by a factor N and rounded up to a power of two. The
> code uses 2x today, so 1x is a smaller guess than today and 4x and 8x
> are larger ones. Each value is the total extra attempts for that binary:
>
>              N                  1x         2x         4x         8x
>   materialize clusterd      4,507,480  3,500,913  2,460,193  1,528,046
>   risingwave                1,306,091    297,151     71,074     25,133
>   polars libpolars_dylib    1,254,174    247,424     14,214        305
>   bevy 3d_scene               357,175    205,030     94,936     29,978
>   materialize environmentd    271,354    117,485     59,697     22,265
>   datafusion-cli              179,241     24,304      1,003         29
>   typst                         7,066        907         15          0
>
> A bigger guess reduces the retries for every binary, but the symbols
> that still miss are the ones with many backrefs. In every binary, all
> the symbols that missed the initial buffer have backrefs, with a median
> of 53-138 expansions compared to 1-4 for the symbols that fit.
>
> Running the same experiment with the doubling loop from this series:
>
>                                  1x         2x         4x         8x
>   materialize clusterd         70,399     27,960     11,231      4,073
>   risingwave                  106,878     10,180      1,016        128
>   polars libpolars_dylib       84,502     16,149        634          9
>   bevy 3d_scene                15,742      3,493      1,115        192
>   materialize environmentd     22,668      2,302        365         73
>   datafusion-cli               15,366      1,957         38          1
>   typst                         2,310         50          5          0
>
> On the 2KB example you mentioned, a symbol that barely misses a power of
> two could get a buffer up to twice what it needs, but the next patch
> shrinks it to the exact string length before returning, so the extra
> memory is only held during the call. I'll move the realloc patch ahead
> of this one.
>
> One other way I tried to avoid retries is a minimum size for the initial
> buffer. Here the initial buffer is the larger of this minimum and the
> current 2x guess, and each cell is the total extra attempts.
>
> First with the +32 loop:
>                              current      1KiB      4KiB     16KiB     64=
KiB
>   materialize clusterd     3,500,913 3,500,867 3,181,650 1,425,379   216,=
505
>   risingwave                 297,151   296,929   151,909    14,567       =
  0
>   polars libpolars_dylib     247,424   246,715    15,413         0       =
  0
>   bevy 3d_scene              205,030   204,818   132,911    17,038       =
  0
>   materialize environmentd   117,485   117,455    79,073    37,531       =
  0
>   datafusion-cli              24,304    24,277       866         0       =
  0
>   typst                          907       898         2         0       =
  0
>
> And with doubling:
>                              current      1KiB      4KiB     16KiB     64=
KiB
>   materialize clusterd        27,960    27,945    18,824     3,260       =
183
>   risingwave                  10,180    10,117     1,887        63       =
  0
>   polars libpolars_dylib      16,149    16,043       686         0       =
  0
>   bevy 3d_scene                3,493     3,472     1,574        64       =
  0
>   materialize environmentd     2,302     2,282       419        88       =
  0
>   datafusion-cli               1,957     1,939        27         0       =
  0
>   typst                           50        47         1         0       =
  0
>
> As we can see, a minimum does help but it depends a lot on the size
> chosen and would mean we incur a large allocation per-symbol albeit only
> during the call.
>
> Sorry for the long reply, just wanted to get all the data and rationale
> across.
>
> Fun fact: the largest symbol I encountered was in materialize's
> clusterd. It is 1,091 bytes mangled and demangles to 575,074 bytes.

Thanks, Michal and thanks for the long reply and data!
I wasn't sure if you saw any patterns when comparing the unmangled and
mangled sizes? What is the typical rust symbol size? I'm concerned
that reallocating to return memory to the heap might just be treated
as a no-op, so guessing the size correctly would be great. It would
also be good if rather than just failing to parse the parser could
compute the output size, so we retry a maximum of once (snprintf
behaves like this).

Thanks,
Ian

> Thanks,
> Michal

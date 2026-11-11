Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422068;
	b=x+ZHhoZP/fqRWzIVIAh7fRoHj2IPFbaJjIwlGyC2NUKlXDxrOx1U6XUyfzQRh0wjk1/+
	 rkYupqkhRd9aiKLZHacNvy1yJua9f+dnL6CEyOS+5ZmmAt2v8Qf+rzV3FBPSPTi+a8Vbn
	 3RfecpxB0CJ8Y6cKsh3r+Kp/WfzLksxIva1ilDnLSpJO3g/Qa8WzrclOZCRCFncnIIrwg
	 13SthuXZg8kCxF8fbgX81Nn/BmOyN97P5c/jLfvw0zsF2puAqavmkxFrrrTlbpWLjTmER
	 Ek/CskF+zVE5+beaToI/ygJ7EWzr8mGJglPu7BHDS7CbSAQwaS9Lw6TWDShSq6lv8UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2Z49rE7knRUVwWJJdCKoamYrHVBdYg7n0RJDkec0CdM=;
	b=5grI4m3dGUE+DTNL0m5axpaOmXvFuG8YRV4uWyamiCXBjw6Y+yedDH0pV22yxc403Q9z
	 8y2srPH0gGZifSzHw+4zvvjF/PgqSZ4cyyaDxpPApRZ3cxQrs/bvHFlqx/aIZvVauX2UD
	 aXYXt0a1QDmOEZTKhlsB5NpVxwCrJfZwmIf1c9aw0RIlq8zL5qipIS/Wcj7+UImMSyAAr
	 aB1mUavEgZIC1wbVG2fXz35xwkTUd1KAyoMcIIjdC4EdbQ1XDgCo28P2ExKlRZxmNMhwE
	 XN7Ydh+CJMkk2BSbU2OFtmPmKFXkUbgiX8L6KGzrK/LiCmZOTMWQghF31iPE5yMhjsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IhpFTLk7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01946606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01946606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IhpFTLk7
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7141814eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422067; cv=none;
        d=google.com; s=arc-20260327;
        b=fa/P+z/doWtFwhyU1jzfkZG8U85pq+Gt/PTAhOfLtvECP+vsTGCu/kj2zroCvo4HKT
         Ps9/rJwI/xpcURWwPU7Jfu0GQi+/rl0fhmw0Un+RsG82cBCVby1MrHC3x6wgEz2ZLNdq
         muQQXdE1qPrG1/YA0Gnqnyw2fuUx0tnvetjzQNjBTGLFgmvKsuKooYEGQP7zsYfjlHLX
         LwpUVFYPiu2qn7MbQ/t6f+y/9yUYI5VP/X0ksaiXhLLzWpOL3+IDOUhNXx+8bJEXjh/0
         Ofbx/QZZhz77aG3puOo+wByG0+K3F/3mJH1VrKi7RVvWF0QVTdxGPu4gS/4mU/a+WI/x
         HlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Z49rE7knRUVwWJJdCKoamYrHVBdYg7n0RJDkec0CdM=;
        fh=NCoVAHgVYyELmR6rOy8DrbEUxpFZ7DLARUhGxazP1YQ=;
        b=kItIbTZEMks1EuHgt+QK8x45n9ETuUYPnkgqh6tRNyf1oyD8m5PJlLB5oS+tN4lZHZ
         bMr5xUHkX6VTm55i+AW5sBNQkjs3sXzvt5chmWYKPvL4HtjPPBoyYauVDwq7KZbinpoR
         Fk8CTJJespcrHlHySyyLMHaf64W8rwKIJ3ZuhvI8UFAPP2hq5PHY8Qg8ocv1dxQnz4lh
         GKWB/qD0JdfUA7qnh15vTtPrxitHNGtHL+3S4IQxsWFhcx+C1DtKUzoKM+VC1ZQr75ly
         fdpbu9/eFBkyixEieJTNHgBe3Q8COB6ZpqS1y7Qa3kSrU94ySKdAUWdxWwnWsR6I93B0
         OtmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794422067; x=1795026867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Z49rE7knRUVwWJJdCKoamYrHVBdYg7n0RJDkec0CdM=;
        b=IhpFTLk7qHte3e43EzKiNlKZ+bx3uZHj2CBmlk96Zb7hV8J8S2RqYhI4MkxQ26byrb
         4S8zlRPOf4732/meC5L1oYABZ4uT68xcSgjeDtFJ8pHha/t/wxyx0MothNE8i3C3zbG2
         qea83PTASZLdBdAwQmLZ5sqPcsV8GQDQm6v0Nedz6DdHFRx8Br8MBQkBWjwCmN5Az6wv
         BLJwzskT9KHbyyO//cFx5ivxSkgHuxL7PJfbJv/aIRj03jzaSd/PQkOTyD3Lu2kDwz59
         piht//EewGePWwM8uWhEAoc1s6nwxu/5S2C+tYBxM1Jx+K4gTmkNcTbgPiSulUYTwMt5
         PCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422067; x=1795026867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Z49rE7knRUVwWJJdCKoamYrHVBdYg7n0RJDkec0CdM=;
        b=KZvaAxwF3vmV4sYOcbMuqXFF1qnxe1XcaGu/IOmWbEs/sFx6iGI1JEGCpEjv270JcF
         AqoFk1VnkG5MBGwZF3nD+o4a+th93fT5bWC2rZt6pJrnYOWCp8DrkXwLCzqTKRNf89kx
         aqP5STWy/PGuW1RTdscv1iOt7NnvJaEMyOsnSvM6YFw29VWyR2K/08CIM9LwBJYQ63ss
         j9Bk3rUvHowx9lZIkylhLvsRmxeVFBal2cMml41VGEp3sHaUz6HgRehF7RRuDr8PsPf1
         uqDK8YuH/pSJfB/Ja630zpgYZwpqSaxFssQClsKfb84qqheJKCgxg+eoWZcBGHNJotc7
         FPRQ==
X-Forwarded-Encrypted: i=1; AL+hErEl7+pCfVvcr1CQQaBK3CZ4YO8+wdLPeUYtgPhaQCYIkMY/ibUxz1f5ggdd4nwimAoenN6dZEQHeQ8sTd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tAwuBOrCE93QFBAHXy4AWVx94a42EngSIvTWJzN/D3es/FNJc
	teHmrnLmSQG610+ov217Soa4RjrRW2aRL/MJG9PufrgInqv9rYKgLRg4Du6CyBs+Cdd8dKusy/i
	uB3NX4K9nHi1snM387h0ykrdLVFxcs97bI3qCHyjP
X-Gm-Gg: AYBFou1MT0dJSELGi/yVhRdOQjuK26S7FmPBhEOkxz8N+cXuCWgyrMJ2Yj805PrXprK
	clwRQYZoN6bDn8kSB4Ivxn8gZ8Hw4mKPqEgdfjE7116K36ELID9TS5VUMsHSzF8Y7OE0jd4EC+Q
	UNrgzkrsbI3XldIKfo3uM0IStCo34/LkRjT549pMEf4UqODX0wI2ttw+jTDX756/dsg+dBIMCtZ
	c/Jxl1Bo8LZrIj527wG6TL0CXApylJUrANas7viWoVd2Xb9/b0jI3Fv7QSUpAO3vILbHXOXmXBv
	60w8caYMAbJQmafAhQZlf4DiBg3kXMMgliZpwZHnVLQdlVkJ2Tu+27afDC19qvW5dk4MlTgIx1x
	gMn609BgdGKgOC4fBUn9JLFKHY33BoCFEgr4JIY5ZGsgomonWn1W5f7DXzrI2uEnX5tA=
X-Received: by 2002:a05:7022:290:b0:1b2:529c:5b6c with SMTP id
 a92af1059eb24-1b3c02f37ecmr2924192c88.14.1794422066151; Wed, 11 Nov 2026
 10:34:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030192537.3079368-1-ctshao@google.com> <20261110032240.3080302-1-hang.zhengyang1010@gmail.com>
 <avQLKYycwzv68fVf@z2>
In-Reply-To: <avQLKYycwzv68fVf@z2>
From: Chun-Tse Shao <ctshao@google.com>
Date: Wed, 11 Nov 2026 10:33:50 -0800
X-Gm-Features: AclHuK_lKHnJ8g7uZPZXmOaZQmv-H33wU2AldAbo-s9XEVltjHPvdW7uP-BgiAo
Message-ID: <CAJpZYjXJO-vR7ratedregLyeqk372Bf7V89zGWGKjJ9r9csd=w@mail.gmail.com>
Subject: Re: [PATCH v7] perf stat: Include PMU name and split uncore events
 per PMU in metric-only JSON output
To: Namhyung Kim <namhyung@kernel.org>
Cc: Hang Zhengyang <hang.zhengyang1010@gmail.com>, Ian Rogers <irogers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:29=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Tue, Nov 10, 2026 at 11:22:38AM +0800, Hang Zhengyang wrote:
> > On Fri, 30 Oct 2026 12:25:37 -0700, Chun-Tse Shao wrote:
> > > When running `perf stat` with `-A` (--no-aggr) and `--metric-only` in
> > > JSON output mode (`-j`), [...]
> >
> > Tested on AMD Zen 3 on top of perf-tools-next 13a8d580433a.  With
> > '-M l3_cache,data_fabric,iotlb -a -A --metric-only -j' the metrics are
> > now on separate lines labeled amd_l3, amd_df and amd_iommu_0.  STD, CSV
> > and aggregated JSON output are unchanged, and the stat linters pass.
> >
> > Tested-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>
> >
> > Two changes the changelog doesn't mention:
> >
> >  - Without -M, 'perf stat -a -A --metric-only -j' now prints two lines
> >    per CPU; the first is labeled "pmu" : "software".
> >
> >  - Plain 'perf stat -a -A -j' gets the "pmu" key too.

Thank you for the testing. Yes it needs to be fixed:

```
  $perf stat -a -A -M branch_miss_rate,cs_per_second --metric-only -j -- sl=
eep 1
    {"cpu" : "0", "pmu" : "software", "cs/sec  cs_per_second" : "1211.5"}
    {"cpu" : "0", "%  branch_miss_rate" : "1.3"}
   ...
```

The fix should skip printing `software` pmu like `tool` and `cpu`.
Also, PMU printing should be skipped in non-metric-only mode.

v8: lore.kernel.org/20261111183209.1892421-1-ctshao@google.com

-CT

> >
> > Are those intended?
>
> I believe it's intended and looks fine.
>
> Ian, are you ok with this?
>
> Thanks,
> Na

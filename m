Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1729376A0C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857912; cv=pass; b=LCPUF7EoJktx4jLc0+/SoPsyLaCgYzAk5VaylsXcgi0vwyRlHSe0D2V3zjVp1wHG88CpPLuxD4CvRnejIf18mK8SkOPwfEnuXBFpkWVpqgAXnsXQq8j8enQrr41/pVOYqJcFkk0sXd2TLK3q7poEIHBGJhfA1B3mfTACQUHsaIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857912; c=relaxed/simple;
	bh=HZVbSt+G1qkLumJSMkh/JGQ3tJBwKTzI0kEEv2uT0J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8aw3WvJfwSXon+OZzZtUnPA+ODJKl6/pa7I6BIbRoO60+nLdzzoLeDY0Bkgqc5xBeuEtEC4OXAbGQanVzFsZpBr+K2XbrFPYL07weAe6MAQvMUBm57FQggP+yS+QjcY8Ec6JtCmh1/U25oe0obb6YLpRQk++Ys1eAYp7BkM8tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TeV8+2Og; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TeV8+2Og"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52faa58bff5so179031cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789857909; cv=none;
        d=google.com; s=arc-20260327;
        b=Juy8WI1U+eJG5Dk/uZJ25zXU+axHO8NbJrzj+Cc94P4q4edSn3Z9gIXeu5aBL2rAxy
         YPyF6a3u8gI16SyAhzJ0EIMDGktPhUMgAKKldKsDwS0ZkwmQWax9uJCKfCkiJhlL1IGy
         WeIstFjLrTxTylROnTZlUIZ3wyODiY2HNnNQvCtzmQFNyW45csuKHoWAKhWIDG53+PPY
         ulyRHj5Nmc8UtUghbM6V9sLq1q2wlwaV5PFyaGHW4T/3lBM5VaXbpOdim/iKZuR743IN
         IUCSQvNUIPHtY5nSMjINSJ4VGCwuY73x6zIDm5qfsuqX4kpmM4JtH9Rq4lD+vsu/9bBM
         G9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WE6+DziGd7WPL7pgBonc+8aoo5lx0v1SqrA6Ym4LWYs=;
        fh=8kiG+/KfmZGrRLKxNUKO1ikmxmgzTiiMVIUiw9yWKSU=;
        b=omZTEfFsZ7I8ZMQW16m+ym0mxLH/NVIlICjmsyMbtd2OoWvu/Lz0qyZiPGxp8mg9fs
         efC//SxXTuAIQofx5qG2vGkJJSNvY+5GZELi0zFlAzkpDAKRndfv6ykXTSvXJdNHlXbk
         9pwc+NFnvA9OaO0h0qdb/2Qi1C9Qm9NGHoM95o5GpGbeF0In5utquKU9LXlrZNaTV3RY
         S1VxrRfcDaxDhztKuTMrjhZSUgyTEm9huBz2KGXy2cYHS1dV8dDKI+xQOIq4OxpCKgPb
         1BAQHPVXaIrQ7C9OsZbZKwhGO/FwEQWs5JvigrPkEw4plPJgHtTKeymAqGmjYj40baUv
         oCnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789857909; x=1790462709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WE6+DziGd7WPL7pgBonc+8aoo5lx0v1SqrA6Ym4LWYs=;
        b=TeV8+2OgORll2JJ/pez6GrlX2ApByTCWQI22F03WIasEpibJpRXY6dNDEFgjujoPQR
         9DSdhrjlKOkl5D+oivH1ORglRLcWHLNOWUi//jvh8S69yWLJqqFtxhJn9BXzhvR5it+G
         lkFoYqKqXVYGx5EVmfe/LJ2QifiKXV2iGFy7HTNGOCKzU7TiSCSnhZRKUTezwNznC4sH
         qHNSw4CnNPy4Cw6MOpz+Miluv9ZVwP9KNzm2YUxOgtmlNHamcQ322luEdnzvrxaxqr3y
         USlbjKiPXAO37eQkpbYOi5RfXOa9CvuOfNeH2FuW40HmoF3kM2BmWqGS6VaEgaFu+gra
         cTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857909; x=1790462709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WE6+DziGd7WPL7pgBonc+8aoo5lx0v1SqrA6Ym4LWYs=;
        b=1U5XnNaMcCla+VZpoJkxxHs7komZUoVfTjvzP7xvcjpZ4f52BQFJX5LyRJNHdegIVf
         PEAtSk/vvoTvbSAetmsb2dC1ajbJPNSikpMOdvld9c8a0fZdmkzOBjA1yAeZiOUUqTCc
         ZbPn14D7AOwSJRhmXTbTiPlrhopYS8Xzi0XAftHJks4LHdRa30xqhZlPW05WVGWBOFt0
         aR+Rr36UC6T+KZbO7G2qBDJWauKnDqgJ1S2/FNQsK7lIFbDn4VkyV3cMvv7YD9/pz/RC
         Uy2mjusd/BjXy8UPqlyKcQx3c39Xcq3FtRvvsyg7k0ASEVD1D0LwnhetF092yaRpCCmg
         65Gg==
X-Forwarded-Encrypted: i=1; AKwUvBy4FrPgtnwgsuhSUeIajuBr6cgM+t472KsfmKOBXmwJMFY0xyQAZFgkQVAQPw3KNP5mX2eBZFyomMvrvZI=@vger.kernel.org
X-Gm-Message-State: AFuF++lGChUZWkjGBokxC9AugCMVAbTDK22gB0HLOnd5+4OuMAA82oiY
	QpXod3TqwZidFY08ARhoTER4uSWFemXoUURGG9GiC0yWICDifMOFlhZ6Oq/JiYnYKdV4Z6uZiEm
	IuvF9Z5aTcNlXONAY/g/jpiDSm2scjjrmI7bCZK++
X-Gm-Gg: AYBFou3m/Hs3YnKxx0yEzA2z2zIPE0b7+/G+mXLPuWgznkM03UxDQM9trLD2ArxvlTi
	YPKS5uVu8+UH1vPy+51F81P6YZVTs6pBJt5KKKkliGpzvfTOzYVqPmC9TXXnKit8V6uCke2J2L/
	RUof/4T3I5zM30p2f75SooeX185zeb9f1d9ZjTPVEWEI7jX6kvYlHzfTUyAgijL/xAWgLgdmCAu
	tp+sl3cD5jSdKQAGrw7elO27K1eI7wZcbzAXykdjIVKQTKdx22BlUkB9E+sopLvZF0r7M/WOiF7
	HeYjoTjkxVVnUWTl2hs5puv3mB/iDRApIT9cpkfTGF9HIa3tQT9tQX4=
X-Received: by 2002:ac8:7d15:0:b0:531:6de:6028 with SMTP id
 d75a77b69052e-532b747150amr5903181cf.13.1789857908994; Sat, 19 Sep 2026
 15:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919063745.48444-1-namhyung@kernel.org> <CAP-5=fUt43_08GcNV3bz-SFmRjBN+NoNZ7zEJyBDa+tZiN0vdA@mail.gmail.com>
 <aq7MzpfPwQkv-oML@z2>
In-Reply-To: <aq7MzpfPwQkv-oML@z2>
From: Ian Rogers <irogers@google.com>
Date: Sat, 19 Sep 2026 15:44:57 -0700
X-Gm-Features: AcwNN1UkTyo4rhv2xHwiQqVdKIaEgOooiptAL0AD3AJn-lJ4unng47STfXUmDOA
Message-ID: <CAP-5=fVPTZsV8UodhB3ASp-DvsvYwOZdNj1xdi8qGHEW=E6Png@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] perf annotate-data: Support flexible array types
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Zecheng Li <zli94@ncsu.edu>, Yanbo Zhao <yzhao62@ncsu.edu>, Tengda Wu <wutengda@huaweicloud.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 10:56=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Sat, Sep 19, 2026 at 09:18:55AM -0700, Ian Rogers wrote:
> > On Fri, Sep 18, 2026 at 11:37=E2=80=AFPM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > Hello,
> > >
> > > The flexible arrays are dynamically allocated with different size.  S=
o checking
> > > with the original type size won't match and cannot find the type if t=
he offset
> > > is bigger than the size.  This patch series detects those flex-arrays=
 and allows
> > > accesses beyong the original size.
> > >
> > > I'm not sure what's the best way to add test codes for data type prof=
iling as it
> > > seems we need to add a lot more workloads for different cases.  Proba=
bly we may
> > > want to split the workloads as separate binaries.
> >
> > We have tools/perf/tests/shell/data_type_profiling.sh, I wonder can we
> > not just have some workload with a:
> > ```
> > struct flex_array {
> >    int len;
> >    int vals[];
> > };
> > ```
> > then create a randomly sized flex array and access  it in a loop someth=
ing like:
> > ```
> > struct flex_array *a =3D calloc(sizeof(*a) + random_number * sizeof(int=
));
> > a->len =3D random_number;
> > while (!done) { /* done is set by an alarm like with noploop */
> >    for (int i =3D 0; i < a->len; i++) {
> >        a[i]++; /* Expect blame on struct flex_array here */
> >    }
> > }
> > ```
> > ensuring the type profile blames the struct flex_array?
>
> Sure, I can add that.
>
> But I was afraid it'd need many small workloads to check data type
> profiling behavior for different aspects.  Maybe we can think about it
> later when we need more. :)

Agreed, there may be a way to automate that. For the specific bug
where flex arrays fail to get type profiles we should be able to avoid
reproducing it with a simple test.

Thanks!
Ian

> Thanks,
> Namhyung
>

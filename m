Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987A2F8EA3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789834751; cv=pass; b=E9nQ2zFyD2nP+fdoCh/TAKrmqpOmtu5HDX2Y/x7mADCDQKHv7KI2IuB7M6jFe2U7XI8/p6wZDyA1Zhg2sJ9z4uvLJcY2SDuFJNbSf4opyoRp0WjiLb1HJdgQJTKrySzpS0+u9z3iEQzQRf5Xvcvx3OMMhxmBstc8mk2VVl3chuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789834751; c=relaxed/simple;
	bh=BzrMUNDYPj80iybGRN5GMtONkf6AbcxkplnCnvbZ21k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ab6fHRP0TNWEdQ9GIWKxZ3Z8LgJNKyEex60y/0j6OIusSWoUCEXMnvuq422ndmWjPMk37QeRAA3gYvTIvXd2phiukDECS/5hdOu3oRL6OD5FtA5RWQFDfg88KKJfrHnoC1lpN1s8tzcVF30htmDKar3KQp6bYfOG2AoTQXxu9MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AxZd4Nst; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AxZd4Nst"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52faa58bff5so160601cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789834748; cv=none;
        d=google.com; s=arc-20260327;
        b=GBIolGsMLKRh1X4QuMGLLH5bYu2Ok3VugJpL1xrqtP3PUj8QovUnzPIOpt1R6nOCEj
         WSd017aXbogLwTzQw4Anh7gUrQgTlzGpza428RQGpjbKO/X24HMr4Y6PoV7ym3SOxaWm
         zPh9hqtZhnul/WcsUY9wrRLWcbjwDT0sLiTKSb3B5HiQrKHxrYlEFqiXMY3pV6ZJVVw/
         CfdX4tYeCQ46limis/TDQftMFR3QIQGKnX3z3OZ0hIhziBFegDF1EnKXe4VpxVpFylbp
         hUFy7EbicdceL+fGcmZZpp9N7sCqI5BdIARp+K8LyH8ap3KsaAP3kWgWVl1suF3qgwu2
         IMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xh+7X6sXCfesaHvraYzlE9MQtsqcfmtlPZC6XvJ+WDI=;
        fh=fbIGKv1s4TD1sI+RffoZoR2UeYZqd98/jS5wUeYghCo=;
        b=LR2SGE5ZSJgkt+eOU/DNXEjwuEscKmcSZE1c4YmD5AyVTPTl403K3K4yNHf0tenM8H
         jSUKMCTO5lCFDLxl8aI3FZrnqcymWfHv9CZCuMe62F4aNUlVXWk6vuLQPviMUrKzlbII
         LoOOdbmOknWW6GHovVB5HPGDz10p/M5vjmCFtAaEBFcUkhhVU8OpzqS4mn349Zw2kwAt
         XoMufb1ymlw12W/2qfqnOQcKDxdIzJ+fYsP970BXTgllfnIeXbTGA6zIcnZD14rRDT6u
         k6UX8L2D0yCP++OIpBQCd+K0fdloD0Z/51GOrxfjoebk6W5ZG8abgkcwMS0YglkMdF6q
         DFtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789834748; x=1790439548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xh+7X6sXCfesaHvraYzlE9MQtsqcfmtlPZC6XvJ+WDI=;
        b=AxZd4NstcPkWbrgDqK/s5WDnS9KuFMb/3ZiYxPcRiR73NyLh71nJf2bT41lRiAbUql
         JabZ4LqOOye2NNo/1QND2w2kgB0GBjEqQ/jXc68Mv1l64WKlSfG6tzHjeVLvAk6MMKWN
         4ACmVKuL/KZwIhyFsb5Y1GCTZBqNQ/Z5+uhxw1fftsbaHXP6hbi+5sPD/8sCK5Jnaaat
         PsZmcBvz6lSXiJ3Mh2Jjwf3W1qpX8CSnNpJFZ23QUPWegDNsBDGW8b6tEKY3mRdeOJy8
         ETE9pJOCykhN2zEe4PFQtey69IxGF8zu1zii8LdCAELDWHtRyHMJtjuTM+Zzstc1/mQ/
         aj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789834748; x=1790439548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh+7X6sXCfesaHvraYzlE9MQtsqcfmtlPZC6XvJ+WDI=;
        b=CTZsjYoaldafIFnFQtAEC53W1d3eZqlfkyLBN0NcPMCxCEayU8qhHDbBG3f2waBkID
         uehlSJ9X2wFUX+xXID3TMRErNo20XMh901MSbEll0U7ZQwSXguwPG9XVoGcPzetNCI0T
         V8kfIl+7XEJrAbG3aNn+ZcHsxJg0Y2GosVbgq/cIggYqQn+We7RDyqB4ap/34d1N4IXa
         5A/XR9IHze34FhQOIoFFyvcelGJN5TgQgInxoCWTgketwvZbaUfGdaRqN/9UAP7nGA6A
         YTlUGIqM7u9bdR1pag8K2I6hJxReI1TOF9yw5QsctDhblaeo5HtCuPsj/AUCwZqX4uUL
         YHcA==
X-Forwarded-Encrypted: i=1; AKwUvByEQbtZRSyeqJqySXlfelqVNt5RP++ZnK+CHIZk9lm0tRpCnrnGchLr9heG3Ln08/6K87dOr5lsa6hyil4=@vger.kernel.org
X-Gm-Message-State: AFuF++nO9sA8a4Dj5Jd3WpGLCgvyfRQSb/cial5jLYovuYMjrQanXAIL
	ja46I3FZtDsXW9tmjfeWAjcg+8skTugdm0Qlx4a0XjpSwwwb4SqjKL7gZETC99uvqwv/Z0+pdaq
	Qot24KILciqnA/6NZCi6BBCyS6hgbaUETEOInz9wt
X-Gm-Gg: AYBFou3B5fO8kwtY/FFBalHwEpRzPGyfGcoWHg9zyFeRIqXvdehQ6vKmH1h+jcFYzVZ
	vlTJEGqgTSr1zdMzw21TNthtMF4PIY7IQnS9kfQP0m7Uy0iIlGUi685MvC4r9qZwqvn4il8mDsL
	Ck5+CKkBnBlGoaUFzzKGJagJSF4qpvRCxQEGV+T7/T2JNYlo2UJgOiSYBE3TP5MG0sQosHBIscZ
	snZkUlbQjRqNxXbogbTZ6Ef8q5AKSj7AqbueInnganTdMG2XPc7XSszixPYWTOYOjEqhwByNuPU
	BZ87nx6QpM/DNmCYnGcqHJa76HL5D0ugQLtoRMUFFt2V2Wo3u1dHq1k=
X-Received: by 2002:a05:622a:2c6:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532b74745c2mr4345361cf.14.1789834747062; Sat, 19 Sep 2026
 09:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919063745.48444-1-namhyung@kernel.org>
In-Reply-To: <20260919063745.48444-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 19 Sep 2026 09:18:55 -0700
X-Gm-Features: AcwNN1WQC-Rm6OzY1guSOIIS0q-0qgLy5a5dVXEVUsRU9fEFsTJ71sWSPbEY2nU
Message-ID: <CAP-5=fUt43_08GcNV3bz-SFmRjBN+NoNZ7zEJyBDa+tZiN0vdA@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 11:37=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hello,
>
> The flexible arrays are dynamically allocated with different size.  So ch=
ecking
> with the original type size won't match and cannot find the type if the o=
ffset
> is bigger than the size.  This patch series detects those flex-arrays and=
 allows
> accesses beyong the original size.
>
> I'm not sure what's the best way to add test codes for data type profilin=
g as it
> seems we need to add a lot more workloads for different cases.  Probably =
we may
> want to split the workloads as separate binaries.

We have tools/perf/tests/shell/data_type_profiling.sh, I wonder can we
not just have some workload with a:
```
struct flex_array {
   int len;
   int vals[];
};
```
then create a randomly sized flex array and access  it in a loop something =
like:
```
struct flex_array *a =3D calloc(sizeof(*a) + random_number * sizeof(int));
a->len =3D random_number;
while (!done) { /* done is set by an alarm like with noploop */
   for (int i =3D 0; i < a->len; i++) {
       a[i]++; /* Expect blame on struct flex_array here */
   }
}
```
ensuring the type profile blames the struct flex_array?

Thanks,
Ian

> v5 changes)
>
>  * add a cleanup patch
>  * add is_union and is_flex_array fields to find member correctly
>
> v4: https://lore.kernel.org/r/20260916061926.2224222-1-namhyung@kernel.or=
g/
>
>  * update last member even if the offset is same
>  * handle type qualifiers in die_has_flex_array()
>  * add zero-length array members as flexible arrays
>  * check return value of strbuf_init() for type name
>
> v3: https://lore.kernel.org/r/20260915064035.1970175-1-namhyung@kernel.or=
g
>
>  * patch 1 was merged!
>  * check if last member is found
>  * check member location when finding flex-array
>  * ensure member typename is initiailized
>  * fix a bug to pass a wrong type in check_variable()
>  * fix a typo in a comment
>
> v2: https://lore.kernel.org/r/20260914064535.1671939-1-namhyung@kernel.or=
g
>
>  * fix missing index increment in the histogram
>  * support flex array in union types
>  * add recursion check in die_has_flex_array()
>  * check negative index arrays properly
>  * avoid divide-by-zero when the size is unknown
>
> v1: https://lore.kernel.org/r/20260912054706.1475583-1-namhyung@kernel.or=
g
>
> Thanks,
> Namhyung
>
>
> Cc: Zecheng Li <zli94@ncsu.edu>
> Cc: Yanbo Zhao <yzhao62@ncsu.edu>
> Cc: Tengda Wu <wutengda@huaweicloud.com>
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
>
> Namhyung Kim (4):
>   perf dwarf-aux: Add die_has_flex_array() helper
>   perf annotate-data: A small cleanup in __add_member_cb()
>   perf annotate-data: Allow out-of-size access for flex-array types
>   perf annotate-data: Adjust type offset for flex-array
>
>  tools/perf/util/annotate-data.c | 192 ++++++++++++++++++++++++--------
>  tools/perf/util/annotate-data.h |   6 +
>  tools/perf/util/dwarf-aux.c     | 107 ++++++++++++++++++
>  tools/perf/util/dwarf-aux.h     |   3 +
>  4 files changed, 262 insertions(+), 46 deletions(-)
>
> --
> 2.55.0
>

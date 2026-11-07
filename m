Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794026345;
	b=r1nfOSNWPek0ej3a2jiUKT5IXkX9KwMogKTvecbcUDx0Mcp1NLwU6oTVXPYPzcNx3F33
	 v+HuD9RBk7FJ4gAxK919YzDDV3TYPIUpg3iZ7EeAMKXna4y1j2LZtj4/BQ4rJe1/B8l89
	 3H9EeSRlnCj3kTiPTQuAHoOfJAdgWHSyRAf3XVdfjvbiupob+4cFw35QdLabbylPrRxVb
	 3vaRMRg0OHF5ucSAMcHsC42M3uvl7lNp3vwyc1ubYJZIyFehw9z6K/RZkqgu7R6oOUocj
	 coRndIeVmFTBmT1DONzYYXBMu8TFfdUTeQETb9Df0rXA3WbuSnNB9hiRPOwbupsXlHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oANw8V6bwbcERQLMzjBwqJLCJQnzOOw7LkVw2UMELt8=;
	b=cFjDb7w9Qud244jcivZU942G/h7bscrbfwcj2Z9XuVk5AHgf3NhIAD30je7NDPk9dBk8
	 znOnG/WY3vTq6d8/Cg5DT+AnvwvDQeUrTvbW0YzwyzC8ZOn4BJ3AdI8p0jjZ5AbhYBU83
	 QJ07Hm2o1Uh5a/ptm3YQa8pdftbMS7BKVRCedf8iqWawP7gadD9yFJEN1clCRlaDSnz9c
	 T8jkSd9z5YQiEibJBHMM3SFsXptYTJHdPLktn/wLZcZplzuD+C42HGkBIJvkjtxq4BOiY
	 uYYmbOVsccQOjAguF7dF5krmUjpt+Wu2gjyuEAjlPvnRmEDZ0Mjjl2fhEv4FUbb4VOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ncsu.edu;
	spf=pass smtp.mailfrom=ncsu.edu;
	dkim=pass header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=E29vCMH+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0C606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2B0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ncsu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ncsu.edu header.i=@ncsu.edu header.a=rsa-sha256 header.s=google header.b=E29vCMH+
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso737226a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794026343; cv=none;
        d=google.com; s=arc-20260327;
        b=lhD/ifZBBQSVrQImYw5I09I4RLWNqojQfgkHj4vKLBQFwDtEER4hH5wotyR8fmjojj
         gZrd6LCE9jbA8dCNPLsjDRns8Vk/yra/X7MDBc7FmCatzbE9o3hJpXMdWhJFCccva9YJ
         rmO2FWBEBnLMRW9kDGHDCEgcbOiIm6MZqHB7uaU+z44Gb2lqdWd2VtzAA8U3Bfa0QPhk
         ym2L5J20WH6w1h7az8iQ8obtQYqGyMxOUQPg1ro2w1tTBUw3ZVd1Le0daUytT23VUuLH
         iKBAE0o4AxGbdlkwd7Sa25OX0GCamji5yaFJS3q9XPAa3sHkpWZOU/lMJRNGQ5+6D9P4
         0bTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oANw8V6bwbcERQLMzjBwqJLCJQnzOOw7LkVw2UMELt8=;
        fh=oRaX7tXzKOrF8XrCXtTOZ+RAgPPHiCyQ7reNHkah1XQ=;
        b=Z67Sh1TH6EuYpv137F1IlViyNUd+kRucmZkgFSOPzU0L6ceOci4+r1WxJhKiMlLhjY
         pPwr4boLDw5Fi0taPHLJ/3uS/gdAewzF//PetM62bJog8DxuUf33hY6tF1x4LYdRdwl7
         ar2NG/3kexXXWiKcoNotsL10wFG0X6ZgnGxedG+O5ELKALxEgiGeAGbqP0w4FiNXIm4y
         bsdbkV/yeNjQBQO8PBYadCzHFIIWSutL08Z0Df/goPIigvdU7a1UXxqxhyLSDwjtgD0g
         8QVpB56Be/a+AqAO4IVHCwYCIJTaBrMHFcb6jqxJE4CkpJD9iHrGyajj2iP6u+Mty/vm
         8Kdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncsu.edu; s=google; t=1794026343; x=1794631143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oANw8V6bwbcERQLMzjBwqJLCJQnzOOw7LkVw2UMELt8=;
        b=E29vCMH+emxMbDFPMj+AolPx77VpV84pX66UwTgidf9NKdt31GmY9X57Ysoh2j4y9t
         qP8Ia0CzNTHbMNvVZCjRQhO7BEOzwNN2121GmzlcDm7TZNCb11m+iyHVnM9qFFzBcgtM
         ZjsM8ALNJvFNbD9x8Q3c/1UjIE5OGQGBSixsauL0w2DyBVbdw7+BLmW+mD5hVjBgPTVQ
         uXwQ9ZLJRfkVvGLice1fKd/KfR/PZ+Rrfu0rqEsp0tRMm/lMk6JUsEJ33Yl3WAlC3Lsq
         xGfP7/C1NpX1MIjGZ9gnUEbTb7YDlkulIJKb3Es6tnm8Or033BZy5c+Jo4HcFYcQZpvZ
         45BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026343; x=1794631143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oANw8V6bwbcERQLMzjBwqJLCJQnzOOw7LkVw2UMELt8=;
        b=EPD1eLPXjzaJn/MHXEBEmerNAHn9gJ/oml6VlAKFAQMgHCBNIRltnL2k9xjGVZLz/f
         r9CsDVIFO7hlkZGdSjQA8h+srhLk1pvL4yzotZ/2NCw/8ZDXia0R735bkX0uoa7PhIIQ
         JC8eP7UkeGxjMVOl4GouDOfLxH0mA4W5JvVfEoW5I4NlsJXMowf+YGhCyTUnm+XqbUNn
         24OeJFHpnZr+PA1+LeqFljdDzLX3rwIxjTxpBkRpOo0hUTyrbtQyaXnXWkGdRMQmmAZx
         fX1WyQxWq0gDJDfpuKG0t8w7PodTpGNLq6JMbw1YRz4LU781/APyiZAg9nAZutRyXWgF
         S5IQ==
X-Forwarded-Encrypted: i=1; AL+hErEbTIkemU9lPOZ1ihJO61DiU6ZAft7eQw5waor6JNNkKkd5hswvt/YZd7s7NTJAA8vohmB/Ib/etAMAOVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3xFhWVbGPZ8R8A9h96AiIGnj06F+1WA4Ruy48Ec3ijnFkJV+w
	HgAvrPfkr9obXTDmvqqhE4f8tgg6Ip9OQvOzQnTs91r6SdMPT4FVI+T2ZyRFHSQqmw1aQk5OSlH
	RhrUBFXQ656K3VfGtIVeHBlRArXW9QNeTzuBhrgK7
X-Gm-Gg: AYBFou12uzkHEtxKXuGE264LU5hfvjz3B07DEAKzrVYS24C1lDyF9hTykBmNVK90xed
	leJ0l+hGB6anF1q4UZxvjbyI7jOMNRPz0PjA9i0uVpai3z680fzwhZ+MCVn9IDA6RVbgjlmMHGa
	M1ff7fUUD/FesfR/Z+Wbors3kwcVoKKTvA5RlCATtHyb70ahf1uyqRr0uNgD1uI/mxnh8fmfWFa
	l/yncI48Ql3dbH0OQo3sYbT/wX+ZmmuH6dfCqBx8SOCB+LeGfuMyWJJFlVgeuvQbqgft4/QANk7
	CYNWIfsggmMBxSoz7y/Rkil/dNJ5in0blVIUEovPWzZ3RzhEQX/h5I6EA13nRUDWKdxAp23/wKh
	G2j7wBOSAeUPJeVnFHMtL8lm7kc2RzwRGJP+CZS45pI8zaFTPUT3Ce5Q26Oef4IShlKpl
X-Received: by 2002:a17:90b:5690:b0:3ac:c03a:38b0 with SMTP id
 98e67ed59e1d1-3b0db5f72ddmr4797535a91.8.1794026343039; Fri, 06 Nov 2026
 20:39:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105181949.43198-1-yzhao62@ncsu.edu> <179400075255.23155.12765347975568669027.b4-ty@b4>
In-Reply-To: <179400075255.23155.12765347975568669027.b4-ty@b4>
From: Yanbo Zhao <yzhao62@ncsu.edu>
Date: Fri, 6 Nov 2026 23:38:52 -0500
X-Gm-Features: AclHuK_CMhT7GRldVqAMjtGoKGLPm5_hmYdQbY8LleU3g0NqW63HhzB1vc3gsDA
Message-ID: <CA+J8viYG9JUShGDyZXJwgEb2+W-MqX1APFm-szL0fr2ksAPyrg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] perf annotate: Data type profiling support for C++
 classes and virtual calls
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Zecheng Li <zli94@ncsu.edu>, Xu Liu <xliuprof@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much for your help!

Best,
Yanbo Zhao

On Fri, Nov 6, 2026 at 4:32=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Thu, 05 Nov 2026 13:19:46 -0500, Yanbo Zhao wrote:
> > Data type profiling currently only understands C struct/union types.
> > For C++ workloads, member accesses through base class subobjects
> > cannot be resolved, and virtual function calls (indirect calls through
> > the vtable) lose the return type of the callee: the register holding
> > the returned value becomes unknown, which matters when it's used
> > directly to access memory like 'p->next()->val' where no DWARF
> > variable describes the temporary.
> >
> > [...]
>
> Applied to perf-tools-next, thanks!
>
> Best regards
> Namhyung
>
>

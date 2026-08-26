Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BB483BC8
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780207; cv=pass; b=oUEi8aJ29ywcKE2zZlx3M8tik6FuC1FDP0gj5SzqRzkCGL+o9NBbYosXzmKfhMcMSi7WxbN+GG9qU6yfM+Ic57aDk9xJlf1U3xixRx78kZdubaOA8/Abr0dUVbdu9ZdRRERk67h/UFR56XJcvwT5eYqY5Df+rJoCSDrbJmwDLu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780207; c=relaxed/simple;
	bh=rGDiBI1hTmQAe8TZel7wAjTxXii3zITCQLFrCU6hdPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auMkElAzgdRsezn2JOrooox0ZyOc+TtY20POl6kpiUcoW8vzJupuL8AGhM28105IPDFMxRXA4myZPIDN9vy7JZ/WpqeOMLumFp8OK1DPCDXVrtIJmHrWbdXjQ42xNSXzERTmLXKBnnDdkeUtLe4D5v4iTWJftnnR0qV6leHBjoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LW6kLjSU; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LW6kLjSU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c01c79467so98931cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780205; cv=none;
        d=google.com; s=arc-20260327;
        b=lpvCC2QVhmWe7d03WBY+0XjCe4b0UpjSY1F/hjLrue8SAkG0eHeqU6Cg2Q5Yy84Zsn
         D3aEAPGbQ9QXLJzGIOAZhkTxp2nFa+qucjjclvEAuS9A6gXv1dIIX3R6VuL/PrSPtgqq
         jIqbedPbtcMiuh3JgrVm6uW8o16Inw0osuhAi25XsPYrPXWjDI4BLKPupQCCLkxGHTAs
         2BLGQ33EG/9CNqIS42RjTaPz90vhNlyzyrjv3Ymxe/E80zEF7ow4KHD5Ko2VKvZE4gbU
         kOV2GVTVdU2bn1D8JShSE+C2/JicvHEL2qJmV0SJfMOndspv6zACEH5wILbTLkqL2/nG
         GXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0zP6gLuNpu4QL0Erkk9UtNBxXAl9RvpxfVoRz9rMQM=;
        fh=hZLlK7rioVjoJLDYJZfOKbK+Zm+jJOKCqGeF+l4r7z4=;
        b=c2jDNr8Yxf9N3OzIGnSEPUdFjY3PccUxqO4DGrApKVhaH2vp+T8VI101sIevHqap5f
         Q//F8xzWv4HAJOC7crB27R4Cmkc0ZWs6D2XGv+vhEzXtSDnc8nyQZ8I7oaxZTdAwKR/O
         SEkZ3+RsbKoe+KTlPrLHIiBQyyeXr665gG/3ItTYDtiDffp9hNnqWiyei2Y/gUR2gyxf
         fpVniwGvLmPTmMa1oA1nS5d5izK3jxA3MFPu5q6QzpHwx0sfxuG9t3aREv0092CQ20w+
         daz2Sy28dLBjs1LQKujuuJaKIgK1VFVi+eOHJZWyJtSlwzbZYzvaSsqdItmXZ15qxiLL
         WRlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787780205; x=1788385005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0zP6gLuNpu4QL0Erkk9UtNBxXAl9RvpxfVoRz9rMQM=;
        b=LW6kLjSUOY22M1PufGPqi5dQV96DsFHsqfxZO25I57ieyjbA0eZm1YeaGNHHdOJqaB
         Bjb4VVsPt0Kjev4P2bZ2r5fB3xzOIC93XI4Wg/nsqpAsUExgDOauSLArcG0vcgB7P57W
         HdQk7H0ZEq3fbxgJz2s866dA0wmMlcD7PGJFBffWZ0zLJaiVBJYsFthy/eNimzBJScup
         YqwhBGQV60BQ3Bv045iPW3RNpllKzcni/jsEjppf41k3UpbtolfT31VYueJDyI1AF2Fv
         6cV3Ps8eu3NaytXfth9ehb7En+0z0DbF33j4hLjThC7nzI2PSnW5HC6ykCY1lP2VL3jr
         mFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780205; x=1788385005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0zP6gLuNpu4QL0Erkk9UtNBxXAl9RvpxfVoRz9rMQM=;
        b=osjIqWof6kwld5SjzDj5S/pkXB9tPKb5nItbP+zodJ3Klqvtzs+LIODb2fDl3Ek6Oy
         rnjwpWWqWi4+DkNa0ZwtWCSFoWqLDuveR7fNCk19h5ldB2ImSek8uotET3BG7oEgZQCc
         gvWJ1ADSMp61iI1usH3CGvFVuKuLTfhQ99H6F8l+7FVpNkW6NL22l/Ozntmgn3uIrk7T
         STktI4TaSiH5botW9JwMlNmcnfhN4QU5qXbWQYD2NyCZ/137lCFq9eKiwJ/31EIVWc/C
         flaD1ujjqd/EGTofpqFL7+zzgSjLpH6TfTlbQOqYh1FL4xBmr9ILNqInAMHjjehOX5zu
         n+/w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6M3qKyyVqfPgzC/CoVKM5ZyS/mGs2ZOzBJSMMv7d/5drYeljUaCtZvK0RI6cqQgow3M63i2Y2JuQ8uiA=@vger.kernel.org
X-Gm-Message-State: AFuF++mKy4pL73D+bHqwAAcVINdOYwpT5kDKhd7slJZn4b5Ll89TYbwY
	kA7h22W9lh3bICsaoWtoWSG6sKfKBcztUgJexOqIJLPNDyQSO5tjxLC3+qVrnCS0QBykotdOaTg
	PiCCdbaGmxDjtFJyxQUQWp1KlIIKb1IQPLW83WQPG
X-Gm-Gg: AR+sD10vTVlcKURyIlu2J22rA+9njqwGp8WH0L/DTBX9ERmS10YPXb2gYj461lboP2x
	2IkPJbar9tUK1vI8FSplQsh4mhQaq36XgmUqaXucV4o0mu+ezJnzOs013d8iPT866Z73Hwbt1KJ
	5tJJEgO8HZK3yrg8iV6eIhul/MrsHVYwYk0SPStTMPc3vP9xXupPbpdF9DsnHnQ5ACLClan5vKp
	LhqopJyqAq1w8FmiwSJ7MvRfVf5r+HlsMfx2kavgLKgbk4//qa1u7E3iAZeXvukl0T+pnEsC/NM
	6b1Pvnv5pmm17OBuu05QUtid8e7CfzqEp3mKaZW2peBTSwuMJYr2vzZ/c8zEHfPlGUbAkDggI1A
	=
X-Received: by 2002:ac8:7f0e:0:b0:52d:7a3c:8396 with SMTP id
 d75a77b69052e-52fa3408e15mr4818971cf.2.1787780199166; Wed, 26 Aug 2026
 14:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826185815.280451-1-namhyung@kernel.org>
In-Reply-To: <20260826185815.280451-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 26 Aug 2026 14:36:27 -0700
X-Gm-Features: AcwNN1WIAgiebcfVe5AkEC9RjLkGmJJYeCWi8c_9v9UurgC1yqzh5xQ-RWDBHso
Message-ID: <CAP-5=fVfmWQaE45Y=pA1rE5JxQLKhfN82+yfRqQE7Hjrb8=aOQ@mail.gmail.com>
Subject: Re: [PATCH] perf ftrace latency: Do not read trace files when BPF is used
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:58=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> I've realized that it didn't set up the tracing files when BPF is used
> so poll() just returns immediately.  It ends up with calling poll()
> unnecessarily in a loop.
>
> BPF still needs the loop to wait for the target process exiting or a
> signal from users.  Let's sleep for 1 msec and check that.
>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/perf/builtin-ftrace.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tools/perf/builtin-ftrace.c b/tools/perf/builtin-ftrace.c
> index 4f881a40c311ae52..e61b9de11e1e41c7 100644
> --- a/tools/perf/builtin-ftrace.c
> +++ b/tools/perf/builtin-ftrace.c
> @@ -1146,6 +1146,11 @@ static int __cmd_latency(struct perf_ftrace *ftrac=
e)
>
>         line[0] =3D '\0';
>         while (!done) {
> +               if (ftrace->target.use_bpf) {
> +                       usleep(1000);
> +                       continue;
> +               }
> +

To avoid the busy waiting could we:
```
// Globaly:
sem_t sig_sem;
...
// Prior to setting up the signal handler:
sem_init(&sig_sem, 0, 0);
...
// Here:
if (ftrace->target.use_bpf) {
   sem_wait(&sig_sem);
} else {
   while (!done) {
...
}
// In the signal handler:
if (ftrace->target.use_bpf) {
   sem_post(&sig_sem);
}
...
// After removing the signal handler:
sem_destroy(&sig_sem);
```

Thanks,
Ian

>                 if (poll(&pollfd, 1, -1) < 0)
>                         break;
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>

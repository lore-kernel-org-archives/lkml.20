Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F6A330D4C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170873; cv=pass; b=dx5hK+/QY1ncy0EAwU8Q2sHtmLi1ru6pQW1oKJe5PtokfECgHKQJ6/1COxpRwzOJ4u6TbKwsHQ+rN/ZAztPt4UTbhoHqmAwTY+nvR/y4pseDmW71ZRR77leYouCxz2BV+o9h/0O2shCZ9pqk3+zoGx69eimqdE1uQkaUgzmOnd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170873; c=relaxed/simple;
	bh=+mQ6Ar0lpDm09otDuf5yoTENE4+4/qXpNbLM4z6dqIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIO9eWMxkkr9obFcOfa28NM40HqlbfFzbw0NgHIB6LweS9vb2OIBkFQkyQ9sQLcNJb/gQjUQR7yGpHabdnyKQWshnNdZmKQahG+nz3x8GdvASxSylLhCfzO/dXDA004rxdTTZ9FFOHCfBITCVHwca9fWBKyl0GJ+1s0MeqbplqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKdGC85o; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKdGC85o"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so53655ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790170871; cv=none;
        d=google.com; s=arc-20260327;
        b=qj5+lB6rpLEInAh0Cf7Ut2V/YJg/Muo8XfvTzqOEhvBda0ZaxIdIr/DLSsahD/Bn2W
         VCH4cjTQEgz9ODm40MiHqqLpPtDt2p1r/U7eSybSHtjS3j6NVJCXI9KWo86faf9aCMbK
         K40uhY8b60QOGN+LJU8h9sR6Rfz74/a3bBaHRxZCXyqQx/wOF0tMkdvPlaDbwXIP8Jvy
         ain3JrEQ1vGTlkaRvisQeVrIbHk1kHtH2v99ZvEh/UpaxMtahpTgy1NBNd3Gw9xp9VBL
         absQUBK2MSIeg2NnkkQyL+UUuM8ZyUvM+n5+R2O++h+qqovzArIVAc017ptUCvd6sKDK
         cEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMA6nrkSU3W0ATD5ypT/W2DVX30FCfF4aQzSCkrPd8I=;
        fh=Yed0gvlCFZa8kqZ1eFvLGxoRFI44EVXKktIq/lGOzmE=;
        b=GRSBLo3jVOXx/FT7OWXvfpf0+JNnJ4eDKVJeLhPLAMlonN7iL/80QgDFA0tybGkP8c
         MTqncGQ9i20Az0wSgdbMz63cjaV3ZzYvEzwcIR2L5swLNqs60trm9Pu3XPY1+5wEfV3A
         2ow3zg+plPibCsKFOSyqwGXse7f93ulk2xiVjHK76Mt84E2QhqQhIR8D6xaVRG//9ifS
         caHcfVMGnulXXd8DpEm+lBuLyreBJFw0nPQ+/3Uw3+vmFD95VwL1Vb+k+0ZpLlIROkTu
         SRgMgm3roMSrW5WR2iaKL1XZkDHhYsWSfbDKmJC5dEkOdZ/A6jvqRKE1FjhzDLl16VE0
         QMWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790170871; x=1790775671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMA6nrkSU3W0ATD5ypT/W2DVX30FCfF4aQzSCkrPd8I=;
        b=gKdGC85oe3qi/c5bTVtVroUeFXQ5jutC204ZQ2g/mYFkVPghCS6RNjhcoSQ59k5rgf
         IftOu7ifkp2Q1wpXWOS8Gn3MwzUJPaBFuCxZSoI9i2H3bsXqCs7Im+dxX6cpyTlYFA9T
         iWqy9awvMLfQCNscHAbYNkYl1VLjCIMX7HyJcx2dyYlp6ZA74xy5oZtMMrKkqXBmYhvF
         ZcrWE2YZL4J2Hz21rqm8L9xF4V1DoP+LXhyr+QWGVs2lnWRUcKgsASScyvfPup8geNS6
         y31pWEnvDDJAhf97gOxf3sXA5BJG31kM9fBgx5ZMUp7bdSMYpw8WxCm5NV3N7rj1fl4u
         D4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170871; x=1790775671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMA6nrkSU3W0ATD5ypT/W2DVX30FCfF4aQzSCkrPd8I=;
        b=o3i+TXDhyg/mvOb11jn4bl3Xaw6dGWvuckDYCUrAOmIgDpkb9heRadbF7Q5kdLiy+x
         WJtqjOoiJehHOHklOsRr9kYUnPdlDURgKvaljogJpCa0n6r1ZmlojApIgM5ZhQUo3rF9
         ryfCRbb9Q5t3xtZZA+UhLP7fmDldgwhiXxFBLWXn6/GBYvXtFIK2KtgkYILbxwwLOFv0
         twPosOC+exGLJ0ufppWaepxlj0aSxK/xq2uSLBglsVE01yTYwch7g+wOYjIWn4BcqFLQ
         XRzecRR4c1/ghhEa6gc/p40kni9ZO93i+6dDEfk76tUlvQSyVhAjbbYzNNkd0DNrv787
         AS1g==
X-Forwarded-Encrypted: i=1; AKwUvBxRiGXPM1PKCueyR9h18f9lgnOkLRl4anX841hETttT2HzAISU/HOS60Lrm4dcCKgqsxbFT1ZypUCQE4C0=@vger.kernel.org
X-Gm-Message-State: AFuF++nweEi6CeyjT6QXuntbXkU7YFvVvs6rKD6ZijZv5hr8NlFfj21g
	xSBQIEHim/12fRTOtDBXfJzpG759hmJlLzRzw93Q9Bd7EhS7AjCMRGm7SpBVHe3lqM8TJYEg0Ih
	Iw8CuICYyIMENpSx1fV+tzvhDKjHTQ0PzF+SaT90q
X-Gm-Gg: AYBFou2pg9HUOuzDxTaghsJRialwkpc/zKW4fFaorqaCfY9rdDwag7Zu9LW7sU7aUNq
	+GGmVImWrH0pTq7uhcDZl0OvaPaiA6l4EsjP6mdXQnjeFNKIsCRsqRjMC9PcR3/Sd6TscdFHi8+
	yDef0AW40AssRQHvpFMGlw0i7/lIP5KsC6mr+mRgAgAzWCM5ILlEIgC1+R8rTm+fs91a3xmUCOi
	wSksa7s96y038L8Os0+q3QI3t3zv/Hk6vfqy77OBBUfnf/Gqzsjb50mtaHSkLBbYRvZwuyiIiig
	kyk7XfuSQv+R2U9qIeWDQ8HC0cWBKWLl14HV16fkdNpzVRnUeFNa2wc=
X-Received: by 2002:a17:902:ce04:b0:2c9:d89f:fd98 with SMTP id
 d9443c01a7336-2df6b4a0651mr3820415ad.1.1790170870598; Wed, 23 Sep 2026
 06:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <f724b653476e2733c18b02268c57baaaa54870ba.1789966896.git.irogers@google.com>
 <20260923090007.GJ200420@e132581.arm.com>
In-Reply-To: <20260923090007.GJ200420@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 06:40:57 -0700
X-Gm-Features: AcwNN1Vn_Eha65P1YeIcOKooc5cy7M3LqKbx_9UBvcBjjqFG-5HYHBrAAP1_5Cs
Message-ID: <CAP-5=fUn8hafFn_RJs0vgaZKmeGEvWqRwtC4arYrCgogETXUJQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/49] perf python: Port arm-cs-trace-disasm to perf module
To: Leo Yan <leo.yan@arm.com>
Cc: acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org, 
	adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:00=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Sun, Sep 20, 2026 at 10:06:56PM -0700, Ian Rogers wrote:
>
> [...]
>
> > ---
> >  tools/perf/python/arm-cs-trace-disasm.py      | 356 ++++++++++++++++++
>
> A new script is added under tools/perf/python/, but I don't see the
> legacy script under tools/perf/scripts/python/ being removed.
>
> Should we maintain two copies of the script for the same purpose?
>
> > --- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
> > +++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
>
> > @@ -44,8 +56,8 @@ branch_search=3D'[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|p=
l|vs|vc|hi|ls|ge|lt|gt|le|al)
> >  if [ "$(id -u)" =3D=3D 0 ] && [ -e /proc/kcore ]; then
> >       echo "Testing kernel disassembly"
> >       perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- tou=
ch $file > /dev/null 2>&1
> > -     perf script -i ${perfdata} --itrace=3Db -s python:${script_path} =
-- \
> > -             -d --stop-sample=3D2 -k ${perfdata}/kcore_dir/kcore 2> /d=
ev/null > ${file}
> > +     $PYTHON ${script_path} -i ${perfdata} --itrace=3Db -d --stop-samp=
le=3D2 \
> > +             -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
> >       grep -q -E ${branch_search} ${file}
> >       echo "Found kernel branches"
> >  else
> > @@ -56,8 +68,8 @@ fi
> >  ## Test user ##
> >  echo "Testing userspace disassembly"
> >  perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /d=
ev/null 2>&1
> > -perf script -i ${perfdata} --itrace=3Db -s python:${script_path} -- \
> > -     -d --stop-sample=3D2 2> /dev/null > ${file}
> > +perf inject --itrace=3Db -i ${perfdata} -o ${perfdata2}
> > +$PYTHON ${script_path} -i ${perfdata2} -d --stop-sample=3D2 2> /dev/nu=
ll > ${file}
>
> The perf script command is replaced with perf inject and a Python
> command. I learned from the above that we can pass the itrace option to
> the Python script.
>
> This is fine with me. I'm just curious why we don't use a single Python
> command here.

A single Python command that would handle both the itrace and file
processing? We could. Having the script command also perform an
inject-like rewrite of the data seemed less obvious to me than just
having perf inject do the work and then running the script. It does
mean a change for people using the script, and two commands could be
less convenient than one. We could expand the Python module "session"
code to include the ability to rewrite itrace data specifically for
this script. I'm hoping that we can have more composable perf_tools in
the code, similar to the ASLR code. It would be nice to add itrace
support to the Python code with composing tools in mind. I was just
putting off worrying about this for now.

One effect of not using the inject command with itrace was that it had
accidentally broken for intel-pt over time as we lacked testing
coverage.


> >  grep -q -E ${branch_search} ${file}
> >  echo "Found userspace branches"
> >
> > diff --git a/tools/perf/tests/shell/lib/setup_python.sh b/tools/perf/te=
sts/shell/lib/setup_python.sh
> > index 2173215a0517..220d9663f81a 100644
> > --- a/tools/perf/tests/shell/lib/setup_python.sh
> > +++ b/tools/perf/tests/shell/lib/setup_python.sh
> > @@ -18,6 +18,10 @@ fi
> >  # Set PYTHONPATH to find the in-tree built perf.so first, avoiding sys=
tem-wide perf.so
> >  if [ -n "$PERF_EXEC_PATH" ] && [ -d "$PERF_EXEC_PATH/python" ]; then
> >    PYTHONPATH_DIR=3D"$PERF_EXEC_PATH/python"
> > +elif [ -n "${BASH_SOURCE[0]}" ] && [ -d "$(dirname "${BASH_SOURCE[0]}"=
)/../../../python" ]; then
> > +  PYTHONPATH_DIR=3D"$(dirname "${BASH_SOURCE[0]}")/../../../python"
> > +elif [ -d "$(dirname "$0")/../../../python" ]; then
> > +  PYTHONPATH_DIR=3D"$(dirname "$0")/../../../python"
>
> Not sure if this is specific to arm-cs-trace-disasm.py. Would this be a
> common change?

Agreed. Will fix in v3.

Thanks,
Ian

> Thanks,
> Leo

Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43247B423
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372740; cv=pass; b=On01GyqwHCTHgsP4gXYkEn/kxIeOrqe1YL9hgIJXCcPamcRCP5LnhtlXt8/BGStFZsel+F/d1cpIz3AQDpYQ1PYKWlEjRGxGsIFNlaoSOlEqUDCn2Rr8JGvbkFJw1lHN/paUjpXNv3ChWT0CDXdbMc1Yj6dwwqbUXsKDN7mFUJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372740; c=relaxed/simple;
	bh=ZiphONsMPuG6c8Tg3TIHxlnKpQCKDmMlorG/SmhRn30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjpHcFIreZkj7772E0dbbdOpmU8pLv69wK2EotBXR88IVT2bPjjnBOw7jxz2R9s186K+MDGrUq4CWWzioKGxmtqm1usLqlVmWVE0QXnPxbAp8j3CEKmMLS6pV1D6x1hgHML4ywaouhbp+nekMr7Q/MnHa/zCD35khyxXZIbHmKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=krnKP70Y; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="krnKP70Y"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52faa58bff5so92101cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790372732; cv=none;
        d=google.com; s=arc-20260327;
        b=G9hDBbANhObXm8KtwHxYu305QjhqmlRm3ae9EKOH37c3reyFXIz+qf4x46vz3tHwJj
         MnTrENHcRKoJRANOLBRDm6YoPK+TEjqJJnhYGQn85iVoNWFMdM+mj1S3eE5kpmmycDQD
         8csGkthFaY3peu75oEgIv+gao+Nhb84u5Yw/tfz+iuq01COFC/tdriFsw+9qEC42qD0J
         1qxuNy/fm3KOx/e0/g+h1RZtZspFuZomwoLRqL37GRIPEXdMn8ORzPwPjw4zrxG93dGM
         5lK8wiC3awQQPyGxSroduUVad7DDqZ44OJA1n46r6ux6BfClI0XmRb7ASPGtbFQ1RMB9
         wHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvCHE5eJ9VqgmIWTdjvSHxmVJYniXRdts205qRwHFtU=;
        fh=4X1f2Il9kQjbIR+bsxs5wDItYvLkZl2t77528i0w2ds=;
        b=PTr6eWWHUS47LCrThJSOOfSDjiCbS+H1WK7QQQnnbcGFAM2TUHkGYqAJvWRhaCslkE
         9Ht9H2vtJGeUyofc62zZd6sexF3GpHl/brbl2ZGJUlryUUe5idmB34S9Hvje0cG01Ff/
         yiL7rRGPMCiRQf2aEn/tUOGXvWQh2Qo6WxfV2GQAK3U0ZTj97RnraQ+9phR2lQ/ed9rO
         JwnmVfJDNA8tDd8nEKt7hxnW6ezh+c7e21D0dpiGUzSJWFL+RXvxermoIzPmGlny/zeu
         CjqyNNsuMm6Y9LQ0uIUw1GK4Y1PWeCvDoeDK3ETNc1qoABI3IQJLGDS9n5jXiM8RHLck
         4zTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790372732; x=1790977532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvCHE5eJ9VqgmIWTdjvSHxmVJYniXRdts205qRwHFtU=;
        b=krnKP70YIpxfzVvV31SerySDlfPArF+icZ6CSdWULJ1+y97A0HVgX6TQJCB/OfChrt
         NzJ1UEw+0N3jZTcjaf85ueJlMfSkUgKwUoGIN6/2Rc7kDtck7LssFSIg2pitPpt3BDSw
         LiPcEaWd/mraikQFVHeQVbgFAB6C675gYvS1/pVXDlg6kCHBlaVi8xWP8JKEQu6dYCeI
         iWpimVTL4cxHXSVJEMEcYmwj8733OBswnBeUx8TZm+2s3GNrbTe7eDPWc0vfgh3dEOKZ
         peLnkwuMFzvnD7evJxq+1272/oslytyQ4ywvqtt/cENEq0eaYN1cYpYHThwMdru0yLja
         YnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372732; x=1790977532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvCHE5eJ9VqgmIWTdjvSHxmVJYniXRdts205qRwHFtU=;
        b=UiwSkIRPZwjCB6CPzB6DeCRu4kXNuu+DaSPRN0mOA7CaARfD+CM/Z/lvRau6YxCdTw
         yMj39Qm7lecEbHABFOLn4unO+szfh2icB1yuWfWVt9wCtWWk8tn1lx3AcTrDPueigsMP
         7VSMMAd2NaWOUNu5IZYV+gUy2bwfsJ94+WauMv71aXVsXOK7wURGIietI3ZyJSTdAqT5
         EE+5vyAqIPxw4nYoYHwat8HSJKw/VgFuOpwWVPrE1xjM6t/RfQGHxDFvBvQMiBteVG1p
         jyqJJGgerYZH9dE8qsZP95U0utxJiSyrx9+orWafeBAt7wUsAFTMpd5/G/y2PnINoJuN
         WN1A==
X-Forwarded-Encrypted: i=1; AKwUvBzYXDUi8619bPckboPJKTJgH8qf5imlQyssNgYlUuaSvKqvB8p3hBNIQPnZY5YoTykeKJiZ5wvp4KaFIrY=@vger.kernel.org
X-Gm-Message-State: AFuF++nQaIp5gHai7SsX/XJJUiUYVc9vGpjnn+cC+CaNqCJF3FukUc6u
	XODxiUVXRx7bWh8UpMjGpZKNFn2w6GAqnVN0uXCIHJxe+YvZGo1bELRmn7LNdUKVQuHN+jseAwt
	jf2nlvGxoKAg8+brDzILrI2bnIj38XNxLZykc7wtS
X-Gm-Gg: AYBFou3UOYcOgEICtl7YodaGkCleSjLa6BKND6ADUkao6pPLzU6Z92ubalQCSn4BNbV
	7Takk2nXUBZmDnTlUQzEKrY7EJCjgy185q0FAv2bnpIyUx93Nyk+D2BpGyf6fr01GCYX3x0mW7A
	SK69WAb2QTb0hCeYaVMgUVucNye6uGtYOBEmTBjY2lM8WrXXTvpMp9xS6gK4fbdyMnLKERIz80H
	0mQ62rQxv4XDyUhhJYAzmEV3pZK++vBGa21H099xWKVqkNxAmkx32PpYIahgweu/YnHlWP8x7v6
	TCctVdLLxcwtWOOWSPhPv18GJ7AqSzwRsA22i4qfKN1nqSM6Lqfq1A4HuQVUeWTaqW+v+I3v+Di
	LTmvDNBvfOQC7HDl1urGf
X-Received: by 2002:a05:622a:1a8f:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-533226f9f89mr1891571cf.11.1790372731275; Fri, 25 Sep 2026
 14:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <f724b653476e2733c18b02268c57baaaa54870ba.1789966896.git.irogers@google.com>
 <20260923090007.GJ200420@e132581.arm.com> <CAP-5=fUn8hafFn_RJs0vgaZKmeGEvWqRwtC4arYrCgogETXUJQ@mail.gmail.com>
 <20260924154151.GM200420@e132581.arm.com>
In-Reply-To: <20260924154151.GM200420@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 14:45:19 -0700
X-Gm-Features: AclHuK-NnG2KsjQ2FK_UJ-lBInkoXvYPDJLPwdVE27RSY365Y94cjZXuWEYu2LE
Message-ID: <CAP-5=fXTYJMTtaTBZf5g6UV_-pcx0rdM=oJM=odn_dhDaOx=pw@mail.gmail.com>
Subject: Re: [PATCH v2 38/49] perf python: Port arm-cs-trace-disasm to perf module
To: Leo Yan <leo.yan@arm.com>
Cc: acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org, 
	adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com, 
	peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:41=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Sep 23, 2026 at 06:40:57AM -0700, Ian Rogers wrote:
>
> [...]
>
> > > > @@ -44,8 +56,8 @@ branch_search=3D'[[:space:]](bl|b(\.(eq|ne|cs|cc|=
mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
> > > >  if [ "$(id -u)" =3D=3D 0 ] && [ -e /proc/kcore ]; then
> > > >       echo "Testing kernel disassembly"
> > > >       perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K --=
 touch $file > /dev/null 2>&1
> > > > -     perf script -i ${perfdata} --itrace=3Db -s python:${script_pa=
th} -- \
> > > > -             -d --stop-sample=3D2 -k ${perfdata}/kcore_dir/kcore 2=
> /dev/null > ${file}
> > > > +     $PYTHON ${script_path} -i ${perfdata} --itrace=3Db -d --stop-=
sample=3D2 \
> > > > +             -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
> > > >       grep -q -E ${branch_search} ${file}
> > > >       echo "Found kernel branches"
> > > >  else
> > > > @@ -56,8 +68,8 @@ fi
> > > >  ## Test user ##
> > > >  echo "Testing userspace disassembly"
> > > >  perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file =
> /dev/null 2>&1
> > > > -perf script -i ${perfdata} --itrace=3Db -s python:${script_path} -=
- \
> > > > -     -d --stop-sample=3D2 2> /dev/null > ${file}
> > > > +perf inject --itrace=3Db -i ${perfdata} -o ${perfdata2}
> > > > +$PYTHON ${script_path} -i ${perfdata2} -d --stop-sample=3D2 2> /de=
v/null > ${file}
> > >
> > > The perf script command is replaced with perf inject and a Python
> > > command. I learned from the above that we can pass the itrace option =
to
> > > the Python script.
> > >
> > > This is fine with me. I'm just curious why we don't use a single Pyth=
on
> > > command here.
> >
> > A single Python command that would handle both the itrace and file
> > processing? We could. Having the script command also perform an
> > inject-like rewrite of the data seemed less obvious to me than just
> > having perf inject do the work and then running the script. It does
> > mean a change for people using the script, and two commands could be
> > less convenient than one. We could expand the Python module "session"
> > code to include the ability to rewrite itrace data specifically for
> > this script. I'm hoping that we can have more composable perf_tools in
> > the code, similar to the ASLR code.
>
> > It would be nice to add itrace support to the Python code with
> > composing tools in mind. I was just putting off worrying about this
> > for now.
>
> Sorry for the confusion. I should have made this clearer in my previous
> reply.
>
> I was referring to this change:
>
> +     $PYTHON ${script_path} -i ${perfdata} --itrace=3Db -d --stop-sample=
=3D2 \
> +             -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
>
> If itrace processing is not currently supported by the Python code,
> wouldn't adding --itrace=3Db here break the test?

Thanks Leo, so I misspoke before. The LLM already added the itrace
support into the Python session API in patch 9 ("perf python: Add
Intel PT call_return and itrace capability"). It  adds `itrace`
support directly to `perf.session()` in the C extension (calling
`itrace_do_parse_synth_opts()` on the session's `itrace_synth_opts`),
and `arm-cs-trace-disasm.py` defaults `--itrace` to `"b"` and passes
`itrace=3Dself.options.itrace` when constructing `perf.session()`.

Because `arm-cs-trace-disasm.py` already defaults to `itrace=3D"b"`
(matching commit 89db7f0db172 ("perf cs-etm: Filter synthesized branch
samples")), passing `--itrace=3Db` in `test_arm_coresight_disasm.sh` is
redundant. In v4, I will remove `--itrace=3Db` from
`test_arm_coresight_disasm.sh`, add `PERF_ITRACE` forwarding when
`perf script --itrace=3D... <script>` is used, and fix two issues found
while inspecting the CoreSight disassembly flow
(`symbol_conf.vmlinux_name` initialization order before
`perf_session__new()` when `--kcore` is present, and recording the
initial `CS_ETM_TRACE_ON` sample's `sample_addr` before filtering `dso
=3D=3D '[unknown]'`).

Thanks,
Ian

> Thanks,
> Leo

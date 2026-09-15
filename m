Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA57420E7C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505015; cv=pass; b=cM2doWZmNMdFiKDJ2XYbqiHFutEha2KyRN+kHZn58hZfxaUMo0JHOi4Ick/6daopbTOkyWWQxeJPQ2fFNoC79kAzcm+HiJzHZwKbmISZW6xFb3QOVKFBziai7Wu0VHmv8vcnH1sv/lnGA89+rXnMcecYvEIePvGId6oFNzMhR+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505015; c=relaxed/simple;
	bh=5LBKxwU79FGsx7tIU937PL+51gEJAsWIuLxSQRCF9dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJHI7XHHOvPKbfoEQ9k/jYMyJr2ALrvtPHo1FnPWubD351FlFUcAK2aP0ruhezUdb9EUi6/FjsWfwWcXG/7LKdiD58pyt2Xyl5jnFrvirwoABIr7ECji/TjFYflqCo4ObtN1GyzpMwxYUuBDuGwp8E3vuDg9sbBK+oFdXPenB0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOKKMqGN; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOKKMqGN"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so19001cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789505010; cv=none;
        d=google.com; s=arc-20260327;
        b=aGkK3rznM8VgnOzquF29JhSB2RQlPXnkl1nuUUoBBjLeAkfIDWKoUwOryBLptCnPke
         qAQ4wD4rVsmUr2pPEB77lYHKjcbLJo1UT/4U53j4vDMJY1rCCQT3/p6DcD4xwXvSP1jj
         Hnvu3Fl7d18qr/s6J7d1FVji5zzCp3ftMf5q4iWJlYSZy17dJRmuxNB6cG4rKKxUjB70
         vwX7ThmmGSX0nruSyR/l06hjuuuyvrn/RYFspZfFxqXUSa8D14xwVXKxtnbWf8s4n2jC
         QxaFVMI6e9WlNhfO4xCdx3dDYWbkFtkBvLisuVFjKFgVMjVaTDp+4OuydikQQYt0Xt6F
         UCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxcMcTW254D7Js1d9QcVB1rz5hl6w8herQA35v6+0+s=;
        fh=JXj9pf5ud7ro8mBZFVoqQ+KjuQzUbKhL5gOzTG3RV70=;
        b=eQfYfw4E7kmb6UAs4GfQEhx3sxDPSKaYKBo80VUftEnnLMx+OU+NVX7uDMeohWOAO1
         MRSsPaa4s7SMc1Zp+xVZ5/BKJmwPODF31JJS69GH408pLPZAFtYrWvIBNkFCCKyu07k5
         EprVGgtG8wAxRmVtu0P/rVR95WZ1319xlx3El7uEFPBdtc/7WciMoEbqjkrHbvD+CBwr
         G698+mN3yI4B+qda62m37IxA+JAbdV/wG1DPZEPYNzZ0HCGXOfQr22XXaxNCrkUgQupc
         CcO781KJf+NC+W1bCZhGf6JDbQZUNzJK3vkxzlO3dTOwVSPy5T+rDi1VMGrSes4sKMg1
         ndSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789505010; x=1790109810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxcMcTW254D7Js1d9QcVB1rz5hl6w8herQA35v6+0+s=;
        b=iOKKMqGNleS1j62hJpNntTODpmoY7xxzX9d4NggjnAqdsk+Jrwv4HJ3dqmNlbkIO2T
         SvSCGeKqFwCUmTOnra8HTiIKSkxCAMXKI2XZdRUPnbAciJzA4b2KLxSW4iNMASCh3mvV
         9OKfoBFNUqxhC/zyzOfSqI6x+h37nad3jI0GxXGxxGaDuWSV+yEg5/uMs9emPVBYOYx2
         uimBoyu75hSCo5/taE+OM3ACKRlLnam24h62AxN21VStrY1sjisFB0Pn7yV4FXW25ZgK
         LuEWH44bi3dfgRiYrEvYa64T7jAJ2HM/v5nPA1F+O6uFKB4ZfJ63ufWcQiddnz0Omw6y
         vfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505010; x=1790109810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxcMcTW254D7Js1d9QcVB1rz5hl6w8herQA35v6+0+s=;
        b=eM0UbOcj1u8s37a2gx8qqCX39KPLLqO7QWFc6SC7ZCKEJZUpJ4gCKo9+CiePz8aH2K
         GMHLVosKKceX2l+K9RjN1gs7Hhugomk12Il9PDInlBaBVEQOieeBUccdoB967t1kSU6h
         DebK5zR4MKgmq3SdXqFKVVZ6xa5ZDNRteANVSvDvLbqNnbLTzIFq3lz/IXs7eWvn8qL0
         3QATg3XErVrVebrlBZltFVBO+3/TEoH2lniwm/rW8etpfFNYBiKOtWvu7ffp0zv8NHvI
         toZct4aklBOWRm3/KK+LG9lcq0FsZpeimCvIncGekAJKtbAYMIu6dQnNg+456qnZWGQO
         92NA==
X-Forwarded-Encrypted: i=1; AKwUvBzVEkIDNjrdl7aB9SGDu9G+weKWEeti7lYlgRaK9LRYcZ+7SSVG6eVdgxp1HufLkcE6TUawqkLuV87LevA=@vger.kernel.org
X-Gm-Message-State: AFuF++lF/8uxnZ5RDsyvryVncw2ReIPxvs4KmHPga0qjU8N0oPsqVvHK
	e7CvA8HOszbkuXzOqsZW9tTcp8Whn9PxAW/M2CiT2L7g0qEPDZallGDn8k3M3aV/uozgXaKfCcb
	S3qxTwUy0+YvZYMx7oW2gcNzXGisTXMFUw/CTXPWu
X-Gm-Gg: AYBFou3iJA6f33o+tdvCyrH2TUK+sBdkhYSkN96YdcE0EeSUaN6Dz33nK5kcta7rN5g
	mNgB2fT8mbdEowPQAmX9MSNLrH1UMQsRnl4EvfjuQqNORKhEfKORITRpLfFMIjQkzc3Y71l9Bup
	YhR+Ltsi2gh6HlIJBY9/DqDGrp7kh1qPNnUJfLfXtoUeFJ0UfcMB9MO6zNCcqcuBSx8F1rbdBfW
	Lvl7PcpR40LTRgc54V8c/vehJHzGVS8laUGKVxrx++vEIYZyuol7typFzKv7nI+0un5+DglvxlB
	/sFUzVnkC5Onogyd4QgbHfv/+kcUcePm83RCZ6d8K/DUh4tMV/ZJuJsHx97Jdwj5ALtLa5A1QOz
	AwsrGpBhsBQ==
X-Received: by 2002:ac8:5f8d:0:b0:531:a85:69c1 with SMTP id
 d75a77b69052e-5327e6ab465mr306701cf.5.1789505008852; Tue, 15 Sep 2026
 13:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726094120.331668-3-thorsten.blum@linux.dev> <6c6e55c5-8275-4cb5-9f86-8770cc7ad19b@linux.intel.com>
In-Reply-To: <6c6e55c5-8275-4cb5-9f86-8770cc7ad19b@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 13:43:16 -0700
X-Gm-Features: AcwNN1XBCbtuwqf-84xx1OeLRosIWZDCrze4C3s6DVvpZPcA6lieFVhLq8K4qJA
Message-ID: <CAP-5=fUdeyTy=H2kJiJ5St3EMz-ooi-F-9iE8z5S_iXRDY+k7w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] perf/x86/intel/uncore: Use sysfs_emit() in uncore_event_show()
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 10:07=E2=80=AFPM Mi, Dapeng <dapeng1.mi@linux.intel=
.com> wrote:
>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> On 7/26/2026 5:41 PM, Thorsten Blum wrote:
> > Replace sprintf() with sysfs_emit() in uncore_event_show(). sysfs_emit(=
)
> > is preferred for formatting sysfs output because it provides safer
> > bounds checking.
> >
> > Add a terminating newline as suggested by checkpatch.
> >
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> > Changes in v2:
> > - Add a terminating newline as suggested by checkpatch
> > - Link to v1: https://lore.kernel.org/r/20260206194254.36105-2-thorsten=
.blum@linux.dev/
> > ---
> >  arch/x86/events/intel/uncore.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/unc=
ore.c
> > index 7857959c6e82..1ef4b4a5f545 100644
> > --- a/arch/x86/events/intel/uncore.c
> > +++ b/arch/x86/events/intel/uncore.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  #include <linux/module.h>
> > +#include <linux/sysfs.h>
> >
> >  #include <asm/cpu_device_id.h>
> >  #include <asm/intel-family.h>
> > @@ -153,7 +154,7 @@ ssize_t uncore_event_show(struct device *dev,
> >  {
> >       struct uncore_event_desc *event =3D
> >               container_of(attr, struct uncore_event_desc, attr);
> > -     return sprintf(buf, "%s", event->config);
> > +     return sysfs_emit(buf, "%s\n", event->config);
> >  }
> >
> >  struct intel_uncore_box *uncore_pmu_to_box(struct intel_uncore_pmu *pm=
u, int cpu)
> >

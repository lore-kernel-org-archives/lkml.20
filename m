Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F335E1B2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936227; cv=pass; b=rjge1DzQHJqt9kPCc86P9h+vN/EO0UDhlAspYTMi0ZVi4iNgldwjE7xrHxRJ8eT3DvGjXaZwCEfksDAo0dSZi+ax63nQxT+mSRyX1DJarLtENI7lBexJo6r/aVdgzJBtihpc1KFWZkn21csn/UAP6wv7+5J1Wy5slSLBQ+0FDxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936227; c=relaxed/simple;
	bh=r0GZwhjYzS5yMdCEzm/zuqVDAIpZReHgTF+jJj53I88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCSUMAct/VD1rAGdvjShAQnUrM21oB5HpebNOQnEAkgfaGehBNPAxJllr/Hax6CjHw+gb85YwYV4Y7K03fOpmN4ZLdu8XM7Z8JfWdvFV2W5LUi7wPMVmoP2FFtGW6sx6FiqsxlA0NjHz1ufNYQiDXC+SNMaBsotEndidLLFX84U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gk2Lz7pB; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gk2Lz7pB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1812542a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787936223; cv=none;
        d=google.com; s=arc-20260327;
        b=rky2AcBL8UDasV+MEa73usIJIcUWuDwdmIqAWiLSOrzbhcC4ZYsEBilsr7ECwwjEL1
         QATxIhNi8FBcOFUeeuH4U9CZTs6YnBs8KU0h+JlSLL+DFa9YQZ1nmdiogR5O5gTpBXob
         uuzz2rx6zUgqhuGyDYO7SiIhr6ZMIIck6lVCoJsatjAOBgM/CBR+fbFx13gh8oOiFOlJ
         1CYQscn072DThIHnIemqnJN45JRRBgYmK95X94RqubR03dla7LbqSBf3XZQL+ZIxrXBs
         dQ1x3rRYENNrAJo2B7R05z+LZCeFQHyCYoKR4HqHy2+kupmy+pYv9pXk/0DovnNPbxtl
         aL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=llLUUEvxKcSB3r+IkkvNhdahjd0ayKPcFn5/bGgqRFk=;
        fh=no6KuxbnUV+OA/vatXOZNtKt7jWuStQATcHkLwzO+ME=;
        b=ACdBtBWs6iooc4QGNRjttvyJb27XhwdwhC4fhnLyh7XCTcsouf2qZnk1gly2Xz6lql
         YjH4zPjIqT3+eH6rcuYvWDa2FiGbYvfo4j+k1v44XMl4FKVYYYW+xHvrNidLXp7SO3df
         +Mrx8qLtwH0JqGd2ou02XDvVsx5YKrwEfdmwf3NaeAPrlohWDQR97Y/8m/6oTsJQ8HPz
         PUkf70ghkhwGp/Xp2tJ5EUTlTfnB+HkGVQ05azhWoD3Vp3taxOfK2Qd6FPlxYPp2GYE3
         +Nv2JqigxNA3APzK/MdpGSZpiZmW1+p3EKUu90Z4JOjBPOic1VW+zZTHKVHYc0LBSoRg
         gFRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787936223; x=1788541023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=llLUUEvxKcSB3r+IkkvNhdahjd0ayKPcFn5/bGgqRFk=;
        b=Gk2Lz7pBgD5eIoUpVseKi+XIekRDuIphs3ppk+lSMGqCmBEGMpzFuIsM/67ezDMigo
         estXdygvGG4LShfzZ1ocL8gqz8mSKwN+7l3f1Kg6lSpGmGXaqpz8wWqggnUr1aj3S6cA
         3ZwCuyzsOloBOYW6NIJfeKlIkbg9EVVvG0NBDlklUqSKZ++DAQDU/6luaxIychlIUm/S
         MsWqhT5cEEA2gsGigvvUYpcln6/hkp1f5R+E+/Q3HPIop5ck25upgkKHglhAY3/9flqE
         QeEXva+tjIC0Xpgy7sJxvVEN7Kl37MFzk0OFsLNGF9rH4KVYR9E13M67Y9tNabM/oqgl
         ba3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936223; x=1788541023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=llLUUEvxKcSB3r+IkkvNhdahjd0ayKPcFn5/bGgqRFk=;
        b=dQ4lH90ABL56rXwO1caeyoLsC9+C0aZkm2kkn4VnMUoQOnt4A+p4+H+5WH+IbFATfS
         LYKfW9wTsFs8jFl4nbYlAONErGZKkcFO85ogDoQh3V92i+FwMuikoE/5I/iZqf3ZfEOT
         Hb+QttQbttEfLP7wURLKpWvZMPF0ilP0wZuK3JMWstZaDN3wkh7tv/2P9sZfSh0oVHNt
         DZa4HPXv+P3236x7p09E+YntGqdkof+1OOyyOTohe8+q4mwYkrL9psMDPsLT80VguwlL
         +B61zTjplCwBW5iWF9a/ZA7y2FPu4JeGdpUKJnsLL7kdG/lQEJY0TbN5uE3rXV4573qi
         CjQA==
X-Forwarded-Encrypted: i=1; AHgh+RpQuAPqnKYw+TJnR/PKMmTCTbQ2itxHHxUmIPzGm9gWvNTHNdgx72A3YUdchhqOlTHQ3S269P2eGk34o7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ku0zpok7IslMok0LqFg8212q5xTFrYFg7BwqT8/IfMTXdber6Q
	oInzazpVLs7GfrdnK9G+v3J4zoAtoVqlJWTTlkiTU3o/09W378iqEMqyhhj+ZHGekf3X38CgEsC
	mRirR1thJwn0KJ1OGBAzGnycs/02xT4TKLdf8/Fhc
X-Gm-Gg: AR+sD11Iz4eQF+Vrj0MSJUVd33zkBe3b3OoXVN90tS68/toIK11Lup+YfHIzzVCokV/
	W6BB1FdMMUMxu4syUn0FunlfkJMDdPl117Ve03F0mbYjYNnLtPZcIXzIVyvdRrG/ma26k40OEOO
	owktzLEmugt7N+AczXd9o479A6vAgMCWUIIduQf3TaqsP8sak44wl7OCJ5UF+v1T5bogW1XFs1V
	U5W2Aqk2sqHeJqI2//5/k/7CNcCH63zukdVMzqF/6vo06QDTrpGKOebB/mdAzVcEGRFDxN2Z9JW
	jLpFqiibvYio5kE2cF2kZyJdIfaWqzUnLQPrXbJy832VdUpUKW9lxnfyOgW+grLUsySPJQ/hesg
	f2w==
X-Received: by 2002:a17:90b:164b:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-396d1007e54mr15555959a91.15.1787936222341; Fri, 28 Aug 2026
 09:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527221934.3830896-1-ctshao@google.com> <20260528001117.3BBF11F00A3A@smtp.kernel.org>
 <CAJpZYjUiNdN3a6y+8rs=YP2Mgtj6EQJnkiB9TN_suWd8fGkoEg@mail.gmail.com>
 <CAJpZYjUhw8+ouKTS82G6ih457=pHn18AtvwMCAcaTL9csKmdTg@mail.gmail.com>
 <CAP-5=fVAckZihxg4djQn7iTGbNNT1vFLXt2En8mm8+COSs3GcQ@mail.gmail.com> <29d02905-14fd-4c2a-86d0-a605e9d41b10@linux.intel.com>
In-Reply-To: <29d02905-14fd-4c2a-86d0-a605e9d41b10@linux.intel.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Fri, 28 Aug 2026 09:56:24 -0700
X-Gm-Features: AcwNN1W_S20D0FkuWkkav0ZFZqZ_b-4MS61_ZQqkTVK6IGSYpwCQYbl0UC75gog
Message-ID: <CAJpZYjVoxEjxmut5AL6dOpfTSBj9VZOs3qaawofDxWyTeaa8Ug@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 1/2] perf pmu intel: Generalize SNC cpumask
 adjustment for multiple platforms
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Ian Rogers <irogers@google.com>, Zide Chen <zide.chen@intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Ian for bringing this back. Zide gave a Reviewed-by tag on
v6, and v7 mainly addresses the Sashiko review.

To Arnaldo and Namhyung, Is this patch ready to be merged?

Thanks,
CT

On Fri, Aug 28, 2026 at 1:11=E2=80=AFAM Mi, Dapeng <dapeng1.mi@linux.intel.=
com> wrote:
>
>
> On 8/28/2026 1:28 PM, Ian Rogers wrote:
> > On Tue, Jun 9, 2026 at 11:44=E2=80=AFAM Chun-Tse Shao <ctshao@google.co=
m> wrote:
> >> Ping for attention.
> > I suspect Arnaldo and Namhyung are waiting for feedback from Intel on
> > these patches. If someone could check them it would be appreciated.
>
> I suppose Zide has checked these patches and gave the "reviewed-by" tags.=
 :)
>
>
> >
> > Thanks,
> > Ian
> >
> >> Thanks,
> >> CT
> >>
> >> On Thu, May 28, 2026 at 2:31=E2=80=AFPM Chun-Tse Shao <ctshao@google.c=
om> wrote:
> >>> On Wed, May 27, 2026 at 5:11=E2=80=AFPM <sashiko-bot@kernel.org> wrot=
e:
> >>>> Thank you for your contribution! Sashiko AI review found 1 potential=
 issue(s) to consider:
> >>>>
> >>>> Pre-existing issues:
> >>>> - [Critical] An integer overflow in `uncore_cha_snc()` can result in=
 a negative Sub-NUMA Clustering (SNC) node index. This bypasses the upper-b=
ound check against `MAX_SNCS` and causes subsequent out-of-bounds array acc=
esses.
> >>>> --
> >>>>
> >>>> commit be394e8b7ddbe730c3fc40fb608337fe19c7b33b
> >>>> Author: Chun-Tse Shao <ctshao@google.com>
> >>>>
> >>>> perf pmu intel: Generalize SNC cpumask adjustment for multiple platf=
orms
> >>>>
> >>>> This commit generalizes the Sub-NUMA Clustering (SNC) logic previous=
ly
> >>>> specific to Granite Rapids to support multiple Intel platforms. It u=
ses
> >>>> CPUID to determine SNC support and caches various PMU configurations
> >>>> to improve thread safety.
> >>>>
> >>>>> diff --git a/tools/perf/arch/x86/util/pmu.c b/tools/perf/arch/x86/u=
til/pmu.c
> >>>>> index 7c9d238922a6c..9b00d5720fb7a 100644
> >>>>> --- a/tools/perf/arch/x86/util/pmu.c
> >>>>> +++ b/tools/perf/arch/x86/util/pmu.c
> >>>> [ ... ]
> >>>>
> >>>>> @@ -121,46 +142,73 @@ static int uncore_cha_snc(struct perf_pmu *pm=
u)
> >>>>>               return 0;
> >>>>>       }
> >>>>>       chas_per_node =3D num_cha / snc_nodes;
> >>>>> +     if (chas_per_node =3D=3D 0) {
> >>>>> +             pr_warning("Unexpected: chas_per_node is 0 (num_cha=
=3D%d, snc_nodes=3D%d)\n",
> >>>>> +                        num_cha, snc_nodes);
> >>>>> +             return 0;
> >>>>> +     }
> >>>>>       cha_snc =3D cha_num / chas_per_node;
> >>>>>
> >>>>>       /* Range check cha_snc. for unexpected out of bounds. */
> >>>>>       return cha_snc >=3D MAX_SNCS ? 0 : cha_snc;
> >>>> [Severity: Critical]
> >>>> This is a pre-existing issue, but does this range check safely handl=
e very
> >>>> large values for cha_num?
> >>>>
> >>>> Since cha_num is parsed as an unsigned int via sscanf() from the PMU=
 name,
> >>>> and cha_snc is a signed int, a sufficiently large cha_num could caus=
e the
> >>>> division result to overflow into a negative value.
> >>> I think it is very unlikely we would see cha_num > INT_MAX.
> >>> Since that is a pre-existing issue, I prefer to fix it separately.
> >>>
> >>> Thanks,
> >>> CT
> >>>
> >>>> If cha_snc becomes negative, the cha_snc >=3D MAX_SNCS check evaluat=
es to
> >>>> false, allowing the function to return a negative index.
> >>>>
> >>>> Could this negative index then cause out-of-bounds array accesses wh=
en used
> >>>> later in uncore_cha_imc_compute_cpu_adjust()?
> >>>>
> >>>> uncore_cha_imc_compute_cpu_adjust() {
> >>>>     static bool checked_cpu_adjust[MAX_SNCS];
> >>>>     ...
> >>>>     if (checked_cpu_adjust[pmu_snc])
> >>>>     ...
> >>>> }
> >>>>
> >>>> --
> >>>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202605272219=
34.3830896-1-ctshao@google.com?part=3D1

Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498635893
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462797; cv=pass; b=iXX5zXSdBkKOax4lOxMtouDvOWlaT2QHYPjZ34kySyIeRsCc/myAgAcFFVIxRVmwr/gGn/g46OPFn4Ktdc8SHMAzCOeLWwIU0oS9viPmRDOge9P9nQyGV/5fVRKW15cu6ZnBpIlTcHPt+j2eSg9voIiw2N2Ug2OGBXh59WK5jpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462797; c=relaxed/simple;
	bh=EGsHpMqvsJdko56+qOe+JPf8zXAERHfCpLuYy9xQ4Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5/trX83173/M/liMro38KcRuQWJBxL7GXT3o4lOQQNbrDGsudJmmOAl9sK167R3WKCiLfYiGKyJBmJDlkn06j5CKem4zh5zGm1iFaSecOsAk99IkNspX4Yrs/wEnRHMVCttF4rGsP9ocTGHpDeeWjN5SsMNb8HKwUovNOlDc1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EezoyIBf; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EezoyIBf"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5333401e359so28331cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790462794; cv=none;
        d=google.com; s=arc-20260327;
        b=o2jflMRzVlYcTZ/Y8eY3ZtS6HBTD7oEEU/LdIx2Roo/6UkgtKYB9OlCt9GHDkTFS8o
         meCkucUgxIVp0CVIb36WEwk7ncJXWHnV3QdpMUSpeD/V466pP737Vqbb6Jf7Uh0nXebX
         XPG2m5N+ZrseOyZWM3T8sMQuJShoyLMmgPQ077k7FiCTPwdTNT5Z9vzIFdKa131z9K+s
         3iPjUY2mE0WJxhKOkEEx6p+iwBUwPoMorsvfXwQ+9gUq5fJzJ9qzSBl6uAciLNfnmAjS
         Cct8ju6vrYbHpTEGhUBPj4lQCCBf9uOIQIkot1DxBGjm2VPSzHaMsRsVIIWuvKbotLxb
         gp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PCuo0S1OV4LTqlcYTiFFagxuS84m6WpikLQczzGr1KA=;
        fh=32NelqcW0jQb1ZDAvU46pXM8g/+tvf/RmREEgPCokS8=;
        b=gACFsFQXlpK0m3kwuD5wcYxMFAmYn1MHcocCecM8Fh8C7E8Lv0xgWeFtaE/1EiRsNP
         DXf+5l0r1SN8Bw9n2yY8rorgDG4X4ijZ0odY0fq6uFv/F9AsMSsV5ZRAuxTiYIIs9JfK
         dDi09tNscs/u7oOcJny573dv+z8sfOrwP/772iQeGrpel3JeONdagNlHNrEWNDNfD5Fc
         CfOha6e3NiewfVu/XeruQSHTypcx0sZskWF3PkpD6ZvnbHunslPlc8/erOuf/WiosCSV
         7Ef6VOW9MrX6llhsvC5mZ/qsHjpNjX9ecifCWpfyhUWdsY4Mn/r0UTIPvpxpE4YKlvNE
         sh3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790462794; x=1791067594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PCuo0S1OV4LTqlcYTiFFagxuS84m6WpikLQczzGr1KA=;
        b=EezoyIBfA4xIfoskj7bYG+kD6m4fv3Lvcd8SN5uFcFcVW+mSmw3Gv8VaytuW5aZBlH
         XwrnZXL+9cu30X55tlKQtu7ORptUSnOhRDwqSd8C9FHfhXFSg8dJlc9xo3vsmkwDExNo
         NmD+Q/elTKOT67ntKK9lwIneh9IOWBm/EuH7d3kpU++fdxSeBpw4fbwaB7rskzV+2TMT
         J9/sY3lvR5kuNlA9WHoJOXqVJm1dMGgLKqpU8sccP38e5j1OnCNf4Jf6U2JxFRWXR2uI
         JnGgHGbPIVj/McHo/ku7dZehJXy3EnmTEqfUzvbaoydoVb4S2MOhxGAYmDn1z5uCs5Qu
         2ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790462794; x=1791067594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCuo0S1OV4LTqlcYTiFFagxuS84m6WpikLQczzGr1KA=;
        b=AR0I9zFiUJAedHVc+3cILSPIWGdOoxBTCKaTGLV7y/wDBc1+ZOYP+467Pu6ckHkw0P
         sleAVW/YIO+HyruHbmMLP3nmP/gv1dAZj8w1J0Gf94sy6JJyw1twi/fzT3fGZ7soKVXI
         pA5eG687AjAwDYVhciP/SFZ9JzkZ5ZBV7xZSZEP85EL9wlOJ6nU5HnJfu5YD02eHj/X8
         TnjjBVCua60x4JHLBweJQtRXJjrx4xQAtFmRqsYbAIcNsCt4kNNEN6mkIbSsHwIk2UPQ
         Ik/+m9AXivRztphykwuu335LORXwnQ5B5QI90IKe8aOiBN16YsTFBlrB4xzMxtvPnStB
         /OhA==
X-Forwarded-Encrypted: i=1; AKwUvBwQMJT3tsob/kOc8Qr/Hcg16oR5LB2eV3qu8f0zOLFs1W0ZHSUOh1AsqHOhLaVyRI3LcOnX99mBMLUvFMg=@vger.kernel.org
X-Gm-Message-State: AFuF++lVkFRMW2w1f69IFwhj0hVaWq+n46xh2/yANJyAZ770H5jmh+nb
	tJc7maSh+OsTrqWGcNRwPzgjQVLQmUQQXyXUaSb7j1Z1RxTiK1tKpx2gWCvv1UBXBOy/yVX7W5l
	DunLdg3AvQpI/3gJI0jhnhEJa2bwNpy1z9tE5Js/7
X-Gm-Gg: AYBFou0E2AUU/YGJC78CTSh4Ccq/Y6m0t09D+9JQCj1OP6CC+jUVig6euEn0r/Do6p2
	8xanze0aCUcEZNtrCn1ywdjoLJrF/42F1azp3lByWMzwkaLEtC2BByPVaLdst2dragUQkHaog9h
	PW9ORADbpNRpqpqhc07Dj/+Ng7ccV1vwMu9+N9nqWGVcuBUZ2a6zbidSzdJUGLIhw5+RQ6+upbl
	71XWaLHuXMsoHQfCrdlyPAXA+lBX29oupinyVTKTLoDtK1pTvCqCpZ5WO9M9Bo2uQnzDgdCWvsW
	+p9PG2LcBYcrG2Eaqk9R1a6Nf2CXkbyxVHLyAqhu+ZcASPJ5yH0P8KsfBQDmQjtIkQ==
X-Received: by 2002:a05:622a:2613:b0:532:84d3:abb with SMTP id
 d75a77b69052e-533226c3db1mr13278171cf.7.1790462793627; Sat, 26 Sep 2026
 15:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923181213.3032038-1-irogers@google.com> <20260926062029.800743-1-irogers@google.com>
 <argt6raEAmM4e9PI@x2>
In-Reply-To: <argt6raEAmM4e9PI@x2>
From: Ian Rogers <irogers@google.com>
Date: Sat, 26 Sep 2026 15:46:22 -0700
X-Gm-Features: AclHuK-0IxZAf1dYZJF9GMyttOC5x9pBIt1GNidk8M2Zep5e7G-BGHdFJ36Ha2g
Message-ID: <CAP-5=fXvENrH1PrQvQmA22h_XRTB_f_ez_sFU9him6dU4uH0Ew@mail.gmail.com>
Subject: Re: [PATCH v4 00/49] perf: Complete transition to standalone Python scripts
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: alice.mei.rogers@gmail.com, james.clark@linaro.org, leo.yan@linux.dev, 
	namhyung@kernel.org, adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 1:41=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 11:19:27PM -0700, Ian Rogers wrote:
> > The perf script command has historically supported running Python and P=
erl
> > scripts by embedding libpython and libperl. That approach has several
> > drawbacks:
> >  - high overhead from constructing Python dictionaries for every event
> >    (whether used by the script or not),
> >  - complex build dependencies on specific Python/Perl libraries,
> >  - threading and interpreter lifecycle complications from embedding the
> >    interpreter inside perf,
> >  - no unified model for standalone scripts such as ilist.py, treport.py=
,
> >    tracepoint.py, and twatch.py.
>
> So I applied it and tested on the containers, make -C tools/perf
> build-test and 'perf test', that has some flakiness running the new
> tests for these python scripts in parallel, nothing that prevents it
> from being merged now tho:
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 146
> Passed subtests   : 156
> Skipped tests     : 28
> Failed tests      : 13
> List of failed tests:
>    72: Test dwarf unwind
>    88: daemon operations
>   101: perf kvm tests
>   111: perf record tests
>   112: perf record sample filtering (by BPF) tests
>   117: perf sched tests
>   137: check-perf-trace python test
>   138: compaction-times python test
>   141: failed-syscalls-by-pid python test
>   142: failed-syscalls python test
>   144: futex-contention python test
>   157: sctop python test
>   159: stat-cpi python test
> root@x2:~# perf test 72
>  72: Test dwarf unwind                                                   =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> root@x2:~# perf test 88
>  88: daemon operations                                                   =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> root@x2:~# perf test 101
> 101: perf kvm tests                                                      =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> root@x2:~# perf test 112 ; perf test 117 ; perf test 137 ; perf test 141 =
; perf test 142 ; perf test 144 ; perf test 157; perf test 159
> 112: perf record sample filtering (by BPF) tests                         =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 117: perf sched tests                                                    =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 137: check-perf-trace python test                                        =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 141: failed-syscalls-by-pid python test                                  =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 142: failed-syscalls python test                                         =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 144: futex-contention python test                                        =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 157: sctop python test                                                   =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> 159: stat-cpi python test                                                =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 1
> Passed subtests   : 0
> Skipped tests     : 0
> Failed tests      : 0
> root@x2:~# uname -a
> Linux x2 7.2.5-200.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC Fri Sep 11 15:11:05=
 UTC 2026 x86_64 GNU/Linux
> root@x2:~# cat /etc/os-release
> NAME=3D"Fedora Linux"
> VERSION=3D"44 (Workstation Edition)"
> RELEASE_TYPE=3Dstable
> ID=3Dfedora
> VERSION_ID=3D44
> VERSION_CODENAME=3D""
> PRETTY_NAME=3D"Fedora Linux 44 (Workstation Edition)"
> ANSI_COLOR=3D"0;38;2;60;110;180"
> LOGO=3Dfedora-logo-icon
> CPE_NAME=3D"cpe:/o:fedoraproject:fedora:44"
> DEFAULT_HOSTNAME=3D"fedora"
> HOME_URL=3D"https://fedoraproject.org/"
> DOCUMENTATION_URL=3D"https://docs.fedoraproject.org/en-US/fedora/f44/"
> SUPPORT_URL=3D"https://ask.fedoraproject.org/"
> BUG_REPORT_URL=3D"https://bugzilla.redhat.com/"
> REDHAT_BUGZILLA_PRODUCT=3D"Fedora"
> REDHAT_BUGZILLA_PRODUCT_VERSION=3D44
> REDHAT_SUPPORT_PRODUCT=3D"Fedora"
> REDHAT_SUPPORT_PRODUCT_VERSION=3D44
> SUPPORT_END=3D2027-05-19
> VARIANT=3D"Workstation Edition"
> VARIANT_ID=3Dworkstation
> root@x2:~#

That's great! I'll dig into the flakes.

Thanks!
Ian

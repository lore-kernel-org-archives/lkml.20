Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851092;
	b=gVMhT95cQ0vsPnmYit7H0akqGI9nT4/Ze3OSjJDzRDxIA7gX4pma2j7uWz2II8z/sFYj
	 uF9zhNqBeUppsBD9qlthJKf15i4LX4OjOX4gpiaNOsxtmVQu0y9W9JDF1A9tcVmh3xoV5
	 +RRr3VswbzYmhEyRyU4Zt/bj6EmNmDAs6a02VdErVjjVtV5C3HUm7BMwl89UV7SRhPe1a
	 rbGC0+Tl1VVHHMvDCw4VVa2rZKaW9g+z4uaWJth+PaCrWWg8oXfzKfKENoLgVvtgYzgOb
	 GjHchs29mQiQ2uprQjbYF4Qz/4qnu9aMjZYIfQDmnn03njeT6wfFVbiDDzeY/mN5Jzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
	b=s6lLD/DktHvI9YIyDzg3VCt3QkT30kLGz/XmiRwLgM/4NEe4+LKdzqc59Lm0VfEzr8+w
	 3zeWnPd8uS3g3FEo3zRcu1brNhd10TeSMD6zj/9XUcZ4oSWwR+/NHTcLvMaZtQdsLkVfi
	 8+aWG8CuEy5nf4DmWbPrCq0HyN/40cs11SE6Es3pfS/XWQH77Zxr1ep/PnKrw/i5Y/Dyz
	 m2n6N/BYXlmyJJ+HM2NG5FW5GD3U24Jtf0zCzsNsTxcfpdKW9sAkPQ6c2IRiigPg0JjHj
	 VuM148TKgVTAxNUhbUQGQPf0K8ijhv3AWkgqlGDvM50D4AdmZBj+yX+r+xPFse/q58w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ht5Xe0wk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EFC606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EFC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ht5Xe0wk
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so163021cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793851090; cv=none;
        d=google.com; s=arc-20260327;
        b=cB7JGSIXMtukT0EQcwuob6ZvaVzsy0+wYgvClw2GfVpF34AVdbQY9y3SHLkwwH4hS3
         ekYV+CCMTS9B30d66CGVojcMFXmpjBhnsFLs7P+/n3bLVtexIhKTn1jUHdf1OBbTZQ1r
         ec7xIfZqTBISSgUqFapy9qWUyNL06eGA0DklBVc7X7IIG37DpgCllLPKQWONKWw/sLOL
         9kTtzkofxmBv+adFvPwf0jbhuicKxSBWm1rgDF2iBjIkDwJTRX0MQmPOlX1pu4EWUf96
         naM1N5Iik9UTI46FYyP8o7XezttbmMWWLDzcjcOkIYj8wuSl5qOOmGbnzV7HPOE4eV9V
         om0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        fh=PsFzy+mlp/hH7xcihYlUeI4l4jI2ilQ5OV8olfZFBrI=;
        b=ZB5zCBP7exJfYrI9UYEHetm0HcZTdmRuTShjq7O8FGEInmf89B6o5fpSs+VtInyA2p
         8rlZfNOY0a6HwHlNzCiuxZl6tskaJ876GOSrIUis5retGtcDibc/4Znic5KYQ4NDUN1J
         b0AVEo/h+jRnl+uewYE+i3W4BP46+Q6A1E8cvEQLk08YmHBr90ODDTCHXLSHx474wpvH
         eENDeKV/Ux0MolteMu2NtfIx/VyK294gmHSOEuZ0nMc6CB48t+sYGtDRVoe1tOCmzl1q
         Adel9cJ28GOJpWDung9pDXZbD5uqG3sziSHKKUjB/1WlgRyVRlrAGifRuF7Yh63sRyuJ
         s0vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793851090; x=1794455890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        b=ht5Xe0wkWXoadZQbiKuAIp9T6s/a1Y0gAD5nEVXXSjbYFepgrkxfMO7n2wtRLUuRwf
         vxX9wpYxwCJmEM7KZY6rJp+vg4TIBxhSVYXh2PaWWTlVjIRJqJOOuwpayQczq91yEJur
         FnuUyS6iQyjOAVWifiKXvHD4MVMithkjG5BUKGfcQoMC5oUGr10tEGCKw3D4/AxSflt9
         tLV388cNsXEtKnpw5AHy4b1Zn4bmVPU09FVFrZLCVzximM5Mv5ilSuCcF1dJiCEOWzQ+
         5l4AM0BN9TgSVMF5+zYmNE9pPOBw5tPIxuxiFhHpB8lKHIwutCBwO/88fZZponBoFtrc
         GEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851090; x=1794455890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        b=d8FfmEuRy1LX30ofSW88hSd634zIzTV7X41VnzbOgs0CR/uuHQ5kHxfbhA3JViMkoG
         jReJ4Kbm769ZWxynOhs/Azjl/iwU41zlJWhtuJLnbwB8KpahsMNIfX2Gmm3kWp9XU2ge
         rkvkPajrhm7J1b9xAi+H/SW0FjOgZVfzSOrljPxiN1nqehu2XdCIxwS2ShE8D32aAAvc
         n6sZdJRCnrLnMUBi/FIFnBI17IHkxa3IHP5K0UthFhUGZzXOxetzdoYLYZgGL0fth1av
         1SSt2nuxEstw6KFNDLF6UrQ6wWsmHvAWH5n/6tN0sbWMylXWEJ8AB84WdWHGqUdB547k
         VTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcKYTdYSEIDSSAPgPj4VdFlwQNuAwJMsrV3IfxnzkH67EF2KtJOZzxHrbd/NnSs22Bh7L1H45O4RG2J1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tzXCVhoJ8ohGpE/TKeMaAsG99p7wKK1z2LnRm276HUynfbW5t
	0PB/P3zHbHJyF2Rt1PWPTJyJpfHapQfCXOSIlPPHrqCL5oQ2iVnAC8qIkD2cF7JzQNNPaG7RxYM
	OF8HvyId9oFV6FgSlIqy+a8idePKiAfPMUjurKYR5
X-Gm-Gg: AYBFou2SU8tNXVYdFMFdqQPlaZ7EQ738jy4pM/R7IYusIoRnH9CHrCF6sRyA8H6qy27
	X5Ajv1/pVCqkCurdA3APVLxrVN2dyOkU7YmXfvIpB3tD8hg/SjqpKOVrwSUKCNShLZrtHKlAaNO
	d8LWviDux03Gdyj9I001P/MtaAyL2aQPxGFsjmka4M7ifqUgG/N3HpVNk2do6GA626juaZidbB/
	Z7RseAoL5bXQhOqH7XQCwtZK0ogcm3KyD26VzWBrByc05T/oKweSXFElyHb81brg8NYUz7zGMzM
	DPbKGYt23kOcqtqd0rweKNGVyIsBEqxQW5lMH7GmdqPwCEUZlYjpSKyjukkqrpCPCuk0LvUynEr
	uUUZQZ554SuhJV6xEubFOSd8C44ApIo/V5G4Uwg==
X-Received: by 2002:a05:622a:230a:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-54cad1cbfffmr12692901cf.1.1793851089675; Wed, 04 Nov 2026
 19:58:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611050801.67bb4af4-lkp@intel.com>
In-Reply-To: <202611050801.67bb4af4-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 19:57:57 -0800
X-Gm-Features: AclHuK9ilpld-rB9xe_U790ds1KMqGY3G5aRtH7xf1WpqhhQsTIWBXwTv7iHjtQ
Message-ID: <CAP-5=fVxwRVmaq-kmVVMN9QFmBG56KKVuA0FpP12t45crrGczQ@mail.gmail.com>
Subject: Re: [linus:master] [perf vendor events intel] 3c989481ee: perf-sanity-tests.x86_topdown.topdown_events.fail
To: kernel test robot <yi1.lai@intel.com>, Edward <edward.baker@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 5:10=E2=80=AFPM kernel test robot <yi1.lai@intel.com=
> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.x86_topdown.topdown_events.f=
ail" on:
>
> commit: 3c989481ee3cc22ac5d34e73862a4016af770710 ("perf vendor events int=
el: Update emeraldrapids events from 1.24 to 1.25") https://git.kernel.org/=
cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55=
c]
>
> in testcase: perf-sanity-tests
> with following parameters:
>
>   perf_compiler: gcc
>   group: group-02
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emer=
ald Rapids) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050801.67bb4af4-lkp@intel.=
com
>
>
> 2026-10-04 03:23:58 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/sr=
c/linux-perf-x86_64-rhel-9.4-bpf-3c989481ee3cc22ac5d34e73862a4016af770710/t=
ools/perf/perf test 77 -v
>  77: x86 topdown                                                         =
                                      :
>  77.1: topdown events                                                    =
                                      : Running (4 active)
> ---- start ----
> ...
> event syntax error: 'cpu/mem_trans_retired.load_latency/'
>                      \___ Bad event or PMU ...

The blamed commit added the event:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/tools/perf/pmu-events/arch/x86/emeraldrapids/memory.json?id=3D3c989481ee=
3cc22ac5d34e73862a4016af770710
```
...
+        "BriefDescription": "Counts randomly selected loads when the
latency from first dispatch to completion is greater than any number
of cycles.",
+        "Counter": "1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY",
+        "MSRIndex": "0x3F6",
+        "PublicDescription": "Counts randomly selected loads when the
latency from first dispatch to completion is greater than any number
of cycles. Reported latency may be longer than just the memory
latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
...
```
MSRIndex 0x3F6 is ldlat:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/jevents.py?h=3Dperf-tools-next#n238
and looking at this in the pmu-events-string.c I see:
```
/* offset=3D3016743 */
"mem_trans_retired.load_latency\000memory\000Counts randomly selected
loads when the latency from first dispatch to completion is greater
than any number of cycles  Supports address when
precise\000event=3D0xcd,period=3D100003,umask=3D1,ldlat=3DNone\000\00000\00=
0\000\000\000Counts
randomly selected loads when the latency from first dispatch to
completion is greater than any number of cycles. Reported latency may
be longer than just the memory latency  Supports address when
precise\000"
```
Notice the `ldlat=3DNone`.
In jevents.py we have:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/jevents.py?h=3Dperf-tools-next#n331
```
...
    msr =3D lookup_msr(jd.get('MSRIndex'))
    msrval =3D jd.get('MSRValue')
...
    if msr:
      event +=3D f',{msr}{msrval}'
...
```
So the condition is only testing the msr and not also the msrval,
which is why `None` is placed in the output code.

This output should be in the parse_events output as the failed to
parse None should be somewhere in there like:
```
$ perf stat -e cycles/period=3DNone/ -a sleep 1
event syntax error: 'cycles/period=3DNone/'
                     \___ Bad event or PMU

Unable to find PMU or event on a PMU of 'cycles'

event syntax error: '..les/period=3DNone/'
                                  \___ expected numeric value
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list
available events
```
Anyway, I think it is sensible not to specify a ldlat value when the
MSRValue isn't given. I'll send a patch to jevents.py adding this.

Thanks,
Ian

> event syntax error: '..atency/'
>                                   \___ expected numeric value ...
> event syntax error: '..atency/'
>                                   \___ expected numeric value ...
> WARNING: events were regrouped to match PMUs evlist after sorting/fixing:=
 '{slots,cpu/topdown-bad-spec/}'
> ---- end(-1) ----
>  77.1: topdown events                                                    =
                                      : FAILED!
>  77.2: topdown sorting                                                   =
                                      : Ok
>  77.3: topdown slots injection                                           =
                                      : Ok
>  77.4: topdown metrics_clear no extra slots                              =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 0
> Passed subtests   : 3
> Skipped tests     : 0
> Failed tests      : 1
> List of failed tests:
>    77.1: topdown events
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050801.67bb4af4-lk=
p@intel.com
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>

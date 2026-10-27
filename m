Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119942;
	b=O2cjb+R6mgaQIWkTixlXi4hHjKa5feJpuhCHRrTWVllagqsAkbi4dh9ciWBioP9ccsC5
	 yTjei3xqq4l57sstCXv+T97VwAw644xA1c+gpJHoqZBb0B79Pj8npC/zA6WnN+nbum3Ug
	 da8qABDjoBaIxjlg69QJ7QTtg/u1JZGg9imRPhcP0fA+4nY4/P33iHyODxMxNyaCZIpmG
	 Pv6YDYeTF77yiHlDl3QkFQSJoq44tIbZK7BH2bmG+47bj4p4n0y+lpCDzzB6OOKA0VcTQ
	 B5RMhVEKD3dL1KKKaTj9gDw8aAmvnBPbRIdssp3+Bk4CFdgjOmo4d6Z/Sx45O4Y0lQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QNr1I+kaFCA3fT20ORqP0xLCLiaTRq0M5OA3+7qdxsw=;
	b=gLSzvWuU09Mz6Hn5aNuIljrmvf8kuxn3avyGuOXOKMsbjjBUyuCwaQiUMOazt3b/BpvB
	 FLX/9n8vaEiBhWnvTe0rEM7c5qGfExiXG6Mmp4DLDp4nQQhLdBTuBZo1QA5N25YPCTwhd
	 g9GTEzV5vGlD/cwevinWBLMRSFcYPTX974FWGYeBNp0Xt2zzNOZr8JHjQYBw+lFjELGxq
	 APrwC/CLDik+STKUHlavoDx9eKeZNT6kbPT1Ad5lSW13yyRnIcaiOPCfXU71uYKXNjymO
	 wczQyXnp1Ri5XDIxqnwxrQ9R3cuCHIcphBhAZMkqFX6nSOvo3noJw8PGzsn49XZ//hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iEdEAm3Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FACE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FACE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iEdEAm3Y
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5337c7b9937so412881cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119940; cv=none;
        d=google.com; s=arc-20260327;
        b=Xrvcg3pGkBbPUB2vLTCZZOlGFiY6/Sx0NsjiC61rqz6frID8XUDRjH0qTKQx0LnHnt
         G6elaBK7SQbdMljOdCCTlXVPCqmMXDhxX8Ydfs0UMLodGQw0qulA4mqDVNbEWCd4TVAJ
         7+8x3/tuFcTyUY4TuT/d/fDFjnMBd6WKBsvQ40Uffq0yryZ1VYdARKqMLtD4PRGJbs52
         vPsVAQagLDWlNbqM/t5I4BUro/XOfXAtXzGW2Co9j3FX77DFTkX4Pi7fERR7Fo7+3ljY
         vI+bRMQ3qvUTxeq6sTe7MTSbS7sLGBDK9vrgh/84ay455dpnmVYnpGWxJdIhcJTYnXGq
         xKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNr1I+kaFCA3fT20ORqP0xLCLiaTRq0M5OA3+7qdxsw=;
        fh=MFEHzEai7L3eBs7Z8a8TBKSyvsPMiC4mSFeDBlc1yZc=;
        b=boMe6KPt9WDwwyJg8PAOPeazBeTaWwF4+ehQQFJI5tKjcxo4TP3NhMlsO/NJiX8WLy
         ZfSSDSUkRp0cuh8CkFAUVB7z3T8PkRwzBJEoYAhkwQo9Harpnl+2v2j94vK56LFABrlV
         drH2ck6fIL5pDbdWzahRL74D0xPpAs77TTmPxVnIpGlZbg/1LcOrlE4WXQfFWtVJRdY0
         HSMj+w12Qc7BENHGi3wtW86eit4yfyAeP43vIgYbXaIqW+NBCbI2R0QJfV32lqQS2OZo
         kkRg2qX9wwJNC4fTQeBnW/Np/tMvxRvKdOjbVQUL3khXESQMgl48ARE8zHl0k5+4SutE
         mrAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793119940; x=1793724740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNr1I+kaFCA3fT20ORqP0xLCLiaTRq0M5OA3+7qdxsw=;
        b=iEdEAm3YD9tJL+AR5VEz6l7aQgA/00zl/6BQlbuYmfY091uK+ZLnst42k3OEVN0yqj
         YV8WDcjjq4uKGEY+Jnrd6sbKjP9VYauVB6qDiDIwvJTUT/w9uTNP4cwOAx/DwNz+WMeh
         Kt3CeQlbY5zXZIuXtopO14bnOJUyp5kALzP2V8c4e9JjTUAIDebz+l+xtO4Yjlq3O4Sd
         CRy3/5ImV2nejw5Dl7gij51idLSgOiEuIZjIyOXh9mFpW6al4DaePIJMXHEfiOovXJdx
         CuDiUmgIdHS+19Pm/NMM3wD07niHpudRS2m0bnNqpes8bsczFMysxxb8T46f7uOCGeuo
         gTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119940; x=1793724740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNr1I+kaFCA3fT20ORqP0xLCLiaTRq0M5OA3+7qdxsw=;
        b=C+WwTlSPliVNS7/NG2x9pPYupXu/wNWJt/T+Crf0e+np0TEeJmnMvZ0tCGTpmwRlvb
         RY+R5maZnNAm61RJETai6YXvWYF1UUHI0hq3F9LONCpxM+JnCwegQFBJ9aB2Zj6tqeR3
         do8a3ykoskNxnJytD5UJE95SgZko0RALYrBqhajltXMQE1OSPFmk61OqymCtpQMpIj8+
         cSRmSFm2o5GUjU8wnzm3X9O8qc2M2iSBl+0dLIIivKtGGj9MF0Q/236b53+a4gpQjev5
         lRNA6bqji68KUbyd0fVl+xe5eB014bfYYab8uXes+JNt/NeHQ5icFoWwk8AvkSv4eGne
         3Dvg==
X-Forwarded-Encrypted: i=1; AKwUvBxEGOFAdPDn43F8YkLn8w5brbPO3sQJnzuyH0oLwmVTlAvllbR+062p61UaOI5ivhASYMSKoTdAPgMQTbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkY3SvVRjq/QNSAwMfu0ia1ncvaJSqnwnoB28cKZzIvqBuhi2m
	aU3CEXgp3QVHHhh0omHEbwfSrzYQx39O2ZYWy1e/tQPs9FsytvVMULIut94zFwvjCjhym7JrWYO
	tfF8Hb7WW3kVgFIw0aBPDFKw4qwKcqg9/PYzUhTT+nJKupNOXxTcMilX+
X-Gm-Gg: AYBFou0oIMuJTGBoq9/cvG/lJPjR83e1XFZRI60giftwbwmeG3HtPzkRN1I/IWEfOnH
	UssHtYIYf++lR//npy3v7h9ZdozgF7ljkiy5HTImTum9DJ4nzgYU1o02CBqqDCF+r6HbiAv5GyM
	FIfManI0rkgF8xg9z16Jo7ebiCf7jn5kZpHHwhwa+lK4nkCxa2jpUsYXEFrRskYBYgPkN6CXIjW
	lWKtxc9MvvQqJ95XSdUAW+NshPwvcRxata6hBlqcqjdQkQ68pMKuvEKCvVsxmGo/Lr0QGjjQyCu
	29+NVHjMN708naEJ+Eh9hS9QBQQuiYtHfgEQ9Z6AOwuVfe2brjpRJRq2b4FXaUwdEf2eelg2NZX
	4NeYzR4lE51mQuVG7DYr81R097xkCHsFZEJZOpuyDeq06dPzgow06foEYy2VnC1NUQw==
X-Received: by 2002:a05:622a:408e:b0:530:e335:4ef with SMTP id
 d75a77b69052e-53e52a4dabcmr22708611cf.2.1793119939533; Tue, 27 Oct 2026
 09:52:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202610271934.fd287c3f-lkp@intel.com>
In-Reply-To: <202610271934.fd287c3f-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Oct 2026 09:52:07 -0700
X-Gm-Features: AclHuK_3KSlFoltlMYw06N9_sWSCTePL0tqpj69pnEG8YO4IImaT_s7RyifcLcw
Message-ID: <CAJuCfpG67sV5Vhn1DnAWTV2xZVptOCdmH3iEnUEvYs9GRPbOeg@mail.gmail.com>
Subject: Re: [linus:master] [selftests/proc] ca5480fb53: kselftests.proc.proc-maps-race.fail
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Pedro Falcato <pfalcato@suse.de>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:31=E2=80=AFAM kernel test robot <yi1.lai@intel.co=
m> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "kselftests.proc.proc-maps-race.fail" on:
>
> commit: ca5480fb53fa73cb5816b696b103826daedab1ca ("selftests/proc: add /p=
roc/pid/smaps_rollup tearing tests") https://git.kernel.org/cgit/linux/kern=
el/git/torvalds/linux.git master
>
> [test failed on linux-next/master f1ac44c32cba88ad65dcecd4a279661d14e9365=
1]
>
> in testcase: kselftests
> version: kselftests-x86_64-d6d3455d8751-1_20261013
> with following parameters:
>
>   group: proc
>
>
> config: x86_64-rhel-9.4-kselftests
> compiler: gcc-14
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00=
GHz (Skylake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@intel.=
com
>
>
> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel=
-9.4-kselftests-ca5480fb53fa73cb5816b696b103826daedab1ca
> 2026-10-26 14:37:46 sed -i s/default_timeout=3D45/default_timeout=3D300/ =
kselftest/runner.sh
> 2026-10-26 14:37:46 make -j36 TARGETS=3Dproc run_tests
>   CC       fd-001-lookup
>   CC       fd-002-posix-eq
>   CC       fd-003-kthread
>   CC       proc-2-is-kthread
>   CC       proc-loadavg-001
>   CC       proc-maps-race
>   CC       proc-net-dev-lseek
>   CC       proc-empty-vm
>   CC       proc-self-map-files-001
>   CC       proc-pid-vm
>   CC       proc-self-map-files-002
>   CC       proc-self-isnt-kthread
>   CC       proc-self-syscall
>   CC       proc-self-wchan
>   CC       proc-subset-pid
>   CC       proc-uptime-001
>   CC       proc-uptime-002
>   CC       read
>   CC       proc-tid0
>   CC       self
>   CC       setns-dcache
>   CC       setns-sysvipc
>   CC       thread-self
>   CC       proc-multiple-procfs
>   CC       proc-fsconfig-hidepid
>   CC       proc-pidns
> # timeout set to 300
> # selftests: proc: fd-001-lookup
> ok 1 selftests: proc: fd-001-lookup
> # timeout set to 300
> # selftests: proc: fd-002-posix-eq
> ok 2 selftests: proc: fd-002-posix-eq
> # timeout set to 300
> # selftests: proc: fd-003-kthread
> ok 3 selftests: proc: fd-003-kthread
> # timeout set to 300
> # selftests: proc: proc-2-is-kthread
> ok 4 selftests: proc: proc-2-is-kthread
> # timeout set to 300
> # selftests: proc: proc-loadavg-001
> ok 5 selftests: proc: proc-loadavg-001
> # timeout set to 300
> # selftests: proc: proc-maps-race
> # TAP version 13
> # 1..6
> # # Starting 6 tests from 2 test cases.
> # #  RUN           proc_maps_race.maps.test_maps_tearing_from_split ...
> # #            OK  proc_maps_race.maps.test_maps_tearing_from_split
> # ok 1 proc_maps_race.maps.test_maps_tearing_from_split
> # #  RUN           proc_maps_race.maps.test_maps_tearing_from_resize ...
> # #            OK  proc_maps_race.maps.test_maps_tearing_from_resize
> # ok 2 proc_maps_race.maps.test_maps_tearing_from_resize
> # #  RUN           proc_maps_race.maps.test_maps_tearing_from_remap ...
> # #            OK  proc_maps_race.maps.test_maps_tearing_from_remap
> # ok 3 proc_maps_race.maps.test_maps_tearing_from_remap
> # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_split ...
> # Expected stats:                                                        =
     Rss 892 kB
> #                                                              Pss 82 kB
> #                                                        Pss_Dirty 82 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 24 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 860 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 892 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # Actual stats:                                                          =
   Rss 892 kB
> #                                                              Pss 81 kB

Hmm. RSS is staying the same but PSS is changing. I think I must
filter out PSS stats in this comparison because they depend on page
mapcount and might change even if VMA tree is stable. I will update
the test to exclude that metric and will post the fixup later today.

> #                                                        Pss_Dirty 81 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 24 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 860 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 892 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # # proc-maps-race.c:961:test_maps_tearing_from_split:Expected 0 (0) !=3D=
 compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_tearing_=
from_split: Test terminated by timeout
> # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_split
> # not ok 4 proc_maps_race.smaps.test_maps_tearing_from_split
> # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_resize ...
> # Expected stats:                                                        =
     Rss 956 kB
> #                                                              Pss 83 kB
> #                                                        Pss_Dirty 83 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 26 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 924 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 956 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # Actual stats:                                                          =
   Rss 956 kB
> #                                                              Pss 83 kB
> #                                                        Pss_Dirty 83 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 25 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 924 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 956 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # # proc-maps-race.c:1050:test_maps_tearing_from_resize:Expected 0 (0) !=
=3D compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_teari=
ng_from_resize: Test terminated by timeout
> # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_resize
> # not ok 5 proc_maps_race.smaps.test_maps_tearing_from_resize
> # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_remap ...
> # Expected stats:                                                        =
     Rss 956 kB
> #                                                              Pss 84 kB
> #                                                        Pss_Dirty 84 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 26 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 924 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 956 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # Actual stats:                                                          =
   Rss 956 kB
> #                                                              Pss 83 kB
> #                                                        Pss_Dirty 83 kB
> #                                                         Pss_Anon 54 kB
> #                                                         Pss_File 26 kB
> #                                                        Pss_Shmem 3 kB
> #                                                     Shared_Clean 0 kB
> #                                                     Shared_Dirty 924 kB
> #                                                    Private_Clean 0 kB
> #                                                    Private_Dirty 32 kB
> #                                                       Referenced 956 kB
> #                                                        Anonymous 120 kB
> #                                                              KSM 0 kB
> #                                                         LazyFree 0 kB
> #                                                    AnonHugePages 0 kB
> #                                                   ShmemPmdMapped 0 kB
> #                                                    FilePmdMapped 0 kB
> #                                                   Shared_Hugetlb 0 kB
> #                                                  Private_Hugetlb 0 kB
> #                                                             Swap 0 kB
> #                                                          SwapPss 0 kB
> #                                                           Locked 0 kB
> # # proc-maps-race.c:1141:test_maps_tearing_from_remap:Expected 0 (0) !=
=3D compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_teari=
ng_from_remap: Test terminated by timeout
> # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_remap
> # not ok 6 proc_maps_race.smaps.test_maps_tearing_from_remap
> # # FAILED: 3 / 6 tests passed.
> # # Totals: pass:3 fail:3 xfail:0 xpass:0 skip:0 error:0 not ok 6 selftes=
ts: proc: proc-maps-race # exit=3D1 # timeout set to 300 # selftests: proc:=
 proc-net-dev-lseek ok 7 selftests: proc: proc-net-dev-lseek # timeout set =
to 300 # selftests: proc: proc-empty-vm # protection_key_support: error: rv=
 -1, errno 28 not ok 8 selftests: proc: proc-empty-vm # exit=3D1 # timeout =
set to 300 # selftests: proc: proc-pid-vm ok 9 selftests: proc: proc-pid-vm=
 # timeout set to 300 # selftests: proc: proc-self-map-files-001 ok 10 self=
tests: proc: proc-self-map-files-001 # timeout set to 300 # selftests: proc=
: proc-self-map-files-002 ok 11 selftests: proc: proc-self-map-files-002 # =
timeout set to 300 # selftests: proc: proc-self-isnt-kthread ok 12 selftest=
s: proc: proc-self-isnt-kthread # timeout set to 300 # selftests: proc: pro=
c-self-syscall ok 13 selftests: proc: proc-self-syscall # timeout set to 30=
0 # selftests: proc: proc-self-wchan ok 14 selftests: proc: proc-self-wchan=
 # timeout set to 300 # selftests: proc: proc-subset-pid ok 15 selftests: p=
roc: proc-subset-pid # timeout set to 300 # selftests: proc: proc-tid0 ok 1=
6 selftests: proc: proc-tid0 # timeout set to 300 # selftests: proc: proc-u=
ptime-001 ok 17 selftests: proc: proc-uptime-001 # timeout set to 300 # sel=
ftests: proc: proc-uptime-002 ok 18 selftests: proc: proc-uptime-002 # time=
out set to 300 # selftests: proc: read ok 19 selftests: proc: read # timeou=
t set to 300 # selftests: proc: self ok 20 selftests: proc: self # timeout =
set to 300 # selftests: proc: setns-dcache ok 21 selftests: proc: setns-dca=
che # timeout set to 300 # selftests: proc: setns-sysvipc ok 22 selftests: =
proc: setns-sysvipc # timeout set to 300 # selftests: proc: thread-self ok =
23 selftests: proc: thread-self # timeout set to 300 # selftests: proc: pro=
c-multiple-procfs ok 24 selftests: proc: proc-multiple-procfs # timeout set=
 to 300 # selftests: proc: proc-fsconfig-hidepid ok 25 selftests: proc: pro=
c-fsconfig-hidepid # timeout set to 300 # selftests: proc: proc-pidns # TAP=
 version 13 # 1..6 # # Starting 6 tests from 1 test cases.
> # #  RUN           ns.pidns_mount_string_path ...
> # #            OK  ns.pidns_mount_string_path
> # ok 1 ns.pidns_mount_string_path
> # #  RUN           ns.pidns_fsconfig_string_path ...
> # #            OK  ns.pidns_fsconfig_string_path
> # ok 2 ns.pidns_fsconfig_string_path
> # #  RUN           ns.pidns_fsconfig_fd ...
> # #            OK  ns.pidns_fsconfig_fd
> # ok 3 ns.pidns_fsconfig_fd
> # #  RUN           ns.pidns_reconfigure_remount ...
> # #            OK  ns.pidns_reconfigure_remount
> # ok 4 ns.pidns_reconfigure_remount
> # #  RUN           ns.pidns_reconfigure_fsconfig_string_path ...
> # #            OK  ns.pidns_reconfigure_fsconfig_string_path
> # ok 5 ns.pidns_reconfigure_fsconfig_string_path
> # #  RUN           ns.pidns_reconfigure_fsconfig_fd ...
> # #            OK  ns.pidns_reconfigure_fsconfig_fd
> # ok 6 ns.pidns_reconfigure_fsconfig_fd
> # # PASSED: 6 / 6 tests passed.
> # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0 ok 26 selftests:=
 proc: proc-pidns
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261027/202610271934.fd287c3f-lk=
p@intel.com
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

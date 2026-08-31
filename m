Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9150A3A8388
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214739; cv=none; b=Ie13zJ9/qbuZaVottMLRsSoaA/FDmEcMjWEO12qvK8ubaTYawhSf5qDfUgw1tTexIh9bl8j+GCn19aukptuOvXcvM9yAO2c7KRmveThTVszds/JXI6NeqBQVZ4+fJe13pR1RXs1blKyDNsIfqRyz/WbR3PNtXADjsZE2la9HI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214739; c=relaxed/simple;
	bh=WWEEZMNW23VgeiLrA0jkBRh+FqlaOZaIbG6KQNC9i3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9NSihrS7Uyfm9j7MyDxT6rNwPXyK98xKfh9JiIHFi9TbKcVuB/x5S0ehAS6o/QA3u5LZowxSOG+xVJYBGkOM57umrMS35cDM1t4h8x0sgSZ/uDci1+lBjkOLUiNGnB1BuakUiGDD3uGW4JOci8hBLD+VusOje9vDIT+z8ASAQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igDopN9B; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igDopN9B"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8534d507f59so4453935b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214737; x=1788819537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XnNt0hP8YJjLsvezbznRGz62Lklpiz7+58ZQDmGUihY=;
        b=igDopN9BmO44WcL5KkB8EZkn1sMNYaTnfHKrQb5ClcSjiKU+qvpp/e0WVnmyKPErgC
         ZV7YDSwqMYlEFtW+YjjiaFCaBhSDWs28zcATvuKDagLJ7/SPylY8KK9Muf/vFiVHQpJs
         ksLGmmidV0pdy1a2i5KulmdIwpPnl5Dzr8PCD+pyfx08cyLKUMeAoEmE9X5nQyYeXebS
         dwNXxdFroYZK3c+uRxveZa4m2pXmPDzL5mYPdwtedGDG0KgqUor2eIMIADPQWthRbsEE
         umG+SHdkdWb2ATMYWWUK3fajbLL1ciQTt3uPPcVbzzDB4ReOrU+qnSG2CsAzEmAr40Tg
         zHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214737; x=1788819537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnNt0hP8YJjLsvezbznRGz62Lklpiz7+58ZQDmGUihY=;
        b=IX35DRdsHsZi4VCgA4OKhxCUgkn+szCGE6DqU+ENIUMyDI7ZQhGmaLKja4701zDx1Z
         BBEx6E5rLBetB9+cMGS7u/2NKRu+gzdZR1cGGAsMewU0kQ+sXA+ETvRyBUQC2vh9WnPX
         nq/BTg0KafBbJv2iMFLGGsXI57NbGU+F44y65ak3KWKK7iJHddzDvmmjHmmx/bp3awQJ
         qTSzURC5xKNVbALUUkZHncNDxQQy2xXfpbNBIgCPVhT0nkHlMqVocOQC6Zjdph8ap1LG
         kQo1vhta2JliBZT2VdDynfV5fLStugoMd64BRGs+whZ0cGuEsYQn5/tSPfsy+FM6ozLb
         ppLA==
X-Forwarded-Encrypted: i=1; AHgh+RrE8oTIuOPRY4pUv66mY+eVCsXbIvMugZAZBUTAOJq4rrPDwH+DDWF/cM72HA1fwCTr6OPz+bSPm7yE9YA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8QUeFnwnQGYcmlvQAmxC9Uw0e04XW/EV0PL9Z1ltQkfzOfjtj
	fsoFZjtgGkNd9Onj2kCnvhNngd5zVtW5MUzLVBAjLm3xkxmERBv/5NSz
X-Gm-Gg: AR+sD111GElSgItIksirSqW9Z7cLuNZ8Ny9nz494BlZ/s3p8u3Dwtt/UBAobAXKr52N
	qonEWKQ1+EJb48cjKAyj/yYhEdyOBp1IiVTxmXL6HQPrnIJPqNneFoKVzP7doQon+Zh1RTr2dzq
	Odjo6ljMujPCyo5vnPojYKrKV4Xw4jo86bDKJtXns+NDICB6gsoDp9PSu/B8ChpXUbbixuA1BYX
	AY1j4g+U7h4n7/gB+u2iBIZOBbigBiTP7XnueWu+n9gtGiJoSd8XaaSpSeGW1q5d8cd2wdw3by1
	gju67aDrlMpgY/rz/lmtBhngEEDCfSw7/qyyCaCk9HFO4lR5UsT0zDk9hP7zniP0VH73fvzwx4J
	IovPypo94Llcat3o/O8aMonvXF8Fh+D21tARQ9pzTX9RANo7n5aBd4oVskfqF7p4kDyZRcqtZwm
	XW2mahSXgSxgobGMlr1T8fHY7EgW4rCsKcdh4QhVk04GpxWopuC2SzKj0LmN+CJdLmdw4QTCcv2
	L73qY1D
X-Received: by 2002:a05:6a20:2586:b0:3d3:b02a:7252 with SMTP id adf61e73a8af0-3d3b02a76a6mr29131323637.28.1788214736859;
        Mon, 31 Aug 2026 15:18:56 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm33073832eec.10.2026.08.31.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:18:56 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:18:53 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>, kernel-team@meta.com,
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org,
	linux-input@vger.kernel.org, sched-ext@lists.linux.dev,
	linux-mm@kvack.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] selftests: shared lib.bpf.mk for building BPF
 progs and skeletons
Message-ID: <apX9zb+3awc99Pfh@devvm16600.scu0.facebook.com>
References: <20260814075054.507089-1-ziyang.meme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260814075054.507089-1-ziyang.meme@gmail.com>

Hi Reviewers,

Just want to follow-up on this patch series. Please let me know the possible
issues and I will fix them.

Thanks very much!

Best,
Ziyang

On Fri, Aug 14, 2026 at 12:50:50AM -0700, Ziyang Men wrote:
>This series re-factors the bpf-related toolchain for selftests, which
>currently duplicated across selftests/{bpf,sched_ext,hid}/. Unify them
>into a single includable fragment, the tools/testing/selftests/lib.bpf.mk,
>and wires up three consumers. We believe this will simplify the work for
>configuring selftests with the bpf, for both the existing and future ones.
>
>Patch 1 adds lib.bpf.mk mentioned above.
>
>Patch 2 adds a new selftest, selftests/cgroup/test_memcg_stat_cross_cpu,
>which checks the cgroup flush happens correctly by comparing the bpf
>read value matches the file reading. Existing test
>bpf/cgroup_iter_memcg only ensures whether the number is non-zero, which
>is trivial in some cases.
>
>Patches 3 and 4 replace the duplicated parts in selftests/{hid,
>sched_ext} with the lib.bpf.mk
>
>===
>Changes since v2:
>For shared Makefile:
>- The lib.bpf.mk now use the USERCFLAGS (and USERLDFLAGS) to extend the
>  CFLAGS and LDFLAGS.
>- OPT_FLAGS/RELEASE and EXTRA_CFLAGS now reach the libbpf and bpftool
>  sub-makes as well.
>- One rule per BPF source instead of a vpath, which is global and also
>  applied to the caller's own %.c rules.
>- HOSTCC/HOSTLD come from lib.mk instead of including Makefile.include,
>  which also rewrote the caller's AR, LD and CFLAGS.
>- A missing vmlinux is reported by the recipe rather than at parse time,
>  so "make clean" still works without BTF.
>
>For cgroup selftest:
>- Only one cgroup tree is created, one flush is performed, follows by
>  bpf read and file read.
>- More common cgroup functions e.g., cg_read_key_long() and
>  value_close(), are used in the selftests.
>- Use cpu_set_t rather than manually allocated cpu lists.
>- Use test_memcontrol.c's anon allocator and moving it into cgroup_util.
>- Other suggestion from the review.
>
>Others:
>- Bot reviews are fixed.
>
>===
>Changes since v1:
>  - Generalized lib.bpf.mk (source layout/suffix, extra hdrs/cflags,
>    skeleton suffix, subskeletons, configurable output dirs) so it can
>    serve hid and sched_ext, not just cgroup.
>  - Added patch 3 (hid) and patch 4 (sched_ext), converting those folders
>    to the shared fragment.
>
>Ziyang Men (4):
>  selftests: add shared lib.bpf.mk to build BPF progs and skeletons
>  selftests/cgroup: add memcg_stat_cross_cpu correctness test for flush
>  selftests/hid: build the BPF program via the shared lib.bpf.mk
>  selftests/sched_ext: build BPF schedulers via the shared lib.bpf.mk
>
> tools/testing/selftests/cgroup/.gitignore     |   8 +
> tools/testing/selftests/cgroup/Makefile       |  52 ++
> tools/testing/selftests/cgroup/config         |   5 +
> .../selftests/cgroup/lib/cgroup_util.c        |  83 +++
> .../cgroup/lib/include/cgroup_util.h          |   3 +
> .../cgroup/memcg_stat_cross_cpu.bpf.c         |  86 +++
> .../selftests/cgroup/memcg_stat_cross_cpu.h   |  21 +
> .../cgroup/test_memcg_stat_cross_cpu.c        | 596 ++++++++++++++++++
> .../selftests/cgroup/test_memcontrol.c        |  29 +-
> tools/testing/selftests/hid/.gitignore        |   1 +
> tools/testing/selftests/hid/Makefile          | 180 +-----
> tools/testing/selftests/lib.bpf.mk            | 296 +++++++++
> tools/testing/selftests/sched_ext/Makefile    | 146 +----
> 13 files changed, 1204 insertions(+), 302 deletions(-)
> create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.bpf.c
> create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.h
> create mode 100644 tools/testing/selftests/cgroup/test_memcg_stat_cross_cpu.c
> create mode 100644 tools/testing/selftests/lib.bpf.mk
>
>-- 
>2.53.0-Meta
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762034;
	b=fT2s1I0iaJxIvvMwJpe+9pDxPxR3wKlvMxDn3tloMhYXFcNUkYzOUwx0yIP0lrhVPfEg
	 Tlh5iNW76gr+RZ7aRXGYf95tXaH7cGqMWl5jk03g3caWjy6jIedItCi6s0qq16biK+js3
	 x8wdiycy/9WnR674hZDESghoY+ivb4mZhpzmISIcbc+cf74YGuYW8IwsC7fJLCvtdyx2H
	 clG6/QZnx9jLbn9u8Vi5Sjvbmm6pN/J30GmNsJgzHzSd/6qi6R11RnyXuzss0jccw06i3
	 MQ7/euswFTcMI90pUA5eRmGJddffhU4gtAnvSXyz/mwEJMe0Thfl5Y3tDTlcQHVGcMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762034;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kHvvjVvMo3Ca31l9qkMMt0Ug776gEiMiHXHw+6Z3x3Q=;
	b=Aifx1XwuKeb40V2pfmKeWq2gG8GSVfR0PoymZeECbGG8yC/b0jfwDD1Cx5/42v2eJfVy
	 ouMW4rSkScql6u/+VMnlb80AzLSLHFw6z9dMxJskf88wwpthrSBWyHtZSWaxt+nABkiZQ
	 D04yvYUNruXPfd0TwIXNJoG4m776D9fd3GrWErbldOY0MuJZJb0RyYuua3in2wK74+kg4
	 5USJ2X3u9pI8nmQ/OeK6Ry5KY7w8PDvX23N2cmXni8Q+5uc8mbZiGax3ezYXWTJ4w309k
	 M0MuXwMuZ8Vfw+7tarEuF3z9rg8SMBHyaNljyM4wrr1aaJBrQNYs72+SvpBddrWeupw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uMs5JuPw;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5660A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uMs5JuPw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7nc5JHefYXpoNimiJuHhH8coWhmIm/8dKZMtkpclPOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793762031; v=1; x=1794366831;
 b=uMs5JuPwslCBc4PlhALlMeFoRJYTPbPeatDmzlAyuTfJZDKO7hf8Z2zaRsg74S+BJ5cBjv/T
 34sMO3rTQdan63VlG5KcVZ3nTbMfDSUysVx9L6igYlWh257IjBwNU1gaMa1c99M8zx1kOUDsBVN
 98Y/FZoRyC8Qn721dUozMN2g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f93b0f4fb90c99d5;
	Wed, 04 Nov 2026 03:13:51 +0000
X-Mizu-Trace-ID: f93b0f4fb90c99d5
X-Migadu-Flow: FLOW_OUT
Message-ID: <73bad331-8495-4b74-8bf6-ac5d07000d99@linux.dev>
Date: Wed, 4 Nov 2026 11:13:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, cgroups@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 linux-kselftest@vger.kernel.org, cuitao@kylinos.cn, ameryhung@gmail.com,
 martin.lau@kernel.org, yonghong.song@linux.dev, mason@kernel.org,
 ihor.solodrai@linux.dev
Subject: Re: [RFC PATCH v12 3/4] selftests/bpf: add iocost cost model test
To: bot+bpf-ci@kernel.org, tj@kernel.org, josef@toxicopanda.com,
 axboe@kernel.dk, alexei.starovoitov@gmail.com
References: <20261103132613.1952975-4-cui.tao@linux.dev>
 <cdb4a70a69306fb920d52c3e5511bb1cbac094d4f47b1b89ae56b674853c287d@mail.kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <cdb4a70a69306fb920d52c3e5511bb1cbac094d4f47b1b89ae56b674853c287d@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

在 2026/11/3 22:07, bot+bpf-ci@kernel.org 写道:
>> selftests/bpf: add iocost cost model test
> 
> TL;DR: Selftest cgroup names "iocost_pairing" and "iocost_ms" lack a leading
> '/', so the cgroups are likely created outside the work directory and not
> removed by cleanup_cgroup_environment(), leaving empty cgroups on the host.
> 
Confirmed. The missing leading '/' places both cgroups alongside the
per-test work directory instead of inside it, so
cleanup_cgroup_environment() never visits them. The test itself still
works because every helper builds the same path.

I'll switch every use to "/iocost_pairing" and "/iocost_ms", so the
cgroups live under the work directory and are removed by the existing
cleanup.

Thanks,
Tao
>> diff --git a/tools/testing/selftests/bpf/prog_tests/iocost_model.c b/tools/testing/selftests/bpf/prog_tests/iocost_model.c
>> new file mode 100644
> 
> [ ... ]
> 
>> +	/*
>> +	 * cgroup_setup_and_join() creates the priced-IO cgroup with the
>> +	 * available controllers enabled, so the cgroup has
>> +	 * io.weight/io.stat and the iocg activates.
>> +	 * cleanup_cgroup_environment() removes it from every exit path
>> +	 * below. io.cost.qos and io.cost.model are root-only cgroupfs
>> +	 * files: they are written at the hierarchy root and reverted on
>> +	 * exit.
>> +	 */
>> +	cg = cgroup_setup_and_join("iocost_pairing");
> 
> [ ... ]
> 
>> +		cg = cgroup_setup_and_join("iocost_ms");
> 
> Will these cgroups actually be removed by cleanup_cgroup_environment()?
> 
> The name has no leading '/', and format_cgroup_path() in cgroup_helpers.c
> joins the pieces with no separator:
> 
>     #define format_cgroup_path_pid(buf, path, pid) \
>         snprintf(buf, sizeof(buf), "%s%s%d%s", CGROUP_MOUNT_PATH, \
>         CGROUP_WORK_DIR, pid, path)
> 
> So cgroup_setup_and_join("iocost_pairing") ends up doing mkdir on
> "/mnt/cgroup-test-work-dir<pid>iocost_pairing".  That is a sibling of the
> work directory directly under the cgroup2 root, not a child of it.
> join_cgroup(), write_cgroup_file() and read_cgroup_file() build the same
> path, so the test itself works.
> 
> But __cleanup_cgroup_environment() only walks the work directory:
> 
>     format_cgroup_path(cgroup_workdir, "");
>     join_cgroup_from_top(CGROUP_MOUNT_PATH);
>     nftw(cgroup_workdir, nftwfunc, WALK_FD_LIMIT, FTW_DEPTH | FTW_MOUNT);
> 
> so the sibling directory is never visited.  The empty cgroup remains on the
> host as /sys/fs/cgroup/cgroup-test-work-dir<pid>iocost_pairing, which also
> contradicts the comment above ("cleanup_cgroup_environment() removes it from
> every exit path below").  serial_test_iocost_model_streams() has the same
> problem with "iocost_ms", including the matching write_cgroup_file() and
> read_cost_usage() calls.
> 
> Other callers that use a fixed name pass a leading slash, for example
> "/skb_cgroup_test" and "/cgroup_iter_memcg_test".  Would "/iocost_pairing"
> and "/iocost_ms" at every place they are passed put the cgroups under the
> work directory where the existing cleanup removes them?
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/41646836440


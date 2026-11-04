Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792450;
	b=hj8qidjYUn8G6LMq7HyrG+uIDu1XE+kFC3aTEpsxdcqBALwHRxoIvY6wWTR49dALHIIF
	 lXSaYpyVhX6oTnfuRSAQu1/zTG6NByaTjFSo+j2WmVbIWMcmzjzyt1ooXZROvP4SaoB6B
	 /A4TzZgiUA0mHlWGtsRYEMKeC5LMKDdCfOWuXQiPjzA2NOTnjvhRcPmaVyNTSRqiDZf6N
	 ir/ALJfJhW9tr1ST7jpYNRA7KmeZBYSsey2kVM3ptgZ4zOSvpk4VGPYj8A0T/BtwZxpIK
	 9R0zBVDP1Gs3PxQiOVgxyZMs7MCXeg+MYil7LhmSF8Kj9POkmbNdEHhOLJ045gpxFXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
	b=XaFL/fPdy/5lums3i361e5ZDOwd25uxbEGBGAr109pP38DD+3Cx3raBHNa9dmM+goeCn
	 C9gz0L+M1/GXtK3VaWAXdeg6Kmp1hU2ZO3f7N/l/9jMGqi1i2i71LJDNhvwSZvx9NVJcG
	 gEkMDcv1cQ6r7Gyddy+2aycPXpqa/aFzHzuiuxP1ywRaMsK7WdVkoa9qQWDJEFqc08uQ+
	 QcDh1cOZiaGIVcI0OPjAQmhEQ2MwfTAPuN/jX2gNOX6pWwiJPxj7P+LALCwH3ZkGHWhEw
	 PqwZhj+ggwrZAHzhF7dbn9sYMA/fWoK6IwquerXi3ekPnMB7BXMJ7abM2e/+Wyrf0tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBwm9xd+;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33622606D81D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33622606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBwm9xd+
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso316889f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792448; x=1794397248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
        b=hBwm9xd+NzrXQ15nvYc7IXZyKTbKyi+gZB+RBYF7H4NhnJiOL7kOYbTV5GizeYbRBN
         TGaK7jYFhDREKzFjICLIdgsNrugXo+AoBC7ERADoEhuiFlXRUaMxH1M+cxqgZNmiKIvx
         jK4515YqOMdwfhKjMIySFjnkcteq9y0ZLL/RpuZ/UtxQdmp81oSM3sdSvrq2QolInnEJ
         sBCuu4intpYACXDvlA0okHE/AVfzLJb/JDfcDEpEjJIAvaBz3pU1iwVa2Eh5W8L6MhNK
         O0+5R5r140YrTo7yRdgmrRLKfgyspIGnSXHHlWuwy+ATSKnS8rKrExTnpk9TSep2b2Ah
         u8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792448; x=1794397248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsCmj2Bd0zCOX9XIs7fgWNRdvJoAisSGzCFmbSIRZkQ=;
        b=Ft18PD01+DT3xjvv3rbhYXT/0WWjrBMdGbiwIBuHBVjOKfUHZrGLVleOgUpPaS5H7a
         5FhBDRAyfK/Z1Pg4Gmw94W9bpT+BfvEegOJfdGr3kupvc59V+eodJaHKJK4u9U7WQaOD
         xf+GYM6HVSOpBpn5WKcrsTS1CYHS3TGI2Ow8LEWbjv9MZ+SeKp3PY0Y8WpN4fJI0YcWN
         q3Fap/PaGsWyzpoXZOH8lgECJipHIS291PA1NGTXwcD/1INz6liuzEpak2KGDtK6TLXS
         XU5oiPqEloTJs0Q6Snini8jmzoGw/zLGhi+AgkLq9kfspdzK0HD3VX/W7Kv9HApYxiOy
         2q8A==
X-Forwarded-Encrypted: i=1; AKwUvBxZUKtB7Jl+yn4muRld/PiBt2iwue1i+Vs1HfpnnmM5/hYFlxHpRnl5KXsqCWHwK4khzmzccziQlOwlyis=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tz41NMypa2WTGrnzRbh1ejt+CE+oG0pVB49NdZ3Rl+gPLwSEG
	OJKrfJqg1PPGe5y5ZwGoxf3grZUcIBvmfCX2mIJggxxS3BITl9Lnkn9X
X-Gm-Gg: AYBFou1XzH5wqtZI/514mlqZKln7SAO6VtRef5Po6++EX/eY7+KTLMt8+D8H+Ss+N83
	JiyYTIcJrOQaCVQnZd54A6pxjSTiCkuIXq1prbr69JFGiHOl868w5hCP4ldt9wpJNiQDDpYAkCQ
	6DVxsBkuR7/6RNsVXfVUB2hhbKZ6r9UHL/AxM6UBzrBLlA8MvX71TuIXwYGBPDvG9hLpFNjwrBm
	J0nnc8oOweBaHcZmwIhDUjHWuJYvfOx/RWQcME8vrZyzzKUCrRyp/SVWhjKUY8cml6Hx5b5OBs0
	6loUZVid/U3Cp4S2hp1bufoT+a22W3EtvtJ+P/OrS/61aBSRlctnoeoi4/tJxJ4rJOkgqjhooax
	GS3Ay/6Qgnj98qBbLVk4VVmOxzB+KGZvDT/BPzQQN8gx/k68hy8cdmhXLgraHms9N9LEnPSdsfS
	2V+ZVS1ZI2sEpLtvYnvDJ6LBl8gS50vHoBG81we75Z9wJDJqXBVdIiU/yUHvnuQbOBtUBf0kDGF
	9mxs8TE4H50XecRdIoTx2b8PaYDVOan9RobHKNOa4OoKYl24zpP7RPptn5KTHGODgvOt3/tHNV+
	VdU=
X-Received: by 2002:a05:6000:248a:b0:490:411a:1eed with SMTP id ffacd0b85a97d-490411a20c3mr2322400f8f.39.1793792448263;
        Wed, 04 Nov 2026 03:40:48 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm3457605f8f.46.2026.11.04.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:40:47 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Nov 2026 12:40:45 +0100
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: ebpf@linuxfoundation.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] selftests/bpf: port test_ftrace.sh to
 test_progs
Message-ID: <ausZvdHfmevg3mMZ@krava>
References: <20261104-ftrace_in_test_progs-v2-1-45363230d228@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261104-ftrace_in_test_progs-v2-1-45363230d228@bootlin.com>

On Wed, Nov 04, 2026 at 10:59:33AM +0100, Alexis Lothoré (eBPF Foundation) wrote:
> Commit ff205766dbbe ("ftrace: Fix function_graph tracer interaction with
> BPF trampoline") made sure that trampolines generated for tracing
> programs did not collide with the function graph when we are returning
> from the hooked function. The series bringing this commit also came with
> a new test ensuring that the kernel does not crash when executing BPF
> programs handled by trampolines while the function graph trace is
> enabled, but this test is a standalone shell script, hence not executed
> in CI.
> 
> Convert the script to the test_progs runner so it can be executed
> automatically by the CI infrastructure. There are two main options to
> port this test:
>   - just enable ftrace during some existing trampoline-related tests
>     (eg: fentry/fexit tests)
>   - create a dedicated, minimal test with function graph
> 
> The new test adopts the latter approach, with a smaller scope to keep
> execution time reasonable, while reusing an existing
> fentry/fexit/fmod_ret test. Despite the few asserts in the new test, the
> actual goal is to make sure that the kernel does not crash because of
> some incorrect stack frame skipping when both the function graph and
> tracing programs are running.
> 
> ftrace is configured through a dedicated ftrace instance which is
> dropped at the end of the test.
> 
> With the new test integrated into test_progs, drop test_ftrace.sh.
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> ---
> Hello,
> this is v2 of a small series aiming to port the test_ftrace.sh script
> (testing that trampolines and function graph behave correctly when both
> are enabled) into the test_progs framework. The test is heavily
> simplified following Alexei's review and suggestions.
> ---
> Changes in v2:
> - use a ftrace instance rather than global ftrace
> - drop fgraph filters
> - drop custom ftrace helpers in favor of direct manipulation in test
> - drop custom bpf prog, reuse test_modify_return directly
> - move test in existing test file (modify_return.c)
> - make the test parallel (drop serial_)
> - Link to v1: https://patch.msgid.link/20261030-ftrace_in_test_progs-v1-0-aa50c5dd1ccc@bootlin.com

lgtm, it might be worth to add something like this also for
tracing-multi (maybe also kprobe-multi) and run some tests
with function or function_graph enabled

Reviewed-by: Jiri Olsa <jolsa@kernel.org>

jirka

SNIP

> +void test_modify_return_graph(void)
> +{
> +	char instance[MAX_INSTANCE_PATH_LEN];
> +	char *ftrace_dir;
> +	int ret;
> +
> +	ftrace_dir = access(TRACE_FTRACE_DEFAULT, F_OK) ? TRACEFS_IN_DEBUGFS :
> +							  TRACEFS_DEFAULT;
> +
> +	ret = snprintf(instance, MAX_INSTANCE_PATH_LEN,
> +		       "%s/instances/bpf-XXXXXX", ftrace_dir);
> +	if (ret < 0)
> +		return;
> +
> +	if (!ASSERT_OK_PTR(mkdtemp(instance), "mkdtemp"))
> +		return;
> +
> +	SYS(out, "echo 'bpf_modify_return_test*' > %s/set_ftrace_filter",
> +	    instance);

nit, no need for new line

> +	SYS(out, "echo function_graph > %s/current_tracer", instance);
> +
> +	test_modify_return();
> +
> +	SYS(out, "grep -q bpf_modify_return_test2 %s/trace", instance);
> +out:
> +	ASSERT_OK(rmdir(instance), "rmdir");
> +}
> diff --git a/tools/testing/selftests/bpf/test_ftrace.sh b/tools/testing/selftests/bpf/test_ftrace.sh
> deleted file mode 100755
> index f5109eb0e951..000000000000
> --- a/tools/testing/selftests/bpf/test_ftrace.sh
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -#!/bin/bash
> -
> -if [[ -e /sys/kernel/tracing/trace ]]; then
> -    TR=/sys/kernel/tracing/
> -else
> -    TR=/sys/kernel/debug/tracing/
> -fi
> -
> -clear_trace() { # reset trace output
> -    echo > $TR/trace
> -}
> -
> -disable_tracing() { # stop trace recording
> -    echo 0 > $TR/tracing_on
> -}
> -
> -enable_tracing() { # start trace recording
> -    echo 1 > $TR/tracing_on
> -}
> -
> -reset_tracer() { # reset the current tracer
> -    echo nop > $TR/current_tracer
> -}
> -
> -disable_tracing
> -clear_trace
> -
> -echo "" > $TR/set_ftrace_filter
> -echo '*printk* *console* *wake* *serial* *lock*' > $TR/set_ftrace_notrace
> -
> -echo "bpf_prog_test*" > $TR/set_graph_function
> -echo "" > $TR/set_graph_notrace
> -
> -echo function_graph > $TR/current_tracer
> -
> -enable_tracing
> -./test_progs -t fentry
> -./test_progs -t fexit
> -disable_tracing
> -clear_trace
> -
> -reset_tracer
> -
> -exit 0
> 
> ---
> base-commit: b0e67f50519538b1b4c6364edc7811f482703f75
> change-id: 20261027-ftrace_in_test_progs-d5f70a2330ac
> 
> Best regards,
> --  
> Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> 

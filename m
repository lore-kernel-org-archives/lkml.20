Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517718;
	b=qmSDu/X4V7qvCYm3fotctuXZN+5szaOWkNjUU5X7C0/UCjIjBAs1vFEsHrTkFHV9ulwT
	 AP2Uj0tJ0BMs//NuH45A76wOpn8u1AOExpFdirWn08LupGTci62zWdpDtN5mApcI0iUw3
	 ZjQtinfyPIf5rQtmL8/0ONOXUxQk19TFL4AyVp+oKyNL0JuZQXdJBB3KnKvOOdOxSB3DF
	 z4jKM1Ry99j2gYlO/g5WtzQnTc0tiF9fvnAWAYngbIjQpq32NCcSQUhxasq2gfMwgt9Hl
	 2YpNmCW5atroLhQSprH/w062SU0taoGr2fLTpCqLJCUeSz1Cc3jW4/0bu8+uwrQ0UNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517718;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NnTaOa3hkoHPkJ8XKbl1J5CFxSilwdeYRAmrFeskxiU=;
	b=fWdNRAWnDRiuNPKr0+25jSKk1npRrKSsp/GbWsH6IAm0T6TpbzgdONCX7aj2A1Rvtrpx
	 GHe3/ZY0JubbAu6KgxyqLrzFAMIKMWu4cTAJrmOAxJ9cYdbtI3nksKikw/ZAHCADteKfR
	 BvoWOZY7iEOKXTPlonNhpUAy9550MdMBR2Dvd+odnryc/XTx+gmaUrF04b2ENj7uAK5rU
	 MG5MmgzKZuHQvxD/Fnp/h64tra7reZ9J5EPSUyD/WzM9xYJEg1MXt0/FbjGshY2svRirf
	 DURs5owF1j/2qMPApkTiSb0zjaN9MKJG5QulDJe0yiieUGMZOonFyhmMTqkAS83CgZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qu0HRDTU;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6450B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qu0HRDTU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=X+yygbxUoN1ZfucgOCaad1pSIRXDRAW6Rdpby5YRIMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792517715; v=1; x=1793122515;
 b=qu0HRDTUi+Kp0tiqP6pTfhDUqYUBmTqxY4d46ygy3adKll0xuXsK9knjbKio19bEGhpPNKLf
 nf9rIRr3PrJQLlhvAyjF/2yfvFGYGYIoxC+E57a1x7XqIl+5LNmhP33tnbE1sBVEvoFjNMjEje6
 4wl54qfAKO+66puqlICHMaKc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d23907ce8bec091b;
	Tue, 20 Oct 2026 17:35:12 +0000
X-Mizu-Trace-ID: d23907ce8bec091b
X-Migadu-Flow: FLOW_OUT
Message-ID: <20ac0187-cae1-4c8c-9949-8e8501aff2fc@linux.dev>
Date: Tue, 20 Oct 2026 10:35:06 -0700
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
Subject: Re: [PATCH bpf-next] libbpf: Prefer mounted tracefs over debugfs
To: Eduard Zateev <hackerowskiy@gmail.com>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman
 <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, linux-kernel@vger.kernel.org
References: <20261018092629.585046-1-hackerowskiy@gmail.com>
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20261018092629.585046-1-hackerowskiy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 2:26 AM, Eduard Zateev wrote:
> The tracefs path helpers look up /sys/kernel/debug/tracing first, even
> when tracefs is already mounted at /sys/kernel/tracing. This can trigger
> an unnecessary legacy tracefs mount and selects a path beneath debugfs,
> which is commonly restricted.

This doesn't describe the actual problem. If debugfs is restricted or
not mounted, the existing faccessat() check already fails and libbpf
falls back to tracefs.

It looks like the actual trivial improvement is in avoiding the
debugfs/tracing automount causing:

  NOTICE: Automounting of tracing to debugfs is deprecated and will be removed in 2030

in the kernel logs whenever debugfs/tracing gets automounted.
libbpf triggers that on legacy kprobe/uprobe/tracepoint attach when
debugfs is mounted.

See commit 9ba817fb7c6a ("tracing: Deprecate auto-mounting tracefs in
debugfs") and CONFIG_TRACEFS_AUTOMOUNT_DEPRECATED.

> 
> Prefer the direct tracefs mount when statfs() reports TRACEFS_MAGIC.
> Checking the filesystem type avoids selecting an existing but unmounted
> sysfs mountpoint. Preserve the existing debugfs fallback and the default
> tracefs path when neither location is available.
> 
> Fixes: a1ac9fd6c650 ("libbpf: fallback to tracefs mount point if debugfs is not mounted")
> Closes: https://github.com/libbpf/libbpf/issues/966
> Assisted-by: LLM
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>

Please update the commit message to show the actual consequence of the
change. And drop both fixes and assisted-by tags. This is not a bug,
and assited-by has been recently deprecated.

The diff looks ok to me, but tbh I don't see much value in it.
Any particular reason you decided to fix this?

pw-bot: cr


> ---
> 
> Validation on Fedora 44 (aarch64):
> - Built static and shared libbpf with the default warning settings.
> - Exercised all five path helpers using wrapped syscalls for both mounts,
>   tracefs only, debugfs only, an unmounted tracefs directory, and neither
>   path available. The original code fails the both-mounts scenario.
> - Confirmed the direct tracefs paths on the host's mounted tracefs.
> Privileged BPF attach/mount tests were not run.
> 
>  tools/lib/bpf/libbpf.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index cb09ded90..9db0a8bde 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -59,6 +59,10 @@
>  #define BPF_FS_MAGIC		0xcafe4a11
>  #endif
>  
> +#ifndef TRACEFS_MAGIC
> +#define TRACEFS_MAGIC		0x74726163
> +#endif
> +
>  #define MAX_EVENT_NAME_LEN	64
>  
>  #define BPF_FS_DEFAULT_PATH "/sys/fs/bpf"
> @@ -12713,12 +12717,17 @@ static int append_to_file(const char *file, const char *fmt, ...)
>  
>  static bool use_debugfs(void)
>  {
> -	static int has_debugfs = -1;
> +	static int needs_debugfs = -1;
> +	struct statfs st_fs;
>  
> -	if (has_debugfs < 0)
> -		has_debugfs = faccessat(AT_FDCWD, DEBUGFS, F_OK, AT_EACCESS) == 0;
> +	if (needs_debugfs < 0) {
> +		if (statfs(TRACEFS, &st_fs) == 0 && st_fs.f_type == TRACEFS_MAGIC)
> +			needs_debugfs = 0;
> +		else
> +			needs_debugfs = faccessat(AT_FDCWD, DEBUGFS, F_OK, AT_EACCESS) == 0;
> +	}
>  
> -	return has_debugfs == 1;
> +	return needs_debugfs == 1;
>  }
>  
>  static const char *tracefs_path(void)
> 
> base-commit: a6303535c2ad9d49598d52556183911f02287791


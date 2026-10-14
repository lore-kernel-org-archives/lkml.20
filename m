Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E5379989
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014220; cv=none; b=Ji7Z/2QXkwma/vHM03CD73daSgznhgWi7aTsDng++vR0y3j/LIdlRFR97ZPX+B5C7L8gcOu5reJa7TYRzUW75ExQSE8UOTceru0IMKL/LxHwXoTYvai5q/VswKN1oOxHPMnB3tOA5Prg++UtYaWIJiou07TuoUcR7z7aXmLW8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014220; c=relaxed/simple;
	bh=e+rpqIT4zirx0GVPRZ66xQhWi5rRXE9U3uulpMKKe1I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbeCI+ATFnPmhUlNschatDL6O3XxWhn0kRRvvwnY9yg4qJQYbFtddLjTe4VxBxwmQnCw5rFK4oZH/+N75lKwPdp1Ovv4u0rqu6G6iMQcVlRw6VG1V4ATdSD+w+R4538MI0I0PoMd+QtrYoWHrRYNtUFhMak/Ytkl2GbkXHWLTqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snNf3p3b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snNf3p3b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso32910745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014217; x=1792619017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUGjx1llrTDfPWrErlxQ+ApKB29LYnD9ZO445JdHHZk=;
        b=snNf3p3bwGCR4dibLc5GAnYl0JJ8iBqp4C3q8RW03SuUcXZF/DYo0LnZLawnx2k2Ly
         gfPghXSwhfEtF2744wIEevr3crQUeAvM/6czt4/bbPw5Hs8oKrmFciQt+sPXPnodnkQf
         SWl9KZ3RZtHOINKufPtYUDVwPEk9kzlBtDCnhTWz/Ngk4L8WL9/cMeL8UDsBiRmaAvCC
         AHelCPEPJjeN+acE1M0QmhEQEgNoGgWX71zflMM+sQ7cbiFTh7Un/uPW3gBqTE/5Fjqz
         p7O33utQWOc1XXpUosagySu/VZNmWa04LR0cYXsSNDzAmJ9GX5BtYgqMfyrMAW1pW9rx
         XMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014217; x=1792619017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUGjx1llrTDfPWrErlxQ+ApKB29LYnD9ZO445JdHHZk=;
        b=mVnvsaY/U6mmYkEapEDtbE2AA5/NKDiFsFkgME+p/T+XkxRYJoBpAK43R7dMveHFgI
         QUj5IP1wMh61gK2VcVm3yIj39hfqOJpu+9HUOF4fzl53y00gPAwOFnBGJwlM/IkPOpSd
         QNUlwJQ+KstLu8kr+0ocCgYN0170aVh5YY8pogbo3kkmISKVP60L3LZ2M1r/I8WXX/xA
         gau0fEBa/p+6p/XsOX1qNqrcmX4bePVbU0vwFRHVtYdWisBhcjtyRV/HiW+8g16uN2UI
         Td/gVa1N+Kq6rgXrkbnhydyGBlk4p5VUNgLqHJVD38UXIVnzemuTiMMkYBXKUq3jPf3L
         K0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbB8iGffonqB3Zngml3q7Npq9O8/B+4dkJWWSbKDyclW93W3zpeupbZQHj9o/tC7q6kLZSpsdk3OuIbFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBqncbxBaD+PZ0dMXbfVrbfpySmJ0kO6YFgal5BdOrQEX3iSZN
	HPFIFg1EZ9eL82yYn61L7ZBEumIeqQexzBH2vQj8zncamZ8VaRNDQscA
X-Gm-Gg: AYBFou12nekd5CdXEBNmAbwJ7LuTzf6IrGPyjEeda5w3CUuuPYVj3IqeIYr+LIBJzfG
	wXq0zDpev+08cFtTC/fwCRkaToQbBocnPV63Bdp3HFBayWEm9MVED5AGstjkIbBLt+u4Q7n0Li8
	4UeBrTCfzq6vqkuHVhvPHXr08iOWruZkSeEEYOviuNYLnClc6NS0pgWD+nSSR6cEchU0kMKcA7d
	oAE44/spMJQ1jPucgS2aw78p0u95OPCU1rbkOnTJS5zlQrZurdkfpXROWlgjafnXusZikuwmvuS
	8z6TR1WDGcKo8nMJq07GNrRzM487Cu1HLkEkbS2AzxIevwchRyCqL2psmw74kTbC2wfck30cddP
	1rzegk3cauw1Erl1D5gI4I1yeP9JqHUIo74am8q72nr7Og+CrRnZUNJnk6hQVIcd7eNsU1ANLF+
	p/0oqRbCY7cCj8fUeo/dFLROFABaaLArsX76c/JLWp1xxWRX/XwvGDja14j3jm7dFi3bR3
X-Received: by 2002:a05:600c:4708:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a18e4da3c8mr339297955e9.29.1792014216881;
        Wed, 14 Oct 2026 14:43:36 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66ab3dsm20882205e9.2.2026.10.14.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:43:36 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:43:33 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 02/21] bpf: Drop unnecessary
 ftrace_location() in register/unregister/modify_fentry_multi()
Message-ID: <as_3hf7hfmaQjBFd@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-3-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-3-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:04PM +0800, Leon Hwang wrote:
> Since 'tr->ip' is already a 'ftrace_location()'-ed IP in
> bpf_trampoline_lookup(), it is unnecessary to call ftrace_location() again
> in register/unregister/modify_fentry_multi().
> 
> No functional changes intended.
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> ---
>  kernel/bpf/trampoline.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 17f2a8133f61..21d460866dfe 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -1629,8 +1629,8 @@ static void ftrace_hash_add(struct ftrace_hash *hash, struct ftrace_func_entry *
>  static int register_fentry_multi(struct bpf_trampoline *tr, struct bpf_tramp_image *im, void *ptr)
>  {
>  	unsigned long addr = (unsigned long) im->image;
> -	unsigned long ip = ftrace_location(tr->ip);
>  	struct bpf_tracing_multi_data *data = ptr;
> +	unsigned long ip = tr->ip;
>  
>  	/*
>  	 * Different BTF ids get different trampolines, but they can still
> @@ -1651,13 +1651,12 @@ static int register_fentry_multi(struct bpf_trampoline *tr, struct bpf_tramp_ima
>  static int unregister_fentry_multi(struct bpf_trampoline *tr, u32 orig_flags, void *ptr)
>  {
>  	unsigned long addr = (unsigned long) tr->cur_image->image;
> -	unsigned long ip = ftrace_location(tr->ip);
>  	struct bpf_tracing_multi_data *data = ptr;
>  
>  	if (bpf_trampoline_use_jmp(tr->flags))
>  		addr = ftrace_jmp_set(addr);
>  
> -	ftrace_hash_add(data->unreg, data->entry, ip, addr);
> +	ftrace_hash_add(data->unreg, data->entry, tr->ip, addr);
>  	tr->cur_image = NULL;
>  	return 0;
>  }
> @@ -1666,13 +1665,12 @@ static int modify_fentry_multi(struct bpf_trampoline *tr, u32 orig_flags, struct
>  			       bool lock_direct_mutex, void *ptr)
>  {
>  	unsigned long addr = (unsigned long) im->image;
> -	unsigned long ip = ftrace_location(tr->ip);
>  	struct bpf_tracing_multi_data *data = ptr;
>  
>  	if (bpf_trampoline_use_jmp(tr->flags))
>  		addr = ftrace_jmp_set(addr);
>  
> -	ftrace_hash_add(data->modify, data->entry, ip, addr);
> +	ftrace_hash_add(data->modify, data->entry, tr->ip, addr);
>  	tr->cur_image = im;
>  	return 0;
>  }
> -- 
> 2.55.0
> 

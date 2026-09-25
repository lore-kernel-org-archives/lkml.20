Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E5397920
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316368; cv=none; b=qtHkxGo+OfOgoM3Djrl9w4UXFToPDpXrPvpITULixh9pi/Ptt+pMyOqxYdBQRqM5MdC8QHJa1pCkb6ZtyxRynL43rN9RWVsxAuYz0378jhjmVakctAyUAhmlrQCa+SZFFV31TRKs2g/d7SGSIsbTTE1lQCnWPTx6haRJD0uqeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316368; c=relaxed/simple;
	bh=WktjZ/A+Gu/6kXoWbp9IAwlBC9X9a8yh4FUhdz7uXoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VzVhxgjAZEbdBSGGxldanvlWx3wetiW4AaqeX43leAZigUn8uWtGO90lPDY+3WPaX9B7S0Sy9KS6HrLSF1C7bWEAfhDLbGb+q3YqS4fdi5kEji1BqY1H/sxg8T/U4ftjn0Vcsy6TRSiIql9TqIafn18G/4FYXDxcdiSmY3rfWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Hm3/0zeX; arc=none smtp.client-ip=95.215.58.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Hm3/0zeX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WktjZ/A+Gu/6kXoWbp9IAwlBC9X9a8yh4FUhdz7uXoU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790316363; v=1; x=1790921163;
 b=Hm3/0zeXBGJEJmn23cyvGsluXz6XZJfyGeK8CuqLz3+hhn2DxAj9FCBMR8kMyNprlANRgyEC
 6YnnbSHCpcblBxTf0YoZEWFMpK55o137QoRlOsOogkirvrOtm5orgoOHf9rAW7LX9xqmn+7chpE
 pd3yxjgmP63m75L08WCfp+wk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2b5ec772b54485e0;
	Fri, 25 Sep 2026 06:06:02 +0000
X-Mizu-Trace-ID: 2b5ec772b54485e0
X-Migadu-Flow: FLOW_OUT
Message-ID: <d675af17-6b59-44c1-b90f-8fb468cc1d63@linux.dev>
Date: Fri, 25 Sep 2026 14:05:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] bpf: Roll back freplace link state when
 bpf_arch_text_poke() fails
To: chenyuan_fl@163.com, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, jolsa@kernel.org,
 linux-kernel@vger.kernel.org, Yuan Chen <chenyuan@kylinos.cn>
References: <4669addf.91e8.1a0d2da9b9c.Coremail.chenyuan_fl@163.com>
 <20260925043500.28030-1-chenyuan_fl@163.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260925043500.28030-1-chenyuan_fl@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/9/26 12:35, chenyuan_fl@163.com wrote:
> From: Yuan Chen <chenyuan@kylinos.cn>
> 
> A freplace attach claims the target prog by bumping
> tgt_prog->aux->freplace_link_cnt and setting tr->extension_prog.
> bpf_arch_text_poke() then makes the extension take effect.  If the
> poke fails, the claims are never released: the attach unwinds
> through bpf_link_cleanup(), which clears link->prog, so
> bpf_trampoline_unlink_prog() never runs.
> 
> Drop the link count under ext_mutex on the error path, and set
> tr->extension_prog only after the poke succeeded.  The count is
> still bumped before the poke: it blocks prog_array updates while
> the entry is patched.
> 
> Fixes: d6083f040d5d ("bpf: Prevent tailcall infinite loop caused by freplace")

Your commit msg also says the issue about tr->extension_prog.

An extra Fixes tag for tr->extension_prog should be added.

Fixes: be8704ff07d2 ("bpf: Introduce dynamic program extensions")

The changes below lgtm:

Acked-by: Leon Hwang <leon.hwang@linux.dev>

Thanks,
Leon

> Suggested-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>
> ---
>  kernel/bpf/trampoline.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index da85bd580ef0..bf4ab0ac264e 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -973,10 +973,17 @@ static int __bpf_trampoline_link_prog(struct bpf_tramp_node *node,
>  		err = bpf_freplace_link_tgt_prog(tgt_prog);
>  		if (err)
>  			return err;
> +		err = bpf_arch_text_poke(tr->func.addr, BPF_MOD_NOP,
> +					 BPF_MOD_JUMP, NULL,
> +					 node->link->prog->bpf_func);
> +		if (err) {
> +			/* Undo the claim from bpf_freplace_link_tgt_prog(). */
> +			guard(mutex)(&tgt_prog->aux->ext_mutex);
> +			tgt_prog->aux->freplace_link_cnt--;
> +			return err;
> +		}
>  		tr->extension_prog = node->link->prog;
> -		return bpf_arch_text_poke(tr->func.addr, BPF_MOD_NOP,
> -					  BPF_MOD_JUMP, NULL,
> -					  node->link->prog->bpf_func);
> +		return 0;
>  	}
>  	err = bpf_trampoline_add_prog(tr, node, cnt);
>  	if (err)


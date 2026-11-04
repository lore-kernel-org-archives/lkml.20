Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779580;
	b=d+Vx0oqGykSySxCMzJ092WXfukKMlEfr1ZMlVgjBUNRglTfjxJcf8yEYAKb0uwJIVDzz
	 uhPCUme+Ww+oUZnH9DVUXOOSdXizDoauRAiu+vqo4ELEQhTJV6e6Rw5oGZ1EOOgWfeVuZ
	 adB1ysc7uFMgb99qtZbdv8jq/7CkT8fS7sNHVbxqOvAsIEbQ+E5j7/KrJahWBCEgcJQTt
	 WVwBrldGcfQtT/S75aLgWLwTVd0ZYTDYRDqPv3Uv57nbfYhBulkWog+h6g+LF/TWlRsBi
	 WBAORaTVdjtUpASB+Ptp5XVTm/m3NEOZ9uY4a9WPX8gg639xY2tpCvt1boP0KXgNrAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779580;
	h=DMARC-Filter:DKIM-Signature:Cc:Content-Transfer-Encoding:Message-Id:
	 Received:User-Agent:X-Original-From:References:In-Reply-To:To:Date:
	 Mime-Version:X-Lms-Return-Path:Content-Type:From:Subject:
	 Content-Language;
	bh=sduOP3VW/r6BpntDuFO0P9ijMJnVNglrHxEYHPAMFGs=;
	b=YXze4bC9hpE7r8nZ7aNoOAlpMX9TIt6U9/vRabmyb3UUIorckgxkOUccQQSHAeCMRbAl
	 kKMwCgpFB0Hb45xE/0jO2Q2JZa6IjVazQMaMXAo3IqbdnxaJrLLxI9wnmM9sjn/Oikkyo
	 t2T4B1yw+6AgtLcSwBMQifEfG34Z3a+2hC/i8TbYMQybEqcDKVPQWxwqY+5sQn7VB53Ok
	 ddc59JZDHY8BNvXPQL9kECyrlMoXXOwc/tVSrWy9iF2JtG7XlamBa3jnKmwQovnq2BQrw
	 2mwCG9tj/7OIksLCVVHBYhKN0eHJvYBJXG5Qy0zYb9hvCRFE1EMwVsmNMetI1mYaFNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=t5NJye8x;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC4606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FAC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=t5NJye8x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779573; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sduOP3VW/r6BpntDuFO0P9ijMJnVNglrHxEYHPAMFGs=;
 b=t5NJye8x1RxJskqatwoPm5DHse9+bwYNysEVE6xUcyGG3EMrJTjeLp83/lj5RHgwdSlOcI
 X/nlmdPnn7bRZ6netiw/HtNb2kx3ZTow5U8OSk8yKmKrUHP2CDy0X5VIfQ7F99629gSend
 JgKUO99wuDnIAloKVbfQb524mNTohvY3o7yzdJzGvNc7tW5Mmoi90m7Ga9sfng/5QWQg5j
 Ma1dCG5hcK9TkX/AYClGg/IAkCTGgcizYAAFYTi/SLeLUNk2IMEyf36RbyIInE4bvKY4JK
 fqmiFdmNNwtHGLUt5hw3pMosPxbZtqLaoWXUR/jRIpwD83jdEjX08USXqICh8g==
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <zong.li@sifive.com>, <wangruikang@iscas.ac.cn>, 
	<debug@rivosinc.com>, <qirui.001@bytedance.com>, <guoziyi114@gmail.com>, 
	<samuel.holland@sifive.com>, <ben.dooks@codethink.co.uk>, 
	<cyrilbur@tenstorrent.com>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <yang.yicong@picoheart.com>, 
	<stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <b8f28bee-83d6-4566-889d-6119e2837ddb@picoheart.com>
Received: from [100.86.223.207] ([61.141.241.106]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 16:05:58 +0800
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>
Date: Wed, 4 Nov 2026 16:05:55 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aeae767+147470+vger.kernel.org+yang.yicong@picoheart.com>
Content-Type: text/plain; charset=UTF-8
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
Content-Language: en-US

On 10/22/26 4:32 PM, Yunhui Cui wrote:
> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
> set in sstatus.
> 
> This lets next run with user memory access enabled even though its saved
> SR_SUM state is clear.
> 
> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> live CSR before restoring the saved SR_SUM state of next. This keeps
> prev's SR_SUM state intact, while preventing it from leaking to next.
> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

a straightforward fix :)

Reviewed-by: Yicong Yang <yang.yicong@picoheart.com>

> ---
>  arch/riscv/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 61b7a77166971..628b85e3915a7 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
>  	REG_S s10, TASK_THREAD_S10_RA(a3)
>  	REG_S s11, TASK_THREAD_S11_RA(a3)
>  
> -	/* save the user space access flag */
> -	csrr  s0, CSR_STATUS
> +	/* Save and clear the user space access flag. */
> +	li    s1, SR_SUM
> +	csrrc s0, CSR_STATUS, s1
>  	REG_S s0, TASK_THREAD_SUM_RA(a3)
>  
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
>  	/* Restore context from next->thread */
>  	REG_L s0,  TASK_THREAD_SUM_RA(a4)
> -	li    s1,  SR_SUM
>  	and   s0,  s0, s1
>  	csrs  CSR_STATUS, s0
>  	REG_L ra,  TASK_THREAD_RA_RA(a4)

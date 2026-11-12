Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466322;
	b=rN5RjbO45Xu2/vz4DxNyRh86L9A9AnA6laO3apvTDeIKsxY3bgO/Cd5dTKuY9ecJXVx6
	 Oq8xVFuJ13n/UrTeq9lZNk5lS5jc3nl3tSdHXJNl6cKABognK8BCHDYdQmjlR1tkflyXK
	 oo+euI4CCgg75bBO5mwFl/6YrINKrBlhIVYgp5lH43H+27yrsjt1gqF5Qo65Izcip9mtv
	 UQHi866JUAGv6HjRh7N7MJiG5QVGi10uUtzd462AQ1RSah9IiC/paLgW/qDdlcafKHXkI
	 0rQuM7jw+mIdKIvnne/WCbZ+39rNNC8l1CshW2buOEB+6f/fi2AkQDgQkblo4VNyTkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D3JLsp1QTj4757jMDwdQmMwnwAa2ZsC4IeFz9uGfVhA=;
	b=bYrmBmaiZNbCQKzGNTt2d2FIQVpyTukJqizN0EbinTQX2tMWAfWNaNmtZVLFKepr3SXI
	 kmKO34vy5w2rBCQRLMtcg+xopW82BYVp4yXVfA38Sk5aFC3uGTNrjN0vI9JtbroLztnqQ
	 LMH6Y7vYIiSbVEdAGUGrFg0TBk/Vr21BOKdlq9cm7c8gEP5zkPWSjs7sJWvjaS3hsJ89e
	 ICj25JORG7iYvvrsS3HEjDgSTAD2lzxkU1IYEdOPEYz99GQ2K48JZHcEckd5kZr8aVqb0
	 Y9BLQrNOvXolgcb+qiLZQfd2qCZAsnLG71hqZQYXoq+xc6AzMjW455FfmoLEN6Rm8Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waukMC+D;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17F606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE17F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waukMC+D
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2239622a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466321; x=1795071121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3JLsp1QTj4757jMDwdQmMwnwAa2ZsC4IeFz9uGfVhA=;
        b=waukMC+Dh6SBM4ZianwvFe5D/w6Z7X1RKpqco5PIIWdSWFlggnLlE4pPfZ3qP8qJ7k
         biWsoVv++r0z9sYyRifkCoIYsB2auhFfNYyg+fUMt7J8WtYmCJIQfuK5LwV09+VQ/CyV
         PpgtN8d+6d9eVHTSwjQLwYSKBQvgUgiKuWagO9rYGgq3yzAMuqLjgraZh9xi50TT8MQv
         YYTk+gilz4GX+0enaemRDVf8Xw94qz+ctG8ZnFCEdEqmDOeADnHPXVj30pzNqnId4sVO
         zIsR2s9SxE53G8TB6eGSf2a0w+1m+5h8uMzPkTUAGNKW9UnA2ylag708MBPJ/WsUb/FL
         og/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466321; x=1795071121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3JLsp1QTj4757jMDwdQmMwnwAa2ZsC4IeFz9uGfVhA=;
        b=2u9dcvCTrHeebuNui0aG/7+M4mYE6Bqq4GXfOaTZHcUZNpD5i/BvxrelUh4VM+l0jP
         UNrSB1larL1BUdscB51MtFdx5+aYo25i8oL0sfQfO7oYVF+1s/ZgFILyH4qzzmbTfx0P
         T1Y9tPZ9PXypZzzlny6yo6obxjK3lPDVuGIGxfCHSsf+HkKID2jSE97Dr90gKA1P/JEu
         hXiIGSi7GqqsKRuooAKv/1RqyDcE7conDoGy6YUqykc1cSSS+1/at1G98YPk05dAzss1
         UGO5lb72rgK+r6oDK3cLe/6zzU3Db4DJtw1nkqakPciTk3GV0yXiCHtFsGp9rrICVAA9
         cJJw==
X-Forwarded-Encrypted: i=1; AL+hErGjxKmZZQoKXbduod/muohOq8FLx2kgg98zJ3ftMEApDaJsVb/Ql1rRELTNXSMjKPFnIPeqA7K+yCGNNHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M5JkAFierJTbDlqPK3i0C/PCa4pNtt+Atow80xwfw1U8uBlZ/
	uQjBCvIsXGygIW8xCrsHk6U4SoiKX1B/7WAreUhQ2vUrQv9B5Trvzri7
X-Gm-Gg: AYBFou3BBZPI65XiOD1aPWDksBr4QqT/o17OJHzIRxdlTeTAQagpPmVHLBpZXX/URy+
	Q3VeVkie0kbk+ANtG2w3TcCEgU15+r3q+IVtJYTM1bAyxt2kggRbgKPqAe5ARVcSQlIlOKgLZ3X
	rIyPjiwvBA8bYNLpwcVrpOWnhymRkA81129BsvawNSSemM8x+6ZVau6lUVLrKuZWxUs4aBNEYlX
	JAIipHW4855KKNYaliDnlkkuSZD1ZzrAJqhaVML0TkHb/Il969RUwC+FdtJabUVCGR4JJkR/LHx
	o8V7qIZRXm+bZZHokT21iQBDPkmsu/o3wg6RKZvJOsXGxj6kxAZ74vxEQ/vPkZsrnRU8oB9lo+E
	YPZM8thB/X3TeoUclw3K8o8AWnND/73RAPwUqMgKimKJLsjpPs6hPc1pB6wBU/ypnOz1YxNYokq
	F4O9FW53w+zpNF4e8J62rbZii1WlZNCpUo6bEtjIxq77rHamHrB/83pe/pt8nDTEGH9uN36nD7X
	q57sMObklDNfmSnkFAs4tqR7sNd8lQ8LKUmtROlTgF0so7ecOnzs4N1nO9EPlUiM5wIqkum0WmS
	1Vj8nxgMKETk7QpyZKSphYEeiQUuhMC2eJr1QYk4ozjkEpXAmlGyYggIXlh7LJdHHao//p4XGQ=
	=
X-Received: by 2002:a17:90b:224b:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3b182f1fdd0mr4254605a91.27.1794466321050;
        Wed, 11 Nov 2026 22:52:01 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm3052617a91.9.2026.11.11.22.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:52:00 -0800 (PST)
Date: Thu, 12 Nov 2026 12:21:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	chzigotzky@xenosoft.de, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, 
	ritesh.list@gmail.com, harshpb@linux.ibm.com, gautam@linux.ibm.com, 
	amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com
Subject: Re: [PATCH v2 1/3] powerpc/irq: Add ppc_hard_irq_disable()
Message-ID: <avVh_YWoIgomwEP1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261110053238.3794500-1-sshegde@linux.ibm.com>
 <20261110053238.3794500-2-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110053238.3794500-2-sshegde@linux.ibm.com>

On Tue, Nov 10, 2026 at 11:02:36AM +0530, Shrikanth Hegde wrote:
> Add a flavour of interrupt disable which could be used in
> multiple places which also takes care of lockdep in both 32 and
> 64 bit archs.
> 
> On PPC64:
> - Disable hard interrupts using hard_irq_disable. It takes care of
>   lockdep and tracing. local_irq_disable only alters softmask's state.
> 
> On PPC32:
> - Interrupts are hard disabled with local_irq_disable. It also takes
>   care of lockdep and tacing.
> 
> Subsequent patch uses this API in KVM code to avoid the warnings.
> Wider use of it is possible, but it will be taken subsequently.
> 
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index b7eee6385ae5..075442366e1e 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -516,6 +516,23 @@ static inline unsigned long mtmsr_isync_irqsafe(unsigned long msr)
>  
>  #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
>  
> +/*
> + * Hard-disable interrupts while keeping the IRQ tracing state
> + * consistent.
> + *
> + * On PPC64, local_irq_disable() only soft-disables interrupts, leaving
> + * a window where an interrupt can be recorded in irq_happened before
> + * interrupts are hard-disabled.
> + *
> + * On PPC32, hard_irq_disable() does not update the IRQ tracing state, so
> + * use local_irq_disable().
> + */
> +#ifdef CONFIG_PPC64
> +#define ppc_hard_irq_disable()	hard_irq_disable()
> +#else
> +#define ppc_hard_irq_disable()	local_irq_disable()
> +#endif
> +
>  #endif  /* __ASSEMBLER__ */
>  #endif	/* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_HW_IRQ_H */
> -- 
> 2.52.0
> 

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021EA51DDEF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910696; cv=none; b=ZPRlMPvw/A2EimqAVy2iHf865LNqiFrUBr+1ZoeNMlb6RgN4uuhw4kP6+eAU7QwZiG1Sz2w+cEDi5wCLGTndrKiybnpWnWuGz86ivyh3s7TvqG0ZOnK95NzqS/LruW8T5f38vYqbt+4yJim+f0LErmLGcWXeBrqfNy9MgszUAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910696; c=relaxed/simple;
	bh=VTRxjO9bNsFZwc3Tr3LXvCFVxuSh3Rd66eosDqMOxyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/mhDeyQKK3RZexp6eOgzyFS/tyASROWpjd4oeKy1rDSY278mSn5kgNCLcCtWTBlZwhT4yUYChyUFpLDpPgRHy+q70TxvnsPX752w2t057b8Ibu7Hdp4WyyW3hNWcFX3x3TaFoVe1TfGTzaWIvJRVt5643+/G0nxIhENypzgJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=BfQKqEzw; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="BfQKqEzw"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b05bf699easo23896637b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910694; x=1792515494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laIYJl8lTaP86mKuKV52j9MpiQPLusAyIN1HdFdU1iY=;
        b=BfQKqEzwz2Z1pUHlmMAkAbqtsccLt7LdxgyJR/J3M4oLVrB8TW+suNN9+vgJmQYq4D
         4Id9YsWPtOJBH0Ge03Nicvm6rCO7RUn9wAZHnsc4/Kxo3yNUzEAsM0GBHEiNZHO2w1qi
         FabNRzo3JiVl8qO5fLQ7OXM1SuD1mJyzffNkI/4jFESTmCAExHWVAIPizJVZ2cdR+itl
         hUGtfJqnmEweMp7uomuOyVySxXY3OpQQaW8cIV6KB1Lf8UfrN5SK/aSpRG8CyZPfaui1
         W81DJM/mLJYVYIQC3uTxlm0sePw26h2GRlYse9U0BjpEbv8g/prLDSYVq7zSMYSMhJC2
         BV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910694; x=1792515494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laIYJl8lTaP86mKuKV52j9MpiQPLusAyIN1HdFdU1iY=;
        b=x5HV6uIC3ienDEKLag+oL/+NFGEQ3zY90E2nA481EZqhWZQih8WbaJiMqV2KpHjjbz
         GrWrvCGwZvU1+33duFpWDxNqogW+uSvHqrAZd96MdEFZkwMpBt/4hp3ovzjEJqkdHTJW
         /UyBwSnKB92ZlHYh1mzFUwpuEBUfrFibPwdhM9ibgIyoUg3K3Lc29PC9y+Or0iSFdZ+m
         ySFzJMZHzqvfjpQVJIW4JdJrgVIJcsciCD7n/OiQWcNR/GpcOOnJfUkgv6qWD2C1du2n
         w+jZxxCbOaTLz9BZirdUUQoPMDb/D0doYsdo+g8JJQYLO28ZX7rgylynOrWNZnP2fytb
         TskQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMjsPN9FHWvIU0QO3CC81xeXEYJwRQXu4ru3PU2BkqFMJHd5NjAhr7SYzpiVXNCperEcZfc44kXDL4q5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCCzcvX+/cLm3M2MkqdDVsgE4Wux4YFG8hxi/gQBXqO25RPlQ5
	+/fA6YDRU0Eup4THVhRJ1LU2rNykw8TkuC2SLJ+DVwTmzrnYmP9QNTCVF3D3WCRYyns=
X-Gm-Gg: AYBFou1y1zIexss4EY6LtIAQPgGnPI1dbHSXa7+u4moe5L3drjqlKKnCnEaXOlifROD
	RRPNKcahMe0Mxjrt5tpxnr3spi0pHApRtrRhYz3625fFe9WMBUEnwL5BKVGzzWvG0UZ38xkRMhC
	uHe3428YCbIpQJ409Y9qG7+4Et4oeOA1XTLXw2WtJ7akAt2ttOB2UmcrCaTRe/tr71asIGOPgEA
	Ih6yFRpVUtCLlDuj1k7/h8fnzC665S10HvkT5f5CAntgXRgSWPpostAqIqUc/h7BIabrZP4q2DW
	esoyojqZrgSLEV+Iugn9rXMaT/uw9Eu/bW8U3NJu29twIlJI8NPwtNzngJrJwIzXOxk5QCh9NoC
	xSP8xflobbVHtsjV+AS6KuSUeUmWWtkjqRNG7vtDbB9/f+NW+SSd6sIL1gaVhe+7gcgoOCLKd0V
	iIK2YCF8S27s5r747XZltW+MeyY2IpWXqz9qEA+L4aU3x21v6IiqiJ5R1etme3vSk3B8bpzTmZx
	RgrzZ6o+s5a8f0rwftlQgAzadQl57M=
X-Received: by 2002:a05:690c:a707:b0:8a8:8d90:a6c8 with SMTP id 00721157ae682-8b07ebf63demr28292507b3.6.1791910693578;
        Tue, 13 Oct 2026 09:58:13 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0c1d50766sm2626537b3.49.2026.10.13.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:58:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:58:12 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] RISC-V: KVM: Decouple vector prctl state from VM ISA
Message-ID: <as5jJCqsRf6kNOAS@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-4-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-4-samuel.holland@sifive.com>

On Wed, Oct 07, 2026 at 01:51:18AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This was hooked up to KVM so a process that
> could not use V in userspace also could not create a KVM VM with V in
> the ISA.
> 
> Remove this connection as it does not really help with any compatibility
> concerns. A VMM that does not understand V will not include it in the
> virtual machine's ISA.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> 
>  arch/riscv/kvm/isa.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 971f44655100a..447c778bf850e 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -9,7 +9,6 @@
>  #include <linux/nospec.h>
>  #include <linux/pgtable.h>
>  #include <asm/kvm_isa.h>
> -#include <asm/vector.h>
>  
>  #define KVM_ISA_EXT_ARR(ext)		\
>  [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
> @@ -159,8 +158,6 @@ bool kvm_riscv_isa_enable_allowed(unsigned long ext)
>  		 * Guest OS can use Svadu only when host OS enable Svadu.
>  		 */
>  		return arch_has_hw_pte_young();
> -	case KVM_RISCV_ISA_EXT_V:
> -		return riscv_v_vstate_ctrl_user_allowed();
>  	default:
>  		break;
>  	}
> -- 
> 2.52.0
> 

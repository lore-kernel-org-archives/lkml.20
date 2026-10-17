Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF174F5E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792218550; cv=none; b=J6xeXRZ5V7pliuPQssW5gmtqlIRQS7PAJXXyoCuIF7XXdcWA73g/UMQylCEMRrti1PO+uJbN7KT/dRhyyFQYDiT7eQpB9armfp4xOyfNIsqGl77uJyg46ajF/RGL0YfWlcDCCzLggfTqBPBz/k4ayl/ZU4ZNBJOUPVkS5A7lcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792218550; c=relaxed/simple;
	bh=i5Z1Qs66PBHaNvD3CQq2vpwzMbNCyM6CPGSuvxGpIvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbQa2agjcC2Hz4nKgLRZUq0sCH6+CLUep1QKzEX1XAIRlRU53RZhUNCpZ5yOdBpHxE1vqa5XO0Dp4+XhIlrgz91HNoscYkjy+EFlNPOmIlGpIs3VpafIdE8fiQEhPuLkmc4jtA1j/TmggV5WmcqTd/LvFR6tnEW+Iiq11SFwMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=F+fdbmAQ; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="F+fdbmAQ"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6714595153cso1490130d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792218547; x=1792823347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAXxfHVNqjjg/hDaqmfmaVEvPRdegvgVTMA3anU5ytA=;
        b=F+fdbmAQK4HRrbx3+iAUYiI6AMFwCPwSxZcvJJLEAPMmkWWWGhR1WjBSl84ProMzpx
         fv+deifr9qN8rCKHj75FI29d8ZylSu9HdWaxWLSnmRcCX6DxkyvAxLtixC77ao9ROzoU
         19H225F6vJUlXkPBon9nKOiMTzm9G2NtVvOOZNjjbX51Bvl7spDEBN6MsAnuAzjcBW7x
         povxAVuXhyDMthZgjH6THMyR0R/oU5nXjBJGAUHG2e5VonvezttmXFiCaJnozwHLRxY9
         JU0F/+z2ofgL5Kvhy62BIMFTDmSVDj9mP0hgTiQd4FI3i+lzP8X4Aloo3UBQ0PHCZnib
         ntKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218547; x=1792823347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAXxfHVNqjjg/hDaqmfmaVEvPRdegvgVTMA3anU5ytA=;
        b=XEk8c4aAsHv5Wy0UpiZxQlvwIQar64/o1tSauciulUJrHo/cpKyoeFILf1ss+11Pc7
         cvPz0/JuEHiReWc4NN2iZbYF1qDjCsKLTEQmrgFtLVYN+L6NyO7uRyZdlej66J7NT7au
         4DOXc4wMK7//RgpgquGcQhVdMRPJMEAsfxMO4LrKkgzXUT2aYpdS+0YkrU+Hc/fOMqlK
         Y5JJW9RUwsoLlsJg4WohLu4H6UpClQD59q0yUDIl2XkAlHbMm3POt0Mjfy5MRGv0+pMF
         JmXWdMDIDJlYb/JidavbAU/4iTXmHf+Kbn+mXu8DE1lRzSYzgUOi8k1HdIo21CEi4rfB
         oXLQ==
X-Forwarded-Encrypted: i=1; AKwUvBztdL2uY5TiLv477+UBFepja7A9XFMl2a0hDt2QLlXr4iwi3Y2uj37xhVurapCSQhyA8Yi6Um690tsh3JI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyXTeVaCraoI4TegK3pxRkiCwhgsGfk3A2pLiNmgamkBDWP9Zs
	Vqn7OBFgExlihvR8XRzRBumbOq6QOcCbqj2F7evXPAk205t6kIP8827HdN/AXqNv28E=
X-Gm-Gg: AYBFou1+OaT6bggvKXeM3RIqd23Avdf1LwYjs91dGiEQDvytUoeZYwFb/v5yJOM8fFx
	HVOjczeJ853W1+D8YgmXbuI/WbDVgWUo9bIYQMD/K0iveMGdmJmoMNWT6YKZ9VYTcYlyEO6m4MC
	TVVL733nkzLwKonm6gWsLdEZ0EQazyvJruS1td6mQSlw/bFac5tDtKRtpn1riSH4oVujma8WyVT
	s4zSqe4Z3+NgHGLnnhT4wUw0pDKvg4L8txX82mM7Ke5Y4lIihGLPpNIEoWDDoFJ8K5j3TsLB3Lv
	79NVxeYVQThvLHelgA47LQRa9LHFNaALpnJLY30gWzNwa1IDLWqAX4qUAELebekowTplWWYZxKC
	I785W1nOj9C/vgX3p8BmYCxXhLUcJ7n6QtOXP4NdY42EqSmi09sIomXFX3WdFFZyMt8Hvm5H42A
	f5eEz2uEZ0cIAZ+MRTDOF90QIQvUqZqza3JoCE95i5kqr+TreyAnYetwZlPSsid34M+Uu5HyIIg
	FCFiLCP8zQIcgcmXnsl
X-Received: by 2002:a05:690c:a74c:b0:8b0:cf3d:7b10 with SMTP id 00721157ae682-8b0f217d5fcmr5126757b3.28.1792218547682;
        Fri, 16 Oct 2026 23:29:07 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e591c848sm17573967b3.35.2026.10.16.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 23:29:07 -0700 (PDT)
Date: Sat, 17 Oct 2026 01:29:06 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	andybnac@gmail.com, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: Re:  riscv: optimize mode switch latency for Vector
Message-ID: <atMVshcr7cp5wx6-@Tao-Chiu's-Mac>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
 <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
 <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>

On Wed, Oct 07, 2026 at 08:20:18AM -0600, Paul Walmsley wrote:
> On Tue, 6 Oct 2026, patchwork-bot+linux-riscv@kernel.org wrote:
> 
> > Hello:
> > 
> > This series was applied to riscv/linux.git (for-next)
> > by Paul Walmsley <pjw@kernel.org>:
> > 
> 
> [ ... ]
> 
> > Here is the summary with links:
> >   - [v6,1/8] riscv: do not read csr in vector context switch
> >     https://git.kernel.org/riscv/c/5fd018c630e2
> >   - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
> >     https://git.kernel.org/riscv/c/4740b934ebe7
> >   - [v6,3/8] selftest: riscv: test vectorized user copy
> >     https://git.kernel.org/riscv/c/52318cf0fa6e
> >   - [v6,4/8] riscv: vector: refactor vector context operations
> >     https://git.kernel.org/riscv/c/1a5c75ee3d09
> >   - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
> >     https://git.kernel.org/riscv/c/cc12e55016ba
> >   - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
> >     https://git.kernel.org/riscv/c/0d4b43a7734d
> >   - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
> >     https://git.kernel.org/riscv/c/6740ec489dd7
> >   - [v6,8/8] riscv: vector: optimize vstate operations
> >     (no matching commit)
> 
> Just to clarify, I only applied the first three patches, for the reason
> mentioned earlier.
> 

Hi Paul, sorry for catching up this late. The whole series should be able
to apply, as the kvm fix is already in the tree. See commit b5060a4aa33d
("RISC-V: KVM: fix vcpu vector context handling for kernel-mode
vector"). Please let me know if you had encountered any issue when
applying my series, I am also happy to respin the rest of the series for
the next release if that works better for you!

Thanks,
Andy

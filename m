Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987890;
	b=h4b78dggL7ZB7HnS2G6RmV7IQxy/v44ZxRyOMYuL0jeLKkn3nzblIrI9rwKkJv9oldo6
	 f8QbfBHfsgIGj9VGplKijb69JDu9quwCZjFD1+41A2QRabU6RDjq4QfZ9cne7qPY2tUK9
	 Oa3ZQstaALdYocn8m5SYiDDnFvXK1Oj+uGE9/CjgxXGTHZ9wmHAvRaRuC61iZL7t9pQMX
	 cNG2CCrSOqpJQ0w8gRlP01PZHRCCcpWvIJKqzCosvSEcgjbdCSVqCymovwGVA0ZgeihrI
	 w+uv5nf/APSqO4HrRmsF5YacDdf93UzGnTWogV/E7zAjlUiC4CuduLp6faXD019TtAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=;
	b=Jo2osaTt67kWDis7xJed8M89AY5M8hvVS4X5+iXW3rCUvcblIkvzxObzQOPkVHtQJB88
	 MurRDnI+jIStRgMyMWFvZTvk25TOSfK7xeJi9RhEzlyozQKCbX9fQm2+D477W832UYeNv
	 pG6yrSEGLqeDMn5BBXGizpt/I57P8oQ5XL6r3oz+zjoEqxUgqFXcj1Qs8c5TsMfFDQBJy
	 L4TgP/OK2JS8NK+Ym9R0juUstDj8l/J4eblltHXjU6DG4paYQbNhBBlkLJA1soeXEWVDJ
	 CvlCn6Rwc+c4Nx6O14OSsNXmlSHYpbQvWZI8KYg3a9iYuMs7yq6Fei+VYzsnyS3xwCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="CqxfqR/c";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173A606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4173A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CqxfqR/c
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8380795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987889; x=1794592689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=;
        b=CqxfqR/cUh8AJlLzkvgITLK1SmDNsBsLrV18EJse3aq9MPyMMqMXPA/aQCg/BBDu3d
         yD7JVsBVbsDJen9/Uu0++vaTAFbuawnR0dBqvCnRsqNlIrRwNzTmiQ0Ecf6Fz1UfLpEY
         MaFcUNJtauJ0cBjE6SdlDoe6+B7+/f6ewtoi7IaTPQiXP2BYBkMQ6/UVS5egaYIT5BDD
         HD4th9ehFmy6QK8FUlQ3grqD/xZcClhNQo+MS98mVLq5iwwPKoI0EsF9rfkKzInXHtiH
         GR+rJt1g4ar8ympxrmUW7IWuH8kbrNgOXjkLQKI9WdSMB/VzXAXW2nzfZzsmi+LY8MlY
         tL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987889; x=1794592689;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgfTA5a+5MMLBq/A4jGpp86Ey0W49QUd8AMooz78Jz8=;
        b=jBeP06wCSo6vRBnYklE1I5ggMEQQquBepQ8/5Za71a0FyOel9ydws9Q8HHchjlftWN
         ejNcWCxiOQjs7iAweR4LsUJrC6scwlYuD5Q4nE8YOtgfGfyUW2/PhYVqQ2OWco3t/Ie9
         HUdJ/uy8ccFPwiiqrx6o1tRMctyiPCrEvFOX3y/ZpGWX6RzrtPsRmvCLr/eJ6ew3HMaN
         lS29+HFIMtOeL/PRGRlXYGEqgJr/nBZvuSN1CDFpyB56n06KU35JUc/L6tfsYJQAuw+q
         d8Fg0U+eJpZXovng0BVi9Ps66gL/aNx9j/oapo8PWn/u3fyTWJvF9ohcXkKTKb8jmghU
         1S6g==
X-Forwarded-Encrypted: i=1; AKwUvBz+SUkDzdcz2Z8IQqgEsDHeftx+rOaFsUqRD5nUmb56oM+d4RlhgLRKY8Fp/fCHlBLoA9ddcjRlMKHmfZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tCRnU+EHYhuCFalNlAYQMi1Xr5aZQC51wE1Do6CKktEODD1lJ
	X8F3lhHr/gS71x08jj8QJUJgxPwU4i+miLHSytC09QP601g6s7V0FHiV0ZkJ4g7fnA==
X-Gm-Gg: AYBFou0C/pV7gJdP4IlXackvzb9Hic5umEAdiR+SX0kF4hTt6bqrCOxlJbYWSTZhJ8/
	OjeE3T8JXHYDtO6DfUV1K4YMh/H6DfMXso0S6Em3pCirXCI+UyLecPiizAIDk4Asj1wxjFk8j6F
	rZjW2QqlJ9SFq3+/cd6KcRWppgxA0ZWI1IYJYCyZWIkmKiGPqkcR//7tJ33IxyaBTAsgUquR7AU
	t+hTe4ZpZRypa0gG6jbqThTxv9y54H3zOR+eDQUNlQScKeDVPLz6QeaeU/JITnIAftoUBqwE+gg
	hohY3vhUzYOLcg9tfn738Fc6C1+hRSMoqIT4hZxjuMq2Z1vVUCKD1jRq677R8s2jvIj3ErTZmPQ
	11aCzcGFZOAvJN0HF1ReFGQaT/tGzQ+aLE86CU+OVPkOZ/itQ+hPP/8AZUc7rcQcUbHj1NwKXFr
	Z9H0Oz79Vw9/eqJzf8MkvV4jZHQHXZ8bV5tMOhwiTH/5/ot8kiIKyfeCC+RBAcM93KCUVWUC5ok
	d4NqWDMivpNcA1jfPXbbTtPeG3SWdhx+sSzTcin32w3i+2MnU+Vv6QjoRKbIabfgIwqKv9ktaSd
	uiH5wSleLk3lKRv+OKdNJ/OCffFP/TqiG+54CqigwJVyC5p/hQGk8ncNkpjNc6+fWCnATotfe6c
	VIwYfyxA2Pg==
X-Received: by 2002:a05:600c:3e08:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b6db4a9ea1mr49691395e9.3.1793987888277;
        Fri, 06 Nov 2026 09:58:08 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm8048725e9.1.2026.11.06.09.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:58:07 -0800 (PST)
Date: Fri, 6 Nov 2026 17:58:03 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] KVM: arm64: Support SVE in protected VMs
Message-ID: <au4VKxSnkJgDtcpG@google.com>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
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
In-Reply-To: <20261105130456.1617185-1-fuad.tabba@linux.dev>

On Thu, Nov 05, 2026 at 01:04:52PM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> This series adds SVE support for protected VMs. EL2 allocates a
> protected vCPU's SVE state from its own heap rather than pinning the
> host's buffer, so the host never sees the guest's vector registers. It
> then advertises ID_AA64ZFR0_EL1 to protected VMs, and routes the SVE
> trap to the lazy FP switch. The first patch is a small tidy-up of the
> pKVM FP sync code that saves a guest's SVE state.
> 
> v2 of the pKVM selftests series [1] will add a selftest for this.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/
> 
> Fuad Tabba (4):
>   KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
>   KVM: arm64: Allocate a protected vCPU's SVE state at EL2
>   KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
>   KVM: arm64: Allow protected VMs to use SVE
> 
>  Documentation/virt/kvm/arm/pkvm.rst |  6 ++---
>  arch/arm64/include/asm/kvm_hyp.h    |  2 ++
>  arch/arm64/include/asm/kvm_pkvm.h   |  1 +
>  arch/arm64/kvm/arm.c                |  1 +
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c  |  4 +--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c      | 41 +++++++++++++++++++----------
>  arch/arm64/kvm/hyp/nvhe/switch.c    |  1 +
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c  | 22 ++++++++++++++--
>  arch/arm64/kvm/reset.c              |  2 ++
>  9 files changed, 59 insertions(+), 21 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.47.3
> 

For the whole series

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397574;
	b=g4HMDLBGZq2wbuLHDd6IGt4WDNHdjMu8WpghZQHukArDdVxGhTu4MTlzLaOJJLHURSwW
	 /rqomyWRmRFufeRsP+MKKFq5CTNmF9mEWzKi/XVVVoYh8gcEIg4ai6j1fWj9ZZVwRv69W
	 Pyt4+MNiHVNyZSIqI9Gc/f+bypFatX1j4JYAWJyoYDK6Oq16YtY6H9IT9I3nCD7WQIhNc
	 Zkt1tI+Jf2vMgX77TCoqSGYEmk5Rpq/167Kow020p/ItlRPXNG1xzlhXlWmEhYdJS+1jl
	 jtVwZuwNkAGPh+tXi4bM5KRFUyFJb+/DWYsMhtqezWGJRWZOYCZGpbw1bCTrsNV+CEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:X-Original-From:User-Agent:References:Mime-Version:From:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
	b=r78gjmynovp5kXQPrOz3tJFgxQJoV/kcMhHxeDPrSe9ZcuFg+ZeSm6t20YY6thrVKQ5/
	 uSax8A4CJBz914wVgzJL4noOHrGoUVIgjBJHVw1ZAwCu/I3cckqs7RlBbMwEbR+SWjdwb
	 s67lMz4XD0kCvg9wu3W/AUkgoiBtjvm5qq6QOpNHkCuh/UT/iSgdNnR+an6JkNeTFJNIG
	 XXr8pH0e5mZTMpVad2E+zu8A4ap5doLemGM5qqp31Wfv2QN+pcOfspW/7ijs9hcOW46qm
	 oR0VymHnmOU20j/vWdVqRUSS5Bz/NX84SigmNC+hiAqWYkXsP4nVkOR3RVzPbqcmJ0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kIwgcAUp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAE9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kIwgcAUp
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so3904227d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397573; cv=none;
        d=google.com; s=arc-20260327;
        b=ExsKpJSeA9QpFCIjoqxRaVwJqI+1N5mhBtMTrgX3I8FQKwspO6IEqzGC9k8nadZxnm
         WhECe0pBLYeffw8JYWLyyarlFqxFFahkc2a9JcWR6MYtISYB9r+Go8R8iIqOh2c1kSXs
         KQjFAM/lXr6ELbwoUimc6/zldEZdsmNpFnzpYV5oktflTFtm6wHLDtLjARGCj99Ip1Mk
         +Mv9D1e9LM3bCDL31Xj4d+X9sVxOIEQOH07JZeMpFnccRxeCuvfQZaGfxvW+M7r/4Cb2
         50oeBLMAB9nrRf9tkFfWM1ySCdzJrLpSb3Qepjqmm9BItvKgUPgRYzLqv4sHnBOT90YJ
         wxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :user-agent:in-reply-to:dkim-signature;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        fh=dsrKjowNY5CvEE19Z3KufPT6oB3oFwMoR7SQphcGsNM=;
        b=WmJsfsq+Gd8X4KfGmnNYMtzYdPVeaMOXbdnxhlStEiXXlkuOl9AzyKDoYK9B3+kSWs
         WC7vZR12eC+SJscwEIzXwtmX1aBhZhGT2W7GN9UDo0vwI0eJDCyy8yJPS2hdHfWhuA5h
         /XcQroYuoiYozRc9jbglXU0r9hgDDqhgoZuDFrd6JljbW9v21AW+tp/xcYyMtxvk5XA8
         HUwhJ4VEmkbFaBYbLPTeiZdESbOtOcS/7owmprGG8HODbxR6SkQoJ+JlFUsppUE9HubC
         h+UMX6W2M45HmA9PhF/+OspOA1AjH+UJPiJ3ZS8Rn2SPNPi7ChSYzH+KUITfvNFmp35K
         CUmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794397573; x=1795002373; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:user-agent:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        b=kIwgcAUpQqL4lZ/PQ1kOjwgNqzoOlXy05fPuJt9K9jm8u2fhViAiqEaJI0y0Aw94YL
         DXSizoXh+EafTCTjjyCPNyBhoJZIted1KJfK/LiOjA/NTEMJwkRibmfOz97PHidSGuLM
         ZXLzzjNAPpA8Z+ZCu+WpbS0v02qSWC+1vybPmx4CSgEAHRIoLroc8RikaB7/oprNsBFl
         dp7rGnORJJOvfcgj6sWmeixgXtXQ/+N1BjTksPAZPE+MlTo1RSVxTmrPXOoXwkN8rATj
         Zzn97EboZnSduCdtbJQGI1TrCg9w+fF8zsRcpK3WJov+Cm9SZ5FEMyn88GgY4GVisyal
         vSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397573; x=1795002373;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:user-agent:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        b=Ap3DBtZG8rOKBpn7sBzxTS2pXoqh+WyGGqVemlWYY0KfTuWtbkEPXF/BT2RGWu2ZGW
         zv1ptHuTZ9umlUKxEhTFmAgRZDX84yGrc1WIcVmp+0x+u3RDGA2cr2tkGm/vtdRFtMbe
         P9tl78DwwbxtFJV6FFrDNOYOxblq7oIVVOK0Bta9h+ARSv8Z67vwULJkcGd8gOpPDiL7
         owFye6R4mTqLFFBue51F/0AE6oM654PXlW0LGkIlxJllu7qTcaLz2zbiYQZRWkKwl08R
         fKgaIhfT1+wfpN/0tzgx7FTabqaArgJ9CS8aPbQvd3EpxrOBJJLaJ2VzR6XmZd1YZvcn
         uFDw==
X-Forwarded-Encrypted: i=1; AL+hErEH4aoZ9qYomwRR1MSHNLBii8szeYEtZFn7cZAElTQJOnSag1kdoglKIJqXa2sTk104kdmSaqYx90iPVdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H//ctVU1nW7Sk8KvzvWB0m7gmcCjOYr2AxbUY9dIAykHPOWU9
	IGWViw6QI+agLnrEgTutmTvyZPOcdw618K4ERS0SLnbx0l9SLVblkg4Jyl6eftCI4cvkxKtC7hK
	J9ukUGGxYmEAxW5Kk6t6vZQk+KpiWzuRmbB0jH2/shg==
X-Gm-Gg: AYBFou1P40Gd0fCYMgTYZ1FQyo+FJCx/2RLNiP+ywv3OsrjG5yTvX2IVsx/iegQrcX/
	nf2BWECWw9lvOhqhhOedg/eUjeoJrHLn4LBijgvQKKXh1eH2whE5qf8cx0rLwm6MAzTKZjxWRoq
	EmZnPlyT3oz/0B1/tdd49sKrnvhqJ0sOM7ln3VpKFQznQK3qB+6AIIWCkO3BqTP1YnfCy2Phydv
	ry6GbOgkFaQoVNhEHMTBRrXzr+/DrNYXA+XMdTZSUtT93SN9g1MsauA0zVbcfJi6ByHL5VnTTdG
	vbyUISbFUkgc8c1qtbY9uQK48Dc/nFV8veDYCsEgHgJzjK3Oafn2bXuG3Q8qAI9WJDv2C+hv9Jy
	0up+3s2daJ/9F+NRxD9a0o0KAuaf1tCsd5Mc=
X-Received: by 2002:a05:690c:4:b0:8ab:2f89:32e0 with SMTP id
 00721157ae682-8b3a81199f4mr13471067b3.57.1794397572467; Wed, 11 Nov 2026
 03:46:12 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 05:46:11 -0600
In-Reply-To: <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Wed, 11 Nov 2026 05:46:11 -0600
X-Gm-Features: AclHuK8VD5zdhvsTYmRtyJzXAXUoripQo7x0P6Es21hMYyxTa4lv3D3kijFwJg8
Message-ID: <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nutty Liu <nutty.liu@hotmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anup,

On 11/5/26 12:15 AM, Anup Patel wrote:
> From: Anup Patel <apatel@ventanamicro.com>
>
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
>
> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> as CPPC register and the RISC-V SBI specification allows arbitrary
> CSR number as PMU hardware counter. This means ACPI CPPC driver and
> RISC-V PMU driver no longer need to do sanity checks on CSR number
> which are now done by the common csr_read_num() and csr_write_num()
> functions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>   arch/riscv/include/asm/csr.h |   3 +
>   arch/riscv/kernel/Makefile   |   1 +
>   arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>   drivers/acpi/riscv/cppc.c    |  17 ++--
>   drivers/perf/riscv_pmu.c     |  54 ++----------
>   5 files changed, 184 insertions(+), 56 deletions(-)
>   create mode 100644 arch/riscv/kernel/csr.c
>
> [...]
> +	switch (csr_num) {
> +	switchcase_csr_read_32(CSR_CYCLE);
> +	switchcase_csr_read_32(CSR_CYCLEH);

Could we guard the CYCLEH cases with CONFIG_32BIT? They're RV32-only.

> [...]

Thanks,
Zhanpeng

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731106;
	b=Jqikkd4MVweGMbLblPWDxuLm/YdzBSyr8K5PqXVAdiNTFb1QaJ4V8uv4w5E2R8NETJaH
	 FA0wPBrQCECfPd/ii49ONM8uJ7B4PmXDaqEDp9qGBowY5dn5qX+YOU0i6ujCwclniY+yC
	 nUKaV9Z6KSn7adyb0/krICV0QTCNHWnG545k6Debaxf8Ih8IOlh7GZ2zIZ5cNHhmLXHns
	 zu4k3Te0biCQ1sGk0sPqx4KSOjSlXrkjC08WJnjih3iu46JYeV3QKX+f4NsSIS76fbNmp
	 HEt6K021+KJxhLI1MFjP5gYzOkza+chc7JcdQuItfDyDABsKPCf/bEFgtNsQQbxuNlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
	b=zi2u619RoLgRKFO7vg/xuYf6f/DpRkcIG0ULzK0sLsd97hvRDvXMJlUeWOvzOQjGphC2
	 RbEBAOp4TZhd4uV64NqjZp9tHKVxREHX4egbYXOUEtCP+u8xwQ1QgIMKp0gYshS6KOzoU
	 mh7qZ1P3Yj0mkwH4VoM/Y9obRuJJilKumYojkcguVwalnjaVb1WpnszTRsygON+P6d0gP
	 JVKoA96ImSACTmjI3HZ9QEBhk25duDhsHqvwh7rRLUD6v39GF/KaQn7dqz9TLxC/oH98N
	 d3pWWsu4raVOMoUIqFNeYsBe84mwOmcl14awf0oLta6t/1GgBEHrxtUXWx78vb7P8Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IR9SQMXY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5AB606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IR9SQMXY
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2740605f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794731105; cv=none;
        d=google.com; s=arc-20260327;
        b=WMkxElkiJAIoKmSk2UMraGZYkFJjHQRqyHAivn5wkjCgfNiIAFtKLBzepP8E/DiBge
         B1yvnGUdvW0x8JbXL1ckA2ijqN7G9EDx3m+tOfJZaGv6KAPEvgAqujWZ7xvq2drSR0fz
         6HBHZbIahbCjcWi7Id5VMiz8xrU1c9vODlzdZL6VJGCytAS7qkjllIx97zWXItnKNiry
         4e8JgWpu5dk6q8diVgWv52JsSVSXBhUAQMKNqmBVBm4zsoLYtfNZyOYQiFbioutuSCTS
         U4BaH8QL8QhxWXfzJcQV9YfYcYif9nBmsa21AWPwV23PZEWCmCUywg8SlX1Xj62C3EUa
         x+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        fh=G5Tr4sgHsuXhYlPIoZt2TY3ZHq7KOLUBunF5NeaC7Sk=;
        b=TKOmb4gnnjdEafumjysTcbL6PtEB/N+im5eqojka0O/wlNjipE1aksFWQCb3K5aXfs
         YkheMhqaPpz/5a8HLKd9MTZVJ0OvRFD/7RUbDwIt+xRL43YZ6iFrdM3+XgdAR4MAUtTi
         PjUFvVZUbb+zY4r/kyBdQ6kLIa5/Mpkec61D3kZsTYdKLTFlGS4xKbBS559Y6zBIDjY+
         8UrKbZFfYUB4CaD6Lt31AQhQCMW1e8u1zLtqeJ2XJYCIjgyH2/VxdR6F/fygn+H2VxSk
         Fbp0dljeR2OmP0biA4yUKYkvSlT0ucw6f2HWLApzPZ/FTcMsmNnUXA+K5e4p3/16c3PP
         tELg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794731105; x=1795335905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        b=IR9SQMXYvTknKh3oH4uGk+tMS8HRfie+6WGkmtvhQ58SaddqigIaRPAfgFPWZgwckj
         6mVw2khpAdNDCIwkrtwzW/8FuRrbL0Ox15exAuIB/LAHgHO0+JumrvxkzSXMX+245ZZ1
         hJhwnWSaw0mDuZPdig46uu87mMu2B8DW3tlFZ1kqB7B1hFS8SJbjh7K9YDbUWF2OkU+X
         X6r+gDMyILYji1zI04QLzoylvklkjdabLw53EqXEyL/koUeylsD34U47rY1IOl6LWe2d
         cBBnXTnlgrNd7wYcr4EsWuR9/FuGmdMoNY0u6QUKFsjv8OhKGuCEbiPskfVjf1KpUVos
         qekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731105; x=1795335905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Px0VIJUlGzeZ9LUedxi9YmXr5Pv4gH8RZcOXqIrVUQ=;
        b=V8F5efWn4RovvWumFzI74omX1j6U5fBupLSdnBsEkpmB0whW0Uqg3UK+evH3C2E5mh
         ldecNrK1Mx8cKImJQre8u1wQbVrZn4dfs9yBi9cn6WVMhE/zXcbwqisRHnWk0T3mXC6g
         epH0T5ANz3xb1fkqTiQUFjRt8/BDKVKnVxChckhNCT1miT9oMu0pIhWVDJOo7C/RWGzK
         I6s3LuS2n9Sm1RZYNgi5y7ETbDTkPzyOiOXAZLuDZ17j/73X6OPPkCaNZ+72cjd2zmiM
         vG6zNrX2eW32MQMuXw2PjpLRcuAOXiEzRuoazlt1mcPrC07mdSJW9uCfK/n3gOxRLa73
         Z0ng==
X-Forwarded-Encrypted: i=1; AL+hErEwt8/B5s4+v+qD/jdJaCNXEBnEO62P+sXAMW7d+WNn1iA9K7pEZd58lybsvgVrS2/+0y/YG3wKjXUevwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IsGNFNy2TA4pa/1u66OF+1aM5iHSpI5xT+GreOZEsnqmZn2Z0
	JV+dU90jRAoiOnXgg4HaQ3kLfQCdP7JC1mgMNcElEzLF30uxdHGkGYW4fG2mcdFo8AgJOIrOjbf
	1Kq3zdJOhilQV5hpeBjHnF6rBBLqs9d3TtXBFpNcxbA==
X-Gm-Gg: AYBFou3ONktq7NR3Mq+2e2ZON74KECDWDtC7fEgfRy/CFD2My8x1GnHsJXFdms0nPEk
	0DBGjYVe+GtikK2Acpu6nOufgNXiq9kDPt89BCXNvEEsdEILdv+fesnOg8jy/wCKnUufFnepySL
	NrOv1kEtuUgDk8vV+WAXzYydk/XddCjEb+AN0tGWYbeAeWU8uH2jV3hWTuggHF/jwoQps3Al8bK
	wdNeDBTk/PXKxd5GIcbMCbZHhDGCP9FMNLHJVX9N96LWoHWXufoouhR5XufV2GybknS4DxFpujW
	XmCuxejkwAf4j6pey2RyrjswEy++azzR/btCa+1LOR+Mp3f75ANBggScvc9lh75j8qqLM4FEImD
	4MQcAtLRRAVXe+02poe0oIdchLU1TswEWgWFPys5fRnFSmDQfaWrP7Z0x+BnwMnGBtB3SGmcKtT
	whN9cHZz6FlAmUWJfUlywVyvZA1dbw0oAIl2pIyfam1qBo8Tk2EFhK
X-Received: by 2002:a05:6000:2012:b0:49c:9e8a:31a9 with SMTP id
 ffacd0b85a97d-49c9e8a3296mr14948320f8f.57.1794731104324; Sun, 15 Nov 2026
 00:25:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com>
 <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
In-Reply-To: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Nov 2026 13:54:53 +0530
X-Gm-Features: AclHuK-mOIV-pplZYU_DZWul_INV3rWFbYVSrvzZgzVjhgWpo6FzAMokpkZQVIs
Message-ID: <CAAhSdy0ec6MdgrXWAe_AZT2aHEZeL-muj1EpadjCfseZVBy3qQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:45=E2=80=AFPM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi Anup,
>
> On 11/5/26 12:15 AM, Anup Patel wrote:
> > From: Anup Patel <apatel@ventanamicro.com>
> >
> > In RISC-V, there is no CSR read/write instruction which takes CSR
> > number via register so add common csr_read_num() and csr_write_num()
> > functions which allow accessing certain CSRs by passing CSR number
> > as parameter. These common functions will be first used by the
> > ACPI CPPC driver and RISC-V PMU driver.
> >
> > Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> > as CPPC register and the RISC-V SBI specification allows arbitrary
> > CSR number as PMU hardware counter. This means ACPI CPPC driver and
> > RISC-V PMU driver no longer need to do sanity checks on CSR number
> > which are now done by the common csr_read_num() and csr_write_num()
> > functions.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> > ---
> >   arch/riscv/include/asm/csr.h |   3 +
> >   arch/riscv/kernel/Makefile   |   1 +
> >   arch/riscv/kernel/csr.c      | 165 ++++++++++++++++++++++++++++++++++=
+
> >   drivers/acpi/riscv/cppc.c    |  17 ++--
> >   drivers/perf/riscv_pmu.c     |  54 ++----------
> >   5 files changed, 184 insertions(+), 56 deletions(-)
> >   create mode 100644 arch/riscv/kernel/csr.c
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.=
h
> > index 621f84d1898f..ebd82043430b 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> >
> > [...]
> >   /*
> >    * Read the CSR of a corresponding counter.
> >    */
> >   unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
> >   {
> > -     if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
> > -        (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {
>
>
> Could we keep the existing CSR range check in riscv_pmu_ctr_read_csr()
> when switching it to csr_read_num()?
>
> The SBI PMU driver still assumes the architectural counter layout. For
> example, if SBI assigns an event to a custom counter at CSR 0x800,
> pmu_sbi_csr_index() truncates 0x800 - CSR_CYCLE to zero. The perf mmap
> page then advertises index 1, so userspace reads cycle while the kernel
> reads 0x800. The same index is used to set and clear scounteren.
>
> Non-snapshot overflow handling and RV32 high-half reads also assume the
> architectural layout. Could we keep the PMU conversion
> behavior-preserving and handle custom counters separately?
>

Okay, I will keep the CSR range check in riscv_pmu_ctr_read_csr().

Regards,
Anup

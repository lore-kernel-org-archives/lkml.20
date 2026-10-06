Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11673DBD51
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280027; cv=none; b=tMOuMY95e/QnCF3ffbfy0bUXpJGKmHlvJw6uggn1izfoohpxPN3utUva5SFSIbozGhtk0mDImEgaT1FvnCNf2j/ht0ME14spKM//o/40lpSn1qo5HxYco/avrW9c20YLRhhaNY+DkbQI5UB06vbH539R2bWeLBR/8Tjk4MJp3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280027; c=relaxed/simple;
	bh=jj7ENqJl3eOJQUB0Meci3ZON0On/VWotoLwcNBUofxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KThlq7hId5WGcjOI8DAyyOdPib3pjFuwUbbP81ayCpXrXegcZvu6StP5UouLBXLinESyfW65NLjoyPTOUuwxiA3kKyrY8THX1yaEjQTzE1B1lspGNvZrmU9hYV6cziwHRNYIUj2bMN8yLN2KzPQUN4gr2ZJWUvtnjoTsFCvfs90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lx31mzJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lx31mzJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620EA1F000FF;
	Tue,  6 Oct 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280026;
	bh=0zAqroHmp3QqjC49Dk9GufE8ynDmNgEV29xm7mZvD1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Lx31mzJ1L295+8YX902P+EoHasPWV38wUjMFpniEL+RVoKFNcH5BEkhSoRndMtb1D
	 YoWji/5v+GF9uR6JEu3eGwDi9zVyt1gwoMTyc8md/ONsTEF0JTEom/uhQBJWwP3hUA
	 vn0q8egogPSVO70eXbyugHujTkQD46PKrpBKMkbc4Y5Fi+AV4NyhOO2mhzTpc3z+Ko
	 QKtfyyLrly8u05iGuAB7f6Z8LzjR5l+p3spnfWyr63MD5sSHM2K9ECuLn95oNytbMd
	 C35ZLThulM5dinKgMVOK/VKpHrcaGeFPshHcM7E0+DoJvhUMc7Xlyjuox2QWS0UVvc
	 p8HnxLtcehHKQ==
Date: Tue, 6 Oct 2026 03:47:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Anup Patel <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
In-Reply-To: <20250619190315.2603194-2-rkrcmar@ventanamicro.com>
Message-ID: <d481749b-2c83-a7f8-9c25-dd6e78a77c9a@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-2-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1922366945-1791280026=:2885293"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1922366945-1791280026=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Jun 2025, Radim Krčmář wrote:

> The SBI ecall interface has 0~6 arguments in a0~a5, and undefined
> arguments are not reserved, so we don't have to zero the registers.
> 
> The current sbi_ecall forces programmers to pad the argument count,
> which makes it hard to distinguish what is a value 0, and what is the
> padding, because 0 was traditionally used for padding as well.
> 
> Turn sbi_ecall into a variadic macro that accepts 2~8 arguments, and
> where only the specified arguments get passed to the ecall instruction.
> 
> The register a1 is zeroed if unused, to prevent unnecessary leaks of
> kernel register state from the tracepoints.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>

Thanks, queued for v7.4.


- Paul
--8323329-1922366945-1791280026=:2885293--

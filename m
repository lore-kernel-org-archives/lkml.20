Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D63AD503
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280518; cv=none; b=TWL/EG7yMJzroM2uEOCmKi7xIZtR7mpgIhCoOeOHq0yKrxyKK7Z2RXUq1zNTu/xOydidY9mE37/UjCmaMkrgWVrpgybUavFOvC60e3ogQDN3wVtk7hL+3NsdALMNkQf+i1M7LOVp5mZj7xjRoqPaQBAPG7khePxOS7+AGcCghps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280518; c=relaxed/simple;
	bh=r+zeNEuUcmG49zQlT7QFsoefRziSDgfJwX1F1S77F+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nzA5vx9fmxMG6rWVRJeCrVwdlsN1RLkYOH4w6+ODsxr0gDvVk3yApGJt/K8PWJ1VKv2RMDjEPvj2B479IvtGr1t2YOJA/+0wh5rvjaE3EzTyDyw5eJZv1ephBmG63Hwo3ZwFohjhrGxmp6JWtOp3nchTuMu6HRIVdGS4O2Gevbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUy/9/vj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUy/9/vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CC51F000FF;
	Tue,  6 Oct 2026 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280517;
	bh=U/UJLBwKjfbb2sgsrgLx15T9FSqQIhajyoEePoI+pZU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=AUy/9/vjS2XtlXuvtdJPZOLX1BQfwjtP6LdD6yzKeNeavB+39why0E0QkxeedqmaO
	 IqOi6NCngJDi0FTBI646o5kagYURXHMW3eHaBWpdSeitTbJ8BZirC6zzjo8RJc0qXG
	 mYM2bE++mwfsS69YalOcw4yUhyvMblae1RWcxEyPIyifcqB2oguPDhuf/kXHRLe2I9
	 OYwlm448XhlbqTs8kwnpvxEznTXriUUFch2KZsQIzoNwzIM837/WlMEtoTrxdXT4fe
	 9CZnhoc3QKtiKAURXeCGnXrEViuo0/o4yUWNtaa+xp/vjvB84K0WmNa1Pi6ArQdbqG
	 uG6Sa/w1qwRdg==
Date: Tue, 6 Oct 2026 03:55:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-2?Q?Radim_Kr=E8m=E1=F8?= <rkrcmar@ventanamicro.com>, 
    rkrcmar@qti.qualcomm.com
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Anup Patel <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
In-Reply-To: <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
Message-ID: <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1636448891-1791280516=:2885293"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1636448891-1791280516=:2885293
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 19 Jun 2025, Radim Krčmář wrote:

> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> pass the actual numbers of arguments for each SBI function.
> 
> The remaining trailing 0 are intentional as they represent an argument.
> 
> SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
> but allow it by passing 0 is the reserved register.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>

Thanks, queued for v7.4.  

For everyone, not just Radim - probably it's worth looking through the 
codebase to convert any SBI ecalls that were added over the past year that 
weren't covered by this patch (e.g., the MPXY drivers) and to doublecheck 
the overall argument counts.


- Paul
--8323329-1636448891-1791280516=:2885293--

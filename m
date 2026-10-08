Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB806547043
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791427625; cv=none; b=u102siGYhvMGMY6yOIyXEN118m1U109MKDXvi6GucyxeP5vzaFWVD56ibdYiXSyHrQNJbvl0phzd++OEEu8CPYYsfg6X4bcy/7viG3FnQ7bRX0F8k7NrvcOC7/hcL/ejGA1RGFLhOMIqXpir0DLBcMnnImG+3du6W+mP/SGG7Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791427625; c=relaxed/simple;
	bh=kWRAoSjxswTQp0Xg8r84HER1xoJqelMLbAiidr6dxUY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GL3Xk2q3FTZorCnkY8vynUzhylSldD1leYdDc2kg3leFu2XbuOEbao3C7PLZfzumD156g6Ny1YomWQQeBzSfvXkFpdtRTtBPpKiXtPEPlr5/W9UK+Hs3P4d7zxdiphhCL44nmnE9DdjxB5k4t2w8hkvMX67zTVmMJ7D2x8QSTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1wEbk8r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1wEbk8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE9C1F00893;
	Thu,  8 Oct 2026 02:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427623;
	bh=F0DK6+IHfMR+aBaJ6CuyYkB2ySvo8uPa6sPYs+zV3eM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=W1wEbk8rfOAr2uT0E+PKOceknUXswVzLJ4yMNcjQ1jNl8yk9DfbaHqGx6syOOPcA/
	 rWEDPNWLPDujXP4SDZ9DMTAzYwDK5E9TcoI2ajf+jC4rPZx1yqg85IdLkRjtk7c0yf
	 Bq/z7K99qcH2j2RKpt7LeJk6lZFYO3LUBJprCBWE6pN6F3/67wi0boP+VDU+oJdDI7
	 H5VzU9zwk0d3hVh5aW7nq5icgpZLxaXDXEsFJjE6FvQEqRRTfNvtQsoYe6FJb3v9K3
	 c00Tfy8hLaoh2Wn5n52noeRVsTBb+1J4q6SVYVN/WVwQj0eBSVpcCk4KIl7fiwk/tp
	 VdHDYzb6BZexw==
Date: Wed, 7 Oct 2026 20:46:57 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
cc: Paul Walmsley <pjw@kernel.org>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atishp@rivosinc.com>, 
    "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
    David Laight <david.laight.linux@gmail.com>, 
    linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
In-Reply-To: <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
Message-ID: <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com> <20250619190315.2603194-3-rkrcmar@ventanamicro.com> <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org> <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-837776277-1791427623=:3541018"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-837776277-1791427623=:3541018
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Oct 2026, Radim Krcmar wrote:

> 2026-10-06T03:55:12-06:00, Paul Walmsley <pjw@kernel.org>:
> > On Thu, 19 Jun 2025, Radim Krčmář wrote:
> >
> >> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> >> pass the actual numbers of arguments for each SBI function.
> >> 
> >> The remaining trailing 0 are intentional as they represent an argument.
> >> 
> >> SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
> >> but allow it by passing 0 is the reserved register.
> >> 
> >> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> >
> > Thanks, queued for v7.4.  
> >
> > For everyone, not just Radim - probably it's worth looking through the 
> > codebase to convert any SBI ecalls that were added over the past year that 
> > weren't covered by this patch (e.g., the MPXY drivers) and to doublecheck 
> > the overall argument counts.
> 
> I started working on a followup and noticed a bug.
> 
> Please squash the following change or just drop the second patch, since
> we may be touching the same lines again soon, sorry about that.

Thanks, squashed in.


- Paul
--8323329-837776277-1791427623=:3541018--

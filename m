Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731254;
	b=Ch5b+c7rnjLHnep9Ypa5DN/jgnWDy5AONeqnueXS1cnuGSdIQXgY+nR5Ae0qaByslFfc
	 6rLFXRe9C6VqVCn5M+kLIYkGe+M5CN1C/fSw9/J/qYgioHHqRN2eHdNNk0KJjDctk3lIu
	 xvsXR27C0QxBO6t+SiCkbc9RN/urECrnWFaN1wtAl4iF1NDGQNUpdds5kSehBlZzcCds3
	 9wYt3GnEN+Tqcq2SG8P+XnoR0nrLGsRbz5XY8G7TzjKeQe9IdxDdaIssSko2pqxEVB1c5
	 CPkN8IMMsijkMqebvkoD25+bEvO+dN6HSLeDxlfs2vakGao+1tfKUe1WphL6tK9xXhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
	b=ejitGHOrM4k4KoFs5ITeZ7ABZGbaQfrzIYBM0CxqsZ0ZtMy7SVy1W8FAmm/YAq0GYrdy
	 BGLVf69ceiXp8zoxXiaGffZ+2GwzTWta01ZvF2tvFbLbvpCrqX6jjHkjy49aiubZQTe0o
	 XWV8gtTH1DWIKJgu1sbGWAomsuBX7Y6oESW3PVtq5hXoZdaEY3bdK4FM/JZHXcpGpOeWW
	 1uPOvfgyBnDEepdF6HUIZalbPAFEVALJ5uWI4WuO3FdtIKwgCMe7SFAhhcx+Rm7PdOt2/
	 OdzDFwdHEJ/Jib1er/lLm2zisrpZO72lNGwomcJs0pnnHiL4IR/8W9VCOCMfGOz8AEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=FF9b9NOG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6B9606A893
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6B9606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=FF9b9NOG
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so1481015e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794731251; cv=none;
        d=google.com; s=arc-20260327;
        b=n7NDrVhGQKr0CVUaAqIV0ELr2ixET/AxevYBvt0TZvu1w1orNNFQT4C4NzW6vsKoMW
         PnXOXjwLFyK/96EFvtCeifJzxk/E+K+m/B59e7wMyxUHLQHCQiGG1T/Ycddkk6v7gsUK
         msq++6PCvITgJbRMuvSqMV6MRiAdKouKoDwqiKQFzagERZ6s/e/R2dtvlpB3RTLqBojU
         LAOu5FvPo0zhrgNvmcKH55cykxJTKz17EyFQpYXZ6hmCDW9LbaMBpeLA8XCe+CERVFIy
         EmZgyM3wVEiGW6oaDHVOITRQRREWNk1EiLHgZPVcZKJNAyYe4vF4rr525zF3X3qOFJq2
         zRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        fh=bfEfoLLtSWoRdwQsYv2lPFJoQ8uQX4sxpfQROBP88rE=;
        b=qmhHkse9oEO8q8hQ9E7nOWpGeO7pU2O4h9YFthe1oDGWDnKXKdZtglPFnG7R3qVn+q
         CJis7rAxyMAd2p/mtSgyVc2cBCe1HKMnIbZhYiEgR65IX3Vsu3qSVQgmSroaaaKBLioC
         1WC68b6A8/ffqKJtb7HjI9jHWnl24JpqJ9rdxdZoYWTeqN6Exj3V8jTEhm/CuKJNjrbp
         CAVFC8LOjoQ/ujrw3fNqqiddFroyic2Dl0hGR0XNOi/fEAbW5pjMR76N2NyMx7L9Toa+
         eGT52XQgG1HPXJplwh2Nx3Ds4Hmg6hNjGk4/J35yM6uRr1eY7rERZjMeR0OPJUmeUwj5
         wEvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794731251; x=1795336051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        b=FF9b9NOGyETaLASOYqSncg3Io0UaOS7xKD9piIRGEkDKWbkJQB4K0hCBB9eos32pb/
         Cy6o8nzSUMy9Z+kV+XFdhzfLtgs0HI47ArmYnnezpjdxHCIz9IFUP0K2cHJWWTxsD/sz
         1oKyBVd3TJCOnY32lZCU4TiFi31y+IzZ/q/aazzhUd27DJd+kwa7jRK9+MK8RjvucDDN
         IdDLCYgtiNYaiHOUWb7ylh11Bs7CAUn65L1uMtSVEbjTL6b905O7flTXR5nHqD2OuONs
         dBoAvQs4YwGWz62bsZzFoez3ERifZGRfEknwrEzcYi9UNYi7kXux+7H6nmkR9e8QJusK
         9ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731251; x=1795336051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        b=JWKA/Uw20mybsWydhS05TAAVb0SXNlB3OnmHLGnSmzG4InA6gr3RksFzIVd0ccrtKi
         cmO2kZdzimF4mRo0y4nAlsG8REExnVRqsYvrDNckivF2J3L4rsXvWmg/6zpvBhGXWPCy
         4LMcfr7+sHjGH20G5krlfZAxUvzAM6gwDsVRru872ZVohyuF8x3S0RGmhy4QeXTt7R3j
         dwhBdsyybtKrxP1E513S6o7KxtuwhvcO1IHarUkQhdhA0NwaFRRe1nTTvYjF7GnIj9kw
         ppVWcN7C0pIY9vL8SAqQftC5pv5K9ywQQOQWIqQ9UQjgOSyaYrRXds8TkwBXYwfJSbuZ
         aQXw==
X-Forwarded-Encrypted: i=1; AL+hErHS4k1KG1Fy5VeB5qoo5P9g4fYFREbh/PZeJgdx2titfWdskTwNIZWb4Q2Tq5F69AeXnjCi0D6NDLO5mY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6naMMhKJUsBjA4iwu0So5C1+VWnQL/VR5Z5MX1Hezq5FvMW3
	RVvwahSbWg8rSqtrqzn6wqNAlL4X7pA1Go6M74XzGCvlUsBnaNb01M+w3MSFhH7vUQsazsG+aWS
	JaqFH/wwYIP59RcM98ICfI/IVHuI4ZXgqLSnpdSfg2g==
X-Gm-Gg: AYBFou1mi7JxzynQ5CNwIPZpFzgd53uvcRe0nWk+yQI3nS+nMDLgHo+1qu42LBokhis
	dyr1eBcJvXDkgQSanPuhqadJI+FlJ90Na3l15Qja5Oqnh9rhkUo+QJh0sGMjLP0DjXXheeCsy/4
	xRHSm7igD6PXzyi8/FQE0rzqHCarNDKOpKgAPSSEDTGUdUu8A/HM6iQj1Q2l8r4nx0WcaRkzDDX
	bAPOp3j8k4hMukGyRZumbev4lPos8pqSRQ4Eu5Jxz1bJXZS8FU+ivsEyBzG2jgARU2dHkMsfTM2
	QE5rGA6fu5nAEnYZ6X+/bPERrGtOOWm/a2VUiNpdYL57w34rlBt2wJq7s2jb30pKVff330pNCsu
	Od0QRmCC2IVbCO2FTC86b9XW2p/+BVEq4FziijvrFgUecNzTXP1V384t4rJSE7OecUuhuo8W1Mh
	QUoWtj9CRNAoHjAkiNers+yzBC6/w9el6PNpnefDU1dcm+w4LLVGig
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id
 5b1f17b1804b1-4bb55a66467mr149044985e9.25.1794731250698; Sun, 15 Nov 2026
 00:27:30 -0800 (PST)
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
 <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
In-Reply-To: <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Nov 2026 13:57:19 +0530
X-Gm-Features: AclHuK_i7RtARhSnEV4JaRu_cVL19f5fuKwJ5a_U31KgZmQUYeTFRxuQRxn9Ppk
Message-ID: <CAAhSdy0+bdkTutXEL-0FKa7meg51wEsJxB9M=kuNLUNEaCVaRA@mail.gmail.com>
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
	Andrew Jones <ajones@ventanamicro.com>, Nutty Liu <nutty.liu@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:16=E2=80=AFPM Zhanpeng Zhang
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
> > [...]
> > +     switch (csr_num) {
> > +     switchcase_csr_read_32(CSR_CYCLE);
> > +     switchcase_csr_read_32(CSR_CYCLEH);
>
> Could we guard the CYCLEH cases with CONFIG_32BIT? They're RV32-only.

Okay, I will add #if for CONFIG_32BIT.

Regards,
Anup

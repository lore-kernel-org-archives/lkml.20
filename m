Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705816;
	b=WKOHmxoIMkySEq8BAZoJuLzD+E+nUtYEA/gbDLLE90MNBrVXKNYrDUf7wJuNooj5U+jv
	 SqllN9sYu2Nkuzv65H83yBvHN8E37Ethso87XtXUVzvYR1wubfq319NVPTe42Woe/gz9u
	 nrRmlOhc8rKC3NThiivpOhpfU3MiSp2XSNxbSkXgJN1a/qnvbeO44PkfiPkg2nbDDzrQB
	 OO4vq39sAIo3nsxtMZ3E9Ri0oN6emW2W8LJiElgvAggMpeW5JvtaKRGnh6tN4bGOujGZx
	 vJczukWOv+/KICxZS3NK8FtsChUVn/J93eGQT8FvPdw418ErhKYr8sVWqVR0mNbaMvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705816;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=X9L+wVjQDTDhhAWidv7mqpcqBF43Sq2/aOI6n5JGJ/s=;
	b=JgfcN1pBlWbvcPIyTEqx23k7Du9zy7YXnQCZDaPL4cC7/PaNTEemas/f4SanxymNCZZo
	 5VGTUOxY3iqRDUCOnLzQii3YjqCSvZvcHd0rlFGJjIIji+QzrkrR5ZcDxVDMC1abTpu+S
	 BQFyFqupP7/BfAVD54Bj7fm+rS7nW00Yscc4mqHlrKpSCGjvrk43sleN+UdxjjsRH/o2s
	 +NjWCeRDOi9jrPrOmY/HrJTKizPfLSqsV3e0yj0eld8NDrTD7tdHeSjXSKu9OMC2x1acW
	 8D8JDH2OKOVpfqFe1YiM78r5ciRcJv3RwQzKyL419wjDFtfnQhm1+KFDiZtJI8OuQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJtkrHOn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0A606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJtkrHOn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643B61F01825;
	Thu, 22 Oct 2026 21:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705816;
	bh=X9L+wVjQDTDhhAWidv7mqpcqBF43Sq2/aOI6n5JGJ/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CJtkrHOnJLZM4C3pIijIeAl71ydG+iTdWvKdKIle1t9lvMr1fjYj85OlCrdatq/w+
	 zrK8IcgWQ6dzrmVpCN1JV3G+gbtNZ4IgVyLQyMJVgZQOMT17bsYK999cIrIP9i3tv+
	 bhVIZxUNpXVsHtqM35jjEOtbwQzRUhwkFz3GFZ2KotYSzQ3CR9wV59Vgi6wDlMi7A+
	 hvNdpu4BnYhi810y73kdX/XxCe+Azcu6LYunBRXkeNB/eU7R0VQa1h3Dl/dRxIqWr6
	 uCt/vjqnT95HosAKkIvPwCtnYEpkzOUkCn+1hFeTdTKvvvkSETjL+JH63Omm6Aaids
	 S9GHjq4gAgqPg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, mark.rutland@arm.com, Sudeep Holla
 <sudeep.holla@kernel.org>, lpieralisi@kernel.org, radu@rendec.net,
 vsethi@nvidia.com, sdonthineni@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
In-Reply-To: <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
 <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
Date: Thu, 22 Oct 2026 23:50:12 +0200
Message-ID: <877bj91k2z.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 21 2026 at 15:49, Sudeep Holla wrote:

> On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
>> On Tue, 20 Oct 2026 23:28:15 +0100,
>> Julian Braha <julianbraha@gmail.com> wrote:
>> > 
>> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
>> > dependency, ARM_PSCI_FW, is met.
>> > 
>> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
>> > select conditional on arm64.
>> >
>> > ---
>> > Julian Braha (2):
>> >   firmware: smccc: provide stubs when discovery is disabled
>> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
>> > 
>> >  drivers/irqchip/Kconfig   | 2 +-
>> >  include/linux/arm-smccc.h | 7 +++++++
>> >  2 files changed, 8 insertions(+), 1 deletion(-)
>> 
>> This probably needs to go via Sudeep's tree.
>> 
>
> Sure will queue it soon and send it as fixes at -rc1 or later.

Please change the subsystem prefix to "irqchip/gic-v3:" then.

Acked-by: Thomas Gleixner <tglx@kernel.org>

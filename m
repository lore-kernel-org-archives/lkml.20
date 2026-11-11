Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355764;
	b=ASQoEnXsSElvFWzZUfXB7Dhx7Fl0YaNX6LPEL5agMmveXdBPCoQqWLQuDpYnkRaeyxBr
	 2TJPfTeYg0IdNMSTMisTzy1Tbw86LFR6/6PMTQEL72zgBWZItsBoC7vyJgVE/bJ2dftBV
	 wVrBxHfG2Yl5NONof6UrZzOX6hZytkflR9V9YOoU22b/Y0411mnhddHX8ZDqxlKtP8zKx
	 WkaHUpbgNuQdDldItYiYNmtEBn4UobOEJ0Vj4SViNeiXTL4ZxTdJbqcoy7zU5Zmp+70gQ
	 TlfB/Xs87x9Uf5LTZo47re8d14O4BgHD3Ulb4f6ScZczzyLvaBy9FEgqN8Q7Dm4yH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355764;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=bA/vc0IAQMibteH6oL/6f45Pa4KgnYo//AbMRDRKPrs=;
	b=iUvFZKaq1ghijGZAB+PLekLdPWaGRHqmzvDQ7ORwdklR6LLJ0GH0BjtxBbRePWavzYb1
	 AZOs9dlReJv1+zXft3gPVe0RWJ2pK3yHtQOlj/8JBT0qSNj3OgkgAIx/FwtAFpx0oNS2F
	 79MfAyzTocyBMQMYIx3R6bP7qyfQxaSNqEFym+u99KHUEuKgX/YLR5FIHhVYUy9AQtqgx
	 AM7dqAcgtGxEQT6/Jm6MynlFeGF/7+EDu4g78l17qMvyAqAuOx0BIo5/MtOOZPXXOobhf
	 N/C9Z4xzh0WuuicnH4OubsSjkKmr1PeiNLm8SHJD55zu4i9oR4wgdvAWZICrZw8SKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YA9OSEpy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6399606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YA9OSEpy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7439C1F0089F;
	Wed, 11 Nov 2026 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355764;
	bh=bA/vc0IAQMibteH6oL/6f45Pa4KgnYo//AbMRDRKPrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YA9OSEpy11u4570/HDYCBBvcWN1tPK6cGRQd7g8cRYGfUpimGFuexldvFA9QPKoT7
	 JHv9tI6MZnwPdMxJ2Nonmvm/UzgNgwHxovM+MN1NoDSoub8PZ31hUVbivHk5S3LBfK
	 faDmyzsthcMIC2pYDoX1l70zJyG0//8PoIqJ9wgWpfAdSgyAr4OMvFF3OMzUYURXNn
	 PJbJDGFggyzKZj0wMSli+EdOva5ToeM/5pF2U/gmnSCpL+E8NSyrEiquPGmp0E5+V8
	 VFNco3vwdOldHlh8ChcDHgNLl+SF1A0oKYQVFTeWzA5QjqjKJK8in+B/g6DW0+ij/5
	 xFNUI7Pu4XSnw==
From: Thomas Gleixner <tglx@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>, Anup Patel
 <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v2 2/2] irqchip/riscv-aplic: Apply pending affinity
 changes for level MSI sources
In-Reply-To: <20261110-aplic-affinity-fix-v2-2-6c143b8b4e8c@linux.dev>
References: <20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev>
 <20261110-aplic-affinity-fix-v2-2-6c143b8b4e8c@linux.dev>
Date: Wed, 11 Nov 2026 01:09:20 +0100
Message-ID: <87fqx8tej3.ffs@fw13>
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

On Tue, Nov 10 2026 at 12:06, Troy Mitchell wrote:

> IMSIC rejects an affinity change with -EBUSY while a previous vector
> move is still in flight, and the IRQ core then records the new mask as
> pending. The change is applied by irq_move_irq() in the IMSIC irq_ack
> callback, but level-triggered APLIC MSI interrupts are handled by
> handle_fasteoi_irq(), which never calls irq_ack.
>
> The pending change is therefore never applied. While it is pending,
> later affinity changes only update the pending mask, so the interrupt
> stays on its old CPU.
>
> Use handle_fasteoi_ack_irq() for level-triggered sources. It acks the
> interrupt before invoking the handler, so a pending affinity change is
> applied on the next interrupt, and the EOI retrigger then targets the
> new CPU.

Smart!

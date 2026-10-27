Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094824;
	b=UgZnEVPcNYDu2DSj2f+SVApKq3w9kFReS3i6eXUR5DAUPJm7pB1Pd0qdnaS4+78JgcEf
	 ZT1qlyyHsTErZq0xFUZDYHOIYNmDYB+9lmSUEeiwSVHBoa4FSdQcGZ+FybyaeEdospwhY
	 ffr0UnA391MXK3c3GP+ycKmPWA3i7sRm8Hxawp6yW9Mbt3LOMfv2dZi8KDwcHdplyK7pw
	 EjFltF97Onhvbxw3YiNeyDHFUGYB0ZE0IEQTuix/krvcu4sYSwJQKYonCW2V0wwZzdJTl
	 CkjU9j0/rd8GA25OPYq0HDtoTGVk75/jQjNeO/kvjgFvnrclVFDjgSmT6Frhq2ioEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094824;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pQP3RGsZ6q4FJJU63G9iJLPofO+P43yPBM9XujmsFZI=;
	b=jotBg8IVjWdyAXQpWtsJUlGSFzY5c3HHZs8wS/46lPIwEvs+pzjcOQUfccRNKOGO8ibs
	 B69+1VKee34A7OqUUI/OgoUrnlmRdZtGc8RZz6fvHZiHeGNPDfCwfy0+l4x6fbX0DjCYN
	 lPlRLQ/BZsivmVYs6K9uYyFR+fl9fSJnIsS0nzSPZGnlpsCCrpCARi2cjzeTGOIUZt/7R
	 ugz/JfCStmBhJKIcPnoaA5nAkkPt1g1RiKSSki0qoPJdKoXYL0DLH+YkZ0XSTZ5nm9l3x
	 RpX3f80neZ6T0mpj1AEQLbn+7IirX01SY4jhwTAsTYyQLG6fNBCI6iEMBaA2dJy1blg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0KXiC5i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E58606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0KXiC5i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F431F01825;
	Tue, 27 Oct 2026 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094823;
	bh=pQP3RGsZ6q4FJJU63G9iJLPofO+P43yPBM9XujmsFZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=e0KXiC5iYQ0EKDPy1Uc1sPPELI2hoRYu+8n4h+oU4t7G1GepZ+I8DRz+1tS/oV5tB
	 IgfMWPMBFFZc2uyChs2s6rmzB24HLFtD4WrFY5os4xujNYwI6ZlkXbdpRNQqlG7lUH
	 axn32wpo0H0Wko9rSCZNA6DETAZ9dMFH70ho4/oSCuDMuMF4LlyMhmFErMaVs6/uNq
	 ITT8/uAYx+XqrcwZX1sSYecUirON4n6EN80Oq7N2yje24OqTe62KmIYnTk1fIvDkt6
	 1y06HRrLu6aPiBWJl7B76FPTTQG0UTusolZNENrCJF3MWd3qgLJyhomwmz9YlD+3F6
	 CaIBwGUMhZ+uw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Bjorn Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Avi Weiss
 <thnkslprpt@gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Report successful hardware retrigger
In-Reply-To: <20261026122641.3292904-2-thnkslprpt@gmail.com>
References: <20261026122641.3292904-2-thnkslprpt@gmail.com>
Date: Tue, 27 Oct 2026 10:53:39 +0100
Message-ID: <87a4nz5v18.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Avi Weiss <thnkslprpt@gmail.com> writes:

> imsic_irq_retrigger() writes to the IMSIC MSI register to retrigger
> an interrupt, but returns 0. The IRQ core treats zero as failure and
> may schedule a software resend despite the hardware retrigger.
>
> Return 1 after the MSI write to report successful hardware
> retriggering and prevent the unnecessary software resend.
>
> Fixes: 027e125acdba ("irqchip/riscv-imsic: Add device MSI domain support =
for platform devices")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

Nice catch!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

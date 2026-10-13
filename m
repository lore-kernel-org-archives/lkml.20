Received: from mta0.migadu.com (out-191.mta0.migadu.com [91.218.175.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7A4CC600
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888655; cv=none; b=rgiR+WeSilVXTLVIQQDxJqEElN4eJeIUtyMaW4pzTfvdBE6WqPIdsASDV2b8OVxi7isgBhAF3ywvgKGMiou09Y9d9g0HO9U2cJX3jv3uxs+jJdJV692K8ic4kev7rO9fkYpDz9lhJgcGs0IMYoZ5RBwY/F9oi9Lkx+tJI1EPRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888655; c=relaxed/simple;
	bh=KVAzhVgNrvfGhJXuSFvrFDmK336xmECT5jayATxTm8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATvVMwX+f3HZeqRqudrrNvCHI5rDVW+rZPSUaP/Jtofz3RnMtjtc4+pS0Lr96w6dQWdi3zL4d4rG2iHDlCzTJTXMY87/A3FxgXTTcaF625mqTnT4cy4W5Zd3TWCAoW4lSglt1CMpkuzBiKrCAKz//+HKQw403R1DhTsObDPgxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LHAzlwgy; arc=none smtp.client-ip=91.218.175.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LHAzlwgy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KVAzhVgNrvfGhJXuSFvrFDmK336xmECT5jayATxTm8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791888651; v=1; x=1792493451;
 b=LHAzlwgyJ5FDlVfJwe+aioiD6IhC6YLPIpsvx6vhHIMrcEUf3NLpuvvNh1GIuqphwV5S2gUH
 z5V4qPmuwCNrAE71YbYuv+zkAFN2zv2E71DlsVFFbXWvIhHDPvx3kqrZyYaUIpwugWxWonAeIOm
 Stvhxo6OZmyd2eDZ2m13CmR4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c1e5bf9b047e6bf4;
	Tue, 13 Oct 2026 10:50:51 +0000
X-Mizu-Trace-ID: c1e5bf9b047e6bf4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba40832934so16922e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:50:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx10LhL16ERYCTMrR7J4xbizq4LPs7vLtUDeeEayAzS3YyncpfUUGH4O+5baeTTe3UPawA8ude+Nk3tTSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpWbiT5JSoP0+hriIV4iByfbcd+dhfvEvMl5O4A6g6Dm5VY8EU
	Z5USAfqsMLNDbFz8rIeYs1bZBXkzRLHkP/jMN/PxoQRyBWActB53xru0kKixeiBbjIJxpvs9bkO
	bavCLQX8J8HEY6BV4Z0jk1wtrzR3JvuizFMKnXvJY
X-Received: by 2002:a05:6512:1284:b0:5b8:c230:1241 with SMTP id
 2adb3069b0e04-5bcea5f77eamr307791e87.10.1791888646329; Tue, 13 Oct 2026
 03:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013081646.933312-1-fuad.tabba@linux.dev> <as3_NKT20MNdqaJR@kernel.org>
 <86wlrl2a2f.wl-maz@kernel.org>
In-Reply-To: <86wlrl2a2f.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 13 Oct 2026 11:50:09 +0100
X-Gmail-Original-Message-ID: <CA+EHjTztZpFrmuz9pK+01BsDxHnzpEwUMt6E3nUrgk4NNTsKYQ@mail.gmail.com>
X-Gm-Features: AclHuK_kCCq3-9Q2tIHYoGWtf99ZLB81HNWPaAdr5x53TtL1SwcCZkCDuzzJ-Oc
Message-ID: <CA+EHjTztZpFrmuz9pK+01BsDxHnzpEwUMt6E3nUrgk4NNTsKYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 13 Oct 2026 11:01:44 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Yeah, I now have a series that has the counting pause, your single
> vcpu pause (fixed to DTRT), and the LPI disabling fix. Patch #2 of
> this series can probably make use of the single-vcpu stunning.

I'll rebase the series on that once it's out, with patch 2 using the
single-vcpu stunning.

> As for the OUTSIDE_GUEST discussion, I've had a long discussion with
> Will where we reversed engineered the synchronisation requirements,
> and concluded that there was nothing to fix on that front (the logic
> is incredibly subtle and counter-intuitive, but overall sound). This
> patch is therefore dropped.

The first [High] issue Sashiko found on patch 2 [1] holds for DISCARD,
because the fold writes back the pending_latch that DISCARD clears.
With a 2ms delay after the exit to widen the window, and the DISCARD
sent at a varying time, the guest in my DISCARD reproducer takes the
discarded LPI in 13 of 20 runs on v2.

A vCPU on its way into the guest does the same: it loads its LRs in
kvm_vgic_flush_hwstate() while it's still OUTSIDE_GUEST_MODE, so
kvm_arm_halt_guest() doesn't wait for it. With the delay after the
flush instead, on v2 plus your 1/7 and 2/7 [2] and both changes from
your reply to 1/7 [3], the guest takes it in 9 of 20 runs.

Once DISCARD waits for irq->on_lr to clear before clearing
pending_latch, the guest takes it in none of 20 runs in either case.
I'll add that to v3, unless the single-vcpu stunning already waits for
it.

Cheers,
/fuad

[1] https://lore.kernel.org/r/sashiko-outbox-169278@kernel.org
[2] https://lore.kernel.org/r/20260929093548.3598547-1-maz@kernel.org
[3] https://lore.kernel.org/r/86a4p0403b.wl-maz@kernel.org

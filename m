Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344585326AE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072197; cv=none; b=dsaZO7BBhC9qhdKnuWmo97e4uKnZL/IJnGOBx0t2JQd/i/5IsIIrHmMf0n9oLWDJsx50ODAjalMYiUSpyZ3An0FEjgLRlt0AmTDgoq08lRRyszDvY7KPiLY7Gh80ZrM2JsX53rQzmoWLZo/bdA+TsylpP1Fu7Nrmz+ecf34OTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072197; c=relaxed/simple;
	bh=GgpGc0XIjAacsdtFYETgkKESfJhnEXgGXDU5RsrhnBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXK4EK8yxC8prbvTeig94fivRCXjEwRC82jxTkPu6oeedn8io65JDkaa2t0fWFaCXJhcvNhDgh+BAeJYx/6Is6DXvqTquQF8jEDv9gZbboi2TFIVPWy2IswcfPOQBmqnPEwP5RVWEP8zo2TsQ8EruMEe0ToZ/buFF/Q9HQxk3bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVxWDYrK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVxWDYrK"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso3357296b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072192; x=1790676992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4BNeBv2Xk9F1CB1cgKUVArUM1oX+ebQd47lsZ5uxxag=;
        b=cVxWDYrKkaMnktYlhGkC6016vKAOfcftYx4roOS+WqpizANV81MCzsJYIkb0Hw5eUy
         +MMjoGyrbjAFrKL8u1SFrj+X0/KbrdDNeimLF6HE7K3A5r40NzCEaCNCpLQHfRzvPzgw
         m+i/rxS+1nPxnF7Ggs+0Y8GizvppkcQxMpoEGJWq8ENuYviTmlpd1ZjX7jE97mZlBoWH
         K49SMoJKOCpZgablL+YuPxxaNPvRlyyvl7Hy5lvSXaWt9PmX3UUaIkgANDPQ4u5W7bYR
         oxh+b21mqJQ1dC5HJSqZ+Q6bouMLj2lRZbodiE803id9QeIvCsbgA6b+sOEjr4TgDB7z
         xCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072192; x=1790676992;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BNeBv2Xk9F1CB1cgKUVArUM1oX+ebQd47lsZ5uxxag=;
        b=QX6QUdPvo/fGeXUNME0/V57zG2y4psCN/YVSCx8Zqu51V0M17kTNtkvvrYUfb8mDBQ
         dafKY3K+6WRvlu3tSTUbB+ml0DFIw882theP7h1oCzhh1iyI8pRNgx4XjUkqAVMvYRw9
         5ghwMLMkW3wdtBiIE1LiOupLWAOipD7qrdCrmP1WCE/Oe6ms2eOvYLc4Vh9rwSWb8Zaw
         okd9klgZMRP7QPy8p5607r60glbWPMs6/SDWEAVNhaJPEPiuOlrQ9CkPvKQJ5eHjWzF1
         kmv+uKVFqvwD0wi+UyIxhgTSHKczo53eiiYke4lYjPUJN7Pp+zMtykNRY4Z6oTOt0PVW
         XJ4A==
X-Forwarded-Encrypted: i=1; AKwUvBwwnn2YSEkC+KWgwMGDke8j1Fr9iJloSUBTj837M/EmSCViW92Ejrs2Rp+6aoXzvzUSl9+1qLVi40ADIoo=@vger.kernel.org
X-Gm-Message-State: AFuF++loqOg/+lFG+WyJ1eIUwGIRJ8x1/+KfYvQcuZ7ELtH/107rzEyI
	vEkIUSBYRzO2skawNLjkYneltskTukDsebtA+mvjXV4bdZDjzv/NcxSX
X-Gm-Gg: AYBFou33NIt5V8WEQMz/fbouKcUWtDHF+qMOifhuyspz8zoRjGWTnfWVSo8DrmNWSrb
	W8gH13UmioMyf6GwL03kL9aV/ckGNdRd7j5NZtOjUmBmCKVb3vbymJEuZ+NaT5lbuykBp6AZyBV
	HxQ9sDIvc3C1iosnCs9Rg+Dch0P2BhIR8vkr5AicfjAwcTyN+2uswTviy6XGyYN2gNoxw9BarHZ
	In4Q0DEIgzyx7/PszJKOyYo74LyJu9+ZcOj1F2bPLGuRvOFmvD3j84TFh8Yi/3TkuDkmA99/UpA
	sWPCRt1E3cRoDWeLEOP2fXbt2Gu+UqOXYU/V8ZnNNNVlK2p7ZC3c2ll3X7y+0terrd5GGjzdJIh
	6U/2ePBc1hs7/VGJAiLqRioZrGJqUpS1sQmk3eb6febCdYQDcSfxIs9fDdPHqgM1+RR6ZD6mIuT
	NSojDyC6RDoiEKTuYX6+2VblpC3yGkOR7Yg133vhRemQdd7CyhYIocOMrfOMFgMP7ugqGCguGzf
	6AiD9hrtce18Y/+YR314EGbcpEaKI+LDoG4lw==
X-Received: by 2002:a05:6a20:c91a:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3ddec5fa40fmr927062637.10.1790072192035;
        Tue, 22 Sep 2026 03:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:4d0:75ae:9920:3973])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a30002sm679379a12.13.2026.09.22.03.16.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:16:31 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH v3 0/1] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Tue, 22 Sep 2026 18:16:23 +0800
Message-ID: <20260922101623.39468-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87bj9r4h9z.wl-maz@kernel.org>
References: <87bj9r4h9z.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Marc,

Thank you for the candid feedback and for cutting right to the heart of
the problem with the 3-patch series on your branch.

Your series is vastly simpler and elegant:
1. Only caching last_lr_irq when LRs are genuinely full eliminates the
   overhead for non-overflow exits.
2. Holding a proper reference on last_lr_irq and releasing it under
   ap_list_lock in vgic_prune_ap_list() cleanly addresses the lifetime
   hazard without introducing lock-order inversions during folding.
3. Halting the VM (kvm_arm_halt_guest) on remote GICR_CTLR.EnableLPIs=0
   completely avoids cross-vCPU concurrency for an event that almost
   never happens in practice.

As requested, I wrote a KVM arm64 selftest for this scenario:
tools/testing/selftests/kvm/arm64/vgic_lpi_disable.c

The test:
- Configures an ITS with multiple LPIs targeting vCPU 0.
- Keeps vCPU 0 in guest mode with EOImode=0 while injecting bursts of
  MSIs to force its List Registers to overflow into the ap_list.
- Concurrently, vCPU 1 repeatedly toggles GICR_CTLR.EnableLPIs on
  vCPU 0's redistributor.

Regarding testing: I currently no longer have access to KVM-capable
hardware (my test setup is no longer available), so I cannot provide
a Tested-by for your series. The race itself was originally identified
through code inspection rather than a standalone reproducer, which is
why I turned the theoretical scenario directly into this selftest.

The selftest builds cleanly as part of the full arm64 kvm selftest
suite, and its framework plumbing was smoke-tested under QEMU TCG,
which by construction cannot exercise the race itself. I'd be grateful
if you could give it a spin on your setup.

The selftest patch is based on top of your kvm-arm64/vgic-last_lr_irq-fixes
branch and has been sent in reply to this thread.

Thanks,
Yuchao

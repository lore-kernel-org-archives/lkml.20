Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC91C4EE866
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073590; cv=none; b=MiHCqsL6bY9p3uz1rR1ZG2ebO9z2rTr00XQt6vx8ruy5VCp4LbMG1pgUYNY9ziqN9sqXkH4P4TCC08Sai4yOcSBkMGwUmRVmyz561fwAa03kYTdEi0kkyUGPf0ehnZZYd23c/moOET6pnMG4y8ZBXfjuOv+c0R6Gt5cIdrAWLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073590; c=relaxed/simple;
	bh=rQa40uWPapC60ioHBAw/KM6gw3RzpNXJjEMK0MR9cNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6oQdaqZioFk6nPZD70lxb81G8DucF48YAZB3xDLBHUhV92q/PtcE9R5KiaOWKnG0Yd54FgsiA2lVDAGkbgW0qCASpErZHMI1pkZceYjkB8y6JokzgkwsApdH4Wyoun6I08Bdv85jLBm4JjlcRiHpy+L3kNExTlClnnGBShgvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQd/boaC; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQd/boaC"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86e6d007703so3301203b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790073588; x=1790678388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=II0vtlBLX3teC8UAtU2N6RuSR3r58GGPZ14MkNA6Dmw=;
        b=bQd/boaCN08Dbd6rn77jhbI9IA7j8bjywTPHvNx5VfaWLn/tFTvOzM9x/yxmq2untT
         Dw7Li2noEsyaPjUJ9RiWBybg5znKAiGPxcpf32YSNbc96yJyeoh2wCY8dCwocSNOc/Jb
         tgI5MZrl00JG+lYCDUcuCdUkwmi2hA+5co2wO1SWM1IqBi8jIitInL8AzPk63uEUR8Fa
         +T9hP22itcKOc3liUn+Ycbr/uo1ll4moqTRfZqUQAMKWDfIdXY6oPzrJ6AaSFy67ewSL
         DonyVUr/T6amxo0jwPqAxixGEHPJ7HthKxzcx2UYDOs9513n87wMu4/O1noKNoBZfVPa
         vzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073588; x=1790678388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=II0vtlBLX3teC8UAtU2N6RuSR3r58GGPZ14MkNA6Dmw=;
        b=O6IaXzrj9YoUV/g8NPUwRUcwsOEh73FdWbGhwWS6acmpqFY2q9DcNkBwkiMKyHV/bW
         06FAqo/9vHgqdMb1JVpJS7swLTRDPDbWHPqn9kZOlXM0o4O0nejnPaZ0XLccpH9e/6H3
         3SEux2YjjMhdaC0uFGsQIR23SshV33TQGSb6BbCKoK02cyg5IBHYe2BFnezGnRSsWb5C
         IyHQpPKRqllLrxKAMPgNLJnN1GBG6kIbzqU+OIX4KX8ckgNBCMDK3eSwQNaY/eDMM1Oc
         ydQd3gpC+4No9hUJGlpjebBitKqgIbBPzQGZKHgH1hvYOAXgAx7Sr3qELUBvISukgDbU
         d3sg==
X-Forwarded-Encrypted: i=1; AKwUvBwdZd7mCQ2rPxH1NsxXWD6MazxElPm/ZAJGruixSooFhXHpJdmS74Mong5mPagn28OKcZuyKh4alTdUQKc=@vger.kernel.org
X-Gm-Message-State: AFuF++lgWv954N9anVzEcTWdrMz9LHiHi24Uo+U0w6N8tv7iSZa8yxEL
	ZtdKfFtq7CHppQjJ+GSF/v/Z1uDJeRRX7r2bFQncLQbwbgJk06rPKC/x
X-Gm-Gg: AYBFou1CvJKlU251gLGHwrWAG1NYItR6KINlIfOjUsZwqFzCwi8Cm1TbtSvvS/m9JIX
	J/MzBHjVTyQu4DaSVlRYEQIY2Er37i1MpCmJgPIaYLwB240m/exJuhgupGmHJULqEjDShO6vWu5
	fvB+ppRRwgRlg/Po5wzxS4Cgp0backaZY3lO9TuYeQb1ACkEhnqSV0gTobIh9jze3XFadVg6eXW
	lFXyfHoL4x/Lp/3GWFNiMJNfjSwCuyg7hjBdGhYC8d9dCD4mGBu5A6u27dU7FBCDeGQDgiC0+h8
	bGv1b4KEURZq/tKFrPLQ6wmiPi4KUJuXHxCLmjjEFNBybU9VxZ+Mh4gYdTa6AI+OIA3UN9rCiwb
	vPEBlC1nXT9PbyRXx7N8v/kAtXtBIVb3xQcTCTDx3MRFtwOiLyuN/R585Kk2cwb0MWRiQteKuwo
	yH2ffLb4tTihwqAHvaisUDnl3M+GTOzeqIwosPLZ1LNvQFtaZgplib1QSsY+QF3H93qckMpx9UW
	DOViZ+K6c0=
X-Received: by 2002:a05:6a20:e390:b0:3dd:a006:ed9b with SMTP id adf61e73a8af0-3ddec82345bmr811522637.49.1790073587913;
        Tue, 22 Sep 2026 03:39:47 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271695sm4397515eec.8.2026.09.22.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:39:47 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xianglai Li <lixianglai@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] LoongArch: KVM: Return the actual error code in kvm_ipi_create()
Date: Tue, 22 Sep 2026 10:39:31 +0000
Message-ID: <20260922103931.215091-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_ipi_create() registers the IPI device on the IOCSR bus and jumps to
the error label when that fails. The error path then discards the error
code that kvm_io_bus_register_dev() reported and returns -EFAULT
instead:

	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS, IOCSR_IPI_BASE,
				      IOCSR_IPI_SIZE, device);
	mutex_unlock(&kvm->slots_lock);
	if (ret < 0) {
		kvm_pr_unimpl("%s: Initialize IOCSR dev failed, ret = %d\n",
			      __func__, ret);
		goto err;
	}
	...
err:
	kfree(s);
	return -EFAULT;

kvm_io_bus_register_dev() fails with -ENOMEM or -ENOSPC, so userspace
creating a KVM_DEV_TYPE_LOONGARCH_IPI device is told that it passed a
bad address when the real problem is that the host is out of memory or
out of IOCSR bus slots. -EFAULT is reserved for faulting user addresses,
and the remaining -EFAULT returns in this file are get_user() failures,
where it is correct.

Return ret instead. It is guaranteed to hold a valid negative errno
because the ret < 0 branch above is the only path that reaches the error
label. This also matches kvm_eiointc_create(), which already propagates
the kvm_io_bus_register_dev() error code unchanged.

Only compile-tested; the fix is a straight propagation of an error code
that the adjacent kvm_pr_unimpl() already logs.

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/intc/ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 7b333a4a0430..672ec053a997 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -431,7 +431,7 @@ static int kvm_ipi_create(struct kvm_device *dev, u32 type)
 
 err:
 	kfree(s);
-	return -EFAULT;
+	return ret;
 }
 
 static void kvm_ipi_destroy(struct kvm_device *dev)
-- 
2.43.0


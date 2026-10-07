Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FFF3955D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363091; cv=none; b=py3myYz+nD2KXzPWuZlp6II2DS7iugBDOZ6oPCZCpQExUYXEThmnvILfLyKDvXjsaZMnrE8oudPEr7xmKTBLw2XANccVflb63CBB4I5RZC0eJAURYHvrQMBHj9ilZt+lJAA8n+TnCfSmPr2nTGksjxowRoLz+kpPfMQG490ixcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363091; c=relaxed/simple;
	bh=6Cp/A+VdcsizIImeGb6RbHmevCDxCPLoIjKvuAARp7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKtLPl/StQ2MYHCIvJzxDuYkTiz+qpWo4WGoLb0L1s3u4zT1sU7fhh/9gq2XhOU1mXF0ntDxZv7y9cNeYib01Nsn+PVkbB4ILRNspZ+GpwCtw7cNQiWI70zUcmqP7GE5EmOUW7Fq0tOxyomH5PuR0s1H13Yt3SdqYVkOUhueGKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=X0dEvV9M; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X0dEvV9M"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1419d3416ceso6846071c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363089; x=1791967889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=X0dEvV9Mv44G/m3uAtrq/ScS3Dkrn/IRkx+sLL0Ov9eeuWEF6NqcBQCJZsay1VRhHk
         6Cg00us5nyLdXw6gy8Z2+8hhJbJm2oHwJctW0kt0vw9zk8hlmGG4879LiyNQxpTO3P7n
         wKlVNBbslXBpQ5JprmPvejRYMBpC2D5TFKS5JoJkspTMy8CrUtFrbEXi1hmCbm1kcYN0
         dF9bUAzjznPln570YKTUppoN0zaHCeT8gcblbe2XgQqfC/nRDXr3WyTuEPWRxeDyeERH
         OkKh5u/APnNMzEm1p8fDsSi8aVcSYhotdSSy3SHPYCVZjUdwCVpK1OpFXHaUcVeupUlh
         6LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363089; x=1791967889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=uB3jUvJRZeA8JU9a63ulwHyjcEQmoEuRyOt3X2vjpbboDvPvUse7X4mTDoXJEOzeGj
         ecTNR3SQOAGRKCcG0nvRL2hP6iy2nX9PbZ7lp6J9RWHwlWdrVWjzaxeb4P2H2ONyFLSw
         9pugbYMBps5HfuxXUABv3WnHPrajqBpak5ZFhW03jTuvrCTxD+zckAa1mHEfrDXlUNfF
         Oh6/S0OV4p16N76667Zo3OZpkQNR1Cg8Ltn+VodJaRj3vL+VyzbvLuIb6+qN2655Bfa5
         j/2FXS1ZK3niezm+QMrz+yDCzcU1JhHOf3jEaH3+tWFeynRBPLxUNJLyGaj6xuhAbt0n
         RM3A==
X-Forwarded-Encrypted: i=1; AKwUvByayfFxDXMzgA+p5mzOoODroAlYwKM9IQFWJgkW703EQZK3Sx/BY4Rl1H5orBLNh+MDSCozly2Sm3MkpUk=@vger.kernel.org
X-Gm-Message-State: AFuF++k2bS6IouZIzC1lH5nyuaw5fNw2CxXG/QZTXqSG0UdqkPEQjYnL
	8tfopXdL+aOSJU+YKvf3uf53IwokHwHUM1hIHezW9OrP57tRF96GNFWhbRyf5HtEqAqFcigXaxZ
	z5DUm2kDw4g==
X-Gm-Gg: AYBFou0RJSOy1gbr/zpfgwwTCEnYh1S9hEqQRk2hjgYKvSp7KGBEFjYNowitt9ISziS
	HRmPNuHGazoMSDhBFHuf6qbCw2M1R/MbQ+7a4OOCRPMSGAdnFuQi/Ag2I/OgIaTG1POzIHwIk47
	S4OPG+l8JklPzOfWqYUdKuBHrButElwGKt1ccTvLw0K+rDV7XdZZsLoo8TyutvWEiLRpTQah6AI
	degbQ8gx2lMllcpUWc1BxBeU3+TfcKo6oF6vCkq68lzfNnX/IfdFwMYHXEUIj0mHfH+iPB3GTef
	mRreJCBdnxsMO4Cfu/fPTOX1kOBDHjHeu5g6MnUiuJhSQ7ZwPAMPYxsp/UGxMEwgNcVf4a6r3HR
	k8Om5q9RDJvG97xSplOLEQodo37bK7sUDop1StENnPysKyUNPgnVzc2CUMM/YV12CVBLlbKUXDp
	wqKbUzZr4LhZiUVQEEkyNmmQ+5gU8i5vDcA2vNFhp3ZngFho5xqSF4GFxJsoHq95q27UmzK7sDa
	X336YFeY/eZhoD/J1AS
X-Received: by 2002:a05:701b:4518:10b0:14d:3930:647d with SMTP id a92af1059eb24-1620374de3dmr1490658c88.9.1791363089288;
        Wed, 07 Oct 2026 01:51:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Date: Wed,  7 Oct 2026 01:51:16 -0700
Message-ID: <20261007085126.222688-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This appears to be unused in practice, and
creates confusion in the extension support returned by hwprobe(), as in
this one special case an extension reported as present by hwprobe() is
unusable.

Since we believe it is safe to always allow vector usage, start removing
this functionality by dropping the Kconfig option. It is possible to get
equivalent behavior by setting the sysctl at boot via the kernel command
line, but that method will also soon be deprecated.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig         | 11 -----------
 arch/riscv/kernel/vector.c |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455ce..e26450f0d38fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,17 +650,6 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
-config RISCV_ISA_V_DEFAULT_ENABLE
-	bool "Enable userspace Vector by default"
-	depends on RISCV_ISA_V
-	default y
-	help
-	  Say Y here if you want to enable Vector in userspace by default.
-	  Otherwise, userspace has to make explicit prctl() call to enable
-	  Vector, or enable it via the sysctl interface.
-
-	  If you don't know what to do here, say Y.
-
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9f..9641343732782 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -20,7 +20,7 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
-static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static bool riscv_v_implicit_uacc = true;
 static struct kmem_cache *riscv_v_user_cachep;
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static struct kmem_cache *riscv_v_kernel_cachep;
-- 
2.52.0


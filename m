Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCC34C98C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348756; cv=none; b=kxGq3jnPZJZf26kRHXKSReWDHIls6NQPJQ+j40XBTeWMasHLMUthKRHZMZl3KLZpj+UbFCSGWKL00b6U7bMgELgddoMVySVBtdaDqClkltBOJY94+Oohdk94pZD+ootTaSkt5pm3ZElNZo3M9ewTYo1N9IgQuCOFYmmd12vESxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348756; c=relaxed/simple;
	bh=E2JHBx3ba9zglWjFWmbstcfxbIaxYRKSqSX6ny42Rao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gS92yRoFbvMs7kuKW9f+hJOxJBderMVugULsRfICRf1+avaCn9jEX/bqHyB3VQ6k3Nt3xAP1hhrfOHMcCG8zeGgf2LpEFCmMdcH1Pqb0sSrdcdQm+o6Ja3dnMfWCcgMg9/+8Gp66HoPiuCE3c5KWyaifJ2rZyJEllbBVBekpFnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=lGLKgaLe; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lGLKgaLe"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-34c89609923so776205eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791348754; x=1791953554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmgrLpFXhhaFsHuQHBPVlR2txu1HA+6BnxOMmWzDn74=;
        b=lGLKgaLen5RzwLzupnT5rKfyFvHuL8MJkidnwdFKEToeJ27ZJY6ZRgE3fDXUegZICE
         mUy2xU3SGNsfPuLo2q9w3BeVPjEaIP8v5p4JTHkohwmTSLrWE6JgdQpx8bOmpnfoaFCp
         4cOCQjRWPCTi+HxAUwc3hgD7IvEkJKCQdeaAa4s4/xXKgnZrLbb+sJdxJvni0phFS4wC
         dwIXdzgz0npoBvBD1sMfYO7bOfstt7H+JXpoHaQHkRDNEuGhOm1Htthun2w801ahjEQ0
         oTOkc7fafwwO38DxZDUgKwijXEcA36dQ9WFHQOeHzlfDDCMzdm9v8jENbzXd2Rtl46QX
         z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791348754; x=1791953554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmgrLpFXhhaFsHuQHBPVlR2txu1HA+6BnxOMmWzDn74=;
        b=Pf/5LDf/gcQhzU4jhVK1/x6kZW+y1DCty9dRS5JhABm9iG5jgTZ3wZc6DLr6j0n9qM
         nJ3zj8KrpKvXS6TToX/PL6q5Pwl+7r/836ATDhnyQv7rvP0bXSxzF+0ZZ3eEYf5isGqc
         AU+zk57KcT399foNaT4Us38jcZgxWoux3Gmm8tWQSj/mlSqOzNmT0rgpdZnlEAR7I6Qc
         d2UNUQRQoqVWQrbqLiEbH4SGhD0wpgKTJT5Sk7eRRBTR1Mb9aRJcXZggddGyhj22Orlg
         81l+txBfPmf+8vjxgGjvxCMpvXWxIGDA7MYtd33nInPMXNUNUb+NliTGouNDghxX7t3k
         d0RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBul87qMQlRVxjPxY5h/IgkcrtGIg9mJd2E2UBYug1Qrc3q8hI/BwkhwVQ+kMiDh0804MJh3SCwWf/wjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeAbxD8neK0QmGobwZBVWftfH8TLd8VXYXdhbSAMdwe/osTh0q
	XcLgffPwNvbkMANymmE5Y6Hvi7tBE8KPL1Z+ewcUGuJKITfUlhMgpoHqH9Oso+vFAPQ=
X-Gm-Gg: AYBFou1MLlvVSLKSA8E4OBneSs0PF/xxseYiTONOk0772ZkljQ6jrn7pRUe2Iu4qI7e
	3kStQvOserzFrYDJJAb/DR9tDIkiK8K3OJAO25ULUzF1faDBjiRXXyDl5PSbzmm9laUh8OexdLH
	MwltsLoVXH42PLv4bL9nHr8GNuulIlayL9LxfiyYf+hlPvHbBh3t/hg2xSdpqYzQrCxicAVG84U
	uXNY5rIlWuataQwWXP/Lv79rJ+KhCUjI/U4bNqWM9AcnkvZ6CwgfIZWu7/68u+5XxzXXmlMXloM
	Vb68m1Qd4MmzOzwjfzDt1BcpXZvjqYfqiD6mZwtjm1t7ivCS/qY2axzFtk1vqzW1aRvDiIqg7Xn
	nIXNVrIiaTV82V+zuW9KeoLI6E+yBw4iPN8gj86+AwQqLazPoPCRpp9NaW+iB7r2EjXOoVqQ0GI
	SbZ1fheLUiTMp+Asif0EYowRTw1S3rJysLaOcighow4DY3TSQG8geY90fj7J+9ZQjV2TRCMq7/6
	sXLpUsdjvCsmw==
X-Received: by 2002:a05:7301:488e:b0:34b:529d:6263 with SMTP id 5a478bee46e88-3515de84167mr1045115eec.33.1791348753785;
        Tue, 06 Oct 2026 21:52:33 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6076sm4187598eec.9.2026.10.06.21.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 21:52:33 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	wangruikang@iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH 1/1] riscv: fix NR_CPUS range leaking 64-bit default onto 32-bit builds
Date: Tue,  6 Oct 2026 21:52:29 -0700
Message-ID: <20261007045229.36114-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rv32_defconfig is built in two stages:

- the generic (64-bit-oriented) "defconfig" target runs first
  and resolves a concrete NR_CPUS value using the 64BIT default.
- then 32-bit.config is merged on top via merge_config.sh,
  which does not touch NR_CPUS.

The final "make olddefconfig" pass sees NR_CPUS=256 is still within
the "2 512" range therefore never recalculates it against the 32BIT
default of 32, silently keeping the leaked 64-bit-stage value.

The NR_CPUS-scaled regions (percpu areas, ...etc) of the resulting
CONFIG_NR_CPUS=256 on a 32-bit build bloats and does not fit in the
percpu/stack layout for rv32 and hangs early boot on QEMU's virt machine.

Fix this by explicitly specify the range for 32/64 and SBI_V01/!SBI_V01.

Fixes: 0fa749771993 ("riscv: Raise default NR_CPUS for 64BIT to 256")
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 arch/riscv/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455..5874ca30f4f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -453,9 +453,10 @@ config SMP
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-	range 2 512 if !RISCV_SBI_V01
-	range 2 32 if RISCV_SBI_V01 && 32BIT
+	range 2 512 if !RISCV_SBI_V01 && 64BIT
+	range 2 128 if !RISCV_SBI_V01 && 32BIT
 	range 2 64 if RISCV_SBI_V01 && 64BIT
+	range 2 32 if RISCV_SBI_V01 && 32BIT
 	default "32" if 32BIT
 	default "64" if RISCV_SBI_V01 && 64BIT
 	default "256" if !RISCV_SBI_V01 && 64BIT
-- 
2.43.7


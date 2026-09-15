Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3847DF89
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468609; cv=none; b=JlifWcBBSf04u82ERFTx5Ly0JRqaFB9qqP6A+lV5h/4BwfTmqs/ajmJTFLF5xNI4EWlgR5AU5YU/lDykZVema9mcF8RaN7ygP4kjhs4N6cWF86CklTEZIvX5u3qOmq+TETxknhsiHEzzp211i7ZKE/hi554EKwHZ7LFCCTukMUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468609; c=relaxed/simple;
	bh=1201ePe3wMue//Ntwvvod7K+jv1nS8bfBHNOG/DpCEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ef96bjlQZywng6GJD41DrjUzJKFyzYLW5Z8PWY6brm2Ta3zsaa7LLAJSeGbLcMEbDM5hjLnz8ItCa6+NrhoybwxQETVet2bDEHa0Ot6XFvwbqlgl5P9sr/GyaSe+JECZ19VCXagnFw17jgSnjozOBntQ6dUTvxFgO0Piv566N1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bk01zrZp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lHfSLcZS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bk01zrZp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lHfSLcZS"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hkdjf2mffz8tLb;
	Tue, 15 Sep 2026 12:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789468598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GdaeUJihoAqdST7RWYTrFtAMA1Z3ICjp9ZpxETHJCXs=;
	b=bk01zrZpMg3vdz3peoYYOiEMFmRfrt3Qk2NfMw6U1RzoACFD7W8q79utEGTqd603AU4M6e
	j+m49Eyv4aRxIp6daflaWf/RqjfmxKIzFnO+GITGxzcgs3wrtDBorcf2F6ZP4RnZEUkeLA
	tgLZk8BJCxH7/5mBHfhyG0y867MR3QkRmaOpIXJAitKmL/8/T9nFVnVoTz7xkirmcwvj04
	WAU7YUe4P+Ghha8LjNvVm5QVYW1nZDEAF2ARgiO3l1yTXdpAJ9XrJdtG/IB1P2qtkiR3UT
	CZu2gsuh/s1RiDSgj7wgj+PUCChcfdQPGmBoMEs1pTESTcY+MCEQAizyOOPxfw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lHfSLcZS;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789468597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GdaeUJihoAqdST7RWYTrFtAMA1Z3ICjp9ZpxETHJCXs=;
	b=lHfSLcZSgtFPtRpPX9iX/qbRR+YRSS0TZbm8dKVM41ttkkHhXcEbVYExlkdoa55rZ3VM2C
	dUnO9yQY5u5wRfI00ez+Q1X6gb/2Z0WuG4ukSgzE9xD99K9vmT75njgItS37dUQmw+sph9
	7wypeXE4pa0ORjU3/i8I/XeUNYsJ8F9N1OY9v5xNeUnK0B/YXwuiZBgR1kyuIfrrmLxwaT
	UdkYZ7OXxzrgza4akkcfjzlX1AfXPShR5LhhurlN60174Iag6FnSG3TkVp23VYQ085D6Qh
	0qxn9UgDMuujYJ49cUjtgWzsVT2fcZT+7YaRGxvCjYIsLuJRVOKPhBvaHNOu/g==
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/mtrr: Fix kernel-doc
Date: Tue, 15 Sep 2026 12:31:37 +0200
Message-ID: <20260915103136.171924-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8c9e2c263fadbebefda
X-MBO-RS-META: wr3esm8k333oom41jmmwp77fd4msphh9
X-Rspamd-Queue-Id: 4hkdjf2mffz8tLb

Add ':' to arguments in kernel-doc to shut up compiler warnings:

Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'reg' not described in 'amd_set_mtrr'
Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'base' not described in 'amd_set_mtrr'
Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'size' not described in 'amd_set_mtrr'
Warning: arch/x86/kernel/cpu/mtrr/amd.c:63 function parameter 'type' not described in 'amd_set_mtrr'

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 arch/x86/kernel/cpu/mtrr/amd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/mtrr/amd.c b/arch/x86/kernel/cpu/mtrr/amd.c
index a73715d6f..9e440e30c 100644
--- a/arch/x86/kernel/cpu/mtrr/amd.c
+++ b/arch/x86/kernel/cpu/mtrr/amd.c
@@ -51,11 +51,10 @@ amd_get_mtrr(unsigned int reg, unsigned long *base,
 
 /**
  * amd_set_mtrr - Set variable MTRR register on the local CPU.
- *
- * @reg The register to set.
- * @base The base address of the region.
- * @size The size of the region. If this is 0 the region is disabled.
- * @type The type of the region.
+ * @reg: The register to set.
+ * @base: The base address of the region.
+ * @size: The size of the region. If this is 0 the region is disabled.
+ * @type: The type of the region.
  *
  * Returns nothing.
  */
-- 
2.55.0


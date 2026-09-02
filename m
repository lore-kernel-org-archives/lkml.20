Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C78A33C18B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340153; cv=none; b=E9iGP539D0L6gzmqMhIOEZ98meG53NGPOBU5Hp1whRzBct98oNiLSQWMTnYj7yiH+GI6WuXG3sQD2EiDv+8t/m65E4c1uDiCvgvhfRamhpiWmlg/2uqxxMxnOFPn7b/NZTQ1UY3lt7WBDhHE6Xz3v1Nc0NL6KD7IB+706RonXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340153; c=relaxed/simple;
	bh=rsI1/LIwodBTXZQp1n3AcRdbTWHVXAR5iY/8w6NP4S0=;
	h=Subject:To:From:Mime-Version:Cc:Date:Message-Id:Content-Type; b=F7hdvlp+bNNwGZAO/kKQCBApKbX06k0jnEKlhu2d9ocwysFpZILdFu8XaxV1KOtsv46zigEADtQEirl/LAV4yUmw//ElvHAodnMJsQkot//1jBLMq0q7+Ot0+e4TptkZ0x8DvnZ661nCUmWQqbeVzJjJjNjiFe29vWm92VzNGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=sWlPLjVt; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="sWlPLjVt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340134; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=kplzY+ir5BhXbpEn3+WYNn+D3WrMj/dxeymw75eVxzk=;
 b=sWlPLjVtDl3lNfNAhYrDRbqLHXyPCidXyHyDg+tgPJurAzsvRgjySVKdWVHCbmCqkjVVuh
 RYM3zsUfgfqT+t/I+aopBlYTZE67oGLvV005zZLb64SXCkDHCK8xYpOqIXt41Dv1DgOuun
 o7SVeAl+UTjJ920FUAYssMVRbVu1bcyo4nh7PCJjbQSF9/4t9OQDFzOZcbFMarjwECUgvt
 W3Y9bK+ZRpkGDVISRDkdIQHS//6TzqboRXRCZHSGiYq/eLIXPKUHg/Jw93/Lqy5bshgE1U
 OJbk+W3RSi7rpO7DTFJc8/NqENPnV4ByzUdz5p9czBNijZDfJ9THYbVw6PgBcA==
Subject: [PATCH RESEND 0/3] Fix kexec_file segment placement on RISC-V
X-Original-From: Yufan Dou <douyufan@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
From: "Yufan Dou" <douyufan@picoheart.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:52 +0800
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:47 +0800
Message-Id: <20260902090850.2601-1-douyufan@picoheart.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26a97e7a4+d5bb4f+vger.kernel.org+douyufan@picoheart.com>
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.53.0

This patchset fixes three ways in which kexec_file_load() can place
segments where the next kernel cannot use them:
- Patch 1/3 keeps the extra segments within the direct map of the next
  kernel, which is narrower when an Sv48/Sv57 kernel loads an Sv39 one
- Patch 2/3 sizes the ELF placement search by the extent the image
  occupies in memory rather than by the length of the file
- Patch 3/3 reserves the PMD-aligned tail of the kernel image that the
  next kernel reserves under CONFIG_STRICT_KERNEL_RWX

Patch 1/3 is independent. Patch 3/3 depends on patch 2/3, and both are
marked for stable.

Resending rebased onto current mainline (v7.3-rc1); no code changes
since the previous posting.

Yufan Dou (3):
  riscv: kexec_file: constrain extra segments to the Sv39 direct map
  riscv: kexec_file: size the ELF placement search by the load extent
  riscv: kexec: reserve the PMD-aligned kernel image range

 arch/riscv/kernel/kexec_elf.c          | 38 ++++++++++++++++++++++----
 arch/riscv/kernel/kexec_image.c        |  7 ++++-
 arch/riscv/kernel/machine_kexec_file.c | 25 ++++++++++++++++-
 3 files changed, 62 insertions(+), 8 deletions(-)


base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.34.1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793058295;
	b=NPcB0kNNNOYw8L/8jC0g/2yjQtHM5NUVQHOPuW0MR0YCpfUgxekpKMPHaD/Mu4hbTy0K
	 6mRu++gnEebrGwDB4f7rPpTJqYvg4Axv8IMgP1RZB0vgfdP4Njqk6RYRFnOfF0ptHDbJt
	 R0zExdh6GuvjR0qm3xSSXMDqGhvxIsOtB0Epm7eL0n2YnP/eavH9aeGk4Xm4zQhTLJyvj
	 sxnQSHIt3oXDSeHyYGWghMeQxtMoOYJEADakA5kDfm+KXg4aK+pmO4uTMJCt9ZBFH5g6V
	 DXT+P4a2+Ayqdq8tabO9nR7EhVzm52OFsigl5qwEdPhPIiNCOHMvRJszy7uJ+dyftnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058295;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=INeusVMHi5EuzPtcL0c8vERxPE/Pg6yXjA24YmpWnJI=;
	b=nzvDwLg/jTN4PFslDxZ1hjAuk/RPdKxZ2DP8paVCaaJl8Zl6uvXP2c4o8Nf2pWz620u+
	 2nlt3AM5MrZviLeCNNtMTlGIQvk4bye2wmEfxbIK1X7yLTHrU+jFHJKKRCD2o6JymkbF7
	 9cmMtnvxfonCCJMSGewwEmAwmqgmSymdzgG7SLSPGm4Q6l8ts4GAQPDdkxIuDqp4QGJGa
	 pHCtvuDSgI/ObpcNxxQhMJGAhKCLiHDbM4RyHixkkHcI+kwLBPGGIDx84/Lho/1Z60i/5
	 Pdjdz+n4nncNY6rqC8NTzjW6qyROBGrGeOHuExtC5yD4VkpJOVPCQMy3vmmNm9XGspw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9invOsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9invOsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FBB1F01825;
	Mon, 26 Oct 2026 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793058294;
	bh=INeusVMHi5EuzPtcL0c8vERxPE/Pg6yXjA24YmpWnJI=;
	h=From:To:Cc:Subject:Date;
	b=i9invOsJSoHBhPqz3D2ybgGspFPUxMYI0UV+qbcVzAu5fAxKkR0+4ZcNNBQ7DMCm0
	 geHUB3fhkXLTwLUx5o7CLeVosj6bfmasxbuNRfm8plNpWcAnTsnvMvNtfh2ChLIrAY
	 FM53oq7K/F4iKxf+q4DLbbl+qJWehgTNrGIUC8RZeTzxucLy8k4molPU4UpSAZQKfE
	 sp2CeoB86g20Go4vsHzvwpYJsfoA3zUGZsUbr2nCXmRm34NvdFeTqYvA+nNGzvQjYw
	 AoJPmvMJtBY3p7Ioys/PDkboKm0fN5DX/W1cWxjIYPs//hsVrGYAVjj8kJOzrbYG7c
	 SA9X4dl7aQZsQ==
From: Sasha Levin <sashal@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] nios2: ksyms: Export __divsi3_table
Date: Mon, 26 Oct 2026 19:44:52 -0400
Message-ID: <20261026234452.1086974-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lib/lz4 is built with -O3, and at -O3 GCC enables -mfast-sw-div, which
expands divisions by small numbers using __divsi3_table, a lookup table
in libgcc. Without CONFIG_NIOS2_HW_DIV_SUPPORT that leaves
lz4_compress.ko with a reference modpost cannot resolve:

  ERROR: modpost: lib/lz4/lz4_compress.ko: symbol '__divsi3_table' undefined!

libgcc is linked into vmlinux, so built-in code finds the table, but it
is not exported to modules. Export it next to __divsi3.

The error predates commit 2180d11e06fb ("nios2: ksyms: Declare __mulsi3
export"), which only made it visible: before that commit, modpost used
up its ten unresolved symbol reports on __mulsi3 and suppressed the rest.

Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610270503.NGox5O6j-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/nios2/kernel/nios2_ksyms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/nios2/kernel/nios2_ksyms.c b/arch/nios2/kernel/nios2_ksyms.c
index e8710a269b398..b7152258430a6 100644
--- a/arch/nios2/kernel/nios2_ksyms.c
+++ b/arch/nios2/kernel/nios2_ksyms.c
@@ -31,6 +31,7 @@ EXPORT_SYMBOL(flush_icache_range);
 
 DECLARE_EXPORT(__gcc_bcmp);
 DECLARE_EXPORT(__divsi3);
+DECLARE_EXPORT(__divsi3_table);
 DECLARE_EXPORT(__moddi3);
 DECLARE_EXPORT(__modsi3);
 DECLARE_EXPORT(__udivmoddi4);

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0


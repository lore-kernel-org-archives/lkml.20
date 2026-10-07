Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392742D746
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359951; cv=none; b=JPUXjEzLtptvmOJnLdViG736LVCT1BzvyFhts8X82d7UmSKkTV9GUxhz10KpN2q5LUB5K7G8EYaYuzbNyJt0WN3hy5Ia1M2O+ygMp8UiRbOuO3LDrskss53GFIlArNHh5xJhSImcGhvT6McErMK3DoBpPrz9naryb/rCd01m5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359951; c=relaxed/simple;
	bh=C7VdhqccnK39vg9uC8oo4T5dAfFhXtlKLiRZGHRwa9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r49oy/jplOIM8XNROYfICBvwT86Nsb1cJmU5FO6yOmimjCXmmBAUtExNatavFUP4Q+y3nB8nDS58bSNzTrfBjstXi+VwAhqNVul1tqbZzWB/mIdm46wtO4/burc413iULbOJM9czDlQlkj40Ebg0lsxauadOaQ58j7JDNjBhaa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QbTefDB5; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QbTefDB5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=N3FqlCamf1RaK/86xYXMFstxumfKZ4nSTmAXz/VobVA=; b=QbTefDB5PP5xDzY567uyGYVPi0
	cnCRhSvoXpMLxb+uc5dv5BOFgz/2hUtYHFO2SBY8ZKNkgsgJE1vOP4SwCQlWSN/zdkBWHcqpCtxF+
	5CLmZVI17UPQ4CXSsfwQqgJESw5izaDnoQMkA8PH8p1zeawDRJe8fVwlTnWdIRFTJtWmZLjD1UdSO
	Drpdmat9ieTwi3t/bwABYFjv/6JSLs/JbPjTO1ZO0UJzY8JTNCbYWba7mPYrSibIG8OALZaKRRVbi
	jdkBgSdcj+uFS+9RNMFwXdf9cQafaQkIiZcVTCJnFdvGK7zC6ysPrPHuER6944l5gtyIglyHW5awn
	P/oo2Mrw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xEMY0-004bIt-2x;
	Wed, 07 Oct 2026 07:58:45 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 07 Oct 2026 00:58:16 -0700
Subject: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
X-B4-Tracking: v=1; b=H4sIAJj7xWoC/x3MWwqAIBAF0K0M9zvB/DByKxEx6FRD9EAjgmjvQ
 WcB50GRrFIQ6EGWS4vuGwLVFSHOvE1iNCEQnHW+trYxnNehnBwXM3Ljo0s2+ZZREY4so97/1fX
 v+wEeFQ1CWwAAAA==
X-Change-ID: 20261007-arm_stack-fa76c2d0d69a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kas@kernel.org, kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384; i=leitao@debian.org;
 h=from:subject:message-id; bh=C7VdhqccnK39vg9uC8oo4T5dAfFhXtlKLiRZGHRwa9I=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqxfuwcBQoiEucUdx6S9JgEXkW997iGcXeZLKFZ
 ZehZvL716CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasX7sAAKCRA1o5Of/Hh3
 baxWD/48U2/+prIHfau8OQK9x/W3/mbkEMAIchsw5zICgIYPHLrqVvCQR1jlqrbj6bxflyKTp3J
 F4HlFm1Hs50ElWYd8cJR8kAg7eAIlJBeA10jvNGHdYNTPzsjHbTcrwL9AjQ24haeC7ySLkONboo
 G15H2qAE0gAVlkqjN4qrO1t8cI56EcEISpceNfksSsZZTob05sqLP0lywvvWN6yylG5HrhmvAjf
 x/nr+5ekZFDlZpaVYGCaJpSBlHi80sEZ0FTNV4tZ/IVu5Soo4cYKjWcs7as5j6Nq9pPdiQ/vV7W
 YOulAcCLq4yfatcEbVbMGzImEPtTXymtXUh6xS8ALse5fDea842mrhKnb2AZpjIzAJRg+TH530X
 HZFHRmqfvHlWLTtEOW95f/Lsfp+estabL6z7cBb9Xf7GZAhsyAPhq4I/mkPlTzfj9N4HUPKlQU3
 y8lEh+7CZ/cU1wzEpokgpkeacBdkwOgFpLs2dkfDMqjgu6mqEM3C5eIGpU8HcFQEZ2fS8bcCJr4
 L8GF5Ts2x9vYdAwQWK56t/8ou8lJdYd/vCTvC0tYiDj2rO4l4wdz4rbJLC3cMIF59VkY4yTBP6M
 IAInTvU9Kpn0GRs/ESCubm+cfw5gz0FQzBszWltscZKQruuNj4o2UBwyu/WkIR+7tnkuiTEXYif
 yFvB5DPRezZnyGg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
64K as well, we have enough room to keep cpumask on the stack, avoiding
extra alocation and possible performance penalties.

Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
page kernels are unchanged.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Based on Will presentation at LPC, I've decided to have a look at Meta's
stack usage, and I found that this might be an small optimization!?
---
 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5f2db2cecf9772..b73371327d2a47 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -111,7 +111,7 @@ config ARM64
 	select CLONE_BACKWARDS
 	select COMMON_CLK
 	select CPU_PM if (SUSPEND || CPU_IDLE)
-	select CPUMASK_OFFSTACK if NR_CPUS > 256
+	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
 	select DCACHE_WORD_ACCESS
 	select HAVE_EXTRA_IPI_TRACEPOINTS
 	select DYNAMIC_FTRACE if FUNCTION_TRACER

---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261007-arm_stack-fa76c2d0d69a

Best regards,
--  
Breno Leitao <leitao@debian.org>


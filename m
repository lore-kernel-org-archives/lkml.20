Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B3347533
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909309; cv=none; b=QKkuzKWNc8YPFTTtWkyqV3yqrqUAO21cgCUQ5I4HQ63Ktqil2a9izhh8V6KPX63USjdAwS0Unn/uM6osDbkkekJmiFjzmhJPFrHwPYi36NWH7VVazCcgUdRnry+qeUUkQ+Xi3uVQOsyJo58LVZrWXWjgqT1iclg6yLJtcpA+QqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909309; c=relaxed/simple;
	bh=1v4rUGAHqeIIUzXoY17LIgUNFnttk6dN9Qs+A+XFNmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f/91JJDV9rM4Tj2Rol3XIb/XzspWqHwrxNFBrslvjFW0VbVvsiKHvDiXLCZ9QozOTiWffHZh6EJt0vOpr8Kr5KyIbyiZldiYAXRDp33FUv9rxFE4zFLew1YjblJzlCrh0ZT2FUedq2Ia967POajbPjNBTsGbV+jW+5UPDbgeM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=H09l91JL; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="H09l91JL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=aOO3uoL9dHlF3J1MQewZ674HNYb6SMCTZDP8iIlVM+s=; b=H09l91JL4LjOvblcdAOe8rRR0v
	rruRwcjm7V+2CmdBIFNmw2PumM02xCQHUcWM2oLxMDhKFuuslsWG/UGvxCyNid3EyJPmsonYd8QBt
	UkXCF7l45+N7+htuBtMUSbfQQAw2qqnwCyEqUC0gS7NV+eqB6/z7bCIS0nuJoZED6TkYmFCayHBtg
	kQUqURX1wAOXJdf/z0Ec3tFy3rkSeZwhWq/+ehzHm2gaKAVppNWYZGtOyRm7NSGnU4qb7VK3lF/pn
	fCFB4wYR4fKpLlnereTQUFho2jFbhGXHjXElocKQHyFvWudWS11OVzvszwA6MrVEVKkjm8ihjEzH7
	LRRjlTFA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wzssp-00Gfqh-13;
	Fri, 28 Aug 2026 09:28:23 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 28 Aug 2026 02:28:18 -0700
Subject: [PATCH] arm64: trans_pgd: clone only the linear map that exists at
 runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
X-B4-Tracking: v=1; b=H4sIALFUkWoC/x3MQQqAIBBA0avErBswMamuEi00p5pFFmNIEN09a
 fkW/z+QSJgSDNUDQpkTH7GgqSuYNxdXQg7FoJW2qtMWvUEnuzV4iYsJzzVgdq1G5X3vjQmh6y2
 U+hRa+P7P4/S+H7liOFppAAAA
X-Change-ID: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=leitao@debian.org;
 h=from:subject:message-id; bh=1v4rUGAHqeIIUzXoY17LIgUNFnttk6dN9Qs+A+XFNmU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqkVSz8oIPrX6B495JDhRFq+yFUIe/STTeiiW4u
 CXbQubqER6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCapFUswAKCRA1o5Of/Hh3
 bdoHD/sGwFPrHJ9c7e0LCnK8ea+wnBksKBSIGYE3q6mm0qWym0odFdExThRRRJOW1GG0U+7dESV
 Tff8EKQF1Utkaqt74ovR0FBAGLUs2fCdzG8aXYWIvH56O5sB/L3Ln9d18dNya+floP+QTQ9djuy
 S7D0yDfwwpLfOyYYpeQcWA6BHoNqiK6Ljw2k6ZQnwDn1QJCxHQ5eg/TVujToD8Cfwbj6vycxTri
 D+/fFhBf6toA+ssFGCIe28MsBGE/KEE55lao3ICCbGuuH/4iVfGlXRynfPE2aDIk6tqlb2lGh4P
 gUv9MA89Uvf9B8Y+odDX+9uHdur2BFUb6P8CAIImIoIuYYL4NPqrInvdEF7sV5KCF9iSX/pNccu
 YxrbRqZC3H8Ryf5gkJfsSjbC3ZkquTI9wCWgjZ6yxr9hspHqBxWjZCsPQxvdc0SuiHlaQDbEhbZ
 02oXUFp6Hz6y41l/5qp6ToburZsH9ebSGPrNw2cDY2H0XTbfpBVotk1ZFn9kaJOyazY+VnYAkig
 QhHWWFM5m1L5uE5Zc0T7eeElQtk38kwB9vt/rlLQikrSKV1acJJUMWnZEAtBnZoCc2LdiZ9rZu4
 XehH/+JzGIc1Ap3Z4w9yZw+hGGNZKYd8dZ0iyqfpBebvDYciEqNHYefHNsKjX7IWvp6aC/UxVwI
 Cp7vNA/7LBZydcw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
it runs on a !FEAT_LPA2 host (such as my loving Grace machine).

That is because trans_pgd_create_copy() uses the compile time
PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
of LPA2). With the fifth level folded, pgd_none() is always false, so
the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
back to the same table: the whole kernel page table gets cloned 16
times, KASAN shadow included. Without KASAN it does not blow up, it just
wastes ~RAM/32 in page tables.

Fix it by copying the linear map that is the actual one, not the
compiled one.

Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/machine_kexec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index c5693a32e49b0..8f9bc2327dc85 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -129,7 +129,8 @@ int machine_kexec_post_load(struct kimage *kimage)
 	}
 
 	/* Create a copy of the linear map */
-	rc = trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE_END);
+	rc = trans_pgd_create_copy(&info, &trans_pgd,
+				   _PAGE_OFFSET(vabits_actual), PAGE_END);
 	if (rc)
 		return rc;
 	kimage->arch.ttbr1 = __pa(trans_pgd);

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896

Best regards,
--  
Breno Leitao <leitao@debian.org>


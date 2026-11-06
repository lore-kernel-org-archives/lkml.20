Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926847;
	b=ieUhF3xAdb4iettzFoUC4+5uAtHtB6jq+tu225ncSXVlf1L41LFoeyzhMI0ga3rD9FKM
	 B9UIurtIg4fRsQv9uMvc9oAKNNEpTI1E84Bp366l57dkzwBeH3vVCXd4M8SrnUnDqGPXJ
	 zxIMMb7BScrdTVLYgAMoBA+d9M3jwz9egkn6Nt8lrmKNuvmUsCTYje7QucN15luOSmheX
	 x+7ozQTyW1P5nPFumRkleRWPp9y5JmNn6Xl0pDzOiMqzth1HStQybTNdFr6dK3GLI8c/s
	 dq4FYsYsNyZi+TkyAHHb75O/gI14drhuQG/5In/G5t1V5x/1gZ0gGzgBVqf2RGgzw+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926847;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=07VnCDdZgrzdsG+27Xy41SOvbpr4/0B1ubxXinJ54D4=;
	b=kgrQbn1qSF5iIQBzbE09Ckswqbun1ps4lkz0IHpGYjspe2CDB/Y3MgAEoxUuBv5XAbJ9
	 U78+W80VN7JRFd6zTKdBDN+Fu4u7HygD1rgYRAZAp+cNwDieeQyTlQocT+73aJ1mZlFTJ
	 UCYOrdGlxCWxuG6HD3toGUypgOnXFRAD9dRWuAScW4Dm2vroX4hfsRCrWWKBW0KujOvKZ
	 NitRvHQ8L5fvyIvc4fwU3EMH0x/PaNftS32zoKvtIoynVtM+0elda7QsATTqIS0VzLGyX
	 Fopq2KKoC3hMbGpk8svwtix7NtNEq+Rs7C4JrHHm3eR8ADJ+ZP5ATorv2GuQWlnRFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDBeBjv6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E8606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDBeBjv6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9551F0089F;
	Fri,  6 Nov 2026 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793926846;
	bh=07VnCDdZgrzdsG+27Xy41SOvbpr4/0B1ubxXinJ54D4=;
	h=From:To:Cc:Subject:Date;
	b=QDBeBjv6NmLn18PB8g59CCbSZS4Z3hXFPUoxDHMbPPzaSVAZSnBOUzE6kur3wQ1XT
	 BzdQl055/pQj5sQEUqML6hIw+fqs7iB1LMjPjH986yMBbV13YyApbahkYIw3NEr55D
	 Z5mYlkFjyLOqwEFGkXn4dAbVwu09f5ElHiLTqH6eAZiGdLgclKF6xswaCRA/8jI7yG
	 GHzPyV6hJ8/xnYLnOZr0OU36aUPq/6NRtELg4gYgNCSDZtcysZ0vyU+XRWqmjs/dDy
	 uXgzfVKdBjcUGKRAa2jY+bCWeqkb4tisJSPdGDi5m6k5VULUHVe3QeGsVPV3PmPStE
	 Y8S8miXf5v9+g==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	shechenglong <shechenglong@xfusion.com>,
	Thorsten Blum <blum@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: Zenghui Yu <zenghui.yu@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: proton-pack: Remove redundant fallthrough statements
Date: Fri,  6 Nov 2026 01:59:52 +0100
Message-ID: <20261106005952.1369-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=blum@kernel.org; h=from:subject; bh=Xl6KJ6mk95FWXjn9wfGKPGwewowEPHLFqb1NTJTb9Bo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlv1TpPm0v++iOv1DmZhUm66Madze4X/7lskP82c/Zzt pjGjl03OkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiUoKMDL8kDpva3Nv8dIdT w/3Is77HOA4/kq2oWKkTXJwX0ivdqcjIsPKBlkHI5whef32xPSEt2i1NpdH3X67vKm8vuV9sJjC VFQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Consecutive switch labels do not need fallthrough statements. Remove the
redundant statements.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/proton-pack.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 8096f8069893..155504de3ab3 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -141,7 +141,6 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 
 		return sysfs_emit(buf, "Mitigation: %s%s\n", v2_str, bhb_str);
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return sysfs_emit(buf, "Vulnerable\n");
 	}
@@ -187,7 +186,6 @@ static enum mitigation_state spectre_v2_get_cpu_fw_mitigation_state(void)
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}
@@ -436,7 +434,6 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev,
 	case SPECTRE_MITIGATED:
 		return sysfs_emit(buf, "Mitigation: Speculative Store Bypass disabled via prctl\n");
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return sysfs_emit(buf, "Vulnerable\n");
 	}
@@ -480,11 +477,9 @@ static enum mitigation_state spectre_v4_get_cpu_fw_mitigation_state(void)
 	case SMCCC_RET_SUCCESS:
 		return SPECTRE_MITIGATED;
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
-		fallthrough;
 	case SMCCC_RET_NOT_REQUIRED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}
@@ -768,7 +763,6 @@ static int ssbd_prctl_get(struct task_struct *task)
 		/* Mitigations are disabled, so we're vulnerable. */
 		fallthrough;
 	case SPECTRE_VULNERABLE:
-		fallthrough;
 	default:
 		return PR_SPEC_ENABLE;
 	}
@@ -930,7 +924,6 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	case SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED:
 		return SPECTRE_UNAFFECTED;
 	default:
-		fallthrough;
 	case SMCCC_RET_NOT_SUPPORTED:
 		return SPECTRE_VULNERABLE;
 	}

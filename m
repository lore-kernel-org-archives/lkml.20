Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E8041B354
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395308; cv=none; b=NoCq4TpTUuFCPbLyEZWF+vrZMG70Daw1md7WNTFe7aqrI0csMJ5mtWSQAm3R+jk+O4Q7ACUhu56o0meS/r84Qpv/jAniSKvIQztvG+gQEDRxMYnrfQ4ob0GwqqE+ST4X+o9Zmd/gwEqfA3biooL/Sais2WD1OyvBIByyZe3E2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395308; c=relaxed/simple;
	bh=9Ffg9X/QeBldRPwWYPWHDU4RR+ZKTzOEQTX6vCnpD6Y=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=da1uaOq1m6J9L365GSvynOvq9Lhay2FVBWPcZ5//im6dOPwir4vkFJHtLt/pf4mmLLkWuYiHosSWSEZD5i7XAjR2dzUBn9CmqIhs/WFRsqByR3f+6sZKxsLu89GrmU/Mz7VMlVLCls95r2jmn/lgZIyljQx4HBA48fXD2/u9RkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=F/raKu+A; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="F/raKu+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395300; bh=OkGaZQMtatdbhRtunSxcljrUrcLCt+K0/924SAxOU4c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=F/raKu+ADTfY0n41tIvQ9yJWld5EPI/CGYDHzuQqhA0qU/8bKMyvT52CZMQM2A7eF
	 kGTs5Z3FPCdZQ48YOYhH5thYPFK4NSCcug3tjzLnUxUiQOkbsBPUZqlk5g800HDAef
	 b4kqmocI8IOUnJjfo/seYX+yYZemBhr9+tiNBPGc=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395297tch23zz7p
Message-ID: <tencent_42E06D8D14F5CCC231EB4A4C9AC4C42EA206@qq.com>
X-QQ-XMAILINFO: NGbyafB8LluuNF8Bc+cOnnyBpB03zh5VrWjCFBTBj7BGXhMzOCu+L9HZ3sHa50
	 4wh5UvDTKP2NidWcekytgMlBl4tXbv3qTYTbVxzRrYZXmL9ENborWqdO7qerqdu0bxlKa0ma7NN7
	 hLQEqcZVIvFZN1PTL/b6u81DNDS9oiLMCKylTkMF8mDyH9ZE0xS1/kvKL2dTEYOdh1loh9Pt1HA/
	 YHfs0q7uhh3RxNboclJVvxGXEAFGulIdBv1RqHC6O4FDtLV8Ffm7vlrJP8Df/C9lxf+AuI741htK
	 Yxp+UppaF1mbwguieFH0O72Ldkud8Md/DHk3w5upb+lSwJOCZTO6U9hAF7MBCbpfYL0SnFrysqPm
	 Wzluj71Q8jpBvUW+KFatE+D89W5Ucqgq08kLu/5UrcktQ5qe1fPZbpAr9HIKtHc7cssxvfkcBFEi
	 qU1VrexDIf8vckveqrc7X0Lk+FW8V8o0Teenu3iA6xsnUckpORyLtIlnEOfnemk202Cli9VtJglL
	 E5E8T42ljNOeuFHfbPDwZI8KWq0BMyTbxFXOCHENMWHq8s+RVhLWOnkiarKsdYFLXcNto61FXg2i
	 2iFjvTJFE9d3YidQEp8P4boHg8NfrePzZYVPCFfqXBa1zoPcvFREM/+vyZmhdy5XbHOH1HXprK4J
	 zaPBNdkmObZIvBC+3APnf9vQtBkgZEtEJpa5TedwEwVkLQjyC8UuvseyDpTelcYaXoAzx9P6Afbn
	 g64TSCM5n9FClFaPbFJi0F6E5IgauePpVVNarLWas1EL+kjLpRICQk1Vw1desjwEVmtradWVKyM0
	 plauuZi0MhsKk7V8tArIYMQN713UqYsv7kiXm56Y4jpwt9S1iF/Lp4WgNZuItDIBKPldymP7HZFR
	 pThqwUhZXVRMDv79muaSdtqc9rgEPyzdzwJu1PLioYpEOeH0bak9PhvLrYx2gCYlVd0+USxKt70z
	 AWcPiYPE/P6OReMiMjjtTpN/BO27H1Db95MOI66ElWKXZzszFdbwfkJZEYcZlBJmJx0Nry3pniSe
	 2S55GQIhOSxWWARoogaNixnFthxeQ=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 01/15] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are in limbo
Date: Mon, 19 Oct 2026 15:33:27 +0800
X-OQ-MSGID: <20261019073453.2142856-2-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
is found in the free list. On systems where RMIDs depend on CLOSIDs
(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
temporarily in limbo rather than permanently exhausted.

When userspace attempts to create a new monitoring group, a permanent
-ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
available once the limbo handler completes.

Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.

Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 73413cb128ea..da883adc3adc 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
 			return itr;
 	}
 
+	/*
+	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
+	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
+	 */
+	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+	    closid_num_dirty_rmid[closid])
+		return ERR_PTR(-EBUSY);
+
 	return ERR_PTR(-ENOSPC);
 }
 
-- 
2.43.0


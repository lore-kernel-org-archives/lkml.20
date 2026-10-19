Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FA48E0C0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395310; cv=none; b=UDMT2AkC+qoFNUCXpNiZD87iDYN4G/BYm7qiqhQv/EW6ngveGWAspUujD9Sh/eRWrQRcc0HbewwfwGYFVJvAIulKk6Qvc2Po0bGoVuSSe9ITXpCgydMmgw/Z+Q0Aq2vYXNYEDXoGGST/gLpsezFKRCbR+w/vIL3TR87/c2t3G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395310; c=relaxed/simple;
	bh=bppIoUpSl0QiFMOz5LQbVq47z4tIU7bqGZ+PKSrgGno=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pbITlAcQ0XB11dFWUgYNVfPzBnO62lESPyuzEVNNpscFETobVQZlCOrsyqMNNjuxqVwwChqUHeMiSLKVICcaAcsNuqZvLpb9sfzmcXodf6yaP6UfMJTZ51WB5Bbhko8RKFJTLDPxrMWL6zPtqQiFEohArvlRkWsx+8+HHEYsmqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=h6dfoB8j; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="h6dfoB8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395304; bh=H/sGcu72AUKwYwTGRnCjulLlUHw2FY61gFzLRgdbURo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=h6dfoB8jhPg4K8Lq+X3myP3x7bzoa6k00Ha0MsyHzCf2q4vU9X5FlgCdz7MwyBDXn
	 ChkPB7tXRtlpWvVTA9gbzXYITyK4wTjPPHj8CNxHA0yTsAW1cIFgHQZOfGq/wSiMVb
	 j6dm8v8PhNTLtfb0ZQXDKgsilfhTm/SfL53t0LFI=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395300tvlbc5y8e
Message-ID: <tencent_6E714C38215EDE224A09CD181D4BAF20A50A@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0CwwcaTYuWr38mfPboAkB8NFVxyoGMXTzgzesf52Xjef+MfksuYo
	 Rs3NBfXqBIwIB2J4fArWP0IlRxuKhCl/lsr0nOBcMJnwM4Kr8RNXg5CH/nZPiWK1er9xKDZZAm2q
	 5OjTRDeZJnxOicgCbDxI9xaLVk6aLJPwhhFdI7aDAdJDSJS6t34fK9uoy4FBR+ajE3T/n7+GbaV7
	 JIg9OTKvLGnfKC3quF0H5ZB3CZeZR5/al/uHtP/1IGOY+DrUZnAepExYK3Xa28BypVQDUHPGbqpA
	 oahifUtrJvwk4wYA+WbULtZy3XSa844cF3G/U7WakqIcF75PZ5/ybT6BhPHWDXV9eO5Hpgwg/NHG
	 DuCkXJ9GiVEpWrn6mAF+ijqcTqjGzd2p1koSGqocRMaXfp5vbuN5O/dc11ZssesqadSrFpjMG9GV
	 v0c1LtDXklOggdxkpvt1Ij015j4GQBZxpGa6RG1MigqmT1C0tO8JmiPwB/N3in++yXzMZDUW0Y3D
	 U4GZBmX+z+JlmpbDAcLh8IhtHYoqqV7xQFE3Dbg8p6NhvvM5I9poLyVdmcLzGNvBE67knmJ/+zbp
	 wcNftIGKUtIWPNB6rDIbQpOIP3FJQafr1G8c10ws6fUuUUcMbWKrLlLxNtJqAcHwYNK8l4HRUOSU
	 RvX/C0bnmwlCLHGqVx3NAbSn2Rzj5ZZ7N4SWBDcDx1FE6bbChGQFnyvrT5wSLWniagggMYY0MeOc
	 eDT8lNABycbc/GXf7v1DnmbYoHSKTzQy8y+FHt5d1uBk4U9wuvami8SJs/baNBGkmXpI7LffX3vC
	 k236b2tPgdcEGiSOqike+G4d667pQ0rBBmspMxwtUF+Xc3CIRDMCfrJsGscvnlNOFtLmA3lo3lcp
	 h6Gks7pZx65Na7uIqoeuFdaN+Bsw330TCAAsn4ApDh1nUjbW+iDan4OFdgEoPIFs3EBnly12SEbc
	 Sk6EQmfxevMFsaFjqVhYnRiyYOBN/xEfHnp/pHgRjyhDDqS4Q1W7JQPUVhpsCg73JziDxLSoWzDz
	 8rm281ZzzM0njBER7MLlyzZjDren7HoWb1A5KKzw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v10 03/15] arm_mpam: Fix error return in resctrl_arch_mon_ctx_alloc()
Date: Mon, 19 Oct 2026 15:33:29 +0800
X-OQ-MSGID: <20261019073453.2142856-4-2118537295@qq.com>
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

resctrl_arch_mon_ctx_alloc() stores the allocation result in a
heap-allocated int and returns the pointer unconditionally. When
allocation fails with anything other than a retryable -ENOSPC (e.g.
-EINVAL, -EOPNOTSUPP, or -ENOSPC with a pending signal), the caller
receives a valid heap pointer that IS_ERR() does not detect.

The caller then treats the error code as a monitor index: hardware
reads use an out-of-range index, and resctrl_arch_mon_ctx_free() hands
it to ida_free(), corrupting the allocator state.

Return ERR_PTR() when the allocation failed.

Fixes: 2a3c79c61539 ("arm_mpam: resctrl: Allow resctrl to allocate monitors")
Cc: James Morse <james.morse@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..945be7465ad3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -413,6 +413,13 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 	} while (*ret == -ENOSPC && !signal_pending(current));
 	finish_wait(&resctrl_mon_ctx_waiters, &wait);
 
+	if (*ret < 0) {
+		int err = *ret;
+
+		kfree(ret);
+		return ERR_PTR(err);
+	}
+
 	return ret;
 }
 
-- 
2.43.0


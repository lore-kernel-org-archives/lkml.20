Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296381;
	b=PXc1WB9TOJNxGAj0VfyORzrb9wjqMS9dfjqjVoev2gVY24GvYEm5fPBtUGyyuBuGtGN3
	 y21TQ9MUt/7IQT/vX7LJRX63A3oqkRyjsvr3slgc8h5lw8Vq6RXPidCul3nYsOpYNy/WP
	 84LS8txeKSCvlE5LF32k7pW3g9DEyLZieAIdQZ+beVV2w5ZKoq/NmVC2NQpB228WJcwlE
	 JGJNY1mKKux8cwMpWN/pRxaYI7yNIFMLim1ICFF2LsTi80bagD/+p5Q/jvZIEZZswR833
	 l1eS/Qia+oMfVaMLvxSSF+WGTdNY9H5D26Xb+hg8PQB2Dj8NzcC2KEbOd9Se/oTLTOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296381;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cRx0GOxhxfhLERhNm3p7CKI4SQfBnK7vX+eZW7yZMiM=;
	b=N/Dqw0EndNq1pdIYXW/DyPH0eMX/etzjZApwYuE/MyQPHKv/4PTn7/q9RfZ7R+cLx7Wx
	 u+SdF/YJzkZpQFdKpH9xDTyz+bDvS9kFjFVnzJj1qY7+5/vhMyqCA2GzhmYEYIx2l3JgH
	 bETtjPtVJ+OHk9Pz6b1DI8vLdxZjdbvh5R+GMVRJw06zonMr/Opn9TkX2lOzAiRVRwqdS
	 GCEA2mCmNDhQv87NPknB2qT6AMlu85l2VQiNJuXORvfWlJrmqqBZyYV4X6w/DjvX4lgJ/
	 Xr6IGbj4MwPqdZ2Cnjljosz3+6KikOth6LKsDM7MHn4qb0qJ0td9z57zBOVJnz0jhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dwus6jWM;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373F7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dwus6jWM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F1DA16F2;
	Thu, 29 Oct 2026 10:52:57 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3979A3F59E;
	Thu, 29 Oct 2026 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793296380; bh=OxLxREo/Qf1RsgcWUzTubgxXR6sWtp0XKHSiO9WyI3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwus6jWMApX65EEGcsQDaTpT6lCDKOIdlPSU7awmK6HFPULc/W5R+4NaN/lbIEVD3
	 1PXRO7g9pYZsnvt3LsgCpbe2IXs/okNPPTVioTaSVsFH3Ii09CMGASmKyuhcNG5sIX
	 f+9116doj55W9phdzlyQ8ZJlKR5D5cNN5UKcx46U=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
Date: Thu, 29 Oct 2026 17:52:38 +0000
Message-ID: <20261029175238.3214788-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029175238.3214788-1-weilin.chang@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
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

Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
in kvm_s2_fault_map()") created a variable to store the canonical IPA,
instead of calculating it when needed. It moved the aligning just before
mark_page_dirty_in_slot() to an earlier place but did not update the
comment.

Remove the stale part of the comment.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/mmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c7df646af79f..695c6229a216 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2232,11 +2232,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	kvm_fault_unlock(kvm);
 	kfree(mapping);
 
-	/*
-	 * Mark the page dirty only if the fault is handled successfully,
-	 * making sure we adjust the canonical IPA if the mapping size has
-	 * been updated (via a THP upgrade, for example).
-	 */
+	/* Mark the page dirty only if the fault is handled successfully. */
 	if (writable && !ret)
 		mark_page_dirty_in_slot(kvm, s2fd->memslot,
 					gpa_to_gfn(canonical_ipa));
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363515;
	b=2qzJsRBcL50hSTIL+Q5dHvZpzaPFMTK/IcCqQDpEqoZpqQAy/MUbWtxdt5XfJ+k1S3wm
	 gD+1aIctqc1e0YoNk8zgGRyvHK+1b33IsNrwkysQn0s5ZUmIRjKlY6hG4NEd8ZdXFPZE8
	 6NJp6NFtDW3GB/Vo58h7VXXfMT9WfFhydOaif5z4ZxUNciWoToGiqX20ITJv4lNrCCHzK
	 b3DuTCklsYxnOBU9giOVc79EH0xKdaORdWECRGc53+5U9Zm/4VnnYwigRBrRcNJQgsxeS
	 u2f5uOxa8MwcYDQjJLhqO1Fz93JgdvrpupmlEi+VmOQ8GjnQYt6MTdX9wT2qAAK31cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363515;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Flowmailer-Platform:Feedback-ID;
	bh=nrCVIt0iLjYvMWJchzfrWkAOaw7L3Fxelj65lORHoH4=;
	b=FpsQN8ujAI/jFdZfIYzc0OEYHoM9Li4y5q6xX4oHSk+wUOuuJeGI9ClvAYODx7m+/k1x
	 JbCC1pmerrCOsXD9DxOgAqw0dSK6qNFTOKlspbxZgCLoDF78S4G5hvIcXI3362pVyT8dn
	 kJiu/GeB1DhzPdW6WO8SB8TiQQH9TLUq8wf+FY3KFkFVSAI4roOOxYdtvWQ0hZDQWbzb6
	 Sg7popxsA4L3w9XoOc66SrHLUNK5+Vt2sV8ItGQN28BL4rHDL7EirVUG1bCRuMzGnQMWu
	 wDQQjsc/rtkyEuhinhK76kW3ctNVu1Grm1RKJ5nekC0HiunWKlAltc4+of/rtdBO53g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=opTZ2VO1;
	arc=none smtp.remote-ip=185.136.65.225
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63F606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E63F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=opTZ2VO1
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261030123149d9e9d4bfaa0002073f
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 13:31:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nrCVIt0iLjYvMWJchzfrWkAOaw7L3Fxelj65lORHoH4=;
 b=opTZ2VO1dLxqwC8l7i8OnngMubkj7Uov5FzLMzy3uHxe6gtGZH7suJcOk1lC+2SF069zlP
 n2DdWMRrpYBzOjhVVBt6J/Dwf0Sn2fmxTbQBJ4uPAM2y0YUsOLsf+o6ZhCy9Fm2Niduhz7FV
 PA0+Ivm32jj2oNVzZUqfIPa1nyEdQw2MhVw+YbvaOXu7rypcJoZrVKe4l9DqQt6TFha75PWt
 4v+KDw7dH7rDGfrK7nOkv1OgxWmAraKM8h2lD0bDvicLMvzi6cnOl4V3GErjjHxUz4LGFMSK
 O4XBea7Tx6s8qGrzpzgsnEc7gIQkyG+4XSXfl07SZR2JnPBoEN4DHSgg==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Fri, 30 Oct 2026 13:31:41 +0100
Subject: [PATCH 1/2] entry: Fix return type of syscall_trace_enter()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-wip-flo-fixup-entry-code-v1-1-7724c29e800b@siemens.com>
References: <20261030-wip-flo-fixup-entry-code-v1-0-7724c29e800b@siemens.com>
In-Reply-To: <20261030-wip-flo-fixup-entry-code-v1-0-7724c29e800b@siemens.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

All return values of syscall_trace_enter() were migrated to bool in
commit 71ff30013f19 ("entry: Make return type of syscall_trace_enter() bool"),
but the function declaration has not been updated.

Fixing that up now.

Fixes: 71ff30013f19 ("entry: Make return type of syscall_trace_enter() bool")
Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 include/linux/entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index fa2854fed1f289b9d2dffbc4bf70ab9927f36917..a8b2430eadc5f8500195454e24f86cd9e0d06614 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -62,7 +62,7 @@ void trace_syscall_enter(struct pt_regs *regs);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 void syscall_enter_audit(struct pt_regs *regs);
 
-static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
+static __always_inline bool syscall_trace_enter(struct pt_regs *regs, unsigned long work,
 						long syscall)
 {
 	/*

-- 
2.56.0


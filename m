Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6D468C38
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984526; cv=none; b=gNW1GuKr3Hk/V6SxU2OUXg+TB0la0l+IoKebya0dZr9ku8Sxhib867HhL7sRXoTbZQpe5MkCv9b2bhkhzl0lJ72jRpMP17Z0wQ5JUZxGaMN2NtSF92MkXDTmH3FcShMAw35X2eNRo2EaWDDcRa2/m3TgvcJFFBkxNIFdd1OKmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984526; c=relaxed/simple;
	bh=t61+VFVtE8EOj6JpiJSOYzszRz+2eirW6nwllU9BOYE=;
	h=To:Cc:From:Mime-Version:Date:References:Content-Type:Subject:
	 Message-Id:In-Reply-To; b=QADGIpbQPRzyfMkPA5k33IHSH2TfC12X5CCt5gxIQUp2AH3luJReYICsrelg79cJl0WBbztz7TMDEAV9AEYS1gpJwlbTSBol1rNvt2lux3cGfllq1KkQ0XIvMGckqVUsVCtz2A+/vx19zI2VlcXkMmoTki0BLGSPMsvZyVJkFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gb05Dh+B; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gb05Dh+B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984509; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=LgWZ+OUTM6vzTgLOIOm4srpsdcihjDcgdCtvNTUyPDA=;
 b=Gb05Dh+BqN83S53qmprLCT7W6ZzSvlUnt1J/ygfmm4+0Fawd4uHRYJdKVxY8/cdjNj5OQw
 8xifwf91ZJ+MxB2xcNgKkCk+A1qfKYO1xHl8tGEpXUjXmtZXz3OnuUKt/MNlEHRAYkPHCn
 erzRypjpJG5SDFKUOYAq6Yiwkgtg6uzapDL/OZcelSzPtuuCd4ix38sRZsuaLs/iDlqEOu
 2eFQVr6VDXQDU/AT9NBo571cFMl2GYM5wF55vwmPlnBxup7ZnEtmc+1GLD4lvj5zqyE9z3
 C7pSepbXJxV9xFGsuYgDDJyNAScke0uXtAuCCYgdVeMclXofKlHRvr1uTF4zMQ==
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
Date: Mon, 21 Sep 2026 17:53:57 +0800
Content-Transfer-Encoding: 7bit
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH 3/5] x86/mm: Extract the TLB range flush threshold check
Message-Id: <20260921095359.3784458-4-zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26ab0fefb+9df7f5+vger.kernel.org+zhouchuyi@bytedance.com>
In-Reply-To: <20260921095359.3784458-1-zhouchuyi@bytedance.com>

The decision to replace a range flush with a full flush is embedded in
init_flush_tlb_info(). Both mm and kernel flushes use this policy, but
the kernel path only needs the range and the decision, without the
mm-specific descriptor initialization.

Extract the threshold predicate into tlb_range_exceeds_ceiling()
and use it in init_flush_tlb_info(). Preserve the unsigned range
arithmetic, right-shift rounding and strict greater-than comparison.
Descriptor initialization and both flush paths remain unchanged.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/mm/tlb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 5e9d1689f605..f0dfeb271c66 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1373,6 +1373,12 @@ void flush_tlb_multi(const struct cpumask *cpumask,
  */
 unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
 
+static bool tlb_range_exceeds_ceiling(unsigned long start, unsigned long end,
+				      unsigned int stride_shift)
+{
+	return ((end - start) >> stride_shift) > tlb_single_page_flush_ceiling;
+}
+
 static void init_flush_tlb_info(struct flush_tlb_info *info,
 				struct mm_struct *mm,
 				unsigned long start, unsigned long end,
@@ -1383,7 +1389,7 @@ static void init_flush_tlb_info(struct flush_tlb_info *info,
 	 * If the number of flushes is so large that a full flush
 	 * would be faster, do a full flush.
 	 */
-	if ((end - start) >> stride_shift > tlb_single_page_flush_ceiling) {
+	if (tlb_range_exceeds_ceiling(start, end, stride_shift)) {
 		start	= 0;
 		end	= TLB_FLUSH_ALL;
 	}
-- 
2.20.1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299366;
	b=4THeXl6dKfiHEfcyj7GbTQPuVWe2Cx7v2urUCdx0yOWbbJWNwM08KB+UgVyVeZI22Ax6
	 IrT2OuErAdQaM3ikcdWJz5CBIQaSRYPV3aRxGrS1Ebgw29hiHPJQ2STOF/Oq3dsOZ6Qyu
	 YDQhFTBxNv68LjbTSPoC56I1RvG/l/pjUQ0IfGM6xr2YsHCmMxBsOPYF2F74RdwP6baZP
	 dUZnpbZ0UV61eXkZKgAF/Rk7yzM0jKugRQ0cg+nlKTMI38d10Uh2abHRxBm2UO3mbVrop
	 AR5Ye8Ku+0sExubiCgcHxEaZLQAJOHcAlJvgewxSsxHdP/YVmY2NFdIoUm/QDtdBdRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299366;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Mime-Version:Subject:Date:
	 In-Reply-To:To:Content-Transfer-Encoding:X-Original-From:X-Mailer:
	 From:X-Lms-Return-Path:References:Content-Type:Cc;
	bh=QJutcj2Vfr3bTgnnrpEfuJPU1+aSMSofXuqGawMVFoQ=;
	b=o/T1t7LGQN3iDLFOq9fBxbOsc6TsBSF/kj0JzCfxR3QgodrnEP1va6iFyXgbrKdYUuS4
	 z9+9o0AGOjto/Mc4MQ/ddDy9lx5lI/Rj3DZEnx0gHf7B6IIZBysHwkrtXqjZoaemjRml3
	 0UJK+lRyJ7lzZbHghY9aky5k+z+fKRA6C4Xrl+NI1fSBb84p++lfIr18cr24uOzLHXEfV
	 ZwKTLMnF/i4NHAmrWqmOxKp8N9ZhHr6x7AH7z0waVUERxA87/UA8eQDcFhf3KLp3LFjP1
	 SBfMCeq0ElcWwve9+JYlzNQGcOKA7WZIkSHjfCUHvFQt91jS7VthLNJ92yU8S/GkUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=U+dFpc0P;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827AF606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827AF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=U+dFpc0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299359; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=QJutcj2Vfr3bTgnnrpEfuJPU1+aSMSofXuqGawMVFoQ=;
 b=U+dFpc0P5+JHgxWbixnxiaIw+T+fr0pvBfQyECHqunSGScmRLLiw7q4MFzti/1NqvXDuBL
 q67AoAF3UrS0YWJ8xb6Fv2BjkghTjlJ94ZOSh5j6DZ4yFbCFyjiw+B6hj8wtF/3/nYuwdR
 9vYSBNrORUvWIcs2pDUwUyjH4WWiy9labB3Lx8TXSIzQpLYYW36J4BSb9hprBgVBZQ4WGd
 5+Vj+4hxgOmpQg6foLqQyqzX6OBL3SbFppcys5bi1xn53u1L2wUFUycGnPyNWxsnBEc+0M
 4RD6aclvDsDk/BILoxGnyuEU85S0OW6wwgRE/OEsnFxTBFeNrF3zjnABEDYZhQ==
Message-Id: <fd6a8920a01811413788cbb2ad80239b058a5c86.1794235715.git.zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Subject: [PATCH RESEND v3 3/5] x86/mm: Extract the TLB range flush threshold check
Date: Tue, 10 Nov 2026 16:28:04 +0800
In-Reply-To: <cover.1794235715.git.zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26af2d5dd+449e8f+vger.kernel.org+zhouchuyi@bytedance.com>
References: <cover.1794235715.git.zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>

The decision to replace a range flush with a full flush is embedded in
init_flush_tlb_info(). Both mm and kernel flushes use this policy, but
the kernel path only needs the range and the decision, without the
mm-specific descriptor initialization.

Extract the threshold predicate into tlb_range_exceeds_ceiling()
and use it in init_flush_tlb_info(). Preserve the unsigned range
arithmetic, right-shift rounding and strict greater-than comparison.
Descriptor initialization and both flush paths remain unchanged.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/mm/tlb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 9a7465a0065f..7ed4e5cbd563 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1379,6 +1379,12 @@ void flush_tlb_multi(const struct cpumask *cpumask,
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
@@ -1389,7 +1395,7 @@ static void init_flush_tlb_info(struct flush_tlb_info *info,
 	 * If the number of flushes is so large that a full flush
 	 * would be faster, do a full flush.
 	 */
-	if ((end - start) >> stride_shift > tlb_single_page_flush_ceiling) {
+	if (tlb_range_exceeds_ceiling(start, end, stride_shift)) {
 		start	= 0;
 		end	= TLB_FLUSH_ALL;
 	}

Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFA739DBCC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776589; cv=none; b=lKkv61i/bkiBThCJlpcrMX60Ai5jCbyQMsqa3WtdELpQ1KcDq3FyR2nAhoRYJagFtDvRxR17h2eCUZd6zn7yCua9vyLcbtHBleWzlVoXP9SpuxQRVTA/jpiyKHi4pCa1z+AoUpoqR2eerlW9/+7KaNIOHjxm49yG/vNyOb6n81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776589; c=relaxed/simple;
	bh=6QVUN++x+i2KQsMnuazWopZVwNo1ydnWKtchm7bw71A=;
	h=Subject:Mime-Version:In-Reply-To:Cc:From:Content-Type:Date:
	 Message-Id:References:To; b=KrgLHs1CnSjvGxEHKWpoOsG6a6ci56b+dipjrFHoXg72bdwhkuwp3NqmzFHXYfIeKc0y80NZDoeM0psnFLx/0CC/PYiM3fAMxorgiUouTR7KIbOiCUJWGTTdmu2yDHphSbwiumXCcS/n+eFyEfDDnVWAyfvLw+7PpvCxaWVRxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hZ6BsyU8; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hZ6BsyU8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776575; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=LZUUkT63PE7Yak0o2pnbzPKzmTZ2y59n1Gd3QtnUm8w=;
 b=hZ6BsyU8YuzKIsqFcWhRyHh3+/gyHRcSiHRNUkipBDFdo0QqJ4zgqodsjOWO+SxJVV3uh5
 6nyZPTUXVuwPQdP9wnKORKrggaRj+ntnLcaHT6TG49vV26oj4B4Dv2ZgN2dBSgo9lhvQ7C
 myUc0dK1uJQ/8CLOqrkQ7UvknhO0Jmvi7H7oBzd34+DHTr9h6NPL/Arxs7GfDR7jj6n6TP
 dNx6rgM3667NBfGirTnA1ThJoc6S4i4Lzl+C5uiLXtOCRI37n/XJ52GLZ6scrXepRUAcgP
 8IzVWSH4jIQIoUDiJd0wFE+KVb4gZwq+WGkZI9e8pNp1eahi9krjanQUI9OYVw==
Subject: [PATCH v3 3/5] x86/mm: Extract the TLB range flush threshold check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26acc573e+78ac2d+vger.kernel.org+zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 11:41:23 +0800
Message-Id: <94658de1ddd0cbde299ab115ce90b5f5c60aa303.1791443164.git.zhouchuyi@bytedance.com>
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>

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
index 5a1b96c61050..0d03011c6825 100644
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

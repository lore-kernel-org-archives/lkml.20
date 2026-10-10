Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C83C81B5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622080; cv=none; b=F2g2b0B9Oi9aKYLqVSL+qSJDh2HLLuVqACJmwKxsVO0wXF5QoTds0dbe5wNpWGarioXnEM9/yhv+xuTOTfORtKGeRJoMLwNzCCFlhMzeiqnEbk1JoTLkbe45VMtNMcg8QlxgAHpXS6atH2aDE1rizIXpblPN6T/2z+fnnNect0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622080; c=relaxed/simple;
	bh=EeZqUFoqaIsW5Cx6AmU0xug2Ti1qbwb1p6zR5gzwmwg=;
	h=Cc:Date:Mime-Version:To:Subject:References:Content-Type:From:
	 Message-Id:In-Reply-To; b=npMpDBt0Awx3uyeNWDcs4LNZL83x6GIWIwWmpdl4PVbZoLZwDzPZn8F7YVn4Y9aw/hljrgWI8GT1AFQg2hpcjpCJsb3qEYUmqVkc3M4TdWRV69IuIxxyky4pnioye3cwWM/N1QToBBFAeRzm7c/dpf6NnV80+oY6KSXGedDpWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Dz7OK+FC; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Dz7OK+FC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791622067; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WCo5NPKaCfP7g9DBT1HMo+1v4Rsy+b8BT+qecwvrSuI=;
 b=Dz7OK+FCLL3nAY72Q7e5wpk5GDDSYjdAeUUorkpN8Q6UtoUx8jRFpV+EBhEOfGVRqTeq0T
 fSJEcf7hZWP3wtCSRs4tJUyLIsWL4S/8nrW5GfD8T4mG/FX7Yq4qCO3k8Q/l6B1c2/zD5C
 YEZv6vuZfIGOOm4Lbwv5y0LObz4SkI5p2q+5OzZgyN/EiAzyICNgpxHi6pVOAiMPgnqN4b
 GmHqMmt0Vc3jy9OEsmzooe1WzbOPFA2P/DEuHW4NIZgbdMrYBn0qgnW9B/2GxoYN0J1e8B
 I+teL+8sgVCXDzk2qmvLwJ1p/yzXTvDQf9k+HyU8BFPfAF+IdECqcjE+rh5T6Q==
Cc: <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>, 
	<dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>, 
	<stable@vger.kernel.org>
Date: Sat, 10 Oct 2026 16:47:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
Subject: [PATCH 1/3] arm64/module: Fix big-endian breakage in late data relocations
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20261010084721.2197683-2-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26ac9fbb1+bb0ab3+vger.kernel.org+qirui.001@bytedance.com>
In-Reply-To: <20261010084721.2197683-1-qirui.001@bytedance.com>

The WRITE_PLACE macro declares its temporary value with the type of the
source argument:

    __typeof__(val) __val = (val);

For the 16-bit and 32-bit data relocations in reloc_data(), val is the
s64 result of do_reloc(), so __val is an 8-byte integer.  When the
module is already loaded (state != MODULE_STATE_UNFORMED), the macro
hands the address of __val to aarch64_insn_copy() and asks it to copy
only sizeof(*place) -- 2 or 4 -- bytes.

aarch64_insn_copy() performs a raw byte copy with no endian conversion.
On a big-endian kernel the most significant bytes of the s64 sit at the
lowest address, so copying only the first 2/4 bytes grabs the
sign-extension upper half instead of the computed relocation value,
corrupting the patched location.  The UNFORMED direct-assignment path
is unaffected because the compiler narrows the s64 to the destination
type.

Type the temporary after the destination element instead.

Fixes: 91b89a634487d5614e51ee773a889ed57f5551ca ("arm64/module: Use text-poke API for late relocations.")
Cc: stable@vger.kernel.org
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/arm64/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..0fdf4c1c4e05 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -50,7 +50,7 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 }
 
 #define WRITE_PLACE(place, val, mod) do {				\
-	__typeof__(val) __val = (val);					\
+	__typeof__(*place) __val = (val);					\
 									\
 	if (mod->state == MODULE_STATE_UNFORMED)			\
 		*(place) = __val;					\
-- 
2.20.1

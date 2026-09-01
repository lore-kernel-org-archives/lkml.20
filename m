Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5548822F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281610; cv=none; b=DjLes1OQG7W4h8Wi2BvtzmYSMtl1n5KSKZ5cnUhW06qL6H30Gx7uPDXW2ddsoXlqFc9xtHPxv+KWg6XhOK/ae4+P0KFERSXF0oKJFvkARNA/tXtLLe9XoH0HCUm+OemTZCwSYTHA3rYMS/oNlq3BGibAgt052VQAptfbY4qTADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281610; c=relaxed/simple;
	bh=squ2/WWAcdohgZLxBFYUBJsHlYKv+W9L9O8kulq9Ks4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVlsQtlzeUQwqz5ofi/p93LnQRU+gIw7MOgzIry/i9Y2yE7CX53ovpSACT5fmk0SyoeKGmox2+0u4iZQevjXTCST6TFnhIMIbAsl/bBg7XNEIWufW6dsZf3m2bD5kU7w8l+wP5DDpDEewpetbiqrB7Y9DKg1QIAOztbAr5Ydisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIkgYBCq; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIkgYBCq"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5335cf904so48214915ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281609; x=1788886409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLxdIeL3CrxbJdHdwQq7AqwqMv3skQXpBgUpwkYf6+A=;
        b=LIkgYBCqT1LbRksMuP+VwDEAHf397+asyinrPTFpGQXwnN/2zruuCCQJdb3WMfQzWz
         JAh6zF4t+ZgHQUCQxJwlsHuYXZMLSuvBzuoWObsr+jOMtSimp7e3Cjeeg/u5xwvUIXNv
         F9H5G8aIEZ8C+69L55egx3ftMDO88b9mgRgXkX/LV9RLb0z8x/BC4+vZ1CCGqVfdnh4w
         vcpj5OTx6rMhisO07juHQqXgV41RBTwySxUQK0yfPCcGw0UZRk6WG+RwzjHDpY814YM+
         IsvpobmPR/AYcL4gKvYRWFrWiUkElTLGs5mUgGECTP0JiwO55vbZKzFtlEMv4mplQWXv
         GuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281609; x=1788886409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLxdIeL3CrxbJdHdwQq7AqwqMv3skQXpBgUpwkYf6+A=;
        b=qUAjkSmNsWgJ+ew9j6rmJPgiPlLs9TBAjJx0MyzZcAzBLPxXBlXaDNIjZJQZbnX7yn
         lNCHVcx33EeMq1fXlEWITiFxRoMlM7p1KYFBzuy+Uyzx7xMTK2srE3epwD+x+ReMOr7a
         zPrdTXTl8siIbKzqH9GXcJGzqrLoenlVVDS6uGukdZN7NYQ9vzsmIlAIPSFirGyEBAaD
         rBl1JDUChCj2Cwj2T6k2wOfG5ekis8ImNawDNYB8V34JR+/vkTY55TuAH+ZRosos/l7s
         b5/+akeqMPwSxkCvRdqLpCL+GPQlphlRmDE0no/riBALX+ev91uP/88xMkJ4zbgjnPuj
         NVQQ==
X-Gm-Message-State: AFuF++kUOX9q8TIRPcslMAVGZS5GFpDgE4hUJayzlCrXe0TLx+Zuq7Ak
	RcXc2mtE51z22Yb+aCQpl8mS+fqpqsSXmVqacQSW0FZBuDFARQJ5Gvwt
X-Gm-Gg: AYBFou3Y707tid1N38uyxFhlF0mlMjFB9gYNDuchO5PT4QAPpt6wV2VjxWtni8EN0/Q
	qhb8s3D9aiyOMjFKhhubSIqOp29rIr30fwPUJHq7NOl+8kEGVYIFQrDEwJCxLH6URYA0ognANyH
	HE8VkyMxt1xT5ys4vWWu9H9ELrCKY353R8IZY0enGY9NMAWxNt8Ftqk+ir0//2ksDdTV7dXTIki
	ZCHHqdSxSYQjGnmwxDdvWF64jWbnQ2miNDFtDSU1+m+e3FthrODJdQ7cGb6bUGS1eE9UbGvjxHg
	3WkZtYW5TrQeIPhKal2wOPInEm2Kr++4MB/vewiDw9sd7hPSn2x2a7CPya8oeh5U6QDJcQOuNx+
	af5C5QlMBEJb+AVoRixOK3E3bW/yLnf6u6ETBYgDwgayG9+PmYA50MGF6+YbEB63H3XoswamVqP
	OvrdtUNG88+6udDBK9q0HkUNmfq6B5JOH3jrBvMdjqYdqXFfBPptgNVS8=
X-Received: by 2002:a17:902:cf0f:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d94a703f61mr138707735ad.2.1788281608492;
        Tue, 01 Sep 2026 09:53:28 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357efbsm1762325ad.4.2026.09.01.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:53:26 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 3/4] percpu: remove unnecessary cpumask_clear() in pcpu_build_alloc_info()
Date: Wed,  2 Sep 2026 01:53:03 +0900
Message-ID: <20260901165307.1026248-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901165307.1026248-1-ekffu200098@gmail.com>
References: <20260901165307.1026248-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_build_alloc_info() clears mask and unconditionally sets it to
cpu_possible_mask. Nothing uses it in between, so cpumask_clear() has
no effect.

Remove unnecessary cpumask_clear().

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/percpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index f222b43cc90a..45f3e3fda2f9 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2828,7 +2828,6 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 	/* this function may be called multiple times */
 	memset(group_map, 0, sizeof(group_map));
 	memset(group_cnt, 0, sizeof(group_cnt));
-	cpumask_clear(&mask);
 
 	/* calculate size_sum and ensure dyn_size is enough for early alloc */
 	size_sum = PFN_ALIGN(static_size + reserved_size +
-- 
2.43.0


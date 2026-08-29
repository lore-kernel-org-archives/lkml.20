Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5421A434
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023500; cv=none; b=G1EDJbGumz3mF2G/NtXLOTceHAsSjsDnJl1itdrnLV7gtpsL8bPlnV30R3rCTTdKm81/TC3OcpagPoAP9IsaaehaCSTKLSTmFVpJ/KPcH4sG1GJd5ZQp9qzWym75e3Cqe4fDXnHAfCjQy+UwUlBN0fCzRrF5QVYVHodT/qxLR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023500; c=relaxed/simple;
	bh=Xqtq2mHIJA+xbl4aLCVOC9RtrabydrpAmcDh/0IeXsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfXR5zqGFY9R+3QqUxD9XZXU2TUMb7k3kSQZVMltpm6RRWCUdlKIzoHl1zlVVH4+1NvgCxsWNY2gBYwajuWVeJ7E5wDOrUQRAfKPxAPGn/tyyPzLCOc/8TX4Pup0VVQLAPC/srNSxChdfIDgK5pvWi0OcISb3ceNjdNY7o6nmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am2wLIGs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am2wLIGs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so16269665e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023492; x=1788628292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eCHp0mkiyGBMAqKC0slmIwdkyokeuXLEojYHEhzvrA=;
        b=Am2wLIGsK1DVAZGuPM56JmxXmogln506Uh9P3z9bZPSA9TydZuAY9nW1UWMBB9VNSu
         HuLMtXAjf8i8AthBoqQUGdVFMoTEMh29vqPthV5CThUikko9oe5EaDcl6YPzrBCmamtM
         b/tboTTxJRc0Bgb/WZ46cpT3O2qq9pPPKM1t5TmT5iM+JCoYwriyu9qM/PpzkWPIbYdV
         TwvY4iR9ulsmk+VVDpMCYy0a0SHdk6+EnsmFVx56wdXu06I9UEXw75dsk7UvLk82n8H7
         mVb48FAq5dm3qokbFvZRnwdb0ovbgRwLX5zEnVu775Af4ROBiIzQtRCUBFXdCcASPdwG
         pnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023492; x=1788628292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eCHp0mkiyGBMAqKC0slmIwdkyokeuXLEojYHEhzvrA=;
        b=dCHXcgi2QYrCcblVB8N4RdGptgjxxK+OaTYsp4Fnwvolero3M3kS8nwWZkm5mvDXxx
         GqfqJD93BpIVDk+yi24bE4OpIltuOOSr2VvSKz4Efw/0pVHt5h6RUaCJbLX++TJMxFEC
         W1zsDPHUvGexU7xY+78fTel3itgarwB+Rh2tu5fUfqzsKZZTEduPm+G/xCAoRABqI468
         2RhdV1HuVh4DyOWuV/+htnpDpUeTGkbI4LIIAKLthUvB0Kgz2tZbNs1cJmtcna6LEF3p
         tYp0uUyK7aMbxgJjL4g1KJ7QXxBdfoLI73AXRGuSQjTbMYCd/ww/SjPo7lL3pNpvPYyJ
         9xRg==
X-Forwarded-Encrypted: i=1; AHgh+Roj9BD0S8/qK9V2jC3ACAvilllsdkIe4+GNTwLvJjZQ4t9B7cXasHpxhV97N4nKZWQgY+pkIzMYEOigbJA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJC9ar7MMdYzSu+7eBLOBSjsquDfcUtfKDrhKnWrqNkZPJZ53f
	FK81l1YOAs8cWxGG0eWguJJTAksws3OsKcAWORY9KKW/CdpwkJ+TXHkL
X-Gm-Gg: AR+sD13NlR3ebkHs7C9lahJrQktWR7lbxzYdUAOBvA29/slkuLeLJ7kec4ilX595C7X
	zcezseIk0twYSoeHh0tzAbCLPwsn9Js9y3CVC0EWalBduKeg1gWJmawDMtX45YVCs7vFQjsFjBf
	Iehu4xjtisse2R+auufc2iaD9fS592SNvYjoLDq2OsEVyRM6vLgy52kc7ZtGmLNr/lsJLhTPvu6
	vxd0Cz9NjiSkOzhcMID3fMcQ//Adfj0cM7+WdiaOklXA9VMWbaoxCE+uXR40axgs/GA3CZ9gmyO
	DSEKUQDlCnc73eNoVTzfXqY2IMeG6+Kl4r/Kdxxf5TwWnroZpBi1WY9aKZyQVat4kMUJKNWi6Sj
	Jxsf9ns8uMYWoXvKkNlXkWoRO9Atkv6/cmXJfougy1clkTBLrckHxzzdbPHHsSI0q36TFvl3sM/
	CvjEIEhoIQOKIJBwKdgjJfnWvNhRnZC0qdIICDM7NvxuR5qkllX9VmMUkmFBqwX+IlqUpDzvCx8
	9930SB92A==
X-Received: by 2002:a05:600c:a02:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49b91c52579mr198169545e9.14.1788023491596;
        Sat, 29 Aug 2026 10:11:31 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4cef:8600:c993:2682:3ff:b27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c7cfsm154861105e9.11.2026.08.29.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:11:31 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v3 2/2] mm/memory: return -ENOMEM for page-table allocation failure in insert_pages()
Date: Sat, 29 Aug 2026 20:11:13 +0300
Message-ID: <9d990c3ed43608e674d4b12a8c221a09fd200f49.1788022178.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788022178.git.thnkslprpt@gmail.com>
References: <cover.1788022178.git.thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

walk_to_pmd() returns NULL only when p4d_alloc(), pud_alloc(), or
pmd_alloc() fails. These are page-table allocation failures, but
insert_pages() currently reports them as -EFAULT.

Return -ENOMEM instead, consistent with the subsequent pte_alloc()
failure and with the single-page insert_page() path, which reports
failure of the same page-table allocation chain as -ENOMEM.

Address and range validation failures in vm_insert_pages() continue to
return -EFAULT. Keep the later -EFAULT return for
pte_offset_map_lock(), which is not an allocation failure.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2561dc6bdde6..27ffe1a99a08 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2569,7 +2569,7 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
 more:
 	pmd = walk_to_pmd(mm, addr);
 	if (!pmd) {
-		err = -EFAULT;
+		err = -ENOMEM;
 		goto out;
 	}
 
-- 
2.43.0


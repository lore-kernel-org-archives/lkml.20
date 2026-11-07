Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059429;
	b=txY70cN9dh2cXhbywF03NnvhrUMwvvu810xW1ndLjRRRD1ExzDtWv00YdKE8etWyYdg5
	 Hil33RtV/SEPEKux3EFwYmMw+AfyAQZhfnsTqlso5KOvrVr9vo8+cHBKfuex2z0diXUgg
	 TRDEQ3CNC34K/u848C2v75PDuR+hmhzlKFQmxwgwcENjxQn4C2Fur/5j5XxlTevnyYzph
	 eDlAs7kgimrhIa4jOqJv2vrxm/eY2k9wU20YjQO/9Nv9Jqaa/WzGqXDKHGGVlHoVn2Yzw
	 a4cg0t7CX+i1qK6nccIDvobSklAyvMk12u2/EeNhYPwhHBh7MkPxOGusb17Z8jTpi9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=;
	b=hNeUWU5aJjYi7K8L1rE6J+pNj5Usy2bRlmJk4oz9X8G/3JP5WTEr38j7nuvY8H8a0REK
	 ppQpV/YsyMvhA6Jk0g6W5jPvhFACrUZcGNafsORvNpkVGMyGKFQ03Y5TPgJkz4DA3Qsp0
	 LfHYCsUUILtItOZ1Iigp5Flfq1Kgbl25D15fvgvvMFCC7KdF+YGAfbsbq7r/DCQundswM
	 kFFh4CEABDQpwE819+gVgc7lQAMSMsv9syOnRtnwtR55INXHcYsZ1r564i26piduhLq0h
	 cWR6olRFeMgG7uBQEbyfCDUjvw9zr+zoypWWhesL6GczKKibdebyb8dCMlGm0FeKPRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQQsScKA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684B606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1684B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQQsScKA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e795af1d4so480596eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059428; x=1794664228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=;
        b=sQQsScKANne8TY2kumkASigzcMR8xdjA6G7w335g2YZ8J5GvOBwZK5kXyOqbgWEXur
         0y8cS8J6bKJNkjeabK0V4O7OAlktxOiGEJHhCghU5LdN0UKr/52RGJIVWZvXSTjhoein
         7/hSYnBSkT5xeY5zAUFSIny4NAC4NhlDQEnOQZHbIQe0Se1gFSCXTu+dn4bm5uL09D3/
         I8+N4KVW28ftqStphmKFuYPFEhhzSvsXWqJRWxmb2UGTGT29siTxg0NndDXP1npwDgzj
         jiSGJfhBofJ4/9VENuSqZibs4h3OYWWE16V48aAeRA0PW8MhDfCR5Fl5e0mcdB2nmU8y
         i09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059428; x=1794664228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=;
        b=qsmwIrcZSnDjEhFCdOmzzTHPtAs0Avooh+d9DLzxMkyTFtwEwW4Fk3WB9yqGBPzqW4
         0k8GpitMA5CKev8c63eW6pnELw1KZHSjLT5DW9krI0MLDGR7t4QQByLpIVRGMtI8MxwD
         gPZV0Vvfd+NiTokzO2DeGZgxTwg3wqupS+tkbz1aj5lJwMvP9iJh7d/mZpMOK3FK7OXH
         WWpRwasKE+j74XkbQZX74pFi/pQYHJ7gBWdYcyr73sgH4DNNxQEhts078Tx7gbliTLPF
         7cAS3noX8nM6mF9Z7oymDQCh92D9tmkO1SIP3DDCjcX2b3r++0NZvapZ6swoj4rHMM/h
         Dgpg==
X-Forwarded-Encrypted: i=1; AKwUvByUdCAAbeaRh1H2Vd5SHA9bWKLVz35b2B+PnN/qE5lz6Ogl3xH6mJfjdbCDRO4p3Zua/vDiaqAjD2n7eOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y+sKFIo2pt8ZCfJlTNprkPk+18glAep3hnFSA/E/HjhWQ2aLH
	8GG6OlcWA01gXiY4F6OuIF5LtsPuxmTjniEoAlVv0VdVe1fpdAGF+NY+
X-Gm-Gg: AYBFou0yTxB4bfn5LZGjR0lbol6o+JHPrO7gw/d96QM69MOvC+prSYdigpaCyhIYM3K
	9AAPgPYfj5mgUYDucgHYTDZhb813fL25gWNrWM8ltQGF8IWwZ+KUmLrt4lvTPa279QZFZwn97Oa
	BGSEK1Zsnww/BYaGJ73Gee4OZ4cjeh8aw4pdJEfl4+6KWencVP4/E3PYsQOwXVIqV5T2K4QxdCW
	Cw1s+IDMmCDg52oYuEDrHyaqvBmzTmSrANDrPItAjxdg4DENu5N1Po+kypU5MgKU5PEpP00B6X2
	CfIsoBHh1uRdhm6B0DkSdRcadS5t1eHgVG0GfOVPSfPcXkx5rAshvN+MsjyFlv7PaUSH5oJew9j
	l5RA5hGUIi3Oe7D7xlorvHRNyZLNUN5+gfeFqWgYayQ8Wg+CC6rJXy0D9tM6SkbGySywtqhBA7t
	5M8inTowM0qilRCXD3YLSMFijQh71FsJpcjhzx3hBSNa4qHFE9Osojqy48SMjmcO8cjKCAIi/Qa
	Nj7zosjmQMVHoLbkU9WUa+QXQQPeO7s9v6QDWFtHr0rnCsz25Zm0IhT9QeVLCVYJHBd4J2rRB12
	kGnjhOvk/AayrcmgGww5R5pTMcLgHc2YiuZLJZkF0fEi04PyShi4i53rFg==
X-Received: by 2002:a05:7300:c00c:10b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-370f7c856a4mr3702462eec.21.1794059427852;
        Sat, 07 Nov 2026 05:50:27 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:27 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Sat,  7 Nov 2026 21:49:47 +0800
Message-Id: <20261107134953.748622-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses vmap_pte_set_huge()/vmap_pte_clear_huge(),
mm/vmalloc.c is no longer a caller of set_huge_pte_at() on arm64. The
only remaining callers passing &init_mm are in arch/powerpc, which uses
its own implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa6..ce247b06fe03d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1


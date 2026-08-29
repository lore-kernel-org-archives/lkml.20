Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA633264C1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989620; cv=none; b=CcZAcu2xcGKE2PybUGCCOXHfaSAELHH5dYBcAJ/bkHAjQPyNPCvdA+zB8XINOtHPFODOklENlF2DUXs4mfnMOhK9VxeRKlFv5s2j6JcqBlDc/6tTnrUgPIOwVnmfcT1/3jfwk9FdaNEMlJR3XVm2JbNnBr4CAf77eQkkemsdIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989620; c=relaxed/simple;
	bh=xHcpGAf/1y+7HzUaEjIKyAZ/SYP2aVkR+0WjUUOVHak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7ALZbpTZnKGI5aOcPey+DipTIoUhOUT2JDMUyq66aD21yNFVQObBWJUmqPS7tVf3g+RmMe0C+tZYvfwdvl8lOEdk2mniVkdFpwL2NFHUaNQE5pBx6s9wWxS1N+GDtypTNE/6WL/vfxl0sYPGVrBiW6CUjLDkJf0vR9T1ODXlYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlQ7cl3t; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlQ7cl3t"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1901019b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989618; x=1788594418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPBa7pHbP53WE2M6DUPslMFnjHFqwGfpa+1GCbbSTEE=;
        b=BlQ7cl3tZDEE/m/md//p+G1JPPyJ96+hCWyxHFEq34rkVPhUq9Vfd39+XPAAs/Lm8V
         iuHrOK9iMnUrNYYX+He/6KqZWY9DXhXwtRPKeWotx6/4B4iLImU5d18lVimWV3giU+dk
         AoncfZSg4B5p7zq1vguWqPjIk1wSUL4z+zapzLD7uIf/QmdTYYdcKW+HMgooIBMj4f2y
         K3HR0IAs9TgSRLoiVfYMfKxyaIFiJNPi70TGFMj8wLxXs+WLqngKP6oMr9CPW6GRfs3J
         1ybuehJQpuuM0xVJ8bdp96YsnpycHZe7d9xwdhdeUNn5qBIXeOlaizoWbNgcvmDez6P/
         pJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989618; x=1788594418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPBa7pHbP53WE2M6DUPslMFnjHFqwGfpa+1GCbbSTEE=;
        b=gdNf2LfuG7BTfo4yXZ/KJ9RSU6YQcgxxA+XNMJf61OA92xsGuvbsmChnAIBklQQltE
         njE4LKQzEPuwogQfMYkpk87eGtDcxOQyMbjssubiiK/eGbGBjOuqjMwTVHZ8Uwa5xmys
         Ps7zr+AlW1mgRZvnEpOR5odi//7y5RWcEUJ/xjy1fV/ADtPVYwjJgrrtkModaW8Z8cSh
         dVqznTr3bdQSg/IgvJ/Xb48lvjHGMErhc262HRB1Y/R1sa3MWCpj5EVnTitfkJV/Txnh
         6GF7y4mLdnSrfKXO3OJXYn8Cu0Du9ZmLXygGYray+Ph0IxYrmQfEsixe6xGFUvoo8/L+
         sUhA==
X-Gm-Message-State: AFuF++khFrZPrwxeQV9kmGJzMMcAkxdF7aVAB6gYjD82fSzdLNkBIETw
	teDDUfTXc9W6tK/aHLbyw+rXFLKL171TIIh0Whtd6EnsIqF1xEVLLdVL
X-Gm-Gg: AR+sD11hkjVrf+gsTawiGFASAiN3WZ5303BNBwDbKBKkdAo6B4NULGU+zB1Ua2v6llv
	e836OMWZ7/eyFy55U/dQV4Yvyuz0X3WpXfRoqAUDi/C9rms1UvWCbpengQQn9ebiYJ38zUj85vC
	RG8FSrHmzj1lo99qBiqt4Mnk4USphthX0+e5qHJ41x1j5+jWpDixOVaCUkt7mGMWLJ7Wa6UmrFz
	qJ0G8C33619s+IBnjVpNWIM1uFsVrlkiN1pFhxjqTJmLflclwX8cBfkrP5iGD1ZFN/bXXZ6rfXS
	kKhCb45gRgTSBHJiI/gan61jivzGoodKKoXL3Y09Sv9hwNspExN7HJUKC0VFpa0s+N+aawo5CKN
	A+SZowoZJqf5v7w/MIKpPhtAsT9GCJ0hhuwu4ajBBmwxounUJwlLFw8pr8Y8hAT3XxXLTyhHIAP
	eKlYCGLYzbBbNGKmmF1Zx4tiEQeSgSYnWO4+eythkLHI9w/PZlwi9KFuYGlHbbNPaSvJjGUDLME
	TXPOflqji/+I8IBo9j+zy4+l17CPNI0+LXwprk=
X-Received: by 2002:a05:6a00:7607:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-85772baffdfmr7291395b3a.26.1787989618074;
        Sat, 29 Aug 2026 00:46:58 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa79d0asm1310439b3a.14.2026.08.29.00.46.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:46:57 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 01/13] mm/swap: remove unused parameter for reading swap header
Date: Sat, 29 Aug 2026 15:46:49 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-1-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

No feature change, just a minor cleanup.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swapfile.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 53bf01d5f7f1..0f962cdfa5c0 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3467,9 +3467,8 @@ __weak unsigned long arch_max_swapfile_size(void)
 	return generic_max_swapfile_size();
 }
 
-static unsigned long read_swap_header(struct swap_info_struct *si,
-					union swap_header *swap_header,
-					struct inode *inode)
+static unsigned long read_swap_header(union swap_header *swap_header,
+				      struct inode *inode)
 {
 	int i;
 	unsigned long maxpages;
@@ -3700,7 +3699,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	}
 	swap_header = kmap_local_folio(folio, 0);
 
-	maxpages = read_swap_header(si, swap_header, inode);
+	maxpages = read_swap_header(swap_header, inode);
 	if (unlikely(!maxpages)) {
 		error = -EINVAL;
 		goto bad_swap_unlock_inode;

base-commit: aeddb4d52acfcc5ce5e988acd48f2906fe966ca3
-- 
2.55.0


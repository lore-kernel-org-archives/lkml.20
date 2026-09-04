Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F124756D3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519096; cv=none; b=Mb27HQxaHF+CD3ORbHlNxcn8CztZzCdiPWxm+Xf6oyt1iHvLoD8m8vTLrSDVv1+JWAsn0flvPe14ebnVjzcezUUUc7UzTgwMC2o7QEtkci7zHFiqyAfdLQp29vSzwgtf0coD6ELk8IaOSWCe30tTYzhKSbNO1BI2AEITkaPmGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519096; c=relaxed/simple;
	bh=xMt9gTMb7RE42HPBBjGzAkc7GVu4UuFIy6tJSPyr2ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLJgRKkXmgjyKsSHqKly65MPJgjGBO9ycrkzmeTeTRHKwvbBoOD5LE34EBqUejMfxPxRns1NzOaiL3mb5j9Cl0NKXP8p0r8QZqTM6WDlHI0m0m4n/VBLy01FExjk3DWbtIxmQH0FfttF+PexRCmfH6D1wEQM1spO38F68F67MSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEY82bd+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEY82bd+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso712689a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519095; x=1789123895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ0+R6z1eGmwIz9sAFaUEUApTH+cEU6FvzDuPLwSm70=;
        b=aEY82bd+5UiqReXjPJrOtuRg6Yb0KgpFV8L4hHJFzRBYgc23WUUhCp+HSxYjj68b13
         2qqVY8K0QjF1luBrhHzK/ZGODsGJy0lg2qqN/2In+8p1YugRS+k51awf4eu7kGDS5ZQN
         Hw14m7ZsPybYhTxx8339Ph0jvo/9hIs9mp193OAviCsv2B3Qi6NrCi15RdkU/oczblMC
         WS2dtxaKsK3aKJ33WcMdny5TEX5p3fy0vK0MagkaccCigL437jgkyHV89mWorfezisq9
         jTwV1RLHn9vSh8xw3I9W/gbaVJ4cBVBB4vfUdenm64MIps0EnTc9oBLRTF6tBLPo14QL
         Glhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519095; x=1789123895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZ0+R6z1eGmwIz9sAFaUEUApTH+cEU6FvzDuPLwSm70=;
        b=Ohm9W3g8T4PBrm1YcDIzQKqVytWyVdOktupKwj3+58Bh+WWf56YPBGEloJZHJYmvOx
         CoSYH/JKuMhcHUc85SUICAEJ0ZU75x1OFhw4Qjr/2NjbXcfnpRBb610pAMJTHGTiqUX8
         O3+sa5OYhKgu8WEnbDKKClOlFUeec3/2DYwUESVmBiQT20F4CQYBO+GWXIhdDKTohcv6
         G6xrm+n2chWPlTcWkUNk78v5G3+V0Rt0vBxME+qEmm62MYACoMq6UqImo4cmJ2ritJly
         jHO4UGdUpb3yNg7MuRd/4mqyh0a5wP2+DqVd8FCzgkLrFucPWA1f6O8dvR1BmNMwMJk9
         QJtQ==
X-Gm-Message-State: AFuF++nI/FwZN6e3++h/YGK4HPST+tVT5e8lrJXC+ZTZlJs7wQ8HiuYu
	LF84jE0KPKOIUjDbcy1JtAtorBVfoO91HD43sMj+gm+pABBSVyqlJjZK
X-Gm-Gg: AYBFou2kdgp6QkFdN4cbmUWiqZeQEOKn2/RYvUhal80BWjJGzAenluoFtRGnfYq9VOi
	N6U3dbd4oRKE5tEewho+CPOaBUnHHklaj4FD1LZxIHmkcdyZEU/EGfloCYRlgeR5wmQz4nKbs0t
	pRXCwh/ETdyig7j5xBkJEuRiNufnxvWSNcxnoWDBE0BSGWl4pTYzBnYqcdYH5agRh71DkCXkg6z
	S0mfTm7Q4Vm3eitDcpH6a5MeckXuvy7cqxyPRYJeb3eSdyhbTkspw++XFaWUzwam0z8tVMKXkcl
	pDmeAHy4gkaByaWoIM2oUZFu0s/j9FmLudDxkVg2ml93HOH5ZmPTNZ//oVlkOHP7tUNBOnIePCB
	LV18rMIna6xsTiPlCW53wxxd7C2+w5eO0/tq5Sd8FPTkvPTmVBOnN2MAzsXKWbjlT6Ntn2QPi8b
	CwTaUuLEsA7pmFVDcBl+qkke40UXKRdWR9dtoC3LDd24UjJEdkRM6DV8+MF370VhZgvrzwzUEuz
	H4j6Egpr7Nenrw=
X-Received: by 2002:a17:90b:5826:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39b261b07b6mr8253370a91.10.1788519094870;
        Fri, 04 Sep 2026 03:51:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: include: fix repeated word 'to' in comment
Date: Fri,  4 Sep 2026 16:21:10 +0530
Message-ID: <20260904105114.29474-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'to', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 09d7c00cf405..526ee54c0d33 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -139,7 +139,7 @@ static inline bool __pure lpa2_is_enabled(void)
 
 /*
  * Page types used via Permission Indirection Extension (PIE). PIE uses
- * the USER, DBM, PXN and UXN bits to to generate an index which is used
+ * the USER, DBM, PXN and UXN bits to generate an index which is used
  * to look up the actual permission in PIR_ELx and PIRE0_EL1. We define
  * combinations we use on non-PIE systems with the same encoding, for
  * convenience these are listed here as comments as are the unallocated
-- 
2.48.1


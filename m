Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542C5369D61
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405427; cv=none; b=lh6ew3U5hbViO66c0+6xamXSWQXX2xEc5YeB9sigSDXv9NOjo6W48LHGnRln79Br9Rzu0Dm4MMpHyCkbroFqEY1FosGKf68Gg9OFKc7CAw8vYyZjoPAHnVoT6vVgApYskjBH1HaFVeGnXL45NtZjqExdwADCx2EztbJrN9P1k/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405427; c=relaxed/simple;
	bh=uh3PjXoLjosxsg+DIsuL1EOEHL16VgIJEnVi4iERdns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8l3IZzL/MSuW+UneRgTjTCi5hwrqfPBhX2a/q5a9c5JAsJYRuodYHUfwdpyz7ssUhMZqHFe9gGPKZTdC6DKpbF5yIAd6xyafR1esvFbSQOXB64B/MFB7RMdXl3Qqrr8xHNxHPlNj3sDN44A3LryELUDvUE7ugI4BbmZzPF3l9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgZbhmcI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgZbhmcI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71a50caa9so25068855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405426; x=1789010226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ry9aZAR4rOnvuBv9WAZuiM8CW7iBdIw7/zNBIgTZE4=;
        b=XgZbhmcIord8qddUxjh9ZF05p4x9Kn2vmIbmxSyrUmTV3UTyvZI3fxcZ+wP8VxJOJe
         EhqSM6o+STzLiD/4UR2mBiE+zgrb6zuFmA8yyAvjdhi7kYAunWx5bSIAcVcGe4UGX7gI
         1eQpFazPTeetc2v9audCvMYOou3B3eEXbbr1x10DVPHPLHsU7q7JUK95YQ6gFsP5pi3p
         OlJQeHwRqewTwlSh44Qgp3wwHmemkd1yGvRpV2bfZkiFXdMYEIqytWFBr6YKFRTF8TkZ
         U1sb25tcqSIfbhYXe9UTWxERzQnSLiNl4iw2sJTFDasEDYsAzceCO7rnPweYG6NpcOZ/
         qJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405426; x=1789010226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ry9aZAR4rOnvuBv9WAZuiM8CW7iBdIw7/zNBIgTZE4=;
        b=SbvOg+Hv5QMLWeI4K4aRFeQudlugPy3qEdICMOsWBk8aLbZaekxe+VKH7uSN0u3CLt
         P4EeyvzyPKTCm/Ri0vrYz3itKiXFnspkImkQyKhdftbrYPIMCNQLY51KrP4evJ+97j6e
         eNW2QTka8JruCL8z30/urpeXfus9Y4+XWEdbG7wNTRrasHPsg8bLOFvb1lM+OhU8N/ZE
         JnjCSrgcyhw6zbgwyJ7/0KkG4luQYTLFtd5EEuR7r3JImMx8EBte6lkdFi3g7TTTass2
         dW9inii+JYLgNyXN9v3lo5RuwM4DM9wURSg6/ErUvVLydgN57yt9YRK+cFgWjAdQw1PW
         16zw==
X-Forwarded-Encrypted: i=1; AKwUvBxCO4JozlWm1c3lDkjxiY2j1HD8rA7DrISyKemn52/RXnkFfuOxi/1kTOhPFeQ3/DhFlYQ5YMcPOgYd/Kg=@vger.kernel.org
X-Gm-Message-State: AFuF++niEJf04LmCI/GgRnpoQUK4vQ8C0w5yKKeK+dNeTrmNE3mTIIvn
	cbOoglOtKHqOWXGtJzBZcxR6by6gLCWMzKqDbaZZHJ5qaEvISVYJpQ4e
X-Gm-Gg: AYBFou0lcgwChgxmYOXJx87rX3MiAnDNiMMszOV6m2UpiPxnqEOeiNShxJA49Qo4Yr4
	kXU1XyJATWxC9DSY99fzokgvi9icBBi6JD1qYoezFkBVovZcD1BhTNViB7XEvsiEW21Sf4FCw6V
	l8r9vomfI1YdcxL+VHnwZQ1VL+2DYvl5qQZOynbdrkiCDB/fJrJw+9WdK3omJ2B7ZD6yqE3htnq
	IBPO30mDgEZ5G1rB8te8uKpZ0gBKLBGtY4IMMwX9ofZBIQvR8Eg6G7u/lRAKST5hEfHtWXNm7+V
	N4I2cwRMBa4MINTgR5kkzt0UkNhqEkP1HxMxuPY/4nMaD7ypQ0HpH0rztiWubNdjAUnQeBbvFLc
	dcbJR46Q92EdilYETnlKV9rs7sm7iUqqJpyZYmkz6EbhNKl7awMU3WsWc5ZI5756xMI8TrRbrWw
	iGTWLMWspJTh2EuOcE/GGiHs0lzeRXjVmuuf64i1JbJcEi3bHRCdyo9BWVfIGdtlGqrQqSn1Wnc
	7g=
X-Received: by 2002:a17:903:2290:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2daec62c280mr119641375ad.7.1788405425604;
        Wed, 02 Sep 2026 20:17:05 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d1d1sm2831855ad.24.2026.09.02.20.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:17:04 -0700 (PDT)
From: Vernon Yang <vernon2gm@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	david@kernel.org
Cc: hpa@zytor.com,
	rmclure@linux.ibm.com,
	andrew+kernel@donnellan.id.au,
	pasha.tatashin@soleen.com,
	kas@kernel.org,
	tj@kernel.org,
	rppt@kernel.org,
	rick.p.edgecombe@intel.com,
	yu-cheng.yu@intel.com,
	orsonpeters@gmail.com,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	Vernon Yang <yanglincheng@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] x86/mm: Fix pmd_modify() dropping the dirty bit
Date: Thu,  3 Sep 2026 11:16:08 +0800
Message-ID: <20260903031608.1194238-1-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

pmd_modify() masks the old value with (_HPAGE_CHG_MASK & ~_PAGE_DIRTY),
silently discarding the hardware dirty bit.  The subsequent
pmd_mksaveddirty() call is supposed to transfer _PAGE_DIRTY into
_PAGE_SAVED_DIRTY when write-protecting, but the dirty bit was already
stripped from the value, so there is nothing left to transfer.

Contrast with pte_modify(), which keeps _PAGE_DIRTY_BITS in its mask,
and pud_modify(), which keeps _HPAGE_CHG_MASK untouched: pmd_modify()
is the odd one out.  Any pmd_modify() on a writable, dirty PMD loses
the dirty state.

One visible consequence is data loss with MADV_FREE on PMD-mapped THP:

    memset(buf, 0x5A, size);          // PMD-mapped THP, PMD dirty
    madvise(buf, size, MADV_FREE);    // PMD cleaned but left writable,
                                      // folio marked lazyfree
    memset(buf, 0x5A, size);          // hardware sets _PAGE_DIRTY again
    mprotect(buf, size, PROT_READ);   // pmd_modify() drops the dirty bit
    mprotect(buf, size, PROT_READ|PROT_WRITE);
    // ... memory pressure ...

Reclaim (e.g. under memcg pressure) then finds the lazyfree folio with
no dirty bit set anywhere and frees it in
__discard_anon_folio_pmd_locked(), even though the data was rewritten
after MADV_FREE; subsequent reads fault in fresh zero pages.  NUMA
hinting alone can trigger the same loss, as do_huge_pmd_numa_page()
restores the PMD through pmd_modify() as well.

PMD-mapped file THPs are affected too: mprotect()/NUMA hinting dropping
the dirty bit means rewritten data is never written back.

Fix it by keeping _PAGE_DIRTY in the preserved mask, exactly like
pte_modify() and pud_modify() do.  The existing
pmd_mksaveddirty()/pmd_clear_saveddirty() pair then performs the
hardware-dirty <-> saved-dirty transition based on the write bit,
preserving the shadow-stack encoding rules.

Closes: https://lore.kernel.org/r/CAJxLxMUGu1-L+O_nAONOwOXnS=cNbNApCWqdthRjd76LThtSPg@mail.gmail.com/
Fixes: bb3aadf7d446 ("x86/mm: Start actually marking _PAGE_SAVED_DIRTY")
Cc: stable@vger.kernel.org
Signed-off-by: Vernon Yang <yanglincheng@kylinos.cn>
---
 arch/x86/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index d5f4917c1edc..d551120a7c88 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -806,7 +806,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	pmdval_t val = pmd_val(pmd), oldval = val;
 	pmd_t pmd_result;
 
-	val &= (_HPAGE_CHG_MASK & ~_PAGE_DIRTY);
+	val &= _HPAGE_CHG_MASK;
 	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
 	val = flip_protnone_guard(oldval, val, PHYSICAL_PMD_PAGE_MASK);
 
-- 
2.53.0


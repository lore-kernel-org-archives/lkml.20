Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB171530E0F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002636; cv=none; b=XqAKe+hUORXN1AbQbJHvhZJS3D8F17YhGYT6PzKI5CGVoJ25k/Vc+hQfJ6R7yPi71WnqE0bmZN1cYw3vOJCGZJMv1/lbXlfsiz8sZFUuKs27SQHS//D7kfWnXusRynvcAKfpS7CFQrcTEX0GSVuT2W54A2XKS7GZMW01cPYGHOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002636; c=relaxed/simple;
	bh=3W2lDUFdYZ2Hsq57D5LYR7SZI1bhIdjcA4ZjEzjvL7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnAcOAYXYbhqEyx3x2IjZmjKBf3VjLaqG+tKbypoKczBG5PHIpd0QEigla+MSdtlUEZpgV1BujC+FLc3v8uG3AyhLtnpleQpClMKy4PJ+o2Xun9j4slqA2pfz28XcDtdwirGcXIMXoHQ++Mtc/rBMrwbYnTH+fr1sd2L/FeHvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bYQYKzRR; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bYQYKzRR"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e76469b93so49890085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792002634; x=1792607434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnT5ptqor5qmMMV7Ow2caqqAnK7B10eCBBMNhfxBzB8=;
        b=bYQYKzRRvgtkocL7sx0ieZXAH4y9W70UpDKACp/DZM13hDb0fujVmc/HgeFRDIY2oK
         yfdO64AjgDD0nnXziUrB2f072JbkElivz6AI5+AXEpKRltVbW9LFG9AWEBfrcbwU1iv0
         AtgZ41GgyVeTh4+Im+3N7KQZlrjG8Yam9cvP6HjMKK2jLaNzjUrVLUqfuTBGtTRxVIvR
         G4n33Py9h2w1BwRMUxpM669oTZz1406sn3t+7PaPbDHXEdf7/s1gqcIOIWg+1d3ss7WR
         PzK+N97psKAmZK4ekigJCKRC+JYpkB0poGhSsXwHXnlPhV/HUvRqOQHK0uUgq8+W4j/V
         jsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002634; x=1792607434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnT5ptqor5qmMMV7Ow2caqqAnK7B10eCBBMNhfxBzB8=;
        b=WO67cY4Qa8Hk81+GtDiK6oq5zsaDofaoKgtzg1lkekqKr/CVnRUY3D9D20F7tmolm+
         sAWvlUqdiURYMFJcSuNtKFcjxlcr4WN1InAHmidwe9fr3txFi8VPXrMgs59g6Br5nwwf
         bnIJta8NSnYG4apoArW6pcF+/N7siWK4+wbTTF/vkC0L+GP2zjuQc0rlD6cPAk5L6746
         Nv8oCV1SbE5nWCAMbtOwUqF+Joa0LF97Brmwt1FXo4tzvevjv4sxU83PV1r2DQOTsGEB
         B0AeMV292WSILPosJxfj6LtISH1N2OjjdmCmapYG1uF72K8qJYP59ffFcu1MN8R0yuZK
         jv3w==
X-Gm-Message-State: AFq9FYJ8ydSszmXpupVrHf4Xe4y3VPSrHVffTNiq07vbr2yWutj5uuI6
	taLOM6iHMYo8Y7FOqFnDGeCQu3RQaYJBYdrYnhaQvuKjoPfq4vMmxxnkaiyDyXsZK24=
X-Gm-Gg: AYBFou25eeIvzz2qXyRhmpJ46uJ6vwLE527rk4qFlqpXlTIczrkfcvYzVuRM8S7xqES
	gfvlJA+QLQHolJgmC29Sdn8yW5qXfLTo9R9MVcnurvcuRGAGnjbbSFtkJ/5+/2lYXVbmMH372tu
	126Qzn7z2fvAgGbH0jyfyQc2RRFRdp+xcqUlIDbj4Ay45ZQNQ4FUn3QCjmt784FqoWr+9k6jSz1
	ZzH/5jdFgcJgEyG45jj5YfvUfH5+/LmfB0ZTwgOOT11fuOL77FNsOUYjnovPul5AUxa8l/5V7VU
	OtC6H34Mi/GzkjpX8DSW97lQXwqleIV10JTlLh/aTM2kOcgoHpiobWwbKte8whTsHXchtZ9M1vj
	eI7tEBrIrOyW4j+ogAH2tHgFoZQsJTvr+gcDbtgrV8nn3K7sZRclEbyyskeQRchSIzjqtaj3IDT
	uNY3u/gupv5ygV8ECvi5voGDQ/RDeF3S7swL0CnFrKuIm8D3vIaj/9Hsd/S18JGTHxkvk1nwqQU
	KwRcIM90NY/9RylCPbMBmRJ85+pjz1lWohyVx5ASi0ZMr7GSYBdLK9GZLt0
X-Received: by 2002:a05:620a:1720:b0:93b:d7a3:45cf with SMTP id af79cd13be357-93ebd29005cmr2604633085a.56.1792002633778;
        Wed, 14 Oct 2026 11:30:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef508811esm556593085a.36.2026.10.14.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:30:33 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com
Subject: [PATCH v2 03/10] mm/madvise: use the PMD softleaf validity helper
Date: Wed, 14 Oct 2026 14:30:17 -0400
Message-ID: <20261014183024.2075709-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014183024.2075709-1-gourry@gourry.net>
References: <20261014183024.2075709-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A non-present huge PMD must contain a software leaf type supported at
PMD level. The open-coded check names the currently supported migration
and device-private entries instead of expressing that invariant.

Use pmd_is_valid_softleaf() so the validation follows the central
definition of valid PMD softleaf entries.

No functional change intended.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b0ce4ececba0..d3edc056ef57 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -430,8 +430,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 		orig_pmd = *pmd;
 		if (unlikely(!pmd_present(orig_pmd))) {
-			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
-					!pmd_is_device_private_entry(orig_pmd));
+			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
 			goto huge_unlock;
 		}
 
-- 
2.56.0


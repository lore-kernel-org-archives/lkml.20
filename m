Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED5489871
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281613; cv=none; b=n8y1KouNjsMKArygYgMMv9UJ06kHoRl5uLxdXCxy71cwgE0TUys24XLeP31fDg/TeHKeudJNNGMSFZo9WJQYyDIkCqmAi/2BI6pRf8hZzbrVOq+3VM46jKOdXNCkrdRpQFHOvSsjdd43dJ0HtcNjEJri/rZEek1GSq2JxJgjoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281613; c=relaxed/simple;
	bh=/OtcdeoyA+dsLwnS9SssXwiC2NqdImhgWABW3Q3BAOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sg7pvbajl3ohNgCPLX6aTL4gkNUtPlI4ZA+CYVCMDOKoLxOTxrW0j/CJGrd+nDvyce/g6STeR2d5oYQ5vgNzBR6ilTFEiM4GjjY/pa8ecoIrez/rtX2kwiM3cOS+kgr7+d54E2XwwcZk8IgkH2dGs5xrh68q1cCd/2Lpaqohx3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKPctYc3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKPctYc3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d944747d41so81175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281612; x=1788886412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R77RQ3EcQv+pz1+HV7gALVgNstOExEkgXHTcwGFLmOI=;
        b=OKPctYc350sJTPMvC45pYVHTZ2CdbfPiMMBA9M0v2xyznctFU91zt/m2CbTuvsqufS
         6KvZ1guS/FBr3VkcvO6pSFrOUHss/CfiUioOHSo2UPtvM4UUk0kyvkPyeN+H0sh0gp1Z
         NMR5jrj3GX012cHsC9E/5etK5SsSUPCiQyEEqgWXnaVzxYfomZemixIbCagzN3p19gVh
         Vfbry/KgvL8y733YafwS4ry4Rjx+kSnsIq7YcmgMS9zNSP6oG1il1ozk2OFgbgmhFvZA
         h45vMHAbouOUK4OBG4cGfMuh/bUd5lMghTSdguQwe8+GUhxbINnedoWikkYh9PL0Y/tt
         mUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281612; x=1788886412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R77RQ3EcQv+pz1+HV7gALVgNstOExEkgXHTcwGFLmOI=;
        b=bsaVXelWJONd/Q5S/mdalZ5i/AsECLhLuwfAPXNIGScQXKSQTZErpUEas72gnNnp8h
         Suxb6l2SWhLfnNckHGtKpXqRwDbxJGmdStSWNlcGILESmJoFNW4tQ/xNw/GXRq8ciyF0
         4uC038str0WVDbd9ymyim3a/IA19YhQtDvMU0t+Do0ax7LLEcHp94GJtz8lMF51jIxAd
         m5QySTKKgM8NXXWFffimTMcRZSS88eTJfMb02oEepnE1fi/IW9l1K4mMLQZgeXATkfbY
         S2YgdJJn5Zhq2GA4YIzzSNXxnQvFmYJ/zC8RsvL65I4qh+Y1YHCZ4X41mFmBnIqRjh3A
         EZ5Q==
X-Gm-Message-State: AFuF++lamK31DqIYZGIQfqY9JR37p1mW/HKF+950yaRn/srBBOUHPzML
	E+J/G8F41irAKCupFl1RbN2YHqG/sFnibERulA/ii/nDlgvyHzde3HI3
X-Gm-Gg: AYBFou0ffrLYbRjrGM1LrmHei+1tuUcqIdwJrp6j5IU0CX5aWXOjya9xEQU/bB+MaSt
	lhiJ+3ZQWFFAPPkKI9HfZ3HFYK0SLstfuscD+XYsCRKGDMBU7ahuXu5UF1rPlpoTyyCmPiGo+rR
	Vrc/yKx+eoDjzVSlM98FpQa+iqhMjxmEyxmao/9cWYTch4BSAtnm5nc8fWSbRNUMn21UVVcf52t
	GnB34Rz6/GRYLrpW9wuk85DxoI1/U9ROCn+r6EQcYa5Ura6F2srW3v7im641N6fzpQmfYFsQA+E
	EsCnLO/2pu6Y2XbyKNOKFahIBY8r916CxM9s8H+93nXiWFsatgg6wm5l0aT1rG+tIuKmLRItle2
	bh/PldeZ0EN00fE0GUqjga8YegzFnGR57smNuO5HaidFJiyWdAdG/TD3M+2Tz3JYQR3IxJtUFFf
	7cJ8YwNKrStfYvSm422BGSa5PkRbauuXkadhWPm/IUnUVWnMB+QSWnu5I=
X-Received: by 2002:a17:902:f786:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2d8d4ce836bmr420465125ad.18.1788281611708;
        Tue, 01 Sep 2026 09:53:31 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357efbsm1762325ad.4.2026.09.01.09.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:53:30 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/4] percpu: remove unnecessary return in pcpu_populate_pte()
Date: Wed,  2 Sep 2026 01:53:04 +0900
Message-ID: <20260901165307.1026248-5-ekffu200098@gmail.com>
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

Since commit c6f239796b55 ("mm/memblock: add memblock_alloc_or_panic
interface"), pcpu_populate_pte() no longer has an error label after
the return statement, so the return statement has no effect.

Remove unnecessary return.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/percpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index 45f3e3fda2f9..9df6cdf636fd 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3178,8 +3178,6 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 		new = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
 		pmd_populate_kernel(&init_mm, pmd, new);
 	}
-
-	return;
 }
 
 /**
-- 
2.43.0


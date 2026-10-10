Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B133B6D9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791618629; cv=none; b=c7MYy5F6ZpuN1ODb7GdOH6OCTgYGa2Gz5TW/Cg3gDm3E7xmHTvlk0SBx3RtHAEdK95hHIZf/uVzKTblSDCKsozSJGkAguJwUL1GarnHOvkrYLiHx59Ai52CjFcL7AtqepDRNkEdJRqhwE3EdS2jIjxlSvBvzzga+pqd0GtmLBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791618629; c=relaxed/simple;
	bh=iGtE6KY0n+ZXx+u2vfd4l07erYamajVoVioMKMj8Pyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZ0xay9PRpfmejxwh7hb7nDzyDByAuzmlV0cpiXzPsGmw2cV5wKWo6B60FprdhbQjf5wvvEwD5u9LSU490z+r+CcV3gQLiiaMK+N9xRU+KY5588QxfsviXyZiBW+nR7FJ3a9g6aIRFoWyZQMCSr0dgNI753iUuAFnIzFIZfDFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcIBPVBf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcIBPVBf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so420966a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791618627; x=1792223427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rWciA3sqNLXlKpn6IIoptpUh+XgMIKLSLOdWebd7JY=;
        b=YcIBPVBfBzDTPk+Myzc60rEGV9EBc+K3NTOW8Q6gqF24feXpwTHhUDTi/1jNnomFqb
         upaCFiWb43uteXTkHwtYVbiRRpwtkhn30wYgqRmz8uw5+gmFz58pKfxb56jjk2RI8aLY
         516XSUY05ncyMI3DcRU79bft7cYNmVY+wz9Bsz1sQWe3Q8C3zQtVCkeEg9RLlKL8whBt
         dbyftTSlwRSDr4Uv1H0B92YbGraAUjntS1VGe/dySBubSU6Zay4QNk/0m8DuQmuQaI0u
         WSzFHxavu9a1+5jwAS/RLJPnfgWC64fMK6KAe6xateRgiF/Xr2B++iGa8Wb7DR3Tp4G6
         GLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618627; x=1792223427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rWciA3sqNLXlKpn6IIoptpUh+XgMIKLSLOdWebd7JY=;
        b=izwFe6++yrGnhIWF5gFLBCV8CysApcJlwDZM5aZZyr7npyV722UzN5lFtkNjywfGQ8
         +vVw6VfTytLX/FrMCoHv2he7ReVfop+RzJ0HrTlYZUvqI48/3mm1Ki++/YPOtaOkaMg6
         chPPe6w5iyOPQ9CBmr066Z84P5HaWizb8avHDLSzbUP0H4Gld1fjV/1VPOleR5dzdV/8
         r3O67ivH+0e3mRHbNmgQMOJTsP+Ax4nAnptcdV4CghRBkwVlgVmFWZmsYg2/Lxs5qa0/
         ZTrArsYqlCH0PZT/4xEPJA9ALAj9fibl4leZDr0j7TE40O5xRBmwRgd4bMOOZcRkp+Pe
         MPuA==
X-Forwarded-Encrypted: i=1; AKwUvBxJNwIDb50fYeuhtxoL6PHG4pEnbQ8p/k85TnIGBsVXwGD7tnOHFH16r8Jpd7ZK5/P8Yup7Gn/WqjQy8fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLacUxDzhW2Dne92MICGXKJZjONB5YrUFxx0+aoia9f2uegcK9H
	uKdATgawQxTiqFPf7hNvqFvT+d2/kULKWUR3gOEttjjy89wEuDye5mvM
X-Gm-Gg: AYBFou0xAu3np3LkUT68u76gQ2oWOxvXoppwrVMCXv/G4idKTyPwcrU71tNaanxEps3
	Zn6196/Vurt/yrhqA4Mn+mwkiABQq7fQKFc7aXtgme/ljtzi1IlVqxae05WSS80R/DEGrsFVe9R
	qTQjZqVA6XhZ+TRchB6a7HCk1IxEKLJMArlA/MFUlmGyTnLjSFCvlTK+TwrOhHFEbbPCQUloLo/
	5MIIQf+GDTdEgdVwNBjSnwG5WJcYNhK9mYdfdvjuua5lNN4iuqhMc1spuFK7iZNwzFNZWuWKdu4
	mr906cLkuaAKcR8rZWe/mdbJXH7e2lqY3L9d1VDVHqVu0mF4++7Doxx3g9gVSvBhYHDBpfubgfn
	OFN/xtXWiAqAYeKYGKq3Eklsc2oGHDwIjEdNYB+KWOZREJJE/ipG37Ir1ceCsffvYb9APt8ri1G
	qhu0g0gh182R8k9RAOztEdX+E9ouOrJJ3mjuZ80slpmynE4EJDgyr2A6LVynnBHGsUAe9MI262h
	JpB0IVTRZLb7dspGrNmJkis8gG6iycFVr7pJHbA6MfuRY7991ZocrFapWJTdX3ZZ3DxVmde
X-Received: by 2002:a17:90a:a8f:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab3a92850dmr2799642a91.49.1791618627349;
        Sat, 10 Oct 2026 00:50:27 -0700 (PDT)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([23.97.62.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm1804249a91.15.2026.10.10.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:50:26 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>
Subject: [PATCH] f2fs: fix termination of f2fs_sync_meta_caches()
Date: Sat, 10 Oct 2026 07:49:12 +0000
Message-ID: <20261010074912.114840-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When __f2fs_write_meta_cache() returns false in f2fs_sync_meta_caches(),
the function only exits the inner loop instead of the entire
while loop. This leads to an unnecessary lookup of the next batch.

Also, when nwritten >= nr_to_write, only the inner loop terminates.
This allows the function to continue processing subsequent batches
after the writeback budget has been reached.

Terminate the entire while loop in both cases to avoid unnecessary
batch lookups and respect the writeback budget.

Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
based on the f2fs dev-test at commit ce439a2b0690

 fs/f2fs/checkpoint.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 2e5e0ee5feb2..4cafc96056ab 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -654,7 +654,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 
 			if (!__f2fs_write_meta_cache(entry, io_type)) {
 				f2fs_unlock_cache(entry);
-				break;
+				f2fs_cache_gang_release(entries, nr);
+				goto stop;
 			}
 			nwritten++;
 			next = entry->index + 1;
@@ -663,6 +664,9 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 		}
 		f2fs_cache_gang_release(entries, nr);
 		cond_resched();
+
+		if (unlikely(nwritten >= nr_to_write))
+			break;
 	}
 stop:
 	if (nwritten)
-- 
2.53.0


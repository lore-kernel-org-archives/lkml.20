Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E02877DE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356968; cv=none; b=YCdexNC5NFFhPXXV8GDd6oMdPsm2qKOXvhrSJTBti2kxOmwTILMKDSs+yZQ5Rcvici72AkXTx37dDT01Ldnecm2fhUnfpIuR8/yG3VTGBjNO3eIlFP1ikRGTuK4gUgwEltBsjLNSNM9eF+mvkiP0Cj+NoedMhS8e53xNDxXIQfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356968; c=relaxed/simple;
	bh=ViOYiYHhpCGW4mRS+3Q+xAnj08GhX5pYWZAJg4Ib0ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKop8hN9q9tDgro4Esn4cgrHcpRo9uHC5F9gsR+7oSsUerDS6d4KS57btpzsJRwcua1lTgabnE46BJfeMO7sfFjdOrNM/xr8AAjS3xAe4ENP6t1Voo3wcdZuVM5DkZ8VgekIRzVY0Ae5z17x/5gZJmzbvnNtYDzntq2ifV4aT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUzOtTsD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUzOtTsD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so35191645e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791356965; x=1791961765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eSRBzmU2MRMq0BGowMkKhA8W3CkRs/G1NFefVR0TUQ=;
        b=cUzOtTsDVdFwpPVBJlZ0ResmAQR/n71lY4OxfFbTNsLFd6OHSHdw59ABosHXIaW7yF
         0F0WXUcA2qE4pNhGIKPuNOmWh9cIrxZf+v37rlmaoWSy7fu5s4UMvly+pCltd0q9Y+ZE
         MVnZ49ENOO7kZ928cifVuInRb9qdCemfGlZrVduQ3dfxwAZvJ1UiIQ3YS/w9r0WpUyO5
         YhsojdyIXjOYDB7q1jNqe85qhhC/XdXnDOqU4Ebs2zTU11aNoyL/dYr2mhPSKKRiAmnI
         E1hMPMxt10M5/Z8UMoRJyWj6KF+hLBj2aQN1uPAYA/uvG+6/luADYA7um/AxCukM9XLp
         izFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356965; x=1791961765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5eSRBzmU2MRMq0BGowMkKhA8W3CkRs/G1NFefVR0TUQ=;
        b=XuJCm9vsd9uLFHiQWMskL5PD+XVTjuBl8jyJumsNLmjJtA2nSMLSfY9T97yvpvk+sy
         w1y6s3kPLrkRT4oolEzPH9b7nUx8SHcTOMB4kpHfeGEY9dVOVVznJVrzZKEMy2HPOuWb
         +C3PX6KPRDwzsV5Omok2ZRMIGYqyQTxXIQ3Pj3dJTmGL60TLTEo6gwgwWo3qc2CW/jV9
         vfCbrCHnW8f0fFmaJBgoRdTHpc1PEmLOMqtRB5SYQOHgIp9AsrjOLb9X244m1JxQj8cf
         zBw5nGU4KU0VOFJshz+srSLLbxKV++mCl5dVc28PM2RFzwc0VsN36RePbu2MdenKvCUB
         LcUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbOX8UC79/noUoFvycR+A67vsPjz/LP68IWA39cu5VL2GWeDI+/G/HwrIKBqeSanFCNmMFBa/XLquVTXM=@vger.kernel.org
X-Gm-Message-State: AFuF++mwxxQkQNArWVO2i10ROBJwaRZnO4SfP5ElJLJE5XE0a/4hcF/p
	jYUWBLqTYRizQWc8w+CeJTiBzPJm1KbYgiJKLnR5Ml8xLSwbRpRM7qS7
X-Gm-Gg: AYBFou2WhmVXZ3+mtCqHcH5m7oFKQ9Klcy4RD53w6FjoiFYXnSZETn3d+PQ2qcqu6MB
	hYMYWPdCcDXynXlBtZxXQoywCTT018/W+eKt/QPt3omuC9B4QFtTpmsUuVXKlOGSsZa429A2nqI
	95B82ByhYuvZT3f35HQ7hH7lOH/DUNtjvUp7k3z4CVDzhOvYfil9DDi6PNNtBoZeAxa/D+opjN3
	M8aQz8k6fRooHoL/LtEoCM2YE5n/aI0Ev4UqxvorSHipqN20zli1EOc1OgORI3z5d5n/DINH5+t
	XatdD15QbMFQrVphPnnbYW7wVz13hVgMPHyrYvnw71iHx5WzL6F5dhgrnqGNvVba/8BOsi2KVyB
	Q1NDh6C0fhgvkm1Y/0Slim106e3exQHRonwn6BaUgidOtgyVL2CsdZnpBNHgAzhLxOmCGRUZgs/
	571DBxGZ1xIJyuj11pUPjSgxaQJKTYgrvnDmxbo/UaJAHG4XxnD7d2G3CzVPv/55ZAXLLwSsP39
	CegQNOONg==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr15726175e9.33.1791356963527;
        Wed, 07 Oct 2026 00:09:23 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.178])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c5d8dfsm135912145e9.14.2026.10.07.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:09:22 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Oleg Keri <okerixx@gmail.com>
Subject: [PATCH] mm/vma: clear vm_file before unmap on mmap hook failure
Date: Wed,  7 Oct 2026 09:09:13 +0200
Message-ID: <20261007070913.3923-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-3-a1f052500fd7@kernel.org>
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-3-a1f052500fd7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 2ceb21171dd9 ("mm: consistently validate VMA state after
mmap[_prepare] hooks"), the mmap error path clears vma->vm_file only
after unmap_region(), so free_pgtables() unlinks the never-linked VMA
and drops i_mmap_writable. Once it goes negative, every later shared
writable mmap of that file fails with -EPERM until reboot.

Clear vm_file before unmap_region(), so that free_pgtables() does not
unlink a VMA that was never linked to the file.

Fixes: 2ceb21171dd9 ("mm: consistently validate VMA state after mmap[_prepare] hooks")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
Seen on next-20261006: one refused PCM mmap probe from alsa-lib left the
device unmappable, so PipeWire could not play anything.

 mm/vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vma.c b/mm/vma.c
index dfa45c64222c..8d62da16e076 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2619,6 +2619,7 @@ static int __mmap_new_file_vma(struct mmap_state *map,
 		UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
 			    map->prev, map->next);
 
+		vma->vm_file = NULL;
 		vma_iter_set(vmi, vma->vm_end);
 		/* Undo any partial mapping done by a device driver. */
 		unmap_region(&unmap);
@@ -2627,7 +2628,6 @@ static int __mmap_new_file_vma(struct mmap_state *map,
 
 		if (map_same_file(map))
 			fput(map->vm_file);
-		vma->vm_file = NULL;
 		return error;
 	}
 
-- 
2.55.0


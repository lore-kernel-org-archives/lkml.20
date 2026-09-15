Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA874A5C56
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461935; cv=none; b=KcXE35VIDGw9xvpKx5pwdNMk8qWGXPhDBEYmwUrmqpF4eqBQhLQMKYw1mEtIwXCVqtMvsJxArBQco7ukQaxGpXGud/M2CSMk7LJwzOgu68sd3d1RG0UsmSHJVIMZDdUhfv/rCHHmKiw+mHb/402sxV/3hSo7oU6agKHjGjgxfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461935; c=relaxed/simple;
	bh=ZrgMB7JDDSdafyviRdJlDugq/cgi4D4vxT6ZDCo/aq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po1qVo89mApnvGCeJ4m7u55JHj6frE1KyEDj+KtuKmqKZt+c1wWT8sIJp86eAEPU6y4V5cRCOMqO4gNtl5KoeuyARU2qCtlIh1IoGXCcGL/1wUqdddYfqqH7VUu4PtbtzsskM9cvBVn4AbZFlZpRAmbKtSW5xBuvIoekbXiHslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CN0zW5Mg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CN0zW5Mg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d942c7cc2fso41829585ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461931; x=1790066731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZjVI056W5CWRBLEP/aWUKLbuQzjdA8fAad1ODHQ2ro=;
        b=CN0zW5MggNo/nhTbR8VI7iWX5DeFAGbjXebPk+v5phTM7A4D5pKM3CgpGty6Utcc4v
         bil2MphDTgyfrefzmPXRo9RT4nc8q7sHOAxwLzClinlqi90M4jUixELFRxQZBDmJfgnv
         ebFdtXKkbgd1lFpFjUXdejTSRjgjiOY3qKNsWrKVX/54156y+s3agOLYDtsbmHfoknWq
         mmQ8WmEg8ByZ1QBHl9J8zD0z7U9AcoJ4A21MpyO9UX2tHKPUvBEplgT1iimCJLhcNSfy
         Rq80xKxhXjlcLpc6MrgGAo0Gbre1u/mOT2jLulEukuMSYcpEUztUytjzXLQekpbscvgo
         I1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461931; x=1790066731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZjVI056W5CWRBLEP/aWUKLbuQzjdA8fAad1ODHQ2ro=;
        b=CMFeFFAjH6O9iDBxCB6APFpdtOMzoxCFuMzuj4GJnW3BGZKDtazvBio9UxNlwGvKPw
         bN3N6PLkykH9qcNg4Gr3yVNZsdOpI/iDggJq20qVMiCab1bm2pZr+lTpi7GnWYtUIHeC
         VFEOZCbk2qAqL9SZpBQrBFTxXRfly3bd4cUwDUf5+hx3+v4wpiXZ44341u7vlVFjoH4h
         9986fNzyQYHgVcxfXSw1XTdORCuGFdpS6RymiCqKI8P0A77o1rZ37HpJQzh2piYK4MZv
         rmNj+a978nfITPtI2DcrQa2G5e29iRUcI3hSvHr/dsyPLEuD9oJnUPLKP8ElucGKB67p
         BHHg==
X-Forwarded-Encrypted: i=1; AKwUvByT5AlaMhC9MHDkkStvVTsEHHcwFnNSiaps2Eid6aoDWAXSjKV45/xHXIKd1ZTsd/A2WD4SNp1TfPGprqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lG55XMUna/BVBN9O3vG/Fb+mY3fU6CqP3G7PUADqYX/FuMQ2/r
	EsKDQDI/Gx5XszgM/df6L5l6+m356M4hpZ89dJQTimhTafxZwUkCoGqt
X-Gm-Gg: AYBFou2nVCZLXAvmqQ5bK73VvOQQEEcMBHuPBLMmTWyD+lMlxOgMvgR7tTCBdCbzXWP
	B6mWyKKUqDZSX60n97RhaIRXm3STcS2hCi9L7d2JF8Kcri/UabQR3HHBUEFcM6rxGysa3VULMvx
	XLD0cRO6Cnp7oplJtzhgIGtZjlCK6XKaNNiKw+kMswIWGc555vtrGVHjDscJn1vw8PNsGhJanOK
	3ry+FgCNN6D/xI6KXDDr5CTvPKOybERBbf7Garj32J32RYGsR4n6NtVA6P9quaUTKLg4R2AxdXk
	XHooWz49SYmUYluqCZewYcBOmQz4wTlluEwPAQ6CWyimHiWGjU3q2VWr9ZjXVFtWqwYIC5azJuG
	xJqgvqUMj6v80Qp2beskOn/VAMAuEWte+mwVA84FJYYhmNgxRwEezVZ5kWQ+Cy6F1M/iCC0uiio
	G7xATDpgqXj8SkRjpFkEiLSJZaCf2pHGSwPbyObf0Wt0/q9ekFxTEPJQz9UOwcgFa/8JYardjO0
	xfRhBymQcogD7uU9x7Vtn29BA==
X-Received: by 2002:a17:90b:4c41:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39dec05d384mr12362719a91.15.1789461931352;
        Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 22/23] ALSA: trident: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:23 +0530
Message-ID: <20260915084424.1007757-23-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/trident/trident_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 81f6348191dc..4ed0e7d68322 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -27,7 +27,7 @@
 #if PAGE_SIZE == 4096
 /* page size == SNDRV_TRIDENT_PAGE_SIZE */
 #define ALIGN_PAGE_SIZE		PAGE_SIZE	/* minimum page size for allocation */
-#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maxmium aligned pages */
+#define MAX_ALIGN_PAGES		SNDRV_TRIDENT_MAX_PAGES	/* maximum aligned pages */
 /* fill TLB entrie(s) corresponding to page with ptr */
 #define set_tlb_bus(trident,page,addr) __set_tlb_bus(trident,page,addr)
 /* fill TLB entrie(s) corresponding to page with silence pointer */
-- 
2.48.1


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3AA28315D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856789; cv=none; b=l6a7UEvQUp8z9G/DuG7K45h6IBGHcB03Kvv5gt5cjp9XRxLY2uUeU0ejnK6myumkmDUJOH5BA+Uynxt6aTV17a/q6uE23w3S/L1SqEvxPJfCIhjzua3h3F8qdoK4AhdZZFEENzhXbh1dN2THquKXf6XX8OHQIC0r3Tjw1D23sm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856789; c=relaxed/simple;
	bh=+MdI4r6n10gDS+p4YVUaZONpes94VhcY87e85kZMofE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVQdTrgI/417kZm1bjv8SSy27KTsvatI+nPMvfn6MdrS50F2hliyglCp8OKwfqWcncF07zRVGWVOamwQ9oh9rZAiM3kJVtH93vZ+OegUjYeEoHui2Z8t3dGQokrhDSzpK9GkZscRK2wD9k7AJRVPEIgFJp0mg7driaF0tAWSrgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3az9Lf0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3az9Lf0"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so15814275ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856785; x=1790461585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/g+orwBOaMljS/JJ6ICfCzvcRhieOLrMuJNELTyKpxI=;
        b=S3az9Lf0TD44ncVbRuSYmGonqLpsANDxcAaKrvYX+5UOOvKbSHpmW2VJZUlXT1iJFX
         wA84iZrN6KPtOA0tqxX3m3LFfhaucS+zUXda0Mep6RMEXXoVmz5tz1XY+uARI3YvOB95
         VNZAJ2jpniORc2bt7xJiNCUak/ne1L1CXDVRX573OR458YNzCNU2GtsmZMTve6Lnt7Mz
         uFHpbo0YOoE0Z6FQOP8P5JTFhrjuvQjUWuHlZ7p8jjdsB3lXtmO5FbG/5KcOe+OqyxNS
         VrHlftUQ3Dd5uUkFw5LPB/Rx7Zz4JAhZVRANa4PhZZa/sOaRndM+l7mz9MeSU25K4D28
         jWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856785; x=1790461585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/g+orwBOaMljS/JJ6ICfCzvcRhieOLrMuJNELTyKpxI=;
        b=iQ2/y6cLc2wLKquComxivUEWaSnfWHM17Cs8iOtl4bDMTdw2Z4Xqum0ZIn3nB2hrSp
         f3SLLfetQ8Q12c8/o9P6watKlsY3rpRSwpnVKZ4iebW7tbD4IZUWI50ohSVVZHks9sBX
         Eyzzm8NLwDApNesPvNetizR68BAIZnZ59yyvffzZkfbuIKAUqGZlxf7nJt+QhZY0x3VJ
         WXXvhS/vshx3/XQZ2EkaRz4X6kyWRQ41gx8DzyQWjFH7q3ZO779Cbn3nqtpGm0QqJ5rZ
         qfDDMjRmvY2cP6o+Akrx8EURn8MmamSRRK/AhLOme3+pTvpjmD057bMo7ddJpE2/4u0j
         NH0w==
X-Forwarded-Encrypted: i=1; AKwUvBzJhDqJhCkU2Ej6CjhvUkAU4xKIEnCiV2aCQ2oHKNyh1ifi1XPQUghfE8/KT103Z4KFDhYGZIrmwxwPBiI=@vger.kernel.org
X-Gm-Message-State: AFuF++nr42J8Txas+1ybGYQMwmtGujEz2imS3GWMj9dthSV+kSRvDfpV
	etgc4mqzqqFuGqw4QFjKA2YQkRQC9ZGa/pFQZwLqoXwPKLBXBSV//gqm
X-Gm-Gg: AYBFou1cmPX3GB5jwl8KGz1dLt+lVJ7mqGBDGMaXoyMGCIBkjJpkgzzJFdNYkNfAYJI
	5izFflWreVnrngFiidcI6HTG5gPvo2gQ1JVYLKIXM3SxVicdELqePiC2B3Ynfn2kb8IU0mOkEBP
	L6XbSdJv+XBoXf0mgpaOmbTm5rKxsOc6I40QbhyBlg4ujeFk8CGq8bPa4CijPI/XvjMYH1uGrhd
	HRKXhtwgah1yOHEKqBj59O4STJ9kEgitniu+ZCX0jEjxtCl8qtBAduFzruRFCVKgs+Y7PdRrn9u
	FuTOuDPnzEq83UaVM/Dkxo4ihgOwUkdfDrhkGrrd1AgasbN8b8PjRiXuegtdmdyG1zYr+ysLeJN
	QlnzZ0CUVX2RpIBgM6cS2iF0aDu09G94aEcx7IZzKZJnQepOShMxBHCuzLl8+lJqZV48yxmAHoB
	U5RIseHg+Dlg1yVH4MVgtzvgIHEqv6Pq0l5VkwVgAZP/RTHqAPwgULERgzpPKBSGAHzJhtCw6rf
	XUVtWoYSApDDSZtNCk9wyzmH5VpXZxNxPvDB8NDg5eTPZgnFZ0W+SSZT+wZtmMmL35tef3uZreF
	8dZgcqkSUA==
X-Received: by 2002:a17:903:2312:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2ddb1b899famr115123815ad.14.1789856785398;
        Sat, 19 Sep 2026 15:26:25 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm13208235ad.70.2026.09.19.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:24 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] loop: restore lo_backing_file, gfp_mask, and uevent_suppress on loop_configure() error
Date: Sat, 19 Sep 2026 22:26:24 +0000
Message-ID: <20260919222624.3797511-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In loop_configure() (drivers/block/loop.c), if
loop_set_status_from_info() or blk_mq_unfreeze_queue() fails after
lo->lo_backing_file has been assigned, reset lo->lo_backing_file = NULL,
lo->lo_device = NULL, lo->lo_flags = 0, mapping_set_gfp_mask(mapping,
lo->old_gfp_mask), and dev_set_uevent_suppress(disk_to_dev(lo->lo_disk),
0) before calling fput(file) so a dangling struct file * pointer is not
left in lo->lo_backing_file with lo_state == Lo_unbound.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 758c20678bf6..8fae858c9df7 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1086,8 +1086,15 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	loop_update_limits(lo, &lim, config->block_size);
 	/* No need to freeze the queue as the device isn't bound yet. */
 	error = queue_limits_commit_update(lo->lo_queue, &lim);
-	if (error)
+	if (error) {
+		mapping_set_gfp_mask(file->f_mapping, lo->old_gfp_mask);
+		spin_lock_irq(&lo->lo_lock);
+		lo->lo_backing_file = NULL;
+		spin_unlock_irq(&lo->lo_lock);
+		lo->lo_device = NULL;
+		dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
 		goto out_unlock;
+	}
 
 	/*
 	 * We might switch to direct I/O mode for the loop device, write back

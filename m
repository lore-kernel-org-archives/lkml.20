Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09553D093E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600091; cv=none; b=Ft3ZnApP+dhXVy9MPVC8g404GrTneBx0Wv3/gOdHci9RqXEr13WoBt6jyJPm96i5/fwMtCrMb4JH35qMtCgFg+oQgFDFFRohRdoUTwZyRb7L9CvEzZzE00DHiQFg3UgZV/NEoqyP6nuAAPapSYaUcBKlJqnRTkbL2CYIGfUZvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600091; c=relaxed/simple;
	bh=Ir0ZBzHdlq9WfeoxyDkgI01JagPS7kN3ri937b+LtbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i2Bs0HQyw1yCpJadgIraOM5x1Md2+3gLL6+d/r5NZ6wZYU9yMNQ0ivpMSELLjCSfWlIFJFrDUsQHSk9JX2YamZdhPD2XU4K3eapMML16V50pcbyf/vEAGohroccup69/zcGXG1aF+Nfs+S6K7wrvN8p0EdnLKS2sMPWXnBuZvuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAsXzmjq; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAsXzmjq"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso2165449c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790600088; x=1791204888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cTOK1XTpsYyqctmN2FbR3eWoymUf0f9WM9mUaHazAVY=;
        b=pAsXzmjqWYmqoC/hJDcvF1sC3FXf3DJBFEKpxMoZFqRZvI5NtNDHEaquEagmlKOvdl
         iwU/kCYuLpNHmIzJoZLBQ5GMKeeFWaWa1jzuFoCoHHrDMWfre+tg1GHUXoQ5gOyAkgdJ
         C1JuDmWeJWsNOJvLN8Wm4lW0jSf6Khna5FyjCkb7XyNFKcdhjdd8jXHK/EyEPLeifAHC
         uSsA8Jm2sWBPgZtTn8k61VLW3eZKjmOlqfgm6M7s7eVIgSfbBV9jg56Hhj77/y0/FyO6
         1kscePJ4y5BucONHAoaEGN1cu0m9MzxpKt9nI0hhHi7uVKlTJdGPo/GuMSuicckJrq3c
         jgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600088; x=1791204888;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cTOK1XTpsYyqctmN2FbR3eWoymUf0f9WM9mUaHazAVY=;
        b=SKDhQfuUrlrqvD5RYCYnO20fbg/6vsS28vsCC7x3RifPOqWOpJtLtKeRgkjwmzsOsZ
         B/FOwKKp2+XXUg9YgLxnwQwV/7Sx1tyBGY0BDOzbwh8hTZN8l1TfpiYgcBXfWUkVnF+c
         an4FawqsIl4nf10pVZo9RDhQUojrjNnhkavzTKP7OJNPh6OWF83VUrtxszmZX5PUjQta
         k2tKpYjCjcS8zXbBoyzjfpRwt3E2PL0PXw05PCTDCQg6tk6mAe/IrnGfKipRdMGGPf0Z
         F1IpqEstN52o7lIkG2J+qsqP6ITtAoIBJ3kJlyEf/PT3pYIkiGgGywBFwy8O2S7DcsEP
         oogw==
X-Gm-Message-State: AFuF++mAtd4cQ/cuyKzqtl0TaLcaAfAgUHC1p+1fxetltbLBk31em6OC
	kkIyEHg9R5XF8EgYYX/WhO/PfSSScWLqgWcJ2kVrumVG8Z2XQ+ZV1HQ/F4aEZrwm
X-Gm-Gg: AYBFou1SyxZBNavM1JVXQhzhXAMbTfY+BfmPCSiCUXHJJS1e+wZW85gN0akFRvHl+sV
	uvjHl2BWHzJF7UND+FxQ/YrqMZU+G9BzH4s7G0Xre43l679vIyQMFENJxhNAU9W06isHJm5MpGC
	XbQxPHaGDKYLIvgSQ3KecBB5RmoHVCm4KOuA6uH++sWiZ0Z4vehi87oNflsDGIdLknDpsGotbaK
	iKfecMEDdNFF984SioXcsrOX3L5WE60kWOeZt2Bkqcguzc/58junL932TK3EOFTCQs8OoPPZm2y
	8/K7Y5N7740YXoyfPXOtjxurM99w2Ej/R7+/OEikEPPXR5y5D/2vWcZ9TC+3Fr/JnZ/IS3IEwlh
	JrY8jkc1OlMly3s4yUVqUYfeTuBL1og7ZHF4popSUUJiMVCYbfF5TizL83ZES4yrZ1d5jpEhouW
	J/0hH+UixJT9UtFGaKvnlBm22mLQehWJoOqwJvRHQ0G59KkA8SAB+F44xKJK86wEaV3rU=
X-Received: by 2002:a05:701b:4544:20b0:148:2f17:3e75 with SMTP id a92af1059eb24-1482f173ebfmr6890069c88.12.1790600087824;
        Mon, 28 Sep 2026 05:54:47 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm24533829c88.7.2026.09.28.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:54:46 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 28 Sep 2026 20:54:40 +0800
Subject: [PATCH] quota: fix shrinker scan budget accounting in
 dqcache_shrink_scan()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-fix-dquot-shrink-scan-nr-scanned-v1-1-789c661c9dd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI9jumoC/x2NQQqEMAxFryJZG2gLjtWrDC7UZjQI0UlmRBDvb
 nH1eIv3/wlGymTQFico7Wy8ShZfFjDOvUyEnLJDcOHlmhDxwwem73/9oc3KsqCNvaDoQ6GEg/c
 Uq8qFWCfIM5tSbp6Ld3ddN2WGYRtyAAAA
To: Jan Kara <jack@suse.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The dquot cache shrinker's count_objects() callback,
dqcache_shrink_count(), reports the number of unused dquot objects
via the DQST_FREE_DQUOTS percpu counter (through vfs_pressure_ratio()).
do_shrink_slab() reads this count exactly once per invocation and
derives a one-shot scan budget (total_scan) from it, then repeatedly
calls scan_objects() in fixed-size batches until that budget is
exhausted.

dqcache_shrink_scan() never updates sc->nr_scanned, even though
include/linux/shrinker.h documents that "the callee should track its
actual progress" in that field. The function already decrements
sc->nr_to_scan in place as it walks free_dquots, one per dquot
destroyed, and its while loop exits immediately without touching
sc->nr_to_scan at all when free_dquots is already empty. Because
sc->nr_scanned defaults to sc->nr_to_scan before every call,
do_shrink_slab() always believes a full batch was examined regardless
of what actually happened, so it has no way to tell "there was
nothing to do this pass" from "a full batch was scanned and none of
it was freeable", and keeps calling scan_objects() until the
original, one-shot total_scan budget computed from the percpu count
is drained, even though free_dquots emptied out long before that
budget was used up.

Compute sc->nr_scanned from the difference between the nr_to_scan
value on entry and the value left behind by the reclaim loop, and
return SHRINK_STOP once that difference comes back as zero, since
that only happens when free_dquots was already empty and no further
calls in this reclaim pass can make progress.

Tested on a loop-mounted ext4 image with the quota feature enabled:
chown()ing several hundred files to distinct uid:gid pairs to
populate allocated dquots, then triggering
"echo 2 > /proc/sys/vm/drop_caches" to let them drop to zero
references and become reclaimable, while using an ad hoc kprobe pair
on dqcache_shrink_scan() (this shrinker has no dedicated tracepoints)
to record sc->nr_to_scan on entry and the return value on exit:

                      total scan_objects()   calls with
                      calls                  freed == 0
  before this patch     12                    5 (42%)
  after this patch        5                    0

The last call in the "after" run returns SHRINK_STOP
(0xffffffffffffffff) instead of a fifth zero-progress attempt.

This is the same missing sc->nr_scanned accounting already fixed in
the analogous ext4 extents_status shrinker and the jbd2 checkpoint
shrinker; dqcache_shrink_scan() was found by auditing every shrinker
in the tree whose count_objects() reads a percpu_counter (the
precondition for count_objects() to report a stale, still-positive
value after the reclaimable list has actually drained), while ruling
out the much larger set of shrinkers built on the exact list_lru
atomic counters, which cannot observe this kind of staleness.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 fs/quota/dquot.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 9850de3955d31..b55fa7d63f56d 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -809,6 +809,7 @@ static unsigned long
 dqcache_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct dquot *dquot;
+	unsigned long orig_nr_to_scan = sc->nr_to_scan;
 	unsigned long freed = 0;
 
 	spin_lock(&dq_list_lock);
@@ -822,6 +823,21 @@ dqcache_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 		freed++;
 	}
 	spin_unlock(&dq_list_lock);
+
+	sc->nr_scanned = orig_nr_to_scan - sc->nr_to_scan;
+
+	/*
+	 * DQST_FREE_DQUOTS is a percpu counter, so count_objects() can
+	 * report a stale/approximate value that is still positive even
+	 * though free_dquots is actually empty by the time we get here.
+	 * When that happens sc->nr_scanned comes back 0 and we have
+	 * nothing further to offer this reclaim pass, so tell
+	 * do_shrink_slab() to stop calling us instead of letting it burn
+	 * through its one-shot scan budget against an empty list.
+	 */
+	if (sc->nr_scanned == 0)
+		return SHRINK_STOP;
+
 	return freed;
 }
 

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260928-fix-dquot-shrink-scan-nr-scanned-b11e8550287d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


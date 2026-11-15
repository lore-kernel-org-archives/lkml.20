Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702608;
	b=Ifzq5xQagF0sviMARZHPOmwb8g3w6UqK7iWN+MXqLiVXCXqA4X0qv4JtbV7PHZt0pL3f
	 /zlX0m3rkevjTl/KR/j3Tzt9xE5ckhqStR7/0bQ/9NfptlUmCtQ7uf7M75AY5HDJeSjSH
	 y6IV0sUWPn0ychpeRvtLDmONYrOEtdFpdyDM3kokGfMmv0Eme7gP3S9mwaH3CgbV3UTmS
	 Cpl58jLGa9u6KGgAYp7wREPeAWRq17OqhIT6NcfCM9t2L7wzTebnnX8qBDrWucnxQ5+78
	 IH3l5K7sXyg74STywX+BOjGQFA0qA44X76G61yv67woDU0zD3CP4kU2Dk9ymA4i7eaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9KJyISR2AtHnOeUtveLbWH9gz4mCekwR54L842JjBYg=;
	b=DBN4hDVLknRhNmKdAznfdN6c7ssEF2B5EBEUpqBcc21OEkEYPGW14i2J7i4ivp+FMDh8
	 9cWaP+OjJhmv1Er4vZJqmPZQjsxiVqL26o7BGq6ePaawtuK4Qhqz4AUZYjbLA+G8y1q1M
	 KC4vVl5LeIVPs4tv3Df+IAB2x4+f3x/BalX/fVXkFnkDVMWeCsEemnibtpHYBn/D75iS2
	 CR/DDN1slbn/C4q2W40pnFdDsJfh4p233DlXJRqrcMHprfvjc7av/gMsBPIjwtBoWkcYw
	 WtKcqFfRx1sJ+Vh4HjBhaogFWFjAJhihK9zksK/AEVXeVOv4PFLnTs3M3nfpjK+fzBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kL8RpPZN;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762E606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4762E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kL8RpPZN
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so3001971eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794702607; x=1795307407; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9KJyISR2AtHnOeUtveLbWH9gz4mCekwR54L842JjBYg=;
        b=kL8RpPZNrRt7KvqOE9g/3dldn91il5lvEMDZjyMBF9qQCep2bf24C+ytmdEI+kPOmB
         CkVxzme3ris/DDsxvsOtOW5vA35XIX3QsGAui1F2V7HnoUAnnNrmkWfMZwk5MO1wUtie
         BL7mjdw1MR1QD1LIFKDNQ+2jrFVaAE/+QVntHhYAJSzXSAjvdESZjPTFOUIh0/ydeHNI
         flYFddZ2OcHCapLnm7JfOgSPOS+F32FZ4rLD8uPkEctQsVTJdfUH0an77e9Vl0eexBZJ
         p7J9OAIW53t+jt4rWnD2bb7ddA9ZyhsZON46KN1bMbogj6Y+VCY0+Zzxp43q467l6HA7
         vIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702607; x=1795307407;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KJyISR2AtHnOeUtveLbWH9gz4mCekwR54L842JjBYg=;
        b=uszS4OT1wJg3XzdZF8mXan7DIuqQ/pGlQ/5jvOTnYrbBlZuRbzMsQstCHaWWQJmgo3
         xQJP6tg6icHZAOmJBTlTuJn7ecNU763g7pcrWedPtJOV4sx3j5V9ZqfmiPkFO26lwvVB
         WdYgEJOrw5ZoAh5kuME2DpoGxsv5YT11WE6btWPVxD41beH8Tb7cNMXCYhsStIGMdeGM
         EtSSpllNSA+KBIBwt6Xchth2esfnEeX11bKX5s03hqcN3WDOuXlJ1IJT1iqNwdOGm8jy
         nEwWL3R/bW1b10JbHpQ1yzsgNBEkHkiHogFykq/MwU897KhW+e1aTP8zsHxAahOVLMfD
         EXNg==
X-Forwarded-Encrypted: i=1; AL+hErHGm52MuzpoDk1Jo0eWRZtd+qHF7MuUSO01WMLKtFgq6Yn5fPdPcnsjZPPD9GwdxC2K1Q7eKyYz4z5NTIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7zFTywsybXWb0ydO/Mu9IBnr0jTXppQEg2QovJOvLr1LPEUVC
	m/mI3q4Kj2xvH+8zTfDqUKxdas3uFP8XCZ3gjMrWJ+pRBwjsqizdEd925GTra81ylkyZSYSK+xN
	QqXvksO33Qenx0w==
X-Received: from dybmf33.prod.google.com ([2002:a05:7301:921:b0:369:e1b:2d71])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:da04:b0:369:f420:8679 with SMTP id 5a478bee46e88-37968b93b2bmr6800017eec.38.1794702606926;
 Sat, 14 Nov 2026 16:30:06 -0800 (PST)
Date: Sat, 14 Nov 2026 16:29:16 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261115002915.1849847-2-wusamuel@google.com>
Subject: [PATCH] workqueue: Skip non-freezable workqueues in freeze and thaw
From: Samuel Wu <wusamuel@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-pm@vger.kernel.org, Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In wq_adjust_max_active(), non-freezable workqueues always keep
saved_max_active and saved_min_active, so updating them during freeze
and thaw is a no-op. However, both freeze and thaw acquire mutexes and
adjust max_active for every wq on the wq list, which is extra work and
could increase contention.

Skip workqueues without WQ_FREEZABLE in freeze and thaw.

On a v7.3 Pixel 9 device, this consistently reduces thaw_processes
latency during system suspend by 4-5% (~0.7ms).

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 kernel/workqueue.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index edbb2aa9c950..902f84bcfd24 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7370,6 +7370,8 @@ void freeze_workqueues_begin(void)
 	workqueue_freezing = true;
 
 	list_for_each_entry(wq, &workqueues, list) {
+		if (!(wq->flags & WQ_FREEZABLE))
+			continue;
 		mutex_lock(&wq->mutex);
 		wq_adjust_max_active(wq);
 		mutex_unlock(&wq->mutex);
@@ -7446,6 +7448,8 @@ void thaw_workqueues(void)
 
 	/* restore max_active and repopulate worklist */
 	list_for_each_entry(wq, &workqueues, list) {
+		if (!(wq->flags & WQ_FREEZABLE))
+			continue;
 		mutex_lock(&wq->mutex);
 		wq_adjust_max_active(wq);
 		mutex_unlock(&wq->mutex);
-- 
2.56.0.679.gc527c65306-goog


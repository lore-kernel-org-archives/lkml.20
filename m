Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927255;
	b=hWUs94/jT7y8DPN9j+e6pHWSaHa1oRxl46Bmqq+XPBkumfEnviWC/RUyE3G/m1rHASd7
	 mgfq6Bofi9ay7WYXpITrrRNVugFWJyxIs9mQpGCi9cz2dEORafEoPzkOt/T3A/vjpB7XS
	 vUW1/iH9uNHsf3YfbzbNpj6b/iIiP4MgZR6O/RlSfYMsjj3Ctt2WgyBNkoHmvkl+iCHnZ
	 dDKUzfh1n4Rjp/JfPCFDjayivq7S/KtzpZgU3trUjsEtcoj7vDgRY5Pd+f+S4HF8RcVxj
	 jDIKp8UwIg/WAI5ki3uo+ryfto8MVGOZL6F31s5A4r7pHaCuy9/eAXxacElsP7IvhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nR9F0XM+B7rn1+ea8p9fct2rHHNP071jbR/ecoiRPcU=;
	b=bd3jQHVLqpZu771GqJ0qtoYFAPTk7KhO99+dKQFzB9GKEW4ONrJaZONqEHIxwRTtMJUB
	 yojAeXAD/zpGvnEhiPM5R1KU1mBQx2eWNZkaC4oU350IBIYzpaSEItgez73vfVWzpZ5o9
	 EoSi0rapSuly9RoBALVKUfYLpaKsH+fY4YhJYQ2GaZzG2aykurI0XgUzE6NW7yNOQakJO
	 a6nrG6wulSI2Kvj0t9YO6aEy4azrMVQE9QnVTH3slKPtYr8JUScknuejK8xikCFx8dnDp
	 3jUKaT7y35Bl+2u5rG8IVo2T7khb5drU9vn0tvTt5xME8BN4Q51MxaWYWJq8EvPAcsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqtSEMml;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F36606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F36606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqtSEMml
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso30089425ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927254; x=1795532054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nR9F0XM+B7rn1+ea8p9fct2rHHNP071jbR/ecoiRPcU=;
        b=wqtSEMmlG1gOfAIkYZv+51zPWURrJJILxZTsD9orlam++U3NvVVUOXSrBmPeJw9TfO
         ndE1OjEQUg8/2ntJ+aJEpDb5dbeS5eqrKx2GjOYEnS27Zpqg/mTdWGkU509KWk0OlNrX
         5UqBDzMG9yTO7/2ztUl5MW2oQywJ1RhrHvhYslNpSj/4qGqtIwtuXdHy7l/k91EgCX6D
         HifCS/QmJFIgOl+gYvgfSmU7PIfKRCzU0ZI4x3tBeKrn6cT9cfjmV58PaERNz8x+KuGf
         oUjOjLKtYmaxOMM0b8IOvd/ytzCXUdpMf364wbQS8Op2iJyMN2jzT5xYqHHrhlVlLQz8
         ZC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927254; x=1795532054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nR9F0XM+B7rn1+ea8p9fct2rHHNP071jbR/ecoiRPcU=;
        b=oYeSwkapcrnAaCysLLsZ/MsEeNbc9qa94JAxgBB8VzNkjx5hJTGjd+zbZ6KSGXRxFP
         SaA/F3694dFQ3I6wPWcwC9nOLlc4hy+jQFyfc9VGh2MYJTHl/6gq06u+iqsDYb0P9cxD
         O0AAEaJJywYdC19yv3TU7VljxwpkbKiNqtwDOxu3rwt7iNCNN7dJuDuGddYPN2QADCDv
         hGl1riy7BbimWJHm6c7IDBPaDujenHzWag4y3WZIMpoZHF/LATK/FBKEHxAtzd6/MfYu
         gANxpVWUUJ+ksxgt+GjRDV/4f7xMSyxKe4aBcBay/AB1T49sYQdXHGTHlngmPmxrocOW
         tgnA==
X-Forwarded-Encrypted: i=1; AL+hErGfNtQmkJplu8f/0i2JjRFGVer5keuy0doiTlcoxy3hbR8g7xHR0NTbni2YHnO0mOnRN2LbHjPN4oReFIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DIumL2sqO5J1E0VdR5WLcUqgACeNfbpT+5//inliMuzF0P8oo
	pAKCopVqvhAPw7wQkM4aDOtInAUoQbWUjtT8KcKXz1GFZGM374rjztUk
X-Gm-Gg: AZFdTZc63Ids3tBpXRunIpC2dXIT2SfALNhOM66cBd0hVsUwjgD8BXsevlsOjLhpcUf
	eE1NFRDjW3USJFF2Aa1gwZdLWAtkWPTU/s2OqxkJLhmL36RSPhBd8UJFlvJ+epGByEEQJTOZEY3
	GutIqInHpTxzANAWi1cRMdf6+QhXEb1IL53DBvoSTgTSVKFNKbf1dsIyD15AaehKCCuR4rdmhYa
	mgdxE3cG9kqNGyjq92x3oaeB1F7gsZicZ400r4jiQaAK5LYJAMs6E0l6QcxSYGo/dJl4mJ6cjsq
	QsNOazbO5QQK/0W0CsOvmbWZfkUE8Rz096zXh9+D2eCCdVc/71zH0pKG8p9oROuhPkjuaRbhVKd
	h5XhxOxGXT4mnMpWOPkIpv8dNXFJUEdnqFfCLHSskpIE/iLfW64QShNc6+9kP2fI3OfrLDqCEhy
	ovSMTcbn99VFE99tORWCEOTuxWffhxZwIN3ca4YyxyHDtUNS50bJK04irmYgPfDK01AnYSndDll
	re1XhjN5g1v/1e67RJhYDwqLcQVgehtU+JGvjs2ID0AqZ40seT32oVq2EsXJSjGCkx1fBtct+ty
	9VunwAfAE7Tg/KtlIVwkFHwBaoLkWkYu1Gy0M1RuhJ+exIiNQ9q0Qs8L3NattRRhaBL/Fiytmhs
	epMeOnKNPkxHoeOtYgQMLU9ebdFqKl9aR5nHrKwPM
X-Received: by 2002:a17:902:d4d2:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2ee0dcc33ebmr121427145ad.55.1794927254093;
        Tue, 17 Nov 2026 06:54:14 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a7ff9asm16767345ad.54.2026.11.17.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:54:13 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	oded.gabbay@gmail.com,
	kent.russell@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/amdkfd: unlink destroyed event waiters from the wait queue
Date: Tue, 17 Nov 2026 22:54:06 +0800
Message-Id: <20261117145406.1092636-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

destroy_event() clears waiter->event and calls wake_up_all() before the
event is removed from the IDR.  The waiters use init_wait(), so a
successful wake-up already unlinks the wait_queue_entry through
autoremove_wake_function().  A waiter that is already runnable, though,
is not woken again and stays linked to ev->wq after destroy_event()
returns.

free_waiters() only calls remove_wait_queue() while waiter->event is
still set.  destroy_event() has already cleared that field, so a waiter
that is still linked there is freed without being unlinked.

ev itself is released with kfree_rcu(), so a reader that reaches it
through RCU -- kfd_set_event() or the GPU signal interrupt path -- can
take ev->lock afterwards and walk ev->wq in set_event(), writing
waiter->activated into memory that has already been kfreed.  The
waitqueue_active() test at the top of set_event() reads the same list.

destroy_event() used to unlink the waiters here.  That unlink was lost
when the code was converted to wait_queue_entry_t by 74e4071665da,
which moved the removal into free_waiters() and left the destroyed
path without one.

Unlink whatever is left on the wait queue after wake_up_all(), while
still holding ev->lock, so the wake-up is delivered first and the
remainder can no longer outlive its storage.

Fixes: 74e4071665da ("drm/amdkfd: Use wait_queue_t to implement event waiting")
Cc: stable@vger.kernel.org
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

History: fe528c13acc7 unlinked the waiters here.  That unlink was lost
when the code moved to wait_queue_entry_t (74e4071665da).

Testing: compile tested only (x86_64, gcc 11.4).  No AMD GPU was
available, so the race was not run.
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 6e32a892d56f..adc27f25af4d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -219,13 +219,25 @@ int kfd_event_init_process(struct kfd_process *p)
 
 static void destroy_event(struct kfd_process *p, struct kfd_event *ev)
 {
-	struct kfd_event_waiter *waiter;
+	struct kfd_event_waiter *waiter, *tmp;
 
 	/* Wake up pending waiters. They will return failure */
 	spin_lock(&ev->lock);
 	list_for_each_entry(waiter, &ev->wq.head, wait.entry)
 		WRITE_ONCE(waiter->event, NULL);
 	wake_up_all(&ev->wq);
+
+	/*
+	 * A wake-up that actually wakes a task detaches its entry through
+	 * autoremove_wake_function(), but a waiter that was already runnable
+	 * stays on the list.  free_waiters() only unlinks a waiter while
+	 * waiter->event is still set, so once that field has been cleared
+	 * above nothing else will detach the remainder.  Leaving them linked
+	 * would let a concurrent set_event(), which reaches ev through RCU,
+	 * walk a list pointing at already freed waiters.
+	 */
+	list_for_each_entry_safe(waiter, tmp, &ev->wq.head, wait.entry)
+		remove_wait_queue(&ev->wq, &waiter->wait);
 	spin_unlock(&ev->lock);
 
 	if (ev->type == KFD_EVENT_TYPE_SIGNAL ||
-- 
2.34.1


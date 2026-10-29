Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269902;
	b=QSKRKz8JJsCvqd7IKGpDVw32VtHfQzl39uHgLqOCFiDCYU/PpfHCixZHO2F+yjxzNYf2
	 tGStene7I006iekTeHXp5Xc7Xu9cV639M2AsO8LdruJRvZ10htAq81/z+d5uHTRtD+bww
	 scz8d9sBOXlE+5jjTtoiSd8xOFMqOhbVKTOn6XLpvhs/B5oWcKZlBjg3k8aQ6yZqQPg0I
	 +zpwW4MIG31HX3umiVjAKuoR6wYe7Crd73l2U5RJrQmBSncGwUfLM4ehUff2TzhLwWW3Z
	 9YnXplyC0VwQdnXbbK+GK3/c085JvefYSR6Pk9WAwz4Xsayll9XvEaA28q5+jNpy2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
	b=LlTWyfJc5nvU4/h/zgxOlH/3aq9niIhbFNHM9MYtutw0CLu9PgDHsiKpXX72vXjUlaQl
	 g4HcDwHoIejytTp6mTys/LFlt6iLayoNCkZMbIJRkNSe904YUAI7eZlB9I9lNMRdz1PBB
	 +MoC6yTh60YwhgMxxdmFHFLJB2aFlwxFHDBKLT4PJSWEpLgy5j4ho2Wadd3/8aL1/CGDa
	 r9H2VWEBb6lqaqysj9FU38J0plus2y/P3UFzWtrGJDZB6OLxXGC4Iu27zpVm07RypWZbx
	 Y8oW9OoKbpM0HbXdmkByrwGFjATa3V+sGdrGkzi34CZKhjVEL6JYBycGc3zbbS5ExkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQORBYxy;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558B0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQORBYxy
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so643095c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269901; x=1793874701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
        b=OQORBYxyuPXr2C6tB5FcSWZ112v3RYT/yYSVdqJedc+xpTOi3YmtBggvwlqSwE/WvH
         vzsZ6Q308sXimiWsIOkVEIkm3NjlCuNXH0SvPxqtHg1vrqhb6XTUorARtGDAbZz26gA1
         MZ4qyCBMH76lmEZMhD8EQq+Ovhn0o2Ppa4K2zjuGbWqUkS4rO/4ugKV/N2G1kQL6t9ad
         HP4ESulQxhJWNek8K2kjh3WgalyO4cXD78dzkztQdSjhzK6mVp1WiejGuIpBPxYNHS+2
         2X9oSiOcOS9k/OvBSf94hHKLTG7Ejm4A5PC2+rLas6g6g28MrEZIWxxINkiV6eBtqGAs
         WPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269901; x=1793874701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuWTuv7wT+CRQwrB4gpB0n/Lvy+IrJTCH55qZNEAo0g=;
        b=iyWECb6iu0VEi5pMDCaIQwhAw3WhaEHySHw/fHE4XlPuQ+rpbXymrCFqSkqWRzClwu
         i66k98f0iQGJb3y+8VDhSc4PGfGyCCieZIc+HC+6cCkX8O/+HS0sqgMamQlesg2/3bc1
         ST95c+D4EM/bHrY9x/95YdUZ4PbFggKgBMpPxPjX7MOhUWSraCw3SCjIuKFcKsZfZf0n
         asf3IMk0wJ4x4pJ21VbbBLEB3/c/bVHAS27E8f09B4aiNLOSPut3epDOfohOTIXy+6XO
         bXGiNkobc5wpVehiTNLjVq6cFQmzXEwkqTWPS6dn5PcUf8pqRH5KXLsQyXSVrlA4OPpl
         KiaA==
X-Forwarded-Encrypted: i=1; AKwUvByc2i4yDisxQucFc+aGlnVOES9njxeDM14F9DM0TxePJnbqlHhefkPlF1r3UplXsXeKzJadaFvCMZoS7/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMQAq7VzwmE3jomEc1fwYUwkPwO9ciu2qLT+WUYrhP+ByyzztJ
	Q8cJxBZmy3STRTkIbhVxMGCpTVX0qUWwTHWUE0Vb5Nukv2UeKct6Kgk=
X-Gm-Gg: AYBFou1osPZWYkGs2+H0YDW2NEEK6KL35DGl4hir+gTKECnpbmibamVW6WX/8ymlzv7
	jd2QszjG3MsgVh4jI+Q8tBpyYr01q3xnSKe/cMCSh1Leq4etp+dvObZ2dCNDjN4JQeRLRYBdAsa
	K235ARe3SmwqVyiJQuMjkxxK52UnEVFvWZAMWH6LqPK3MpP4Om/W21wPTlOLxDJSg1Shml6VsCV
	CCJQ9y0pC7xkNmnMKlRy5awcxPgnJARpfTvSYoFMqDLIZlELnfm+27rsdmkOt7y+Dy2M/epXB5W
	9pC9q7Us0JYLnwB9ZlZIla97jtkffivBg+1hnxkS3wlc2+6MmjsY1fWkMB+2qLg7hPk7UarP2QW
	r3g/5/uQvNmDusehWguF5RuCvAIIV+Ia+oa40vMCT1YGQ42a4QKiIoDdpyBDvRS7end7F+KyhYP
	BIEVE4KUFMtj6t2m9UnT5tiqY5mANJohNTeOjs5PqxSdwAdEVrqu1ssUQzkuUB+siRGtZlSoGn8
	Kg0C9QarHHoDxPLRDBmAGdUXkrWlKIE3/pqBlg6RAeiaDhy6K1967Mg13PGsi2ozq9J0NA8dHM5
	UPlgKXlzWDntyGsMZyIG2ZtsIfTlisgYlQKl+GfX
X-Received: by 2002:a05:701b:2818:b0:187:c940:21b9 with SMTP id a92af1059eb24-1a6cd684cd5mr7037612c88.30.1793269901257;
        Thu, 29 Oct 2026 03:31:41 -0700 (PDT)
Received: from archlinux ([2405:201:ac01:5300:9bc6:9c9e:e00f:4eb0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f143cacsm12888470c88.16.2026.10.29.03.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:31:40 -0700 (PDT)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Olivier Langlois <olivier@trillion01.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org,
	Anvik Loitongbam <permissiontogallop@gmail.com>
Subject: [PATCH] io_uring/napi: fix list use-after-free on PREEMPT_RT
Date: Thu, 29 Oct 2026 15:52:44 +0530
Message-ID: <20261029102244.141621-1-permissiontogallop@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Commit 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
converted the NAPI list teardown to list_for_each_entry() and
kfree_rcu(), with a comment claiming that list_for_each_entry_safe()
is not necessary because kfree_rcu() defers the free to the next
quiescent state.

This assumption only holds while the surrounding spinlock section is
non-preemptible. On PREEMPT_RT, spinlock_t is an rtmutex and the task
can be preempted while holding ctx->napi_lock. The raw lock inside
kfree_rcu() only defers the preemption until it is released, and the
release still happens before the iterator advances. Once the task is
switched out, the context switch is an RCU quiescent state, if the
preemption lasts long enough for the batch to be flushed and a grace
period to complete, the callback frees the entry, and the iterator
then reads e->list.next from freed memory. The same pattern exists
in io_napi_free(). I did try to produce a uaf on an rt kernel
build, but it did not work.

All list mutators are serialized by ctx->napi_lock, so the entry after
the current one cannot be freed before its own iteration. Caching it
first with list_for_each_entry_safe() in both loops might be a more
safer and correct approach.

Fixes: 45b3941d09d1 ("io_uring/napi: fix io_napi_entry RCU accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
 io_uring/napi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/io_uring/napi.c b/io_uring/napi.c
index 7e698720cd51..d299c89cfc3d 100644
--- a/io_uring/napi.c
+++ b/io_uring/napi.c
@@ -110,16 +110,10 @@ static int __io_napi_del_id(struct io_ring_ctx *ctx, unsigned int napi_id)
 
 static void __io_napi_remove_stale(struct io_ring_ctx *ctx)
 {
-	struct io_napi_entry *e;
+	struct io_napi_entry *e, *next;
 
 	guard(spinlock)(&ctx->napi_lock);
-	/*
-	 * list_for_each_entry_safe() is not required as long as:
-	 * 1. list_del_rcu() does not reset the deleted node next pointer
-	 * 2. kfree_rcu() delays the memory freeing until the next quiescent
-	 *    state
-	 */
-	list_for_each_entry(e, &ctx->napi_list, list) {
+	list_for_each_entry_safe(e, next, &ctx->napi_list, list) {
 		if (time_after(jiffies, READ_ONCE(e->timeout))) {
 			list_del_rcu(&e->list);
 			hash_del_rcu(&e->node);
@@ -264,10 +258,10 @@ void io_napi_init(struct io_ring_ctx *ctx)
  */
 void io_napi_free(struct io_ring_ctx *ctx)
 {
-	struct io_napi_entry *e;
+	struct io_napi_entry *e, *next;
 
 	guard(spinlock)(&ctx->napi_lock);
-	list_for_each_entry(e, &ctx->napi_list, list) {
+	list_for_each_entry_safe(e, next, &ctx->napi_list, list) {
 		hash_del_rcu(&e->node);
 		kfree_rcu(e, rcu);
 	}
-- 
2.56.0


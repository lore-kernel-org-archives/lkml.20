Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285825;
	b=WoqbgdWo35tTkM+RJK1JWfyksp+ndl1/nlTb2g3rO7gMBtjsz1JncynDu5DbyXBADTBQ
	 DLat+yiPwSOlxzhBPPdXvUppojE3hXnqmwIe/eQITdkilTQ3yDHH9KBSBfGViJENflgeI
	 risliQMNBW6x0Zp7nTFFRqTXS+UoACC+iRbFd3m7wN/MihdgVWKcw9FrTkvZuGiJOUTf9
	 sEkJVcNXpQVOrcQwNr7NjIwxlKSQd0RBgvW/fyKn8GY6ihtXCCNOkgqgLi2IH2TP+41Hq
	 3OfmMO5i7AjWrTjjRYc2Tu2Qj25WI/X4NCIaSCgxBFUJEbnWZYKxJkNDIsDwJLrrdHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
	b=eERjjNWEg+P90kiCtjptRS8mcy2s7bVMutDkas/7ein79ux0/1dQUxL2awjr3/SNa+fM
	 6vfeigl8Ua5ZSluyLL5jYDBkUfhahggW0xcQ5p76X0DTJKkd74MK++shArqUhG87zrFaz
	 pqArdJTmbPA0JAsRfKpoN4KVnL+ey3c05JLhJNOK9foSABYgGSMrx9zyRvrvP3dzUK5jS
	 0oAamtKnIiRfoF5j7MIEYG+j8xIAOw1SUpkxiUxsrSdoBrcCmbk6XtlpHyC52/skQRr4N
	 JA5Pg+UUt24slVOgFDW8uEb3m3kQ2xxgvRflJOswWeo0quIQ+aoM9Pwz+dbE/avqKbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8fd55D+;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED30606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8fd55D+
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so1121332c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285824; x=1793890624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
        b=V8fd55D+/HEMHsW7RYUEt2g2wOfdJsv0hxmj3lwlTOtbN3mPIyzX3pSv6fw2FMGq9n
         HAbN/wac6+VnIjLWeX/L1ZA/CZkS2jZtT01vCzTBuLbEcDUZRYf/IqhfsZhTgn8YZFOh
         KRtpBGajuM8KSXGQklRLAVQgtND15xESWX38Wco96OY3SPDNx7e8HeMbdmqdweGBbqut
         has/yFbDHbxt9ZgVHaiokS2oMzXVKzLoNIoZxX3o44BmHbNFawZPXLWxWZLm18ILd1H7
         1EnjrVNF0v8KTpMx8WkkVSuQkHjL5zsNx+RaAM0HiYLyvThulWIpenzMvXTFbgymiISb
         U2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285824; x=1793890624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mA7k5sPJlxoToBjzm3tFJNRMVw01HsxJ0brlZT2Pnt0=;
        b=O+yJxb8dNt0aroOD6DOyP7B3Wjql2mMYf2Rj3CkQT76LiZChXKrVjSzct8xS3iHUrn
         QSg9lAfz6cKLuIVtDw9dwRQzbX0OhOQY514stCpgiisHZQMFF6YxvEcPmyjbf5CMhWPN
         d6nU+4v6XsytXbhfac6oKsXRiEQHOlFqG0maoKGty8/m17KTzFOrZ+fiZ05Z4YCu/NyQ
         Nbq5AbHmvzdWdKAuxS7CMGKfbXDinPgqo09UulHu3EwkTW7PZpQP6J2yvZL+/wRxpFmS
         YR0sakhF8ITTqQjFw1wvv7E3wxSpawp4rJzuftRNgLcjD4D0J0c149u6nHW6IGBKc3Nw
         bBoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH2YtMxkeyyqIuPpfNxRk6p6IMVR1nxy5MIqjraIofSOhDMFBvHP0fA2tHIQJ2b4zb+A0xdwlQiz8otQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOFz+LeCYLtJtg+3HUnbwGjNGz90u3NSJu7IWUdO8ykgHVkJkc
	mVGGhWbGtNbAJijYHk0i5HTg4/ssFX/F3Rd6quOOURrVmhaRg8DvL1w=
X-Gm-Gg: AYBFou3PToUKF702k20i6akoNsZEAGw7oRUyZrx1b9k4CShzfyhO/YkO6NCLLQ3kTKx
	aSABTqknOkipuCLQv/hUgw9BlQkcHNS6YTuegigVxVF/fuJYbi0BDNymDSr7UjqE/jVjMpC4k7C
	hm9ABS+EfJQMDeZnNW/IqCMvjIPDx+tlRQvmOfrN8B1j/O8fGff1VvFM+PU8z5sDDmyb5qtnixb
	PdsbuAqERZr+QF0UMLlWkS9Dx+EgQtkLAr5bpKhkh+WJX0c3gbyMC9WRF7PbpevtDBdoHtCjNBM
	vxF6NjCXzMtkthgM3U44CJeJXKSe1xbPE8kDt0UaRdhYGzoA+36M9VolHZZkQnkgtilzF/oqt4z
	GLwclO+EYjX/SnXZD3iQhB2F/3MCVv7wTWQnsImpgfSXEapd1lLq1yZggrXyUrK5mZTPcatHaYt
	RnDavhwASByODjE0ZY0UDVrPANBwSuUuWcL18CB7zTdY7VmOC49RcuwEhG/JQssZymtGJwWzZsO
	j0Gd8oZE+BlC4s125hV0mrLORLnstayAZ87No4FkkbfEpLhJPR9A51eOY+bPBqWvArQpcyZwr45
	LRelCS5H/495UMjt4cjXVCho39SsbnJfHA==
X-Received: by 2002:a05:701b:2097:10b0:145:4ef:e8de with SMTP id a92af1059eb24-1a6c7e2166bmr7927223c88.6.1793285823529;
        Thu, 29 Oct 2026 07:57:03 -0700 (PDT)
Received: from archlinux ([2405:201:ac01:5300:8:4c2:8722:36e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm14275350c88.0.2026.10.29.07.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:57:03 -0700 (PDT)
From: Anvik Loitongbam <permissiontogallop@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Olivier Langlois <olivier@trillion01.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anvik Loitongbam <permissiontogallop@gmail.com>
Subject: [PATCH v2] io_uring/napi: clean up list traversal with list_for_each_entry_safe()
Date: Thu, 29 Oct 2026 20:17:45 +0530
Message-ID: <20261029144745.23792-1-permissiontogallop@gmail.com>
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

Switch both loops to the standard list_for_each_entry_safe() pattern and
remove the explanatory comment.

Signed-off-by: Anvik Loitongbam <permissiontogallop@gmail.com>
---
v2:
  - Resend as a cleanup rather than a PREEMPT_RT UAF fix.

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

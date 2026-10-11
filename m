Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3447E3BB9FA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731606; cv=none; b=tr24yTPP7sq8B6RMzyavVgLTj/xLeuLCP9za5G2HOYW/VMW2YOrHp9WMN0baTVPROZB9QorVIr//Tu4fhbN+S7t/J6N9VF78/J8v6qWzf+d1HNisioNiBgF8T3t7ufOSllqoL3sTz05MhaLzwX/hAZbLvXKVZ/DfOX1scHilpn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731606; c=relaxed/simple;
	bh=wP550UQ3WNRFZOr28N2FE4tNUuHVthdgbMQ76TisVjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pIfFQNrLYZzlvxX+92gZ7kcI4DBVjeE8xRw/VmUxSqD5d7575cX+p8W4twDFAIDZiwdkNsr0YT/0NaIpXIAtAcAodyfE+mlcEyhEdHq9nMUi5HUqhapzDVTa7CfQIiEOsfrBew6JOgUTI1eqOySNsYLGGQ0MfcG1ulddlCVfBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORCoiK4x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORCoiK4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791731603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=714yqAZTRj/a33tbhrXMlSgRJqGIyjQ+vWHwkJlfQuI=;
	b=ORCoiK4xZo/M1jbwdyJNp1bwQwbbWNQLX183RPcSos5QizG/Hk4nhOEI9ZUvBNZoV8PTwa
	tH9bJ67wRA9s8IhENUS4MFHXM5MGY4beq3zjrIL9Dc00wL1Ipl7QlMKzmv/K76M+IzKP0S
	8bMlV/Ayvg3m22GeaWPg62uLQXhW1so=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-HvhnI5KcNEKUQ6SO3kHY1Q-1; Sun,
 11 Oct 2026 15:13:21 +0000
X-MC-Unique: HvhnI5KcNEKUQ6SO3kHY1Q-1
X-Mimecast-MFC-AGG-ID: HvhnI5KcNEKUQ6SO3kHY1Q_1791731600
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC09D1955DC7;
	Sun, 11 Oct 2026 15:13:19 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6F56E1956086;
	Sun, 11 Oct 2026 15:13:17 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 11 Oct 2026 17:13:19 +0200 (CEST)
Date: Sun, 11 Oct 2026 17:13:16 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/io-wq: don't call try_to_wake_up() twice in
 io_wq_worker_wake()
Message-ID: <asunjCm5Ovj_YDSp@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

io_wq_worker_wake() does an unconditional wake_up_process(). This means
that __set_notify_signal() makes no real sense. Change it to use
set_tsk_thread_flag(TIF_NOTIFY_SIGNAL) instead to avoid test_and_set_bit()
and another wake_up_state(TASK_INTERRUPTIBLE) if NOTIFY_SIGNAL was not set.

Perhaps io_wq_worker_wake() can rely on __set_notify_signal() solely, but I
don't understand this code enough and this patch doesn't change the current
behaviour.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 io_uring/io-wq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2ca223e47d41..eb90961f32d8 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -972,7 +972,7 @@ static void io_wq_for_each_worker(struct io_wq *wq,
 
 static bool io_wq_worker_wake(struct io_worker *worker, void *data)
 {
-	__set_notify_signal(worker->task);
+	set_tsk_thread_flag(worker->task, TIF_NOTIFY_SIGNAL);
 	wake_up_process(worker->task);
 	return false;
 }
-- 
2.55.0



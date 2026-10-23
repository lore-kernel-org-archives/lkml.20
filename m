Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752536;
	b=KQdfUyY+qnaehCcqkw4n12Sn171VVNmD/92yYfn/H/WK28aAm0c2ogYB5v4oaRifhf0A
	 VkbxBO1Yu/Dc9E6Bu/9sogvIzFMI6vxnlbtX6ANi4g8rIV4PekPIoA7kU1Yl6UAeayjaL
	 aYr59DLKkLqKUCMcKBZk4md8z0zf8vAORj2FxWROFQfRIKTw3qksTe4IZyMYKsL4/wSSn
	 xqbqb++QumLOD+WqaUXDEfDUSZVMFHbsrRJMNHu+NHLv1lyj1cVcNu4QX3NB/egf6hP+Y
	 Fk6rFOBNeWDkAhVcQO4NHDV7CwHvwOpHTa7o9RpHGLdtwk5r7YdIyjonx/7Qo22V1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752536;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=zfNUxTemVK4glLBiM0GFOurL8uvdVNd9D6C/7JUXdO4=;
	b=PiZ9f6krZoiwdWsiSpMkjoor0CLtqXn7NNTk0MVps5xIJ+pxxFP2Vo5FNDqePPqzXg/g
	 7pEIm4hcJQOs7O1g2BJ/032W4/md16SuAKtRLJg1SFc3A858SX0TgnSKu2CL5e3OWAo+W
	 Gjstw2zZ7rikKNFUw7udJf+rAwUXT2fxZM0dmswpp5w6GuK7rod21s1mirVzBPoOQH0/t
	 2TpkKX2pzfQ9DjxXTp4oLzcBvQ3v0S59fffrKFma5wzUwXOr5GaeDPAIJN2+5Si66af5L
	 Sab68kZ9oaRb73KjPXH/pcO6humi0ADaXgfMpEN8peU1gUvwRmye0lzSTjIbrefaqTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Orcra3p4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BBC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Orcra3p4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792752534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zfNUxTemVK4glLBiM0GFOurL8uvdVNd9D6C/7JUXdO4=;
	b=Orcra3p46a+BttpmQnyvIOiIfwGOVsWsfvOuIR0eHSpOgEBvfwRBP7Is+qgUrp3QtWiCxm
	HCuKmXtmWyiF3YFO/hM6I2o+OH994BYVkJVtn42nJYIgFXlgrOBkV9z9Q3RSQEHVMyTHct
	3LcsrZx0CfEWJBpX4N4mNwhGGXqk8uk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-Kk1xxY8pPhqt_UnfzMKxfQ-1; Fri,
 23 Oct 2026 06:48:51 -0400
X-MC-Unique: Kk1xxY8pPhqt_UnfzMKxfQ-1
X-Mimecast-MFC-AGG-ID: Kk1xxY8pPhqt_UnfzMKxfQ_1792752530
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF8C4195419D;
	Fri, 23 Oct 2026 10:48:49 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4A7B27DA;
	Fri, 23 Oct 2026 10:48:48 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 23 Oct 2026 12:48:49 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:48:47 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] signal: cleanup the .si_signo checks in
 dequeue_synchronous_signal()
Message-ID: <ats7j0mb3VF6lIg4@redhat.com>
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022061015.3737924-1-thnkslprpt@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

- Use SI_FROMKERNEL() instead of open-coded check

- Use rt_sigmask() instead of sigmask() to avoid UB on 32-bit if
  .si_signo > 32

- Pre-calculate the unblocked synchronous signal "mask" to not check
  .si_signo twice.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/signal.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 7386b9552dc3..64259219bbdc 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -676,21 +676,17 @@ static int dequeue_synchronous_signal(kernel_siginfo_t *info)
 	struct task_struct *tsk = current;
 	struct sigpending *pending = &tsk->pending;
 	struct sigqueue *q, *sync = NULL;
+	unsigned long mask;
 
-	/*
-	 * Might a synchronous signal be in the queue?
-	 */
-	if (!((pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK))
+	/* Might a synchronous signal be in the queue? */
+	mask = (pending->signal.sig[0] & ~tsk->blocked.sig[0]) & SYNCHRONOUS_MASK;
+	if (!mask)
 		return 0;
 
-	/*
-	 * Return the first synchronous signal in the queue.
-	 */
+	/* Return the first synchronous signal in the queue. */
 	list_for_each_entry(q, &pending->list, list) {
-		/* Synchronous signals have a positive si_code */
-		if ((q->info.si_code > SI_USER) &&
-		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
-		    !sigismember(&tsk->blocked, q->info.si_signo)) {
+		if (SI_FROMKERNEL(&q->info) &&
+		    (rt_sigmask(q->info.si_signo) & mask)) {
 			sync = q;
 			goto next;
 		}
-- 
2.55.0



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454434;
	b=4Jk1QXtbjDQ5pm0BsE/hgdMtiGIf5/HXL6j7UfpVUB2MesttDG9mMzHv/KOiS3hBJH56
	 fsqOymNjOXrjfz+dldMQD4G7FcaqXPV2NBHYpbRUMv6kRJ77Yt6hszli3BRrdeMM+jPy5
	 WHGiARETTOwUoMe98KZ5nwhMh2yoFezVKNuI7G//PGKQofSsdEyBMk9y0trAP9cnouCiF
	 jaSuJ6ga0lYzGFU82D1GQwufuohMP4oEIuF/8hh5M0wXtfoYFU84YpCGTs599QUdj7zRK
	 8x63jEd++/hNpzvv1Wl5Wk+0r/MCPyjBlgL4wVqBTUCysDThxKJBqrnAkBrZYdtq8PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454434;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=jTKKuLsYEqAOZNJCoM8pdcMeEKAuI1iZtgG9h0lsS6M=;
	b=ewrZWUlozQP8BWWB5Cywm8sB7AtKp/99hJej0ywStzeF/rSr2pQWlSZgwBnVv1xqYxud
	 YFixgf1vKgEwRSVKbNExM3y4/a8NRTtLgi/TDZ1bIPFKuP+dWjvMqkSA2l9F9Q1y6gIc0
	 PtRU9gvOUiIi5uuYh2Y6pcI4MtOsAj88L65SsMKGRQ04rnj9ZnApvNiEyuTBVFCyDqo3O
	 EJEGxdubYzsT1RLF4jdIZPZIJIdH9c+MxgiXjDPY4XHhbp8/dylGQJKOFia8pgY+q3sKT
	 UsEaSLV/xa4B6q5QeTpxB+6dhcZU9arao4lGYvPcMGPa51S7sp6D+3R3ogNmyxC6Fdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNUo8CAR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626DB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNUo8CAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793454432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTKKuLsYEqAOZNJCoM8pdcMeEKAuI1iZtgG9h0lsS6M=;
	b=RNUo8CARlbgv5qBa7Op7FXleOiMLODnmEA94rFBGLoKIite2EC1tlW7V5naat2TkKWwuO3
	4+oKOebHupPVT9wEgA9psKO8SB0Dlr4Wv/roUb8It5DJ1YuqA+UOu8mnfFp3hwzqlc1lgQ
	++PGPESioPzIysvUDvaMtm2e4Xt5C0Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-Z50pdBIeNbShtNgKwGAFUQ-1; Sat,
 31 Oct 2026 09:47:02 -0400
X-MC-Unique: Z50pdBIeNbShtNgKwGAFUQ-1
X-Mimecast-MFC-AGG-ID: Z50pdBIeNbShtNgKwGAFUQ_1793454421
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E29551955D50;
	Sat, 31 Oct 2026 13:47:00 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E07A31956087;
	Sat, 31 Oct 2026 13:46:58 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 31 Oct 2026 14:47:00 +0100 (CET)
Date: Sat, 31 Oct 2026 14:46:57 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] signal: fix lockup in complete_signal() racing with mt exec
Message-ID: <auXxUSMHCh4vA3yV@redhat.com>
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
 <auM7-dpXdaNZQFFc@redhat.com>
 <20261030-specht-grinsen-vererben-aedb50f4c96c@brauner>
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
In-Reply-To: <20261030-specht-grinsen-vererben-aedb50f4c96c@brauner>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Nickolai Zeldovich says:

    kill(2) of a process while a non-leader thread of it is in execve()
    can lock up the machine: complete_signal() loops forever with siglock
    held and interrupts off, and de_thread() then spins on siglock in
    release_task() with tasklist_lock held.

    The curr_target walk uses next_thread(), which wraps from the last
    thread to ->group_leader on the assumption that the leader is first
    on signal->thread_head. de_thread() makes the exec'ing thread, the
    last one, the leader before release_task() unlinks the old leader,
    so a walk that starts at the old leader stays on the new one if
    that thread blocks the signal, and never gets back to curr_target.

Change complete_signal() to use list_next_entry_circular() instead
of next_thread().

Other users of next_thread/while_each_thread/for_other_threads look safe,
so this patch only changes complete_signal() to make a simple fix for
-stable. However, in the longer term we should update next_thread()
or add another helper, but this needs more work; next_thread() should
work even when signal->thread_head is empty.

Fixes: d639cf4abb4d ("change next_thread() to use __next_thread() ?: group_leader")
Reported-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Link: https://lore.kernel.org/all/CADGQE7EusFrrSoBnhXhdE20tZJrp1EDe=2623mS8vEMY9hn53A@mail.gmail.com/
Originally-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/signal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 2474507ac92b..bf5518be67a2 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -987,7 +987,8 @@ static void complete_signal(int sig, struct task_struct *p, enum pid_type type)
 		 */
 		t = signal->curr_target;
 		while (!wants_signal(sig, t)) {
-			t = next_thread(t);
+			t = list_next_entry_circular(t, &signal->thread_head,
+							thread_node);
 			if (t == signal->curr_target)
 				/*
 				 * No thread needs to be woken.
-- 
2.55.0



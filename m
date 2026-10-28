Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197769;
	b=odF+744ozCc9ZJ2pAlq6tBqSYhkzvkpnpiWU8T5W8y7NT0ahZyfpygS/1XW1bIEFJi9Z
	 +9W3m83xuMpAe2btcqjXJj0q7EFyhByS1oF/cou8QoApoQOnX/hZb7wc0ZJnoP6ZcnHQj
	 0uX2266FkKQc3KoYxvV8VGKcZPSrU17A9Rw1RME7Vco5jrXC5s4MsAFsND1hRslCoqm0Z
	 lUo9YRWPKyJZZdZqWSQprV5xj00o/XC+CAuHA4fACsspGSNsTOPzM3fJH/tq0EVe5DekI
	 mKeAS0rh2EX0lsVDFGvsav7M2hLUesuN9qajlF63ZtKX0SMP/5ibP11jf5k/QHWtAOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197769;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=exKGzOXY8gam3O8SwtKtiRVlfcwMPERjL13LnGDExi8=;
	b=INAHZis1hI6yX7pkDIONWVPHIu67ZX5jryfLYIKxUerPOxOItv8f1ZlKQQGg1djMTulW
	 5/tTBQ8dkFeyTi19Y5B3RJ8+gMhBusBUagUiOX+HR35mMJK3tS/1LWpSXvz5+kovcJ+yb
	 116q590v6x9N8rFClJBOa90Tb/408kdeCVYonUKIpCvWruyZLwbFz/mEKxFEXfr7CXvp/
	 KxFXGR3bu/mPFeWLxBjXw4FNQS05UHrIe5UuUhiYyt/+WA/W3bMP1io0lrf6v+WbpOubP
	 fO/vJSpc75gWpHHxHdk28EznwPeW7XXafhVqyCrCqoK6X+wpyMMpcRz9YViHSvkqKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="cjI/7eak";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cjI/7eak
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793197768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=exKGzOXY8gam3O8SwtKtiRVlfcwMPERjL13LnGDExi8=;
	b=cjI/7eak7BRTLMag0GOQwlxKlHXmUE6ibNS+s5pMxgTJn7O6sL5D1K6U+/TCIY4s31gPLy
	n3CL/NL0vgnwYBq9Vo+9LzUodmNG3WlaE+gcLqfRLmlIXTdu2s7v39qRmW/GcBFNbhcjYR
	woqqizU/RYr9b2TrrKCrJlSnwc6npzU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-l1ZkB2SAN1mFqvJDezFHpg-1; Wed,
 28 Oct 2026 10:29:24 -0400
X-MC-Unique: l1ZkB2SAN1mFqvJDezFHpg-1
X-Mimecast-MFC-AGG-ID: l1ZkB2SAN1mFqvJDezFHpg_1793197763
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32B6E1800576;
	Wed, 28 Oct 2026 14:29:23 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3A12B1956095;
	Wed, 28 Oct 2026 14:29:20 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 28 Oct 2026 15:29:22 +0100 (CET)
Date: Wed, 28 Oct 2026 15:29:19 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] signal: fix endless loop in complete_signal() during
 a non-leader exec
Message-ID: <auIGv1WkQnEw6VRd@redhat.com>
References: <20261027025055.842038-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261027025055.842038-1-nickolai@csail.mit.edu>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/26, Nickolai Zeldovich wrote:
>
> The curr_target walk uses next_thread(), which wraps from the last
> thread to ->group_leader on the assumption that the leader is first on
> signal->thread_head. de_thread() makes the exec'ing thread, the last
> one, the leader before release_task() unlinks the old leader, so a walk
> that starts at the old leader stays on the new one if that thread
> blocks the signal, and never gets back to curr_target.

...

> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -990,7 +990,10 @@ static void complete_signal(int sig, struct task_struct *p, enum pid_type type)
>  		 */
>  		t = signal->curr_target;
>  		while (!wants_signal(sig, t)) {
> -			t = next_thread(t);
> +			/* during de_thread() the leader may not be first */
> +			t = __next_thread(t) ?:
> +			    list_first_entry(&signal->thread_head,
> +					     struct task_struct, thread_node);

I think we should fix (and simplify) next_thread() instead. How about

	--- a/include/linux/sched/signal.h
	+++ b/include/linux/sched/signal.h
	@@ -764,7 +764,7 @@ static inline struct task_struct *__next_thread(struct task_struct *p)
	 
	 static inline struct task_struct *next_thread(struct task_struct *p)
	 {
	-	return __next_thread(p) ?: p->group_leader;
	+	return list_next_entry_circular(p, &p->thread_node, thread_node);
	 }

?

Oleg.


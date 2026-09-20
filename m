Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D637A48A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914930; cv=none; b=uauUZm7W3AUiUAaT6SXZC46gXKwO/VUFNOVO8LEsSMQEAEigQWqZ2HhVg+A35KSgsfVOlhzeQg3GENNyRqNJeK6r/F1j3W6fgouUyt0MixvFNEL43vSJKtuG4RsxsRWd29JmAUmQD2zT6kU5EA7DW5uyKG+D1o6rfdbI+VUQQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914930; c=relaxed/simple;
	bh=T+EgAH+UK3oOi3HLkcnHa77p1/yBcjV8M1lcsomHqWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9GJhIHqas7+SQHTBTH5dXFli5Th6b330uVhpp2ahONS2SLZkN0UsnRLMBq/ZyXnONi46WQBAoa9WBAXfhaVwPm1vzEbbQYahHUVhq0llbTc+cjqbR8uPBcQOqdamK9GJTfy5vx2tQqv12qi1V9zYm+Md+D0+AuqGTUkJ02pOs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3305I0B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3305I0B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789914921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqmxR+beq4Vh+znG7NJhewwKIO1Dx2cug9jFz7mxzKc=;
	b=C3305I0Bvglw1zXW6IO3XHDpaVw3MlgjYe6JijHHwoepMtI65MDNffK62YQOBvtLk2tUvT
	7pr3EoPqn+3Cu1WOzFttK7TL1vowIVfnSfUs6oJJLfXr0qnSPHAq6ec41BHgRez9yJj0Hy
	xaJL/4uPwZ7KdroMq6vqEjwJe2F+1Fk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-yNZ7dniZOMySvQyTrjqpOA-1; Sun,
 20 Sep 2026 10:35:18 -0400
X-MC-Unique: yNZ7dniZOMySvQyTrjqpOA-1
X-Mimecast-MFC-AGG-ID: yNZ7dniZOMySvQyTrjqpOA_1789914916
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BFCE180067E;
	Sun, 20 Sep 2026 14:35:15 +0000 (UTC)
Received: from fedora (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A08C31956095;
	Sun, 20 Sep 2026 14:35:10 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 20 Sep 2026 16:35:15 +0200 (CEST)
Date: Sun, 20 Sep 2026 16:35:09 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Adriano Cordova <adrianox@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 1/2] uprobes: Use a dedicated mutex to serialize
 prepare_uprobe()
Message-ID: <aq_vHbcivZTtKZLN@redhat.com>
References: <20260918143209.709291-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918143209.709291-1-adrianox@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/18, Adriano Cordova wrote:
>
> prepare_uprobe() serializes its callers by taking consumer_rwsem for
> writing. That rwsem protects the consumer list, not the instruction
> copy.
>
> Give struct uprobe a dedicated prepare_mutex and use it instead.
>
> No functional change.

So why? Is it preparation for 2/2 ? At first glance it doesn't need
this change... Please add more details.

Oleg.

> Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> ---
>  kernel/events/uprobes.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index 7709ea882477..686585539ebf 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -64,6 +64,7 @@ struct uprobe {
>  	refcount_t		ref;
>  	struct rw_semaphore	register_rwsem;
>  	struct rw_semaphore	consumer_rwsem;
> +	struct mutex		prepare_mutex;	/* serializes prepare_uprobe() */
>  	struct list_head	pending_list;
>  	struct list_head	consumers;
>  	struct inode		*inode;		/* Also hold a ref to inode */
> @@ -1007,6 +1008,7 @@ static struct uprobe *alloc_uprobe(struct inode *inode, loff_t offset,
>  	INIT_LIST_HEAD(&uprobe->consumers);
>  	init_rwsem(&uprobe->register_rwsem);
>  	init_rwsem(&uprobe->consumer_rwsem);
> +	mutex_init(&uprobe->prepare_mutex);
>  	RB_CLEAR_NODE(&uprobe->rb_node);
>  	refcount_set(&uprobe->ref, 1);
>  
> @@ -1104,8 +1106,8 @@ static int prepare_uprobe(struct uprobe *uprobe, struct file *file,
>  	if (test_bit(UPROBE_COPY_INSN, &uprobe->flags))
>  		return ret;
>  
> -	/* TODO: move this into _register, until then we abuse this sem. */
> -	down_write(&uprobe->consumer_rwsem);
> +	/* Serialize concurrent prepare_uprobe() calls from uprobe_mmap(). */
> +	mutex_lock(&uprobe->prepare_mutex);
>  	if (test_bit(UPROBE_COPY_INSN, &uprobe->flags))
>  		goto out;
>  
> @@ -1125,7 +1127,7 @@ static int prepare_uprobe(struct uprobe *uprobe, struct file *file,
>  	set_bit(UPROBE_COPY_INSN, &uprobe->flags);
>  
>   out:
> -	up_write(&uprobe->consumer_rwsem);
> +	mutex_unlock(&uprobe->prepare_mutex);
>  
>  	return ret;
>  }
> -- 
> 2.51.0
> 


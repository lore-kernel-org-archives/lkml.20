Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF7043BDC7
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720578; cv=none; b=IC8FraWY1qTgSfZJb38te/cS1QiT/Juvk+epzYkw/HqbGv7GbI5NViIxPyqM01uCjIav4Q/i8gkZvJ5AdsbX5K8iUt2HdpoVAdhZ1JAU+IB2n3uNq+kRn3VK+5GIXcXYw8DpMsJp0c4jMOXF3rZvI/DlrcQZ7VtwU5CEhA2K5/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720578; c=relaxed/simple;
	bh=XkUuVKsRAEXHBtJkuxdjS2d1ALB53Z0TuHfS9v54NHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrxJqHl8xwT+90dz/3LvtAgwhD54Ls9XEj4Hs5/YaFHYB1NGKhV8soE77jPMvh+pU4TfqEiE0rBFapbkkvkkBmA2u4Yy2VDTJfplOvvHRpmQbUHuoy231a4H5B6nhHs3jta1Q65RJfHULdzylwZARgKwnZ2yQoLuGA8PGsp/Esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ok7NnRD1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ok7NnRD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791720569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwvwecTDMNhwbscli9yK7ZDqTvlHsUL7Dne4AH8ChFc=;
	b=Ok7NnRD1fPmbiUW28lQujmjOqoqJbGS0w6Lh4TzppOWKatsPEkbFunwVrPlUqVQ5AUOJod
	RyJTZ+jLGKMCz03gfnUd6vplg1pPh/CkOTv12gTAC78pU5orvYg+wTRjIESoKxn7cGnEJI
	7HVob7/PZQmrjuvyW9lN6vdRh9sdF64=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-_ez5URLwPiGDpVw4jueOxQ-1; Sun,
 11 Oct 2026 12:09:20 +0000
X-MC-Unique: _ez5URLwPiGDpVw4jueOxQ-1
X-Mimecast-MFC-AGG-ID: _ez5URLwPiGDpVw4jueOxQ_1791720559
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F0EB195399F;
	Sun, 11 Oct 2026 12:09:19 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8E0F930000E3;
	Sun, 11 Oct 2026 12:09:17 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 11 Oct 2026 14:09:18 +0200 (CEST)
Date: Sun, 11 Oct 2026 14:09:16 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] exit: fix lost-update race on the child_subreaper
 bitfields
Message-ID: <ast8bJdwDYBnGRT7@redhat.com>
References: <20261009222404.760787-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009222404.760787-1-nickolai@csail.mit.edu>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/09, Nickolai Zeldovich wrote:
>
> is_child_subreaper, has_child_subreaper and autoreap are 1-bit fields
> that share one word of struct signal_struct.  A store to any of them is
> a read-modify-write of the whole word, and two of the stores run
> without a common lock:

Yes, thanks, this is obviously wrong. But I am a bit confused...

> autoreap is only written to
> a not yet published signal_struct in copy_process() and is not racy by
> itself,

Yes,

> but it shares the word and is converted with the other two.

So why? If you turn the *_child_subreaper members to bool, then
autoreap:1 is fine?

Oleg.

> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -130,9 +130,9 @@ struct signal_struct {
>  	 * process will inherit a flag if they should look for a
>  	 * child_subreaper process at exit.
>  	 */
> -	unsigned int		is_child_subreaper:1;
> -	unsigned int		has_child_subreaper:1;
> -	unsigned int		autoreap:1;
> +	bool			is_child_subreaper;
> +	bool			has_child_subreaper;
> +	bool			autoreap;


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A632BEC2A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728684; cv=none; b=Mz9Ru76Q8DZJmDuet35B2UNKZFL328utVNHJmFKdN3BX+dHPl6iUeodX21cwB8ii70uppq36zWnYa3L5KVpylbWI23uBmSqOTMxx/ROnoRSutkKlrmEc5tjYGbNjp9IIp05NXEo2yFoNOW69AP9OFv3DfcEFY8dm3pJdxtUKgtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728684; c=relaxed/simple;
	bh=ySoVsxr6Izm5qYfouLLYWrkciqn9D4QnRCqqQnGrIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aV8vgwMVuIoGN4CpOM1nGrrgn35cp5CCRkTCaX3KPfzusMRsmWZDyolN018KledbUblOiJlc+7l1A5/fug+SUUGzTBokA+kf9TIPUJvhwR3VbixgK8F+HiqkJhqCia8dCSGpojaicgoSUzgWeL2OqBF3XOwWE337/BTSeoVGdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAJtSi5j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAJtSi5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791728681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KMzdZtm4NHCuovIEyOrY8wGVEtAQ8c37M6WZWDg8apY=;
	b=gAJtSi5j7jSZwzP2QqXj2xcd6XZDEr/eOmFkehkXE1wRcVesESwFs95yDIz5ZHpnCnduhy
	Emdcp3H72e+ieisPwnp6Fx8bO4cP7NfDf9p5c86kwqs7maTNZwbw+gxPoSxABjYY5Ed2dQ
	H0F53ydYhav3be6Eoih4WvkjxHZEVb4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-42-3e15T4w_PS2KXNAafuyrSg-1; Sun,
 11 Oct 2026 14:24:38 +0000
X-MC-Unique: 3e15T4w_PS2KXNAafuyrSg-1
X-Mimecast-MFC-AGG-ID: 3e15T4w_PS2KXNAafuyrSg_1791728677
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E0E8195411F;
	Sun, 11 Oct 2026 14:24:37 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2B6101956095;
	Sun, 11 Oct 2026 14:24:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 11 Oct 2026 16:24:37 +0200 (CEST)
Date: Sun, 11 Oct 2026 16:24:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] exit: fix lost-update race on the child_subreaper
 bitfields
Message-ID: <asucIglkIcdLstzP@redhat.com>
References: <ast8bJdwDYBnGRT7@redhat.com>
 <20261011123440.768054-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011123440.768054-1-nickolai@csail.mit.edu>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/11, Nickolai Zeldovich wrote:
>
> --- a/include/linux/sched/signal.h
> +++ b/include/linux/sched/signal.h
> @@ -130,8 +130,8 @@ struct signal_struct {
>  	 * process will inherit a flag if they should look for a
>  	 * child_subreaper process at exit.
>  	 */
> -	unsigned int		is_child_subreaper:1;
> -	unsigned int		has_child_subreaper:1;
> +	bool			is_child_subreaper;
> +	bool			has_child_subreaper;
>  	unsigned int		autoreap:1;

Thanks,

Acked-by: Oleg Nesterov <oleg@redhat.com>

perhaps it makes sense to add something like signal_struct::atomic_flags
later...

Oleg.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198285;
	b=s8FhgNRmT+3bD1bEssV75Z3H+aGYpAiYanRAit8/kmmBAUhHhZc8l7NAFYXelUgIwj5v
	 liaeiKzqK3ffRZSPem+53cOo9NMG7a4mdc7hIum7lB8CKFUXLonUihAU2i7v5cRy+ECkF
	 J8gqsh3Sea6zzYZVuVCbpJzEHMdlXmy/sfPTx+8tnPRx/0YtUneU9WgIaaDzvjp4KTL+4
	 wYhp2uhVcenkgOo48UUw+KSH881vRkXS+uqISQAfZzE/aIKtkgIZCMxeLtWDT4iU8nPIL
	 GgVF0U3dEOIR5/7h8Lu06KNQgISGNR3nes9Sk/ZylE/w+m/qp+CLXYfY4D7+9rOYCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198285;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=SsgeWLG4dI0l0/bC6ar9wPtwyPpf6L7PqvCPXj7gOQE=;
	b=kb/u8HO7hVhQZnt00ThTC3U6pH56zTO6XZ3rn8eUTADfqp2iy4Aewi6sD0aBYV1fBuQF
	 ExoOkmQE1Rplyhhy6bVAcJosbzuH8IgObzn5dYdfKGDL+y6/k1YE9xA2OzD4T9DpxIHgY
	 5d/rSbeG+D/zq8zxxQ4JdZ1RwRXpwx66Sjg00lFz7mJPbOv2L/QsOyxiO6iXxPRkLW3mz
	 q1el5HFkj3W9HiYZP1kE0AIGJaPqS3FhcLLHMJGrvY3NC0gp1PTs3Rs2RsmTOF1S6+7aM
	 HWI8mgY7+7eEKxN8d2pk4xqWI3pxwDjxkZSeEXhVdH4H4fU6mOyk8x3YtFsg+duSsFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6SK1F6G;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B904606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B904606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Y6SK1F6G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793198283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SsgeWLG4dI0l0/bC6ar9wPtwyPpf6L7PqvCPXj7gOQE=;
	b=Y6SK1F6GZJnWwamsHB0Pp/GAIBenbfMFZTnI0vbxjc/F2zxb7PlH0ef5oK+ftu7VQqBGsV
	dci7Sr1yY0QtAo2gUW6Yn5fhtES2N36gOsgoPAVM/l559tDs1ab7VxOZdjxoeAOnzWR5S0
	LevPmM2e43/J0d8xw+20e+aNAd/OaX0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-QF4qfS1LM5m0tpuRNg4TWg-1; Wed,
 28 Oct 2026 10:37:57 -0400
X-MC-Unique: QF4qfS1LM5m0tpuRNg4TWg-1
X-Mimecast-MFC-AGG-ID: QF4qfS1LM5m0tpuRNg4TWg_1793198276
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 196681955F7B;
	Wed, 28 Oct 2026 14:37:56 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CD3A319560AB;
	Wed, 28 Oct 2026 14:37:53 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 28 Oct 2026 15:37:55 +0100 (CET)
Date: Wed, 28 Oct 2026 15:37:52 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, tz2294@columbia.edu,
	Mani Tofigh <mt4022@columbia.edu>
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
Message-ID: <auIIwLWa3MLWCd6q@redhat.com>
References: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
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
In-Reply-To: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/27, Mani Tofigh via B4 Relay wrote:
>
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -494,7 +494,7 @@ void mm_update_next_owner(struct mm_struct *mm)
>  	 * If the exiting or execing task is not the owner, it's
>  	 * someone else's problem.
>  	 */
> -	if (mm->owner != p)
> +	if (READ_ONCE(mm->owner) != p)

Acked-by: Oleg Nesterov <oleg@redhat.com>


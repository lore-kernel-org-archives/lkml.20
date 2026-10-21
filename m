Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568748;
	b=OazSPO6uoGUHypSM/lMZhvYsYfXTE7k7lzSa+QJ993Fvewy9odpZ2LI4IgwCdiH3Tyk5
	 s1fA04RDBIlc/ive/CJ1XdWoKyqR/xw57OKcP6emTYM00MVd1hDlFDCqAO2BGHGTLXkqR
	 sv9vnXyqCJykMsOpehzbs2SZ+wXvTO6n6r51BMzYLYGDW1UOiBD6kfmbAR8/FYxjCSVl7
	 MwuAV4cQwOocPH9Vw+GvUtNEsLfUD2CKHsP243ZJI/X0ihVHWsh2SUpORbtZjM7ccpF/8
	 cL9GIcZJrDJqM4ibi+57N1LpvDko85fHeHngQEIXJeLAn+uk8bKgYhXyeCx98whkxoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568748;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=yZ9dzElUrNf0CTJgu5J9eJfZsoxTEITPpufaPN7U7eE=;
	b=GEqzwCfeLFfbe9WePL/1gLH2HhJthZzE0JxCSlD3abMt/IG8SAWpGiCfNcNhjU+o74yC
	 /R/5KjrKVQsqSUaa1Jc6W27PAXjfh/JRO4qYB4gOAlfJf4/ETPgGZooazhVoQo8DBkayD
	 1+8V0nqU6kniB19SCbYpZ9lfdzwz7usjxUKTBmloWirjXHsYSal1rBchwOakyEcN2Eu8M
	 OvY4VsXNmFtheSrmcm+c0EorOIRaUYxQbMpMXvzeBS21wpRHFfYNJocbMdwE8XypxQLiJ
	 JrZNKB1NzF0IA9nJkCN2+iukfcc/td8UDQZlR3GivAh/4zF8cKj1T7MQOesN/R/QkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nw4T0UxZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AEA606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AEA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nw4T0UxZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792568746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yZ9dzElUrNf0CTJgu5J9eJfZsoxTEITPpufaPN7U7eE=;
	b=Nw4T0UxZ8ovYal9fJ+BLKPfTwnIFE9Owx/NG2s9ddLsJJc4eA7We6rG71bB6og1VYKy1HG
	80LEF3eoVCmlS7/2vbJ9G7f/WEPPex3P1IwWG8xa5PXYTRgMspf5YbFr6H/JJs6N1BH67J
	1FbGCwL54ESlBXJODCRnpPzHYPVEh1k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-BCR3WKfYOB62QTI01ndJAg-1; Wed,
 21 Oct 2026 07:45:43 +0000
X-MC-Unique: BCR3WKfYOB62QTI01ndJAg-1
X-Mimecast-MFC-AGG-ID: BCR3WKfYOB62QTI01ndJAg_1792568741
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACE191956046;
	Wed, 21 Oct 2026 07:45:41 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id EB9D01956087;
	Wed, 21 Oct 2026 07:45:39 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 21 Oct 2026 09:45:41 +0200 (CEST)
Date: Wed, 21 Oct 2026 09:45:38 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: skip blocked signals in
 dequeue_synchronous_signal()
Message-ID: <athtohIFTQig6_cF@redhat.com>
References: <20261020181101.1605736-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261020181101.1605736-1-thnkslprpt@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 10/20, Avi Weiss wrote:
>
> dequeue_synchronous_signal() checks whether an unblocked
> synchronous signal is pending, but its queue scan can select a
> different blocked entry with a positive si_code. This can deliver
> a signal while it is still blocked.

Heh ;) I can't understand how no one noticed this before.

>  	/*
> -	 * Return the first synchronous signal in the queue.
> +	 * Return the first unblocked synchronous signal in the queue.
>  	 */
>  	list_for_each_entry(q, &pending->list, list) {
>  		/* Synchronous signals have a positive si_code */
>  		if ((q->info.si_code > SI_USER) &&
> -		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK)) {
> +		    (sigmask(q->info.si_signo) & SYNCHRONOUS_MASK) &&
> +		    !sigismember(&tsk->blocked, q->info.si_signo)) {
>  			sync = q;
>  			goto next;
>  		}

Thanks! I'll send a minor cleanup on top of this patch later.

CC: stable@vger.kernel.org

Acked-by: Oleg Nesterov <oleg@redhat.com>


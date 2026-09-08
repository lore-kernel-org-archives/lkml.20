Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23042F12AC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908492; cv=none; b=nwkVXptrcDGXr3qZ3+dkYwjJyLHuAxsEMqF7WYc8xA/Os1agQYklGPaZmRhur3rHfcg7fuirvN0wQVP5vDMfdwO1Hhym1G+RAzspy0umQy6gc4w1DlQftEirPSOQPrweJdikpOq7OhPU1tPMCS+aAkCqc6ZSnwkw7EDVzHr3Nd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908492; c=relaxed/simple;
	bh=Rm8WX1xe0DoMo3D1FxDrPDxfUykAkXe8SqdtbTEnEMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFC7QsZoaTSYa8/F0pOdDbSosPn5fSy8gLE680A1p4CZ8VaZaoKylyaLsqg4U94CHN6u5mEbwreTWqNfvwaYBD//EEJU+gDWOY4JH4xYFW503f9sDU1ke+3GIHmx9VajYw9oBWAkgnOp1ghjglBcmysJRMcN1Ic4XyrUtNgD7bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqBRpioF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqBRpioF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788908490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynGziBWrLSR0Afz+gjEtlGctM5W9fhdVmYGZfqUKAWg=;
	b=bqBRpioF/p2yGLrpStYs32RatGuWOayQdfYA9GXz6Hl+u21I6EKvaz4fQ+TmHlypJ/lVxe
	fvmEbzBjmtJgB8LDQDzej0Q/rFGVn+pUFj0R1RaCJzZi5dtYBQsCAEoLtRPa3nKOfrMWF5
	/lgSVJHMyAn+9jtDEs8OlzL4ZZak608=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-VtrH7BDWNuGsHVzfItdtHQ-1; Tue,
 08 Sep 2026 19:01:24 -0400
X-MC-Unique: VtrH7BDWNuGsHVzfItdtHQ-1
X-Mimecast-MFC-AGG-ID: VtrH7BDWNuGsHVzfItdtHQ_1788908482
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 795F81954AD4;
	Tue,  8 Sep 2026 23:01:21 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 585551800347;
	Tue,  8 Sep 2026 23:01:16 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  9 Sep 2026 01:01:21 +0200 (CEST)
Date: Wed, 9 Sep 2026 01:01:15 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Bill Wendling <morbo@google.com>
Cc: Christian Brauner <brauner@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
	Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Anand Moon <linux.amoon@gmail.com>,
	codemender-patching+linux@google.com, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 1/2] userns: Add __counted_by_ptr attribute to struct
 uid_gid_map
Message-ID: <aqCTfVdDOy5ZOx6c@redhat.com>
References: <20260823125155.1136740-3-morbo@google.com>
 <20260908222734.3048684-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908222734.3048684-1-morbo@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 09/08, Bill Wendling wrote:
>
> We can add the __counted_by_ptr attribute to the 'forward' and 'reverse'
> pointer fields of 'struct uid_gid_map', which are counted by
> 'nr_extents'.

Since I am CC'ed again... (thanks btw)

Personally, I am not a huge fan of __counted_by_ptr, at least in this
particular case. But 1/2 looks technically correct, I think it doesn't
hurt ;)

So, FWIW

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -809,13 +809,17 @@ static int insert_extent(struct uid_gid_map *map, struct uid_gid_extent *extent)
>  		map->reverse = NULL;
>  	}
>
> -	if (map->nr_extents < UID_GID_MAP_MAX_BASE_EXTENTS)
> -		dest = &map->extent[map->nr_extents];
> +	/*
> +	 * nr_extents must be updated before the extent and forward arrays are
> +	 * accessed, otherwise KSAN will assert an out-of-bounds error.
> +	 */
> +	map->nr_extents++;

Yes, but perhaps the comment should be more explicit...
I mean, something like

	... otherwise KSAN ... because of __counted_by_ptr(nr_extents)

Nevermind, this is just a minor/subjective nit.

Oleg.


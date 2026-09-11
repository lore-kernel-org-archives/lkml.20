Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF4472068
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135166; cv=none; b=LbaIK5xjKUYllOxnIgcLe+riUWnw8Gtq8e6juqPIa3lCOWSCIro+fVXzEBzhJY/ZotILN6px6cOMpUv0SYO49BVaqW6FD/jmnfOXgvgLojF4td/nFx+45fUPITNAu8VJWyJbTZ1x7J3qRxKzaoAemFy4fJAgIaAXf1R96o5Mk/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135166; c=relaxed/simple;
	bh=aHrUMGLWWZoEkY3s9fya1Mg02ffx6C0f6PKOUdo9Q8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8QdJ/ft2p9eL31AsJGU9VyXYWMWMHWGvgwGHNCVEOgXAmopk6FI+P5Cgr6s4aINzZhHOQHlPyToXKLWH2tFoW1+vK+P7iWSuL+2Tg1ULjZIETihWoCADa7DUVcvx3d+4RxBTnYJc+8LWWVnWHLPClARg1gw0V2RltKFUagspN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AP5FLzQ3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AP5FLzQ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789135163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aHrUMGLWWZoEkY3s9fya1Mg02ffx6C0f6PKOUdo9Q8M=;
	b=AP5FLzQ35wSkz6pSq4Fr++1i5hOY8ClHgyTilW8J/B24lnCVsv8BVt52i3wH0ce5iU358i
	bInAg4h4cRUa7ktIrpIr2ww5hp/FSMVNL552CrIvCHIkd5wBGtTDs0gy1plIEe9zRcKT1N
	sYVHSH3Y3iTc6LCiLfdPnj8aIO8gLUo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-NIYOUXgtOIWmDmt7FNVmKA-1; Fri,
 11 Sep 2026 09:59:17 -0400
X-MC-Unique: NIYOUXgtOIWmDmt7FNVmKA-1
X-Mimecast-MFC-AGG-ID: NIYOUXgtOIWmDmt7FNVmKA_1789135156
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7FEC1954AC5;
	Fri, 11 Sep 2026 13:59:15 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3C5AA195608D;
	Fri, 11 Sep 2026 13:59:12 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Sep 2026 15:59:15 +0200 (CEST)
Date: Fri, 11 Sep 2026 15:59:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 4/8] posix-timers: Move POSIX timer group exit related
 code out of do_exit()
Message-ID: <aqQJL_sY3o01lE2p@redhat.com>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.733966325@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.733966325@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 09/11, Thomas Gleixner wrote:
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> Move the POSIX timer group exit handling into the posix timer code and
> provide a proper stub when POSIX timers are disabled in Kconfig.
>
> No functional change.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


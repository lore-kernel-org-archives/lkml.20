Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BB3D903C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000079; cv=none; b=EsVGsoraJ1BvY3qLOS96p+Ef9eUthbAMaxXUgK3IjDJuxFKPsB+ktWNIze+UO36l/am/OFqHF1WIw+yx7mDqZ5toufHSvasJ5DBLquQTAVONkQ7NpjoIDOwpCV8mSaNB4RxQ2ZjUkcLJ4VpRyTcTh8ZFzpqDx9TX5FW6I6Ia5xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000079; c=relaxed/simple;
	bh=wz2PxAjQZndVyP8D9ldBSRsNuYjpDOrxh2LCwU1tkgs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OCX022fkifXj2xeuLrKKym8HKC1/GkpFW1MGX7yfhgNZ45r7e/EN4Q48GtX4AgGRnOtJ3bfiWF880KpDC9G3icbHNYsBgtjv9POV3Stz2WUR3PzOnQi6HKwlyn0cT3IATkY3Dr0XewSEjfb4pA45IumdlamEaVCQb/PFXkVN1Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcCmawHU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcCmawHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790000077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIxMwrIfY5XEn6pqTT6VlBGgAeMmetExbhltFXvC7o0=;
	b=gcCmawHUU87KI79Ub2tac9IEZvfGItNAgeNRIsJMzdmubFJ9Pf03DqxLZ7FO/Bo5Ls/0Gh
	l8DPKJkO2TMu7VuNN1Iy1aPE9s7Am4Y3dRVB+GTxKXYsLhIR0ddRueb18wr1q7rRLvCyin
	3eJrmXSiPZu2kiUEM0pC2FpZwFhvPA8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-UUiq0BLANEm5BpNb5T46VA-1; Mon,
 21 Sep 2026 10:14:33 -0400
X-MC-Unique: UUiq0BLANEm5BpNb5T46VA-1
X-Mimecast-MFC-AGG-ID: UUiq0BLANEm5BpNb5T46VA_1790000072
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 574C8197758E;
	Mon, 21 Sep 2026 14:14:32 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 36A911956041;
	Mon, 21 Sep 2026 14:14:29 +0000 (UTC)
Date: Mon, 21 Sep 2026 16:14:27 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
cc: snitzer@kernel.org, agk@redhat.com, bmarzins@redhat.com, 
    dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, corbet@lwn.net, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH] dm-verity: add DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE
In-Reply-To: <97f8d660-a523-4011-ba15-6f708cb1b589@embetrix.com>
Message-ID: <9643099f-529f-3417-ab4f-69ca266e736c@redhat.com>
References: <20260907171939.355472-1-ayoub.zaki@embetrix.com> <a37a63f2-e45d-4e51-0c2d-bd19cca5fe88@redhat.com> <97f8d660-a523-4011-ba15-6f708cb1b589@embetrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Mon, 21 Sep 2026, Ayoub Zaki wrote:

> Hi,
> 
> 
> On 9/21/26 11:46, Mikulas Patocka wrote:
> > Hi
> > 
> > The argument can be turned off even with your patch - by specifying
> > dm_verity.require_signatures=0 on the kernel command line (read-only
> > module parameters can be modified on the command line during boot).
> > 
> > I'd like to know what kind of security problem does this patch try to
> > solve. If the attacker can tamper with the kernel command line, he can
> > already gain root (i.e. by using init=/bin/bash).
> > 
> > Mikulas
> 
> Thanks for reviewing.
> I should have highlighted the change to bool_enable_only: with
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE=y it rejects attempts to clear
> require_signatures, including from the command line.
> I followed the existing CONFIG_MODULE_SIG_FORCE and module.sig_enforce
> implementation.
> My intention is to make signature enforcement a build-time policy rather than
> depend on boot configuration.

OK. I accepted the patch. It will be in 7.4.

Mikulas

> I fully agree with your point and that this patch alone does not protect
> against arbitrary command-line tampering.
> 
> If required I can clarify the scope in a v2 ?


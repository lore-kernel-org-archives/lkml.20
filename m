Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAE47A88B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772750; cv=none; b=C5h7pOCGmwfQtQb0WyxHNN8l+teqEap35exJTJtUdBoVnRPjL9MYR64O8X1aLib1xyQmnZGG3b3aCDDkmcip8GZSAYqAl/veVGgnl4dln6fb3dKHOCbKTo+SK+HmvOuYo138n4dgSVFz6NUw2Usd7b3cjDYhEVbXOl0gzIEfIXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772750; c=relaxed/simple;
	bh=Kb3Dp+TRTQB7glv+fCQ1vb8ywX/zbwfVK/o4cL00Y0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENjuf+LciZX8N6uveeZpP0s7gU94KPgpR6b9zb7JF5GETF7Fdetjnbqy/pvG0yCcfH30w9Brd0kLejqXrpBXSfF6htLUOE/RPvbxzGgTg2Py1sRt7norkqijrYFKosoVfb6+W+X8qj4Pik1AR3vOh2evTxWHKaYZclmbyHFv0Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XwZsoxB/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XwZsoxB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787772735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kb3Dp+TRTQB7glv+fCQ1vb8ywX/zbwfVK/o4cL00Y0g=;
	b=XwZsoxB/jWGwSilyihjjYjTkqB9Mnwn3ff8jR6reQErBzNhsf3x5LBt2yCZsVys8gS8EKH
	HwGeNrNjMgTDuB9ZFjjDFVjHsI8F/4RqNpKqgkJcMCQjGtiEplzdF3ydu2J/vHS3DOAvkD
	C3QdVCBiQdUp9hLB6NaHiu91CEK2LaI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-L99-wfWdNueij3QyzrmY_A-1; Wed,
 26 Aug 2026 15:32:14 -0400
X-MC-Unique: L99-wfWdNueij3QyzrmY_A-1
X-Mimecast-MFC-AGG-ID: L99-wfWdNueij3QyzrmY_A_1787772731
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8591195411B;
	Wed, 26 Aug 2026 19:32:10 +0000 (UTC)
Received: from fedora (unknown [10.44.48.90])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E5684422;
	Wed, 26 Aug 2026 19:32:06 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 26 Aug 2026 21:32:10 +0200 (CEST)
Date: Wed, 26 Aug 2026 21:32:05 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
	peterz@infradead.org, anna-maria@linutronix.de,
	ebiederm@xmission.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
Message-ID: <ao8_NUo0ACPAA4QB@redhat.com>
References: <875x10hrkt.ffs@fw13>
 <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com>
 <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain>
 <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com>
 <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com>
 <87zey8g05g.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zey8g05g.ffs@fw13>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Thomas,

I am already sleeping, but let me ask anyway

On 08/26, Thomas Gleixner wrote:
>
> On Wed, Aug 26 2026 at 11:36, Oleg Nesterov wrote:
> >
> > So. With this change release_task()->flush_sigqueue(&old_leader->pending)
> > can still race with posixtimer_send_sigqueue(), but it will do nothing.
> >
> > But it also does "nothing" if tmr->sigq is already pending (!list_empty)
> > so I am starting to think about the change below again...
>
> Sure, but that's an orthogonal optimization once we fixed the exec()
> mess :)

I am almost sure I missed something again. But I thought that this "optimization"
can also fix the exec() mess we discuss in this thread?

No?

Oleg.


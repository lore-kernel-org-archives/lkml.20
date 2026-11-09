Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231812;
	b=x2tjOPdE0B300Q9XtOSOCyHCNCgbMG8mZQSb+eMPj6nrZD3xBdD+Q1VICaLhK3Izdp+S
	 rRhExQt0J2Oai1ZMtlzRW3jVvmnbUHruwAqE4Aa01J8Ccf2eBcBtOZqm4L/7wK3I73qAX
	 hgGXw1VTVSS0q25mRgnc2UZOmHTb3ym0BThgy5mHXIj3x9kzP5O2IZNEWeoqoOax8qRXa
	 2BpZf5RYg7Z65TNpyo3jVF7WoYJPuTi/0eUoma2XriL7hHKwk5vyQmmKWNkQz+Aqs2YU8
	 GrbmvjzjLZRgHKFEMdGuVRcT5ahV6nxYIryuxasS7DFJpCbHeQQrjaN/kNXn0nud4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231812;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=5LOD1jU9FVWtN/u7Dr95LgfC3DhNMyl6S5MdxkkX0i4=;
	b=DqR1RZi7+Lg/LmE507ebchOKOWKSth5IJ8tySUlEeBSiKgNwkwGZQIBaE81rGn9K0wN0
	 rwtsWvuiIXNVn6o7sU1E/pIeQ6gILpJR+pgzQqYvcd4OhY3fLBnHZVKROHcK7Lu1GwxSB
	 95R6QRb7ddVviU2ZIq9KIYteG6mQuaigaZt6uRYOGlNLCHH2y2mnumUdU8hEE4FR2Z3gl
	 i2hvzyo2OgI+6XDYZouLoOo1vwLPliq2YCTO0ZwgREjq5XcNeWsu/wkxjpkG5JnpXY6jk
	 omNnbAQhNWfRgbkoze4lJylQFWQiXyhX8PRgDg1K5BgUFpuMoGo/SuQ2QHm12PknpzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MScZTCE+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MScZTCE+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794231810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5LOD1jU9FVWtN/u7Dr95LgfC3DhNMyl6S5MdxkkX0i4=;
	b=MScZTCE+Ld61z03ygTBnj8c94DQESqzIjeOKG9BfbuHWd9+U6x6y7THVSthuUc07diEX0V
	Ef/cMq0o5B8jydIHvqaNDgIzwkq74q+wT/Pmv9qeFcsadw6y+Kev6v/lRZQHpLJsxpOXYX
	Rm8XYOkdNiw1CkJxDIRctE4nyd/F9m4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-wmxFZKqpOeOFcD0PdaIabQ-1; Mon,
 09 Nov 2026 08:43:28 -0500
X-MC-Unique: wmxFZKqpOeOFcD0PdaIabQ-1
X-Mimecast-MFC-AGG-ID: wmxFZKqpOeOFcD0PdaIabQ_1794231807
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75D421955F0E;
	Mon,  9 Nov 2026 13:43:26 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id B11AC1956089;
	Mon,  9 Nov 2026 13:43:23 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  9 Nov 2026 14:43:26 +0100 (CET)
Date: Mon, 9 Nov 2026 14:43:22 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Will Deacon <will@kernel.org>
Cc: Zhao Gongyi <zhaogongyi@bytedance.com>, catalin.marinas@arm.com,
	mark.rutland@arm.com, ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avHN-qWRu--arO8a@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <attf9KALBQyOGyco@redhat.com>
 <aus7mMS4tXAzPCSi@willie-the-truck>
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
In-Reply-To: <aus7mMS4tXAzPCSi@willie-the-truck>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Will,

sorry for late reply, I was on PTO.

On 11/04, Will Deacon wrote:
>
> > > @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
> > >  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
> > >  	 * return value of the system call.
> > >  	 */
> > > -	if ((info->si_code & ~0x80) == SIGTRAP &&
> > > +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
> > >  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
> > >  		return;
> >
> > LGTM, but I don't understand this arm-specific code.
>
> Welcome to the club :)

Thank you ;)

> The original rationale is described in e057b9477232 ("arm64: syscall:
> Ensure saved x0 is kept in-sync with tracer updates"), so hopefully that
> helps to set the scene.

[...snip...]

Thanks for your explanations. Yes, I tried to read that and other commits.
The only result is that I've managed to convinced myself that more or less
I understand why 88b839ce497c and 5a87e8c7f3702 make sense.

> So that's the mess we're in and I'm all ears if there's a cleaner way to
> sort it out without breaking anything that relies on the fragile semantics
> we already have.

No, I can't suggest anything better. I think your patches and the fix from
Zhao are fine.

----------------------------------------------------------------------------
Now the question...

So we had CVE-2026-68171 and then it was rejected:
https://lore.kernel.org/linux-cve-announce/2026081123-REJECTED-f1f0@gregkh/

Now we have another one, CVE-2026-90347
https://lore.kernel.org/linux-cve-announce/2026091703-CVE-2026-90347-6f2c@gregkh/

Why?

To me the problem looks minor (security wise). Yes, a malicious debugger can
fool seccomp. So what? What is the real problem from the scurity perspective?

Oleg.


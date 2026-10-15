Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814149E5E9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082119; cv=none; b=RHSXRTrYIh+L7j4uuMepTpr7pD2WIJ/2KFgNs282YhSFdjLaKuqBpeercqmRH1AUpdHEri9xxcsXbsADj+nV7t7nygeiQ43zeQQBwmuq9z6e+RxGoPa3HaHyThM3RQhYqMHbyXnTcQnucJCiL0oOEnO1QFfGlCUAx5sz0I3SdIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082119; c=relaxed/simple;
	bh=Dk8IqLqzesE4807xMJiy5ShJzomsE25WxSYU1Au3Fys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/L+igOmJWi3qPUrR9vECV+iNk95RythhPti8wXqwusqksARQYYRdpZ6ma5aeNdDKUZFvmIVI1qLZTQ6aQG4TrHRP64iGPxdinynTzymmIGOvuJ8t/sATSJMHPdnD4IBcrNBZCMJSjgVuNb7K7k1ke3CEhxkzgZ9Y4TJ6a41IJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DJqnVtwj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJqnVtwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792082106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dk8IqLqzesE4807xMJiy5ShJzomsE25WxSYU1Au3Fys=;
	b=DJqnVtwj0cnZOB5eT/XumEzt/UdhXP+Qz0+6ak09hL1rJOl4+obQqdpeyCbNK6FJiPLMXG
	TUPeTNKipES5Wakx41mmjHiB8S6b7yleKo7N3sMDwA0giIQ6fuaVE6frrtK/ZBZOBaEl9h
	7ZFrkRp19FIe+0jSZaEMu74i3stgNec=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-uG3lX792O7WkRnxg1-5fig-1; Thu,
 15 Oct 2026 16:35:00 +0000
X-MC-Unique: uG3lX792O7WkRnxg1-5fig-1
X-Mimecast-MFC-AGG-ID: uG3lX792O7WkRnxg1-5fig_1792082099
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3E1F1967C57;
	Thu, 15 Oct 2026 16:34:15 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3D0EC195608A;
	Thu, 15 Oct 2026 16:34:14 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 15 Oct 2026 18:34:15 +0200 (CEST)
Date: Thu, 15 Oct 2026 18:34:13 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: CVE-2026-89603: entry: Fix seccomp bypass after ptrace with TSYNC
Message-ID: <atEAhWWDDOo4kWSR@redhat.com>
References: <2026091133-CVE-2026-89603-dad5@gregkh>
 <20261015162119.1a1e0d-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015162119.1a1e0d-kees@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/15, Kees Cook wrote:
>
> On Fri, Sep 11, 2026 at 09:44:52PM +0200, Greg Kroah-Hartman wrote:
> > This race condition could allow an unprivileged process to execute
> > a prohibited system call (e.g., execve) that the newly installed filter
> > was intended to block, especially since the tracer might have modified
> > the system call number during the ptrace stop.
>
> I'm disputing this one: please reject CVE-2026-89603. The fix is a fine
> consistency change, but the flaw gave neither the tracer nor the tracee
> anything they didn't already have.

Thanks Kees!

I fully agree with both points. The patch is fine, but it doesn't fix
any security problem.

Oleg.


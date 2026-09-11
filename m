Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760048A8D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135119; cv=none; b=XrOff0N39dhi+M4P4vzfI4ibrxhtqAvuJNoyWOyKDoKXQ1GeP7fl0UsISVGek+MgiT6MzxSpcY+6xyww/hrQjknOQteVxD9cjT2HIsNJVwasWB/6pgN9Wixl1V2AzO7OE9BAoXQPRy6+0C72RntPbnk7a3PCcKiQT9XnmAXOYkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135119; c=relaxed/simple;
	bh=Ucrjzxqpfp4X0RxFQhavX9EKz22vJZq2UKMEPIe6f9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHLXFJf4wYGZOVnabF2ZwgRs2axfeV+ED/p6mPy8kLsiHuZ/gfS7opLmYM4iw3gJIy6hRcMQ+0ZFtzoBnxr8GDrFCCkgr32MGpNXbV2vEMFX2xU6aA3T1ewfkAZ2s+jJ6e4b/we7wroSWB6KCPfFmvY8omjMT8FAj2xQqtCNRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfVzDPxa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfVzDPxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789135117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ucrjzxqpfp4X0RxFQhavX9EKz22vJZq2UKMEPIe6f9g=;
	b=NfVzDPxa+2HaxN4dz35Xxk7mxLj7UQWxHFVqSAowZUjc0wBO3Z2bFi5eA34gwsInAmi2iy
	gi+wdOoDtVH/mtl31GjtQx0F0bCcxRhAekDlr8+7QdgeyV5t7lA2DWANdsrSNbqNj2Z/+I
	OCaID5qiyRelzDniwsCr9/lLnVfCqLk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-rGFpYru0OHeSWaW6ofrK4A-1; Fri,
 11 Sep 2026 09:58:31 -0400
X-MC-Unique: rGFpYru0OHeSWaW6ofrK4A-1
X-Mimecast-MFC-AGG-ID: rGFpYru0OHeSWaW6ofrK4A_1789135109
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A999918009C8;
	Fri, 11 Sep 2026 13:58:28 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 97AAA1800351;
	Fri, 11 Sep 2026 13:58:24 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Sep 2026 15:58:28 +0200 (CEST)
Date: Fri, 11 Sep 2026 15:58:23 +0200
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
Subject: Re: [patch V3 3/8] posix-timers: Move posixtimer_exec_cleanup() out
 of exec.c
Message-ID: <aqQI_7mxOJ-CluTj@redhat.com>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.680668094@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.680668094@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 09/11, Thomas Gleixner wrote:
>
> From: Thomas Gleixner <tglx@kernel.org>
>
> Move it to the POSIX timer code and provide a proper stub when POSIX timers
> are disabled in Kconfig.
>
> No functional change.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


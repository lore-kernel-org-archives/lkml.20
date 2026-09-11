Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18F31ED8B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135236; cv=none; b=n2YAKXBQr4nbA8UuwH4/yRr+6TADF+Gtcl36D0cXbcmg2oweHRsEQETegIFZQ7zTgLTnNhQr8590AlH2TI/mSdNupsj4kb+IaBN3FhiM2eV5g6TfRh535qk4a+CS6b0XdfQAoIdT/bpnolU13x6Rzyo/n11isfHjLMatsx3vsOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135236; c=relaxed/simple;
	bh=0Qd5XldDgJ5dYc4k3v521BcIFjvEW8jnmhCTAzrSsW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILTiEnqM0EdksvR1Z5foGt2D/88A0dtodA12T9JMHQ44n8ettnWsJAZcjcR7Mfb4n/+dABolax4SfDcAxUyH6+/2xYhHTuMaFnBb/y37vi+XQk3r93B9l/I+DpEWaICFGxoWrUgnzYxWe8a7u8q/DmCZhuSbFx1Q5ecvhjdI/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dr2vzGdp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dr2vzGdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789135233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CX+DEHQnMEP/gydR3pQSTQDfNUlCJemDr2A/pIqG9IE=;
	b=dr2vzGdpAzqd6n5/IMbcmsy/8t0ZxF5Lnk4JpdqYu3DiUJ0Hsd6kLMRC5MzdkIw9QA9tRq
	JxCqSL8S9VQewNAXYhoO1o3kepKNlJWjIc49o0F8F1KsueMBT6oNPT1KVU+DvcjrgSusLE
	nz/n61VH1qlNmokJfdIb/MvQ/wX6BLQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-cYp5lxNMOvWUFQVs2_dLBQ-1; Fri,
 11 Sep 2026 10:00:29 -0400
X-MC-Unique: cYp5lxNMOvWUFQVs2_dLBQ-1
X-Mimecast-MFC-AGG-ID: cYp5lxNMOvWUFQVs2_dLBQ_1789135227
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 408881955BED;
	Fri, 11 Sep 2026 14:00:27 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 83A401800348;
	Fri, 11 Sep 2026 14:00:24 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 11 Sep 2026 16:00:26 +0200 (CEST)
Date: Fri, 11 Sep 2026 16:00:23 +0200
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
Subject: Re: [patch V3 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
Message-ID: <aqQJd_pk1OmWsfWz@redhat.com>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.837831386@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.837831386@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 09/11, Thomas Gleixner wrote:
>
> --- a/kernel/time/posix-cpu-timers.c
> +++ b/kernel/time/posix-cpu-timers.c
> @@ -1505,7 +1505,7 @@ void run_posix_cpu_timers(void)
>  	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
>  	 * miss timer->it.cpu.firing != 0.
>  	 */
> -	if (tsk->exit_state)
> +	if (tsk->flags & PF_EXITING)
>  		return;

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


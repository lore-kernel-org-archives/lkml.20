Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B303630BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200673; cv=none; b=QE4wRD+7biHPRXOyCKplEb0ue6c7mtMvkIE72vTROq0VWjxff2xM9/mZe58N6AY/hnNuGYE34WeVuti41dBj9niAwmB2dOEgy8SJsNeuqGIS3g9abQ7PzQAS4U/5DSz/c5vejWvIflX5AghcTVYQ3Ynu0cUHcd5NXszXEJbwxrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200673; c=relaxed/simple;
	bh=u/O8U4/wbfjjJlI+bVE39fAH1Few86fKyT5XoAx2L54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THDhVOegvF/jFE5/4WoGOIExYodjqphG6zVdWBbH2xR/2GspbDaLeZLHqz2Yde6S38BabyFM2idkz9H4VHCw0d2xmLt/gOZOrvsnlkEoEAvspzRoiiflu11J0NMfhUgqr0MFtT7+PFUVcC2TJATYIn8xn8+oLx41JhyAI30nN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MJljdFZB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJljdFZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788200670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u/O8U4/wbfjjJlI+bVE39fAH1Few86fKyT5XoAx2L54=;
	b=MJljdFZBJZrd58V1IShLfVTCf19M5fr+0KFzpprjs0dYqhvJZBNCf0wky/MTynoIF7GQYu
	NvZ6Hg4B15GlIX1krAh2RWapK69KBRjSih/Fvmcd9jIuZS8CyRtqJXSz9FlULnWfVWgxps
	UKm3PX0VIFIJOzj1wX5Y8jqT4+lqaGc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-6LkvmBIlPU22cg6vsRZfyg-1; Mon,
 31 Aug 2026 14:24:21 -0400
X-MC-Unique: 6LkvmBIlPU22cg6vsRZfyg-1
X-Mimecast-MFC-AGG-ID: 6LkvmBIlPU22cg6vsRZfyg_1788200660
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F7A1195419A;
	Mon, 31 Aug 2026 18:24:19 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A08D618005AA;
	Mon, 31 Aug 2026 18:24:14 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 31 Aug 2026 20:24:19 +0200 (CEST)
Date: Mon, 31 Aug 2026 20:24:13 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2] posix-cpu-timers: Dequeue per-thread timers before
 exchange_tids()
Message-ID: <apXGzcA9BmrbrQZv@redhat.com>
References: <ao7Q8miiuLAPVnWv@v4bel>
 <ao7iQ_wOLghOvTsq@redhat.com>
 <875x0qclcx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x0qclcx.ffs@fw13>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 08/31, Thomas Gleixner wrote:
>
> On Wed, Aug 26 2026 at 14:55, Oleg Nesterov wrote:
> > Can we move posix_cpu_timers_exit() or the whole CONFIG_POSIX_TIMERS
> > sequence in begin_new_exec() up, right after de_thread() before the
> > "if (retval)" check?
>
> Yes, but that does not buy us anything.

Hmm. I don't understand but this doesn't matter.

I didn't mean this makes sense, I just tried to understand the Hyunwoo's
fix, in particular the placement of additional posix_cpu_timers_exit().

Oleg.


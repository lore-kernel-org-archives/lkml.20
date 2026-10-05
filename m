Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F949418A33
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194713; cv=none; b=Rqxyu2cnjQUk/pa7WkQaB6PV8yr/hpYT2riKPjqx1DLu44BlYC/RS2NvUJYbEqk3EdjXu6QRe7F9gptR/lodrkdKWFcgu5XHZkxeqvAB3O9ZLDVwTw83qxHMJjH4xJ1bfpFJkx5khae4by1be14bq3Ggq4+BmtPZ3kwHlDWCrVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194713; c=relaxed/simple;
	bh=KbGiJXXwoQ3jClubF7TlnL0TPDmyhwqYFebqjctSX/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3nBHvCFvX3oJ+GtSZ8/aNdi0XiGRSP0EBOojA6kk0IbM7y7LxXvVrQcNqlPPmXnzWa+37d2OfZ19Qpsa768JqY8DjY0q2tKjoPl2Up66q4hUY15r8ZNqWrU8+QghyFLZ4pTxwzW7LtMWRC6EE23EWLSrFpFf5gHk0FgiPc2BKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWVoVLal; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWVoVLal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791194704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bMe63t1nHujMN1HvYyQr8Mnh6elbHxeuI9TNQO12M4g=;
	b=LWVoVLalTc2PU3WuTGRZRbLnhDtBHo84esbP54n2VZHRsV1bL1zz88tVvDlaQ/epz+ekif
	UTHf96PjH9qkDFlv/YjqE8P6y7HexDciVhuQ1KbCO1wRCSG4hO3Iz3NR4j/TbL2gi+QN7g
	RzSDw8w847Q30d5rlunm7W4k26QkZ4w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-DrvbuV9FNA-Z4zd5ZwMBkQ-1; Mon,
 05 Oct 2026 06:05:01 -0400
X-MC-Unique: DrvbuV9FNA-Z4zd5ZwMBkQ-1
X-Mimecast-MFC-AGG-ID: DrvbuV9FNA-Z4zd5ZwMBkQ_1791194699
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F18318002E6;
	Mon,  5 Oct 2026 10:04:59 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 926141944CC0;
	Mon,  5 Oct 2026 10:04:55 +0000 (UTC)
Date: Mon, 5 Oct 2026 12:04:53 +0200
From: Miroslav Lichvar <mlichvar@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Ryan Luu <rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
	linux-kernel@vger.kernel.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 4/5] timekeeping: Reinstate proportional correction of
 ntp_error
Message-ID: <asN2RcjoTNN5rpaK@localhost>
References: <20261001202134.33929-1-dwmw2@infradead.org>
 <20261001202134.33929-5-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001202134.33929-5-dwmw2@infradead.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Thu, Oct 01, 2026 at 09:21:33PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The ±1 mult dithering is sufficient to keep ntp_error at zero once
> it's already there, but it doesn't do much to reduce it once any
> significant ntp_error has accumulated (e.g. from frequency or phase
> adjustments) — it can typically only drain single-digit nanoseconds
> per second. Commit dc491596f639 ("timekeeping: Rework frequency
> adjustments to work better w/ nohz") removed a larger skew because in
> a tickless kernel, it would remain in effect for a full idle period
> and overshoot. Now that timekeeping_max_deferment() ensures that the
> system wakes at the top of the second when skew is active, the
> correction can be reinstated. If ntp_error exceeds an amount that a
> single ±1 change to mult can drain within a minute, add an
> additional bias to mult to close the gap.

The dithering is switching between an adjustment of +0 and +1, there
is no -1. The time to drain depends on the direction. If the mult
division has no remainder, it's infinite for +0. I think that's ok for
this change, but the message and comment could be more clear.

A faster correction creates a larger frequency error.

Is this patch considered a requirement of the one adding the ntp_error
correction to PPS and other timestamps to avoid larger inconsistencies
with clock_gettime()?

I'm wondering if this duality of the clock wrt the way it's read
couldn't cause any issues. Any chance there could be a new clock ID
for applications to do clock_gettime() with the ntp_error corrected as
well?

-- 
Miroslav Lichvar


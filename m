Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8A223DC6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788573814; cv=none; b=l7gMpdPTOxGO/kpEsFkkNPoLLXiHV27K1kr6T/PQJh/K+Vv28usbdoXbVx3Q2s4JIz916gJI5sh5pS6wrmRQKfA+bYKQ+em1DalvVR+mj256AJ824V80rBjKnneOLvjg03fEfqFIY1V3Z1vc5CyRxla8seWCoeSsC8eKKW1FC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788573814; c=relaxed/simple;
	bh=/lJRMTPzRqZcFJTQQtSFuKM8mdbVq/PxMVaKKo7mAMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERscKAwRSwh6KnCQkmqK/N3Yhs/xviVcavo4zNfbWXkrT7AUkB9NWMLfKWFaDzjQZkqhj9YVjWVlOVZh28WTJ9S2PQJihWp2BUJmccwMJLAhG7H1oz1HVUA6ZG37d6ogTV4AplaOM4YtyncyORn+i0qwNGqEHVwJgTn3gryQWLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OwyzqOSt; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OwyzqOSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=vikrcpj6rjgvteqqfv2mobqeim.protonmail; t=1788573806; x=1788833006;
	bh=/lJRMTPzRqZcFJTQQtSFuKM8mdbVq/PxMVaKKo7mAMM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OwyzqOStg5eR3W55lE7zAER6IyqU/jmP5BRaRqcBVwcAXEw3qZN6BTztk2Mvyd9Ca
	 pKWFbbPfg3DEUJ+NFfSa39vSRx9zSxJRW+pFPvmY6wUF7brjrttt1bbMFvMObpOP0k
	 5WWKUxmAzgYv1fijTmkv3MeufhYobrPSiYFA5wZEGiqbJvjHJ+IudVLWfl4JwcYr7G
	 +gMjosorgLwiJwMs/9zeq8RhsHymL3XCB/gO9l5qDvo2gvXudXB2xkSofHuC7FryJH
	 xaLjWjr9FockIxhnv8mlAiuuL1oG9YlA2l62dyyG6FMEqyIagBo3xIKqak51EZVSXH
	 tgVYsikLR4DnQ==
Date: Sat, 05 Sep 2026 02:03:21 +0000
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
From: Cole Munz <Munzzyy1@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: gadget: don't error on dequeue of a completed request
Message-ID: <20260905020310.2277320-1-Munzzyy1@proton.me>
In-Reply-To: <aptrIbp-p6RNGd9X@vbox>
References: <20260904161344.2191362-1-Munzzyy1@proton.me> <2026090406-unrevised-stays-4832@gregkh> <7bef11b63feb88f89b37bbc86323ed3dba794f43.1788541086.git.Munzzyy1@proton.me> <2026090413-hurdle-puzzling-aadd@gregkh> <a0cdcd76b7a6a3c841b7957a2b761ae71ceb46fc.1788549031.git.Munzzyy1@proton.me> <aptTU3JD0xPMPmfL@vbox> <20260905000240.2267367-1-Munzzyy1@proton.me> <aptrIbp-p6RNGd9X@vbox>
Feedback-ID: 209578162:user:proton
X-Pm-Message-ID: d06f9f4b79dfb549ba85605250bca0b73497aa8e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2026, Thinh Nguyen wrote:
> Why is functionfs_unbind() calling usb_ep_dequeue() unconditionally
> after the request has already completed?
>
> The change ce405d561b02 looks like a workaround for a different issue.
> Maybe the fix belongs in f_fs instead of dwc3?

The dequeue there does a real job in one case: teardown racing an ep0
read/write. ffs_ep0_read/write hold ffs->mutex while they sit in
__ffs_ep0_queue_wait(), so functionfs_unbind() dequeues before taking
the mutex. The giveback with -ECONNRESET is what wakes the parked
reader so it can return and drop the mutex, and only then can unbind
free the request. In every other teardown the request completed long
ago and the dequeue is a no-op, which is the case dwc3 complains
about.

f_fs can tell those apart itself. ep0req is only ever queued from
__ffs_ep0_queue_wait(), so set a flag there before usb_ep_queue(),
clear it in ffs_ep0_complete(), and have functionfs_unbind() dequeue
only when it's set. If the completion fires between the check and the
dequeue you can still hit the dwc3 error, but that's a rare race
window where the documented behavior is doing its job, not noise on
every unbind.

If that direction looks right to you I'll send it as an f_fs patch,
Cc'ing Udipto since it revisits ce405d561b02.

Regards,
Cole


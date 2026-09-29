Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF474F7CD8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707773; cv=none; b=ITMod8ckN7uV1VoTESJr/RTEO1R3NMTcgsSQpKAHpFC/hWCVUachip7Fjaeyd90ft0bHHT8hHJII4Agfx3rvSJIUmS/SPKuc1EHkJw1BuRX0dsMNlRVK8TOWYt1NAsrGf2REXPM4DURjBsWKchimtGCOSJKjWFcTj5jtYYSoKHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707773; c=relaxed/simple;
	bh=tk42NzrzXbr1Uok25QKaPiKnEEUg6KnyoDuB9rEXUrM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cr8ZioKw/OyRNfXsrAyWDndrAt9dCznsSxoGMTCt4bReohyo1oX2l5SyA/J1N5qXzjWTiJaTcQaXNpbzj2SyVOVre6INaPrKvzNdICZnCGXU8xhgaMR8IDcN0e0KjJup5MuHISfYz42HggEWvlS5qk1WeDXv0/u0Rztfuk3/+uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be; spf=pass smtp.mailfrom=krisman.be; dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b=Lf7mNpHr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krisman.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krisman.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=krisman.be header.i=@krisman.be header.b="Lf7mNpHr"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hvRzq2BXGzMlqp;
	Tue, 29 Sep 2026 20:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=krisman.be; s=MBO0001;
	t=1790707767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YxGsR26vdUt0dLRkmfJ6DMuoIFvZS7PYUYqwNoaoH98=;
	b=Lf7mNpHrmJCDzUQ1Pu05FeBsEVuBRTKcVPbPcpRAPXhM68QIJX1zUjasn6/lynR1as4TSc
	7NrBSum9bRai3btPiutAh6Ln9az/p+pmN+2o5OyNXBBF/MCYhlLnSsMqUM6OiQXvif3hzD
	zE7WljtLdQ5Rx2v2XCnrSnM2UJnYC6/+CrTW+TOL1Dvu9/KP4UMCHDOrIMJdS6XCVBaXpj
	kHxiBmTMOcso5Z4s3scPGsTF8FqAYqU8BHs0dm5m8Yki4sgmvOMbfqvUx2ChfbPYprMN8z
	wEcuz+OZgudiNmPoWy65BhaCicnFz2lhATrCJCaFvUYny/YBKq4vuXegXPbRdA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of gabriel@krisman.be designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=gabriel@krisman.be
From: Gabriel Krisman Bertazi <gabriel@krisman.be>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>, hughd@google.com,
 baolin.wang@linux.alibaba.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] shmem: fix unicode_map leak on remount with casefold=
In-Reply-To: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
References: <ba38f80f629fd093c77f3a49fdab7b71ee7bbc5f.1790687276.git.med08elkadiri@gmail.com>
Date: Tue, 29 Sep 2026 14:49:21 -0400
Message-ID: <87h5j7yjta.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4hvRzq2BXGzMlqp

Mohammed EL Kadiri <med08elkadiri@gmail.com> writes:

> shmem_parse_opt_casefold() calls utf8_load(), which allocates a fresh
> struct unicode_map, and stores it in ctx->encoding.
>
> On mount, shmem_fill_super() takes ownership of it via sb->s_encoding,
> and shmem_put_super() frees it with utf8_unload().  On remount nothing
> takes ownership: shmem_reconfigure() never looks at ctx->encoding, and
> shmem_free_fc() only frees ctx itself.  The map is leaked.
>
> 50000 x "mount -o remount,casefold=utf8-12.1.0 /t" on a casefolded tmpfs
> grows kmalloc-32 from 660 to 50574 active objects, and nothing is
> reclaimed on umount.  A tmpfs mounted without casefold stays flat.  With
> this patch kmalloc-32 stays flat too.
>
> Clearing ctx->encoding after the transfer is what makes the unload in
> shmem_free_fc() safe: otherwise a failure later in mount would free the
> same map twice, once via put_super and once via fc->free.  This mirrors
> what shmem_reconfigure() already does with ctx->mpol.
>
> This is easy to hit once casefold= is reported in /proc/mounts, since
> mount(8) then passes it back on every remount of a casefolded tmpfs.
>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>

Thanks,

I gave this a spin as well and it looks good.  Feel free to add:


Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Thanks,

-- 
Gabriel Krisman Bertazi

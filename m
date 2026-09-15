Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277337F30C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444533; cv=none; b=Trs2pjaysCyiHsEOiqUsbWT1j6nODffTm6GkhcLqDWD4gpCEAz1//4QeIBMMv3Q+Hcb6Ao1P+PeTpekaqjh3AM/12GvqWtcZ3fSNclvm6XQxyaa/2O1ieZ9nGblCmI3eb5DU7ksH5P1vJQscayVF3+MyToen0OLUZ9xIhFL/Xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444533; c=relaxed/simple;
	bh=WKKgC7V9WHENiLW2zr8syw+nvBe1aLYA7AIgRulA+2A=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NUMo2p5NjWu23xXHMeZJgsbGt0GLyqfT/uTsd5WSnZhne2Un6WHeiMGnqMvxtAwrGBluC9hudUPTnGkZJy+TlWu1m7wabBEDOa0IoeUtJnVtcWE//xRXnhoxQ3Rkut0eyLFcMW9OWupDdWtF9Zm7xOFNiSEo1vD4X1V5m4wj/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KpKWC26q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KpKWC26q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074F01F000FF;
	Tue, 15 Sep 2026 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789444532;
	bh=lwXzEuLD3SmIEvHNiDMhry3K3dBXkrZSJCANq2gUbt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KpKWC26q4hmfYRbMTa0MEhfrXmHtyTB9tSbfsmd8VNVECKGSFuW3pP10Jiii7Ae3U
	 SF8I8CCAVhMbJfQtqrmwjPnNYoL5gQvbJlBMrR4Zxkzb8X8SlzPc7pp75QuI4ZV6mP
	 1Ax4N5ZRrXaTt7OR7MrUPrXe5mY7MbzHmuuglBEk=
Date: Mon, 14 Sep 2026 20:55:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: linux@armlinux.org.uk, linusw@kernel.org, mark.rutland@arm.com,
 kmehltretter@gmail.com, vbabka@suse.cz, elver@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 r.thapliyal@samsung.com, Hariom Panthi <hariom1.p@samsung.com>
Subject: Re: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section
 to filter it from traces
Message-Id: <20260914205531.2894876437403f43e300b5b4@linux-foundation.org>
In-Reply-To: <20260914103218.1125401-1-maninder1.s@samsung.com>
References: <CGME20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768@epcas5p4.samsung.com>
	<20260914103218.1125401-1-maninder1.s@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


> Subject: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section to filter it from traces

fyi, this choice of subject may cause the relevant maintainers to
delete the email unread.

>  arch/arm/kernel/entry-armv.S | 2 ++

Those maintainers.

This is an ARM patch, so label it that way!

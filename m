Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440687;
	b=ri5IDpWrvg0tt0+HnTBi59bSTNs1ki5GbhZ5Bmd96ZDoRMhOdBsPhKUr+Gr7/mcZ6Ijz
	 2Yx7TDJkhwJgVZyakQK8fOMOefi1aotjXw34fRkRWx/Qm6hWDZeuNkULv7CEK5xYqEF6Q
	 BtNw3XUu1j9fYw/KxlSVWKu5wIdYxG2LImZ8nf4OcEpqWMOCYzDg5hChex+/HmBHheDDg
	 LWs2ZGMBgoE24f/TM/swVrA0e9jHO/G2Z07H92U56anqWe133lTB+wMs+gZOG1e/h4shT
	 q3uJ5q6Za2G+d069/8JT1cJeKHwGg7DP1UajnLVk9Gt/EcGt3lZWoOXPwr51mgWhCsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440687;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=QHOykJs0h5veks7+d6WnXdYp0AbV6z2t5DxPqkw5Pds=;
	b=oY7CaiNO/CodV55rJJ3r5CUFgOllFFd1KRaAg7mdUxgmEJ2VhIYp0iBs27i66SqKma5J
	 57fyT6Q0CsvqJx/Pqvw06NQS+8YYY3jjCPRQ0aNSCruBjFCuheMj4kEASGeWwk328562/
	 Hf86ecn0wZOGEynSP9wfPG43sJwY4IHpElYbZPeeDJgpeBF1HcNmmBPJk0vFJX6pbHP/p
	 1b+i19gZLHp8HXUElvjiS5cfxTZBPf/9OYd0Xo91v+qLCvbVzECHx/nnIu2guD+YBYhUq
	 Lg0YG4wqtIoQgPKl7EcLC/W91UvqiJV+sA/spddS/xqBycw32LnCrvDncq0RVrVARug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CKup40vS;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF972606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF972606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CKup40vS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87865C5CD5C;
	Mon, 19 Oct 2026 20:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BC2760582;
	Mon, 19 Oct 2026 20:11:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E10F10328DBA;
	Mon, 19 Oct 2026 22:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QHOykJs0h5veks7+d6WnXdYp0AbV6z2t5DxPqkw5Pds=;
	b=CKup40vSBhs1EW9cUA4Z25w9ALraA712q29eOeVc108h4rxweGuQEHoRZm6xb1/g4pEzVt
	oWU8S1HqUwlVNRmdbHmN5sqGOUGWy5UxG1eZABh4YOXGzn9nadaXLnvYHP74Pnb1u8TtS+
	mRbmvA0axJlpvJLwsnLS/xWh4sB31PAMsuQWgZI4R6KcYGD1Wb3C1nDzV2KH+Xov983hAI
	LSC7/T75z1eTIPvqQvbRV03Hv1AGTikDTlYzLB3ELRAtUtoZ0HSsQYVdoqH4ONK/LMGVt4
	Cw9+O4P2r8MRk9HyFkOsk5ZtUd5MINsF7bVjY+emRL9jqlQyeojX7G3G4Q3KJA==
Date: Mon, 19 Oct 2026 22:11:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shyam-sundar.S-k@amd.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
	Ma Ke <make_ruc2021@163.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Fix RTC reference leak in
 amd_pmc_verify_czn_rtc()
Message-ID: <179244056622.104236.7364086823005707167.b4-ty@b4>
References: <20261011121759.3267678-1-make_ruc2021@163.com>
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
In-Reply-To: <20261011121759.3267678-1-make_ruc2021@163.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 11 Oct 2026 20:17:58 +0800, Ma Ke wrote:
> amd_pmc_verify_czn_rtc() opens the RTC with rtc_class_open(), which
> takes both a device reference and a module reference on the RTC
> driver. The matching release is rtc_class_close(), and it is never
> called. Every return path after the device has been opened, the ones
> that return 0 as well as the ones that report an error, leaves both
> references behind, so each S0i3 suspend leaks them.
> 
> [...]

Applied, thanks!

[1/1] platform/x86/amd/pmc: Fix RTC reference leak in amd_pmc_verify_czn_rtc()
      https://git.kernel.org/abelloni/c/22b9306f1fcf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

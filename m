Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6763A5445
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345823; cv=none; b=o8tJw144K4wkNBgOAshJ7OraR5T5Epxf5shqDKoF+hxy1uCudYPCNQVON16ff9OQl4HKOO3U9gGBQG8urVYlOwJ3lw0GJvh3aZ1356etL3OPW8F1jctzOdNN2VjM0CMA5wgAfpEa/SzyVIEMZm/UdkfGcVoKXhCcFHIKoDNNWeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345823; c=relaxed/simple;
	bh=ckUCF9Ao3dAYFFjttvxLRpqDnvhYDyvw3NVrNWLs1Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjYR4G28ElUNKWWJKRCnpMzYhxZN1R9LadLk2nEUMZrU98SFPfyxqNv4w0KB2oSrcP34puDGJHWKlP92MdFhEZKwVC59df/LeZyZLdr/D9g9Uy2q6/tLSh0IDARF5SzSA1mSSvFEedluqaCV0Q7Bw5xGdqew9BOQr7AXzIVTlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BOJ5Oh5D; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3gQvhnh+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BOJ5Oh5D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3gQvhnh+"
Date: Wed, 2 Sep 2026 12:43:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788345818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+l5Zwi4yHAGat4QZFFRhFZ3gugFcij2qGI3vmfuK6rA=;
	b=BOJ5Oh5Dr6xd4McLP1+es5YXEsok+9SEy8PMbNI+E5rAAsq7LduskJFKks/VZWQh2BJRdC
	TQ/sI3kvx0Ms5MIZk78GbOTAf+cBo+zRLsI6pKJh/seeRGDuR8R/EuxfUTndwLPGg9SauK
	icTysR1ROnWw2RMKxhdrCTvhiR6BIYs4jcu2HCxnngB/83Spitfee4PV8GNVGXJTtCMr8Q
	uBR3dCHHe5dNbstsMdiI3pwUNgg6vazlR9/T6pV4t1YKu3GlA44Gc/wc/qRLsRcYRf4yUn
	YldA8ju8BGSIaiR3ZIle6HX+X7ltjlNdCBehMxP8csJNcP0YZbH+Nmg2TxB31A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788345818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+l5Zwi4yHAGat4QZFFRhFZ3gugFcij2qGI3vmfuK6rA=;
	b=3gQvhnh+7d+yTPii+m6fIeP2hVkU11n4Sc7FR7xGYbFQR/NEvSpTUqUIsRP6t3lYxnJeKI
	dIYJUCXwFETdXEAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	david.laight.linux@gmail.com, zhanxusheng@xiaomi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260902124004-07f2a2a4-a3bd-4864-898c-1fa31ab8a909@linutronix.de>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
 <20260902033801.2912699-3-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902033801.2912699-3-zhanxusheng@xiaomi.com>

Hi Zhan,

This was still quite a fast resend, please slow down a bit more.

On Wed, Sep 02, 2026 at 11:37:59AM +0800, Zhan Xusheng wrote:
(...)

> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  include/vdso/math64.h  | 21 +++++++++++++++++++++
>  kernel/time/vsyscall.c | 16 +++++-----------
>  2 files changed, 26 insertions(+), 11 deletions(-)

(...)

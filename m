Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D369457E4A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551948; cv=none; b=MSD2MLYCXDMjrqsgPAGK+qrlPo5FurSRgrSU8GfDJYJiFhbiZ6sO8oSLHqbu+dfKFlFE91w8IuiK3u8AFO1ccqSa5EOI+uQqKycGwx/TREzeY/RkycNwec0pBKa++6dHUnoxulX5yL52UW/xS1HNA5I8rwAuppm82JL7//6xaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551948; c=relaxed/simple;
	bh=kBE60rMCPEgiAkut9f/v34epmvZa38JP8A5EiZwjS2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UGZ/JsPuREeAOLorQTxc6Lw3IOHKytMKuUEhFIuJRoFUgdA6LiadeZUK6LG2JqUOoTtaXcRu3BGyaCgTIcODlx0H8nKt+Vds/AzRfuBSde03WAK4wKGz9Md9W5ljsW0UglPhCCBiNzt0aa9EJIvk8f6A8dwApZyuno0io545SdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=adOaof7C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BwUuYRvc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="adOaof7C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BwUuYRvc"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791551945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBE60rMCPEgiAkut9f/v34epmvZa38JP8A5EiZwjS2g=;
	b=adOaof7CNk4ivQU3Z5ThhiwJrMT31J1TusmhlHoQDnhPqobRbab+okjyz9g9G1AdJH2QFU
	zMNXj+UONh+rXs1qBGOqLlkwEM88QtL5ZkUbsadyL375R7A0DWanDZs/9hmmtWCJrqCcIP
	zxriTmkGkQYSMqK3I98NWYPuRk8vowSqlc/2fLjWLsUsZ6f8/Z30MqH/X7gEQhMRGrqATO
	a8UPNHgHwVr4F8HKcuEiEi1p3lO6NL07LP4rULuFRYUVFbGfgHyuPWDlfmwaXX0+HJ3nnZ
	Z1Fq2ndCawY87RNzOEkiGXhkSTYB6bAXQ+cH0MK2LaghDZEAPCqpdKuk/hDZOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791551945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBE60rMCPEgiAkut9f/v34epmvZa38JP8A5EiZwjS2g=;
	b=BwUuYRvc/8zA9jROHv1dx8uouvZt6QIs0HFVeDHVg7aei2KJhr8OOvZ+HgAINYKqsYduQG
	wZh5TJlk0FBiMmDw==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB or no Zbb
In-Reply-To: <20260930124052.21986-2-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
 <20260930124052.21986-2-jszhang@kernel.org>
Date: Fri, 09 Oct 2026 15:19:04 +0200
Message-ID: <87se2f2erb.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jisheng Zhang <jszhang@kernel.org> writes:
> What's more, the fls64() brings non-necessary zero bits couting for
> RV32. In fact, fls() is enough.

I think this is in here by mistake? There is no fls() in this patch.

Other than that, looks good:
Reviewed-by: Nam Cao <namcao@linutronix.de>

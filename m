Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC4463B74
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354804; cv=none; b=gkq+tyDxjnb5PMP9HN5wELE7hWiMXzfh9bg65OFI8JNzJFPbX6gnTHgzwJ3/ixea5zuE5nB7yqxJcmvRWUAvtXdga7xmJSWQjx0D2cL1xNQgjKbKMUcNE0ClVIvVZMB5nmPeb6N/HjQrKWcYt+ScyYR6r+SsVvAukjZPxNoQUrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354804; c=relaxed/simple;
	bh=8ECA4hBCDEXWocfW6AHKAhw5UZ6m9xX6kutkGrUBT2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iz8MwO/0iPYr4klIxJKkSzDmz2W6rvY75fJcFbPXSfa6xZZP1FQLfIJFrV+X+Rk9KYvzbULd52AWQPTJrauyURTi9B1QW5EAcPOH8eISt0AoZrDcbYZvNqJlhR/HP8xwukUC1iXQIAsfm7pJcQZd8K+vNRmvKtrqWEENxi7QqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wif94n99; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=707EqBlP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wif94n99";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="707EqBlP"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788354799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ECA4hBCDEXWocfW6AHKAhw5UZ6m9xX6kutkGrUBT2M=;
	b=wif94n99tbfFm2yPYPgyIYNN95+uzi7a34yYblHangw9+Nlk1bZoNstkFVLJh3SxZ6CC5A
	mwMztxWAl7j6AevzNGD63/wWuieJw7uIdDZ1PGqicmHxCFCeQFeEbAfI1M1eaE6FTd+WBw
	ZuLoJ0ayscd0AYvrwNk/ADVw/N17vbwM4200OJsCnCXVF4O2Hca1ZIKNI2K36t0bXP8EQd
	TCnFkLFhwPxeTZ8hYfvVZEy6/02m+wWXQdvBYsQ5SFoLy7lVVlw19sZiszgCQzSKOnD80K
	KS0Nkz+uKi+pAdWnScpKcARFZh5RR/MoqPDZf0InQIYFaDq33ub3KDmgCDvR7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788354799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ECA4hBCDEXWocfW6AHKAhw5UZ6m9xX6kutkGrUBT2M=;
	b=707EqBlPqT3D3j7ZZkEhGsBxWVcrGv2qP/UlSn7u2fYNOLTc/1xJfGH5r+DB2a/BNucYdd
	SZ/bHIujDL40UlBQ==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] vdso/gettimeofday: Clean up read of tz_minuteswest and
 tz_dsttime
In-Reply-To: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
References: <20260902-vdso-tz-v1-1-4d37a6b85ff9@linutronix.de>
Date: Wed, 02 Sep 2026 15:13:19 +0200
Message-ID: <87tso7vlsg.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
> When these fields got moved from 'struct vdso_time_data' to the new
> 'struct vdso_clock', this access was forgotten.
>
> 'vd' is not an array, but a pointer to a single structure. The code
> works by accident in its current form as CS_HRES_COARSE is 0.
>
> Replace the incorrect array access with a regular pointer dereference.
>
> Fixes: 886653e36639 ("vdso: Rework struct vdso_time_data and introduce st=
ruct vdso_clock")
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nam Cao <namcao@linutronix.de>

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755B3AF65F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641998; cv=none; b=SKlMByTV/AlSD2FCbKIxOkHLT9auRt6rDyLgMwj71O1WsUqej7by+ve6aFCR/NC4uey/JRSXdYU+uiiPLgJQwwCxvWHZvuGq9M5Zb2NKEmAnoTVTdJyaDCculLvAp67AZ1e664D0AYsPYPU4k2VbwEhTtPJRMDj8VTD6ouAu8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641998; c=relaxed/simple;
	bh=twyl2qgEIyr5Z7GpQCf9DFBtoqwwwqhoTARFl8uEWhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kKRgNdYQ1j9YkhagRfehBF1wHp9v6YITGNEx5bfbuBgFNnj+I4MMCLSLbooI6Q31fK+905N/BOnP7rKrsDzlCDttJeKWcVH9Tp2NwcRFdlM97JAvKDHklVzdnuHYf901YO8/M92A6ahBgi65dZlVNiXVM0vcsJfj2z2FBCs2ggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=34/FBdq7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ByU317QT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="34/FBdq7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ByU317QT"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788641995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTgLcjds5+GkcAXbUF2ZY5BHTT1h73DRe7LhwxjyTgs=;
	b=34/FBdq7IPv3MBSupdIX6H0YEzNWEt8jUFi0FGiu1BwKjbUcEursUADLz6cpY6NxZnzy74
	2CQAFUrlaFJUoY9bchbxTom2L7spACPy2CZ5/0/z2X8WZaowOT+Ua2h9USaPOenNQXqFaZ
	9XDklsqtZjFAKfQOsybFn3qXpBiu46+6CzY0C40UEhxIk3h8BDK3dxP2FBvDQOTpIPcKzZ
	aE4cSy1u9zxfuqywMBwORDv/x+fPR4hwHE+T2W8bm7UD5edlQnFDEeWPD2y7BOlumOkMBz
	IBq85kAAqgo9zPmoa9QHD9+sXaj95t/vHIeUI0YDsW3bC03x3wO7LnzbvVRAkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788641995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VTgLcjds5+GkcAXbUF2ZY5BHTT1h73DRe7LhwxjyTgs=;
	b=ByU317QTSI4wQS68QB9ZTfDEF6IOMQshTKRppHV4dQOFLVT6nJyz81Gy2HrZk44UUyMBkX
	bRPOZwRUPKHHCzBg==
To: =?utf-8?B?5YiY5pyv6auY?= <liushugao@xiaomi.com>, =?utf-8?B?5pyx5oG6?=
 =?utf-8?B?5Lm+?= <zhukaiqian@xiaomi.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, =?utf-8?B?5byg5ZiJ5Lyf?=
 <zhangjiawei8@xiaomi.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6Z+s?=
 <lingyue@xiaomi.com>, =?utf-8?B?54aK5Lqu?= <xiongliang@xiaomi.com>,
 "isaacmanjarres@google.com" <isaacmanjarres@google.com>, Frederic
 Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, =?utf-8?B?5qKB5Lyf6bmP?=
 <weipengliang@xiaomi.com>, =?utf-8?B?57+B6YeR6aOe?=
 <wengjinfei@xiaomi.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <6eb4fac303f4457f9686510664e79bff@xiaomi.com>
References: <042520850d394f0bb0004a226db63d0d@xiaomi.com>
 <87o77m1v9r.ffs@tglx> <b07f9746a58d46919b1600b22f5dff05@xiaomi.com>
 <835d5847-1aa0-4852-89c7-6a6996b3eb65@linaro.org>
 <bc1a086b932f454f9379c49221983675@xiaomi.com> <87o775uh0y.ffs@tglx>
 <87frrs8lsg.ffs@tglx> <87cymdsu0r.ffs@tglx>
 <6eb4fac303f4457f9686510664e79bff@xiaomi.com>
Date: Sat, 05 Sep 2026 22:59:54 +0200
Message-ID: <87o6eb4do5.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28 2026 at 09:08, =E5=88=98=E6=9C=AF=E9=AB=98 wrote:

Can you please adhere to the kernel mailing list netiquette:

  https://people.kernel.org/tglx/notes-about-netiquette

> We have verified this patch on our platform (kernel v6.18 / Android 17)
> and can confirm it resolves the race condition issue. The problem is that
> tick_install_broadcast_device() calls clockevents_exchange_device() to
> move the old device to the released list (setting it to DETACHED state),
> then updates tick_broadcast_device.evtdev to the new device =E2=80=94 but=
 this
> sequence is not protected by tick_broadcast_lock. The cpuidle/hrtimer
> paths can observe the old device in DETACHED state during this window,
> leading to unexpected behavior.
>
> After applying the patch, the issue no longer reproduces under our
> concurrent CPU idle + clockevent device registration testing.
>
> Could you please share the expected timeline for merging this fix into
> the mainline kernel? We have downstream products depending on this fix
> and would appreciate it if the merge could be expedited.
>
> Test environment:
>   - Kernel: 6.18
>   - Platform: Android 17
>   - Test: Concurrent CPU idle + clockevent device registration

and to the documented process in Documentation/process/* which clearly
states that the way to confirm that a bug is fixed is expressed by a

Tested-by: ....

tag, which allows tools to pick it up automatically.

Thanks,

        tglx

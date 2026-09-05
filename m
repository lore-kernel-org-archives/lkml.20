Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019F3644D4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643288; cv=none; b=BXmTrewE0eO6oL6oFwqQeMRjlcDfM7nQsyPga0Itwm67zagGRHXuyBhcbpCXfh4/znWr+iZdlc8cxNd0uM5W+VykED5Taowftrhl5dpSpivpyO+2LLOi7h+ABiWZB27ARV9Yw3+UvJhfA/p7V4Gj3vg/wHJEYnaCKdeRBb0Dot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643288; c=relaxed/simple;
	bh=Eq0pTZBWcAFVdSnOhAUrrgZHA8ZeF07Wngt+mYlH3ms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mCmujHWAN7OYyIyupX3FeBdGKfiVKl1DMysB5hIyCm+D6SDkAfmmqjjf+tluJ/TL6yJuT3PryHosAWQPththGCMzN7BGmC2nljU78tk+zdj20bny/IZCAu9rgc6CZRn5zXAgPukWjYTQ3rfVVrqvcDE8UXCsZbpWSMyPeSwimAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AqLM+/fv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NXqawNuw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AqLM+/fv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NXqawNuw"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788643285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq0pTZBWcAFVdSnOhAUrrgZHA8ZeF07Wngt+mYlH3ms=;
	b=AqLM+/fvWCQjzVK1RmH6ASwm2r1trlRoleRCv8SiKvdC9WzwzB/nN/S++xFZXSl2cREtPv
	D3I6hz3cJHxYK1PLxz0hQXlVnkcFjc5EFV4Ta9jbFJIpjkoAQ7odL7qB4jbxXwifYUB+oX
	lI5hQdP4SEUSFHeRhbNGvfs7Fv8XmbhNoVfisuEaWGVC+REj8akQLVpQxmkr69FV3toshv
	9dMauY400qfLjqutbULP2lP3dq/XYF4S3aDjEbS9haHxfd3sfV1dJl4YThVRti/+TGDgoS
	z/e+wkH6KibF0ytjjjmcBussN6HO0ulhIY6+iW/oG65vOQsjC9d+wEe0YfBoaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788643285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq0pTZBWcAFVdSnOhAUrrgZHA8ZeF07Wngt+mYlH3ms=;
	b=NXqawNuwg4o206a+qYdrtOt8Xno2SJKMSDdGBPM6ZKtglxXyAWC4R2yv1HUGQRgiN9bYTB
	XDwb4C9TEGtvD4Dg==
To: Bradley Morgan <brads@mainlining.org>, liushugao@xiaomi.com
Cc: anna-maria@linutronix.de, daniel.lezcano@linaro.org,
 frederic@kernel.org, isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com,
 wengjinfei@xiaomi.com, xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com,
 zhukaiqian@xiaomi.com
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
Date: Sat, 05 Sep 2026 23:21:24 +0200
Message-ID: <87h5k34cob.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
> Hi, I have a pixel 7, if I could be asked to backport this, then I'll be
> happy to, for the fix, add:
>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>

It would be helpful to respond to the actual patch and not to some
arbitrary reply. That way you might avoid your tags to be overseen by
tools.


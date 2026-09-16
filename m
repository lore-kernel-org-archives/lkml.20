Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DA93DDB0E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560518; cv=pass; b=Mf+qwQmYKrPk74MydUACsnNVADvDaKou1XbpVXnf7uWr9w1S4yhufqCupIkKY9ie2gGMWW70Lm9TVbcdGiMLoBbC1faIW+2u87EDTcLP3VyVsxSPKsp3rQstC8MumI7dbM/2j918mrrdBZOSEQRmGtNISzm23CzuOq8lSmoasV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560518; c=relaxed/simple;
	bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGLaTQ+KXT58jKE4F7uy38Mkw9qM/ndWK0Zs1sG/HvlKf+HNMNnv+9XSsgeGbFkB5KMiO3m72ZORwt0P1E8ahsj23/AI5FJVO86cbcUPQLFX9EbsKoPwhRcaENkhQCu4Q8TW3HnQkWnXXNmGN9HggK0X176doGh9sWdwbiNvL1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTkCwACh; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTkCwACh"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef19aso8352771cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789560510; cv=none;
        d=google.com; s=arc-20260327;
        b=Br/u8s7RF1Y3UVn6GiFgYKQWtxar0u+DNFtoXp4yGBDQBr8LsJz8/u3eeJEKjZ8Y3k
         lLGSRNEIOjPQNJxgHHuvJbGb58yKZ8CALzXbOYdZfweRjLBaVI4gIw84Iu+hP3tm3TdS
         B2alc2glbRUAXgKDtjDjsrBFJI7gFsZRWsT0kqRoyiBt3CKF+dDtpJwmQxhYrvwomRNR
         MwwskDeNoWlya+KIr71jwpjBxoZuhIXJN6DUPrtLusaDxCy3NelwncOiOf7X075SuLlq
         3co0WcnfxA0hseBbITwtU9aFyjxZzoVkD0E/jOes9mnQcwG7QGv/2z4cxU0nBlf7IPsG
         dZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        fh=51Ck2ZCh6tCZArYgzxVPlD379mMeVBlLP3u4kssl+Ps=;
        b=NuhJYRO6j30736yVmcKREJacJISgfuP3helhGpC6MksLE+teyG4gi5IHmQgu8cOyLe
         LMeo0IW0vvGcAgrbvD/a84pHKJWKN3g8WrzMS9CRlcD11AJTLS77LU0rsOdDw2ShyUD/
         WK0LsefiGMyRLHNkS0CK6QyWF8xnq9UkTYIU+ZnvaE8Xw/qboROD8OJptYhaLK8gGuGN
         OxNRljy82pHxseGj7Y/fmQJ/iw0lx07vELGwno9mCuxA2OrAWN+0GYN/Cp3lBsyx3her
         3QYIDd+Zlzq0uCbNikZ3ojGTMuHOC/yVVpjFd9PDprAVuAo4hGFwJhPvEA2MrY1y1HwX
         d7tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560510; x=1790165310; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        b=eTkCwAChrQGmVSAzHGH4RJ3iGz6c4hr9TaTVS9hAzd9k/oqBCE+OlGlLSSQR9wl83S
         WY0Inor5ivbw7L64WoQ/fXZIiSpHsNIYrx5OUwSm9SWbGYaCuOclgPXHHpH41QRMgpl1
         9q6lRlVUMq/8hd3/o6Dr51N6oow8JRHKe3KLjNbZpMcxKc+USoRk6rBoigaBR/5keTI6
         5Y/vTYvn+uT2/WnI067+EdtsSvAyHBs6qUEFsJshuAMzq0dmLqkU+qK98sTeMum2p1iq
         xog6q0H93JnS4fLoJWqDRp7qHIoFv4O1mvDbvg0gfZwSbVc4OuHu7rcjHfybupkCyTk5
         81Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560510; x=1790165310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xSq8f10yAtabOXxWdIiS/nzsSXBzun+1m9a/tEIW3Hg=;
        b=o9NRr3GFtIaCkrvd0CqQH66gc+OQWpu2zXq4Jo9zr8N04TpZNQ1U5xwpodhgoFs3y2
         PlDRcFyYH6DQdaijzJrYOkKT4q6zjcvJe/7O/2vUcNIBuT6qB5YI3VcuspnrX2MgA+sa
         6jOXyqikN7J700d1wcAqu6SkcTXac8FEm5Sr/Pk11I1LAvj65caCnqGEAgdNePdDUbZ6
         G1EygETcdrCrz112oCdka4mNy50mJnY84e7QD2gxPzmfk0D72uj6Vwdf8xj0d0xYXikJ
         7b7TdwmvHlvcvJL++s01ewgfNNmO3YmXpe7QRpTlo6OLL7MOlW0k0yPlH25BnpQaXPUF
         dMYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8L628A4toc/mQcH6q/Rs6ZW8MXiOg20l50ctVlz6K6q3KcWqFcyzUVs5uoz8pgvt2Dz3YYDEL3nHQgSE=@vger.kernel.org
X-Gm-Message-State: AFuF++nTXvKBFXaz+iK7kBp/Jif67rU9rwHSza2hCA7bnHPjnKzDAD9P
	9w29CYl0XjV+ZXoLEQ6vypLqxNByDgISdDKinK8S3rXoI0CtuTpxl7FlC+zV2Pi1n6kdC2FnzXZ
	/LelAyQVrV4mTVjiBI4aDguD4zQ8GsQw=
X-Gm-Gg: AYBFou1u+vva7NMWquZZAYjzIF0AohlLpWt7IygYMdEAAFbia1J4Zm8jE57Sec/rIl9
	2TfHGiHtGRQguYpNvI+MWYE5sv4WEMzK2Jf5CsTAsJHNYTynDfJR0ovLxNdl31ze2VXutbb7BnV
	jVtWOZJCOG7L1MNGXw3OW9x11+kB5JWGMpI5FrMA1ew0r6IP79/8Cwav+yicxdvzgk9q4VDNmIc
	zPghBejAU29uVJDJjCTsR0qGBzDLylAPwXmRFX7eid55vDd3QsUrzh9g5xr48Kk3qMejq4jXGb8
	CFuHUmmHh2ewsixEytDkl3T4M/2a6SrGGKcC3Vu4VdNd+qxw5dtAzSKW
X-Received: by 2002:a05:622a:1b19:b0:530:5ed1:561a with SMTP id
 d75a77b69052e-5327eee82f6mr43123021cf.43.1789560505709; Wed, 16 Sep 2026
 05:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916093928.52057-1-palaomer100@gmail.com> <87ecet5xos.fsf@yellow.woof>
 <aqp4GA1q6cLKivZo@ashevche-desk.local>
In-Reply-To: <aqp4GA1q6cLKivZo@ashevche-desk.local>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Wed, 16 Sep 2026 15:08:06 +0300
X-Gm-Features: AcwNN1WOW2WDT240y0ILa-CLMyO9YvF4o43EaQSFbhxhDmsrCMG7d8RZROqqgSQ
Message-ID: <CAKhZXnr0GdUrEu9vyMAWRCWyQzPM7cWQ6LRDa8fX0hnMkTN0RQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_upd161704: replace udelay with usleep_range
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nam Cao <namcao@linutronix.de>, andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2026 at 12:39:28PM +0300, Andy Shevchenko wrote:
Replace udelay() calls with usleep_range()to avoid busy-waiting and
allow thescheduler to sleep during delays.
First of all, too condensed commit message. We have as twice room on each line.

Hi Andy,

Thank you for the feedback and review. I note the line-length
formatting (~72 characters per line)
for my future commit messages.Second, do you understand the difference on what
code is doing before and after your change?
I understand that udelay() provides deterministic, busy-wait timing required for
hardware register initialization, whereas usleep_range() introduces scheduler
overhead and non-deterministic delays.
Out of technical curiosity regarding the driver IC: theoretically, if we knew
the exact window between the hardware lock/stabilization
time (min) and the internal state-machine timeout (max) from the datasheet,
would a range like usleep_range(min, max) be acceptable,
or does scheduler wake-up latency make it too risky for
timing-critical init sequences without hardware validation?
I will drop this patch series.

Best regards,
Omer

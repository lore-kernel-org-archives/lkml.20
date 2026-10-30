Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334174;
	b=OGs2rtARIsW6xs+Y8vnv+DByv2VoCGmb7Hh6oRkpPhcDQJBHF2Yv1rQz0RzGww+YJkhO
	 jw84anaYLr/2JgLKAOc9ubtQKd0lWQaFTWj/LKE21I+d0deEj7ztMfmhCGQWmSjMjwU9p
	 YqwT2zyOsDGEWdeshSceOiKn35/zpoyMKqKLvZpAO9cD20fO3HPfRb/+Jg6uItfbe1fQC
	 bszNmVh+Rb3UatdaG1x49fLYlgsQ5VaNkdT7JaOFak5dkCKM7p95BhIb0809+c0GWKEI9
	 8BxPZ3m2AZIUcnXIQ5o8Jiso8p5AVpFzooq5o5iuls3vMZZx6kLZ71wEQVK9wKTy5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LKdcLwwbAs+9mk+2eST/kXpD7oMhNL5RH1/U+V8JfPQ=;
	b=IIFR3Dyr7aHbdiTGU5hHUuMS6zX/45/WpTM+28xAun+6GASRK9W/zjO4rT4QpBq0JOgO
	 zDoB4ZKMK6kMjzDQ0ujScyLF+tdus1WMPc3w89ixs8C0xmaMahfffh5pu3xKABSDaerwR
	 I7r6OuK4+da6IzNgK5jtksSRRd0SZfVmZ0Jbb6p599+l9cvjRbZMJrWtruDjqTtvue8BY
	 2+jcivjx4Vpc+pxlT8kb8esNhYa/GpmSgrKJVbSJ8NTWA5aeX4HPvUtdh8UH0k7eb8fQe
	 qglEzDpJ5Ad54kahv3AKauGC0yv5Op4VFcL6HtGUec1fc3sJUrkFtLIOUsyVjF9nUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HH/5x1Hr";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52155606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52155606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HH/5x1Hr
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a07025cce4so87640b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793334168; x=1793938968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKdcLwwbAs+9mk+2eST/kXpD7oMhNL5RH1/U+V8JfPQ=;
        b=HH/5x1HrhcH5qVKNTrWXKdrNUXRlbO8WZvlnJiQZ6Fx0rvohU6rYUrSJQkzGO6QeUc
         7fTNITiDKdO6icU/O019rN3nR/4MwvcPRi+PFz/hLc7tPy3FPmr/N23LooSsgiIPV1FS
         RiSV+mXx4WI7ZYM9zpAdHibonCcG+QpGZbI6joPG7n/jY5vjGdBmLMUtA3ASztU3hicw
         rFn3eyRjafNMpvhdCW4SssnA2zRnKKA76+ze+Xm5QvmKK2bFL0zshmi7UmTVPyS+We6q
         FFMasastOJvC4EHLydNMSzaQk1WppOWzQU6Z/wncxO53NsjrXQ/gNO44L1oOGl9IEKza
         V1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334168; x=1793938968;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKdcLwwbAs+9mk+2eST/kXpD7oMhNL5RH1/U+V8JfPQ=;
        b=bpqFTWKPyQ/irPEQh8uD6Xmx6qUzdduAhkThfAW2rGiI9vuqZucjoySPy1qWbJ+6iq
         yF4lLOoYuO4VT5nAdzS+qxf6zSzKkW1CmIfAiDKf3rfBF2+tbx8WiyFPdNzAAzyc7lSh
         pW9WFfCpHFg/Emyvmek7qkELRqEwNDLNUEF8LFCL3dTA7lNsCWOUfPerUN9ayCMkTcmj
         aPL/4BEopMh2AffavrlgADBsYW4M3E/qFhuDQBUqiAt4mJhtkcbREsUV/X3W4Myg7oKD
         Xq5xgV+1dZByiDlmtwEkqYtqlnxAKTowcYtnfhJo/Ai5ED1XMjwqBJsUkpDKwMXNS2Aw
         7vaA==
X-Forwarded-Encrypted: i=1; AKwUvBxbwGXywg12oXwliUO0DTAvl0Yfqfe1ji4+fKRr3ahZMJojH+T9Q37gXyvoCaRoRa5mKQOhNWyaKwIUH6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+K0VTFkNxdkTQ6+Uw5nZTkzEQHq4336TqhW0EZxKzq6xvIS3R
	KqCLXiOECoor8e7l8z3qNMLFECXNdIzpxKzQZpsq1PMXTZBMm3/yNA9X2DdincQGfg==
X-Gm-Gg: AYBFou0cF8VZyq54PnM4sfYIYwVv3ox/HB4y/Eme0lfMlHMwLIz/EleRpmMlFmtLDBo
	5hh6L39OI7pqlFEYbMS5O3iyL6Fo/hyoFnryKLmyqrB9pGl7NMjF5C9/aIwkFl2alfq8jOd95YU
	om8eVqTWixJKMokizgB6z2TlZdZH7MGsfLzv5k+ZL45zqiXNfVYelRomrjPfTDV0vMw+SblSM3U
	fznl00heD78GlboiVVPNW1Yeq8tWNbnJIaEFzI23I1/s9t+P/fr1+50BgFscUHZ2bxYylxAH0EE
	N8WPBX9IJy01vJmCUY3cn+iY75/eZMBV5Cj8EuXCoYp4Z0suUq8BfB4mOtCtMBF4AcwUzXeS0yL
	y7Q1wB2uhy5HIrCty2xHWAmaC/i5MWlXiYRo4BLBQysjWKZ+AWLvI2Ke+z8NoRX/+EK2SXSP/2F
	V4vZ4/nEP3niJq/VNfdPVVP2y/czy1DbAa1aOcBD6mCdDClmfI3nkFm+PzQV+V6y1D7A5lxowry
	ArQkTxOo6MDckB2JZSVfi392hRf36EfmN9hUoFn3F3pABsFYj7oExlEo+dvKgMQRD5+uI+g2P3T
	ajgeN8Y6XusWM2y6qbAmsuGnecS+vr2g1vLd7T+vQEB1BkSdxJYefSdfAk5kLedgudjErq+4pzP
	bFrWewjvbkIehASnR
X-Received: by 2002:a05:6a00:a90:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8a9c03b83e0mr969146b3a.58.1793334168419;
        Thu, 29 Oct 2026 21:22:48 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eff2995asm231084b3a.53.2026.10.29.21.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:22:47 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Aksh Garg <a-garg7@ti.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpts: adjust perout genf following ptp changes
Date: Fri, 30 Oct 2026 11:22:41 +0700
Message-ID: <20261030042241.2736240-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <c139c5e2-c791-46a2-8e60-556aa6402e12@intel.com>
References: <20261029135556.2508688-1-jjc@jclark.com> <c139c5e2-c791-46a2-8e60-556aa6402e12@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/29/26 22:57, Jacob Keller wrote:
> Makes sense. My only concern is how long does it take to finish the
> adjustment to fix the PPS? Could that impact the rate at which you can
> perform frequency adjustments? In typical deployments, frequency
> adjustments happen at every PTP sync event, which could be many times
> per second.

Hi Jacob, thanks for taking a look at this.

The register reads and writes happen over the SoC interconnect and so
are fast: I timed clock_adjtime(ADJ_FREQUENCY) on a BeagleY-AI and each
enabled GenF adds 0.84 us. I also tested with PTP sync events at 128
syncs per second, and it worked fine.

> Also, is there any loss inbetween when the correction comes to each GenF
> that could still create (a much smaller) inaccuracy between them that
> compounds over time with each frequency adjustment? Or does this updated
> correction keep everything aligned by the next pulse?

There is an issue here with how the hardware works, which I think means
that it is not possible to guarantee that the periodic output is
absolutely in sync with the PHC in all situations. The hardware has two
separate counters: a timestamp counter used by the PHC and a GenF
counter used by the periodic output. Each of these has its own PPM
counter used to apply frequency corrections. Each PPM counter is a
down-counter: it loads the period from the PPM registers, counts down to
zero, makes a one-tick adjustment in the direction set at that moment,
and then loads the period again (as described for GenF in
12.2.1.4.7.11.2 of the TRM). adjfine() just writes the PPM registers;
the hardware does not give access to the PPM counters. The PPM counters
are not in sync, so they can sample the frequency from their
corresponding registers at different times, and the corrections applied
to the timestamp and GenF counters can accordingly be different.

I tested that the hardware behaves consistently with the TRM. As before,
the GENF0 output was looped back to EXTTS 0. Writing a constant
frequency every 10 ms, there is no drift. But by writing a frequency
that alternates between +0.1 and -0.1 ppm every 10 ms, I was able to
produce a drift of 100 ns/s.

But in practice, this does not seem to be a significant problem, at
least on my particular board. I tested with ptp4l locked to a
GPS-disciplined grandmaster, at 1, 16 and 128 syncs a second, for 60, 10
and 5 minutes, and did not see any drift. I should mention though that
this board's crystal is 10 ppm slow, so the adjustment is large and the
PPM counter periods correspondingly short. The results might be worse on
a board with a more accurate crystal.

In any case, as far as I can see this is how the hardware is designed to
work, and I think this patch makes it work as designed.

> Obviously this is still better than what was happening before where the
> corrections weren't even applied.

Indeed.

James

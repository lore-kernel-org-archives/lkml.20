Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FC63CD8D3
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745832; cv=none; b=NdOJLtC5HkqXOBLm01LK6S4ennLgDU8qABRkjsO+34tHbmIg+Uww3VHDNowKlGqYud1GRR6R/6iOIOurhGG3kbyJL3tGybu39u5DlAsxgTvusGgk/tIKc5swGkC336884Nk1BKN69zs6WHypJbKSubOCXmnkj2EQtn0jiABfBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745832; c=relaxed/simple;
	bh=RjdAH3Y9wwiPn80wJQYztLmuKKN61VaF2ABE+OfYkgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwbZ5SgXPq9kO4WJAxfic6VSVf1KZUxrszyP8BsSTC34V3Q6lagoJRxxTlsN/qDa3zVfuIffg/3ZioRgfhAwukWC6kXMh6ekhyu6bxrpnBOPpw17GWm7mxuwJMNAlwC5HiFq7bVbTsYs6AhslLt2RzyYB7jaZY2JtGZIbI28VLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9+4JP/U; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9+4JP/U"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so9505685e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745829; x=1792350629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QTR42Go9m+6eVHpUpw7SmlR7Yrf00JHufO82pWXeBX8=;
        b=j9+4JP/Uj4Dl6xmXO6DoyVkVC8LvFhEAQzdApR4lBDZAhKq22zR3/L1p4h0BtNCpsW
         c96uqK7y7U4zKw5UP+oQWUqOE7z6LSJWoo4vmhdZmdxLiY6RjFlaTr4cLJkrC+6LPkOE
         HYmYmj+CIkWcynQZV/AwOAd2U0wGu0UHuJM5PzAP7ghGsO5CetgQ8SlPlFMgKgqYPuAk
         uiU6K1cRwSU/L6FQzX+EY0QCMm9BinfbyONx+BK7PMujjw7JOpbMMtx6YXaGmk5CxKBe
         EZx8JQ9COk9mHWVZ/ImzeI6+VXp5RpcsUg1qsOZS1zCbgRgBptxohHBCuDpd4/nnr0So
         jGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745829; x=1792350629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTR42Go9m+6eVHpUpw7SmlR7Yrf00JHufO82pWXeBX8=;
        b=hgR+srarhUIPXrKbK4Q0fHOu0l580cP0hKJ6YVqJDRGK0XzRKVW1NC3mR/spAP8jIW
         r7fgXr1YuP0xeBdFfTqIPssJdZbTsFXlisqlmmTZ+ETVdCRg9uXesmiYkXSkA9XrXdXN
         GLJ89i6VUlZfkUoVgSurFld4qMZYpbe/UF1lELFyLxNj4LiK6w67mEVA/Ea0wXLrTJV3
         l18jMkz2dTmrbv0zAZmlsrVdeuXWmqhVJ87qtAvHpPFJHFrqQkTp4nhpS9YAjE/ep4dB
         3avEqF1gI1df+Vx1Hqa/3x5yi4Vu+dE4r1TqI1zvkbRd9n3KQG8pg1Jzv8+7ati+GHB8
         oMAA==
X-Forwarded-Encrypted: i=1; AKwUvBwqMtkT1kbHdoJFjjwP7Ud/0T7gufoET+QQlpQRl3VYOxZ0nvmpo/MWc8PsjzikrLTa7jBcxOu4cq/QkeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvrEYLuo4dX3oeYflMot/OUbxDru3s+eitqorpAUjyA8wo7vzi
	748qpBXvv7szZbom95T3Oo+AdVq97Sh+P2VQgaXyAv8Vo9OcPrmCw+EA
X-Gm-Gg: AYBFou3AXA77ZQCFQkj8wH121hxPmns3F8p6FaRBFuPaxjft+/NenyYfm/6FJtBdDxi
	vHQLQqQt3u1IYsGfhLLIzMWDwLKsMKtkuXFBVeiCbQFnUA3oOib1SuSIW+vIizrrGUCJWG2RYPj
	E5Wbl6QMJTmRSclxpsPurq5aBDbAn0zXa+YGD1xl192/bPy8jXj/mqOcsXgjKq2BcFqXiA9x6Rk
	nb5+YYJojhd2wYFJukrISDh1Ybr+0/hj6rWSLuUKbPWB9WaoDZ2ZnIT1H17E04ChD22sQbXeCcg
	lsNDyquHfGBk2gqtLCh24H75yw2EurlmnfBLQ3/+qj5yY/4MeJ/gNPv5jS34e4dSUEiS1QAXk/6
	yd17NA7LiNT87fGAHrQOLLbv1+AER4cTSNVleelgNMrz4GHezrpuplM4S9rq/l+xSV6+0szysmK
	uyQ3frQPR/Y6ZzAAy4aQ+AglCbDvpnw3vibWzEEO/erYiGUowQSHO1OMAYuGYquKq2zJ/4iMR7u
	Gr9TwMDYA8Zdvs9yWGomSwjKbj7tKN/w0xZRjKZJDhoPfgzU7ccn1Fxq8mcKgqost78hDSDMYMH
	VSOT5icZ/v2kAa1h+vYM1yUGT40GErnxmtP/cUx5gK9Ex+MLLKxK4pFAQsIKjgI48Rxf9MvA2on
	pafrj
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr128648855e9.12.1791745828643;
        Sun, 11 Oct 2026 12:10:28 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a124-4001-d491-d32f-6b9f-21c5.310.pool.telefonica.de. [2a02:3100:a124:4001:d491:d32f:6b9f:21c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm15237808f8f.56.2026.10.11.12.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:27 -0700 (PDT)
Date: Sun, 11 Oct 2026 21:10:23 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH net v2 1/2] netpoll: use a raw lock for the deferred
 transmit queue
Message-ID: <asveuLDEf6a44bkD@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260930192103.62973-2-kmehltretter@gmail.com>
 <20261001074819.gQ3w8q6P@linutronix.de>
 <ar7sTVun7mF-4nl6@gmail.com>
 <20261009155225.6Uy7b0wd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009155225.6Uy7b0wd@linutronix.de>

On Fri, Oct 09, 2026 at 05:52:25PM +0100, Sebastian Andrzej Siewior wrote:
> 
> I would suggest to untangle that local-irq-disable assumption. Then we
> end up with the ::write_atomic callback on PREEMPT_RT which will raise
> warnings. But those will appear only on panic() and as the last console
> due to CON_NBCON_ATOMIC_UNSAFE so everything will go according to the
> plan.
> On !RT the whole __netpoll_send_skb() will be with disabled interrupts
> due to the console lock. On RT it won't and I don't know if anything
> down the call chain assumes that.
> 
> To illustrate my idea a bit
> 

I've got a candidate based on your sketch. It keeps interrupts enabled
for the RT printer thread and the deferred worker. IRQ-disabled direct
sends keep their existing path.

I have one question about retries. I've kept netpoll's retry budget of
about one tick, with BH disabled until deferring to the worker. The
IRQ-enabled RT sender cannot poll, and with the BH lock enabled the wait
holds off local completion work.

Would you instead defer immediately, or enable BH between attempts?

So far, the RT locking tests look good, including on hardware. The
generic change also removes the sleeping-lock reports with macb and ENA
on Ethernet.

Panic handling and record ordering remain open. The non-RT console and
IRQ-disabled atomic paths still need to be addressed.

Thanks,
Karl

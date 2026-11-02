Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643911;
	b=w1//otnf45h9Cp7k6SuhBIm1ZkZr8DxTRvWltkAz828X4g6eZvTTKAuudUKK7watkVsi
	 2MMpGQgvTpHYaosSVpOAe9dqsUEpjg0D/EwwQIOLeg3180kDD1ZHp5pvbindoBDDXc/B8
	 gd+NtxuoZMOA3ArIHkxrfhVdBhef+OdlRJdbrTUtsMGeKosh2Bp0DhGLJRO5x4q/yh760
	 dT6JK5DO34ht76iFMElJ4jz+yxN6y3H2LtDCJszN/5ZxnR1/pL/naftIIRTKHO95Mwgc8
	 AhzW9zHAKBdMD+gvcaha6Ogjz3miJNOlt5uf3ScZBUL95/dDWWbSQlCtapE2z8RkLkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z41mKtHOm7Mi5CS6B12EWoUXhaoVqMrutmZJokfP2gM=;
	b=kUbu9Fwt+KToTV0JSQdQJJpZs2aqIp+jfxdgHK6jTBw7MxpS6t9l8cmTi9NVryDFHrRu
	 vh5J3bUX5Ph+ofxrlBIYRGidxYHeqdgAm9BdTvik3+jijQeclfZ308ilKdXG3mPQWum3J
	 GZuGzIXV/DeuI8DYi7QIVmGFqKMIe2zcY4pRcot8T966sYFP74/hf4U7hcyhHXwUFpXEz
	 Kkey7bpWpkJhaT1GJiWwYVDrRI0cjjSiVE54m0F0eL8/du77bjholzyWYcnIl+B/vKSfR
	 5TwmJQ+dCTSdd3MFGHtbrFM/+YHmKlSxbeMZ0uP6SMgQuWp894dKM0hhbcJv88SkDWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRJX0RF8;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E6606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697E6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRJX0RF8
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1350490eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643909; x=1794248709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z41mKtHOm7Mi5CS6B12EWoUXhaoVqMrutmZJokfP2gM=;
        b=wRJX0RF8HzOJ5vHpbUCAKfZVjV3IC026OA9dQPQiz8FmPUdyqsaFHt8LcpZ43ExlRJ
         V131kcsJQSQmh60QT+FT7u391++5YsW/YO1DbR+WV8QL6E8eYBo3gGcPwCrAgWVG5rBl
         xPlLnxQ9m5+fvTxjr/g4bwZc0JGUnpU3natXbNrqN3XDX/Q6L7zzd4F6iGzyKrsPQItj
         Xqx1Ed0Gcr6oSkwDipSu2F2AE2yVj9CdZEI/GzDD2emXcMnfxaEAOEUnQ52JLAyxCcTe
         vMadz6FaT/RD/UTS6WJ220Qt5fRzD49ZSypC9hgqQxdy3e/lboRbOgyp1bUDlnQ3/dgj
         PATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643909; x=1794248709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z41mKtHOm7Mi5CS6B12EWoUXhaoVqMrutmZJokfP2gM=;
        b=z5xpAY8qas5pUJQaxHvU3THYuSXN/LcAGtnHZy6IEJpK8cnF/qEKcJyNIOvJcL9uND
         fG1OT1BBuX1HJer8QsWHw99SUJyAu5olqJ4/s5DDRxXs+njwGrTTzMSlgP2xUFhuLmR5
         7FssoHw0kX8jJEunyNl2q7bmyhry5GgsjTFpadau1/fQrpKIFCB9aDyOC9beyUxQZqOw
         jUbNkxkzr/XOj1EYb2d7fKnAHgTAgl/JeExdp6Q/gq+lbS9owa3IuhgX3geg+wkBVcaA
         55gE+Tz7T15YwOZ6l4AasXOkOQx3XGg2j2ZkIh8bZXQOir5C/Ptxup2A5tWCeR6TVosu
         Udfg==
X-Forwarded-Encrypted: i=1; AKwUvBxoMFlRDmQ1TiwbdGqZFbODWkxKcE9nLs8BbrcHq0i92p83IOZhHksvqclfXS34YQChTkv/Pf8H6BTnSVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKHqWD7Q8ssPqPjhuCufN330loDzuclmmhD1Kz5+7kbp9/U8Zq
	GS3zDy4m5HnNcuM5/lzvF0Am4hDOIfrc8pmlhJvPEYgZ5TEOaT2k55er
X-Gm-Gg: AYBFou2O7jZ90ELCSIQDSstZIqZkrfvtHccHL1UsCdCGY9xC+Dc6nCnAMqJNn3FJnan
	B0Mb2/EQbslz8bXU20XGBTn0+x5j6wZr2NJ8gdUQi3e7vFj4a4Ctsgh6wx39oVyipWSORyQjEe3
	KDEmhPPVg2zhn5m3rXzPMBhrrrGXiM/d5rJPTGPTYkeiMqp2c2Xlh49+7TZov65U4EOA7jhyho5
	onBA23IR8RFNBi0IYhiPHgwmf+1jd69rd1uHB1WMkxK+annD9FAHsYjtXYxWHhkNSDFHRC5fDoj
	cca9l4hXqW+GekUArpj3U3T+QB0GRvUpOIwyZOwFBb1Cf/EHKzIj/HgVzLlwCJUr0IPdpC2JLJa
	bk9BFznJ2DlpKr5qWDED7y886WR3N+Y7NyuHWCwqZLO78+8ARNX56ogXtb26Yt+IptX178awh+L
	RI66LDH752fKnpPG8TuwdZne+WgsUayZbpSofjLVl/7+41mCgDN9ep+GC1qEaxv5KSn6FwcqIYE
	d0WA3NyBUFSdMf+/1Fja0dLD9nK3V8gaAaij+ThRZrtaoXYIhTQSKmNCG7xq8jVjcJOksO6sfjR
	RBAqSW9PfbPM5u81O5vWGx0=
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr18049891c88.45.1793643909092;
        Mon, 02 Nov 2026 10:25:09 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm46557054c88.6.2026.11.02.10.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:25:08 -0800 (PST)
Date: Mon, 2 Nov 2026 10:25:04 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] selftests/bpf: cover AF_XDP multi-buffer TX
 software checksum
Message-ID: <aujU8-MBZ9LrhFMd@devvm16445.scu0.facebook.com>
References: <20261030023248.78802-1-testwrzwrz@gmail.com>
 <20261030023248.78802-3-testwrzwrz@gmail.com>
 <auT51NbSPvKJwgiD@devvm16445.scu0.facebook.com>
 <20261031013143.42509-1-testwrzwrz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261031013143.42509-1-testwrzwrz@gmail.com>

On 10/31, Rongzheng Wang wrote:
> > Any reason you're not reading the real value from
> > /proc/sys/net/core/max_skb_frags ?
> 
> The test wants to exercise the maximum supported number of frames, but also
> needs to run on every build. CONFIG_MAX_SKB_FRAGS ranges from 17 to 45, so
> using the minimum (17, i.e. 18 frames) gives the largest bound that works
> everywhere. af_xdp.rst documents the same limit:
> 
>   "For copy mode, the maximum supported number of frames in a packet is
>    equal to CONFIG_MAX_SKB_FRAGS + 1."
> 
> xsk checks MAX_SKB_FRAGS directly (net/xdp/xsk.c), not
> net.core.max_skb_frags. I also set net.core.max_skb_frags=4 and ran
> xdp_metadata; it still passes, which confirms xsk does not consume that
> sysctl. Reading it in this test would not tell us the xsk limit, and would
> only reduce coverage if it is lowered.
> 
> CONFIG_MAX_SKB_FRAGS is compile-time and has no userspace interface, so 18
> frames is the portable upper bound. That is why I used 17.

Sure, people can set max_skb_frags to < CONFIG_MAX_SKB_FRAGS, but I
don't think we are gonna do it on our runners. So for the purpose of
this test we can essentially assume CONFIG_MAX_SKB_FRAGS ==
max_skb_frags.

I'm just trying to understand whether on the builds that have
CONFIG_MAX_SKB_FRAGS > 17 we want to exercise all CONFIG_MAX_SKB_FRAGS
or we are ok wit just 17.. But we probably aren't going to bump
CONFIG_MAX_SKB_FRAGS on upstream kernels anytime soon..

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

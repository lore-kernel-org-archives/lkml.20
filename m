Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397857;
	b=IH/mNBCqHb2CedQna5AtBrxO3Z2lgkKAGac08wfsb4ZCYvZW97+b8RK5aBHR3b8/SaiN
	 Sv0ah2xb+1IPTKwld0maEAPbUkyCYGM8yZdP9BpH5e7O2sy5Lfc/Kec8Njwl6knMwNZ/r
	 VCgNtfwSIlH3q3NMkZlphGiMzHu4+T+uYVEgWgqrkLhuV7Qlny2QVMcSzpFuvYNi9qobg
	 TSHhUVPb3N75lmjxtemDXhAwhxLG8BdUx8pp+OEJGD6yyOwuBTjGiDkORPmlacwy95miY
	 ymriC0Qzmr0rKQ3l5NVWoSvQxG7FxBeVtzH4Igurt0Fdod8/NhA1ID58JK65Z4u6nzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=WRH6MUKav0M16elL+r1RNi0TrTCbg0d2/wobD3LW384=;
	b=VpfZ//tDXn06TPw+U2gRV90I0KCGyF6Mz0uXnak+FBEWNMD4TpHShPsaZEuhMKlpwzph
	 JmqzRSDhqlBmVkscG06He2e3Gj9qp2gs3G4dOahf/4ODA8XhmOZG2bf3zclQ3Yvkunn3E
	 5UxkqCe8pT1Eotn+M3ngdNF1AVUsAzuLeR/Mr3EjBjj4QPrhyVZeTvYs16bIeYAN9nHoj
	 pgW1DaV7iKVJ/2cWtCTQSvYG6GoVtBQL2YTsTEl94W37k9W5lxBLBAK+E6qXG++UOtkUx
	 Sm+Curz98gq8sjKr1t+qY4HZLVU+5k4d54rsLozYIA+4MunRUgAl31+l+BWzullX2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGX+f0Wc;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F22606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F22606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGX+f0Wc
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35159e0092aso45893eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397856; x=1795002656; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WRH6MUKav0M16elL+r1RNi0TrTCbg0d2/wobD3LW384=;
        b=HGX+f0WcmJNBmUWM5pznE2UBBYlGHLyRcTKMBO6L6e1SMRSOrYkWyO9auSUGFvahp7
         SqDVR3b3MeCtB5VgOkp/A+xbSA6nLqGx3x2ZwTRke5+PYu876V6fMXkyDlQw9hHnmqHk
         PKuZb7hqn9f5ysW5lPsyKIt9C7BNIwhjAi/6zGSrsUzQep7hAOjRI//ygb9mQQtQW4C/
         3uUQy3hqfaVpsdnMVooSJXy142OwqdhSZ4O5CQx5GQ5dfqzSwNSYo4fbCOuINYPDeM9k
         atGIYboo7zpXiZe08szXuS2v/zLc+6DXs51UbpnJwHXaYaVWqPjo5NT0YVVAJ6bmTOEa
         4AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397856; x=1795002656;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRH6MUKav0M16elL+r1RNi0TrTCbg0d2/wobD3LW384=;
        b=El30lQXbKlqrJXSFlAOqUFdBPRf291Xt1ByCR4cOzrG6tqfJ9b6Ux3CNpMyvUdUoku
         GWvy5oU+39r7SVLR6ysisu1RZQzArj/tXqPzOZu5vl4easxE7BSWRcsxni5uxWgzzRlL
         VCWYLdGOXLV688eQXNHaB9OmJZ0Ncuw774I4adERSpvmUu21Z9dRl+UO+3ZvLH1nZcgT
         rXvXKrRZUka7IfiAiV4V5bM582ZIxB4Asd04pqhOT+NvqRtazYsvpjk/1/f5+y98LfJM
         td9qO+grg0bdHclpQwjolIo1gLn2OXtITz03ABWqkKDHXudoJs4xv3q0X918TSEVArMA
         qkSA==
X-Forwarded-Encrypted: i=1; AL+hErG67Mv72B3Q3Q8F9uGlo/dBy4rMWrEReNnQx7GzH0w6iHSpPDg3QMbdMvsnE+aIOGmhV7FR/VBm5V4fZnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z91XQr3tT6lGQIvATNwaiOJ4AmTG6DN+7ih5y/L7qnFd3Fy/u5i
	tHinXg1Nd4aJ8JOpZET0fi3f3jTS0bDLgqB4EkbX34kIAfC5QgskZv6/
X-Gm-Gg: AYBFou2C+dMbPATn9U+RDlsC3Qy8C6Sjrg3H3JViyn81z4QBxAQzCJio2JMhiCdJUfO
	QNKQxVsdJ/ddz5uGBw552ohygwkNWONir/2jBGOGUn3Hy40fDyQ/tHowptpxE5X7o9k6naIMRNB
	JPOEOxfGTg4ekpJP4wJZH+6WCQ2b2FsTLO0K2OaCZCbNnTs1A5eMEgVmUfNCKHaG0aD4Cdv/aFm
	ofYudoszfpK97TgGacsXIOmRGa7o29uFAR4jkvcsEjlIpkBVeN/vJ0QK0s7MgB8If9YnPZN2wvm
	YotY/I/3lnMPD1aP9xJse3TKEc8anYxf7nddZNhzNAFC4p1r05THwfSwwwdbQZHUOwQpnyQl4TM
	27kpuP43apsE2ZvF7J9kZLGOrn4UCpd/Hklis2lxdZGGu05Gp4bEj3jUL9/raZL6UUigS8v5KFp
	xAB7R84SBSbatKEzF6P3dq6vXcGEuIZL5Qph1bgmVaBsqcb4NqcJNSwVFpLH8n/PnbiGVvkfHEt
	7NXh1BLhpTP3l+7eBPjbBrcZmub16U01MbF2xMLHTNpT86oDsVBZbUZl2XEUTLwEyZuB+1bNztn
	8mmy+Y6roUl9TW6MYOUjCqCf3JDq6k2HYbzfQ7a3tRRIkQtIddYQN5PvfAJ4+Hrk054=
X-Received: by 2002:a05:7300:7f01:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3768076e52bmr4229530eec.0.1794397856119;
        Wed, 11 Nov 2026 03:50:56 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm17427609eec.21.2026.11.11.03.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:50:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 3/3] docs: zsmalloc: describe statistics with
 CONFIG_DEBUG_FS
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <avQJ5NG99xSRhAwV@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
 <avQJ5NG99xSRhAwV@google.com>
Date: Wed, 11 Nov 2026 19:50:51 +0800
Message-Id: <179439785114.2142163.1777880997906503143.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-11 15:25 +0900, Sergey Senozhatsky wrote:
> On (26/11/09 20:59), Xueyuan Chen wrote:
> > -通过CONFIG_ZSMALLOC_STAT，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
> > +通过CONFIG_DEBUG_FS，我们可以通过 ``/sys/kernel/debug/zsmalloc/<user name>``
> >  看到zsmalloc内部信息。下面是一个统计输出的例子。::
> 
> Just out of curiosity, what does <user name> mean?  The stats are at
> /sys/kernel/debug/zsmalloc/zramN/classes, where N is zram device number.
> 
> 
I guess "user" refers to a zsmalloc user, like zram.
But yeah, <pool-name> is clearer. I'll fix it in v3.


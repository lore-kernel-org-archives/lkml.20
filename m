Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460030;
	b=Nu10FexWPMC++3RuFroLw2fi5KwU30oQh6EYXS4QRKv8KO5zObOnRYcqtcDcGDDqhsUl
	 0K3alncn6XQU24VHC4wVqlPKn8Xvt6E0OkmqXBRKTFZtaQEIUclUA08EvTEIJpKobatX1
	 /IOz1ayWO+y5QT89XhuDcvKxroRUXXVbK8QDoJQx97Y+kuu68n+3sDEkocpjsbXzAZAvF
	 8z7uwGee8sfrpYhLE7wkcfp0KPl91LhT8lczfuc4RLK+4a0GMpk3sGKqKJGaEvEJDcWgv
	 5FdtFwB3tSmQwwDG4TVZ23AHggOJuDrLbART3+MIRx82hlLjt2/cPBLB8kVbXfSqzoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=;
	b=IyO+vB6Zn08xTuuH9LAdrAw1goaQAVQqM36cgbGBdekcqO0+uBIUPLri19bY3lbSs+9w
	 DexS4PNZT/0gDk8wV2QOdlKbnc1XtBvqhq3EW8pPcgO7Zztwb9EfqtgWwSv0KSzqDAsJH
	 g683zUHXVxQIBx1GbBJSChhjv7tj6S0XcdBAJ7W6Ms9Z0dDseuobQxoBWyMkc4JdpbKcu
	 QaZAP+tDzVOhFQ+rpIqrWkG1cpuh4mDyoViCDVuAYGVmVjJZrTTFvQ7jdP3/gBRYD3j2D
	 6djyhIxuj4i1uPpXE+y6UY/yLMWtnDfthyuN057Cp5E3vLxPM0wd0KnMvGunhM23ToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdYA2Nse;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GdYA2Nse
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so5061939c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460029; x=1793064829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=;
        b=GdYA2NsecA2pryT7aTG8nFth7vLhIeg1iPc8A+eufB/L9s2B7hSq5t8X8QTeJrIH2W
         Mcmu+Qt1Pf6B49l+uhl8xnw2FjXRqpIxzXtmQSvnsRXqKzy4sWt9tkXKY0uc77ZB17v+
         3OFRHfNAsLm+JHv18LvCtI00zcSt36854uJhbCsU5PVFflx0AqlQfkWByiMQBCk8NMCK
         e+8hNpVcpHM5E+i3kL8ESov9UuGtGjpUmRtCZsJh4tpWlHrKq/Iu+MysHnC4aE0nZX1I
         5Dgmsh+5yBNG4H0akmF4j/QWGmWIzVgTPVFmb6me3hOd5X0Y6Gzaz8GLxer3XssW9sl8
         osFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460029; x=1793064829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qjMCagPo43beTdZpO9fjGOooFBNKI+5JsBjceANaBQ=;
        b=26gA5dG8jlKdo89/QggxakqDzreJJO60tA+iIpMXxIED0/10IHznK0AZv042VSepW+
         ymzAU3akOYtCLZBh72b/r0xpIdVYVgq5G1JwBzDG+tixIK/+dpOQkvh8/0fyRSbGmqsb
         mGOftJUizIcTCzhaS3TUp58JB1pgrIJuvuL5jBUZiH3SMVrxYty+xk6zIco+H+ffO2se
         H/c851uuyU/RT43nMeNgDrGzQ3yOVsaQuyZO+sDEUno8Y1iQSO2fv5IslFbBpQU9QjVS
         c88MZigO6dgorNqRXShn47gWy+eOlQIgL0pZ/nq4DyVY//Jf8dVGtGNuZxYb8HgE0KpX
         8QNg==
X-Forwarded-Encrypted: i=1; AKwUvBzHCxe3/RXQ/txAvoYlKoLBjZD5o5z47gDqTE4TudgrhZ4vkbkdoiaBW75TldhYPhj95WBlRn8cE8zLoRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvDuKEuiblLW55PJfwJswAUvRshq4aohPJRfePovAUf3cWX01D
	wyYtRZjN8yq8YPM1piHej5nBrOXnlHthU8rUvAXfWRqd+ws4p/UyIo+7
X-Gm-Gg: AYBFou15sLaENCJtrMvy4TgMvL7znnfb9HjJkvbnOVYsjWBmqclIwHOhw+n+z/eOREI
	Zo7Z5jIuGHc3iP1C5kr/3NmzpS7g+DaFIHCHW8p6uVpcFsgviskn7HyjIgPJGpC+oV4aJZOBxwk
	09M79gVwcAuLLcCLewpUGQkol7wYF5TbJkLp2AXurBzi/nJrI+6qQMvXgwazgN6rEIe9Umx3c5M
	z1/2Xoy8lDJOwRJQI0leELLa+pK58rvolWeoAWusTg/jbwnFMCFHiGbROlxV7mLUIgKmWX0ZaAd
	3zweGI45eqfJgh/pzjEv5x0H4zX5Hbw4eg592dYwMlqL1i/2UjF8l/TgkrqGGGg3KOavzetM6ZF
	kOnm/qnaVocxR5Jno4j5UpLyevbhY3sjj9WpeCCpEbHdLfAaaIEMV4R6w1qkypRpxgncskQp9sf
	VssFurliAogXbwY1S2+YapuMSDgYl+PZlMKLX3vgyUG3nh10dzFgPw26F8BHRM1gfZ0C4ZExt9l
	ea4JB5mM1kl
X-Received: by 2002:a05:7023:d0b:b0:186:4a57:94e5 with SMTP id a92af1059eb24-1864a5796e5mr13543435c88.34.1792460028740;
        Mon, 19 Oct 2026 18:33:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm33881194c88.22.2026.10.19.18.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:33:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:33:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] watchdog: orion_wdt: load the pretimeout counter
 on Armada 370/XP start
Message-ID: <8f2bfa5c-0e53-4a84-b6bb-795c2c4e1475@roeck-us.net>
References: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
 <20261012-orion-wdt-suspend-v2-1-f13cf71443ba@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-orion-wdt-suspend-v2-1-f13cf71443ba@iav.lv>

On Mon, Oct 12, 2026 at 03:46:56AM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> armada370_start() enables TIMER1 for the pretimeout but, unlike
> armada375_start(), does not load its counter, so TIMER1 runs down from
> whatever value it holds and the pretimeout can fire early. Of the boards
> that use armada370_start(), only Armada XP and 98DX3236 describe the
> pretimeout interrupt in their device tree.
> 
> Load TIMER1 on start the same way armada375_start() does.
> 
> Fixes: 7a6b3d8a432d ("watchdog: orion_wdt: support pretimeout on Armada-XP")
> Link: https://sashiko.dev/#/patchset/20261012-orion-wdt-suspend-v1-1-1676cb79e29e@iav.lv?part=1
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676814;
	b=M7ZFQBpjPlw1bhewAqIiVHGLASPQURghQLnyMbySPgHGN+qtfIeygDYSGpT0z2nk6xft
	 6ahU2tR84hsFbnmNQjXfop07ym5cZhaJW6nOMgCZ1AZ6nRx0ZlBOIorvjV0t4dAJQ9FPB
	 6FI7znA9N4BbI4L9VOdIq+C1TCQ9aRS1mvuxSQezSjF6/lFOh56trWkoh9qWVv5cgbn0a
	 qQIG0xq6UZS5LtqMSXdotXRBzarTC1eB8Q1pJ+dl9xrHgUc5dasmicBynVgOsi7s0x5KT
	 2TN6SQu0dsDczGCa6GYi5pIZ02xh1C/6zRr1uolo6Dbm7KLYgL2lMVTZU5JlAIrYuFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=err8rpn8kCZEtoYWKx0gv030I55sgvzaIj1RMzAqnaw=;
	b=Awufs4h/Ws9Z3LXiuLwS3XTHAlBBCCoHTTk6doD1EqmmiLu/yJyKT2mgq8NATa7H1WE+
	 UincQovIoHyNcqSy+guP4Xum/XzgorkaLQm3T54wJaw/htvAQgPLapPxYobbnljDkwF09
	 wuCkypOuh9WFBb+gY+0lvsxD111cJ512bcVdasfE7qxfP3jAw8MFf0Vvlw0m29vbxqsZF
	 QvyWKkBN4QZvCJY9OylEtKd+mXqZAdLyjPSScNGqrTF5gVRGzv17SWZT4ogncbkoMpcSi
	 Pbb8MYY/9lQdrFJQelHoSUGjnvQFLvKlUlbGnbmDDdUonMQ7uSk9Z7NJ0cDC6bFODaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJ3Ix53j;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117DB606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJ3Ix53j
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a2551d7b5so330040eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793676813; x=1794281613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=err8rpn8kCZEtoYWKx0gv030I55sgvzaIj1RMzAqnaw=;
        b=yJ3Ix53jDYmW1MK8ahpwHeM/d04cT81C9ZZ3x67qAHIAoewqQOAsX6yIY8QNptm/EG
         WW268chWcQGTbuNrhXVI8p+LnTbRwrQ6Oa6fLzJx/E8e8PvDfrBktwmjgmT5WwO54YzY
         QKtUf34UEMH9WmMCEzwZnhJPubQj66XHctHCuMyz+V+0PTZgJjsDYcdLi++lDnLRfxsD
         ISRvqOlAUXX/OwUTpSCVu9lguTTTGimEWIuV+1cLdEFqFrU0zbsGIq8wdjC3Gu/pSXtR
         46jEdTMUB2QUXE7e/kMOY/DRQ+Lvy3cK+EAVWlkNKgq/ZaipUSqNHH7vwcPovoKqC65I
         +WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676813; x=1794281613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=err8rpn8kCZEtoYWKx0gv030I55sgvzaIj1RMzAqnaw=;
        b=NoW3STQMFzmP4Ql9WxFKwPwq+iaVkfmC4KeoOmhju32Rt5lfxOHZzK3mcXaU/WzYK1
         4NiJW0IYyk7EKch+FvwliYDpFg4TUF9V5kC7mzVK6H1jTi8Z9UzPU90i3PEN1eU70Wl6
         AZrxcOQyk1Re6z9LoZupcrFOePLlN4EiLbWKJAG3LV7tj1pixZd1swgViin2743j+6/Z
         E0yEGFuNBRD6772JkUWemUgY3lZ5diF6UwYbViIQMyPegY8Zq+9pfE+CQQA00QUz+3ew
         yKXA4Vi5XrzLnOUsccR436FuUNTrrmlyjH2GKF1kgo5fFympEnKwj7qBmEC+3ZC1Ip2j
         9HHg==
X-Forwarded-Encrypted: i=1; AKwUvBy47nKZKSL6eDKdvE8de/5VfHc2Q1Sm6sI+o77e+6kBQIs5p4+Pl64Tu+NlDDhymKMv67vG5mhafoNCfTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdVn/p+2VXfiaLaHPy3ftN/J+qcVyrxxtwt36QhRQltMaEtm+f
	pa0dbTC/XfJXTNBfeRvMXrC6+O6niNcJf5aQzoNd9u2J94FvV4EvY1rB
X-Gm-Gg: AYBFou1GtfEUgfR0mDIeSjYyi0+pY1MV89D1NJ0IlZzt8Lg9bA75eTANrO5TBJhShSu
	8CNu2S5a/7wtD/gRvMivNWXMJUC+JmlXcjUyS6HkVQ3MsZU2T4WU3/x69HRkKFpqiiviMdm1EsU
	fOCgBL6aBkJYuzBKok8hnQWL+Rrm9574eC9IVYq5cAKzAxKQKcDwJXkHOR0JunyCYIxvikCwW3U
	siRArN0EUv19s2SvGS4zGJKIDv9S+R9F1ysWnma11i7BFQKRXvQOcSY7SOX4Sj8iqzu4uXUJjiY
	qYxrXCW+3TGJJiJLoy1aCoKef5BqJYQAlme315iAjFwDVyhWWTO/XNewvTwp3AXMNyyjq32P9L4
	g+sDAQsCtG9wrzHltZRCbOOhRmbF5KgRQvCehBJtOgFPuaq6Z7wU6x7hCOaHstoqhmh2ga2ApfZ
	tFpbxYTKmMRv6JNDQO9wKpgZBtCu03h6AvHrVgt+o8p+YkknZ/d8w3Vv4NIcnDowuniqoi/qzsM
	WMYkHf5jKCofKLL5ajbHaPxVux0rlK+6HlhfgT0gjdY5Op7Fo2YYWhG3lwtdPX/rPLgYaowg4uK
	GPfEEIhA6i+l+f/RUUf8gDS2TExS48ArmgB8gFGZ/4AH0v7MTwXGqxjdiX8TrIftQdxU
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr19034522c88.24.1793676812990;
        Mon, 02 Nov 2026 19:33:32 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm50195547c88.6.2026.11.02.19.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:33:32 -0800 (PST)
Date: Mon, 2 Nov 2026 19:33:28 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] input: evdev: Always terminate SYN_DROPPED with
 SYN_REPORT
Message-ID: <aulT9-9OU5VE_PpL@google.com>
References: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
 <20261022-evdev_syndropped_fix-v1-1-b5400740e1f7@google.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022-evdev_syndropped_fix-v1-1-b5400740e1f7@google.com>

Hi Kornel,

On Thu, Oct 22, 2026 at 01:39:12PM +0000, Kornel Dulęba wrote:
> Per Documentation/input/event-codes.rst, on SYN_DROPPED:
> "Client should ignore all events up to and including next SYN_REPORT
> event and query the device (using EVIOCG* ioctls) to obtain its
> current state."
> 
> Currently, __evdev_queue_syn_dropped() queues a standalone SYN_DROPPED
> event without a terminating SYN_REPORT. This causes two issues:
> 
> 1. The queued SYN_DROPPED event remains unreadable until the next
>    hardware event frame arrives and finishes with SYN_REPORT.
> 2. When the next hardware event frame arrives, SYN_DROPPED is prepended
>    to it in the same packet. Compliant userspace clients then discard
>    the entire hardware event frame up to its SYN_REPORT.
> 
> This was discovered on an Android system with a gpio-keys backed device:
> 1. gpio_keys_open() reports the initial state on open().
> 2. Android follows open() with EVIOCSCLOCKID.
> 3. This creates an unterminated SYN_DROPPED, causing the subsequent
>    event to be discarded by userspace.
> 
> Fix this by appending SYN_REPORT after SYN_DROPPED in
> __evdev_queue_syn_dropped() and updating client->packet_head
> accordingly.

I do not think that injecting synthetic SYN_REPORT is a good idea: we do
not know at what point the clock change will arrive, it may arrive in a
middle of transmitting a packet, and if we discard only half of such
packet it will result in incomplete state being presented as complete
one.

Compliant userspace should not only discard events until the next
SYN_REPORT, but also query state via EVIOCG* to reconstruct full
picture. Is it not happening?

Thanks.

-- 
Dmitry

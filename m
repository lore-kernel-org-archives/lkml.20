Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904682;
	b=i4/U2t2/QRaUX69vxJ16yjdIzo0Bd5NxvAWvMAunVHoxconW3akn9YZwy+Yo8nrXtP6X
	 1ighbhb5GVei61702K/pYDNZFt5gdBv+yRF5gdzoWbydMTIuv1iLNjO3BCMzloY+XYVkn
	 VyQlxMVGrXOxJv6wQFUp9D6lflr2/PiKwg2JUjM4lviac1BfDOJhGj2fdsdhvGZ4gFyBT
	 QCv1BfCpMUumg3WLmsnitE5T89L2H89xdJQaX3ONIhwlM2uI6drTlRpXeQBhbyoX4xvMW
	 OIfhFSvf5m2D7IborU0WQo76BLfJHIywqVsAyjK3BZIeNaFiaRP07b36PAGtAt1dCbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
	b=dt65HaRPLcQ27linBUoVf77rtrFWuD/3Zhvlyz4niZhhSzm462peCkIUH1OEXoG56W8Q
	 l0lx8UarJgiRwLB0D+HWzh46zPqdOZVO+ecpeqENr5hUgoNOuYSESmXweWQXjmNMvmRwq
	 A9zh7SyAQuVVwj7BXOaLEIT8KzRWwh+CrRXS4Ce161NnqY7xvuX50jQoMIhpBdknx0w2g
	 ocMCkuUyZNc14UpEk59Hn8caF7XiwztcscDz9eWK+3KTH+yIxLjy/EbXeHSLn+QtJFoZd
	 PbliazCa9BYkqlOMVpZASVF7PtUedSNQhTlMXitHoAFOxabaGM/Q3ehyTqzLE7lXaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X8eqe9u/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C1606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124C1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8eqe9u/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21004255e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904680; x=1794509480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=X8eqe9u/Aq1FrN4sMxD/pefIzG+YXzeOqvrZ8COqfqapO8Q/M1H0Sj1aD0TqhpMLI2
         AmrBQacAjif6fdKpEU+BLEmLC+oewe604mdifwCPdOv8erlIeU5oNwnF3Iy9LL7J8sxq
         PlQgueiT1Olwo5efl/bu6lKuYT85HXTali5gc9szgbGNdqyUrkeDjRdP7E95sVtqCTQI
         VhOsWyufCye5KbdgYYFgpgWSlNKXELlW5y+xgS+Jikcq8fro9a4x/lZSZch5LBeP9NQn
         Jg1xlrjJKhFDmxd+OR1rys5baX34Jvcf5xBAagOLSWMOBBAGXDlgEIq9UvZKeNhb4woY
         BURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904680; x=1794509480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jnWVUTUnlmsJEpFB8nhtjDbr8Y+ZTWe/nqHnts4RQXs=;
        b=W1Po6JNerkGJU61G2boQwQIdvj0huuY3hEVWbM5aXHKw3Z2hcMnbsm5XKLGir89mRZ
         q9hlp5bzoxmBBXWT5Z8CDTU1QNojT7dZKZJeK2dDczpEXIpzfQrGAxNiHOEVEHrla79C
         aYYi/ixZqhtF6dICmds2t92D1i+1D05vPDwU6xpchhbn7Xcefi2og2lkXlRaWf0GWx1H
         dZCdLcUmVX5TitGJr5He02BR9F4raLtCZHcTJvHVnYqPp6+SD6vutXNL2pqg4rvOXxxv
         uOwbJ86hOZXm7upEIhpQqunWovwH24FKCd58nPAwRg2sUOGII/aLrLFzua22e/Yqv1cQ
         W2zw==
X-Forwarded-Encrypted: i=1; AKwUvBxDuaYpxDU3+IDFLA5CFDrrezqP9y2sT8x3/eGZjalCwPXQ90cbRDYji8X/9LscXc1IlccHUneNV7LuLKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EZJM6CxWrn47H3ePvO908RXoaRd1WPKz2vARwmvs7BQ2twgKB
	RBBYrzl5Ci02Dg762PguSzDypmBpC6/bhJj41w897HfHwY718cpSUYyA
X-Gm-Gg: AYBFou0oyimcKh01O7OmVALVmkotyYfpTkc+b0aY8QPeDl12x53hgF8rqLCrtFd5Y5i
	/kMxcpgXU2Aca71WAGaFTGvmfFAnESPecvli7GKic6gaAWPjYR+Fxwt4F1smY9O9xRlY2uN29vx
	yd+Vf5tKt/mEOvBnhJHn8CvQLZyMfi3XFegr0PD30pt/+YJ3oMTiXkndYY6O/AQj8byvipkApax
	3A0BwkMPxGpLnskhVkrPuaV4yvlzdJdk2CL6nT2t1O00vciKwDX+oiYKFagwY5Jam5ZbohMICh5
	PgF69ofZuqckKbgtBzrvULphAWX4f73zwakbq0msFUbWR68tPl3W4yN7JkhtnVko71E/Uqa3Ybe
	OJ/OXW5qC534xoyewNOjTr7iJAuwqr5TTuzNJ9wmBAbmfXKk4+wKxAyx0s5qldiOtDpG6I9n9Hh
	JC7urDkdkLVsw5QynW3NrO35HqfGwl/8FFW8IblLKRVpZyRQJjgdQmBRVdVwEJN59KxXCHqHD+3
	aMXtbDMw0F0/k+g+N16BHyIoP1kqnVJ9s+BADhN7IWCBDBkVICfMvA+PtVMK4IasDbl2crQeDLJ
	XfhCdv4h3yTIbbe/D2kdB/zyt3bP+ossySLiZTxyIm05TzP/zRQ6NERqUE5kBpWu1jBzIMtdNAG
	M6ju2zo08YjXs6m0Qt/9GjIutKAWSHSnrpJ0Kdfg2QdEfl9RhGujL8rEsJLaCzfPNzxDJFVl82B
	JLNZNp4Cgenprb9phwGuSqL1ddUTyQ4NKtnTyH++FN+JtClqnorvijRL/iw7sLCii4NwVsMPCOf
	ro=
X-Received: by 2002:a05:600c:46c8:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4b6dd82aa22mr395975e9.7.1793904680202;
        Thu, 05 Nov 2026 10:51:20 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-88bf-3a8a-f542-868c.ipv6.o2.cz. [2a00:1028:8388:a84e:88bf:3a8a:f542:868c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae72dsm137150875e9.3.2026.11.05.10.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 10:51:19 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	=?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: turris-1x: Add support for CZ.NIC Turris 1.x LEDs
Date: Thu,  5 Nov 2026 19:51:17 +0100
Message-ID: <20261105185117.83189-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104150229.GA1650678@google.com>
References: <20261104150229.GA1650678@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee,

Thanks. v5 incorporates your style and driver name changes,
dev_ext_attribute, and the layout of brightness_set(). It also drops
led->on and the fixup. All includes are used, and string.h is new.

The global brightness files stay. Generic brightness is per LED, while
this is a single CPLD dimmer for the whole panel, similar to
device/brightness on Omnia. The level files expose the eight steps of
its button.

The reset flag also stays. The LED core reads LED_RETAIN_AT_SHUTDOWN
only during unregister and calls led_classdev_suspend() only on PM
suspend. At reboot, software triggers therefore keep writing after
.shutdown. Unregistering the LEDs in .shutdown, as leds-sun50i-a100
does, would also work. Let me know if you prefer that approach.

The devm ordering stays as well. A failed probe unwinds like an unbind,
with the LEDs released before the reset.

v5 also preserves a dim level set before activating the hardware
trigger, including across a colour change underneath it. This follows
the behaviour of leds-turris-omnia, which I used as the implementation
pattern.

Finally, scripts/checkpatch.pl reports only the 75-character warning
from your list on the mails I sent. It is on a URL line in the cover
letter.

Josef

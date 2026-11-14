Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631816;
	b=rN7BR52yeBPtGc0LkRvWtgHtvZV90lXwBV0jfKHus/qkx7a3bwMxp8QYythL5bC+lJI9
	 eVWVsflPXk2GOFOY1N1c4J2xrLKDk9P1ZagkarAKphUONPAGKvox6A0huVj7QT2NsGU0K
	 2bWstsPFG4mDKApjYZwqx0Hu5oZlewlIA64fuf5IS81CxVW2CAGAd4jl4GtwPH+OFVHtD
	 YdARwL2s3RadcrxVJecgNGSwKVCZfxHAtVXWF9k0kqEKjfHig8XIMZXxun/VUXXGhU1xa
	 egnMtBhMlOrYIsCLpthuHU7eYeXlRcGsNmn3eJtjn5puKO/+BXpdFLzQUnJGV9biGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
	b=WTpqHAifCpCBXXX/7sVOKRZ8YMQ51RUFz+st6oWyxjT1ZkJz5ZLsJBjHmgYFBwDvGr61
	 AASdMe06xbnfHTeB0LcxNyLWDrxCYJ93zLfC6jRIf6sFczpNen5hfbGGc7/gzeZwcvXS7
	 WYO3V0QxlxtfEEas1Z4OZmIdtPuzwGvkJTziWhE9Swkg6g4koTeFrN0TCmkWYkNt+xdvd
	 7dmfcxx34Go+HXYrPgqIb5q4ihrqSLpRtf+0x1BOU4cSW/e6xWoHNFYOfTDVXMGKHXvmt
	 91mo8ea7tHrJjSHeSqO1Ulg4mEzKhDKCyQKDA+v8GEUbneabRnwJ2j+i06kZ46s4cGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJA5flw;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E1606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3E1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhJA5flw
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso228185a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631815; x=1795236615; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=QhJA5flw6cCTtX9NhMlG1Eb32t+ik26cbBVAaxJodNTFCkZT7J/Tg0Z7SOoMQaedJG
         2ZARPnvlpNHy1XAsP4JPFn1klkiCuUsqoX9lDHyQq+3RuEFpSrKDxUUG4krJAHmyuoAZ
         NZeI3CcBGZan5v3EWrMD7Xv+A0j/RF+VRHXjya4oJStZ0jhZ+IBAMwiLc4htrArrUqhe
         dX71Ul7F+czmg4uSGzHI6n760N1feBpr7/37uj6tVx/Pz51IP2EmHxIUonpw6N85H/YN
         3c4bAoqqUzlYiF6qBHIiVckPqBp0qleALKtOEQn7aEoAxKIUs6a2wPff1LydYu7xbL+A
         CkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631815; x=1795236615;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=Eau6VQvrPjRdAN0ch0TiMHGO1TA5EKHTaGMMZlQOApnhQUf6zV+W7n+S2Qqwf1fC22
         GuSFANp8tMq48tZ7ZKhq+R8xcc7Pyn0vFTHlXSztli/+mtWr9Epc0IRMiIbAU0Q2znMu
         2WdUjG28NkwT1FG6u50scxHaDAdjiNPDwjGdAUbzyqjZMzaNc+gNTyMhjJloADUsVSky
         jhhJEIUvJc3jbu8hjD2MHcUJNZJcsCpmi/yw4VLtRL882RcmECuWHPw/Zn+zDUgLd+ef
         wOMNZs+7iKSHuZqE7qZwJg3IPkkrt/yFOXNVYomL4BPQqxk8CjnNTFVblwgKgUI6HRXj
         V4Mw==
X-Forwarded-Encrypted: i=1; AL+hErFsMhBkkH3RxTfYQT4JmO5QJOSBQodqI4+w7lZgKLWv+Zcfx/vqLBhnXFpEWB0qjeIx4WOL2d2as7QsQ+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kYYQnwTJn2G8od7mJn36BJcJIUZSzwLbzR5M1Pwc5xrsirzME
	8Y3k3b39bRZ8AuwuLZ1j6GA75/bdQqvMNkvDn1+GN3VZONxDJs+X8ia5
X-Gm-Gg: AYBFou3Znu2sL+wkjHvXv7Yl5xJJmjCeYgwhgJNG+b8zXYkTX/P04osVWtn2Q0k9J62
	P3fP1Zas+Tiw1hsUascpI7FGFgauBomasLmecJfg9ll4+PzSj9OxEKn5qeeGjl/LBRB4JltZ/eg
	A+la2XArw7EZAQSEYFL4iFESeNARgMUK5pX6bF9FuzVdD25lmp42G9kso1s+z5OQCo2CB8UsTUU
	Z0x8Wif7kuB+HyXliZjA7DzdVCam6I+ZPwMfHoAtFGLylwgQ6TcnwXUi7vr6qOgotKz6ZQlkJYe
	HfdlYRO15KbVvfYyDzugDD3jFvas5Tdspf7l48YMmSAmqCgWp0lLbG3J5iasSedM3IbojJE6DH/
	PvoU0aAd2+PnUzhTseEEoW/ylMaRwqWeyzrmULXghc+t+Oz2xRi035jDqjoFPM0tstwtsm9wCo4
	0B4L0PlYjPX8Vgv+olSmcxQ3FdQK0UbN4qVYy6pbSmn8sqSEcQNgi0aXgW1aafVrpcjGbgY6Xsv
	Kg2/XsiO2d/fnFwvjoKJN+vXyyp0ba9/lXUMropWesBUlNbj/VDx/AnBPoy/Lq+tpjE20QtgJU1
	wClNiCk0X+9mlW4jEgJAvyeA/3/m2KEU5FDyU6Ph7OnNYjyX40ZyG3muHq7A3DTAKwJlIX9JprM
	ij2ZPa+w=
X-Received: by 2002:a17:90b:3dc7:b0:3b0:9e2f:cfc5 with SMTP id 98e67ed59e1d1-3b1b0826e52mr8146982a91.1.1794631814909;
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.172866405609790742@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Detlev,

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, together with Sven's RGA multi-core v2 (whose
patch 7 already carries the export of your 3/5; your 4/5 needed a
small hand merge there). Decode-only, 4K HEVC streams in parallel:
1/2/4 streams 105/202/206 fps total (single core: 105/111/129).
4 parallel 4K HEVC and 2 parallel 4K H.264 streams are bit-exact
against FFmpeg's software decoder, and both cores take interrupts.
v4l2-compliance is unchanged, with no IOMMU faults or timeouts. Not
tested: 8K, long runs, runtime PM idle cycling, unbind under load.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun

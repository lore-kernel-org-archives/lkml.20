Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928405;
	b=rHOWmyfiOC8fqaqySu/am4UIO/8k2MG9/OMzSDVexCmPO1G6GU+5T0qKnHcJFZPlqTJt
	 bjwHWN+ehmW1oRQdN6IC7OZWDeI2DXIQVabnTRp/vLIReWsvQgJGvzhawWnesIBiazaTr
	 S/Y0xQPUQIEOFHGnSoeR4larAmYk11ljyMroRdZP4BT4q5YYCKT/o+72YhL+BGMHIenzO
	 Wozd0Ht/hjKZvdoIV/KRipbABnToFXRgdAR7bzsT+GJpzz4VAx7CxJMQpnq25zkK2TZbn
	 4I5Am9UJUVtytmzmm9m5YrYffwa/d26qZ6tZ0ARuiEXoajgoMxtejmX2R7CdsxlG5Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
	b=b5a7agMGDs0nFcLUpL+4rHlvf66Bqwfx9M5MCzhopplAafjHqrDQ6Qo64RikVk0Jdyov
	 zLJs2Qrmy+V8KVXQOtrjx8ouy0h38UzyMgs5n3VQHzXYDEQzcRAi86N4Lj1tRiE9gzCmW
	 0AOsOp83k5GQhn5UzOvMSi+M+aONjnbdMBQZ8DZQ04IW2PmNjgKCF4/ylrxQo7jbegpVR
	 6NLpj3UQo5gS8cQzp0iMQnyls2tLNurSpueGxw4mnB956/PImErkAlXqz9dGDAQYpqsXt
	 z/08ofD96uCtCckWWaIipOYqNnYk3ekgtbzyjhfGAW2Q8wu3YyGOYTpJC1wtHdgyGNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ez1x1tV;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B1606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762B1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ez1x1tV
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so45010345e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794928404; x=1795533204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
        b=0ez1x1tVETbVuKs6ZgS6iPGAnZoPBZ0m+F351/Nr7XCUBKEY9rmb0bxdjrJkVjIv7O
         4Bq6UA6HR/pik8uGM3gt5Te/RoB7+knum+XI9YOR/hkQbZ1alm4wIb+vxUtMJt2nBZ+v
         sXJdcBP1Zq+J/hZU2KIz3WhSIDNw57Hz3XhfTveA4DeCEKkF+Z7oLe5KgWAYDL+uYPqa
         kfx7AsRDAa9F2kPnPJ7m+S6XGsWO1YqV05tMZ3ue4NxDIUWbPtwmMMwqXCBqJ6NmHAS2
         QSe6H25gie3d7x1l0oyjuk3gstSyQXgk4b6EGfgBlFSENB37foBk05rBOGynIQWv71Ol
         n6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928404; x=1795533204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
        b=q4FwGrTWv14hAz9f9YqoFy3GzRaEYyDuksdEVT8u+i8HCL2aRJQsF0XNygRfV+kXeU
         6Duo2hVG7l0J8L8PFzFhZrLNjtuAZ9frMZ9dcSAE0Gs30hay49IQDXXdJ47E1qbEiEEN
         tMXa2YS5XlMEqNQIRZaes4SDPZGq2NREWYm/gPLSx2/QF1+espHypJa795KrGROA2D9C
         C2Ebtleh59BWvMfCWHUTCHBwJuu6lzEcNvyIoBczfdEszLD+sBt8rPMrGH97tP/PCCzk
         R/J3s91IAzqmkvM1FTvg/8CJ9F/QUwvv8/G/LGJt0y1Jrm5eCVZc7+BNRnJHkeNbrYMo
         fsmA==
X-Forwarded-Encrypted: i=1; AL+hErGUM5EeBq8gadKw6XrO70M/poFpwfe0dN518lOYEe5LUbXS2vNv7hBNkRQp97CjSspfCawhXL73/j3rzns=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k1jlTF0AxVxv8RQC10fiNnXARCs7UGalFXBs3Sy9Yh94JXKcz
	QUCvcswVNgyU4MCB2SAK6n+0U1ZT6dXYUQHSZkWIGBnSe3230X7yMNyj
X-Gm-Gg: AYBFou3str9z0n6BVt4S1IltGjBvkTmG7SDmagOb4ZeiE3Gf4fju6IaXk/4BT037QZi
	5yZ6YuL8nWvQHcgZPvNqY8YmM8Z0HTnnmC5mhSz6iWf105DC9lG/tMsGW49EqbU1U9U++KDMMxg
	YQteDLIuPinsebtLEKISoMxlGQn2ZzRBKz1tfT6hGFXxVl7K//KpRn5CVYaRAIDYQOUiWY4/1be
	fL+0Y805nvTFBhD1hMJcaSy7dTNeWdo6aivodVbEqB4yHLFkBCniPmhfImOsWjxfw2Uv9/sNvYX
	roEi5PsYrEO2j7rkpjHnAujhRDDfh7NnaB1YRRa3gam/i+N97U/qlHTU4Uu1kFDteltbKXg2TX2
	2UUEM0ykPGociRXsnQpx/SeR8q/b3qDTCpsgZgK88B/o2bejPPpl2v1JQR/CXHtTMe0t4mbYlGE
	eqHli7cptMwAyXv7vdM98IWV+5UK8k5rPu1xI1aOyb91ULM6Xx1E+op1WxyQmnj1ZEdKgU5CL/o
	C/nF0X2uR/2vEx6FhP22+Dw7YRCoZQufghylMx6DnhmSZvEJd0aFO7XYH9OT7P0ZOOTIzgem9Gw
	xY8RGGad/Y42pIRUHqxzJ5S8PsunC1aAUzc=
X-Received: by 2002:a05:600c:4f07:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb7b4d63f0mr23921525e9.3.1794928403587;
        Tue, 17 Nov 2026 07:13:23 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm146014255e9.0.2026.11.17.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:13:23 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Tue, 17 Nov 2026 16:13:22 +0100
Message-ID: <20261117151322.1801523-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <878q2rtvbk.fsf@toke.dk>
References: 
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

Hi Toke,

> I think doing a similar change in ath9k_htc would allow us to have the
> pre-check use the same function without this issue, *and* get rid of the
> setting of csa_vif without any locks protecting it, no?

Yes. With the check on the vif of the beacon slot, csa_vif and the
channel_switch_beacon callback can go. I'll send that as v2, and the
mac80211 order change as a separate patch.

Mehmet

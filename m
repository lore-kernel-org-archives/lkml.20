Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959228;
	b=BeB5aCWFd0MP1radCfJ4NU2XKpprerWmRW/lu9LxI9JmAIIZxxZlIaf+z53BT9eR7EHN
	 k5LwP2KArw2n6EJtmh0DcDxPqcV0DTxsEMwlFym0vvbFvOFR3y/2fBOIHvqAVtKRqhWDz
	 xedTepOBa6GKahTbBXMCWN5GtcVWDTfNoOTOCdj9MC4TEo4CGiXg9kEKK/hg4FBhw5SRa
	 YIdsZC0i9S//2PnyJcZHjlP2NYDF9oFdRI6G9bqA5qa8XcI1UjuCu5I47o558HL4rnHQq
	 8hPNKNYdvvzkR4EA+dbWvPQM2qhNopzUmKCSmPA5/WCGWRsLpD7bigYqcvZ3PBb4xPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
	b=NsoDBJ4JgXK9EHxjG9AbCVvoXN4QIWwTfm8ll/fC+P3fUDAlH33jdqEWAesM/2qEdd4o
	 optfFok1R4WCHGQKG5ZrYeTACmXZoytGrxGU8tbBBLj4LEAGVHSTXAtDRuppMtqzPBjxY
	 NgdDA2tUtLwwVNjJyKh8o3xCQL1mwvzrisby5df1AJoBMYhFd202oCLtb/e0t5xtLFnyp
	 C+oe5GGGIWV5YXdj4+IEvV42mIW9MNgb9CznqXiYAb1SS7QoHN+luZ2CPpmm4DaUBgiK2
	 SSE4G6FRAAZ2yrkVPfygERKDWz02qN88YH3f8Txy7afr7nNLJ3B5eNUESCTC9v8drGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A3606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37A3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOeFNwHa
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4564955e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793959226; x=1794564026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=jOeFNwHao332HVD3QfiQaM5lk7vcAcuQZLCaMifPIknjCvH/ze3hFfWuBV4EoN7tMk
         wEoP/XwX4ULThqV1kMKSVTIyKos0MpEI9/DM853jGT8B7QZDLkJWTiv12Wf4NYzsPLyQ
         FnrFI0FMPmbRz2Y6dHMQ2pFDb+paJuVVTRzZdrhHt00cALOA+uVDF4nOEtghJt+1Qp0d
         KQM1ioBMXXiJUeyCl3m2BusET9eM7dvmLWYgyAMoVFBNIyR7KRbY19rKvslC07zpMwdw
         z1BhkBlaqompvfLdAX95pJqHTOLThpCQ2uHrbpMh2aRtIrZxi50iL47D5iHIE2IriNRQ
         XfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959226; x=1794564026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCBgBKMY+oy3XViUBHf7wx1cUIY9nYtt/kQ1CMxL0X8=;
        b=ofpjP3UL7QBKk4508VOqw80p/2zIizJsFZ4MPf6etqtMInmwHlVwSqs3oAnmUSa8RH
         VGsBNsCzHxYxEqYJkZ4ARFK+FrMhwy2fM4xh6FHkSXiaYaXoF5a/WzxolAaqHtC0ZTu5
         hnQqyJC/KhR1+AmgAtSg330iaKapiErm2bRb5BavSCXiRCT+BARvyhDgBmXLPLGyj+lY
         1R7Q/jUOAzOhKrHD9ndEne5mvd1viT6ixq63zASeLTODwao3Qo6Hwe+TiG1worQJnxGr
         1mnqjPumIrqbWDumqgUkfUMByojkvJZbkuXAWDc9g9hNRv9VGnjADE4pOSHPChPBtXTJ
         NjNg==
X-Forwarded-Encrypted: i=1; AKwUvByN52nC6WDika9pFgNhm3X39A7dBQxs14eC86v1ADrOSjQso0hxZIa7Avb4LPX+tYscMct3oLzx8/Ta/rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GQG2RHlzRdyutu0DdDmLphKj29KAPnq4vRpqwZfziuEulqOUt
	hi3WVGcj6FThkBAq6MusraeyXzhZQU6P0dSZL6NgdaMb8yaxe9ZzbwqsceIi+sQ2P1Y=
X-Gm-Gg: AYBFou39de+lj0EEL2Ujy+gCM5ZB3vJQJBHi4uu7CtHapVFcmQvgGT6PGSa8ApcFo86
	+ZN/fWd4xQULHNh09eGae6QrFTcLOS/qkPLWQbxUuMj7/uLA3RudsWs4AlVOBRiSQFAqa16WJFJ
	2a6tBBs4uZ/lhO7tCng8giTn6Nayw067OJC9IemCqq49t2ZJpaTMV5c8wWSEOxrFfeOQSylcumo
	w89dsgBXYy4qMjFM6xrdGZ4WHz+5WUL7CWZAGPMABNiWi4jcpNBMdyLE8vbzlOuS4R73FMzszV9
	g9NC3DPxK4EjqgIR59lRX6rCjCbQF9sfEn6Fs2WprLUNeoP2wEPQMzizN3+jAq9+CC9DSqVP/T9
	LjFdyaobc3SLHpbUYIy1ftR8W5xw03YQI3d3qaOmLdLjuWTf2z30fFnrIVQLcjgt8M48qIxsMm6
	JB3p9NNi/SVH3vehI4CKwpnastTWAcIxeSd3uzmtQHbITBqwII/Z6KZPOTkJh/1kqJ1Tf+krmhk
	HgfxAsMY2XqzQPai2LLgzkVnx1ALeVxQAMR0vgdM1TRkI4wQ0ERSMv2i/ocfX4v+nCK94z2sXTq
	woE5GWs1JiW2jbrpdqME6IY2D+L4i+PZ+5HpGtcr3WkFKAL5uoividAtpe8OZJ/SPP/N9Q==
X-Received: by 2002:a05:600c:4f55:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4b6df5eac54mr35512905e9.22.1793959225655;
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm2824397f8f.20.2026.11.06.02.00.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:00:25 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 10:59:09 +0100
Message-ID: <20261106095909.67659-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
References: <20261105213210.87457-2-olivier@mgcrea.io> <49e69d9c-6cb1-453f-bbf5-e2202f97e4ef@kernel.org> <30B040B3-D371-443C-A66D-11EF89FC7C63@goldelico.com> <f74bf2cc-c459-4b9c-ad94-c60afcaed3cf@kernel.org> <05798D24-C5A7-41BD-8FDF-F7075F2F0D01@goldelico.com> <eeec310a-a271-4e56-8958-a03318f07e82@kernel.org>
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

Hi Krzysztof,

On 06/11/2026 09:23, Krzysztof Kozlowski wrote:
> On 06/11/2026 09:18, H. Nikolaus Schaller wrote:
>> So this tag should not simply be dropped but moved to the driver code.
> Yes, please. Thank you for testing, it is important and should be
> credited, just accordingly.

Right, my mistake, I carried it to both patches. Sorry about that.

Jonathan, could you drop Nikolaus's Tested-by from 1/2 when applying? It
stays on 2/2, which already has it. Or I can send a v6 with only that
change if you prefer,

Thanks,
Olivier

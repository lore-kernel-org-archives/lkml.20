Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596877;
	b=dlJxzTkuIwwV/j+7S3effQBhVqeIAPswivNc2aDL2B6RiYNcVRvKRSBEGG+oSjD3GjUs
	 QPOBujPv+h2H9rtfbfTRQyX7X2pHvjxeLz1l+Uox/GMpukbTBkSiCPSzs1MVUgykOIbuk
	 Kr5NIw8ApSV9IfWNh7xeJOSM4qWcqVWLBA/z3K/8e/W+ErOkEu5Ygu5kOwXJRASJhE+Nr
	 fGOxS/aLxhX7HDoU4/TY80fb09uDKqLKtHxNkbcVT/61XVsV9ConFb2IbzO9CO9yYBJIq
	 wPvHOuLJYrlL8raMhvToG5aC6h/Uu5tj5ladGNRTvxjLZqujL9QO9TIoEnqbFpl05tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
	b=g686DwdVsxdpFYKVEEtcGnEmdQFOkLCGmWF6aGiSbQabk9F0xv+rSZq01RPYd8v8QZ9c
	 jUmSBmB8u49sL5jJWuSt3zu08GdCHkdjk/RJGI05UMSmg+scfngZ5//h6AlDqI7HkmZ1C
	 fQsiUIrirp6ryA1+8Ypku8zfhXqM8TBWwgFSotmDZr4ouEA+50NOzy9kEHSRBymyaWrof
	 vNjLPpAb+Kb/Uhy8Jdz50YWOd2sgcKDXatwUHW86IoMJTVTMQShtC5pxxc3j+FNapAbgA
	 0+czjFm7otiUpzdVPV9mcValSa+Fy68xKDrSByJjFxjARrKh+QMKwHhPu0NODalW8MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A060A3806
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4A060A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwGcGaPh
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d30639709so246618766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596876; x=1795201676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=uwGcGaPh+BHfex7icC71WkfRYapSs0f9axsnDYJawncCBYbSymIONXbbByTOPA4Mxq
         +CThUvi39AO8kULxSYQr/f+xw1u6F1k09nzML4VhxmzWUWhRKrEMjgv2KeZZ3eAFw3EN
         g7LeZJ3AcCY9gsAwwTotWDvhn77KU5DIk0XZo5qBTBt4xvbvhUhhurEHQNLnQmTuKPSo
         g3wdA9Q4hQLuYGgtlW6F0M768H8c74wm6DdYrw8qOGQklh1OVG/IizczWWSUvUDEXMee
         U7hP5vy0RVUrnqMXRViuaOTkZmH1czb4EuZQoMFrl6qOh/lYG6qVAfp8IGf+Pu3RD8jw
         gxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596876; x=1795201676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6YWRmQiNd60ef4bLmQcLELuCtQOypOA2hMcEuSo1Oo=;
        b=LnkjDeJZ2ePs2fjHHIhdGE8sE5xCCJjHAYTttpLiI1TiHlpzpmOUKwDsTLY8cRBK9j
         4vm/wTFbDULXdhUYr/C+Ix56bpjVsdtdbPtQ2BfkVG9oI3HM4EcnYSSdNkl/MtX0NSe7
         KGa7KRJawAeGvK7/zyL1tfu9ri1B6aitTPGPJQARbh6y4u4SkiAwKZMX94igZSy5sqnS
         PmTS+lnbUt16Pp+ThBYbuv4NG67SFH8rpwlI/LTgPM4lUvak/+k1Rfi2TEgmjZxaBDSr
         V7CRJegCdcQoK6fLskFkJQvskvsNJX2k9l+0YbxRLA/rjFnJK99r6K9W3mPBhEj7x5sw
         PnqQ==
X-Forwarded-Encrypted: i=1; AL+hErEEB7QpoSx9/ycryHMpgjn1kDGf+A1QFuKw9LHbJSJE6gtmcDumTPONxLnqsOYOHFjqlU9xVdv5xh12ij4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VpNZVH0nz9twtLkOf4qN1KSZKDdvrvPHYXoNE2zI7rJvdafiC
	tUo3gJN8AlucBRhlVvLifSX7DJRAyFYlzuZRHnthE0SnH/3jYsplmvae
X-Gm-Gg: AYBFou2j9s47hj9HAGBmTmYtZCdAMKGlPtbXNHYqf9iuFRUbv1LqB5QR77STGl1cV5G
	50JvZuFDVfrOokNGyXAvmhvh310B5Kr2C+IzmnYL72aTCj8byOE78WHGcYCsJjdpOynNOeeokUX
	uSvHSFEx1dwV7og98zziuzjvS+1S0zgA9VRqu3obh2d3LZSMTfxqIk1gyJEVZgL3DhqZDKQNn5H
	b4FtQlEUwBJ+hY+u3B1O60SXs/mob1dlrZx0aDFMzmai0ZJtdMAIqM9ENQpNJFZtkMjFOxdqyA8
	or5A6A/CvB8d6w2sO10kulJnmxEKsGw4ffNUE7TpP7bEf0sEF8Db+3JPSExx71SkN7sLDDWvc6D
	ohXP6q1oJ57Sa291FiPkn/2cvRf3aKcYDynjlWDnWQ9j3WvGlw8khyV4+dwNYAi6OwVyC1K+kgi
	gQEt6aD+NunU3zv04dM459pW/+ylwtLlyQBKVbzJFMRHb057NS08NAQmK5y6HilRnjAWxpUamNA
	DzHfdKQLAXyGFdGeDHOpvu7un1EVL5vOc0pWe74VdyVRMxPlbHOo2816awsDM8v22l3740ZccF2
	O7trq0wH6bidcBY9TbdhnShwht0MxHLI22uB2vV4FxuDJxE/qs+PdkfhNFLciXO3
X-Received: by 2002:a17:906:4fc5:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c509643c050mr336353966b.32.1794596875807;
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:55 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:01 +0300
Subject: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0


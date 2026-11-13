Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596872;
	b=lAcJB/29qZvCe+EnqB2u1O78de3UThQG8dIUvC18+fkywKyOrATPvdp3E4Sr21x15W6T
	 485ZKIFE/erpSbv6FOVzjrf3jV+qa3CR00EAqEFX59KDYrQwyKGlGJvzYJjSo/4A2uqBF
	 zG77xj7hf3rvLNXJl4e93ZJ3xRJT318gqMcsqzXlqbtQixusbUqX0oarGp0VBRPLVrnxm
	 HoJmr6u1k2RjkGQ9qisc9eAxUlJrni87/mFn6I5V6B5LlMjY41+sk6vd5HfyDZMZllis2
	 ac36/wdqBZGYYPa13hKfOSWzao6IURCE97iFBb3EptghZPL6b2CUTEm0dLEHkiS3QuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
	b=ErOsHCYRFn5QQFdAK2N/ycQNuQZo8MGHog0d+VliuYPbvE3nMivHWrqcKidvNpcitJ11
	 z3rCnhS7YTmvzN6wNwpEkeMh2qMj2stiAa8QNi8jEeGZOCqK1UW+ncj6lnSnLHiD80YY2
	 llWo5bdhy0tsnxVgfaZ3g1zcy/EogZ94EGm14CCLepvJqOrsjAwXllMXZFPVszVZyrWZF
	 N8wb+mXz73ux4pH4ZMM4fiNEYq1Kk0JaLXf0+nfn3JzqK0po+MTyPE7vNqoI1MmD3kRT2
	 I6d9LOzqPkjEXQfALgrVSZ36vZhFfe60o4WbhgsSMGiLde+e0pOVkNb4ADYqwHOTDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653660A2618
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D653660A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HePccj35
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d21051042so291222666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596870; x=1795201670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=HePccj35FvhTjvXwtdVBJgEGNVeh2KrOUDPZqigubVdBbr/KLsuRN5y64YNXHBWId4
         m5z0PK1xgJg2mvVjc5PNTWLFyq96goUIFhvhIPhZLDaMHVwkfH1EPNEemnp6vzvRPKLg
         Yuy1HRPofIJAEzZc6kSFJD1IKjUzSort9TdQEdO9ff62aiFdDCjMk7tpoNy2qzHJ8s96
         YMdgBD2K4ZYcf0zITt9tCnTJE3UbVZJCXEo3J7dmh0cYnycfUhsDbPWzieA+Tru3tD+O
         CE6bH2un439G7EPfZMZmwydwevOgw046xvR0kNIjHzWfD+tp7t1hWAKcpujb0Shia4NI
         mV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596870; x=1795201670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=498bVPav8qEVV2GYaYtJAWa131hP7OjDlibTUA65Q0o=;
        b=w7vg31C5aQYEjRC+Fd7bXcU18knEohX00aeX9Xe49St5PUXdh02Kvxh1H9zEHUj+GD
         9tK1YyJtvuCz1T0cA9iTr8c6LRAWZyhF7gIRFm+J77x0DePL6bk8yi9aiRYU/sKYtm/w
         OCO1gxzrZk5j9OoCZsquouMrB3zmFAIJa9qwMCpAeyvt6o4hgMsq+tWcqnvRccCrLEPt
         nztzqM5NSgQmsGHZNwEijMyBb0a2mvx4iiq9oF/hJWylgkKe/7bZRSE5SZlT/bxsHYvc
         04NkHF/L69IdNKZGvqQpBkBEIY5NzmTDtrQj/RhFcxlxC6OyY3M6L4yHX4kmQAcG1G3i
         9jcg==
X-Forwarded-Encrypted: i=1; AL+hErHvt/mFjwHaZ9eyTuCnkywARBWT56C/10v8k2SPye15uvHYmVG1Khm01mC6DmBZMUGlo4bmUKkQfAmH15w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRdzFm+jbwneEnErQrhQ4vjhjEz6F0sTBJbfMsl2EniL/ltHd
	h0yPcwfH+tO6yQ/X8yAQRwwvaAo7eS2QT+PG65ya/1RgZPjDgis/9w2F
X-Gm-Gg: AYBFou0yEZNZsIYi+gppJZqdSXEy2eoHT4wGVH7MGQSE/WACkQ8sUZCXPiWJo8OL27F
	BROiaJ8nEE8KxMd9Qn9tO56J0HwUJmXvD1wLEJMtZLHQd8vYEDrKH573RYa8Bwv0Tzf3sDQ59Ml
	aArlwdw4wWRvUAqBSEmX/7RncpJNbKKtipz5lC/VSUanb4FwqmeLQFiiCB75zdwbjbREy7/lGm8
	5RoFA6hyyXT88en7WBMMIS1OibT1b33BOgXO3VT4khYCj//Yw7JZxQzgBlqa0+SiSixJRpnKk60
	2h8B98zvcI/z4dKFC7ZR5NGskW4QiAG6Epc9HfWoVdChGP+DyiFP0PbhHIr0CnF4jDBw6CdjDuP
	Axza+yswpr6ukKutZ7LI1J8XQXG3UCnEUK7d17LjOPSTOCTVvejHlRkxV160yCzvg+/qr3a9bKw
	EHY6y5kY2g13ICU8Psubye4cbIinOZK99+/cNeQNWjrhw/Ips3oTz5KvxGRGYYhEUh0hvBHfPKA
	zIta9XtVZ3mCrnfBvwF7UacySBWM31LhXv/wmRnvirEcAc4GOwXiu7v3P/2lMF/s0sr5h7VtXVO
	u3M/LIG9JpxdEuBSJ5FwNh6CBm3aEs5LrDF4B+wb7JRh3jjSHuthxBfVL5gsXfUD
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr389984566b.24.1794596870123;
        Fri, 13 Nov 2026 11:07:50 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:49 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:59 +0300
Subject: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
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
Message-Id: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
known yet.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8e8991ac95ea..d0a73b9c81d6 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6895-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
           - mediatek,mt8163-wdt

-- 
2.56.0


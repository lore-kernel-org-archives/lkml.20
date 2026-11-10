Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340371;
	b=Xevp2IZy/qu8ozt7tDYof5e/3wKsQeYl5OAYEnvPea86xwyVjXTEfQjOhRv3V9Qxe/CG
	 +58gahViNtOvA6wXcgbAg2EhATtJsgdP97VefhTDMi9EQfiUWauubnTiH/LeZpt343qfm
	 2DAHuF5iJJHjnJFPZsT3TK9Fn0tj/IeidyQQmRr8FRBPpg4Vbrgqzp6oOTODydDwVkjit
	 CrCvaUT5axwzH7t3gmw1QrldJyAsNiSTOu/kENwhyhYldNAis4girVpw3cCzJp3ZSGaUx
	 Lwnd4bwvN/BX+SvXijCIC1Qsq0cj2+nuy2F/2CsWML7xW49PLeCEAoEaRZN1N7fbIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
	b=Ikmu3nDhU9DpW5qx0Sp3BJjTtvoMRGM1CPztBmIdznTenHbE/P2zgHwg2XfBiji5M4yL
	 ZyXGR0GDzWrOlvhEVzI0spve8jFNppi22OmMpGGwHxU9oj0/+cypukjx50EE2sQQK+yIe
	 ZyMJDxHDztS196UaDrl5WzM96w2FtSomYtA2tuackqteNKxN8H68JJgGX54sMbkLYwdkC
	 yD7gld8u1DfqcRpAfn6oqOhMWuA7QY87UZqS0uiI0N9DpL20fq5ihxSfXKPsEcb2NPXUb
	 nIbRp4WVtlL5IWCKavTzx9ajaE+MoBVtU+yWtik2vt9iqbxdc1lRM0VuEptQWytb8yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUH0io+d;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8BE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8BE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUH0io+d
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36d1b3b9974so217241eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340369; x=1794945169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
        b=lUH0io+dIJkjL80OHBeuKDzqchC7AbmDLhSqgQ24PZTwwBvZVSDljr1Gk6w6sBlv+r
         z6E8eBSxdKpeSmSe4zz7QT2ba4CEHDv3Ew6q2+E5CW9BxmI8i28cGvkvFu2eSX0uEGiR
         K9bWyrgI/pnEFPGB+ziuvA4CEI3YGKfG6JhJRlXHRZ+hPNmaLMEmBHfEZqRlcw6gSM+R
         Ygiw7gYN9hg6VLk03KzzaB0HYc/PAliPad4kJNPBu5Sdjwyq1j68bTAcA20pnVD4gzFX
         0vHGphWMEw5Opw7ZrvS7q4DfabU5TDDyiiZ7jRbVo3PJE21w2gtn/EYfKg8okA8xdyUx
         zzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340369; x=1794945169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WV1W9nBfS3ldLXeMMEvma4A9q4C8mtYJggnjjv7e4es=;
        b=1BFOVg/H6t8+GSVtovPIBTfV6Y8lxagnU/1XoLcSSxKDTuWONGTKyq9IQikGuwf3dM
         pyzFl6t4fsHmjlkPkwlOjLL8wWFTO1tE/iBRHYEcF6sY3epIggmZol4+OxwFAqP/gz9G
         VKlLIcMFuY0IKue7wzrGq43iCQ/iQSjSyIG+hYwiwMq4jA0LqpUwxyfNuyji2GuS9KeY
         YBqKTrMi2PGRtoQ5YDQ9VnMBlRTZswjDYUl9xEDSRxT+zTYEiwDIRiyJKGD+yqKl+xac
         2YfvWE+RkaaPSlR9pantZNrAdz4U8ntc7/jky8C4yYLx4e3jcQDQbBjb4Mf5k7+ihx9q
         jJcg==
X-Forwarded-Encrypted: i=1; AL+hErFCeiYIob4CPhf19TLMqnVPw9b+BmihJCI9KDlnDqnQgDzjwAt4mpawpaMHlrWAXWSRKyu0KPgrv2xuw1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fh/9k7VBY3zjju4Sm9oMnZoEb4g2T8Dy0vyWArl9QoIRgJU4X
	S3yvMX+AvvoN63wYAAzdPTTY1IUa2UzfXH+qKILQ/d2RaS39x+V/Jy4p
X-Gm-Gg: AYBFou1Y7AxsU1vO3pCa+tcqUMbZq3ROknNNq8V0hqGgvmRBuOIA9DmsghD4viBrhPq
	iLgonVNBrKd0IG0xOsotv6cvOfJgu1ESyFDhp9wvCS9GLRBJvOTFPUVoQzvy6lU8+hOb6c3s+Er
	3QGoN7IIx1pqRNA8ue0CK/i0bTG58zO5WLr2EhKlEEoSNnlqhQsBoap8P1e39AlovNMlgpJw/rH
	opWHhM06Wus8z4TTOyKrZN4SOzWwBDs6ZqrmSfZZGSGtGI8b+4CdK6bxB8zEeRGsFV+iCow0ctv
	8Kd+UemhB9/+wP56WxqA/EOEnutXYiwKUFsdur1aA0qOBoppPcejBGfmwywrbdoYF82EAftLM3J
	A1tF5lav8DtFNasi8+H9Xz6yr3zuGBb5Q18Y/EUDudJNtnHj8DRlzfZR9Td2B3Eh4sGuL4ilqf+
	MoL5bm0HrLZH98zm0Ma9t8iXcNONsLfQBU5ni/GKvRX6Gq35UOFuwJffsv6S0BuX7rcmTd11qxZ
	HFafxEQFRfidNoCRi85I/3vaiZXGEFa6bIebCjG4MQrKKh04RX8fHgsXo4ePPdXuLT2wjnvgImo
	Euae6uQ6zfFLXWexOHAuRcMxb+jdIPhzrS0GgU4=
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr696317eec.0.1794340369276;
        Tue, 10 Nov 2026 11:52:49 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:48 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:31 +0530
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: add eets and newflow
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
Message-Id: <20261111-ti-omap-dts-fix-v1-1-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1238;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Rt1rSWZjPfM2baFw8ge3SHaMBlN/XHq/0c9xsidb0yE=;
 b=6v4DY+409b2gCifH+22DH92JVjmI9DIm2x/tQgiJPVFXbnbXc8PIVuxrQH2i0KtZqNevRwJMy
 65XBxJLpJ4hCQF/vGwm7t8wMI02uMT5+FGlnsBiPmI9wxIpm1dMZzff
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Add vendor prefixes for EETS GmbH ("eets") and Newflow Ltd ("newflow").
These prefixes are needed to document the compatibles for the in-tree
AM335x PDU001 and AM335x NanoBone boards.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..447f1424bf9c8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -505,6 +505,8 @@ patternProperties:
     description: Emtop Embedded Solutions
   "^eeti,.*":
     description: eGalax_eMPIA Technology Inc
+  "^eets,.*":
+    description: EETS GmbH
   "^efinix,.*":
     description: Efinix, Inc.
   "^egnite,.*":
@@ -1198,6 +1200,8 @@ patternProperties:
     description: Shenzhen Netxeon Technology CO., LTD
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
+  "^newflow,.*":
+    description: Newflow Ltd
   "^newhaven,.*":
     description: Newhaven Display International
   "^newvision,.*":

-- 
2.56.0


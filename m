Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597637;
	b=4RMDP24lpVCsJ/oaNsAP/5Y5yOWwg8T8hKo0FpOzZzoCRFmlAvxtUcJurPBqZZ7iuTin
	 2m7hN3ORh/owP1G6MVU8tTd+NeodJQ1K3pRd1y9i1IywAJUhORt18kHeK9//ktAmOsg69
	 h5RbfVKZR3o8v5fQd3ajJRyhcZXVz3iTPQLAS9DbvTFt+R8pHaTX0lh7c2v/Xsf9ukE7r
	 AjwAdieZpDyi0TRuxivDeAIoWL9+mSl7yWhdIlQTXXemstMB3yF+k3XDQ8lPECZ9hRKyB
	 Aq4dcSV++cf49I5Njg1uE9cxRo9KTFEUbIimqHLeekWkTX4P+mEstVfhRc3Oi27//zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
	b=JXJ+0pw8seGxMohHf8kJsjdOMijdWyjsmtqDOi8hVQq/WYrJOF2wSdjhwb1xiuIct5WO
	 XQknRUaG4LcpfSco0Kztz9+Bl7kgZKpBCvZBvoBOU+++GXX269QFD4Kz4deYhV1k8WWvb
	 euOzP//oDOfe8UR6MMQ6Q6Y2+MkHUkZDDs8tuyZBa0deNak+ZMB+t7kzvlqJmzPnTycyl
	 KzHg9N7RuyR/4ERg47fOvncZtBAn97fobhu/kna4stpQdKNkzLmtNXjxvfFQsBooaQn4R
	 6K8MS9L6fjQUA2qMKl5g18+e+ZZ/GknFVkxll2W7Ps1O5YF2zHucnH/MmvJ4+Q6g7FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuHaW0v;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F2606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3F2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuHaW0v
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-6de48228f20so298902eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597636; x=1794202436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=sAuHaW0vR6UMGmh9a3LoCfGHR5y2OPt9lNXxAGnagx7UZvkrXmXTFynCOsmmiHLGYq
         GYb9meKDxStFKyJb74iFcxP/aWQQCOg8G3LExXifnWFM3E/7n9VPHXqAtKYCY0i4RTSo
         22nw5djiSJ1MSjDKZG41Dk+Id1piCjeh5PFA135IQ6F6qTtWyzC3gwiU6q1Xoz3lSt5D
         v8ajt5atmPCUw4A+AbfXmQKrMDoTBEdGnXHwCuDXrWT5DHYtckAIPRnRJwyCIks/8rFA
         GC/p9TNJD92kO5t7NKQeiHniFUwdDXG8NsBaLsAGXPTejpHsGwwSDNZ5htqRqyQTNear
         R54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597636; x=1794202436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=sI5/5vdOsyiGpxIEmu6NLLViKOAv51p2rP856aRM0eqtrG+74mKNITqYgZ1MWwAzOi
         jCbu2vLEtmaFvGsqgzZQsZUlw7qgnQnOvwggkFBwOCjocyGTUtgEvsLl0/wii0noRwc+
         NEXABFe2Bo2Zamc+i1Hq+mcCzguPJ7QfSFQu6CrFr0ysDZkAE/D4Co9D3xu4lYkkpzYs
         n7WtiboEWaWJAlANEPjdeWO+v6tRMukLdy3YCU6iWNcVj93dRrtCty60upuseor7GEKy
         VmMfa2/syXeAN5OOucz5Xw8MpvkFv6OCro6jc/LNTqFCH2BRLWOqfU0sFQQOmK4GD+OJ
         tjtw==
X-Forwarded-Encrypted: i=1; AKwUvBx5ghr7IdbUokLYQr+AzWY3nvAQTwaCyu/RAWuvb36FW31LTIKIu/uU6GSmKi7AxXDBqXKMz6KDZORGtSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwbSZLXX/arrMnbfYw4YvvxgY9oAc0ia81JtDS5ePYUx8AyGzz
	cQ+XcS7NANQcsFrMFy1lJ+opjYmh19OwHkmkpV9DtFeGR3Rz8fNUIbaV
X-Gm-Gg: AYBFou0bJSxY5YqdWc4SQDoRyLx77O0E0OyAuHSUumNLsG533G8waTtBvMx8pWhvf9o
	an/ryW8FEKpviqeaOxHPXcXuy9VV0MO5NEJCD2XR6siIeevtlJSaQYpEuIDS6WWi8VVo/rq7Ey3
	gLyDfScrHmO6ceUcfY5FvS6jkRub0lgu0E6MNNtBV7S3NbstS7k8rBxOABGT9cVcElS6uWHzOQB
	0Kd7b3gWHS28oMtIO9WSqe/liVweViGWdwLG31n4Hsx5WvM8ypMApfe8OU+rLUsFbD3ODHSfPzW
	+l/poDAOZQGkwhlA0cSK8PoY6O5s2dMahvYk+JYYExjDBkyhPHBAhtOJtRYDmMpj/6vhbN/Hs5+
	3hX05SLpdHTXp+fD/7pUhTSxFO6DDItLFU+mK2VffiAQG4NLnFH3xO0Jcj3oC62TFBNtz4z5fCg
	vd5Y+bLzV11YBVRN+jt7dr5VuDx9lj6Z5RkbAuF9MFtnuG3uA0qk9CZlBeJV8CNMsnfaTQRAUR+
	y211ALauavsdAxJNVRGjJZSIhZ5KrFlCkV5jxcgz0WFqu5oXiQ2bt4VXA5zeJ0jAo/po0m3Hz2n
	f1VvcXCwJPbAHRNHQl79s9hX
X-Received: by 2002:a05:6820:1343:b0:70e:3e8e:efdf with SMTP id 006d021491bc7-714f2ae369bmr4807837eaf.89.1793597635764;
        Sun, 01 Nov 2026 21:33:55 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:54 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:46 -0600
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 32 kHz output
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
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=1164;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=GgCulyiRe8JqnSbuYJBNp+S895kQy071XDUKSDOt2BQ=;
 b=UE2preFnWrcfBUGQB9fs2ZLD6a5Iic6l7jXV2HPJqVzl40mf4eCBFIpiaxRBYwOVNNpkVcGzQ
 NP955JBBzvAD5zz3cEjRiUa5q86u2PzDOoj38Yx6ZzP9oKolUFV8h/8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638230;
	b=A9jhI5xPPbu7fO93K+Bz2j85NGraJLHAcMGPbW1nIS68UmdiC1kCwVFZswkFXpBz7ikz
	 +wgPlFmUdh/IunbvtmDA1/zY6zA5V4JdH0Gn4He6VPT+J6RE89FODNofxYyKx/f5TDblN
	 mZLv5c30yvFoyiWeL4VGp/PxdP65d6Wo9/Tgpj2PJ2St6xzJnq2sun3n26nthXhLFaN3y
	 c2mtA8thJJt4JoZT067ttugbcQvuhlUC8PWzdxCUuKNsL6m3P3Un8fZyDyMSvkgChV8Af
	 MVrNbKyVDkJdQdgv3f6aF0B/maLTGWKtX3yCdya4ZvtDLL4EcFtCLvpqenIZmObBvsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
	b=E8awdID005CnlLLFLEfI7y3Gs40C/TJkuerp30uU2gfFxW3R8sVA3ESJgVUSaPPkkitf
	 92e8D3YusJ7sUdr39QjAqlVLvby005w4bGdR9cY/Mu7Th7Y2YcPvgY4Dj33OSQic/zmYy
	 DFmWsaXa7dwRyFi2rz9sJY9VM5WoSwoGNLxeRaZ2jm86xIPuMwsxiGJBk7xsrMwxU1xUc
	 qzwx2Bu2BW6NwdiSXsukIeaHlF/pfsKhKKNfNUzO7Sya9f+5pKqnKNFN0991+WSUtnFIA
	 JW2Ni0R+y39ne+0B/toRCZXba8qXeWbS6htbmX296BmaxZOD1XxZ+5Wo2SwQ39OeF0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0v6Qu6l;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED06074647
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AED06074647
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0v6Qu6l
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so1367026a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638229; x=1794243029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=c0v6Qu6lGqB/NueLXwCJ0MbujVdcNa7sv9DyU6myuKFeILKR0PllAb1Sq8tx/QGgA+
         NfzxVnnoiyT5gmxc7CfnMxcRZR2u99gOm4l2mYFJFeqYNSQGiWexUrEDEz8OGEdkpXEq
         ZoKErvxvBrvSxkn7YsEsokpzcg+042WJRx5YAGJQrWn6bV+KvOgC4EVVfOPUiNUYc6Bn
         LukM0cKT66JMYkHQAqA9257BWRnPtp7rbFFfCjFLYmLDVNf/OvNV+iWIk1yUEbFUzQ6G
         DWK0oYFpNaRxMasT0Sevyqmmos593gnGO/7WPzOq44iH4+Mu/XlUFqRryRkhIdQ70iQo
         R1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638229; x=1794243029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=sEjyd/mMqcIxiHzgowMjEKF3mIoBXuHtEeb5AR+0Lt81NdTCojySZGPcm1BWPQorZS
         3906g9TyfBMW/ooHBBlca7m0QRrA2awDVpzLl4V3xFO3xnQ0xai3vKzJiOyDOTrQBynm
         mVCZ9ZxgM/+AyKW+TyC5NyfMNhO9vRBR3OMtw6YQmfde01IBgUPuZN4P/BzaO1wo/+8y
         9LlV0HYjISRHT1R1L4vH8PdBv0padNZLOJCjXInrL91R/dDLD1P8jpe8mBh1DDW/sjfh
         tiCaZsxl4tpbY0VjMglUX4vlxU1CTS/0zP76iziGLxT1lgjmvpF3nyhh1+E0GV6BdWCI
         JhUg==
X-Forwarded-Encrypted: i=1; AKwUvBxhD5Pz0kmtsdebMlc/94QOPO+FBgFHn5sXtZ0TjaW96Ya52Id54q9PUxuQiR3eXGSHCGMm6/RanJ0wTRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLusbzHzXB6QTvQ8AmRKvzvM0F8lj6VLzVF6SZZuJ65OE8PwEmj
	+pN8IV58O7xJ2qh5H+7CKDS/U2KcsF+kmuFLZE1IfsOC7NhIoY6NK4Lo
X-Gm-Gg: AYBFou2yUMP+KV/mefY8Q9Oe+IrZxLyNpx3KVV9f2bfNzbCexCV/fCCv4qYL72mlvgR
	C71RorlnkfVcbmNxg42c1MxaWiwjpRv6v1XqfomfNFdum8M/Ity4VZbL8q9uNk5WxZSBRpuosHP
	IZsZZpJQ3Vi8Q4EV1LN+UICFi5p7EzzgAzDuEneG0qgZdkyzNDOgEqVKN826pnAa27Afjl00gKE
	L0SPG0TmKi2S8FWi367CqSsvpLhUawbPjVm+1mmh9PQFo/+WqS9UN6+AUnyfWpD3J8kyRtAzeRZ
	9A/nDUZXL3mp9CkMVjhAgkYqyet1oj0Rn5mGPiSLQDXUgWjE3FisJPZYY4mCmro/3VTYq20Vlex
	9SJ1Vk0bOGoIFzxhjcR4Tw7TUDhSOab3xCYZY1odT+Yj1Ic0grjUqPv6Z2Hl2GtOxcrTMKcF5+4
	1LLChvSPEElVWqm3clbWnbcf52rlDA9FjcPUBKh36lxVbo+rdkg1LCgUBMdAQmox7J+BySKs3Ri
	pfAM8pj9f+L726LEDsP1b6iesye7z6/Wvs+2VJwvabSZJCWm/o+3Ep0HnehAVrti/myiv8/Gef8
	VI/j5rxao8Td30FNkDSCSMIF1jsQLYceSfU0IPuibzmcmQL3gxKkk/lK0QhAl17ZwNFdKqv0+5g
	ovyYTvuMoHoUPx5M5m1Q=
X-Received: by 2002:a05:6830:4487:b0:843:b6f8:de3f with SMTP id 46e09a7af769-85d365529d5mr7247305a34.18.1793638229426;
        Mon, 02 Nov 2026 08:50:29 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:28 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:21 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's 32 kHz output
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
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-1-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
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
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=1237;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3CyHV7hxEQyK84ACcArH+5qoJrY2fIpfuKy4fIAGdtU=;
 b=0Wf1b+8NmB4OEOpczcJRUHMeGyBxsbhLHqpUCilWHGZgwVqtkqscNpMc02ashPTcWUbtr4lgH
 WpE9hQMgNpfD6tqblyH80VYcqOYLALDE/Fh5XCg6akXUTVKecaowEVt
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


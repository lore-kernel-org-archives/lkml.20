Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596866;
	b=R0CLbbgEMl7Gp+iyaufWRgQoGM0iInIMlbn3FniTCqsYj/FtJU2Vq1402ndmmhWJfuIb
	 BKndyFnMQeEUjXfJGtW9049no7dn8g3/YLW4GdOm4ExcVLMzIVBMutViq0fMoY85epy1E
	 MXdeaG0ofst6GpMZP+WoC6q9Sdcxv0uMJwkKtpNkNXXrhmlRmLT/h4n8IDWn1URR75emK
	 4Bu3TyXCNIt9gRJzvbP38hPkAer3kbc6xpkyjkX758EpqochM+WkdqLdUpSQMLhZIta5b
	 JyRHAjJGoNNA+0zYddc8CX64kQnDKfErxaggU34WDpsD40zyVEEwo9UbNdaK7PdRg6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
	b=p1L1v2y03RccS8DnMfZLGUP5ezXaxb3qxmPgZ6zxv7ORvVSjqUm3md7g9hgL7NrEzWBa
	 neWgFacGf33O6zbHqeMM3HvWu8ppKIhj2ZOkLJowy8OXg9b0SQ7Vro2PTiMIsobCMlyUp
	 NgMkrXPO/Ri7r53s+4GYWmN23dqf2Wr1rmtRG5FWUaxodAqr7Bds+t/WtOizsSu4Hfq8X
	 MKYW5LJE8/PpyXVRBho3FUG4Jtb65414KPaMLxs+NBJ/HswBBO8HxYGLzCO+GJTCaTFO6
	 0hMBCWAra2A3GQqh5T9zvgjZxQcw9xMbqOgf8USIJvb2qgYq9d0/rsK01oy//YZVMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3E606A8A4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C3E606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm6v1RTE
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c468bd799ecso247793266b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596864; x=1795201664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=Vm6v1RTEA4FWJq25ASY1lb5MR5BgXMe4qoAyAKawSq9cDnRLqH/msUZtMegpu8mO31
         3alveRSeEqOlea3xa03rZSdDRmVsFWBqx0LvtXUYw2yHjLyfgd/DRtnPA2Kv33PBvdzq
         6/D04/Ychb3xeD7h2lFwdXVW9kehjlwqs6tQqZ6ir45YeFHjeC9p+tqjQCCzhCBM80Gc
         dDUSPmVKWoIld4xsa0FObxQKQoUQqEjgaxbgyLvcnnwHmjG7pd8skw7SxHTHjtYmY7Vu
         m8wlHEZ/BrlQKb0qUoRYpWhitGlL0IDd03p5YchHAQXI015wKWpYldCg/LZsRoMg6eGb
         Q1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596864; x=1795201664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0kISij2dA5dG+ZLDMffjTugHXeo/ScalkLGjjtZzlg=;
        b=17+xQWyMGsgLqB/W5PjzXdzP5TZDaH7fNddcREc9Q4Ia47yf3ahiXsoHwLfnlKDCmf
         1jN2DBh6bJZPCtC0bJY87OtVZAKOue8ERxMHx+O0LVOsm4wgSdC2Hp1n5mG8KjNnjXPR
         gL2hEY4cyffuT7Dmijgfove2NhllYIymSRGgw7MMvYDiG2oqAtyYtUoecnidJXoO+pAG
         hiYK1LgSgOwo2gjzvRTOP3Oeki/jw5sTc2vtWN7ccSCjrvYD3j9nHcVxyEs0kxdIJWc/
         UXnioucenkaUQoJvdWIo12DecqO7xUc4d5q2MRuXx734rcS9aLDDuWESm/qWCaV14sLh
         20ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEi90sqROLzirPPYQXNimDoIn4PgED0qijJ84wcG7NaMp85i8za4bcWZc4KiA3qiRcfiQ4BbHhQOw82Mu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MBqAWfoonGlqiNbh9ZAIIi104i6ULaHV/kGs3pM49Iv4D/COE
	yJ8Uf6JE4hzRxCIlBVc9ogq9fSjsWPCmq/NzYiGKCFagC91KoeiJRJ07
X-Gm-Gg: AYBFou1teXRSH5N1SVYhTCceEUBt0eZets7yGZ2E2qFLd/sNipftusATufUtkMjrE23
	sSCS5JJJNLdsdnlUWKcoBGfQ9Qv62UitTlQiiAFrV1UHWQSV2TBJmzBkObG+8L4LcBvQUnnoHbU
	DGODvG4NfvhqHx1ueF+EjYvj5fXym5Mu6SrNzx4Q4+i9Nz5M8oHqyMnONp4TD+4zBsjryOUjpFh
	n5VrR8dhOPKVIYgvFnGsDTyBISlvjASctxKD2PflfOftWmeEu7fvIS1b/ywfXkZB1lWTgovSFZA
	LAz4tN0TQN8eueJXuZozX0eVpxyiR9mZcAixBKh5mjqCLPtHNhCce9r7CwKTKaTel9l4E64aTBQ
	fRcUkPB+Kd+TnMm6YlIw6RiSYLrzELb41oatEQrItxkLo0Ri+JQ8+1gWXTtlnEUjuOZkR/ydr3L
	ndiZOggjhGW7iUsCQ09YSVxOWSowz0vTFCqzbpXV2PZf82ZrqraEWj0sWUO7XnaZDc97u4cTvMI
	sGWbTV5hSF6eIfyaQWVqaobAHA4RJHguyKA3JL9NrD4LW4G8vUph9GN81ItNFBowiYP7puxYsVy
	Rhv+AQ931A9yNOctue1Y4fwMDp37LMYghz0cHIr6JDgA841ryZC+AKnMMaXRyLOv
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr310340266b.16.1794596864130;
        Fri, 13 Nov 2026 11:07:44 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:04:57 +0300
Subject: [PATCH v2 1/9] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi
 Poco X4 GT
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
Message-Id: <20261113-initial-mt6895-v2-1-4ab0aa9fa391@gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add the compatible for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
along with the Xiaomi xaga board based on it, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64

-- 
2.56.0


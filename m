Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849486;
	b=Va3BuCmUQz/524nDlKuQIMywoLEhxU+4T6hAY71lRx+uonkkGaF1lwizziiGQDtLypev
	 Z/qCdeybi5txQqQ3Vb2HP+m+hh95Ys1orY0NmSCQ2N+WVZVSj4Ql0Rpf/MVC5oT2stNfQ
	 n200Xhd1vfyN5G9456RHDOlJFp3m1NIdUeN+tJqdIV5jf8Flkz+bcp6vwIk6sN5a5Ct03
	 vqOEZzwLS0OHz1Blje0JcOYl7UBx1D0qwMkv8h9yL8Grcng2yUajnd1E7Rqloxl3pcrd0
	 E/yv7pq54OWFdgRs2Aes+96Jzztyn6mfHVodhEI+Axli4bo/cZA8V652O4yymSjlvLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
	b=RPh4KjtjyicdrycWfM5uudPvHfGzO7NSgKyyzN/zXtfh397cLh9x+CM0PZ9tSgUghUwa
	 XJUd624HEq9UZw39X0OLrLFB1A3xwUVmgFDGRQ+c1ry+Dvbvfr5206+yACyOkNKh9o9b2
	 baMKOkYkSgNPYZCswNu+gUQehjVpV9PAWc+QOwaviP9OXlUJ45v4rs/0jIaqh3hknVcC+
	 AthQNnUOjIxonM7Szy35vW4zrzgGkvPWHCgQ+U5vjSUfr2z57BOfp3G+SFn7DNnghbYAq
	 i51yRZyzgPBa6sy0cSpQru4pp1q9XHxDiMOh37PJba2BD0fKIo+OE4GFt8eTS6YQI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrXJ4T9r;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46DF606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46DF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrXJ4T9r
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so45632265e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794849484; x=1795454284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=QrXJ4T9r/Ao3tHH/MkzuaO3Tp136m0vb9GaSkUhytslHpV80es0UA1nNfKyycEpsWI
         5yxeF0GWHXUosnXga8Dgsc4n4ldzMzs1jTD3FBP0ZftrywCfp+/KNGPqexCpJ+/BYYET
         gCxQMLhiaM6btvruFm/M47UWAAwJU77PFxnA9jhwqxj7i13Dc5eai2zpXjfOLJkaxRVx
         49chWLg6CaAbO4xYumoUvxRJvYvEToGq68H7RwkqLpTy7+lB0LraJ1cWHAeUwJiGbc81
         dpvtG257O2u/WqVcwpN5nicOlrDDkDiDRBvCR80L00QkcjccxpqwLa1U0rMFcW4DrQVE
         UkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849484; x=1795454284;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNUG7rH7/qSKafTA5lrT/55Jq8bN6QIZQW36YHjhTGQ=;
        b=nEErZRZdfzePXKNOpZlTuTJ/oi9dziW4YYDGjtKjOoTUHekE8gK4l/6GgPlqVtkaIo
         MXMob8t9eVbbcjEtH/M4hZ1hzCSN3LeA70VDFscQCAJPNJi5pAvNnh8zwxHIsXg6JaDH
         fNbVjETzEzYzQAPljhejiYO1aE8GiPkTuII7oNBVux7qBPBfbtESAxypr6U/p2J8HzSP
         0UI4eeaO3Cs6SuWGRvhj7Q00Qc6Pw9Y4qRmi1iKqd5iHHEs2wAI/9aFZV8nm7t9jEqY8
         XX8KnO+DN2KuPUol5QPddimcif74qyRPhhhoPWeaQ/sxCodjiSei/32SVIZLiqMVgHoC
         HqGA==
X-Forwarded-Encrypted: i=1; AL+hErGEA1uQ5T0JGHu72yJMkjotLPKN+x4EYY4HVwDwoQ2XLGxADMjtc+/+dec9t6MM6JBD+MBf+0xGVMRwOU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f8WKzYANeLPPqlT0hDY3QYVAPOD3jzWBjsZijvbqwCepOqLuf
	GLTHOevUW1QQtpszwtAQLpDz3/9POWo4/agtRhmkBY4kPaKDv7106m1g3wnEOsIpmuQ=
X-Gm-Gg: AYBFou3Lt8JRbf128vT5RaIhgJmLHw1xLyDLG1XzXClYsPrL5ocqAOAVKLmgepZEo9n
	MB2bRgIP87lLbFchh+fvAxl1v8qgGppPx2I4wzYs6Hx/NG0dnsKdq/V5E2f6L0bPZtbUXGQx/hi
	iX2E16iqQ5hPesgNlPRLaJmhpp/iGrJS0cm3MJrKqe0PdIPEQ6FeBdix2F/hEEQm444ZFqhHlD4
	yEbAy+2/gBLpkNxSCXZvpUpguvFasqYZtFsigV2lQ2bDzeem02HOCnL1OISqe86Ov8EtPTYTX0b
	1A4sW7G+fuqMbV+36v2zzo6HNNoUJ9reENT3GeweeRoVvr+IxojC/YO0lUT0oBh9jAAxU99FudJ
	FRMdocUqT2YefYUfDVlKZcnzEGjfc1Z4V/xWO/8NrOUaMNWuu9jqSqcqfy+7HTdvtR8Piqzifhy
	XOTpy00JJVYmEF6fkuo4QAYGhAoz1F9gox8x+pa49TUrOnsCTNoyE6LuSDoCRoTYRWo7Zm5h+FY
	PlZCFTyDqxfSGoexkeka8+VjeHAch+zU6HPRrzCyabgdKjr0s7u7KjeU9xnJdKgt8s2PEyHzOjp
	3sAxa6etfQXni5WxWqvzR8Y9pPv1/ge+aim1Dgdzpdj+VlDcjItG0sTuYGCxXaxN
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr134923375e9.11.1794849484047;
        Mon, 16 Nov 2026 09:18:04 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c255asm2418175e9.13.2026.11.16.09.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:18:03 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Jiri Slaby
 <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas?= F. R.
 A. Prado
 <nfraprado@collabora.com>
Subject: [PATCH RESEND] dt-bindings: serial: mediatek,uart: Add compatible for
 MT8196
Date: Mon, 16 Nov 2026 18:18:03 +0100
Message-ID: <87zev8wv90.fsf@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Add a compatible string for the MediaTek MT8196 Chromebook SoC,
which UART IPs are fully compatible with MT6577.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
This patch was posted in June 2025 as part of the "Add MT8196
compatibles to bindings" series [1]. The timer and i2c patches of that
series have been applied, but this one got lost and was never picked
up. Resending it unchanged, rebased on v7.4-rc1.

[1] https://lore.kernel.org/r/20250611110800.458164-1-angelogioacchino.delr=
egno@collabora.com

 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/=
Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..bf0b1df449ee 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -49,6 +49,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8196-uart
               - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
--=20
2.56.0


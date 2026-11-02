Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650578;
	b=IWWov24IFcfajcBmMyx35RgD7ft/nDa23lZ+6k7XzxuBfKG3cc9oVUlMK/gV87mS8o+F
	 VimhsAA7J45cP5IBs+kXkiF+bgIwXSn6hdzbEdEYGPeYPuHC7IFZwQubsElIrvqzcSX8S
	 /etakwW2x385wm7EiZQ3fQgPm59kAaH2ufd9XBeBFqrqyPj8szCoEqWtbOnbdVD6DYw2P
	 Yl4ypm+0y32d98g/UzXd9I3BMOo1bapOZrLjAVaN0LK3EOtjzsLx9bqtEvfBOrawhaowY
	 7okz/kmKHNV/ACUKvXgIq+vA6W4rH6RLdY9rdHO7jOkHTz8KDPsMYBIsQkryiFAu6kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
	b=ivl4dRIM+a8Kyk9qfYIaG6ayzX3cLkZb/O9Q+eWGjc3w3r7CJCxw+yb5Kj/0+ns7qM2u
	 WCNvdQvMCcxxX6dpSPcPkHJD6V0G0uS99h1H5/RPmPMMA5q09HYdhf75tMfjgek9as3ND
	 ZiJ2AJToDrhBoRHmjYOSUuLZGJtjNoUCT3pNoDBSsm7lMfN6hYSwtOHzGkOgvy6pka2+p
	 54oodDJdEqxq5NQYNsfZyf6Cek8PTVqxKTWf6xzoe5Eg9PPSFHfeZ6i/WzBwHJDGXPWBX
	 IvCDKozjKl+hd0vjnQUm419RTd5ysJO4XMBqM3P19CYE90OT5cZs307Tzf2bDroowsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FE6606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FE6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ph8O0va6
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34867805e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650576; x=1794255376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=Ph8O0va69qi5KtzeMAZfOR+XDswm9owVaSD7cGWwAQOJ96+cj8DyDmSW9R9AqpSRi4
         qSmxp5fV32iyNS0bzLuXiMm6IDaPiIah9HKWcvPAspPHdsBu+4ga08lN5JkARu5OneY+
         WtcH1ltRJI1RFnuHq4mqfFog7/KanXx6yxLLcYS+/YiINNRA99O5eekCF1o1hw8+KROh
         fyQYMFqDXUnzrsODZWc+ntNXOGuWG7+3u/aocO/UAbmc62K1R464txfBlM31BxpZ5BfL
         j3gkGR6vZ1v65LHnizKzbdOttle62TxIbDRLXj4tPqG8eWMB0++KkAsyZeaRiBaMyjD/
         cC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650576; x=1794255376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkGbvUDyeeZ1ewkhAMtnGT8VJqpJVXFal/OdRewYEcs=;
        b=T5WqSgtoKnBaCF2mX3E5nzn759RhT1gbJWdN1ToN1WNOfQoyS5g0cw3BBCrgsI9RbL
         S1pEjHK8tLlufaxWX0+JlydWLscbno4Z9rBKEGzXI0tMWYPqYSJlAb0ZT4umBvgtNSs9
         gjPaTF5Y9IHKshWZirk0RazYlcoEHWU36SKtTJyaCCIEw1qV4U3XQMeQqxX7de+Uq3Ij
         qArzzQDya7q+J83xMrJhvqf2DQVTqaU+qRtgG0cYfATWbQYx8FBaDp+9cC1FVvpMSNCG
         ge0vvTWrLHYRxRDphjfnYXJTznmBu7splQ+25p2acnZkfDcAXzv7KFUnL3fwYbMlqou0
         5cJA==
X-Forwarded-Encrypted: i=1; AKwUvByoviInYgBJfYaPdvfKcUDS/M5lZQYKDdLvKIfaHsfuK5/lGru4DlcIzM1j5wwNhhSFYdQi70Fw0jBwO1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn4bNbw7jdHA/CsLiHIztYBKtcoqPNChEdnVESIaXwjUsiichJ
	H65feud0AA6iWAwJmWh8eZUM003K/b5gW2bojbtJ0FavhPhGhQhYMppsSz/vcm89Z+s=
X-Gm-Gg: AYBFou2RpzYwzNDjoKP+/6mXWBnUgEiWjbkvjIlhQMtW6O2r8C3/JR01uqR3Bnu94G4
	1Zse1K+zng4oVi2C7X8h43EbfSGEn8bCNg5qiu/RwVULxQWOvR5jNs74TqLJawPNvgEEf/HwJkB
	s6iZ2MLnZiYZbN51a0Vw94X5mDpcO+ungt0sNc19o1AV+5p/177tj7abAKv5G3iXV17FO+urxcP
	1UHWiZWDTl9yTIzKAhJkvJeZZV+8FXtUjbga1NDcO/6UDKhJq8mfDeg1sIazbasMjgYHNwwViEJ
	rn7XghaQk1NH8h1r+Hk/AK9d8FlWwklt9KN23PfhTgcy1RL0/M8C83xW+8MRUdnIoND0JAop8uA
	i9NqUwY9YX0aqJ0S8bGfWYVaP6A7omk9l2iMoqh9G2Kr/pvtN8R1u/9Vkx7wLoA+sdF6aYGtka/
	scapbR1DxtGBjT/QsFQFQtlmATfWeEE/kSmjBPbWut7dnK9beGFZMYoPI9tMn6SLIlKCdcXKEV9
	9B2dLLkJSIgdlBBnD9H/997DeLKyWKREb6lu9HOnfzB2UvIIAXMX8RvKrXyGzVDYEEteoSZUyji
	QYCOR2kS19nuC6jss/12VWifauuIE9uKGFPupKSCQcsYEvGNYvQXHPvLYtGy
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr269807015e9.29.1793650575803;
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09bcc967sm220013905e9.3.2026.11.02.12.16.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:16:15 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: serial: ingenic: Add the X1600
Date: Mon,  2 Nov 2026 21:14:59 +0100
Message-ID: <20261102201459.49284-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600's UARTs have the X1000's registers and 64-byte FIFOs. Add
ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- Drop the driver patch that set UMR and UACR at probe. After a reset
  the X1600's UMR already reads 16: the 0 the manual gives is what a
  clock-gated UART reads, which is also what Nikolaus saw from U-Boot.
  What needs fixing is a value a boot loader leaves (the HiBy R1's sets
  8 on UART2, its console), which is the boot loader's business, as
  Nikolaus said, not the X1600's.
- Move the new entry last, sorted by fallback (Krzysztof).
- Add Krzysztof's Acked-by.

v2: https://lore.kernel.org/all/20261024220712.23250-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261024051515.55639-1-olivier@mgcrea.io/

 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..0c452f20e103 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
 
   reg:
     maxItems: 1

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0


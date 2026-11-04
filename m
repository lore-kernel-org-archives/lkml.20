Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829535;
	b=XCvyZSEgZz34Ro7aKCwdAMIceTubPjn7c1lsFQkgYIJ6X9j50C+bgtsbblPZR1rPoWR5
	 ih/EIIMRFfyQ/KhZ5kIbclaaVCzJ57G6xf0dLCJtv/DNOd7uH0nTKJco5FIDwIO6zYxu1
	 VgcRx+1/n3U4BB0aO+N7hSiSCvO/TRVTlkyqrF3U/aZJSZAG/Eh5Xxu5Tyx6U2c9xi14h
	 C1nGSw9kMgKFSvKvzXDWwo9lbo5vF3rgdHuFFGtvHXiKvYGb5x4LSayPaNbdIlx/qAAWm
	 +mHwqCP1mraaKnFfFphMpltG2uUs/GEq83JcluD42POTrFKXWCRyreqnFngSpYazGYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
	b=B7IdYuISNOU+KKuZ8zNVIaUk/MSJ2kHDgVY89jJxzlLfFziBxqJhWExWWKBjRXYcCKmh
	 qPWSmEqm+8ZiG5Yii5whwGDBkqo3o8tHbecPqgnZ7zSUGw2OYuuK+n0CD0+mssB2wkQZ9
	 G5ZBG5IZpuAD2l5El6h+WH8OJhJcFDMWQaamRdza9K/2dZqTpAIxhyn7S0yBSpvyMBfGW
	 Nis55orOL/YV9qflnRCBEhjDYg2RP2ttZWinNf9Yv8ydwXcJSVJ5i5NS1NJz0QGxUhWv5
	 j6wipBPhn4oCpzYinoWoSo6G9Rsoh7n+CxbCPfSKgWPkH0oweTSqWcHV1w3SKyDfHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x+8HY/Sk";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB946074FA4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB946074FA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+8HY/Sk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so6600265e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829533; x=1794434333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=x+8HY/SkqAoQD8boG9LMqxUpVX0GRRevt/KLtoNb/MCWHJzvoxH2HK4MgHjKnfHLo6
         MT0RenUXW/T6DEREkpAg5YjybKZRfrSsKGryH+ZEjNZxPa5+53lMqiVrbmN7ojb+sKjB
         Cfvm5qKqVkh/7UREcphI1uPFXNBfgzTCjEhfRmRkADQlEvjFg9f3AwJUR1Pro2c9f131
         WKgGa3QF9KBpWIgGFg3d6ZSte18EP+wfl+jCl/Ycjns3WJFfyt98iqrK/QdCYWhk6nXA
         HYuYFnems01bbkrMtDZ4vbjKHxnkKzoGkaLDr3C6OU4d/zz6nKlW33mWbvwzJb9CuhVw
         3N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829533; x=1794434333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=LFgvKAGb+EXd4saUakS0UtjdeQb5I5jRQR/82CD6cZx+6W5Q6LZeKEEdnNZ0LofCE7
         Ny8ltaF5ViGnrHKJNccnQylUdubL7KdqKMkgW0ccNOo4NwsKzEUduN2r7rGhQtjTPdg5
         gapiZWFH5f+vlDOMnIts2CSEPaO3sXCTyCiAGRAx12EEsUyGGn3q45AlKufYCVOal2F3
         U9wsq6D4xH5C81FK1zuvcBcMuWjKjWRxyeosm4ZGKTj3adYExX56WJlQxgdIwzadBFNr
         mIZmCQ3BjoP5E9PeLcq7p6rSxD4qxnpHeIhlLF8nsnTojQkeWG7XOiPZezsI/l51EXTp
         XlMA==
X-Forwarded-Encrypted: i=1; AKwUvBziH465ZCwkHy16q0nABR0Cu5/JVJflmt0+kvCTv74fTlK3TFfNoV+d6nyLs1mV0Et5oMgLS6JSAimCxwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oiIvnCA9UGsQWNpbZZw1GG4ZESZLPia6+Z2oROyYUwjtupPIH
	QFV7KpvSaQRkAp3umMQVK1fHEIkRR50W54hYR2MHfJ4OG9r3KkFCJlbf
X-Gm-Gg: AYBFou21LlA3WjXnWyugWV/3pvr7l6MZWWwo4F7uwU9h8k70EJWF39fsgng3AnB+MXG
	x8NO6JuzpaIEbzzge9PRw2ihS9Whrvli7uhMAcFsjNUhwGaVyKuPiF3dws+IgO3BCkg2GPEdaLI
	2o6Db3ohD1usHPEXDm2bIz7h3DhFTxxQyQCI+u2B2O9hWSqUGKmbLAsb9h0/3z5Drj2VIAHEUOW
	qbnYUxpKla5YccTaa3IghOt6kctBroRL9qjt4d2KlQACf0Lne6rJV2hLI5+PQyzYGEISDHOpUpz
	wJujHClROMvN73N5bpIzhQXudmk8uB9NTLOR0Kew2DY4Hg1mwOPQbk0X2e/+eKWZnN73kD8aiSw
	qcrvffRDw7FRrJjp+zLhQF5eybND/2VLF5CGnH0FiiHzjVws2DBq0d3k/ipwGbpKkXFqCP5KvC+
	yQdVERevAtEwJj0dVWCNYPLlzTM9YVDSWJpse2/OC9LFC96W6VKmAYVKr3vmPldDy/dAIkdeHHk
	VPTkFnTsT9oCXg2Nw16CVXdQjghoi/gyir3sNITC1YDdFqSv7XqnBuvHbnpYLEcDotn7jHNWEyk
	GkiureOuLmxY4XrxXngBwj47it2KAg0lcvQL8AJuA+1xEB2nFKHXpbKyOmJMC7/7fX8d2qxuuRq
	MXscrSdAD+CT+lNMr7PX5HpG9RgMQtKRx5gU5kDqFa624fw==
X-Received: by 2002:a05:600c:c107:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4b1202673f8mr162862935e9.30.1793829533381;
        Wed, 04 Nov 2026 13:58:53 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:52 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Wed,  4 Nov 2026 21:58:46 +0000
Message-ID: <20261104215848.2087944-2-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver holds PERST# asserted for T_PVPERL (100 ms) before releasing it.
Endpoints disagree about what they want there: some need longer than the
default to settle, while others stop answering configuration reads when the
reset pulse is stretched that far, because PERST# stays asserted for the
whole wait.

Describe two properties so a board can state what its endpoint needs, named
after the ones the Rockchip vendor driver already uses for the dwc-based
controllers:

  rockchip,perst-inactive-ms      - the delay used at probe
  rockchip,s2r-perst-inactive-ms  - the delay used when resuming

Both are optional and the defaults preserve the current behaviour.

Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 .../bindings/pci/rockchip,rk3399-pcie.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
index 720a5f9..7ac915c 100644
--- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
@@ -40,6 +40,21 @@ properties:
     maxItems: 1
     description: pre-reset GPIO
 
+  rockchip,perst-inactive-ms:
+    default: 100
+    description:
+      Time PERST# is held asserted before it is released, which is also the
+      width of the reset pulse. The default meets T_PVPERL for a slot that
+      is powered at the moment PERST# is asserted. Some endpoints need more
+      settling time than that, while others stop responding when the pulse
+      is that long. A value of 0 selects the 100 us minimum the PCI Express
+      CEM specification sets for the pulse.
+
+  rockchip,s2r-perst-inactive-ms:
+    description:
+      The same time, applied when resuming from system suspend. Defaults to
+      the value of rockchip,perst-inactive-ms.
+
   vpcie12v-supply:
     description: The 12v regulator to use for PCIe.
 
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569896;
	b=qOwRMbrqBGT3UyWNBfU/67iyBdWrv1KAkVOTjAhAwcVeMIdOMoP2C+zeJ2UBShD+RNCH
	 Lqy84W8kJA9IsAm57dnK1Xvv+Ylcv9ZWCfLWkmkCwuI9jQhd07VmhBk/uG49qMa+oMpYa
	 A/24EzeHUbGV7BJ/FXktkHsyoGZ1fYkGDBGvxEa0UOhBIZyHjlHZajSqzagnFS/P3vktY
	 c+8yQcqYa5jEqtLxuYvQ/8+HjID+j9uHBGaI+z5In/JGwuadVFuWUKbGCeNpMKZzdI1RO
	 dShybghPLG0eS75dlz0BG7DjnKJQw+4RKvKL0isrGMCIA+NwsXW+VeW8UV9JM5euG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
	b=cNKLlzQH94ZumupzE8a439fbBPbcsZUUShwoogU+eIisBBlMz8Ohgos69vHCPyG8JBrz
	 NR2i7rj1Etw8y5+1pSfwrUYA+jpkIRDtiZWxZaBl64yt5Aozq9rYqcrb4RjvQCkhJfyK0
	 Rvu8K8ZthitppHRiEO8Ig5TFcETz/jgyN/7tWZ3eVjL2bJ77hZj52lnh/iH2BMxxhdi4I
	 oAn6z9tKtgMfR23/6pOPgaODrM+YVABlcM5vJQZorb3+wxC5hPTcNyov+SgeM5hKky0QG
	 i/VoonBm9Bp/oFuWbGkpszPpmSa5H5BJfcALRLPS63qpqKcIZ1JWdLTLz3pJuQN3HrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U3Yn7GYe;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516B606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A516B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U3Yn7GYe
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1162731f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569894; x=1795174694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
        b=U3Yn7GYeTw7Jk1FGMgwLIzn7Qortes/NBkaLCGHBKxHyDT79DAYlvY4ZopGCJKqb5p
         dSBMglWjMMIvZ8bf2lArhqLgVw75kM6PnqSQPiTWiHbBMxdDYiZC1HXcohBWoBaVkLQD
         dP5Um3dh1XM11x388lZMcUY0sMbnXrgtg8Jbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569894; x=1795174694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
        b=VMA4vfVYu5LU70OmHayJJvD88uPKwBoI0kXKA4/mb4vM4U22BFIjL6R5oTZbIbev3g
         mYFugy75yFXB1ChxTZPTBaz9E+0YyZfbymNm002NCmYwEv7pftLnZ1JOoQlUBSfud94k
         mBTHfH/+ks6WW+UkuOTk74cPaQF9o59IXHPhStruX4iJ4d6JdnWbdzP/O+YUObuc8xo8
         UDcqFft7wGtj6UrYh29viGMuWWQOYwYyfdumSluYtkkpIb8kVDm5YRdhz74NctggN3+G
         7H4QUXUhiivUreMPw4EI4eFXmGLQD/40OJW+KewzdtEtnlagBtuNbKUZA3Fobvgzir+/
         3luA==
X-Forwarded-Encrypted: i=1; AL+hErGSzVlx1wWt2YmWB1vc5TrTb9N39bpJ3oDrwAkjDjvJT5Az4uu+AJavU7NeoWMxP65w3UhwMW2WtrRJQk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1MGBR+Vaj6WLfz2ycpplDDFpGk+1igie6tk+5qKxTD1xsBHrP
	AyGUBtjmwDSGLbyOPhhgZQyaTkAkXW5yJsjdhQ0DXUq1B0Pvt+Os7zSYYJ6iIPO4Rec=
X-Gm-Gg: AYBFou3/SHmOgUo5uFUjJjp5LsTwagZtgkmsyjiuTDn5lIax7sfMR5N5L/e5wc2s5U5
	9mR4AOVh0KGTCE4MjGV4f6w1GG+OGRHlwtQhFMJN5i3av3YF17LzYsl6N87CEOpLSHK8mCbII8X
	Ctj6pg1/2PCuzV6/zDDS/FUJeuYDb4HefZoFkUrVXm9XQoQl531fvlR29io0IEHY8Wb1866mt3U
	UA4/ZaXxhb6QXCbYG1ggpvi/vLymfGjch6SGjva73NC365MLy6G8Y5WEnw+aWQA0tXpNk9Ix84Q
	T4gGZ1Zs2LqfrBFHWSwtJm9pnctWd0OzQdCYHS+uc0aEHsCmUl+EycC3ir22Afggf3RX1LI9fUN
	e5Qeslv9wiUZAzYJzzt9SMFTpQU/SPOtwPOXSvag/vMSqWKvfY0/eoaKinYqfhJtvuCxHPBpTJm
	98+T5ZQvGIUqeTed0cbCBR8MacPBObNJdnCWCuB20C7pUfPfkOa9b/756bMXlCliW9khs85T2Ps
	+aiIJT+Byg2aQEkgdIPv227SzarV/6+d0YwYYkD1X3Om1c0jzkhBE/LVNgmzRpByxHByR64yQK8
	YE3jGkJnql5832bKe7/j6lxuNj/bQZH2Nv7ESnKqzJ8jMa0ViUhMuMEPGZgOGKTaAQah8/fSXF0
	5
X-Received: by 2002:a5d:6f19:0:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-49c71a6547bmr4387223f8f.35.1794569893910;
        Fri, 13 Nov 2026 03:38:13 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:13 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Fri, 13 Nov 2026 12:38:06 +0100
Message-ID: <20261113113808.1779860-2-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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

Axelera AI is an EU-based provider of AIPUs for edge AI inference.

Link: https://axelera.ai/
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..20a3b24319c4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Avnet, Inc.
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
+  "^axelera,.*":
+    description: Axelera AI B.V.
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axiado,.*":
-- 
2.53.0


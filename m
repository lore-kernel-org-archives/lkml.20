Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960411;
	b=0t1alaSbUwD7ivfTIVDi7GS31BaK1+UHD/H6zeEMW1rVCZBbdshFOybuerwPkIh4lgfI
	 4FZgT14HuORPce+ZrGB5tV1LXPrav3RcT/Q8rx5VWCoVpbEiaTOTiKF1/1kEFYz1v/drk
	 EP74j/n+kM3/Y5zceyiWRGGF1bR57SOPjzzkEhSIuKCmjL9idzoXtI0UXRYn/Og72DK9a
	 0GkLwpHXzfItynlW3b0jvfhCRuM71WdHVPz5TEUlaQztmZWhoUF1i8/ZSsAYIyz4YTFQD
	 7YKbFTRf79uzRoPKGyM+HCBrOcqoMlSDtTFxNoLWT63NttrgUCLh8zoBkk9TVDfJ6rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960411;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	b=qNojNRkPz7fqPUXHUciZ50Go/4oXo8bY7KYHAnK34V2xIxHlAYVQJiUGgH87IyK2gDsU
	 UY4zB9yWfO79eFcybi3HuV/tv2OV9zGfZx48JvHtLSzmN2iaSXLWMzreZFKWKYWQcbjKP
	 kPwXliY98S9qvTRvbroTh8rjRPhB5IxqBnEo3/gTiXT1H5fdF/pYJZXVxWYf0qWhDWYBM
	 ncON3pWfZ2M+nm0iyCP4eFD/U4z/lXEGYIf575mg07xdmBOTXNyz7yLLdSBO3RxFR7Hoc
	 78emCoHVBR9pCjToyXDPAZyBYKncIL1otxNYUlgdix4no1i79lSZYNWKjcK3scwW4eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b="QlPXC/8+";
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53C606A326;
	Fri,  6 Nov 2026 10:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C53C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=QlPXC/8+
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteW1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:59 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteW1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960399;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QlPXC/8+dDJj3K5S0vS/N62vX44X+i/lrh3UbZbPtoiLzWpJ9KXFacJpm6HnDs9D8
	 I6p8icqS9UPRewn0cEYMrZ7Jmt18dVO9tqM6/l+7UikELm0GbMfJrHXLgWklTlp/HI
	 Glcw/5GoZUJ9BKp1mVws6M3XEP/+MaF6pBBRA/VI=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
Date: Fri,  6 Nov 2026 11:19:53 +0100
Message-ID: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The receiver can stay powered across suspend and wake the system when
a remote control key is pressed. Allow boards to mark it as a wakeup
source.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..27c89f8f8c3d 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -30,6 +30,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.56.0


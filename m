Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956123;
	b=FGkKJKBAuZGUlb5mwMe06fnecTF1l/PW+XG7ezT5Bb9mNC1fIaM2eSl/JIOkThCw2deX
	 6D0J9NG30m1CsFt+gpcifetYKTwoI/H7Qd2YqC3vEQfH4/C1Ad/YvDcGGaa6ZONEr/qjg
	 gvOt5kmDz4vAB7tEtZm8U+Of6w+dWKMrztrRhnfg2nafSoWOqfbT7MRRjKD1N6rBXvp6V
	 qQjk8GEaS26HwOurPQyw0tsotzdhynD9yhzdiiDjTmhrRWVLh8PiV8doFEYJOC65/aoes
	 S+Ut2aht6o25kFQUKjWYt9f/IhmeUxe1i6qX2eYCsUm2FqBH/FRnWb4DUg/G3vcNGTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956123;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=;
	b=OhbHwdeHQYl61/mnGdEyimC5JV+vyWwwo7jAZDQHig4JACjx6QKFGpaVs4tKqW3lvnE8
	 QTlmZCkc1aLlxkcnNAeAYfbjezTKP5n1+6SkVO+rTRs03LO9q/4+wfhaM0KY9wOUp7nIK
	 7o5mACyQHh43R8rRrLX1HYNrhCazQzpexKUuuB0pvYwaljJHJc9mQ5+Sl/l7ja3DycFiD
	 ucDFCNZYyqbLa2yglPg3A0xiWNOewxx4seBIS5WiTu1lqebJQ+xsDCUsbIl9qRgx3GUHK
	 TaQns2VKb68uLC5ZzdkDOZGUSMdkNRfS9HdvlICMuVI4bZJeiBH5QiFyZQM3N3xkZ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=mzJibMmF;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CC0606A32F;
	Sun, 25 Oct 2026 19:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0CC0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=mzJibMmF
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko4516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:51 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko4516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956112;
	bh=NuhksjsNAdRQMqvWLmBXY10ekQvRxyZAMILK7wtyNTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mzJibMmFviPkfEtqh7tw9Kd6GqWZn+d+Te9WvzRxnp4P3RwoBY85cEleJSq8EafNr
	 /ytDFuO05JxZdTc2oT8hvpVoskzKhlnJ16QOGy0Gu3hI/+uk7jSFzbhlGmnCBv9MI7
	 DkVhnGuT0CPCbXucNSOgihj0/JwHd0ueuRibOOpg=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
Date: Sun, 25 Oct 2026 20:21:43 +0100
Message-ID: <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
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

The S4 secure monitor implements the GXBB interface, but its PSCI
SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
driver has to tell it apart. Add an S4 compatible with the GXBB one as
fallback.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
index 8f50e698760e..6ff2ddfcaf54 100644
--- a/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
+++ b/Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
@@ -18,7 +18,9 @@ properties:
     oneOf:
       - const: amlogic,meson-gxbb-sm
       - items:
-          - const: amlogic,meson-gx-sm
+          - enum:
+              - amlogic,meson-gx-sm
+              - amlogic,meson-s4-sm
           - const: amlogic,meson-gxbb-sm
 
   power-controller:
-- 
2.56.0


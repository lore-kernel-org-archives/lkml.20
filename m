Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956219;
	b=zDB1I7khbEX0QvIyjRaI6dpyDsO4sP01wcr6trkpv2yfOaxLfy6BpuApff2WBbu6R4hr
	 vgmFiyE79qWzj2efiErn5X4MlNSewAGybPEA6G4ynf7AIl4F8iwaozYixq/6JOorubR+t
	 5WJ4hiItj+0q7/Jegw8alCnn3fFN0YnDp/472HniR6oN33hr87lo/keiiVUsZ4swQ7+8J
	 Nd2yc1rTvfmOfnmMzWjFOrzR2V7nujKVwuFeWdm23yPUyi6Z5ZzwpmzElBW65FE5mDAL7
	 8KO8z4jWmRDDwAzhGulWk3iycIgeIDc4kzw+PeqN5mbI6nu7UvQudyTp4TsOZqy7s7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956219;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	b=xYP05HmcYX3XfRRQxZ+xkhaWPuD51m/bLQlDmyqQXIXsHcrubSUapULmYDNjmM0pE45J
	 JBmZVrr48tc/S8XJ86YvJ1Y74F/ercFFADXnxqAta3UP+emVgUuYkQARQ8QV0jP2UxBkU
	 HzFFXsvJv8PWyqNYsKuRn27B4vx/bKwpBG3XEyPaPTARWeZBtvVbYmAda+/YTigIdrO3j
	 kaEAuqONhMsQ/WZoWBvCIPae/erQURxhsxSFO9T7CC63CWZz68SSg1FEkWbR9tznugX9Z
	 NfXMYCHwMNA7v00QQteu4penXVyq10pvr0EJ6YKU30NEcl8BP2lt9B6fQwTp/8ultfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=c8vNjXCW;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D3606A327;
	Sun, 25 Oct 2026 19:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=c8vNjXCW
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM3517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:25 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM3517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956206;
	bh=rcEulFZCueR/VtEX43ndFQ7UuS3voqVu9BUx+iVKLC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c8vNjXCWxx2WmCehDLoO3eq6OG/fmCPsJ/zUhmZYR9Y6b6lA99b3vKOMZDHvYKcRZ
	 zNu2uSeWQUKE3yN8AgkSmXzLxZzdtN+A7ipiY62KgYa5jM2WVVZHOaCtITGDFuwL1V
	 o7T7uGbnC65G7i6wERqmCSpdFUoSHYDH2tKCV6ug=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
Date: Sun, 25 Oct 2026 20:23:18 +0100
Message-ID: <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
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


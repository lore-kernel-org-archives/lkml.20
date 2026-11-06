Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962040;
	b=BeRl7QEKsIxmlcbURRGxHL4nFgjj6kJVOGWEzBoyvyWS/YadeIke1DCyAFI34F/CWm+T
	 Rf8g2kKnj6lzsSyo4MQOFcvaweZJw7MD0mzm8Rd5uRXnFJulQtB+vr85NahmwItgiD3Z7
	 8s/UJ9scF5sOicxnULABdVzdpNrFyT9ta9gSfDyTs0bqxL9va9i4xSNk3hzarS2FfDUL9
	 uHsFLh1QArxmKRJTBnO+J0n3NfNaOPeAvW7Ea4fK7kN17MDGimdDLOdsc8unfgORi4LUX
	 dG4gpVhOO4A70II4qj3WhMZmw08cVVlpVwEC4lLJP7mXzLTd8+oL8RWqRvJSNOQRM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962040;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=82iJO7WRa04zutkAoZphTeLb3e8+2bJ7l1tF4w09Ihc=;
	b=il0e9u32dBelXDQZroubJTteO4pcVFsBZjBMrAUcU+MQO7O68JuLdFKIU4cdJ7+CXBZy
	 m8qwWg8pfqwP9g7EER3QtAsCTZfXF2zxUAK8eWdYO5OA5SaG9pGvH5gMMdsUNCntSSpq6
	 GIs7s6BtnwEWEUeEkIgRa+fxo3Kq6YPJM7wwAvM+errhQUkXR3KDpJv8J3jjHt+epYIeH
	 y5NZQo87pRbzslkMIIbq0R1bdYE1X6SEg8rdQX3zRmzYIL/6OjyrlYH569r9APkt1367B
	 8HH+SPc/FV/eH/ABYQhXjMlRf5NhiWAJiWob9J5w9rk+q/4MC8keSH0xio+uXPKC2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=oncnZ1qS;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B5606D805;
	Fri,  6 Nov 2026 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479B5606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=oncnZ1qS
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07J1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07J1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962028;
	bh=82iJO7WRa04zutkAoZphTeLb3e8+2bJ7l1tF4w09Ihc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oncnZ1qSDRZOdVEusRVZDdnhTra8wKQ1Z3CJTGEiVhUDEhX0BC1f9VJo/brhcY0KL
	 Ze6XC0dDT53QB6SReVUcnrJ032fks7HXdGXdPxw/ZUSFcOurosS0WZLqxwnYr0UDnU
	 N1tTPXOw4D2MptDPDPHkghCn0vHaTlBGmqySeiLo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 04/10] arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible
Date: Fri,  6 Nov 2026 11:46:53 +0100
Message-ID: <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
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

Use the S4 specific compatible for the secure monitor, so that the
driver can apply the S4 power-off sequence.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 57270fbfb4a7..793c7bb9512e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -135,7 +135,7 @@ xtal: xtal-clk {
 
 	firmware {
 		sm: secure-monitor {
-			compatible = "amlogic,meson-gxbb-sm";
+			compatible = "amlogic,meson-s4-sm", "amlogic,meson-gxbb-sm";
 
 			pwrc: power-controller {
 				compatible = "amlogic,meson-s4-pwrc";
-- 
2.56.0


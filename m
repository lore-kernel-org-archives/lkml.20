Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956145;
	b=xlQlS0hlZwUbkBa11XFE8tpcTmrbPaSkRIzKiGW3EuRhbJdfaJwf6QYQi9uP+q2inYY9
	 g+Nkm1q+djjJ3kRHJjzEWE97Sx+4W1y96/J2sFjQvTdOQT/9ATZm1T+S++CaoUd02Uvi3
	 fmVSIKPXrwOELZIgL70RNG/K8ouUqycNNaW69sDbW3oOiLmDhfFS8i3etgC33t5eEFGup
	 XyuASjkZ1ILRJWgIOtdUFRnepsI9Sbi/bulaRzdsO1aORPQjC9thRpRlhZYvvfVX6SrTv
	 kD/sz4qg4E66rb+IeoOKbM6QjqC4mj8iefB8H/7ZkzLD5GlMgx/53P7/zLjFbKsItZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956145;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=aavG+Y2s4PjGm/W+opxqBIodXCzZpQc9N4L8Umwz6mY=;
	b=a8z6inGLHvXDv/Xo6yrqRCG6a2at4S6BhsviIXFxn4QEpmEc3Jogy2ID1f+8enYKqN+B
	 oLrEPd2qFCvOVdlmdIcwOhRddnNX5DZvwf//YyUlCdiRmEZluLKbaL7D6d7ccJaF+fsvn
	 DYiY5E06LvxG0ZYzhBOORQgSuLETnSourulOHrbefjsyfd1hpInuwU7n8FShzYbcpsptm
	 sAEEFhz5kand1cAvC9EFH6Y2LdH7XD+OXpP9prpid+SO5yCwPjAFA36bAD+6J4u6ud8RL
	 +8dJ1OSxlHqqhqsME88FWPJnELYg7s8+sltGg4tOat40qiekHmm6OScXrSLJ97q5UuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b="sJ/0pYiU";
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B7606A32F;
	Sun, 25 Oct 2026 19:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=sJ/0pYiU
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJM3W6516897
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:22:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJM3W6516897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956129;
	bh=aavG+Y2s4PjGm/W+opxqBIodXCzZpQc9N4L8Umwz6mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sJ/0pYiUBw0uLkc7tCSDkD5iKbY3WsGi/M/wEy1pQr+FBLHrcwWkgbv9M6qDUoU9I
	 2Rid27tr7AC9U3bjYF1zXblJ1GdBZ35WlHykV7GRsL887tQl6V7Hkl+aeTnthA6RIj
	 69/Jbo5aaDqEEHo1zgIaQbvTHmv14Mzl5eARd4Ck=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 1/2] dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
Date: Sun, 25 Oct 2026 20:22:01 +0100
Message-ID: <20261025192202.209045-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
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

The S4 USB2 PHY is the G12A/A1 design with a few different analog
settings, so it needs its own compatible.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
index 1a0c436b87a0..54058d2e6053 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - amlogic,g12a-usb2-phy
       - amlogic,a1-usb2-phy
+      - amlogic,s4-usb2-phy
 
   reg:
     maxItems: 1
-- 
2.56.0


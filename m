Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494293;
	b=AqsCqOkvw2FVjF4SKNXyDzoh/uPCDSo8UIQ8OYKhuHcINHqDqjcLfwGI3YocDd0pBOov
	 RC5ZkRFQglh3lsScgybvd39LX+BYOd4IT3QoxNZFisrKYw96kJ3gtytuuh31B7XiCKo/X
	 mFWE7pstyMqq2hl0oyN1zaqNaqhpGiYEx7UVC8wZFr26ChXB3KRV360j6qefv+bJVDAmX
	 ur1ryqNJL2OJXFzAuEwDbfqCWKDm35LEO8Nd13PBxhCV5ot7zyGI1L80diX5QXqkqo/4e
	 r2lVulxAr2AU40I/GAeiMZFqDDH2cW9At+GUrBFKUpynBWTBOPD59m9iBqqAPKiG8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
	b=i8KIAMscIuIJZxCODYYGGSJOPj/foiMUhHaNBZ3TyPpUY0QTjRJ9nI13ysRYeNnlgB1x
	 4TslUNkHn9ronQJzLt1s/HcKdnXsOekXXcXUWWuOs9XX4WBCKg5+bXs/8F98aVNp8OA6s
	 /uQ9fUFvlx4cWIg/72eKk9LGG+6d1y+u4oCyc+xu9+HN70skgh4aMgPqiDFD47Bjz4Kse
	 h2FvnRqLweaBIuyXQnD4f/wV4Ed23SYk+Dq63/JjsZ4FK63COO8lWb+Q5oI6KMvdr2dX0
	 Pv2vKwj+NEs90+DR5qbQ9DX8R9qvI5JgI8BAvxlbpJa+Odvo7BtskHzj/deb/+/rQHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0Eb6Ynp;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB39E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0Eb6Ynp
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2849709137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494292; x=1795099092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=D0Eb6Ynp9HKAeCp0G2praxIjM8tGXhe/OXR2jowV/goVWHrEcR9ibfzL4hOos94hq2
         pwf96NuqpOhVJ2OiMIIglAA7vWCc7s7PBowGKNaCNFZy1ZAxHq4KpBr0Nbsz1Ve5BJlQ
         dBCaNBTrMwVILpufvCf6+0wPbC1bZ5sabqocxWby67ZkS9pHH8n8vkh+ZLU6vqNwgeA/
         Ihx+flmKvs4Bs+3ETP0EwoJfeJ9RYZW8QkreSqep8VnklsShf46++JZqoQYAyOEALWKT
         qJOVvqR2kTv+YJIpTEnru1dqNiS5eAxQ3FvELKr0TsXD8kUZpAvNEbne3CqY8qoWtAaW
         Dt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494292; x=1795099092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=XGx9nMEnV+300pcwDIiuj9j32Auo6AqGsKFqdCrLiPfB+5CQR3xF/JOxPVmkfsbTx7
         JW3rJij96LMySa7YbAdgAoPCbDzkAzr2vHqFX+P+01tmPuHZhKeBxbDLwstjST5f2R8A
         FVwUQamSm+DPxndhozaPTjWBk7Pu4+qAlYCrOwy5PuB/me3HclHuGI2VcbrqEJFgOwA1
         XGgGhcyWdqAfl8zAUDln9oeelItPSzxr0xQv6vH7W6jrXwhJNq9N+Wdgjf+Jyuo8Mhxh
         +8RnsvrnMkOszxinSItVFXAB+fLb39t766akJUaU59XpGn6t1Zx8/J79NGftI0kFf91d
         2YxA==
X-Forwarded-Encrypted: i=1; AL+hErHy8Y0VVNdoTWegmKevoNICP24R7qxpbmI2L8/gJecc/WTfiKTF/4grZWXn5yioBpgD68GCDtZM3ASjzMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VMW9jwaPvKssA0FkjXvvHEvilATx8AiMtBCBQLBVfO5ihQr2O
	QYiS0swh5gMEkVvz29IblOK6c2QeHmbaLSsRAyvlUKwlx5Hd8xSoUP9P0aPBDCDn
X-Gm-Gg: AYBFou34idFm9VdrXBlOsgPwWavgofxQlpgVybQYkGGMp3jCe2MEpcq6gclt6Tn/QMi
	lWVwN/i9DLaJ36oGndBccCRfeYNN0g4My7+tt3TKXBFkkAuVI3e7DmkmQm/iXoJj/PevHaQDR1v
	YzLE3kLP7MdbjAxVkt16EgNE17RJuxqnRWb8hMKRtt9ULW4ijLShzzEq+I4fMnGzlqVZD2vseXZ
	Rw9RWv+C5+ST0mgmvDNlxjYf24pPE+JTPqhZAw4bJWWpSLuWHtxz+RGusaZvLePb/8QVICKboDg
	YPXQeUki+lbom8JKWRazA9s5BDMIdJ/KZ8U3IJr8YRkFJBKypdyQxNfcyVwUza03dDK5HaH/j3D
	+auUuo8+xdwgSEqtQltfB+W6MxtKujiZhfYvBGbZYgB8mWm67Clt6OiziDU3rBogvuxls9ZJMSr
	1FPP0ya3NdOeXCDV00tkT1RCZhYtfKqbb8pHnTICwxRLYOxkQc+vint4slHkPnw311IyAxO2afs
	kqyl30J8/pPGe3bR9REyibhxS9XRlPoLUaCFFJ10oZNUaUIUJGbklw7i9pBFBaNXZICzzH/dsqA
	SCq7aBr90+SqQkKhdPtorfH07TGTbZ4qL2aMGBQKnk4CRuuRZ2uK0gc=
X-Received: by 2002:a05:6102:50a0:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d5060e8bdamr2572164137.28.1794494291617;
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:33 -0300
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
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
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=979;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=w8xV5uoMa8cD2NlGBmwvt8C0f0XkYqYIH4XfKMrB858=;
 b=fGueRKxvIo0asCUZ/33z0mlbmgMfn6W3MWKV8yD/ZkS8nSzPp6aaqZlzCeST6DLUIrWLorE9q
 OB3V6+2IU4QAr5am7I8Qmrf8KBbMoeyEU8gkWEXU6B/a5GtEeX6VV9z
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b6..392e019e7ffc8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,6 +1607,7 @@ properties:
           - enum:
               - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
               - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+              - toradex,aquila-imx95-lotus  # Aquila iMX95 Module on Lotus Board
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 

-- 
2.43.0


Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE374E80C5
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232113; cv=none; b=qerXAP8SNOts6nlyW6NgSeDZvMN2D2HQ8d+pROHQ4D0+tsAK+SO6HpEBtqAXcnVULgjays222/5alaHfLMfW96v+EqcYRUXYYHMAGcwqb3XcLVmdxsW9814jsDGCIKZlN4pzpkRVUU0/bfFwPBajqQPYR7rwc+L7kvsf3t3rV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232113; c=relaxed/simple;
	bh=rF6rQofzYRml/5wBil+Xn0JDP3ogfFhOy5WOAz38e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVPQrpNVepNeXOVeySXlb+inuBAHfVi1Nt6SsGImzMajo/NWh0Ncs5H2ywa/k237FJcshWFmYkMT1BwYiRZwovavzg6Eo+nDb3JNy5xp2if+v4T+mEoeB9zn1HYxYh+83MMXjlF7VI5h/sICqWMqigTpcg0QtXKciaxlKQaMYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfkpBWi3; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfkpBWi3"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af82ce3c83so3350046a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232102; x=1791836902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=gfkpBWi3J0c3eoKs0MAu4EHoj1EcHALK9P9EqhjFAEzwgyj46pyqSu72DtmE6QrD3F
         2L88vjqMsGJMq0qP10Kg/ayVuAoMr5yVCWEzpDBeOGcn0JtJ0J7DtRgoPcy8Gek8NTLl
         vjKWu1Nfa5aaUzOOB2EjsFj70H96KGKc3W/AzF57VKC+1llsMOzaTe+ZlD1rULxPN0QQ
         GBp1wVFQ1rw8CZodnUAkxSPXLQa73ef4d+f7TlqE421I9AHgT0bsqa3+g5X+jdBtpfaQ
         vF8N7QeJjTD16o4OUiP9UHdh6SJzHKJSuq7suWWGP/e8ydIK3/L6eR02hQLWRcgHVh8A
         TiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232102; x=1791836902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/C9tWh0XAUTo7k5jKf93sgNA+uT1YvSZ7hoHgaGa7c=;
        b=GiSP4tWcQr69hemFD8C8BPNuSv1YbMdtw2Ps2Yqo4UybDKNzE6QGh9gB3t2kFAZvhh
         UH9K+jy8U76IuaZsAUZ3B9cjjiS5ff/qKNAUNau5TO6la19jBD/jOYZjEat8sXnbfi9Y
         VoSQ7y/EWUDmWh0pCicFc+KzvXbvml3bE6BYjdO7bvZQRbc5u7l+EvgDzM3+0m7zY3ct
         t34S+5vylEb1SRrnO5Ug+qgRo0/AjDPwyghuuUrLRTc20CoygH7jhbIFmXZfT0BwhApM
         bwQynomzLts16sv07tcbPwjIYiaPSB6+yo3sj/HpNGg3vAWqWml5RJ4tbZjRvyYHHp/m
         0qng==
X-Forwarded-Encrypted: i=1; AKwUvBwBBjkWy1py8CL8Lp7trhOwJFagMFpKupAyiVQUnexz+Hx695AmGfKunl5LF+awaweXcJh831LFvTnCkuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2ole+i5jddFJa0K93yBgLYZKqNVZ3ye7oRw0eCQpowv7/la28
	Si2zJ5ruJSZS3C/bIDulBLPidLOBXD96R3G2v0SQnUHJk3lLfP0DUDM+
X-Gm-Gg: AYBFou2N/Z/Oak4TVXExajmL3UVm1RMMUbgbe+aTtkvlC6uv5rNw2mVyrxIUgV7cbK1
	04sKxi8oyiBTxrq5CLlNwZ9szztfo8geIU9DpAInJ395bQGBoiGNVDY/PSi7FHUKttBjLJMZKNa
	rHa0ibSokfWydKXsJVMWJnBsOlYZx8wFuM6frCwi2xdXy0PUt1J1D1ZKQ/UO1F9Z9bVxKlDjAYf
	7FbAMTAYh7vsilDvaeS4FWdOc9oeJyxpwp+yYV55K6l3DUyai6wwlcdZrMPyNd76Igr1BLE3TKl
	BBS5d+LyDoOWvls1zFx4F7AnbEhs02FleFeV7oc3if7YH1Fc4CoT9utGGXR1pTMOgeQxEfEVQ19
	P9DsvQcb8uMqYNbK+b9dgmRLt4wBHKig1ZE+VoCbHoodiZDGxKv2KSCLWkoIkmRLOX0BndcT/PO
	pHJ3WKagH/GE5d2mhADLTyiHDyBKk4lpVCeIntRR8vIYR7e8AleExZcCnsVFR+ppIBLSg3leCVS
	6sZJyR9UZItbuj03Y6ie2I/IJrYnlw6
X-Received: by 2002:a05:6402:518f:b0:6ac:afa2:ca25 with SMTP id 4fb4d7f45d1cf-6af9e03a239mr9940306a12.6.1791232102025;
        Mon, 05 Oct 2026 13:28:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:21 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/11] dt-bindings: i2c: mv64xxx: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:27 +0100
Message-ID: <20261005202731.153971-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 controller follows the existing Allwinner variant.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index c4efcef59133..d3b6f7668621 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,suniv-f1c100s-i2c
               - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-b288-i2c
               - allwinner,sun8i-a83t-i2c
               - allwinner,sun8i-v536-i2c
               - allwinner,sun50i-a64-i2c
-- 
2.52.0


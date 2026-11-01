Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523485;
	b=pCSUma9MN6nJob9u/3LLyzbuU3nKYP/mB7yBA1pxWHq1b1uluw5SaKfWG9KQKlqUsvfk
	 2ZtkXOwlTREbbFRzvOZal58wWUgrjJ+nKOKv4xgj6p3WhYYvO1hAZ95qFZaRB1gn4F6Pw
	 E8d2dR7W/KAzldV7EVvrnbBgiodilvw00fEy5ZnPt1+3nLD2NdsP+3rrs6lFG5b+Kq7t6
	 nnuYQaTsvHekYZcrsBdCLRlaYkOg0j12FCwTyYvkwJJ2jl7YGIP+vL/MMd8FDb/rR/08N
	 0FZLGWG4ry0h6jM6SNVrAP2JfVjXfSP+9G30rFOU1tb3ohuwNvrqulFqBDjZB9hivjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
	b=1IPqBJl1knsFl/NtujiaGzSOBpFp5aKzTjYBTqehciH+KJKfa8TqZ7wtlWDcONmuzuL2
	 ia/g6BFgICdjQ9Lcz5I2hNHW6EcTEpy+Q2RWXaEFzP1efX+pJ7XDGAitz2K3HMFqpH4lg
	 Mvk03+sVjxA45SLybCUINRUQznuMalfioQ5XgpLeOFUFZrz3o6Uzt2VMhMpTH7duhzA33
	 r+6bD/L/J5xkR6ecufrwEG44uGqDfNaiCjQngJLd09RFCbOiouhRaZRolIpBQT5lZhFFT
	 v5/vpGK7TMWB9dT8MIS2Y4e9+fbRXj4z2diCoS/cOpEKiUNPJ/8vC6X2WKjw7VKXI7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRo00caE;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6A606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRo00caE
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso883211a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523484; x=1794128284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=eRo00caEAA8rj6+l5Bu5Jc2g4+TFLr+qVTLLsEacL+VvWPq3nQT5uidI//kEG1X6AN
         ALB6N/Dejw5zTQMs3pC5Ep4mnepw+HIn3/C5/Ii9dMowT3XEQEKy5YOhMco6YZTRvEaD
         fuq4gRntGElfuwD0hPpOYZslqzwBj+tBnrMJjBz9KmGX0OhMtQtcxoywWe5Ib6VEKHJm
         wz2jMdkWM730MAAJgSAAkWLneDbWa1/Fr1KsYgA6HQNXfNZw8dCB5FuFZq2rivZBYhny
         OZGr7IG7ZknbEm1YWfwaq4l5NqBxAZUviaOcpC0YcmZj2Q4GLJ+IOleYWybme0w/e6Dr
         JKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523484; x=1794128284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=nJCy2LjLTl+1jAwaez5/rAKRt/xmHtvjtHLbSh2chi0Baq1JML0ue/dLeqheox3KAT
         urrtjdPGR20zurSsPrb/51voZsOhlw5F1/iLrVgai9FsFm2QRHCYRWklCysGhoz9zmCh
         XqiPU1WYXDbFcYpq1JITaXdE7D3EIlLfwst0AbXJ7ET7hF0fRmqma/QVq1zp87p276SK
         fio+EZ5KbRxtsCaL6ZGmSwgP1Bj0kWExEPrrMrfdNGHMKrJ1TVzPlqw5GipKRs8nLTJV
         f+iShM/sOBJEnCrcQg8CJxZifpTvbGvi7smjTul8z5biRzcciVT9YInSeM0TfZ+u5H2Y
         2ZNg==
X-Forwarded-Encrypted: i=1; AKwUvBwHRA4a1vdUo+Uh3amqIYvKnQWR7Rw0TIuwqFkOT5rykwhArjr0H6PMLsnJLarnnFiVlTd3f3yVl9ZJDnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+51txuL7SrTpbB9BKCpYTuSR+JA5a8ouPqZK4bmCueXzdIlEqO
	K14d7Yq5UE0w6JeJ6FTjQ3rCMf8/Ldmg3r/DnPV6XWf9UJDKdWqHGwS4
X-Gm-Gg: AYBFou0r9NKOiP49dP05MJ2Bb+/LV1JzmMXmo/1F1H5wxsB+4ymZpJptt1D/okQKpg4
	GSE0qM75g7wKeSKO1JDZgGolJr+jLkOSrYfe9b9rxhgi3frOQ+b0NlArNWqOf8o6w8Br0uHuNWB
	A20LWdE4wczPUqJeIkJJCy1QN53fef/lQF9RovooHIV3Nx9hGPixmwhNgW1NwD0JVCFCKKjplk6
	yHoDvURNPCwZUbpGY/vADF07utf0WVxm29032QYIDtDqt8lN17JGxdKcKyt+bpR9a2Dyu2dIhwm
	2u3ob5eF/wWmj6YRj32SWlaf5nLlOemqiU48vzvSJAtb2EuVY0mnlFONzcq7yYtpuk6qWhdCbvw
	NE+NlhWj2K6SavAa7eI+mcsYFl0yNGNtxpYJ3ZgjlFxmsGSKVhLDdp3iMrT3vKYVgmJao35g79k
	uttrvfX9WjvOuNtrdcLySKO56y0csZqqCESI+zrG1O0bR22TnTlFde8zPLijnuQaBCX3GG7uAHm
	mZoGcYcqjaDCJRhJwom8AZlm0KMGIgq6N+dbx+qtFUoBAf+CdfPe0KTf6MmDCUDOd8gxy84zpzA
	SQIdg9FiAQbemiEJOk9n4oQi4DP1t2YF4+VV7xG0WvMCa5w+uKHWIuuMGrqYGRDg
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr5921922a91.4.1793523483673;
        Sun, 01 Nov 2026 01:58:03 -0700 (PDT)
Received: from arch.localdomain (123202092027.ctinets.com. [123.202.92.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14385693a91.0.2026.11.01.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:58:02 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: bq25703a: fix input current limit default
Date: Sun,  1 Nov 2026 16:57:52 +0800
Message-ID: <20261101085754.277830-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
states that "The default current limit is 3.3 A", while the binding
documents 3.25 A.

Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
which the driver falls back to when input-current-limit-microamp is
absent, so the binding and the driver now agree.

Fixes: 76bc2203a46e ("dt-bindings: mfd: ti,bq25703a: Add TI BQ25703A Charger")
Link: https://www.ti.com/lit/ds/symlink/bq25703a.pdf
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index 3bc07f25d063..607873e270b4 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -88,7 +88,7 @@ allOf:
         input-current-limit-microamp:
           minimum: 50000
           maximum: 6400000
-          default: 3250000
+          default: 3300000
         regulators:
           properties:
             vbus:
-- 
2.56.0


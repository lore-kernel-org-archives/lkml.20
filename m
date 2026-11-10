Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340389;
	b=ES+t0Q0uOoEEFWsEyeW5glwEam/2MTMBidjCJ7557XWNHY7NygVRwq/rQCHsqQ0EqSTO
	 kLETYx9T+J+rhIIluTHSX6jCerx1JiI3evTR/xnKVkWvXtvwsRjNuVWrxGwo33c0BkM/v
	 Za/2Z/YRznLJnWdu2aoH2JjIa0q3NC0LJ5Zx4PjLZWoDQhIxv1Nzq4CWUF7e26ttGbric
	 /vUjRN1LcCtnrz9LJe5sQGCtHcCWaFGVQRcz8oRpXaiuDDQkfTgZdGgim7ByZ8qrv/bF4
	 yI+6t3lG82ZXEDem3243uMO7L2M+ikz2Gtti2BuJXgkqQpx2qgdmXBMSJgf/Hkma9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
	b=K5Ru+vzq1E99I2pK1TYJjabcVXFaSshRsEPAwM/HrHD6KXgyQelTs9NDLGdxyTbVjcxL
	 xuQNqNIP2EFPsEYQg8nrhkBbf3OS3EM7hoYB+NVoES5qxBKPfOpvoslpQl0Br2/nWqclg
	 EIsAyB399ncVmgKHZsfEfKO0SStZ1nfNa4w6ivvixNah2vTsY1gWycQF4HHmaORcwj4c/
	 FlMLcSU6S+UxcbbNDcKWZKBoYYlTl/xf4mkNAnRHuBx4klNue/gOLMDq6EeHIsQrYbMyF
	 pfx9YpVHbUOUyYf9d7NbwWVqph5VrXU3IxaPY5P5ObueOajluriOLYjchBjueHYMQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J5l/iCaV";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2E8606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2E8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5l/iCaV
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dc4797082so346275eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340388; x=1794945188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
        b=J5l/iCaVj/L6+H5ov0FJz0p5e7rr/0JFjFNg7uedGUKahcImhk04lcJf3uhwT0M0Wx
         Vdol1OBCMzAk29mjfTm2OsVU+4DTDUFwFn+Mvrgeltauje0W9PLJGF4ekFehP4dnkzYD
         IVOj7AymgQYccUhEnl30tCvV4bNcnRJutdtvWpkt0Pngwv1UYqdyRA38OZ+cvKMs/pTn
         aAASDx8K1kuzF9HiC2SoTBBH6b0T7m3Uhmv9i/80vu+sPXSgH8Wr5ka/RUwgudqE2jQk
         nOWOT7jHUS3tYWwMpMH1ADpcH4eKjRHfKvfgInH9/eXZs9Tu9n/hV2SEXKfNlwQLB4o6
         4n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340388; x=1794945188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQt7z0kPgD+299qyKsfe02moLDWp4KMca7T3a3EzzP0=;
        b=ptNsneBIcAtZpwl426hKUsQuCyDzVu5yLsx0FI1GNyNDyIXUy8DoRobjfO9lE7ZUxm
         BfVNcOPdArOzaBmZFjXcSn+zqrBbvTKC1J/7qhG0RSROsMTFCV+d7FNed1/KhMGm44ym
         8y2G9RouD9JRWtHJkgoGLl7aktCUjfaFwpI5UautNXGM/LG9eXVmEu00w1WwhQNBa6se
         eXqIGjcvycpxsqjiSGmDqWBrAEv/Prh9GGqH2EeRnx0Xgz30c9zbwk1RkzY6KJb4spmg
         nT7zBKFTUUkUBLhuasmpLF0Gux1pzZjBFQnyNdcMxfNcJU94giRozaMMSPP9vYg4GtIW
         032A==
X-Forwarded-Encrypted: i=1; AL+hErEZiDBQhAioINyh//VlLTtYzoH5l4FTanbMNJoPky3Pq2/woeRGNfTnFArph/yCjVzHsn3nru2+lK9ljII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0WADpm/PvCg98ukVYFzZkXnJ8tJbHQL/cg7LymPvluGgsxW3X
	heVj2bADicGFOrL/m1V8Br9uaUhwLRJy3lAMWlMqJVT6Mwx+C3bfxsQbFZghjQ==
X-Gm-Gg: AYBFou2QzZubSDDWLor3rPXfOzfocXiAyYWLqyeYKWvNc7OJ5pktPTyE6mgago6uSvY
	Agw4/0uxiEhX12y0Utk/ZjfrcHsIKl725K50K12vSGUYDBTaxYjPm9XwUtVMjBFLAOQOeJ4aheu
	35HQ0s1CIaqdQhvvh8W8aeee9Bfc+seVoCrJdDUg/l0Wse2ZBZ1h6jDHvABQ1KfRU/JNpBwvkts
	Im3OkiwV6BIcbNAFCvZdGz3iLN1PEguFjHKG4ztN9Yd4nxiZO5USLmhPm6Ce6T/CusuUeT9z7V7
	rXERZEbtaAx4FDyXmybo2e3Hl8C9StuHBRU7DU7FEKXz4EuwI/64QO1MJw2/feoHAyPgKuULqSs
	yHmaFxGkW1c8Y950OScGlxyPKx96jHgwSHjl+ff1wNZqIwzq7y+aAWaYjQgbYIzZfw+Ky7VQ4+K
	1ssHl/kfyyrV9j1bQqmZfV71mMcnvlO5ocnHMm390TV5bwsW+4+xtEyenJPyXUE/FKGpTZkOSJA
	zm6rOPIoau2TGrJGrwmpU3vam6Ua+NFB41IlbBPHCOHb7yKxBJ2EflMI83lNk/aaNgDNoc7SLLv
	JrnTScOeBk3dPTLLoswBW8ehkUtQe1FmzD5yNqP0
X-Received: by 2002:a05:7300:e9d9:10b0:36a:143d:98db with SMTP id 5a478bee46e88-376854ba2demr670711eec.1.1794340388437;
        Tue, 10 Nov 2026 11:53:08 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:53:07 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:35 +0530
Subject: [PATCH 5/7] ARM: dts: ti: omap: am335x: add board compatibles for
 nano and pdu001
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
Message-Id: <20261111-ti-omap-dts-fix-v1-5-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1304;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=iiiNe2YmgDYbJuXDc3R3d+03XUkBIvy8dBS58FXrgXs=;
 b=3u7NS6WDKuDRZlRdtola0QbBGcSKerNcA9rN/jByJq2Q0w1OdePF/XoqfXao4Mamf79AFSdGW
 5uP5Q5J6ezrA2Hjww7BldT8zzJ+v6WtM/bFkXGXzO0NbIN7HGejeqPy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

am335x-nano.dts and am335x-pdu001.dts only specify the SoC compatible
"ti,am33xx", causing dtbs_check warnings. Add board specific
"newflow,am335x-nanobone" for the Newflow NanoBone and "eets,pdu001" for
the EETS PDU001.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-nano.dts   | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
index d51cdd6e1ab40..40e60e0abaa87 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
@@ -8,7 +8,7 @@
 
 / {
 	model = "Newflow AM335x NanoBone";
-	compatible = "ti,am33xx";
+	compatible = "newflow,am335x-nanobone", "ti,am33xx";
 
 	cpus {
 		cpu@0 {
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index 9f611debc2090..c36e1b7922c9c 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -18,7 +18,7 @@
 
 / {
 	model = "EETS,PDU001";
-	compatible = "ti,am33xx";
+	compatible = "eets,pdu001", "ti,am33xx";
 
 	chosen {
 		stdout-path = "serial3:115200n8";

-- 
2.56.0


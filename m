Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175069;
	b=wIOBqvm9KlDuyqhdzn+SPd12O527qnwxBPk7KHMkILuFRHa+KkDZeVETpRzdX5ak/1O9
	 tly+qabzYws7shcNedb9o43MlLCC4/rLlLDqMhSUZh79GjKLmJ9bfV8KULOkplvKZoymV
	 nAPbLh+5RxLEkWaI7WPmfqkrywz6pp5LINOLcgVxfUte9mZkOuErRdSq5ozH3S6CHISg5
	 rQGFnSNMfh56CsF18HO5i7KItHWEEX2BaRcZN7jZtRMkWJN5v/JcfkPuX1I/pA9lkB869
	 wfBqpMvc62U3gzvSytWoN4WzykfkguGZdlRlHAe1xlakZ/b1pem0LTMA8Babjp2P9EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
	b=XlWrHynaGDtIxSyxrMjx7eZan9IXl6HyTU/NHQ1HuwNc5QAAw2JvR21hvmeHA68x2ev4
	 fCr00FOlY6s8XcAelm6RArkLHNYkSgoUUvolCfJsFDt/P6hS1YoIb3EN/qRJ0U+rGSc50
	 /WjNVtmUjlSidbHSB/IgO/EkB8JamjNeQYhcvId0hdg8loKDu2GTrL9E7pGPM8Xmnr19C
	 Aiiz3b2Cl6VZ5n/ZxXp5Qu7UBBHPkpwW/AHguLQU5NsF1m73/yDi7G0Q30phxGdL3wSXu
	 goKgQRqxEIwe2fyYxy9KtGMksyq24X49QbKn3O/r5Y+MhOINPR4rtfvBNpkp+JralvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB1606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AB1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+4hqDev
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so206984a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175068; x=1794779868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=l+4hqDevVqPDmyPVmJXMFgwoBBedr+Pp7izQJcKTkuT39n4zCq6+mRX1ImEs2AOP2T
         oWTKx86o3IAS07Ip4U5tc6jYEwAHWPG/EO8wzpg+PNxh/mDPZCZRRqNcntxJ/xr9ZwsG
         p0b4MumJjGCyEpcb/xTNEeaseSPMyP/DhwlrYxdMijLAKrLFYtAnj9qMuWvOTsTBq/dG
         bkyJmPjGVHFNW4dPMZDlRKGwdakOCx3GfmsFVIr8LyyDzsFJKXbhhbDi9DDq1scsV9ZM
         aFmvnp0xAFEkBuuE33Ad5TJCbu/1Calqgp3gvCaXOVmZEAbOraQzmTkuORshr2wxPYmC
         wSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175068; x=1794779868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyS5UId07S/P0XVdwD+qagOLSX4Ppdf3Pa4ETDTv2/Y=;
        b=xajubjKD6yKJulrc9xr2jkoElQcPIS7IhbteZBY45yg5wk4KGuDnmCl164A8kom8AD
         1O1SSsZHqLF4F0Pqjz9C3lLmZcXIDbluPR0yV1SjhriGsdaDNVR1Szc8s3fCGChfhX5K
         Go3OuFuBewippHYd+drlhFDPLMrB0ZOTktnIwFKxDuXzOEW4Ot0wcsCSl8hXS2/6dYLf
         qKb+Y/Ald5+L6W9XjEfBLXXqWewF2+uEjfdsrGAVOAFSJMZRpauPscJ4MyKHMb/9bc75
         3eQgOEWB9ITh3y6IPXRqX7ivorWUDRVoayMRmlMZscnSgTcRp7DO89b+4f7E2chaaPTp
         nEFQ==
X-Forwarded-Encrypted: i=1; AL+hErFRpIQ9MrimfbUthAkZXdfoLfAsAKEqE5YsxGTphPg/zrGieI1HgGp/nf+RUdIB0DG1KKQ88VNFH7Fse/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Sc0zlThbAH+auaLULDZjkE0yL2T4PHzV3OR0D2+cUhH3KqrT
	2WJJqpjDa0TWkN+9KS8f+q2Wnv1ZGM1MsyoHx4gyvL+BgmfQU0gQQaOq
X-Gm-Gg: AYBFou2ZHA+aWwQ4qWA91w+HZFZ/2H7vjRSHMnii36oogLgTjfOxwNRayGzTmXMuHlO
	Dt8Vi1+1kANUXkXIWOQA58J8U93eWd66pFAH3SkT/HZgKWJpqzeuQGy+wZma8C6LY2L0PecQfFB
	0aYageDhgp3V8zdgQUxr0S1LpfA124xjLXlR9yNgVe3lI+ERAISQJs7uKjAMxo1g5H7RT3RXMnM
	yry9m6KN9nccQE/02EJkr7Dc77DyIDuQsLd3cPLmMnt3qN40wPKI5TQFE2nkw7u3IBL9HZAqGHm
	O2LiHF/kD5ZIK/15xJTxfEiktFbBPf9i2O/i8XvlyXpXJwdYLekPXt3ZPvlhS6V/XS9pV29tNFu
	La8zI7u68Ib0eQ765I2n2z2acDaRYOXz3wuCBqp354dFBinjdDJyUWj1cFNmwraBU2hgk/tTmgN
	KcnaB/uzhQ3/AhPmdrF7lRLzZf4XYBdWOXp0X3SOeWjKsXKub3mW1kWHwnEgS+yAx3VHutiCeO1
	psytGD2cd2bJgfBCZwADtmqE2UVkquHetGJmhFswQWZrPBlvMrynXpZQcrpczCuy1UdENiqpH0/
	1EiyLsTzjlYw1z3ptSTEFVeGAbSzPNqSIhsddyN7vuS5VQrcZewp9dYeLTb4KWJ8yMFrg2T8FiX
	FxiQUQX3TOj/ZEo5AJF03yZ2syn/z0ZMFeV50hTwiN2uwwvi2TEJPqkyswXuwiPxfCyfeV/QMPp
	QmMQ==
X-Received: by 2002:a17:90a:ae0e:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b13598f942mr1243857a91.53.1794175068525;
        Sun, 08 Nov 2026 13:57:48 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm5692976a91.9.2026.11.08.13.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:57:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: allow shared write buffer interrupts
Date: Sun,  8 Nov 2026 13:57:36 -0800
Message-ID: <20261108215738.113582-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108215738.113582-1-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
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

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but write to DDR through different write buffers. Document
that such an interrupt is listed once for each write buffer, and that
all of them are flushed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
index ab32a91af4c4..becec88061d7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.yaml
@@ -29,7 +29,10 @@ properties:
     const: 1
 
   qca,ddr-wb-channel-interrupts:
-    description: List of interrupts needing a write buffer flush
+    description:
+      List of interrupts needing a write buffer flush. An interrupt shared by
+      several devices that use different write buffers is listed once for
+      each of them, and all of their write buffers are flushed.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   qca,ddr-wb-channels:
-- 
2.56.0


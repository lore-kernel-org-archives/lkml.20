Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF048259C9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962573; cv=none; b=j3gzjjW8YX1EW0EYrGS5eE3S7uL4ruzIkPRw47Iu0Qzjvs6RVAKHInIxo3TV9s36jfItLQbxqNkOMMln8CwgWB2xg3M2WGSh55yg4oLZ8ATGAxiHHAjh058i2146dQn5Y3oDI0WONMLWPqsy+6Pz11Fvr2lG0Frw8mhN7F6cXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962573; c=relaxed/simple;
	bh=Yj6xdx/HfplobMGFe74RJ/xg4KvP/tPVQp9tLz96PiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5amhAXcpbhs0/I22qR+xbzo/zgJSu5KI6cm9dvlloidrTBlOKtU0z4V+o/klrJWCod1uBT2VaQH8iEK2de4DVQT6ZhC5bd5beQvaEhbjwsELyw7+S+e2vhDOdCi1jpI2bhVcIrK/6oTEk+K1QguRgjy3CTITiLAKia5RlpBivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihA+asoi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihA+asoi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso88840f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962570; x=1792567370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09lg+c/R4s/y8iNO4IclaAxHsHOS/zunqEudLnO820k=;
        b=ihA+asoiHdKsh22CiuVQz0X9GO9IVjDaKrMrkRZGK4bNFilsgjumrvd0IqccRTvKsR
         jI3424C1kBPnJef4vPZTsr7Cjqbe4J5GvYBuJTurK6vaIDZ2vvtevSbQD4LQMYuA8vuG
         svGRqDu22SjV3dZAD8y2Xks3UtplU2ek25LnXL11qD/qLE6Awj5rwnBm15gGrccB0aGh
         Kkdm2T3J4QEaFKTW+mDhOr97pX3A2ZfEPKZyGqNvgLfjRby1LpT+vv+4IhDCkjRGWKZp
         x3GzwylMLiKwwBVNpKUbCjk1s0djitQTQGYUxlOpkcXC7lc8Dy53uIYvaEgLhKVA2Y3M
         3FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962570; x=1792567370;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09lg+c/R4s/y8iNO4IclaAxHsHOS/zunqEudLnO820k=;
        b=Ft8GzwO8nteVJnN92BBeEjIsJj5tLRMPOqUJS+ow6weiRpiJCEnClmDg17oNn2CkeS
         XXUYaMXKE+OajlIp/W3x+FZjD8lvZfsNH8g7SKCxweGW779CHzGKdT6PXFdHrdCJqIYx
         eVkeLkheSr9SLtJ1s+swHDqc70LorEr68CKsKUhNmoaYfh+ZEVMdrL5N/j5VE99m/F/g
         qG5WtuU1G9MvmUoJOnOvz4IZ/vr0DWIcbIaG/W3CjVaBqFuxn7Ot+EYWGDk/+QMnquTh
         duumc41uqW59LMhv5MslkGD8dTCjNUQPJMfqZH4Z5x9v8/UfGeWZesQ8I/SZK5Zzpp7J
         AGjw==
X-Forwarded-Encrypted: i=1; AKwUvBxAWarz4jdSfW4+4l27t6gQKl+TBBAWw+a7tsGKs0Bdxm361pSfoCGGPM7ujwyhrUS8eBF2pDhYXzPq5Z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEWgOdEdoonH+ZATyVodDyw08unDvvaNevOP70G0e8HeHfWnYc
	ne9ZvChy7LrPMWXbslk/W0PcUHRDFYPlI/7MfCz76yiL6k6fHgAzaljKyUMfVrh6hBXCnw==
X-Gm-Gg: AYBFou3xppl4kqVTEHIQYVin53Vq2+evE359XuEbVcA4ZPpNu/LLgvgZ/MCMkoidi7C
	9wsdI6BNgPctMrQMbItUPC+i6l3TqyzCZktbDcGFwwy7X7pOF3VxoXiUlHcylTHh3R1S9Aqi7SR
	m2SGXhsMmbJkfTiZplGTnDGcZlXrgB3gFBwO/YzHfCv9UEowME7cIsVrNXSeluNCF6ucSZiM+1I
	7njL+0eBEnP9gD8Ejormlu5hW4xPYFw7lkTL+cnwvTUEoNqyCcGEnthnOyQmZ3XGPFUJgg2e23e
	eMrbu2Mz4CsRes6BxT/N5ajU0Ml2UjDeUHTrYK7kOGSvhBOjCaFNMQGKR8wCuIxyVRfLd+zld5s
	TfoilHnD4FEOwsA5+GvgU+IClU9eWSxH+rWfnrTAZ5i5QpDp8pVIfOrW4rq4moSQzBRSQT5PKUj
	1wf/7lFgGEZq8EUCsUEe9UEJfG9wzZiyMR+3cvPEyRfLR2XoVOZXBoVJSZebjgQi1PhTKu4xZKA
	NmVvaULaLiGtIW+RVFg0XkU4cStpmlyRU0vwpMoH9YTt1/B8FeyaH2/wa7D7Fx9lRnNy6QbhO7x
	XQT/4+YQY/RHTyIR5rO0QSvGF+NS/jnAoiWQzTg8ir/kT5tcyKrls1S1mNSQ4A0=
X-Received: by 2002:a05:6000:290a:b0:48b:910:35c3 with SMTP id ffacd0b85a97d-48dbaaefeddmr28879154f8f.35.1791962570140;
        Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with Stefan Doesinger
Date: Wed, 14 Oct 2026 08:20:41 +0100
Message-ID: <20261014072109.1759502-2-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unify the ARM/ZTE ZX SoC entries under ARM/ZTE ZX SOC SUPPORT with
Stefan Doesinger and Navid Ghahremani as co-maintainers, covering
both ZX29 and ZX279128S platforms.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 MAINTAINERS | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f72b4ac27..b806d1fc1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3894,14 +3894,37 @@ F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
 F:	drivers/video/fbdev/wmt_ge_rops.*
 
-ARM/ZTE ZX29 SOC SUPPORT
+ARM/ZTE ZX SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+M:	Navid Ghahremani <ghahramani.navid@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Odd fixes
+S:	Maintained
 F:	Documentation/arch/arm/zte/
+F:	Documentation/devicetree/bindings/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx*
+F:	Documentation/devicetree/bindings/gpio/zte,zx*
+F:	Documentation/devicetree/bindings/net/zte,zx*
+F:	Documentation/devicetree/bindings/pci/zte,zx*
+F:	Documentation/devicetree/bindings/phy/zte,zx*
+F:	Documentation/devicetree/bindings/reset/zte,zx*
+F:	Documentation/devicetree/bindings/spi/zte,zx*
+F:	Documentation/devicetree/bindings/usb/zte,zx*
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
+F:	drivers/gpio/gpio-zx*
+F:	drivers/net/ethernet/zte/
+F:	drivers/net/mdio/mdio-zx*
+F:	drivers/net/phy/sanechips.c
+F:	drivers/pci/controller/dwc/pcie-zx*
+F:	drivers/phy/phy-zx*
+F:	drivers/reset/reset-zx*
+F:	drivers/spi/spi-zx*
+F:	include/dt-bindings/clock/zte,zx*
+F:	include/dt-bindings/reset/zte,zx*
+
+
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
-- 
2.55.0


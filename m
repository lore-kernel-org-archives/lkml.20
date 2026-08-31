Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F66E38AC78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219166; cv=none; b=KTmmaJ5TSmzMS1/cXnO9yVqr2pKtWF3TwKOJR5u0sNnk9o+oCBQJ2Ie5R3A/FeD76V2RV4VV7z35kzv5ujQ/wQR4Wsa517YtQ/z+ORJofN18e1cvhOdxkKaUVOuqAHk85NKKZS+SxHepYEYOnwYZWh85m8EgqFa6rknCKe3rC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219166; c=relaxed/simple;
	bh=Ov1XS8DApdBbDQSgMBsd28dUz5gN2fFzFBLSEH/vge0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gaf7/evly5CegTmVJ0qcvASW+1NnmIk64KzLxHH8OZa6y3g9PTQMCY5JayCpB56qxj7pzVL/dhLUfqxawdU8khy16cabYAT5SXVawCqztPr0dfCasn4CAfNVtjHc8pztJ5RZ+hEeuhmsZjhhZfra1CcUCX/dVskuWSldto9QuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C33+DvCe; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C33+DvCe"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso623906a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219164; x=1788823964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=C33+DvCervdweT/hy5f/jxZFpS+V4bysQhf6NNB2Zsl8bcJYAxlx+ZSfR+lsjEhbL6
         iNc1wQp81YMogjS5+jbx0wwkavq3nWvpgKs68ue/GCzf4ujXBwWBGaV/giPNM41H/LSQ
         XHrpQ2loHPtURPxrWupm0/x0Iyp99b/UmgGigLj6wxR5UPE0IBmr9K9ZLz2lUhlWLTXY
         ZZU4CF+T/3TPJv5iSDNzzs9JqNC0zAIgLt5uWMgTqfZU3fMmHosnPCK8ucV6HUVWvYhm
         z3l9m3LDTMZrIAv7LFyAruPXb1VjP5xDa9E6+QiuMqYQ5/LyDoyFfA1S3RPndC9gEuJQ
         Jhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219164; x=1788823964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=CTHOqq2Uvh2FMATKj6aLPWyLJ/3+aUyQoIhh9QhcccygzyOqRMwVWacnulbox3b+9M
         o4i9Xf3YJVFH+DzT82m2bx3gpilCiSWeHn28S3OQ1ingOFS5r/kjiZ7RxD3R+nrobQet
         Vv1KtrXvH8/94UMbKQ9z8OkKzdHWbGTBwujhODHcGBVZBXTO3JYCwYKKDTdMP7ul97IW
         a3EhO0dDOtHFM1+MFJgYF5Fk2RD4lme3kx70DvJNv0/CMkZ2oCXpTzmlUJi8R9WY7MtY
         zUkJeQilM+hblCWgEZoV51C1WFNKhI70DIMynEoyB3KapgJP3uFgKWMR3jJ9VEXnaW+K
         qG0A==
X-Forwarded-Encrypted: i=1; AHgh+RoQAqHH2Jvglaa7FjvHb/IfzCQRAlRVgN25WOC1x9uHr0KjQ9PFpaQeyzaA62Ss0gdT6C8dS81WY9oGdi4=@vger.kernel.org
X-Gm-Message-State: AFuF++khESpdDaXVjqEdK3YPF2YobQQJZ7OqPTXfANJ4c82f2ypr2vg9
	TajcqS22/SnPFssN/HYH9CYtW62qmrS7R/Db0Gcfy/ws9iU2MuRz8JlL
X-Gm-Gg: AR+sD12hXOexMR0PJtjMb24Ii96drLu4FWdKGQCr9lMIVPFOdI3hItlMIycddNQSTBC
	ZRrAxgH3I9Jf3X+iMixO8CgbDhTJLIeiD67deXls3l56rjE2aYzcUMN9+IeWRJUMsuGCYtmgNOD
	doTL3otYhAX004xS11VZoxdI8lQwwNlNFXygu4gECBW57isrmJYRXyS5YnswTLFX+wGpIlCoRKC
	IXaqvpMwXGKaChsCqeOQg7Jvmi1ycDaMMeM/RGsTwewl/Lo6p+6s67FJnpvc7c2trd2a1eYvkym
	dD2g6g/h4qChRWdWAsjt6466puEsRbDyHv9+3YzPkcWiFgLFnvD/kA+iZE2Eh+J1Eh7Zfdf97U0
	hgzcWDNQRDhEP9ZQob254jJgz2wHFAz4u7Age85iDD45RIYwO/e03hhCY1Rrvjq8M8XshKNMY9e
	d84W2O9nPwrJwzjjt25Ea/HGMvFWTiuKyrPSnmCI89YItJyjKO3K5P0pl4hiRbH8Z9dohJ2GPcc
	TFORFwuxw==
X-Received: by 2002:a05:6a00:7184:b0:848:3dbd:5cb0 with SMTP id d2e1a72fcca58-8562a9d1974mr17519520b3a.2.1788219164559;
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:02:10 +0530
Subject: [PATCH v4 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-davinci-spi-v4-1-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
In-Reply-To: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=1130;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Ov1XS8DApdBbDQSgMBsd28dUz5gN2fFzFBLSEH/vge0=;
 b=RsRpTBLy3yqoifFU8DccNs4yKt7uU56pAIiuHzQJ3ZZRgfW1Q+CUuuf3yBQY9SEWIv+CIaKdA
 Xp+rIiEgzJgBysl95QtZif3vt6VyvLSBpPM09IPN9+JMtYL8uSlnw5W
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0


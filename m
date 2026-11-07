Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031554;
	b=vCB3N59y6vQNYjdPau5NWfmS50UyWrXl9l4q5p3ai0EKNgsWixHHS8MgnRE6Rxq13dk6
	 mxUixtjeocFHf2b8lq5+ubsGTHvSimkF/z/7H/PEhl8VwQ6vyUjAkHGmmvx1uDi+0oO9v
	 zQWEm8Olo1+uU7S7wo1fvcVYG3ykC/BvQdYoSLMOvgPuAILGAZzQFptXTf/0Sjp0rl0Vv
	 yXMgG1qAB6WwUeANBLS6Vvtfm9qaTuJFVcxyhLv6wsd9VvYW9XN+rf1uAN15N0NnzB4u2
	 glKT4eRlO2JfaOIHhIjUtDrIf0ksiEwxFko1+vAdbMWQf116R87QCRKx5/+53ISZyTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
	b=CT/I4c9DFG8sOOx42umkbAgogRSq01OlWz2UeIdUdrnltaBRIUmAQNuGDz2/7kAHdQrq
	 omDJ0M61k7pd3hjOR2bRZ1nJ1KtwtOci+q+JhtiQ1H/+O45O3bHCvSzfkdcorMbKfaA8u
	 bWvUmHL9ZToTONA0pwl1gSO4COE4SDRiY5mZ8oQoFOGssVwsON/PCFMKz6FEX4mXa7DZB
	 UvmG8MbCxcTnfaSJNR+Fed4cKk4yDyHABseXcG2XHefvcsWCoSHHeYruYlPnfFoFWoqoR
	 LAbYt3p9S/X1RIz+PcvdM26b60BzaE4wu6//MgAYzcarx9WhWdOsgOTLX/oyh/HB81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+jcvQ5D;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4308606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4308606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+jcvQ5D
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b2382bf051so628827b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031553; x=1794636353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=q+jcvQ5DkMT8aE78L34gxuy8aXCHC7uUuvUXxH04Cfy55sJ/qK9Apb+lwuW+cu2cSQ
         Vrjtv1DOhTHg2dvx1bM6MqvE/VZ+L85bxdc9f03AtqyQlB8oTJpASFABx/fMasluVL+L
         1A4R5pYoE488cGTinYVmsA3KfM4S+ZLAxHi+/uysykpzyatKjh4TmwaABCGd5hKMBv5b
         n7J4+tIEOvOVg9yxGfafzq9wLoYr4wxf4IevZhnKot858WOXRt3+fYB8QpCygEbagqNv
         GL9cmrIOHzttso8mIpT9wXY3U9fw+xGn5FIrf0UA4rn1Zr924S00b13HB+IJszww6OHf
         rTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031553; x=1794636353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkFDcS6ihm3QPilltMV71tLbM4fsnU6mSyPVCXhKIRs=;
        b=HK9NHZnEBkEQmfz6TAZFKnXXnkulMXutwAIw1so+vs2RAfkDRLncgWJWQ/DxOJydVy
         SSwsNSe126jXJRQXivGKrpklDmmxqAuXWXEYUwawh+sHUOn9I2MWB7OOtf5SydciP+vC
         KIZhkbwqKaqF+3wzSbCggBdii/g3jguAJHmuRK901/6ZKipQRdBjuqSN9TKyehkiRC+6
         r5sD8+s/kYjjHcAfsrFHBN7fw5aFDUQsGu/J8IDYYMM/DwYoID9R86LPVzWfU+IUzdCo
         bSFc1crrHE9e7GbMj0DPtUDJgCw6IuGgRCsn0BsMoVqAE8BhUmdIfpUWFmTGrwdULXjY
         +n/w==
X-Forwarded-Encrypted: i=1; AKwUvBynpMKIpavYaC8b1eiBbz3NMnqGEA5Vb5R5TonyOPjNeIOqHU/+AgdsZ3+oxu3ZkDxnQcDm7xttO7CD7Xk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P07h4Lvvr84kWXNALb78XFikzFkNCTbVR512PFt42bNuSm5g6
	A+fIHFXVXczrfN89ylusukQ/apqQmTCx8YyJyxpq9ekT3RFGbFwxSTVU
X-Gm-Gg: AYBFou3jbaEyciJN4W2W1qaHIikdJWv/AU0VxOy3jY+zmr7msC+JxwWte7Yiwx7Byb0
	0EJvUJmk8MkFlN46PuwPr2LIcupiEhA6sZlLNJj4q8V3sJXIjqEQseBTJ8xa8cVJjMnDT6itSbz
	qIaCd4jkJA3OSpZTBYVobAk5o2u3fpaPKnapbgB0AAeZp9XOk8IouOcm4lCarI1n4MQtr4Lgwc1
	3UpJomgHZv/RAzL41mMg+kMxNesv+9yOW9SDBZym0218dZa6WCuO9FPqSKKU30SAVfxqOiS2jDr
	rBb0oh6dLC52hoLvCyO319L+OZ/bLEU5McDVX+qIb582yyVW/ThvFypO8QpDS6aepV7sb51+sH6
	5HYcTyWBtrmn8Sw50Fyhot125uyluZWYBTfuxJ0s9grsIsQ8waOdXfA/Jfsd7BMIgWjkGzN+xyR
	9j6MrpCFo9ud6AnnHTrfQZwLg8T4aQivn6CUpF4mBblEp5bwmR8fv56KpVG/LgxFTks8AtMakle
	7+Lxqf1TukB2CjXFJ89I+GEA9bVtVSyUmgfNDORdq6WxXuBSus0M4ry1X2331UahXtQehmSqo6b
	eVpNBdrUilZJrlYrNGj1CsRtCa0nRZxguYNakJ+bavma1EfmsM+q+5j5EIPKAnsk
X-Received: by 2002:a05:6a00:4605:b0:8a0:6414:a54c with SMTP id d2e1a72fcca58-8b37b4781dfmr4725632b3a.32.1794031553173;
        Fri, 06 Nov 2026 22:05:53 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm1176326b3a.31.2026.11.06.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:05:52 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:05:49 -0600
Message-ID: <20261107060549.598466-1-artem122novak@gmail.com>
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

The Synology DS212 Device Tree lists "synology,ds212pv10" twice
in its compatible property. The corresponding Kirkwood binding
also repeats this entry.

Remove the duplicate from both the Device Tree and its binding
so that the documented compatible sequence contains only unique
identifiers.

The compatible ordering is otherwise unchanged.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066..bca7f98df 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d..8b5af5122 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0


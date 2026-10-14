Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BBC483BCD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962589; cv=none; b=KJybHwxjVwi/dC+lzIftbKI2SFbKXrjCA9JQ9SqfwTtWWD243SzkB3I2J+c+9BQ9FtyVKPk3R3oR5AAhNFVplSDjgHNsZn3nWiYPkm8J797huWO5xzHZWg8nXKXR+zB+tRJ/4TbkcYJ1IHWLJpjrF4OnN9F1KOWleV/qTE030DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962589; c=relaxed/simple;
	bh=bClARkP3Hs4Gxz7luBgLwLm/lw+NPl5INSd06yJOZNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHWjVnDKjf6RYNooioWZd8YOoPJsKvqeZOBaC2vEOEw1/dDWyq0sBLH9ulXzjvXyWJfV8TVqD9x3y8KTwM0C3kc6NIWa8BdNRqU+cVoTI7Eig/5Ed7cQzVLppGuqCtYCuDzzSnaxXzqfERsf2Tw1LLdCkc1Pxh0C83ESCubA/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ru2/2ncR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru2/2ncR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c14a06c95so2919232f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962581; x=1792567381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=Ru2/2ncRDqm8VYUFjiRgDEP7f3IUC9NGihKw8UqrRsZ2yzLYxT+Dgdw7sAcME5ZbRh
         TGkeuCI1z10De7yxKE2T3FUAO3S8ytkaRjVDF06a4Anyq1riQUEvVjrw0SwUNfBCAZz8
         LbwbI+zSadlkt29MmI7esZHctrWjtHHOzZxwItyvcead1puKJ9Bg+0lj4Yz1So3+Xep8
         mJXw3StQY7A3IE7V+C7zmwpc//GbgVx77RRb6CJdh+uchdCoEGeSHm1oaC24A6qGa0gi
         hcEP9qu3rK7ud3IU+uAig75YUgiZTQFoQPleFXHpFZSZM+GN54sA8iSOpy9LJzIe4z8v
         bZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962581; x=1792567381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fpPs3I9x88FPkLwyMiDotfchIunSLV8Gp3fGeRLE/I=;
        b=1c0PqNW73cI39stTKjHnT+bX/JU2k+j6YDBkx1KDVTGMAIEJ5O4naPnH9/kasJm2/X
         /kZT4gqpV3TUfB8SnoMuSO0Pbxhw34DNdRalx4n5zpQ09sfScraIPlej74I7grtb0M9/
         +ooa82egZPrtSW+aHA+/V3EE2KsCluACAQ9Os+gVzegzWtm37xBc3+nimh62ker6f5fl
         M29iX23vy9DWKsrNZ0Qsy1qZm32wtRTlBsrRnX41DMh4lHcjTko0tFika/ZFR5N+fJPM
         TYzrwbL7+ZcgeNhMKQuM4xUV41lR9aM9bXIBArRRCuLzHRmNqRG4Eb5fGfcPjL3kPbLH
         kmKg==
X-Forwarded-Encrypted: i=1; AKwUvByf4XZZ4zvcg6UjFxdenc4gW3He3vIrGBaSlrQo4Ll7c6N/Tq/LYkbmzh+pOPoyHcIao+FUpadkylvNDSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnSN2TNJN6Uv5gKWoSv4hhMx093pPvR9tSYU0ZMvr7rNfk/4sB
	zA4TUBIEuUaueFaPkqCcYWFdEtD4G/0izVeh97qUd2+X9K4YXiW686xD
X-Gm-Gg: AYBFou2H52oBEf8laiZOFRKse2aXfAEsP2j3Uij3hJERpmpRJW5gHfjONTVjQfRMyJE
	92QTlinm1e1lwd/xYMsdt1VuXqzPrjcUAFLmHcE+2uKbcbBb+Br+qGBOuzSaxWJ0a6hjoZ0VFTt
	ZyydKgtSquu0v6nBMn/p1Gv7gfihACbkggmoFZ3iVlAFH0Z+896kGnu4oAoq7sNuGPTqTJyoWOQ
	6JMYZwa0IOtqOayitSR2FAjm/44C6rzRNCX9CF+B7XN7zFzzjLdKAlhSPlxtHS2N1HYTvEL4Cnv
	vcTXZkX6FwwYHa+66F3WllfttH20+L3oPwFxcHG7ARvxzA1G69sn2FCqegLqBuIjO0PnFI2NIl3
	8B13WYxTPP68PPQQoS11kYcjZL0ucXsukXeuoP3GC2h9lmhWXpEHCw5ABQdZ3vPMYnW1DG3Sxcz
	UsJRojasRGm7lN36OiMEdA97q9xjdb5sD2VkV0HvAKxZP0wtnFIUQoRN/gz35bOEq+IyHUX8Jro
	czRY9fL9zceCgttrF9PVMABvK7A85t8Wd3FFhpKvNtrsd+rp4KTgS+gTNvi+BDzvVSz3ESdckwA
	6HP0qSDRrRzvUH7w2HNxyxoiXKr2/LI2WGzdkrwDNBJVxQ/ZsDkRB9Afu0uu7A==
X-Received: by 2002:a05:6000:4b05:b0:48b:60d:2b28 with SMTP id ffacd0b85a97d-48dbacdd339mr26410465f8f.39.1791962581434;
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/24] dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
Date: Wed, 14 Oct 2026 08:20:49 +0100
Message-ID: <20261014072109.1759502-10-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pinctrl-single for the verified PCIe and external-PHY bit selections
without guessing the unverified field layout.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index afe7329a1d..bd57b41f1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,7 @@ properties:
               - ti,omap4-padconf
               - ti,omap5-padconf
               - ti,j7200-padconf
+              - zte,zx279128s-pinmux
           - const: pinctrl-single
       - items:
           - enum:
-- 
2.55.0


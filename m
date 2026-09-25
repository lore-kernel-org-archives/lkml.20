Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786494D9576
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360714; cv=none; b=dohTmb0DqQfsqMTLJelS1BOsS6x+nVU24tFLfKUD3MngT1fiV6rOOLzUx1Jc8uKjp8JDD828Yx5SiF0uXzYEgM6ySpij7wrckB6ybxXL/y7guuKAirEgOwOV8zGjvUsYTnarRwUrpYLyLJ/MjK6obyCwzRsGheNPzQXULPYN25k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360714; c=relaxed/simple;
	bh=GkosBV7eR2cJr014Lh9fIn7r1IkJ3NflQjoKUGN78wY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txNyY5ziDcD7B5yIw+OTGrcqM4S3RWieBm80pm5BkpD0Rrtb+Gf0bIpKla2bOs1uxRYAOYjfYKn8Ev1NDXr7DkJKRjcC10yzuaEaaJa+DllCQQBng8UHAf/Un8/qWNW2K9E3RT/q+LI8C8qkiYCd50VLQ9z2dOYrn5fvscYyBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9PAPQLe; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9PAPQLe"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so6547925e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360709; x=1790965509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=L9PAPQLevW9kDC1OlkRnwPTKb8Zkz2t4Pk0Cx0wZLLp9xLZ5gzBVZXychj49PdZZ6p
         KueeK4LN/LQqRy99Zz8427MkYPw5u+n4pdedIxbf9SYDY8tfaTxK/p6GTlyBpti5gAqG
         zC73qnYnaxh/y1sO4FEcZy8KON5JbJYeCGyYpErxOu6p4l4QdVRstoscsKCIsxUu+k6g
         SEe/BdbNv3QC8zkcEIjipRZduyUJlEuaTem8JMe2Cyzm8Se73lY57xBbVqO9nIH2b+3b
         dLZ0MHZYPzFeUG2cCNbIrJSvPr7vVqSFjmAQHMf6uzqIr1lBxc49uOcobRjVYXQIao9D
         TFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360709; x=1790965509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iwRhMt+5vac5hO6j1jom6ApG+G2j4KoZScdlfZjmEqs=;
        b=PMzj4cE2tLqz+mNkMKANU2zxktTbwFCjx2CuIQA4ZrQ6VlX45m+Sq7jCn2H3EzZRFi
         zWRTCR36GxjU6o3t2q9LY8d85VDXq+QBzX8aXn/hCbSGId3S8RSjvnmCu3rDc6UAZHvX
         BVg2+aEmA3Cx4eSd8IcbB9LSQ4iqYvOj/Pt6YDG3BRCUdcIBOLlfdCOKaFnvokmPLOju
         YvmnSvQMkT2bTWTQfM2trKbJ7CBs3SrRBeEpEp2XpPWENq71iJrrUeEF99jda/U27Nuz
         lpYxYc5KIA1ZidPDVsZneATQA1wr/ia0qYMNXh9WJHUMEx4P7UNbpoJZ6W4mCbfHW1TM
         bAhA==
X-Forwarded-Encrypted: i=1; AKwUvBxa/SU42XN9kYTxzlw8fpE/RHBzyvhRQXZXZvyVd0dyd6Pp3CkZOA9R2j5eFwvSlVD6S/gJ8kEQ04HUfoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mMz+I3hHrR8a4kFHv6spzE5oJiRFXHFa7m8YmjWy8Oshr7ois6
	8AzSIe47+0UO7hT+bPruCeKIC1HoOeg2KVueVayt3mgo2zk2Wbp5t09E
X-Gm-Gg: AYBFou2Q30gAx8jpvveL1HKhDAtGDBSabPYUNQ2OTKZTHIadEiac71eaY/c7ff51Hc7
	bDYGq53K/lrLJhB+7eCwxtFb2/Oqh7k4mqR2XV6xCmUFRm+BsbcK389iC3t0HagvC5Gt/CguCEh
	EbiB7a8Svju73aa82eOIFYmbeHUa0p9gVOU92ttVA4ipdRJ2Iu/4JUfmg29ms+g2jGI1+rwtWic
	JVdfzaGAOmkLv/1h31ue2OI3EEWfrvfozLDKm+GJkpk463UrDEpNepeZuWyC17FWUF/6aCGcFRv
	z61wOoU7zORmPZyqtGz/H1ZbfMTwRRtfDxVPssRRMd9m2QKJuuo4YSPN/3pKfKlfyonk9BeidlY
	REujcK9wdjVoVs31Myb/XfMnfpATaHwjX5Rt4eW2p+yWP3DZgm33430Jupkxgb82+B9rWrDPeTo
	3/q5/DUVTezcML3VASH4P1ArpthE+XIPreUdDDzAPO3jhU5Xv/HSGSSMTkz/eDX7WtZUHmT63sK
	pORrwz8VWfVO5Bh5hXSgkjPR7oeOHyrNHZhtAd4iVF8VYCjTsOF8LH3orjw90ta
X-Received: by 2002:a05:600c:4704:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49fe66ee908mr111606035e9.23.1790360709128;
        Fri, 25 Sep 2026 11:25:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v23 7/9] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Fri, 25 Sep 2026 20:24:29 +0200
Message-ID: <20260925182435.21207-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..f6749933aa0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,6 +759,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.55.0


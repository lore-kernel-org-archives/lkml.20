Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD619515894
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983957; cv=none; b=jPSjsjWp/5gbhBO12FepoPIw8UlFoHdHAW0gxErpbzJ63Cw/EWnR4+yWJrRUe/SSo5/IHftiVcaVWL9wF6tQiUZE8EvC4BTDthfAnf38jTz0IQtSw2lDISZMLi7JtV1abmGt4aj2r4pJuqQJtIuScXUbgnJErENgCsArJJCdouE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983957; c=relaxed/simple;
	bh=wCSHkmpmqNds19gvHTj2g8eLK1v77hJYzp6d27iq/I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IskwoVtWH9BrYJuQrbPgofHXsZcAe18MzZ/6JL8xA6gTaEVmxmagnNQOxJupZYm0mQmV0YFAh1jq3FNQ8l4yk4NV2s50rxKb58jd0S4WosPJyoCw9bXuylZcPP+vZgb7OeQEpzWTN/02jh+CwWu2iNJDBDrh4uhsx0L9+wG7CYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+IAe1kE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+IAe1kE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso29902685e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983953; x=1792588753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=Z+IAe1kE8/3Nkjw8lPdz1EUArIVRhKOCLIYU9svGalcW68F4eWZmWPRPA09vHQyUdk
         YHIRN8KmIuUZDGikVUwLW48srtI48t5VuladhwBmnpg0k3qDIdRVYcIbz5YcBblzO0T2
         qMSpSfLxEmTgTsEUBt6ZM7FZtSrsRMobm65nfHPZ0wBwfLLronnlMdIg/4IxKwVKdfXZ
         HSKzs33CF22Tbj7Dlz9DKJ+tfMTOiM+FOtKiUf3LOZbh5NEQiUnP2BK3iH1+96gcRkUx
         B01+9VQng3/02VdZfGyjDf2DedEaHUULqkQ9wzaqJgC2HXWEAem8UAl3SiCLFnhS1okR
         A8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983953; x=1792588753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=F2soJwkmwoF/BUv680MMvkOkp265jBD4JVN2ZvSquRLSiFdZa9mzG7a78Jm1Fw61qN
         x8AawNgtHBha9y848nynYSovWu1l+viwas4DOo/VLnfDVzlfZnyIT1+BZZiRk3uRdpPE
         QcYOscn629JWdxDt/+2K068d79v1vPwv151UmZ4IncqhD/sA8gwRsdV/1lNuwKx3AXCI
         GyUAVFLX7jh8974YPSP5We7YVZE+rl6PaC/9jdl6xLX3zctLxdu+B1i87WzBvynAM8Dy
         Uf7Mp4QHqcWwMOvpbvhpGE9f4Ph4mXwbzaFa4K04bUWQAUdlBmKwFSzlFI813ZSzefiz
         oL9A==
X-Forwarded-Encrypted: i=1; AKwUvBzqpvbQHd556V6+/IyHuyCyXc3j0jXIN2Ql6HBCXmIhTtW2kcOlt3u8k8uABsrN+9xq0e11VMMeOD56EJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlAewm4TDi9WpJwSSGCTQD66YLlAp9tzZG5Jz74vL5oFc73eYm
	kq0CfjJ29gbeP/9UAbtnqUwFhe91PWjFiThey6OnxR8nRDqP5AUlu19H
X-Gm-Gg: AYBFou3MJDVjxYyQkkt1HYEtUjPSpVObD1Es2wwW+00iA2f4aMvuzYzvR/rezqDOSDi
	vUpeK2QakEXYU26zXFoQ8FFHsr0lfWVzkf0xI1i+PlGqei1rZXf+F3thZfHILWKjhLtxdVemuR9
	r977SeHs+uagFoKv49XsAtCvGTlp8vsOKVSVR0YTuSMwFkFTAJJEO76fhV7MA01uS4NwHDl3qdZ
	0aM6wteKVyZZH94rUwuBfswCLJDmv5BTqoFcyzmd94eMn131FeMn9WDryH2cqiXuRKKA3XFiw8o
	rnl3KVXMlTVRBSt3npTVnWKKzEu4AjrQD6UEE88J+78zsM1jjDWjWeIzRlynyF7E6meMRp+xR2m
	EJZh7UVvW413Bl6BY3EqrWATubFcrpLyWlnmenojFApn9k2F8yj4MUQwmVIRd8oZ5AkQJnmC0bG
	6gpMmSMauDJ1mJsFDphBxjlJtbXuYeoBb8/lwZR5dGtKCh3QziWiRVAj24jyX8iMU41RoVqxPWc
	QB+U6Fp7T8Io1Yr4++jj7FSdSq9MnytbYgOD5ICP4p1OiFwbErLnjWn29/EQ71JPeobPwQTxqMx
	DK8hc0EWrFRni2JK/kiomrpDGrAN
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr289780235e9.21.1791983952579;
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 01/13] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Wed, 14 Oct 2026 14:18:49 +0100
Message-ID: <20261014131906.990077-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.55.0


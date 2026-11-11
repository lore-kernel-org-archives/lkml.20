Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359240;
	b=jgNLBHwjMIXwEQig8ZHE78xUp3JSFUm1KRcdmoErFTuNxnAMCRSwLQg3/rrk1WzciJDJ
	 ZGtcYg53DXY5qslSa/0mqVP5Q7U2c5xdoFBY2YfEBqVo7B9rRjXU6DLk0xf/6uPjpDGsc
	 bSMloF8kRe2gR8u8pIZsZIGY/Guz/P6XbHmuiTYQI31/FnKhtHbPn1get9Pv+KK5b9rBI
	 +jbwNZ8F9JCSFhptIsmlD7eLi7fjjt8uNzBRMtFUbRp7zD2OAvoO8BsRhm4HBoR0rduju
	 EqehUf8sk49bL86f3V7LTFwqYYz+LYR/RxGgAB2D60ArFv9q145Wyoam1BzrFmH2e+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=az9gLR2CIWHo3AVLRcdFpGDfb4bNdsqdJahroZfhtgk=;
	b=NiMpcjoA+fi3rLwEgNo+jY83Ehb/Uqry5imMPe09vy+HQEcGkKGc7E/unbBhAOsRdM1e
	 +qduHUC4pSxs17TDERhxfi/9guG5INQwnWeb/86cEvR/Smh9lt6c1ijod2QAaFRlGq387
	 YsKdQ8su3w93e1S7iCDIwEz+/YqwiPwY0JSZvlk/2qqdtB/hc2+jde1EcykCAr63JwVfW
	 HqcXbw55wzg1kMnAfNylCmgTnzRos633WobOyJX5BGlKLCMAMRk0W6VOUJCvTF+hPumnB
	 VKYqS/YJTR51R3RA1hURzbkwzgpxKz1ejkXqienWf62lz1MZZVUyGXSPFcfXBBk9okQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTnOSLD9;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15DAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTnOSLD9
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1693744a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359239; x=1794964039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=az9gLR2CIWHo3AVLRcdFpGDfb4bNdsqdJahroZfhtgk=;
        b=mTnOSLD9tLnLfdQ5QuiVTJeC/UYpdhTm9yNMlFEcLtz3lo1+qKFmyyDeRh8Qgvxh3Z
         s2hFnHYcGqAZP7zc2M2PuiRiMY5l4dAqoWwT958tfdlrLyPAyRor0czIwppkLGNl6x0h
         Tpkza+cnDD4fKhI9ku5XS2rXj3TUmSU2863iXthliMV5MIdYgtONEN3nWZIk1Voe+RL1
         CDKMAoIOtUG4mqEs3KmDrl4NVwSeOKL8XaJNZDiNE4lGkSaKdRE8+c/ZL7v6e8oK/uMd
         sGYNjTo0FOcPgHhYWUgLgEYpPeTg60b6cI/myYyoUn3VN5V+O5xwum1njvXKdMLw2Ndl
         0IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359239; x=1794964039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=az9gLR2CIWHo3AVLRcdFpGDfb4bNdsqdJahroZfhtgk=;
        b=qRwYDZOlXPxA1BjSZeYTQjK1O5/XF15qzINxUBV1X9NCZy8xp2b1dCUxD+3hhqFhn9
         qgbcX8jPOJXQDifNr/t1r8hiOqJCFc+2jdzHhZk34q3fGfNvlH4jfnXV33Z7zEyuFI1G
         D3LJ5dvvSRpXnYCD1UZcbDF7GFrDxxmBqChUDm/xXDJiC25pnSnVi/PZuVSuKsYTVoV/
         jUXpNmW2pzPqEg5NTuHKm9QeIkHlD+Z4gmiLuvFZiEJXEZb/9qyUPMVYLf503OQx4rkt
         FeKqmj+4nTP2Q6r7cF0oDXyg4j+gfkSZTPgKANrY3Y9TBXG5k9417/isezurKIRahT5W
         xNHQ==
X-Forwarded-Encrypted: i=1; AL+hErE1o4E3Xax+4ZYq5zx9WsQ1a6ZEY2J07fQl7fpMCMUscHyDTep2dOm1WLZDho8iG2BprBHBfaxzpzVUgSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TwbdW47YG5jZbgZfhdniaNChRXWAtl9RIPbOSjAmNJBWbwHUz
	Cp8GP4EQtJqjwHtkhaPoA6X3wYh3oEa4qxsEDn1xvL18U3p6WmGKy8Ur13HQsGWvyLI=
X-Gm-Gg: AYBFou2YMTwHQCrQhyFdA76wr39WG/h7qLC0r+baOK6yAoxB/hu6VF+O8G6LY548XvR
	UF4LXTrfewaeP48/GylqxkAgz2xE2cNFACjOQOaoGvYMV4rlamfvb7VNzp+tfln8jXKox7jGugn
	XIIgod2h4sch6awDfxUkGMNDE8UR+X2YHOe561KVFJyEk3DRkjCdK8NWOUmT58nOep9NRc5gfpM
	jE/uU4MVhmIqXApKCXYZRc29h21muCcTC3hoKxbgTTMWs649Lh8wzkFQES/tXRW6mrnRCFT8CNB
	/w5hU2hOkbkbaJsRUi7aiS+NAZTtZcfZ2/l23JYBmtJATAClAriCFrkGDpD2yznlCiaDK8fu/Wm
	/9wpWUVDwWbpMtN3hGM/l+veQGW2ySALhRC7AAwp4wnjWtX+asFcg8pc8Uw/SUqyk5tmDjZQdLH
	RXa75GJHsOdGWa48l3YRAdQZ/bJz8/+n07be+mHZronQj7rpr/5ayxTGxD/MksHo1ebsklXxzNP
	c7T0qR38XT9XYffkDy4EldWCx68uZs3tHvLjFJKzDTvG/xG9pKaRggSa1dn08tgCm7d7Fu2QNHJ
	vIF8vQP9oN+YrjMsgyu2UMJbG/m46nPnVHyf3lex5h5jVRnOt2eQUZW/WIFKvYHT
X-Received: by 2002:a17:90b:1c01:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b182f8c3e4mr721125a91.66.1794359239499;
        Tue, 10 Nov 2026 17:07:19 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm701711a91.1.2026.11.10.17.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:07:19 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	geert+renesas@glider.be
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 2/2] sh: sh7305: exclude from legacy CPG clock framework
Date: Tue, 10 Nov 2026 19:07:14 -0600
Message-ID: <20261111010714.227429-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111010714.227429-1-artem122novak@gmail.com>
References: <20261111010714.227429-1-artem122novak@gmail.com>
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

SH7305 now uses its own Common Clock Framework clock
implementation.

Exclude SH7305 from SH_CLK_CPG_LEGACY to prevent the
legacy CPG clock framework from being enabled for this
CPU subtype.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5ce7df11c3ec..c5cc486eb1a3 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -536,7 +536,7 @@ config SH_CLK_CPG_LEGACY
 	def_bool y if !CPU_SUBTYPE_SH7785 && !ARCH_SHMOBILE && \
 		      !CPU_SHX3 && !CPU_SUBTYPE_SH7757 && \
 		      !CPU_SUBTYPE_SH7734 && !CPU_SUBTYPE_SH7264 && \
-		      !CPU_SUBTYPE_SH7269
+		      !CPU_SUBTYPE_SH7269 && !CPU_SUBTYPE_SH7305
 
 endmenu
 
-- 
2.56.0


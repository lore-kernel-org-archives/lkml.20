Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866626;
	b=qM1xFGGATDIdBzVAEEvTNv7kHVu39wpx4q3asb5L/S79ipgTV+w5QfT9qOrRdiHiw/Cj
	 dterARx5HJmK6xgMYXs/G43c+CTTcQk8hTaikmgKdWQZk+PdrTplzDehbGPqZGJkjQB+P
	 ackmWPTlxfjTvA3Cf23A3jgyluVMGJ3wQb+/5zSsMiZUdzklK45nxnTA0QhBWenawM4VR
	 FeYG3u5bdbLQByYoqjChV+DK6A2k/I4uKz0bDjHH5vrm8jhaD0LWw5iM1Eu6m8IYTnm0/
	 nkdJAEL6kMzYSCS9U+XMAnjQ1QGBZHnDM2udhqoQ/+P+NXo+sb+DZ3OAeWeAQiezLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866626;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LB+H1KfzRZwbsIbgdOQxyz35ct4YMH+KJmEsb1/UgSU=;
	b=3fnacR4v2EKXqcdDXehUQI3YuMZBuyni6MlpTDaVVqB97KGpMyI2e+RNsEoNSVfhBsY7
	 diN60xeOyjF3uObY6AxhpCmPxajk2IATorA3fylft9lXKp9DTAaio+kYZ0H3Dg11ukR0W
	 +dFJbeKyULn+dXhckoP4/FSZ4w0SnugLu2a7bBw/GMfALH/VCrGgM8PyLRWXLrdeGEKNN
	 /QqkY1K61P/WWCOOOCBSGbWqsj3A15RFHCXFC+cDDlZ7ZEjOn0UjMOiClW25cPprwzY0S
	 hW4SAYxOYzdVlkJGVcT7oYTp73upS8sIIh6f7qizz+F5ELZVtw6v3nKsaF3zj7PBObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F90606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F90606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso2256804d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866625; x=1795471425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB+H1KfzRZwbsIbgdOQxyz35ct4YMH+KJmEsb1/UgSU=;
        b=FMxxwiNC8nyPac6eC0798yWv04B/6wmAHvK6+0g+UXGqx799UOY6rP0p9S3oFmQdnG
         5YY4GcJspVdZudhQc4WBkSKidvMuW1xdniZWztxFQJWTDkYqAzZvBp2PIp+oOTbkOgdx
         Nh7MrSZWfD2rWijoJ4y0bm8eVYgE3vaFMH2jPe7XKJ6coLvmZF5kTWnYPs9P9thkDIuj
         27BhbvJVchLc6RXlu5oy7NP3bysiiU8Bo+5uV8wWmQwpMXnSEJsy/+DTQqA0Bcl9255a
         egUoHxX7LRC7tilTumNMBOJ1DMfXeoLbDb/yEhNs3P+ES7qvm9I+65ZDn8yoWVpL4q5I
         cWew==
X-Forwarded-Encrypted: i=1; AL+hErHq/MTOddyy4KVKSx78/9/fgKSP1mSOZu0ROZC+3y2xJubFSiseH6gq3+LbgsHzcP/ZT/nucda/ecLJ/TE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HhSz61p2vXgcJ9SL8misEUHFmJHWyE/RecQ2vcEC00WxY7Af3
	o3VibUj2gSI/l/WmMTyKvA+B9mpyuWqY/xcWyE68gKdEKj8yvCxUGRKk
X-Gm-Gg: AZFdTZdfQ/z+tLL9eluPQTVDs42dFaLDOWlLJS0mYD9S2C/zwlzEx5ObsyR1zdI2ks3
	Hkgkw8VNDEf56Uxs6dop+O99LYIUhDgEAdfTFlAsFrvBxYHWKRZSvZ1K3eOkquZpRE0XQceir7Q
	dyZ6U+Uyx8094Tb4Ve5u5voYktpmra7zlGpjjB+XIXU9n5zBb3Ch8+Jqr8g7lM8L7PWLR72ta07
	uJkwEq9Xu28raxuRDx0TIFkXCRdOcHDsxMMp2HCrPAzQ2MRdEvIFt/jr9nwC+FeDjkfVqXz6IzZ
	8KTxhEbJ+nJk64PpqxAJLeDcOHdWve4lnwdw5ccsgPblxpjGTUgE9Xpkcm+QLHBrWaScIj/IKri
	xe7lR770kgu69ajuWf70HhmR0kwGLsNOB2DefryQMW5T/PTJwWzqYg3lx09O5BAKVWiCSUMEnrz
	Q0fzpm2MBOE/f2bu8xMvsWmZoxJWG8SMRkX7BjfFoS8lT3WKilLbe13K0voO8Ktapy9XFPPX6Qh
	f4AuRDEiJOMnkCM/w8vxQyLf2hn64hDk8z4K4ZkW3iT2A3CH/XQ6B+1J/ksMNjl1fFq5Usb2cpm
	cRps20m2JarkJHXb0aW5PaK5UP7CcSEcIx4ro5OqKFtaFXRCDGrLu8P3dFyGSq6WGW3kv/j3Azy
	gNeojrQvVG2RJZXmKR88P2K0soLHtAzXl
X-Received: by 2002:a05:690e:12c1:b0:67d:b0df:9095 with SMTP id 956f58d0204a3-67db0df9d3cmr2820810d50.126.1794866624543;
        Mon, 16 Nov 2026 14:03:44 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm11133078d50.21.2026.11.16.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:03:44 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:03:21 -0500
Subject: [PATCH 1/2] ASoC: ti: omap-mcbsp: Use all 8 bits of CLKGDV
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
Message-Id: <20261116-omap-mcbsp-tdm-slot-v1-1-6c9f7aa45a29@telaak.dev>
References: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
In-Reply-To: <20261116-omap-mcbsp-tdm-slot-v1-0-6c9f7aa45a29@telaak.dev>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

CLKGDV is bits 7:0 of SRGR1, as its comment says and as set_clkdiv()
intends with CLKGDV(0xff), but the macro masks the value with 0x7f, so
a divider above 128 is written modulo 128.

Mask with 0xff. The only set_clkdiv() user, omap3pandora, divides by 8,
so nothing changes for it; this lets the set_tdm_slot() support that
follows use dividers up to 256.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 sound/soc/ti/omap-mcbsp-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index da519ea1f303..324c5d7d431d 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -136,7 +136,7 @@ enum {
 #define XPHASE			BIT(15)
 
 /************************* McBSP SRGR1 bit definitions ************************/
-#define CLKGDV(value)		((value) & 0x7f)		/* Bits 0:7 */
+#define CLKGDV(value)		((value) & 0xff)		/* Bits 0:7 */
 #define FWID(value)		(((value) & 0xff) << 8)	/* Bits 8:15 */
 
 /************************* McBSP SRGR2 bit definitions ************************/

-- 
Git-155)


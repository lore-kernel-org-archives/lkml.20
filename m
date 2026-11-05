Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914147;
	b=gIPWGEjhdxDLupu2HYc9K+tR829xHpzjShyXUIHlNXHlYNIc9/Fzlwwp2ikOVY2bc7N3
	 DoFzyFkCm+d24SPdPm9+D8jfdU0n56xVsz97eYNtVmZBxyrKvXaR88JgQooUWvTke1eTL
	 pMbODYPPlqX8KqI64HY7CL/C0kzPh93yW7w+df4J/9s/ic2MvIU4joJSlpJYN7oOHR1d6
	 DtAcJgUtfZVvoK5wG7vMq5QPkFFdhqR3Ye8jr2e+q98CvZK7RTiC7/vSIOdvKAIp7h7SX
	 LVVIhKFvXoy9vv/58S+wA8RHYOhc2ps1K/4mZtPwsi6gQEeAMPvqAz020lod3MJsgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
	b=MNfLt71QIPAO1kXlD+SAeDCLNJvpMXc3N6kt+xTqyyIUFYKI+KHTZT9d/YS0rAMHf5pN
	 2mxrMj3JPVgsmCStQGZIqP2GYAfd9+u2pSZ1CXvs8hRYMuViYESiJQmGynltm5kKgZztY
	 lvRydtuFN1nWO2z94ll+avdNGw6dgkHDQj1k5TwbuwTgLd8+BTpV4lhJpf2nR8hn9ccn7
	 QagEhkU4V0XZPE8jCiBT0GlJAEctXTN1Pi6EbyM8tN6evy+ROJ2jlRsA/3WDtVXs2tOYW
	 vUmpGQKNGMCY2Zh/caE0zOEhX/+8tdVsQigijwyTcpNxAwEhFK3GVsgkpLQtut6dvjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZgl9DUY;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075D606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1075D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UZgl9DUY
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so75774c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793914146; x=1794518946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
        b=UZgl9DUYlYP8EDJO1Ds5xz6j3knFNMxbTW3/+Xtz3uqR0kFQ5nh/PqXeOjjoLwkRu4
         3kc7txV5vt10QODtSKEYilMg0QSOMEeg2aXkR8jYZpBCDXab+/+dCfENNKvtI+RAp05k
         6akx1suyM9tMxhov9aTCHf8mP8ZuSouMo59y8l2qMu7Z0UbUfYiP0EDq7Q54shz1TaQW
         iWsiHrDq41pE8Xe8K3fdl4WsFFvKbY4PG777qAmjs/AFxDkvLL1GgxzlltYn9s534VVe
         jjGBixHwJwRvQFdnRJEJMVErziC+L08DplFdvCUaSGBLmBhpSAC1Ei8ukWL9ORvxq/w0
         qHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914146; x=1794518946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
        b=k2YYRDKr2bFVV/fW6akykBwkDvARzTu9j5hYHE5kMAxKJ4iVSWETeqyTN/3IWmgebs
         aboNTTVa11LrCeCFQIdm1NovU0ifi0hO6JnTDD62t4EmH2+GRcdBW3+21gsi6tS0Aa9v
         SFWYMqUoL0CRpguMExNJxeAU2XPwyNuw1sguKz7PBckw7ybG2GH12Evr5AB1AuGhNPSr
         yoB4DzIB6JU5NSVasSCNUTaKbhG5CbBufbJFwW2fngaPQFlHca0vpSnmtg917nvzfBBU
         TUwDA7EDqe80L+9Bs9mcLTUXmtrGRuk/06+VAVi4Vqc0qX3i2OMoJ4Wwmn5alf08aKdx
         XeNA==
X-Forwarded-Encrypted: i=1; AKwUvBxsTuitKPkIIH9lerZQ1FFra2E591EB4ponSt7A1G4RR2gzLDHitfS+2L5C+NkXRehmeE5/Zgjkz+6o5Ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kfe5eOivv4kLgziPS462OesPkAOx+KIpj6ZRAC5qlDFoHT25x
	lbla3Auqca4iBgRRR35vvFv1HFwVqsAQAemhss0NUKFloYJOwjfjNcKT
X-Gm-Gg: AYBFou33TwiLSq9bOuwjl5+sdOfmHLPTpXOzX2cEDB8NiK4AxlzsaLB1xrtiim31oEf
	CT14IEtX95lTGTh2jsW0NXiHirfk4BqxQ7cXUzo/VR9GfIAUWRbHqmdeTaBihJzTNRIlnicKF6s
	no+RSWoJa2969FXKeZHzE53vaE3j4WCZPo3OAdlE+rHnrEcDbSZ17Yn9fWv/vKe2iMFE7sVdZ/S
	6/IFOsWCXtaWQztzo/olE9AjfMplZFJTI23xB2VtzWnbKrfDja9iExZ/cpPOfK6qf228pLbE2n9
	ieF+8ovlP+6uX9T+OXXUbzqG9Byco2LXU4g8+u3sVhoXKPnZdj/3RVimeFUbWasTvCvN0+lnn9s
	DHjr5coHfdb56BAvbbTcKl973srTKY22LYQjZQcAjfPl190HJYlkQkbWQksWY7lB+N6378hBTGg
	eMD+GehayXC5JWk/TNuSv917+uZMRwU4St02t1xNJukOEY0B+wMB/bmScdRzLcLFIlPKOATzuCZ
	aPPWdXChNjl75leuqeLMuwP4ry5tJI5cCF+dA7fAK9nF1nK9/YpSyg7PodWLvPrbS0SHiUnFAoO
	fpbQE1Yxjeb3BUC8fZMBuc7Fq2s=
X-Received: by 2002:a05:701b:464b:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b25d37e8a6mr261446c88.34.1793914145708;
        Thu, 05 Nov 2026 13:29:05 -0800 (PST)
Received: from kiss ([2602:feda:30:ae86:2cf:9dff:feba:f25b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm18149069c88.11.2026.11.05.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:29:05 -0800 (PST)
From: ZhangDM-520 <jixianqiang1540@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhangDM-520 <jixianqiang1540@gmail.com>
Subject: [PATCH] media: i2c: max96717: fix bitfield overflow in pinconf setter
Date: Fri,  6 Nov 2026 05:28:30 +0800
Message-ID: <20261105212830.445519-1-jixianqiang1540@gmail.com>
X-Mailer: git-send-email 2.56.0.341.gebdc087dc9
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

max96717_conf_pin_config_set_one() inverted the single-bit enable value
with a bitwise NOT, so disabling a pin passed ~en_val to field_prep().
For a one-bit field that value is 0xfffffffe or 0xffffffff, which no
longer fits the mask:

  field_prep: value too large for the field

The runtime shift masks the high bits, so a plain build is fine. Once
max96717_get_pin_config_reg() is inlined and both mask and en_val are
constant folded - which ThinLTO with an AutoFDO profile does - the
__BF_FIELD_CHECK_MASK() assertion in include/linux/bitfield.h fires and
the build dies in ld.lld:

  ld.lld: error: call to __compiletime_assert_550 marked
        "dontcall-error": field_prep: value too large for the field

Use logical NOT instead. All masks reaching this branch are single-bit
(GPIO_OUT_DIS, TX_EN, RX_EN, GPIO_OUT, TX_COMP_EN, RES_CFG), so the
resulting field value is identical at runtime and fits the field at
compile time.

Fixes: ea15bcd94f0f ("media: i2c: maxim-serdes: add MAX96717 driver")

Signed-off-by: ZhangDM-520 <jixianqiang1540@gmail.com>

---
 drivers/media/i2c/maxim-serdes/max96717.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

The failure needs a profile-guided or IPO build that folds
max96717_get_pin_config_reg() into its caller; it was hit by a distro kernel
built with CONFIG_AUTOFDO_CLANG and ThinLTO.

Reproducer:

  make O=/tmp/afdo LLVM=1 defconfig
  ./scripts/config --file /tmp/afdo/.config \
	-e MEDIA_SUPPORT -e MEDIA_CAMERA_SUPPORT -e VIDEO_DEV -e I2C -e PINCTRL \
	-e GENERIC_PINCONF -e GENERIC_PINCTRL_GROUPS -e GENERIC_PINMUX_FUNCTIONS \
	-e COMMON_CLK -e LTO_CLANG -e LTO_CLANG_THIN -e AUTOFDO_CLANG \
	-m VIDEO_MAXIM_SERDES -m VIDEO_MAX96717
  make O=/tmp/afdo LLVM=1 olddefconfig
  make O=/tmp/afdo LLVM=1 CLANG_AUTOFDO_PROFILE=/path/to/afdo.prof \
	drivers/media/i2c/maxim-serdes/max96717.o

Unpatched:

  ld.lld: error: call to __compiletime_assert_NNN marked "dontcall-error": field_prep: value too large for the field
  make[7]: *** [scripts/Makefile.build:290: drivers/media/i2c/maxim-serdes/max96717.o] Error 1

The index in the symbol name depends on the configuration. With this patch the
object compiles and drivers/media/i2c/maxim-serdes/ links max-serdes.o. The same
build with CONFIG_AUTOFDO_CLANG=y and no CLANG_AUTOFDO_PROFILE compiles even
unpatched, which isolates the profile-guarded inlining as the trigger.

The essence, without a profile - the check itself turns the constant into a
fatal error under both compilers:

  field_prep(BIT(0), ~1U)	-> clang/gcc: "negative width in bit-field"
  field_prep(BIT(0), !1U)	-> fine

Not tested: hardware, and a GCC LTO build of this driver.

Two other FIELD_PREP() users pass ~value with fields narrower than the value's
type, drivers/net/ethernet/sunplus/spl2sw_{mac,phy}.c. They are latent for the
same reason but receive runtime values, so they did not fail here and are not
touched by this patch.

diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2c/maxim-serdes/max96717.c
index e004e71cb768..e57dd701017c 100644
--- a/drivers/media/i2c/maxim-serdes/max96717.c
+++ b/drivers/media/i2c/maxim-serdes/max96717.c
@@ -604,7 +604,7 @@ static int max96717_conf_pin_config_set_one(struct max96717_priv *priv,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 	case PIN_CONFIG_INPUT_ENABLE:
 	case PIN_CONFIG_LEVEL:
-		val = field_prep(mask, arg ? en_val : ~en_val);
+		val = field_prep(mask, arg ? en_val : !en_val);
 
 		ret = regmap_update_bits(priv->regmap, reg, mask, val);
 		break;
-- 
2.56.0.341.gebdc087dc9


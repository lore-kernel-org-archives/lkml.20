Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876860;
	b=YL0YhHFgECb+0lJrwSTlO837fvyVXnOF0vGkEHP1dt/Rc3fsgAWuoQvfw5lMTTh9MD4H
	 VRxEbJkHawRfr8wu0HlOJnglIzy2Rkh8Ai4GqKzZt8+lTZgRA9Ud510w1TubIHKddETTz
	 uPcXOBNVg9v+1zGI1TK+ZY93/TV+YuRagk6kVFoNeytM7RwxvVkchrSG5BxOw9MXaT837
	 bH8gpQhYyNQlx4RLRIogjsjYZSb6JHC8e9Sc6iF+2fZ9Ga54NCvjLJPczKfgu4vasVKxS
	 BgsUeoRXhxSqBQ8OpZJhvkl7q5rZLrEeU02tpmk5KEO0DDpmooiKHNi0RGOBp3NgMKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
	b=BkPaXRcxDM7a3f/ai8oIVqBFmpZH+LNoJgjeanU0BYHP/FbGNtjrMiDylgmF0D5sgFOh
	 EIWSIfFumGVqiUpoKnwVZJixhwHkVTnEjHRCoJOzbJogdxCbmuaB7j6sh91zUZqsnzuvM
	 RnwDY29x0EJ9cLEIyNvUwwflz7a0QMwSKe0/iQo2mcvCZFgc2aH/9P/iMO/2XVe0OX3A2
	 4XUW2ieb3zlYoRJgvXOagoC6Mqvv3B/gR2o4bPzqkZYaYN4TKwuzf+1YYnfkkR+BW9SI9
	 ksJV1U9KtEa8l5ZWMzJDjDwYCurLkcBYTig3S/XyFhmyF0rzft6Yw5iMNyN9ibJBEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ecay6QKq;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578AC606EE87
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578AC606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ecay6QKq
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-716da696c1aso228470eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876859; x=1794481659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
        b=Ecay6QKqhC6kn7BuWoVPzwDa/Eckq99O7ro3UbYoxGCM6JrjmZh1sue+JID8GmV9mP
         /neJ6klECd5nqtefqWVE6DQIwbnDKKI1BQapmlzgEOZ7i0Dfn1OVesrQW28eW9l7Lz9p
         8B4e//IMa9OsNdf82XOECh8rDMyLi9+Hx6bEWeRdHigY/6J3g6q6xdp3M7RRKkbgw+5i
         wJH5yt9ZBBr3xmPwILd+0KWAmBALLz/AeLPrrKBCvcJzWlRlz2gWDtk5IuzOOyzuM+S4
         yKHIrvVpI0//PEFMiDXQ9Vn63rwREWvrRbUU3cTyL39ET8mghl9DmUrdNTQGUlWQYcTF
         qFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876859; x=1794481659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X/RUIiQQa87xx60aQjdp21uP+BGANbNQttC7WmkNww=;
        b=aeWArIzx/8rX2INMysmpIA3GuCyKDKujPvxwP57eR6Y0XrjwgK1D75vxrgxlJSswTs
         XfzmqV/WHtz7RIybhpZfB2vJPDtLezVd5fW9v0b1GidLNkdbnJnG3fcWBOKcxAXL8QxP
         YB2I4gCUsOCU+nmRiqRcim+9XN83AqgL0W0PoRbmVPj+YE406LDRikj2VTQvtjscT7OS
         aN8je7mhipB8YeAs3ZjYPrRU72lZwWJzXUwNRz7uRKuLLTCVFmheZ7nmcLaxeDSUnmZA
         NJPAgx0kFslAFvhR6UD8MQiMBGsOTapjbaj5Lr+figdLwF2GIIu3Htfe6P1R+P/KNeCF
         hVFw==
X-Forwarded-Encrypted: i=1; AKwUvBybdI3mOPhRcdrN8iCsO685Jv3TJYYEWA0gu0kwJfjXTc6PQh6AZ4JRufcguMIEWXpRdDPrl7/6rBou9Ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YeKqLNm111vkufQa3UtSal3cB1/JNHKTSbN6kp8sUqN9fan0W
	5gSLiJ5dxozAxFCN1Jmhx3smn6ZqITJWj3vol91lX1kJFWgSyHN8IVJ7nYA/a1TXxDQ=
X-Gm-Gg: AYBFou1cPB03clnbsD3Mr6Pv9EbSjAnDbWzolixore5Nw1TvO7SNuqWBxe3E/Cn9ByB
	hs5HTL300SU5efFO7ehjAPsmr2AuScCvz5hJ/hlGqW+cYVCkFd+E6+RMxyeQ8rEgTMKV3Zif1Ru
	LxpAuqZ8u2qdc0log6AV8prmnLMB+vvGAtU8ldpu2iAh6fuEqRDw3tXUiyJEVb0bQngogE0z8/Y
	bzbgvGzcK8i75JWogJvtKisS05a8RxI/G5nG3G4E19fZ7VeMCMmc82sEdRPReGhQxf99Rcjy7Hy
	131Z+EgmaytqJca4jINtfJ90smP7Fb7j15aCsfT4oGk441I9uD2cNFyCoOwwLlwcb4o9ZDMbkZr
	FJ6eZiqIiR+5+oD/ZwGrP7spmGfwKZcc3Z/wpLwaSV1tfJ6M4DImMjRH8dCGWkW9XPYmJDzW5G0
	AVzyvYeI4QeNkIFkgsVyC/A3IcpNJon7tdx9AGQlC9SHlo6jnRhFJRD5zUivLmyTfZiUlqkTpNP
	5ODsDHstPtb8hg7AQhmrTtNp/K5pGaS5NF6YOg8rqKlFdqR7ev7jH0fCySKMsb036HfqP9CrMEd
	2lOhTeiXcHdE6s+51UNUjL2COddtYroaj80tafY5W5+moN0k
X-Received: by 2002:a05:6820:1344:b0:716:b573:bc42 with SMTP id 006d021491bc7-716b573cc2cmr4325326eaf.52.1793876859099;
        Thu, 05 Nov 2026 03:07:39 -0800 (PST)
Received: from kiss ([2602:feda:30:ae86:2cf:9dff:feba:f25b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c134ff86sm3843725eaf.14.2026.11.05.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:07:38 -0800 (PST)
From: ZhangDM-520 <jixianqiang1540@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhangDM-520 <jixianqiang1540@gmail.com>
Subject: [PATCH] media: i2c: max96717: fix bitfield overflow in pinconf setter
Date: Thu,  5 Nov 2026 19:07:21 +0800
Message-ID: <20261105110721.1701499-1-jixianqiang1540@gmail.com>
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


Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582A3148CF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957298; cv=none; b=c/xFqpli4q9mjRocIrs3gZlViALNB83DGF9eiJFvWBP1sXQs+0MNFFRA9JyD4koO4RHfdH3RRsi2xxkmh0x6HEPbcUR9aSEM67PM8FQqUSTjdux0yAcSbuf+3cwgjcNUnHDrYseew87YfD88CLfs4K9xf4WjME7Y2hTVJeuB94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957298; c=relaxed/simple;
	bh=Z2njpikQnpU0YIjZUTr5kpMSWw0xcZb4x/D9BnKYH5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C85gsnOU5RVK3yIk/NbVuDq65omKk+wMTptCj9dyOjps++QZQhBsRaFQiuEt4jW6myi3u/JxyOl3G0f+dnjWhTCjBTyDTBVInhv2oMZ8Dy4HP0Lpcrz6jbawWV1WxndfHwip8nIOnlu/Z5/v5Dtath7iuqN2d3aqkyuygjqXDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGwqICUK; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGwqICUK"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso2024858a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957295; x=1790562095; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8s+WWqp4cPiSS9PQJkr8cLkMm6K4Ufz7ufaQ9UHIPlU=;
        b=rGwqICUK3KxfQFhShBufX2oO9KI3cfG8YZI76l5lg52pvX1XRm+t603VtraCvS5NeD
         VjPSECxxNpsJDOJhal/AOUtiD/n/OJEi81c8Jld8cZBnR/06FwwLVyrBJvHkbLnj9OvN
         KWOafowmSXWvUcJkhgLjNlOidvMYS326gZhlgh9xSve6yOoevPvyLKt8j5bVcoA7r28f
         OTkZkdLCzeDdFkcG8bmPDsiX92oQnH4JPExKpm6QuPHLtC3Ud/zkA6HTe5uEuJ54wesJ
         9C7doVEap4oUXwBTGDsz+z4T/Vb8JHrOw+u9tk9iSJAD1eAP3GMwUKft+j7EPIxbiM+2
         h8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957295; x=1790562095;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8s+WWqp4cPiSS9PQJkr8cLkMm6K4Ufz7ufaQ9UHIPlU=;
        b=C4Wt5YyeCGKrXq9eAArW8GoiFxRN9CnmjqJrQ+G74A7xzuZy0k3jFJhcw55d7IIFGA
         sYp/YTyxYcDWdDjMvS9jQNYSObEtTfca6lWzW9oSMKQTwXIs5VnDECjxWd6ibrkJf2Pt
         4M9n8YB+4DfrKBvil0YowPfCsEgS+XeE09Uuul7Bf5imv8tkFm2u8OfDnERpucQgF+5b
         ePjWmxC/h6GcMcAqWCNh3sNVGLbPBqpkGRa0nFBlal3blCwjfPuuO3ilHxYV35I1MyYf
         VvSYHdkVZGo3MxWnJ4kgzJhvNZCeteywGySLcAKdpzDNQg39FHF3eFG+MShT22GV66w+
         M4XQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7rCiRvM81Pqpt32/1+ys63TURKMotLoWz38ezd3NTcFCX7/T7gmXIzDO8Hg/EtVlWoPc8zESu6asQjjE=@vger.kernel.org
X-Gm-Message-State: AFuF++moDDGJjppQqengW8F/zy9FhfhFA3IFH8cRtuVSbjHN3YAqbsB5
	z8Cb74WsPSPjUgksrXqg69Egw+7Aw2WVL7PLcIV/k/AavHNN/h5Rx5p8
X-Gm-Gg: AYBFou1cD1VHw7xRz7ux/2JxkW52ccqQP5yxUoQRq1N7in2ffHsAL4TyPMTmowMNPyL
	VJqW+wjZ2Y0Ts6A2Yxlmt2+DKr38U0YtJLHdhP42cPcgW67n2QUNkgZto4OBWRswlUO1KJ5glB5
	jsg7mkhe/eultUScAd1Prs87dv0gC9l3MU15RSaxyRA5Th+zwxS3oSYQe/+4O12kQZdCq4836aS
	03BcpZZDwHm/Yfv8kJ0JsEDMC7rqnnHX5QRqFGwvT2PKpZ7b69NfxylN+22GEkbxHVKirceECg+
	fHBDP8P4vCFAK/0wPcWPicae7E/ojKT4/DSuwFSUczuA0OGO+tE1Spi3Y/a9+EDXmK0SZE2lPiJ
	FRz20Cze75PLMQBY0uHew0iinc7n76NZPYNl55/NK0QWif2qScJo6bezxNafVQZ/sCi8xu3tgCe
	OCReUvyaR1+jqQgSLjyyPAZYsld5l82MmaQatKjDBKwpXu+27ye8XPye80c4nnLTnrlk7bFmxV9
	xf6Y1TldxyPYUA/rvQdi72E8f7Z5wimvEbWwrxl114kjG2iBsKg
X-Received: by 2002:a17:90a:d40e:b0:39e:6c6a:656f with SMTP id 98e67ed59e1d1-39e6c6a6787mr7619969a91.50.1789957295383;
        Sun, 20 Sep 2026 19:21:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55aaf1csm15614039c88.3.2026.09.20.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:21:34 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:21:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-geode@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] x86/geode: use PROPERTY_ENTRY_REF for GPIO properties
Message-ID: <arCShGpHJo4vY5fP@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Now that the PROPERTY_ENTRY_REF macro can accept a pointer to struct
software_node_ref_args directly, we don't need to use the more
cumbersome PROPERTY_ENTRY_REF_ARRAY_LEN(..., 1) variant.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This patch was originally posted as patch 4/4 of the "Fix handling of
GPIO keys and LEDs on geode" series [1].

From that series:
- Patch 1/4 was applied to tip:x86/urgent as commit b981e9e94c68
  ("x86/platform/geode: Fix on-stack property data use-after-return
  bug").
- Patch 2/4 was merged through the driver-core tree as commit
  fe221742e388 ("software node: allow passing reference args to
  PROPERTY_ENTRY_REF()").
- Patch 3/4 (stack check in software_node_register()) has been dropped
  due to limitations of object_is_on_stack() with CONFIG_VMAP_STACK.

Now that commit fe221742e388 is in mainline, resending patch 4/4 as a
standalone cleanup rebased onto current upstream.

[1] https://lore.kernel.org/all/20260329-property-gpio-fix-v2-4-3cca5ba136d8@gmail.com/

 arch/x86/platform/geode/geode-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
index 679b4b07b790..e1c434499824 100644
--- a/arch/x86/platform/geode/geode-common.c
+++ b/arch/x86/platform/geode/geode-common.c
@@ -28,7 +28,7 @@ static const struct software_node geode_gpio_keys_node = {
 static struct software_node_ref_args geode_restart_gpio_ref;
 
 static const struct property_entry geode_restart_key_props[] = {
-	PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &geode_restart_gpio_ref, 1),
+	PROPERTY_ENTRY_REF("gpios", &geode_restart_gpio_ref),
 	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
 	PROPERTY_ENTRY_STRING("label", "Reset button"),
 	PROPERTY_ENTRY_U32("debounce-interval", 100),
@@ -143,7 +143,7 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 						       leds[i].pin,
 						       GPIO_ACTIVE_LOW);
 		props[i * 3 + 0] =
-			PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &gpio_refs[i], 1);
+			PROPERTY_ENTRY_REF("gpios", &gpio_refs[i]);
 		props[i * 3 + 1] =
 			PROPERTY_ENTRY_STRING("linux,default-trigger",
 					      leds[i].default_on ?
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
Dmitry

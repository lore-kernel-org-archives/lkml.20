Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501230;
	b=X/Ut+iG2o2cStnX1XIDe45aGUcu0/abD9WvIl8xBXHd7IxmQSa18rCRocnOTPrhXY3LI
	 O/FV3XO4nvEuNzxEit8ao60cFewvHFQiRA1z3BZZV2mJ+PH4WLpIjIuk0My2kFwB99dEr
	 qB4Fu9f9Z3+k4UU+7+AZNdGnmP/X0EGfKb6yFNRsYr8iEB7CAw7lU4ds3hV8xze51sbyD
	 ZozkrNeP0T1M06omiuO7LKUlH8VS7yoPf99/oPMK9aaOQFRRZmYcaMCYU38pSTtYwl29N
	 A7mbg4CR7cUqOn86trI3k1FRUnn/iYkARFa/1R2ddmp0xl9YDNpZa0cFpG0UmzsdC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
	b=a61q9KQ2+bm3cWl7QegeJA51geoiDdEyTKBhNCZdU9gOknqQucXcz6Kj54McMNh+UERd
	 EiNbFjy8FZol5y/JXWqa/DQ3lpkzEX+U+QKITbEHVWmPQpoCjYEBn3Z14/rgQ6o+oDRb1
	 Mk5Z18Aw5zguQPTtW0PaYWIQdWGCDvZdsGaN2g7hb2xxSKdpQzK/Ohn/v0fA8+zwETQ7M
	 QBf3By1EontPOlYbJYZEsstAcYwfj0nGVSCo5VYUYoOJ5DZg2u1ndCU4qQ/T9w93pTraG
	 VnfNpwF9XxTsYm9La0tL15mrhKkeewoq4zqGl67JOj9n0bXNSde4gwkLFRJ6O9SaMuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4l/8DF9";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443160A4AE5
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E443160A4AE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4l/8DF9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2058775f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501228; x=1793106028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=p4l/8DF9+/kYzcvHQwOneewQdIXFBAmaAIofNK4rYogA0p6b2j/4k28KAy04iAOQ+v
         Q8+DfkO/hKDcSxybfRIB/8oGAkscX0EMrg0N1JIRBHIhmHjDxc7gpzxJvNaM7uamfipj
         FQbgA11uYbN+ERU4IiiyOgZhWX6v7sRYJZBzWkuMK2EVtHtek6ObeuyA0FbWaUBVRg2i
         iOaFZ3M+c9VQuy1OxKyUIP/kjUGSLEheSnAiCfnKqofRPPslBWn1sMhSPAK3c+dq4AQf
         5Aer6fU9gvSOdpYJw408drds4U9ySb6zuO/55i8bNFqdGjukPkM0kDIdyU0IuHXi5plR
         W0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501228; x=1793106028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDnFObZ0K2X9/qO2ilzZd80c6UZ6TUK8OX6LvufmLAA=;
        b=nlW5SLwXOVMsXaSdoluuy1KFcx0fyYiU0sv8eWrHFUR577EZ+llOObgHQa2TpPRO7P
         Jp5QfpUky8QZkwfbAQUBRm/d/poHV65Hbibq6mcSJ5zgIyV5spMfVLAF/gqBPQj9ccsH
         DuF1V94WoRVoNSPdz1zk9YrRi6E8VlETpjFTHpam7MKTLZCwCt45wK5/EC/D0Xn0a2T5
         1/QO2SP4fnP010ZGlEGfjK0FSuXZ+lBNjA+fBf4FCN8ncmFtMPNEGlbMEuzELYH/R0x5
         j0g3WToNtkFKOuz4xaDeq+pqf/dBGXWbX1x1j+uwD2QpwYP/f0O4RhFCR7t1POdH9o/4
         l6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxUu1Lq6tOim39tutZpUeVNuML9GIqGahjOkln07U2fuetvH7uxMFsgxc+qjcSjnXYxZWeR5hCkVogdqwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUvwrEqmIl6R49tCdkYawNXIoHaYH2CtiYNFILXV7mt+Jg2M6y
	10+6LpaDyTpK9ldBHFrUSfsCD5GQmcMNiZCeBxdURphWfSlPLSXZV5zZ
X-Gm-Gg: AYBFou1Yv3aLvVx5lZM/JKq2umYeMZ91g0M9MturiYPar7TvCxT5oMaqPvNaFppY+uJ
	RpXBKT/DTEXYkyTSJi4hYn00ZO4bQoM0tf/pDF/pUk1eEqt5xTjRdm5a3/OW4kw2A3oDFyYDW3h
	L936tWe4aDz7lpgMz3or0P+yGA3Z1ojmrv6DRFGuPLHvDEN5ny7Dn2DvqQEr0WN+VqtkrQj19NR
	jj9MVlAxudXfVwEi5WFI8KbkHvZBWVEZbOOa65nbThbO91lsLN9rcf0AZBKwA988iYxYJZXZaNr
	/olzbGB2pSwImv5D8tjIN3BzOBklLFc1bOz46rFSkFqkykrcbrdJINLAIHYEXZKVSo7FX3+wKlV
	4tRQLLmSxIIbNQgSICh3SSSPd70qQg3yweODOxo8c+LunxsiuqaBAmqmwrjsVJaEBsLx7q7ococ
	iBNxCm6p0FXkN6SV8T7tunL3COX6r3GcLTSHYduq+kx0Nv9w/98z7/2GjY1G/b5sv0+8bJge1mc
	Gs1hnRALRhQQTgxF5qR6ZBPfH9sL2sWcQyLwSnyx4UIkzSzg4lPrPqSdhhO2lNK0Y35AO16yw==
X-Received: by 2002:a05:6000:4205:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e0dee52f0mr18975446f8f.0.1792501227440;
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:27 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:18 +0200
Subject: [PATCH v3 7/8] of: property: fw_devlink: Follow clock nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-7-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Clock consumers use of_parse_phandle_with_args_map() to resolve
specifiers through clock-map properties. fw_devlink instead parses the
clocks property as a direct phandle reference, so it records the nexus
node as the supplier rather than the mapped clock provider.

A nexus is a translation node, not the clock provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for clocks so fw_devlink resolves the same
provider as the clock consumer API. Direct clock references continue to
work because the map-aware parser returns the original provider when no
clock-map property is present.

Fixes: aacc54c67869 ("clk: Add support for clock nexus dt bindings")
Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
aacc54c67869 ("clk: Add support for clock nexus dt bindings") has been
in clk-next and linux-next with the same hash since next-20260907. There
is no build-time dependency on it, but this patch should not reach
mainline before it.
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53301cdac6a9..2388d607136f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1422,7 +1422,7 @@ struct supplier_bindings {
 	u8 fwlink_flags;
 };
 
-DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
+DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")
 DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")

-- 
2.43.0


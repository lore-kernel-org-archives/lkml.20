Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501227;
	b=wqEXcPQp+aqpfxN0ir6xhg63pm7jX0qvtBUoG48636T7jWQOpsJUKMStJT9RW4/yUSjN
	 Ju9BLTNb0tFJor30nTNfHARKLmM5U2oNfaPpERmDApzqiSglZRCo9NneiEaSrK2teH4WT
	 3oJcyP52PUMFpJHLE30g5AZw/p43aw5ENGHxcdj76gwTsSJTwW6uzHPaJ8LLmHoXuk4in
	 rKutH0dKAbPGJ4MDY/RBbk505+99aJonwAviNK3RkZ/+vObIxexxDwJaYfzt7uRJL3byr
	 EKvm6v7YltkAMYNa7aU9N37zUglTJrxDLmd/CDlbVo8yZ9mX6n9VvfVu8HH0YUrehBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
	b=eg1E1L2XKmGqEokvjLjmsAwfxcaZUv/nhk1UlHneOhBEyoDWQUyhkDwdFCf9PwzB13F6
	 6LXFZJ1gBr2VRNrpSgTfmAqVqppvlD/LfUSlJXk/Q7fYfwOBVDjEk1ZvYNoK/6gV8iuL2
	 IorxuwIVEDnWRFJplOqINK/53WguGFb8+UdtCjJDkvNZeHSoPkmF2BQteH7irdTyMG73z
	 HYLL1ETcVdGOilSlte0LquJ03TCCOvbb85QwXZm/dSqzQSh3l0S5ILhkMB1ZH6CoQemZo
	 N6xE/41XMYGdyibdoWGMYzx5TKXsbfiYSNs9I9i7KdV3INpniFQvvF0uogoXrcVPy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEE960A382B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EEE960A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ou3lAhYX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso4891135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501225; x=1793106025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=ou3lAhYXfr1/j4oQcWn4lcxmFC2fRwECqiBFa15n/+ItE2kULX3IyewYF4VAU/XBNa
         agICyytnveBnQdZlLGNxF+mAP9Dvdw1PLZbMOcxWTfx6p55vqzBSx4TwBEMz+ucjNqRP
         rtEamXPCpH9Fbrsl6t1cr0wDEfT+lzhDKSKaeVQFjXO/7tJEkVW/7pzKJkzCeYoEVogI
         9OYBe7le3Qw8uPChl5GbrmO+7F8/wn1O11gANpi2Q84ck3Kca9n4vQqtAXwcC3/9lEOy
         Uazm3kSlfM8OR0ymWeowO8VC4lNoqtWbjSFRc32wEMm8dtcfQeX1tLpebvBscyR8zipQ
         BABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501225; x=1793106025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCVq48Hz4LWuB9OejIcWVFo10GsQgpT90RAtohh2YF8=;
        b=ed0J/oFijkUPpzJ5cz9LcOkm9cqJcBBnwHHp7UOhyBXRDEJBKMJSA6Qk7y4h45pbC2
         d8siadsZNW6Br6ffYtC0y1UbRMV7Ss313qxdIfpNe8jjyGmD+488nS91iNMuJBFbMrsB
         5uJJUu3isHv9XhHP7KFxLl68G4ZQpbPBhIugA/vN873PcpcoQKXelE7QexGaAc2WVGjL
         Rm8bwSipO/Zv18aYbjxyPNUXMqhJVwu6MXcEwHuFjrqprhE4ZST7dTinn8yisY6Gity7
         uryCv+mBZy+kfF18iOFJqPMGDJFNwb8RL0nJtq/y642TyW4M+94XtVpNGbjRe5pwNypV
         PI+g==
X-Forwarded-Encrypted: i=1; AKwUvBxxO2GWzpTEnBhoqGLTtsS274uULVjVLXFOpTG8bV54Joi//K+9AqL817DvBa3xmMe4mpyvt5TrAIMgzXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX6IQJcdW95ARfyJSmmsonDbFlea9QyGCvOlAG7bLGB3N5xC60
	+IDgkxWqikQD/jcP3mKUwyQ+7ClkL7V8urV6R2uG5mmbW8kvbbordpFk
X-Gm-Gg: AYBFou0bzeim4sB2vpvb/eSysMkVbRbUxtipKBLku9b6iNWTa8I2qJKAB4Gs6BhyZur
	HDS72HRf9JfParq8gArls8EpnYaM3WzhCOA1Ls8OmtAZeIYVW1cUjR8XSACaeKVwUfZ71TtORY5
	BSdrsb1fnZKNhRTS4ilcVaxjf3JZvfpblpKyLKgPmO+kZzsqvmP2G8uKeTWswXm10hrUbll9T8a
	ZJAcNyvvRL35TSNhJiciv1q1JusDBtrMcYZUKB+47LkPVzAZIcS7h8xn27KRPVYAHKE7PCH3OuK
	x4bcCuzz5hyVRWLchdl/cwkpRfPqVpv4MDVs+q1s0FXhAxD1Uhyul7H1JOVABDRIHoi/O6pM8sS
	KzJERmevmF+DGIayJm58vdgT7j7x2Od/bs1a/dYcSmKbQ2yB0eJWf7uo7SaCWsM4XWz05bQNVSA
	iQ3lyP9PLJ7WV66FWuXiFkuXDjy3ZExjpXgA1Yalb8vIAo+BmtFtzT/kBCKlIK/MjVL0nkPqFx1
	ei5WfLE3ZmQB6vbpOO7hk/piR60aGMFYvrNImbwAg/PSXA7KWf18J+wX9yyi9t98W6SInMhXrA=
X-Received: by 2002:a05:600c:255:b0:4a1:e478:7878 with SMTP id 5b1f17b1804b1-4a1fa092b29mr12610135e9.18.1792501224980;
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:16 +0200
Subject: [PATCH v3 5/8] of: property: fw_devlink: Follow PWM nexus maps
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
Message-Id: <20261020-fw-devlink-nexus-ready-v3-5-fd6f1c17e16d@toradex.com>
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
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
through pwm-map properties. fw_devlink instead parses the pwms property
as a direct phandle reference, so it records the nexus node as the
supplier rather than the mapped PWM provider.

A nexus is a translation node, not the PWM provider, and need not be
populated as a device. The resulting fwnode link can therefore remain
unresolved and indefinitely defer the consumer while
device_links_check_suppliers() waits for the nexus.

Use the map-aware parser for pwms so fw_devlink resolves the same
provider as the PWM consumer API. Direct PWM references continue to work
because the map-aware parser returns the original provider when no
pwm-map property is present.

Fixes: e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Cc: stable@vger.kernel.org
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 99381c07848d..53301cdac6a9 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1331,6 +1331,15 @@ static struct device_node *parse_##fname(struct device_node *np,	  \
 	return parse_prop_cells(np, prop_name, index, name, cells);	  \
 }
 
+#define DEFINE_SIMPLE_NEXUS_PROP(fname, name, stem)			  \
+static struct device_node *parse_##fname(struct device_node *np,	  \
+					const char *prop_name, int index) \
+{									  \
+	if (strcmp(prop_name, name))					  \
+		return NULL;						  \
+	return parse_nexus_prop(np, prop_name, index, stem);		  \
+}
+
 /**
  * parse_suffix_prop_cells - Suffix property parsing function for suppliers
  *
@@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
 DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
 DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
 DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
-DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
+DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)

-- 
2.43.0


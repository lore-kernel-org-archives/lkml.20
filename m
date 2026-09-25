Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07814CC631
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372026; cv=none; b=tQ3uYtUl27npBZhBMdoJul4j6Y+a0J5obkSUmut22gKnOKbZt9h8LhJcrUUa7wLonjtg+9K2V1Ecz8epI0wRmbmgsP8jOQ22/myy4IFbX3CTVkiGxMbicKU58y1NFRFf7AfcGnOhUHRye5rT3Le75anBig+Ji6x17tuxHfusH8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372026; c=relaxed/simple;
	bh=0zBTQ42ozAXedGB+g8hLFnDwWMR9NHhVhkh1N02kpBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrI1Q4fmBLErhEBPTzV9qrG2VJSc5/OxWA27ceT0VJAUGrPMFlDLgwil63+EPYxwkJwCWPNm4XcFjJQ2qVkMmfcjIh+hzXmpJxiPwOHbS/joh0Ei4Gzo/rPy6kMS4HFx4HnxI8iRnPKKEKLOgo8b4g10NgcfrMcQCv4rOhagrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPU6Oxok; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPU6Oxok"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso9613295e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790372023; x=1790976823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNPnuIQqoJSa2LnLqWG9FoS2zB4ik0+5Qc4IWxEH1U0=;
        b=LPU6OxokPeJl+KQO/kCqu/9DqIuIevWy/GJoosZFvzY0RtSdMV6WTTGEWmNO7ha1+x
         wfVgWDsJlJW1ABybLLOqCxfO9oDVTCXjjd+Yr2ZOh7dbRqJDDmwq8WA5j2IgR5LoiKiJ
         LrODCXd/dTfkgvSOOgiaTunEqccY5Wdm651vNXpjcnJrU7NRF2E1kHE2B2jgpykuqQXY
         k8T4BFocbOUY+zMGfkOIsLlGSsdSea0Wwi3kaQ7H/SkAo2Dl7rte2bCE5gGV9IyWwgKb
         xzd1m0U/zQ6eTnvHIoWaLqZvJS6B8xSn9Csq/yj3rowTjHsw7XEOpUf0YXuLG/D0UKSl
         Wr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372023; x=1790976823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNPnuIQqoJSa2LnLqWG9FoS2zB4ik0+5Qc4IWxEH1U0=;
        b=gyHdWdgEuLdtc2AaN59iwxzuJnvAQCWsbSXONiALUzJbEYeW6w/WYdK7qog+l602aw
         sb013p9KsKwfUfYM66w0T7CDv6NV2fOUpYEPEkA9V2kzEdX68mgbzhG9eFVjEW7FUjov
         xZ/BG9HtfGX47tbezy1xoQizaqFDPJR/3pOhhX1P5Aszew7fdTvlXOKAhRrop5SKH+tv
         0iSHJWmEaLoJFE8sIqFxCASPCHdsJ7JQo55QviUSzQm9g95N3/fqommBTVKa8yqJciLi
         kTAL9GFvtqz9wvGd2JV7hfmrfyLtfeHBVhhkQkOPnfCqWlbDeJNG5XCVZ0QehWu8XIga
         zueg==
X-Forwarded-Encrypted: i=1; AKwUvBxCNj7T49m1xPcer2EQCEjW/wdW+9JesJ2vwMvoICITbhwhQXxMIdK+bRcjp0m0tyC1oWlAbrE2c2QoUdU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqMmBo9kT1jeKR8KgObspNR2/bFZPsuOBHyYu5pu3WpTQTVRgo
	FqTphR6ECgq4tAFDGGSSX/EbskvUBmPUEZTHijfoptkBHhHJtP4YBVNF
X-Gm-Gg: AYBFou1FVI/CmW2r29pO6YsS0fU4FaL54IBwKl3/LLD6+RmVAp6XbrV2NT9r68oEPt0
	ZAoI9Bqa3HWvFrMKDFKa2RVzflYDbniQCkMcHuR+/qjzn4S6xqLIDsK7+Uu3sM2KZrsHYHHrBT3
	3980kfhofy49RZpbMixowwqP4AVri4OWiQunMwZU+HXw++ARlw1uX85yLVKtHAoslpLQD/PXvpQ
	D7sAvBee3YMtBD57Kwzn1MRAhOegnwIw1v37+ITLVc0t7YxZhLaNuJHjXSRtPA09oxh8uD0dywO
	+bLyeEsgx0mrY4vZF5gC2I76P1ajukbteySQENLs7wlnv73cSZS0NcD1ZP19z15LuqqiB8Jr0H5
	BND/BPVMdAUfFQTGzNrAtp2j4WPYxx0NdtnX90r4IwszZhbHQl0jFHHPARhETVOLtTatOFs0/f+
	aK5/h9OJddS4X9jhBw3awslvyChmk7Ois9a8PGqqm6BvArikAJ9cIQnBqwRlgEx+bTBO1850PBJ
	iA/RcK6Z7aWSKcuEDnURAkbGmvqJtJTMfpUl0HdBDXjFN46APlFADmhoSo46/Nb0STFg7nHk71z
	HM1Rs4O1IA+Vgni2BohI8g==
X-Received: by 2002:a05:600c:3486:b0:49f:f9d4:674d with SMTP id 5b1f17b1804b1-49ff9d4695dmr4184105e9.13.1790372022809;
        Fri, 25 Sep 2026 14:33:42 -0700 (PDT)
Received: from archlinux ([2a02:1808:c3:5607:5610:f477:1142:290b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm10843696f8f.20.2026.09.25.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:33:42 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	hansg@kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-wmi: Fix hotkeys dropped with vendor backlight
Date: Fri, 25 Sep 2026 23:33:33 +0200
Message-ID: <20260925213333.198058-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit dee82409a883 ("platform/x86: msi-wmi: Reformat
msi_wmi_notify()") turned the condition for reporting a hotkey into
an early return, but only negated the brightness key comparisons,
not the backlight check. As a result, when the driver registers its
own backlight device, all WMI hotkeys are now dropped, instead of all
of them being reported as before.

Restore the original behavior: only drop the brightness keys, and
only when brightness is handled by the ACPI video driver.

This was found by code inspection. It is not tested on hardware that
uses the vendor backlight; on an MSI Katana 15 B13VFK (no vendor
backlight) hotkey handling is unchanged.

Fixes: dee82409a883 ("platform/x86: msi-wmi: Reformat msi_wmi_notify()")
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index c9db750fe5..05c35133a1 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -236,9 +236,9 @@ static void msi_wmi_notify(union acpi_object *obj, void *context)
 	}
 
 	/* Brightness is served via acpi video driver */
-	if (key->type == KE_KEY &&
-	    (backlight || (key->code == MSI_KEY_BRIGHTNESSUP ||
-			   key->code == MSI_KEY_BRIGHTNESSDOWN)))
+	if (key->type == KE_KEY && !backlight &&
+	    (key->code == MSI_KEY_BRIGHTNESSUP ||
+	     key->code == MSI_KEY_BRIGHTNESSDOWN))
 		return;
 
 	pr_debug("Send key: 0x%X - Input layer keycode: %d\n", key->code, key->keycode);
-- 
2.55.0


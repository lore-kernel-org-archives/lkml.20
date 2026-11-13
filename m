Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568476;
	b=vAQa+K3uuzID9Z/X/Rv1u/tjBI37JwpFVY0Scggry24JTMunUPqA6elF61oiFDFHLQ1j
	 OdbL11SoGBJ9JM3CVZVGU0JjdMLfiIKDZetFEVmwsLw9tLiatXjo9X7VRT/bDfM++Od6O
	 ld8jW9SKadRkBL+wVDRJaCYmrCbawhLQU/n+ZmcVGZ0NVafuNuOG9e5hD3P7f34luLC/W
	 BusaeW/toxO5bdwpnBx3ZlH9BubFrzIGcqEIAaV5aFY73/B8p8onILF0BpU595W/+7Lpa
	 RWlpSzNgOLRRvEd6e+JCwg+Dh/YPhTLQy48gBUDqPB5afJTHKIFQWUG2Mwze4EPp4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=CugqVWAuawrwerm7blKnvsOa3BQVmagcewjHznzs45w=;
	b=iQH6K0fNIblXp0ZDXICAaNEUams7UVyMqkcMNMmyT1Iwcsk09/D+5FaAWHKviXRBktDB
	 8Vu1i0Hw+w1OvjZVoLQfArrRACNOo92NgJ6JVhwlFl34DLVZ46fsSpO6zx3SwD+utY+v9
	 Dumalnoyk891hHrpW1sOAD794Ywj0XxThHzC9qaOhFBg2z8IUIC1t+XeNfFnk1GOh+n/j
	 ogodCdj7KHiUGWDImz8FR106yMg7LzAKiwEXsU5zvXjlI+DM3ku0LA/ah1l1tUDomev1t
	 NPpMPRrLrFP7DKBZhyqMbnYAeQbd8ZFVuMONk0X41v0kG8TTpe4Fi/ZiL4fBpxKcF6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kp+BbCqu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E394606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E394606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kp+BbCqu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490a0e72588so300994f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794568474; x=1795173274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CugqVWAuawrwerm7blKnvsOa3BQVmagcewjHznzs45w=;
        b=kp+BbCqubQUG8rQrnEbUtzkBreaBNT6dGsCtStLkwZnVr7rnxMSpu2wPWXIF+STByf
         m4EZGlxqQM6YKCNA5uHEGimCIbzMio0TGE58ytvySSmB/p9ySyjfa96YWflAimEk5F7r
         J1dE80YpMN8xF7R/+oagKMavT6pBPF8RjSd7C/ZYFDLFFzmZwxy3ndKhTYrLX6SNh5LJ
         iez0RdbVhSu5guo81pQX+Wfc3uwqq4mIijKuH42VBwmpNc9vc/GKPFw3xfpME2l6hnNm
         zr7+rynVk2i4TrUXL0hZAO0341tHnmw0LlYQrFN6VUNcTvj3cUXv356OS9RyPuaDBHsT
         IdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568474; x=1795173274;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CugqVWAuawrwerm7blKnvsOa3BQVmagcewjHznzs45w=;
        b=MjChMV7USqSMobFHQlG4cEloU2LgCYy0XBiKPqfRg6jNbhi3BVUakWRutkztnfbGVC
         QERzwN5cTGF9KPuuOgupkyuIjImmC6an2RIfHz7VkQN9xlVNRvRnoqnsakLuwNTv7pcl
         6hY+77haurSOrrAnpaqjsJK9/kQloWIi6NUS9NrV38v2QmX1PrSCLsQ90KAO2lx7nnr0
         SM4ycqghlwJ2E0aj/kHFt566umbrluc23IE7/5YexU4b5FbaVVlvALPBWpSes5jJM/Yk
         ItST6Y0sJ3sN6XwfbzE6TK8YrQ3GrA8SB0lXOOy9qSY2LvS+khcYuwD8Tx7vcKIAuWdF
         qSJw==
X-Forwarded-Encrypted: i=1; AL+hErGM/24ftDXHpxZ3TTWWqC06F3vU3yLhjzS2eOU9c8M7nQLEa/e6AbLofj0X9oAzf7WE7gFR/Ydzse7JhNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OfbYyPj685MhOpMz18GqdVKro88Ig9viNZ9/+LFtBZJwjGrFi
	lX/e3jer2ADDAR2P1cx38VJdY9ucc/Vjy3zYKThvR6kJi58HjrQmW+3/Ou2UDCcvTP0=
X-Gm-Gg: AYBFou1MUzMaokpmdB5Dxj4p1v7WkyZfdBzHjHgrSA0LOvVSKBU3P4alAdhGB58VEB6
	tjsfI8LHHc1h36cZbrKUuqNg+9gR0luBypDe7usPT8S+h0JsaQUQt9LAzEnk4ayOmf6T2PaD8CB
	MfFWglJmIHBEr4nCtELju+dUN9Bgo6mN8gbn6A8xzTFz9Jg1E1HbShFTDGZFcig+EpR5ojt1/4s
	Q00CnPBCW845blFTo2y+yfkQirDXp/D5Vifx0zrtIoNqeXhsMUvlNM+NAdItkAyzQQp2Gv8E8D3
	HHC+wgHhm9Tpql9qBq+5XhmgyPyTREOsp7zEVFZTce7r50w2ARoP6nQKWye+3Lppw1CD9U6OBI6
	HM+8y5VOHB03/Q++493qXOYEhtNiObNQXnfRmqVBoiHg6l7xHrpl4K5S1/yRKyyjWfDZmk909J+
	imCS/AkqXeoOMjiQArQdbBLeIzmQEiYEtfzW3pwFrZNjjD7ky1oWfH5QdohKle3Wz1wqGB2ysrb
	3MITS0EBcnaNiI7HRJiE8ITxipM4KdDSnsYk+aGrHW/074gbixYCFrQLbpdKNS8bFlIyI2D17Ss
	E5sIdem5UlFpclb6AW4NAD045T1/6SAcJ2kk62kk7JoQywiAMxSfokP+fyyg0+tCAkk3wuIF+XY
	CfP70w3Ir1AhmMD3W/urdG6SmIbG5u2ir8BuJEg==
X-Received: by 2002:a05:6000:4714:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-49c71785315mr4684760f8f.24.1794568473546;
        Fri, 13 Nov 2026 03:14:33 -0800 (PST)
Received: from localhost (p200300f65f19a904278f3f81ea855105.dip0.t-ipconnect.de. [2003:f6:5f19:a904:278f:3f81:ea85:5105])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5f782396sm4858544f8f.24.2026.11.13.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:14:33 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Chu Guangqing <chuguangqing@inspur.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v1 4/4] ACPI: Unify *_device_id list terminators
Date: Fri, 13 Nov 2026 12:14:00 +0100
Message-ID:  <68abd7c74b17f3ff08bd825b08b99d7b77ca76ac.1794567577.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794567577.git.ukleinek@kernel.org>
References: <cover.1794567577.git.ukleinek@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10266; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+6PqnFs9xNMlcyaJnD61eEm38xx+1W6KaISepWhZ3LA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9vECntQcbmqHyqMqXM6ndAzXOFB7wm6LEZuhn maJnAzthW6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavbxAgAKCRCPgPtYfRL+ TvFuCACOfUmF6gLB98HOWz7U5y+WCHPZGCfevOEySB/VR4BmQLyNzYGDHlbOTeDZl+7yC620hWU gdXv4e+HGZYgCK8aM7DlUpJgH67MPSQR1vl4chxUmHRUm3zRu+JH07oAR2sK0JuYmhbRzfeIa2h L6pS9c3Xw6/rXX6VPsEVne1Xyl8igNGd6NrhEO1fOB8Ux5bTw0OAo0x6+tRPMVOPPwog7yCIMdn hSoYcOvmYW3xesKMXSkPMG4PX/CbfjBeB6yV950WyPpCeenaH6it9SMQdlXCCAjgtdCgdbQbjGL qi9BvkNMvZJilS8DpZC2AcoWIaKYEZdgqoXK8XwjyzCw9slC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Consistenly use a single space and no trailing , for the list
terminator. This doesn't introduce any changes to the compiled result of
the modified drivers and just aligns these to the common style of the
other device_id arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/acpi/ac.c                       | 2 +-
 drivers/acpi/acpi_video.c               | 4 ++--
 drivers/acpi/battery.c                  | 2 +-
 drivers/acpi/bus.c                      | 2 +-
 drivers/acpi/button.c                   | 2 +-
 drivers/acpi/ec.c                       | 2 +-
 drivers/acpi/mipi-disco-img.c           | 2 +-
 drivers/acpi/osi.c                      | 2 +-
 drivers/acpi/pci_slot.c                 | 2 +-
 drivers/acpi/pmic/intel_pmic_bxtwc.c    | 2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c | 2 +-
 drivers/acpi/pmic/intel_pmic_chtwc.c    | 2 +-
 drivers/acpi/power.c                    | 2 +-
 drivers/acpi/processor_idle.c           | 2 +-
 drivers/acpi/sleep.c                    | 2 +-
 drivers/acpi/thermal.c                  | 2 +-
 drivers/acpi/video_detect.c             | 2 +-
 drivers/acpi/x86/blacklist.c            | 2 +-
 drivers/acpi/x86/lpss.c                 | 4 ++--
 drivers/acpi/x86/utils.c                | 4 ++--
 20 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
index 168e1d495b7b..85f1c54c9378 100644
--- a/drivers/acpi/ac.c
+++ b/drivers/acpi/ac.c
@@ -187,7 +187,7 @@ static const struct dmi_system_id ac_dmi_table[]  __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "32597CG"),
 		},
 	},
-	{},
+	{ }
 };
 
 static int acpi_ac_probe(struct platform_device *pdev)
diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 2a2822516665..548303bb3a14 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -92,7 +92,7 @@ enum acpi_video_level_idx {
 
 static const struct auxiliary_device_id video_bus_auxiliary_id_table[] = {
 	{ .name = "acpi.video_bus" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, video_bus_auxiliary_id_table);
 
@@ -518,7 +518,7 @@ static const struct dmi_system_id video_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "EasyNote MZ35"),
 		},
 	},
-	{}
+	{ }
 };
 
 static unsigned long long
diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
index 8b1b66cf5369..c1f36e6dfab4 100644
--- a/drivers/acpi/battery.c
+++ b/drivers/acpi/battery.c
@@ -1387,7 +1387,7 @@ static const struct dmi_system_id bat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
 		},
 	},
-	{},
+	{ }
 };
 
 static void acpi_battery_wakeup_cleanup(void *data)
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 1d6867dec925..3cf1719b5246 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -66,7 +66,7 @@ static const struct dmi_system_id dsdt_dmi_table[] __initconst = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "Satellite"),
 		},
 	},
-	{}
+	{ }
 };
 #endif
 
diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
index 66a57eea2280..c41fba556030 100644
--- a/drivers/acpi/button.c
+++ b/drivers/acpi/button.c
@@ -167,7 +167,7 @@ static const struct dmi_system_id dmi_lid_quirks[] = {
 		},
 		.driver_data = (void *)(long)ACPI_BUTTON_LID_INIT_OPEN,
 	},
-	{}
+	{ }
 };
 
 static int acpi_button_probe(struct platform_device *pdev);
diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index d947118657a8..da7f35a42dd4 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -2017,7 +2017,7 @@ static const struct dmi_system_id ec_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
 		},
 	},
-	{}
+	{ }
 };
 
 void __init acpi_ec_ecdt_probe(void)
diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.c
index ea4bffe3c02d..86df7dc25339 100644
--- a/drivers/acpi/mipi-disco-img.c
+++ b/drivers/acpi/mipi-disco-img.c
@@ -736,7 +736,7 @@ static const struct x86_cpu_id dell_broken_mipi_disco_cpu_gens[] = {
 	X86_MATCH_VFM(INTEL_RAPTORLAKE, NULL),
 	X86_MATCH_VFM(INTEL_RAPTORLAKE_P, NULL),
 	X86_MATCH_VFM(INTEL_RAPTORLAKE_S, NULL),
-	{}
+	{ }
 };
 
 static const char *strnext(const char *s1, const char *s2)
diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
index 9470f1830ff5..0fcb0d006065 100644
--- a/drivers/acpi/osi.c
+++ b/drivers/acpi/osi.c
@@ -473,7 +473,7 @@ static const struct dmi_system_id acpi_osi_dmi_table[] __initconst = {
 		     DMI_MATCH(DMI_PRODUCT_NAME, "1015PX"),
 		},
 	},
-	{}
+	{ }
 };
 
 static __init void acpi_osi_dmi_blacklisted(void)
diff --git a/drivers/acpi/pci_slot.c b/drivers/acpi/pci_slot.c
index 33a123074071..e5cf81b6c8e1 100644
--- a/drivers/acpi/pci_slot.c
+++ b/drivers/acpi/pci_slot.c
@@ -178,7 +178,7 @@ static const struct dmi_system_id acpi_pci_slot_dmi_table[] __initconst = {
 		DMI_MATCH(DMI_BIOS_VERSION, "PRIMEQUEST"),
 		},
 	},
-	{}
+	{ }
 };
 
 void __init acpi_pci_slot_init(void)
diff --git a/drivers/acpi/pmic/intel_pmic_bxtwc.c b/drivers/acpi/pmic/intel_pmic_bxtwc.c
index c332afbf82bd..99c05b62df43 100644
--- a/drivers/acpi/pmic/intel_pmic_bxtwc.c
+++ b/drivers/acpi/pmic/intel_pmic_bxtwc.c
@@ -395,7 +395,7 @@ static int intel_bxtwc_pmic_opregion_probe(struct platform_device *pdev)
 
 static const struct platform_device_id bxt_wc_opregion_id_table[] = {
 	{ .name = "bxt_wcove_region" },
-	{},
+	{ }
 };
 
 static struct platform_driver intel_bxtwc_pmic_opregion_driver = {
diff --git a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
index ecb36fbc1e7f..5424cf72fb1b 100644
--- a/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
+++ b/drivers/acpi/pmic/intel_pmic_chtdc_ti.c
@@ -127,7 +127,7 @@ static int chtdc_ti_pmic_opregion_probe(struct platform_device *pdev)
 
 static const struct platform_device_id chtdc_ti_pmic_opregion_id_table[] = {
 	{ .name = "chtdc_ti_region" },
-	{},
+	{ }
 };
 
 static struct platform_driver chtdc_ti_pmic_opregion_driver = {
diff --git a/drivers/acpi/pmic/intel_pmic_chtwc.c b/drivers/acpi/pmic/intel_pmic_chtwc.c
index 81caede51ca2..f4c90907b020 100644
--- a/drivers/acpi/pmic/intel_pmic_chtwc.c
+++ b/drivers/acpi/pmic/intel_pmic_chtwc.c
@@ -275,7 +275,7 @@ static int intel_cht_wc_pmic_opregion_probe(struct platform_device *pdev)
 
 static const struct platform_device_id cht_wc_opregion_id_table[] = {
 	{ .name = "cht_wcove_region" },
-	{},
+	{ }
 };
 
 static struct platform_driver intel_cht_wc_pmic_opregion_driver = {
diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
index c77342a584f0..e97eb73bb2fe 100644
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -1093,7 +1093,7 @@ static const struct dmi_system_id dmi_hp_elitebook_gp12pxp_quirk[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 855 G7 Notebook PC"),
 		},
 	},
-	{}
+	{ }
 };
 
 static const struct dmi_system_id dmi_leave_unused_power_resources_on[] = {
diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index e113bcbbb882..9238e12e37fd 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -105,7 +105,7 @@ static const struct dmi_system_id processor_power_dmi_table[] = {
 	  DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 	  DMI_MATCH(DMI_PRODUCT_NAME,"L8400B series Notebook PC")},
 	 (void *)1},
-	{},
+	{ }
 };
 
 
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index 641056e0252b..7c1fb5b844be 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -407,7 +407,7 @@ static const struct dmi_system_id acpisleep_dmi_table[] __initconst = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "20GGA00L00"),
 		},
 	},
-	{},
+	{ }
 };
 
 static bool ignore_blacklist;
diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index da631bbe8ea2..3d06744924b6 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -1014,7 +1014,7 @@ static const struct dmi_system_id thermal_dmi_table[] __initconst = {
 		DMI_MATCH(DMI_BOARD_NAME, "7ZX"),
 		},
 	},
-	{}
+	{ }
 };
 
 static int __init acpi_thermal_init(void)
diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 2050b8ff5384..997794d3b3d6 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -986,7 +986,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
 		},
 	},
-	{ },
+	{ }
 };
 
 static bool google_cros_ec_present(void)
diff --git a/drivers/acpi/x86/blacklist.c b/drivers/acpi/x86/blacklist.c
index 55214d0a12b1..553291330f39 100644
--- a/drivers/acpi/x86/blacklist.c
+++ b/drivers/acpi/x86/blacklist.c
@@ -134,7 +134,7 @@ static const struct dmi_system_id acpi_rev_dmi_table[] __initconst = {
 		},
 	},
 #endif
-	{}
+	{ }
 };
 
 #endif /* CONFIG_DMI */
diff --git a/drivers/acpi/x86/lpss.c b/drivers/acpi/x86/lpss.c
index 50b6db40bb18..fa0f1b61614d 100644
--- a/drivers/acpi/x86/lpss.c
+++ b/drivers/acpi/x86/lpss.c
@@ -340,7 +340,7 @@ static const struct lpss_device_desc bsw_spi_dev_desc = {
 static const struct x86_cpu_id lpss_cpu_ids[] = {
 	X86_MATCH_VFM(INTEL_ATOM_SILVERMONT,	NULL),
 	X86_MATCH_VFM(INTEL_ATOM_AIRMONT,	NULL),
-	{}
+	{ }
 };
 
 #else
@@ -493,7 +493,7 @@ static const struct dmi_system_id i2c1_dep_missing_dmi_ids[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "T200TA"),
 		},
 	},
-	{}
+	{ }
 };
 
 /*
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index e723575399b8..b6ef5dfb662a 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -49,7 +49,7 @@ struct override_status_id {
 #define ENTRY(status, hid, uid, path, cpu_vfm, dmi...) {		\
 	{ { .id = hid }, { } },						\
 	{ X86_MATCH_VFM(cpu_vfm, NULL), {} },				\
-	{ { .matches = dmi }, {} },					\
+	{ { .matches = dmi }, { } },					\
 	uid,								\
 	path,								\
 	status,								\
@@ -458,7 +458,7 @@ static const struct dmi_system_id acpi_quirk_skip_dmi_ids[] = {
 					ACPI_QUIRK_SKIP_ACPI_AC_AND_BATTERY),
 	},
 #endif
-	{}
+	{ }
 };
 
 #if IS_ENABLED(CONFIG_X86_ANDROID_TABLETS)
-- 
2.56.0.rc1


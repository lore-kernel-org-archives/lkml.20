Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828C4611C2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386817; cv=none; b=t4vnFWIua2hLq329mh4toHdKA92Siu2f4R1kWpIyD/RRKesPmKg/NJrmhCOvvHPXcnTbbHr5N1DtMfb5FEvZfZPi77a69xyHZwFwrEfsn0o9H+RDriscyHqTJw0EqoKpQQnWtERJTzCn8cH0C0XBl15W1zrlaxY91WFSHGnM5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386817; c=relaxed/simple;
	bh=cBeWqY4HLrb28ydkrqsmLWozKCVm+fazE26URw3SY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YADyAMmmlVQg+mnCUia9cVjOUF7j34QZ2X0ZyqO6RR2AgNaLLJEJo+CF1Uph2CFdkGSi9Vrf4Uhs+d+VcXmNstz3HFQy4Eu3OMTzm42UFtcnk8C4qmhpkOHTPNV9cKowdl5gmX3bVRwzVckqZAzwMls9FlcDqcCkpTLUEm3l6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfAi3uLa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfAi3uLa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1477981a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792386810; x=1792991610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkfhRC/zk+m5Azmg5gexMfMEyLSDDmbFFC7w7dNWV0w=;
        b=cfAi3uLaYIsevkPEC4uOIqxcEGEtA828nLvdWbwExwxHHf1+QLHehLGkKVJgDe8wcz
         HebZhkAEQMXeypNUQ0oRp+3Mg4BoIRDnIHHLjXlhkFi4opmbRvF2MqxF/44ZWcmZTF1/
         z2a2pRocWO8RW8wbymcQTHwvkjr2mS+qBFIAktQFhUofYjMh9mbrN9N9gOIY9qSvOqPY
         lqpF+tI5obS9hrLnLkYXsc1QvOG55qBOgS5lxmDOjdjZAkzWV2N0ebFu83eIACAXy2zo
         Hn37Z33P9n5eC34AoG+Y+FkmObUs8ZxXbllwR6PXYLQ65Bm8Ag0Y6DNS1w2efWDfX1IX
         OXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386810; x=1792991610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkfhRC/zk+m5Azmg5gexMfMEyLSDDmbFFC7w7dNWV0w=;
        b=hlI1cnO0xTe5cEqVO0n6nDyXTXh3nhcEtwSHZ2ujf/OTq/JmisvH6zwk1nIG3h1WR6
         b7/L69hEdcXtzgdyfvEWku3DD8d0YEnz3RdFUHep0CAfOh8gLvNFEH8xejsfAEXPynfM
         dIUl8UWXI4jTHp5eD/4XrJ2EOgHw/yqJ10GeFeEHCPoomlKMGeZQuz1oW5jBGUUrlXq7
         imwkCF1ssOlv0Lyr8pdAOl+NX5YkyNCTnnCaBmUnxYyZROqvrTRuxudxkmek7L+2YJeY
         6ABGFgfmM+qtCeKnbopZ/iFuwBQvnxqNW5yBHTUfHNjJzz5xGuTBiqQQ6hHB2ALkpSKT
         5ztA==
X-Forwarded-Encrypted: i=1; AKwUvBwzqvH4CCm6bs1cUvWPGlXO4XrNArx+C3/kZUgR8/5BfXeMfA547AhCoMprFH8GQdTys68QPxynFW+jlhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6tEH8KDtG49ULPQuDjuXc/TFS5H49PDjXIooTi/i96dOUedyB
	5hWcDlPZf7Ud4GlwNrnD5DuRN4w6iKPho7ShSZSFgQdxhDis2axqVVO3
X-Gm-Gg: AYBFou3tUQj1rkgwaTHxDjtd5mrv2lHFmiq8dNU8kCIt2u4qyJ9+I1NNEHy9wZL6rak
	leKqXv/5dnTALRJrTjGSQ/vyuUFQrrtvW4IT89wB8wBNWRILfTybPhmct2gdgZBUcRH17J7YyRi
	ZZq7pjYY3ZYllALCvZE+LxL3VuadAkoBmmrLhQ8D/pSOmAR2EKdoWFASKvRm0ShD6hux77md1qz
	DtvGsHCRiUyVJ+UkUjXbX5dQUTbfOBsXmpoW4C/Ldyy1vvlUc9llrQOPjawziCAn18/hxk6YDuM
	bDUstQumoCNTMx//I9avQZbKIxN+ZhT9xxPD3bZveuPwo4YhHL0nmcfJwmD3HBOJUyAt9Kz68Ob
	XGcXPkcPB8BzJOlWZkBUkq+iLH6wGJCgEvIqBYz9M1Gh9hxN8SW7s9EQiSplSz+/HYT3zpPZHgV
	8nD4WdmMVqGmqebYOJOxaaoWTsn63vNam9kLJsQuZNoGfAZUfCbKpgeqq+/CD5dmVO65Fz950Pa
	/5iTHdB/cMcu1+Oe5Y+H0aljTiBqJsgVg3W58ncw8L6ZLc0IF66t2xSGJ13S8KUs4oBo8ynzqo=
X-Received: by 2002:a17:90b:28c5:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3acef10d02dmr5660610a91.25.1792386810163;
        Sun, 18 Oct 2026 22:13:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm324373a91.4.2026.10.18.22.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 22:13:29 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ASoC: core: Warn about controls whose register fields overlap
Date: Mon, 19 Oct 2026 14:13:21 +0900
Message-ID: <20261019051321.2973771-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A control that writes part of another control's register field also
changes that control. Usually the bits it was meant to own are then out
of reach. 26 of these were fixed in codec drivers this cycle. Most
dated back to the first version of the driver.

So check each control as it is added. If it shares a register with a
control of the same component, and the two fields overlap but are not
the same, print a warning. Identical fields are not reported, as some
drivers expose one field under two names.

Only controls with the volsw, volsw_sx and enum_double put callbacks
are checked. For other controls the bits written are not known.

Add a KUnit test for the field calculation.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---

Notes:
    On for-7.4 an allmodconfig build gives four warnings in three drivers:
    
      cs42l56: ADC Mute Switch with ADCA Invert and ADCB Invert
      es8326: ALC Capture Recovery Level with ALC Capture Target Level
      es8375: DMIC Polarity with DMIC Volume
    
    cs42l56 is the one I asked about in the first series [1]. The ADC Mute
    Switch writes the ADC invert bits. The real mute bits are also written
    by cs42l56_mute() on every stream start and stop. Would you rather move
    the control or drop it?
    
    For es8326 and es8375 Everest confirmed both are bugs and offered to
    fix them this week [2].
    
    DAPM widget controls are not checked. Adding them would give 142 more
    warnings. 140 of those are in max98520, which uses the max of
    SOC_DAPM_SINGLE as a channel number. Should DAPM be covered in a
    follow-up?
    
    Tested with KUnit and with a test card that adds overlapping, identical,
    _EXT and NOPM controls. I have none of the hardware.
    
    [1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/
    [2] https://lore.kernel.org/all/050201dd5f77$4d32e170$e798a450$@everest-semi.com/

 sound/soc/soc-core.c     | 51 ++++++++++++++++++++++++++++++++++++++--
 sound/soc/soc-internal.h | 11 +++++++++
 sound/soc/soc-ops-test.c | 50 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-ops.c      | 48 +++++++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca..f33bece378b6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2021,6 +2021,47 @@ struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template,
 }
 EXPORT_SYMBOL_GPL(snd_soc_cnew);
 
+/*
+ * Two controls that write part of the same register field each change the
+ * other. Identical fields are allowed, as some drivers expose one field
+ * under two names.
+ */
+static void soc_check_control_overlap(struct snd_card *card,
+				      struct device *dev,
+				      struct snd_kcontrol *new)
+{
+	struct snd_soc_control_field a[2], b[2];
+	struct snd_kcontrol *kctl;
+	int na, nb, i, j;
+
+	na = snd_soc_control_fields(new, a);
+	if (!na)
+		return;
+
+	guard(rwsem_read)(&card->controls_rwsem);
+
+	list_for_each_entry(kctl, &card->controls, list) {
+		if (kctl->private_data != new->private_data)
+			continue;
+
+		nb = snd_soc_control_fields(kctl, b);
+		for (i = 0; i < na; i++) {
+			for (j = 0; j < nb; j++) {
+				if (a[i].reg != b[j].reg ||
+				    a[i].reg == SND_SOC_NOPM ||
+				    !(a[i].mask & b[j].mask) ||
+				    a[i].mask == b[j].mask)
+					continue;
+
+				dev_warn(dev,
+					 "ASoC: %s (%#x) overlaps %s (%#x) in register %#x\n",
+					 new->id.name, a[i].mask, kctl->id.name,
+					 b[j].mask, a[i].reg);
+			}
+		}
+	}
+}
+
 int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data)
@@ -2029,8 +2070,14 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 
 	for (i = 0; i < num_controls; i++) {
 		const struct snd_kcontrol_new *control = &controls[i];
-		int err = snd_ctl_add(card, snd_soc_cnew(control, data,
-							 control->name, prefix));
+		struct snd_kcontrol *kctl;
+		int err;
+
+		kctl = snd_soc_cnew(control, data, control->name, prefix);
+		if (kctl)
+			soc_check_control_overlap(card, dev, kctl);
+
+		err = snd_ctl_add(card, kctl);
 		if (err < 0) {
 			dev_err(dev, "ASoC: Failed to add %s: %d\n",
 				control->name, err);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index b844b27574c8..3866da8e3bee 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -24,6 +24,17 @@ int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data);
 
+/*
+ * In soc-ops
+ */
+struct snd_soc_control_field {
+	unsigned int reg;
+	unsigned int mask;
+};
+
+int snd_soc_control_fields(const struct snd_kcontrol *kctl,
+			   struct snd_soc_control_field *fields);
+
 /*
  * In soc-dai
  */
diff --git a/sound/soc/soc-ops-test.c b/sound/soc/soc-ops-test.c
index dc83107930e4..664dea870fb8 100644
--- a/sound/soc/soc-ops-test.c
+++ b/sound/soc/soc-ops-test.c
@@ -11,6 +11,7 @@
 #include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-component.h>
+#include "soc-internal.h"
 
 enum soc_ops_test_control_layout {
 	SOC_OPS_TEST_SINGLE,
@@ -526,12 +527,60 @@ static void soc_ops_test_access(struct kunit *test)
 	kfree(result);
 }
 
+static const char * const fields_test_texts[] = { "A", "B", "C" };
+static SOC_ENUM_SINGLE_DECL(fields_test_enum, 0x2, 4, fields_test_texts);
+static SOC_ENUM_DOUBLE_DECL(fields_test_enum_double, 0x2, 0, 4, fields_test_texts);
+
+static const struct fields_test_param {
+	struct snd_kcontrol_new kctl;
+	int num;
+	struct snd_soc_control_field fields[2];
+} fields_test_params[] = {
+	{ SOC_SINGLE("Single", 0x1, 2, 0x3f, 0), 1, { { 0x1, 0xfc } } },
+	{ SOC_DOUBLE("Double", 0x1, 0, 8, 0xff, 0), 1, { { 0x1, 0xffff } } },
+	{ SOC_DOUBLE_R("Double R", 0x1, 0x2, 1, 0x7, 0), 2,
+	  { { 0x1, 0xe }, { 0x2, 0xe } } },
+	{ SOC_SINGLE_RANGE("Range", 0x1, 4, 2, 5, 0), 1, { { 0x1, 0x70 } } },
+	{ SOC_SINGLE_S_TLV("Signed", 0x1, 0, -8, 7, 3, 0, NULL), 1,
+	  { { 0x1, 0xf } } },
+	{ SOC_SINGLE_SX_TLV("SX", 0x1, 0, 0x10, 0x20, NULL), 1,
+	  { { 0x1, 0x1f } } },
+	{ SOC_ENUM("Enum", fields_test_enum), 1, { { 0x2, 0x30 } } },
+	{ SOC_ENUM("Enum Double", fields_test_enum_double), 1,
+	  { { 0x2, 0x33 } } },
+	{ SOC_SINGLE_EXT("Ext", 0x1, 0, 1, 0, snd_soc_get_volsw, NULL), 0 },
+};
+
+static void soc_ops_test_fields(struct kunit *test)
+{
+	int i, j, num;
+
+	for (i = 0; i < ARRAY_SIZE(fields_test_params); i++) {
+		const struct fields_test_param *param = &fields_test_params[i];
+		struct snd_kcontrol kctl = {
+			.put = param->kctl.put,
+			.private_value = param->kctl.private_value,
+		};
+		struct snd_soc_control_field fields[2] = {};
+
+		num = snd_soc_control_fields(&kctl, fields);
+		KUNIT_EXPECT_EQ_MSG(test, num, param->num, "%s", param->kctl.name);
+		for (j = 0; j < num && j < param->num; j++) {
+			KUNIT_EXPECT_EQ_MSG(test, fields[j].reg,
+					    param->fields[j].reg, "%s", param->kctl.name);
+			KUNIT_EXPECT_EQ_MSG(test, fields[j].mask,
+					    param->fields[j].mask, "%s", param->kctl.name);
+		}
+	}
+}
+
 KUNIT_ARRAY_PARAM(all_info_tests, all_info_test_params, info_test_desc);
 KUNIT_ARRAY_PARAM(all_access_tests, all_access_test_params, access_test_desc);
 
 static struct kunit_case soc_ops_test_cases[] = {
 	KUNIT_CASE_PARAM(soc_ops_test_info, all_info_tests_gen_params),
 	KUNIT_CASE_PARAM(soc_ops_test_access, all_access_tests_gen_params),
+	KUNIT_CASE(soc_ops_test_fields),
 	{}
 };
 
@@ -546,3 +595,4 @@ kunit_test_suites(&soc_ops_test_suite);
 
 MODULE_DESCRIPTION("ASoC soc-ops kunit test");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index b3a719604ec7..497ea82c1778 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -11,6 +11,7 @@
 //         with code, comments and ideas from :-
 //         Richard Purdie <richard@openedhand.com>
 
+#include <kunit/visibility.h>
 #include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -25,6 +26,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
+#include "soc-internal.h"
 
 /**
  * snd_soc_info_enum_double - enumerated double mixer info callback
@@ -816,3 +818,49 @@ int snd_soc_put_strobe(struct snd_kcontrol *kcontrol,
 	return snd_soc_component_update_bits(component, mc->reg, mask, val2);
 }
 EXPORT_SYMBOL_GPL(snd_soc_put_strobe);
+
+/*
+ * snd_soc_control_fields - find the register bits a control writes
+ * @kctl: the control
+ * @fields: filled with up to two register fields
+ *
+ * Only controls with a standard put callback are described. For other
+ * controls the bits written are not known.
+ *
+ * Returns the number of fields filled in.
+ */
+int snd_soc_control_fields(const struct snd_kcontrol *kctl,
+			   struct snd_soc_control_field *fields)
+{
+	if (kctl->put == snd_soc_put_volsw || kctl->put == snd_soc_put_volsw_sx) {
+		struct soc_mixer_control *mc =
+			(struct soc_mixer_control *)kctl->private_value;
+		unsigned int mask = kctl->put == snd_soc_put_volsw ?
+				    soc_mixer_mask(mc) : soc_mixer_sx_mask(mc);
+
+		fields[0].reg = mc->reg;
+		fields[0].mask = mask << mc->shift;
+		if (!snd_soc_volsw_is_stereo(mc))
+			return 1;
+
+		if (mc->reg == mc->rreg) {
+			fields[0].mask |= mask << mc->rshift;
+			return 1;
+		}
+
+		fields[1].reg = mc->rreg;
+		fields[1].mask = mask << mc->shift;
+		return 2;
+	}
+
+	if (kctl->put == snd_soc_put_enum_double) {
+		struct soc_enum *e = (struct soc_enum *)kctl->private_value;
+
+		fields[0].reg = e->reg;
+		fields[0].mask = e->mask << e->shift_l | e->mask << e->shift_r;
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(snd_soc_control_fields);
-- 
2.43.0


Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18E3BBFAC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230707; cv=none; b=HKwdnijexzsCbWG6dvbU/cjaKStn0HtLaMuMfaIZyYn+0JhoW7SHepQ3MhQKznyejNE/OwAGqi7Dtg8K6stRVk5HKCpVeWsmkGl8H9PphNmgSzoWV458d2eFPGqZahHgfFcn6gh6XDl+vy+Fscon6HrNgpLetcFwov56WV0Ohg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230707; c=relaxed/simple;
	bh=h5/pNBfgIX4U6g7VbQJ8F76qJ/CQS74E8c/6/NUQOhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIFzX4RkZbDym2BpntngTShchzjAjF7ewws8vB6hRmkq1RtKKLBPloqFd/BBFZQVddaV/5SLQd9AgdO37uiueNS5YRCwkk0zf0pszwqL+nDPBlocgHMNagxB65gSo6T6pIPC8R11apVZyleIvMjN+PhYrQD0HPElG3mOhT4uS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXDUs3VQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXDUs3VQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1df146015so799805e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792230704; x=1792835504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPFE+T+UOex+WfaugXlY6Is3b+0jqxq31VIJ6jkwt28=;
        b=WXDUs3VQQv5xkhGeuSnTXjJV0izBKKhA1MjyCCJwNDZGXZ7GPEMxCwWyAdxdnDFnEI
         PJy4hv7MtCI/xzicgYs1pBeCwvxZoTzpwe+r5E9JYk6KoXCnMy9ia7HLL4LkPFx9ZzIK
         TdLhdeXB59cqyIPSFV4VQCpUxv+mKOGr9H7Y6udaES5bxw/KdrINm/v85iHQ6EVk2for
         7CW7XuN06OAUCidNE9WjzaM6FYo1C92aDemYl9eqzyG8rr/Oar0Ee4aNtuyVyYx60DOr
         QfePjTY3YE5B4QYwuVf5Wz9O4meNmoCNNGLWL0IeOc5bFWsY27MrO42nJD5fnsGpzfgf
         KWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230704; x=1792835504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPFE+T+UOex+WfaugXlY6Is3b+0jqxq31VIJ6jkwt28=;
        b=pvQCIRswil7IEAQZwsUTKZAwckJAoNoCO4YRNAAaq48EtPfBZuOtpD4A1lfJjzjobB
         y3PxsCeen09ZhxPshALPUbBwAUjPDK+0U60IarNWfKdW0g+IXUty1gK1R+FZiLJZw7IZ
         fAD37i1G68aQ5MekPH+Ez/MiLL8ZNwLAqZNFdUf2y1RljylKVZBXmUs/0LaaOWUcDpsq
         8F52BwmMK/UFSSqK+ZCXcaOf8UM1BCyTQ0Z+7lAhDEK0YMu0/+mGwRtbI/zC09cDIXWh
         rs5bVnZxKHMQjeaG5TI6Ejy/rVpqPk1tnaNvDS2xWzdPd85EwSfS5XLVlqMmpdm99XfY
         Rm0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2fIqTJGC0MAVRHQYOv/cMsWtLS6SUupDb/H3Sh/n4LGRG5ZfU/8WWkluiwUpBNUoeJihOihjMCNMhkek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ99iioEKElsKm5JqDU5hcF2S+eQ++9sfPgHO4YEVJ6k+8W2p41
	HQXl60j2OWX07L5m88DxstV+iPSOiXwDmBS22fBji7lpT+gj54GGyiNS
X-Gm-Gg: AYBFou0q/a9MuvlTTLCnph1JmmxFcnjYBjFJ1K6SG6MltsR9jZmPADwlp7zcLse5fQa
	H1nKmHJnnMRNplM2mR+02c3iUNwF4VmiLPZRNzfCsx+tpQhIWRT2oKMGdXmyugh7qFZByJzPkPk
	M0M11DC8YBXwpwCbpCPskPsSxM0vboBETRfdQupWSoL6SzO30fuj3Va7Xhkn4L/50r9Bngs/zQN
	doFijgzjn2iiyme7gf39cb/1tcPDOr88HYGNVYJLjE6/0pDnq2Us8DCM0T7i97SK3OPsxKeqzTK
	A84jUqDEvdpjgSD9KdoIQwUlCRoQkX9XNwr3H9BQSl+1I/cUXQhtoVghnUno28BGppksCxz7+6q
	KQCI8ds3Ki0vCh9ixLIZzfoF9BoRvvSEctC7esfcGvB+GTgR8I3vZutSFl6SRbUCyHPoGRUKrBY
	unroNevucVVV47ZetuteGUmvk+VQKe/JXC4JebZfL6iErcGUs6WiWPlaBwdTUn/8EEJVYKkFKBO
	xch6MWbwV8=
X-Received: by 2002:a05:600c:3556:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1d76051b8mr49522825e9.17.1792230703700;
        Sat, 17 Oct 2026 02:51:43 -0700 (PDT)
Received: from archlinux.dns.quad9.net ([41.90.172.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d30d778bsm97705545e9.9.2026.10.17.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:51:43 -0700 (PDT)
From: Keane Mbae <keanembae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mic-mute LED quirk for the HP 245 14 inch G10
Date: Sat, 17 Oct 2026 12:51:32 +0300
Message-ID: <20261017095132.20279-1-keanembae@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP 245 14 inch G10 Notebook PC (codec SSID 103c:8ba4, ALC236) is not
listed in alc269_fixup_tbl[], so the codec falls back to the vendor-wide
HP entry (ALC269_FIXUP_HP_MUTE_LED).  That entry only registers a speaker
mute LED (hda::mute); no microphone mute LED class device (hda::micmute)
is created, so muting the microphone never lights the LED on the F8 key.

On this model the microphone mute LED is wired to COEF 0x35 bits 2-3 (the
same register as ALC236_FIXUP_HP_MUTE_LED), but with the opposite sense:
1 << 2 lights the LED and 2 << 2 turns it off.  Setting
micmute_led_polarity = 1 makes alc_update_coef_led() write the level that
matches the hardware.

The speaker mute LED (F5) keeps being driven through the HP_Mute_LED DMI
string, exactly as the current fallback does.

Add ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV for 103c:8ba4.

Signed-off-by: Keane Mbae <keanembae@gmail.com>
Tested-by: Keane Mbae <keanembae@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf9..25f5b51 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1754,6 +1754,25 @@ static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
 		spec->mute_led_nid = 0x1b;
 }
 
+/*
+ * HP 245 14 inch G10 Notebook PC (SSID 103c:8ba4): the speaker mute LED is
+ * controlled through the HP_Mute_LED DMI string (NID 0x1a), same as the
+ * ALC269_FIXUP_HP_MUTE_LED fallback, but the microphone mute LED is wired to
+ * COEF 0x35 bits 2-3 with an inverted sense.
+ */
+static void alc236_fixup_hp_mute_led_micmute_coef_inv(struct hda_codec *codec,
+						      const struct hda_fixup *fix,
+						      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->micmute_led_polarity = 1;
+
+	alc269_fixup_hp_mute_led(codec, fix, action);
+	alc236_fixup_hp_coef_micmute_led(codec, fix, action);
+}
+
 static void alc233_fixup_lenovo_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4237,6 +4256,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
+	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
@@ -6033,6 +6053,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led_micmute_coef_inv,
+	},
 	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
@@ -7622,6 +7646,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8ba4, "HP 245 14 inch G10 Notebook PC",
+		      ALC236_FIXUP_HP_MUTE_LED_MICMUTE_COEF_INV),
 	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb1, "HP Victus 15-fa1xxx (MB 8BB1)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.0


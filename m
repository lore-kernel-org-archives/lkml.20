Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371794;
	b=JgiLmCIuq+zuEtW7BLB6a8U+JfCdQYztt/J/7tC/7aw67JgnJ5q9sUmX3Q6gmK5dxMjD
	 UfGkQ+Z7TYnn5YH+26Krq2q9XhnBWnYhaCUTlCCa3CXSkWgvtFHfcsylv25mUHD8nGe3c
	 QXkUpcFBJrDef9Iu5u2f5F+NMoukuSnPpWmldiJIpx0qzlD0DXUNDNbESmSSAtHwyHG/u
	 YqMTscdFim1syEVbeDbqSu1tX1qLL36iVNty2L3ZiyouuS3Nh64yHCZSXHSeVUby6gHlK
	 r7VRReeiZVaOX5I5Ll22t/q+ZABV4UOwxSwlH9dubS6pqskkXv7kmIWEn9kHzh+NXbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371794;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tuHTKQ6XJfRj9XZS8UAd8XjaJ/YdnRYwK8Ob8sqCJRA=;
	b=uEqvhtJvrfL2/iQCupxBOSBaCVr1FPcElhTDwYgWCdW9C9qM4lySKho2qjZrDgjTAfHq
	 PhaaKKeQAGM+E+zjutD6VV3P/0HB2JiD20hj56tFrxcRFO5x40XnikWqB4HRHn0xMDTzu
	 bs42gNI524FBCdsrViiT8mORA/OZWzcI9zEDHrPv2F7shmAa6Dv4AQ6IHKMqijZerSOTD
	 WGz454sb86dm7NKJXvzeRrtmusUYE4b5w69qjrC05IDaxAz19Xw4R0W3nFsZd8RFYovu+
	 mCzzHLme2naGWO7D10Jjn9yVPmNIToOcl8ZdnL4dAcR0wSiZSRprIMHwS878JBdxH2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=awinic.com;
	spf=pass smtp.mailfrom=awinic.com;
	dkim=pass header.d=awinic.com header.i=@awinic.com header.a=rsa-sha256 header.s=default header.b=VNm2sDi3;
	arc=none smtp.remote-ip=115.124.28.194
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com [115.124.28.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54010606A326;
	Wed, 11 Nov 2026 04:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54010606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=awinic.com header.i=@awinic.com header.a=rsa-sha256 header.s=default header.b=VNm2sDi3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=awinic.com; s=default;
	t=1794371783; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=tuHTKQ6XJfRj9XZS8UAd8XjaJ/YdnRYwK8Ob8sqCJRA=;
	b=VNm2sDi3UOYFj5htokXVyfeGIAiRZ0IH8ANmd5s1vu2t6akPNiLfivLtK0kRGExgl4F1x+0xtGI28DtOS9H1U+FhlP7MNsJUlXcMy8yJPFZFde2+TtUO7kAsm3xANmIkjzli/QABZ/ELQZB+aBtE8c13D2eB35jMXg55wx+fvOsBIuUsctdvSCpegeLRwzEg3ALKzPHrvqOf1KZQO8aJJECJPYv+WJ0pU0H60PBSqsW/KMfYQjRn4vKl+z2AFQ8FmlM27/Vf4gYY8W0M7Hycj9MN0mFsbfCuRhPgGYzFuZUAb5wva4ZdVsObGkAVnJA5/KY27g8qSK3+WXzIiHpfCg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07551184|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0292529-0.00012361-0.970623;FP=931226329642735460|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=guanlan@awinic.com;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.k.OzD4W_1794371763;
Received: from ChromeBook..(mailfrom:guanlan@awinic.com fp:SMTPD_---.k.OzD4W_1794371763 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 12:36:22 +0800
From: guanlan@awinic.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org (open list:SOUND),
	linux-kernel@vger.kernel.org (open list)
Cc: Tao Xiao <guanlan@awinic.com>
Subject: [PATCH] ASoC: hda/realtek: Add support for Lenovo Hudson
Date: Wed, 11 Nov 2026 12:36:01 +0800
Message-Id: <20261111043601.306427-1-guanlan@awinic.com>
X-Mailer: git-send-email 2.34.1
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

From: Tao Xiao <guanlan@awinic.com>

The Lenovo Hudson (SSID 17aa:3814) uses the same ALC287 codec with two
AW88399 HDA side-codec amplifiers as the existing Legion models, so it
needs the same speaker setup.

Apply ALC287_FIXUP_LENOVO_LEGION_AW88399 for this machine and add the
matching entry to the aw88399_prop_model_table so that the reversed I2C
wiring is corrected in the same way.

Without this, the internal speakers do not work correctly. Tested on a
Lenovo Hudson laptop.

Signed-off-by: Tao Xiao <guanlan@awinic.com>
---
 sound/hda/codecs/realtek/alc269.c          | 2 ++
 sound/hda/codecs/side-codecs/aw88399_hda.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..b33bd4efb51c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8664,8 +8664,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x3937, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3939, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3814, "Lenovo Hudson", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	SND_PCI_QUIRK(0x17aa, 0x393e, "Lenovo ThinkBook 14 G8+ IPH", ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK),
 	HDA_CODEC_QUIRK(0x17aa, 0x394c, "Lenovo Yoga Slim 7 14AGP11", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3814, "Lenovo Hudson", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 81ee8a3987fd..b204aabc5572 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -168,6 +168,7 @@ struct aw88399_prop_model {
 };
 
 static const struct aw88399_prop_model aw88399_prop_model_table[] = {
+	{ "17AA3814", aw88399_swap_channels },
 	{ "17AA3906", aw88399_swap_channels },
 	{ "17AA3907", aw88399_swap_channels },
 	{ "17AA3927", aw88399_swap_channels },

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858912;
	b=c3z5M5RXVH3gixOJrLc1r3JnctjmjSYE3DL61EfARYZruH4pSz+rqE2nkLjOYAgeAOXn
	 vCfKleEpUzfIT6agVihU2cuaSTRqCcgmg6gh20im9jNtUyeZLwd+GBlinFVgtHmmkkOsZ
	 7lJyUeuQgD1f8YzZEmoAihu+R87rXGUFW1pY5Qe97PvHyQip2/puGWn5K/i9Va7V8QQA6
	 S0KifUMWHleLgtYIUBHC6SQNZaFegg+tIRBvqwGB+IWGX5w2VrH61Iw4OVVST4zE7MgRt
	 MjWWJ+BHhk2M00QP/Rn78nVgPTDuKpwFbItzRpgniVIRopiV818ffpbIkBbd58hTA2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
	b=ZhFuQnUtgEX8g6VR2w1nQ4YYrVKB4R3V2gOfiwZUm2yOPj7v8aJoiOwgdiZW7tGFPSiU
	 CHa98SGnWJcxiVt4EY3fIJtPqATGjnpyoYZPGe0ijcPcoGYuVRPj7WdRnrCxj2BVfNTZe
	 w1Bq4I+75RiiVtL9WrQAfXtaLeb+PQdscW729GCLduuc8Khpz+wTZUZ4fjv0d19CuR3Bw
	 Cc/JEdoYWlRfPqCQPwFv5xeD/1ZenAz5yzGQyX92E/UgXq+BHubXFMdgsZ8PX+5IvPIzU
	 mT05mhfZK4WJCC/fuG4aSabx56Ort9QeO3kT73/rdVKbH4+MjxPCXxkanokzCPGjwkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYsc3YsM;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE4606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FE4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xYsc3YsM
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37071c0f42aso5724434eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858911; x=1795463711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
        b=xYsc3YsMIDlm9cNvL5JDf/5HFR22/6vUuA6KHp6dOJmjvB6AcMHMuBgxGLB3WnsZi2
         etFbLJfICER1FI99I2dEJe5et0BvyqeZVee5aKa7EdgbJcyos+4ICTJsDJOpjPbxhXOm
         V4kM71UEjwyXoD20sSC3IBSf0O9pmdW6M57+NeRmFKKvgnpZB9kS5pRCUmARUhy8tMEQ
         CWEFyREZZYUaIlNWKrkrT67hOPPb4kE52HsUqYlfxe0ul905BLMNg5/aXZl1zF5diqX4
         a3kVF238TBaR5lc/uhKSuC9g2AF7pbeNuAIGsuidkvctyPSWqZv9J/LTa53JXcJjWR0A
         oorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858911; x=1795463711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vppiE5gxznj74UdJS2Tym2SlxfMgOakao/1KPH+42W8=;
        b=tXCKvkQKIHctDvcoQABHe0KuEmxtpITzuMuWdo/nRxlpWyeQNzvMhJK0fs33mvu572
         zdieEwopATODJNiif0zg1mcals7Z1OSNGckrczQ8I3uJrRYorpttOLt1/k+78KJyZruQ
         mHbdMGppePH0mMSccitJlKEoThul/y99pMUxQpQppkznQ2BzVQNf8VhRHYZTIdGe3Xhi
         yxvtcePMy2nPp3EPFiiiGxPBnYZgW0h38bAfjMMHDPmjXJ9Zcy0kKlEsIeCP0fgYslst
         gAJ+dsTto1pRbLpNgJCRqty5n7UROO43JSrlM0eSdCIunVm7r7AonTR/A7BtOai95D0i
         V1Cg==
X-Forwarded-Encrypted: i=1; AL+hErHLbrWTHEUahV293d1kG//NhRBRnw9KunBV20nhSAF1uM/vpsurKYHt6ClVvS/QPTVeV2BQKn5T9K6zqvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HXtris464y2n+qS4AlZ86zLLIsEq1Ap5KNOOLP97IZWVyaWcH
	tYJhfEhC1m5nEIC0QY1DEQy5LdMUxklfsyFdlTdp8sAVYtysn3xukDr1
X-Gm-Gg: AZFdTZf4P9IlBXR5ddHVfWGQWdGHsJaDGlJQJXd2Hp6jzu8TPY/nWDDc/uMmGYK6cy+
	QJc1Q2CqqbRubgDyEbm6ZL+TTTxmQ1Q0RQpuBbJf/wCywlfJrcMTeCbRT/9D5cHxkUO+EIZ4kZ3
	E8v9nTW4RSRJnPlIFJcMEgsOK/j+ZLvcMCrCD8iHM4+r75JI4yKIGcAv0k8S4thaKGnBLEQucJi
	7OSTkT7WdEcXvqbS7bknuTFhWc93wqo2za1u5o4lvEeH/EmJAOK5qIuur8yMQ3GxgZF/ZpBWxsa
	wCVTFZMLXAd7T4uo16Essi0cWjuApfmOlLSSx43s3bQSNanQFXdVabwGqgYlXgNRRBDEajPAWv0
	F9x9z+bJd90phL1z8EJ1BFssIavmZAarmoD1cBhvfkIoUPLl91WP3mG1RCZKIOknl9EwcN8F4dk
	EfZMs+nRmtsCW/0d2VWz1qWtD32q9os8iorp/6YTf/42qvV98y2ghmQcE3lpvroBcgUymdbc11D
	dqcEBCZS4tOofsQnGVh0laMgnp/SlNh/NKvJNfQlybEFSJbxQG852ISlGmwTvrQojs5cKDg/F+S
	+T6EijPb/ZFRbUae/moCDpYTSCsUaCb0uDKGywL137IwYdSPxU83OBtQUYyUdcVYMbCl8zIkcIt
	jgNpVe43nia/evUOxAK/LTz3yh6UIzTsrPH8YbAu3ZqXqQ+n1iyZmllVOSQ5WhOZX//4z1Y0xRa
	f1L/zeByFU6HahCZuJ5fRE8EfG7WQ7Vk29vglcR/XuIeSe8+/lM8ao7X6Qh8ExKik=
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr11290341eec.24.1794858911326;
        Mon, 16 Nov 2026 11:55:11 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm36318888eec.10.2026.11.16.11.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:55:10 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Dorian Cruveiller <doriancruveiller@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Don't apply the Legion Slim 7 quirk to Lenovo V14 G2 ITL
Date: Tue, 17 Nov 2026 01:25:00 +0530
Message-ID: <20261116195503.11530-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Lenovo V14 G2 ITL (82KA) has PCI SSID 17aa:380e and an ALC257 with
codec SSID 17aa:38b7. No entry matches the PCI SSID, so the codec SSID
fallback picks the Legion Slim 7 16APH8 entry for PCI SSID 17aa:38b7:

  ALC257: picked fixup  for codec SSID 17aa:38b7

That applies ALC287_FIXUP_CS35L41_I2C_2 and sets up component binding
for two CS35L41 amplifiers, which this machine doesn't have; its single
speaker pair is driven by the ALC257 itself (pin 0x14).

Add a codec SSID entry after the Legion one, so the Legion keeps
matching on its PCI SSID first and the V14 G2 ITL gets
ALC269_FIXUP_LENOVO_XPAD_ACPI, the fixup the Lenovo vendor fallback
gives it when nothing else matches.

Fixes: 99af5b11c57d ("ALSA: hda/realtek: enable SND_PCI_QUIRK for Lenovo Legion Slim 7 Gen 8 (2023) serie")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW, 7.0 kernel) by booting
with snd_sof_intel_hda_generic.hda_model=lenovo-xpad-led, which selects the
same fixup this entry does: dmesg then shows "picked fixup lenovo-xpad-led
(model specified)", and speakers, headphones, headset mic and internal mic
all work as before. Build-tested (W=1) on next-20261113.

 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..73a89e3cbce4 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8605,6 +8605,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
+	/* Lenovo V14 G2 ITL has PCI SSID 17aa:380e and codec SSID 17aa:38b7, which
+	 * falls back to the Legion Slim 7 16APH8 entry above; this must come after it
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x38b7, "Lenovo V14 G2 ITL", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x38b8, "Yoga S780-14.5 proX AMD YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38b9, "Yoga S780-14.5 proX AMD LX Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC", ALC287_FIXUP_TAS2781_I2C),

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.53.0


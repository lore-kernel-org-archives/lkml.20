Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293738E5D7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726334; cv=none; b=e79XVdQJ6jUtjrCpMAYNSTsXR/AisY0hD/4mivbErbYSmp8KP/Ayq+U5EdsWKdhPfviuxgv3lku+F7zOvoLb7CxQj+Iq/GHHMlG+sV7BWxAQbXhl1VlbieKe1fniFFNZ724AIH5dJq+RRBtNNhy2zyKwmCGQ2SysVwrRnVA8dhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726334; c=relaxed/simple;
	bh=P6JMux5cC6FV4GKzJ9f+9AH3aGnVkce5RlqRDkGoTYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nafceOKSxC5GA47trO330v8z1mJSj1ZIhkmVospmIP9k15/nn0fSOvZ4asoEmlhac1x4gVk1s1LUmQT9NJCFr9dHXusv2/QwaYfvpzclRb98ENguu+k2MDCFADJUFPFwynAZT5PwvlOK5F23gHd/TsXPs0nqBkOBvd5PR4u465A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb2rFs16; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb2rFs16"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2588674a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788726332; x=1789331132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iz+jOMTRFswI96YUaCHrKXfF+E3aHFIXS8T0r+CTbmg=;
        b=Qb2rFs16VMKSncljykAXVtDuW8NVtXGQ2bglatwuVkwjBkge+a2nNfCtpkS+xDH9ya
         69rRMS+58BCqrGHv1yZTk0wkxd14+xgK5yuOD8cugGJOrXFJJYJzB5au72+H+rMh6q5v
         3KHvKJySXA0aLSBGfTHWXv+1e9jLIwUxnajUAY3odIoxmRzX29NEqz5ZobohhPoT2hmr
         x4YGEp59R0sThVC0CCoDrhlO/XhJ9aORRrTL02IeGKArX2kna2+iYmS4DkoioouG2Ia6
         nRmqCwMi2fI4XyJ6OL+A/YFz6VhwYuIn1tW37lkG9fAgUQk1mnEgyEdR2RvSEBP8GcjC
         1bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726332; x=1789331132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iz+jOMTRFswI96YUaCHrKXfF+E3aHFIXS8T0r+CTbmg=;
        b=Eb6r2G0jJxDoa+iUP2qoC9WfG64R+urj9FVNoFIgFEZa0jvFTuRV09m8QK0aATCwRQ
         a/sHNaN9IGFysDE57Jo/5RM8qN+YsbuXQYJTVHqaM6K/Cz+94h+cONh6G/csOVUrby75
         uWYyA5+qOZuD34wX2DxQvr1AoDoPuxkXpw79HGqDTHf9NBIeQqoeILU0SqBTv06bh33A
         qi63GeU5pLAYluNR67emQzFOZN12jOXV0f9tgYL5EQulyOpqwjqh7YKNnvUoPrRSsVrE
         xVBrJORFv0K2fZENxMJ62i2Vlc37rGrw0ifN2ynyfLrW7DlQNTy9mUFXfuSV3QGYMhPb
         6B8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrG87jbQg8WZeXRWE51rc4ziUe27UQWaha3Jvn1GQ9WVja9rfLNRabvMM3tD6BL4MqSwBIv1OWRfFwI6k=@vger.kernel.org
X-Gm-Message-State: AFuF++kfRmCuJsOKkiYg8gHfKhF86njFfQUGEzmzf6/aV9FOIiU3A6wR
	St6IIFOtbCIsHVXFfMJtUII3UXEIcSlpbvoeyhXFi7LhD26s56xYD7NsbGx52PBv
X-Gm-Gg: AYBFou3a6dEu4gILSZxrHa02T8DmYoru797HkjPSrlUL9u2ve8wWYn7buokR76mm2f4
	Wkp0DAAXfI1OAr683JUW4dwiWivyzv4Mi2HzlvDKhcKVH8VzzqwPws38ucsldYxN6cJOCHGN2D7
	M6k+Hpc1SGSwrufc4cH4bc5c8q80XPqdzQWAmsqJ6JBRUs7RVYleAtMptlgfSpaIMWpbR7dkyat
	qTKNbt3Ln/nlsS1r0cLBrXSfMrk4wgM24LqQmBA8G4q2BqfBVub/rtQEvHP4EErJkj8WIZJO8/B
	EeDPVHRDmcuZwsiYEX0shA1bm39ogXDbF7GIeOsxvzSYZgw9KoUgipz3CYN68RUudOX2yOQ+L64
	Uk7XH4MbTPcHO5A7k5SV1F+2KNHhCoHx3YUXNgKjpcLh/u/UZRkK8vF6nFi5mzMwz3ZBBOYYlDE
	LnaF3O1gz79Qk6yjElh34YOac8VPWfOB7xpOc7Ri1yqNdBf93z48XzQUsWGvz/nfFrU88RJYYAe
	EQQc3eS+jJy/KCiyWCesVN9e34a2eNB4EtENFXnhvAyxG67dBPPnRyO+9BKhYHJng==
X-Received: by 2002:a17:90b:4fd1:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39b261cfd8cmr28654971a91.12.1788726332444;
        Sun, 06 Sep 2026 13:25:32 -0700 (PDT)
Received: from moneychan.tail1efcdf.ts.net ([182.234.157.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm16742142a91.0.2026.09.06.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 13:25:31 -0700 (PDT)
From: Suzu <suzu1dev@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ALSA: hda/intel: Disable power saving on ASUS GU605CX
Date: Mon,  7 Sep 2026 04:24:39 +0800
Message-ID: <20260906202439.209462-1-suzu1dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the ASUS ROG Zephyrus G16 GU605CX, the ALC285 analog headphone
output produces a loud pop about ten seconds after playback stops
with power_save=10. This was reproduced with iLoud Micro Monitor
powered speakers connected to the 3.5 mm jack. Setting power_save=0
eliminated the idle pops in repeated pause/resume tests on
7.2.3-arch1-2, with power_save_controller left enabled.

Extend the power-save denylist check to cover the tested Intel HDA
controller (8086:7728, subsystem 1043:1034) on this board. Check the
DMI board vendor and name as well, since GU605CW also uses subsystem
1043:1034 and has not been tested for this issue. Keep the existing
pm_blacklist override behavior.

Disabling idle power saving can increase idle power consumption on
the matched controller. A separate pop during shutdown was still
observed with power_save=0; this change does not address it.

Link: https://github.com/omacom/omarchy/pull/10498
Assisted-by: LLM
Signed-off-by: Suzu <suzu1dev@gmail.com>
---
Validation completed on the affected GU605CX:
- Built and booted the complete patched 7.3-rc1 kernel; the native
  kernel build log contains no warnings.
- Verified that the loaded HDA module's srcversion matches the built
  artifact for 7.3.0-rc1-audio-pop-test.
- Confirmed power_save=10, power_save_controller=Y and pm_blacklist=-1,
  with the expected 1043:1034 power-save denylist message.
- In five samples spanning 40 seconds, the Intel analog PipeWire sink
  was SUSPENDED while the ALC285 remained runtime-active with
  power/control=on. This was sampled observation, not continuous tracing.
- Intel and NVIDIA HDMI codecs were observed suspended with
  power/control=auto; the NVIDIA HDA controller was also suspended.
- After booting this kernel and receiving the pause/resume test
  instructions, the user confirmed that the popping was no longer
  audible. The exact number of cycles and pause durations were not
  separately reported for this patched-kernel test.
- The earlier power_save=0 workaround also passed human pause/resume
  listening tests on 7.2.3-arch1-2, with controller power saving enabled.

Headphone switching, internal speakers and suspend/resume checks have
not been reported for this patched kernel. Boot-time popping remains
unverified. A shutdown pop was previously observed with power_save=0;
this change does not address that shutdown path. No reliable measurement
of additional idle power consumption is available.

Test-build context: an Arch-derived configuration with debug information
and BTF disabled was used. NVIDIA 610.57.04 test modules required a
separate local adaptation for the 7.3 dmem cgroup registration API.
Those modules built and initialized; their objtool return warnings also
occurred in the production-driver build. The NVIDIA adaptation is not
part of this audio patch. Full graphics regression testing was not done.

AI assistance: I asked OpenAI Codex to investigate the idle pops
and prepare a GU605CX-specific fix. It assisted with the patch,
changelog and build/runtime checks. I performed the listening
tests; results are described above. I booted the patched kernel
and confirmed that the idle pop was no longer audible.

No introducing commit has been identified, so no Fixes tag is proposed.

 sound/hda/controllers/intel.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 24015c73a..6da1d7ee5 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2328,18 +2328,30 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	{}
 };
 
+static bool azx_is_power_save_denylisted(struct pci_dev *pci)
+{
+	if (snd_pci_quirk_lookup(pci, power_save_denylist))
+		return true;
+
+	/* GU605CW shares the subsystem ID; only GU605CX was tested. */
+	return pci->vendor == PCI_VENDOR_ID_INTEL &&
+	       pci->device == PCI_DEVICE_ID_INTEL_HDA_ARL &&
+	       pci->subsystem_vendor == 0x1043 &&
+	       pci->subsystem_device == 0x1034 &&
+	       dmi_match(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC.") &&
+	       dmi_match(DMI_BOARD_NAME, "GU605CX");
+}
+
 static void set_default_power_save(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	int val = power_save;
 
 	if (pm_blacklist < 0) {
-		const struct snd_pci_quirk *q;
-
-		q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
-		if (q && val) {
+		if (val && azx_is_power_save_denylisted(chip->pci)) {
 			dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
-				 q->subvendor, q->subdevice);
+				 chip->pci->subsystem_vendor,
+				 chip->pci->subsystem_device);
 			val = 0;
 			hda->runtime_pm_disabled = 1;
 		}

base-commit: 45b5beb60bf7bd41c55ef17f6f2d28b351fad6c0
-- 
2.55.0


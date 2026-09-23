Received: from mail.amaanq.com (mail.amaanq.com [152.53.83.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4412D7814;
	Wed, 23 Sep 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.83.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146086; cv=none; b=EAjjd/GTX0J2kNyYbmtgCEs7io0O1jDtkFE+MgQYuYTcM1b50E8q6NMPBfjGdQG7D/MIxnV/jIJitb6P1l+GFGxf7xnN2wz6VufMHcnP58IIKOuDB8rAmBuMPSOrbDz8lLFpjhfQPKiekwkelpyDcCaS5Ri8lzzOJHsv2r+o6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146086; c=relaxed/simple;
	bh=PDFR/Iz0YmCDclPO9Hek0xEjbGKR0EVmrG6OozJ30jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVTGQQbfqTilIvZuZa+YZycSzPlC/TqqwcQ3L3m6QCSNwCC+gvvlWyIWGi3lCQat7duXtANZ/AFRANguV7f+3Xx0O855oSJqXnvXLxikijDG2gzN6CUMEPaqYGTxCUiYHkbl/i8n2XXGmxTg5vf2uOZFbN9ahEE0HxQOgIvJMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ikeepitoblique.com; spf=pass smtp.mailfrom=ikeepitoblique.com; dkim=permerror (0-bit key) header.d=ikeepitoblique.com header.i=@ikeepitoblique.com header.b=CCax0RLE; dkim=pass (2048-bit key) header.d=ikeepitoblique.com header.i=@ikeepitoblique.com header.b=m02ZwACH; arc=none smtp.client-ip=152.53.83.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ikeepitoblique.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ikeepitoblique.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=ikeepitoblique.com header.i=@ikeepitoblique.com header.b="CCax0RLE";
	dkim=pass (2048-bit key) header.d=ikeepitoblique.com header.i=@ikeepitoblique.com header.b="m02ZwACH"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260923; d=ikeepitoblique.com; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1790145945; bh=YFbfQCbnaM0rJGKCr6gM6MB
	UEqBCb+WQR9/6SV7+sqE=; b=CCax0RLEf/Pu6mXK4tdVdjBNC+DJ4B9Af3TtXx518EebHQZKQd
	/YNJahAR4iLHw0ilLtKm83N0fpvTYMgGVtDQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260923; d=ikeepitoblique.com; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1790145945; bh=YFbfQCbnaM0rJGKCr6gM6MB
	UEqBCb+WQR9/6SV7+sqE=; b=m02ZwACH2n/cZ4ghhOorPBBVrMgkj4Es3qM2rsavsukjQmBZ2U
	edH94N/8HMibS6GfxDrJAMIkeiMIxEij/N+ELPyirCKmfNBItuz6UN1CHEeQ+i9lMe/D43yhIWf
	IQm0BddJlgK/X6AtgmTBBx593ncy/RnUt3GzHMAgKyEYIxEbZGQwsJHdId9oIvAzd+AqwgOsIMV
	YmxemqOTKA5kVcUB8pqidhRaZQxlQ3MUxX/LQe7vG1pncYETx0Z1FAzIdU/kfyZVYt4lWQIZflV
	GCUoUzfWKUEaGWzuW8JAzj5G4pImjF9vM3FCa+o5iHv9GWCqrBCZ05mjNVrz/V4jmJg==;
From: Roman Bolotov <hadros@ikeepitoblique.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Bolotov <hadros@ikeepitoblique.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk flag for ASUS SupremeFX Hi-Fi
Date: Wed, 23 Sep 2026 09:45:27 +0300
Message-ID: <20260923064527.434441-1-hadros@ikeepitoblique.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS SupremeFX Hi-Fi (0b05:1826, 0b05:1827) does not survive USB
autosuspend.  After a suspend/resume cycle the firmware degrades: HID
probes begin to fail and the descriptors it returns become corrupted,
until the device stops responding entirely and needs a physical power
cycle to recover.

Add QUIRK_FLAG_DISABLE_AUTOSUSPEND for both product IDs.

Verified on 7.2.6 through the quirk_flags module parameter, with no
code change, and with the local udev rules that had been forcing
power/control commented out, so the parameter was the only mechanism
in play.  Both IDs were passed as

  0b05:1827:disable_autosuspend;0b05:1826:disable_autosuspend

The device then stayed awake across 2.5 hours (runtime_suspended_time
remained 0), survived a system suspend/resume cycle, and continued to
work afterwards with no failed probes and no power cycle needed.

Signed-off-by: Roman Bolotov <hadros@ikeepitoblique.com>
---
 sound/usb/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c659d6d..7d76c33 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2517,6 +2517,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x0a73, 0x003a, /* Mackie DLZ Creator XS */
 		   QUIRK_FLAG_ALWAYS_SET_RATE),
+	DEVICE_FLG(0x0b05, 0x1826, /* ASUS SupremeFX Hi-Fi */
+		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
+	DEVICE_FLG(0x0b05, 0x1827, /* ASUS SupremeFX Hi-Fi */
+		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x0b05, 0x18a6, /* ASUSTek Computer, Inc. */
 		   QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE),
 	DEVICE_FLG(0x0b0e, 0x0349, /* Jabra 550a */
-- 
2.55.0



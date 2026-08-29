Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28CB2AD2C;
	Sat, 29 Aug 2026 00:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964672; cv=pass; b=jg34kdpL+0obq6kDcE2jS1Nq9K3T/yyQnatzZ7wcmV9OjVyw5sp/CmvuJnn8NKEj0FHjdz5H7yRS6S5wuWGRwfC1nN6wwSexO4/APAeo1vZiv4A2rxk3sPCy9Qlx09aVgzfbFHRXjj0/9H6fRsPZWrH+XQW2FqX5+1XFI3W6KP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964672; c=relaxed/simple;
	bh=KcKC1lpd5M/MScUYNZMIZGW1zrmDVHSsSf9u2gafMIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8zR0UyDzaW7HQZGrb3ch3bBlvdpIggHgvKEo4HOYIHf6hklJmhHSW/Yk5ZZQLvgj/oeEnsRb8x9FatZLcD+9H01QqyWgTi2NpAgS4YWxU5PZDtPMkwzoVzM2BEJ1mIQiXV5k9kw5JMsEF67+5ZYSlXUCYQu5cESRKpimZapniE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re; spf=pass smtp.mailfrom=soh.re; dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b=SLWl0ZZM; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soh.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b="SLWl0ZZM"
ARC-Seal: i=1; a=rsa-sha256; t=1787964620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M0KixUE2X4FvSnv0OWv7T+6lugmnStjMWs0IsVa7cwEJ/RiTaK5ZUe1gsMXrCucc/cRaH+xQZhZdm5uY38vHHwkmyGhqro7PTzBq7Cn1OBZTOdLxkmNCn3tvFhY2hyryvJybThjnrVDXCLwWBpvwUQOqvokpI/Vf3MV4PnqISL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787964620; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eGLCFh/sS8kocbDCnBxw63CA+DWB2qQYWqmiwR0wgiA=; 
	b=WcoPGCS82fk14hSQffbYnbw31404I8E5CdQd5rCnzHNKX7AOAs6c8EpJ6hyL5xkLVe0jJKUSyB6qqVueicdjcSpMM3CFwAzYFPUjBd53kb94Kwu6BUj9jhv5ZxrznPgdnsab110aOVqHdZtqcsf7xw1zl0s6YmKANFAXy9gdTlU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soh.re;
	spf=pass  smtp.mailfrom=jon@soh.re;
	dmarc=pass header.from=<jon@soh.re>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787964620;
	s=zmail; d=soh.re; i=jon@soh.re;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eGLCFh/sS8kocbDCnBxw63CA+DWB2qQYWqmiwR0wgiA=;
	b=SLWl0ZZMM7t4OSXpwGMAGreXuy1BuvhrDs9071RTtGPQXpgWxJlD8ZlgAreXYvh5
	svrzK8fQgVNUhOboXY3W6/Qzo+WRIZDL3O9g20+GgJVttQLXQVbMOEcWtcVAY7GQ7rp
	X84lsU0JgfB/a8NnvuBfRnPmQOOhWGcGpMSkr8A0=
Received: by mx.zohomail.com with SMTPS id 1787964618085979.0671666183343;
	Fri, 28 Aug 2026 17:50:18 -0700 (PDT)
From: Jonathan Seth Mainguy <jon@soh.re>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org,
	Jonathan Seth Mainguy <jon@soh.re>
Subject: [PATCH 3/4] ALSA: usb-audio: add Roland QUAD-CAPTURE multirate support
Date: Fri, 28 Aug 2026 20:50:00 -0400
Message-ID: <20260829005001.534571-4-jon@soh.re>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829005001.534571-1-jon@soh.re>
References: <20260829005001.534571-1-jon@soh.re>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The QUAD-CAPTURE provides alternate settings for 44.1, 48, 96 and
192 kHz. Its fixed quirk currently describes only 44.1 kHz.

Add the remaining playback and capture settings. The device provides
four playback and six capture channels through 96 kHz, and two channels
in each direction at 192 kHz. Each setting uses an S32_LE container.

Tested on a physical QUAD-CAPTURE with full-duplex streams at 44.1,
48, 96 and 192 kHz.

Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>
---
 sound/usb/quirks-table.h | 98 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 35eef9cf834b..a1a33f11de4a 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1374,7 +1374,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 {
-	/* only 44.1 kHz works at the moment */
+	/* S32_LE; altsettings 1-4 match the device clock. */
 	USB_DEVICE(0x0582, 0x012f),
 	QUIRK_DRIVER_INFO {
 		/* .vendor_name = "Roland", */
@@ -1396,6 +1396,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.rate_table = (unsigned int[]) { 44100 }
 				}
 			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 4,
+					.iface = 0,
+					.altsetting = 2,
+					.altset_idx = 2,
+					.endpoint = 0x05,
+					.ep_attr = 0x05,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 }
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 4,
+					.iface = 0,
+					.altsetting = 3,
+					.altset_idx = 3,
+					.endpoint = 0x05,
+					.ep_attr = 0x05,
+					.rates = SNDRV_PCM_RATE_96000,
+					.rate_min = 96000,
+					.rate_max = 96000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 96000 }
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.iface = 0,
+					.altsetting = 4,
+					.altset_idx = 4,
+					.endpoint = 0x05,
+					.ep_attr = 0x05,
+					.rates = SNDRV_PCM_RATE_192000,
+					.rate_min = 192000,
+					.rate_max = 192000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 192000 }
+				}
+			},
 			{
 				QUIRK_DATA_AUDIOFORMAT(1) {
 					.formats = SNDRV_PCM_FMTBIT_S32_LE,
@@ -1412,6 +1460,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.rate_table = (unsigned int[]) { 44100 }
 				}
 			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 6,
+					.iface = 1,
+					.altsetting = 2,
+					.altset_idx = 2,
+					.endpoint = 0x85,
+					.ep_attr = 0x25,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 }
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 6,
+					.iface = 1,
+					.altsetting = 3,
+					.altset_idx = 3,
+					.endpoint = 0x85,
+					.ep_attr = 0x25,
+					.rates = SNDRV_PCM_RATE_96000,
+					.rate_min = 96000,
+					.rate_max = 96000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 96000 }
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) {
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 2,
+					.iface = 1,
+					.altsetting = 4,
+					.altset_idx = 4,
+					.endpoint = 0x85,
+					.ep_attr = 0x25,
+					.rates = SNDRV_PCM_RATE_192000,
+					.rate_min = 192000,
+					.rate_max = 192000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 192000 }
+				}
+			},
 			{
 				QUIRK_DATA_MIDI_FIXED_ENDPOINT(2) {
 					.out_cables = 0x0001,
-- 
2.55.0


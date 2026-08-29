Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6932AD2C;
	Sat, 29 Aug 2026 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964646; cv=pass; b=GTqmVoqkCqTMneRQ2rcZIKF5r4FbWNt+6jV9n9z25isSW1UqGHafSgKji8rbwV8IF54can7HrZl4E56ZvjDZblNMeNVRDwWB/5zhoHjy6wvbKa/+Ksn6jSIzZzoKYQhOMBBy2eOcCSPCybBo/zzAmEgK+Mejmw319miAOzMQZr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964646; c=relaxed/simple;
	bh=1sEjwqWvAkiIRdxi4jChkAhGZ+4ZN2MCUrB289Okz1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImEOQgtlNZGD6keCfMl/FR1lGxbzln4hd5snnKzTShbfLbFJj5gLGkSgcDjQLSfuA6IbuiTvNmotlacNPExw14gqmLOVJki9hxm9la9iFRIrYFsgwHPU0IEWWtl9wxhcEtvNCmEve740rTwygugXMcD7aMXHpd8JSWripJ8Xm6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re; spf=pass smtp.mailfrom=soh.re; dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b=LtJnCoeD; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soh.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soh.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soh.re header.i=jon@soh.re header.b="LtJnCoeD"
ARC-Seal: i=1; a=rsa-sha256; t=1787964613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mfH58SgtqNsQtdr5ZJZmu6V35YQ5SDTkoKbrb7o3SjoFwIwDtU4hHg39g6AqFdPie248qzPjQX/bdUQ4PDzYxpZKAqGL2sLEh8stg0CX26LW4oycO/2H3VQHRP6g40ZwYghimF3aSY/bi3ANcbS9+NJwY3GW5XeDPlT92HXscjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787964613; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lMh5TQOF+AgVpss4y7NGo4dyGSpcwBl56sCbbtKuyp4=; 
	b=ZGDvlWmhR+IRIISck6Y98O1uSHImHyryOsqTU2vC0psI5E2cPpW5bhdLEw8bQSkNN0YkHI50a5u5nQOiqd5aTwfb4w0Fv6DNYi+gDbQ5U1GlS0LxaUbcic52Lt6BYKoLDVHolCH5tc1XjBJEBfdD2SPkFs5ndbQiC8hUT6GIkj4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=soh.re;
	spf=pass  smtp.mailfrom=jon@soh.re;
	dmarc=pass header.from=<jon@soh.re>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787964613;
	s=zmail; d=soh.re; i=jon@soh.re;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lMh5TQOF+AgVpss4y7NGo4dyGSpcwBl56sCbbtKuyp4=;
	b=LtJnCoeDK5kefdCQuux/jQh83dauDIpK4qOxuCNJXIJ4TBhgyO4IYnY2PV4d8m4F
	8oBkTukY2Xwl3F/eMuTl79ZSfWPNBia0c6GkJEPReo8tnVqhkYCkjohLJ5hzfTXX4X7
	PCFnpAXDPHMgTuqmvbSzr5/OGtzhz76CpVaMrxmo=
Received: by mx.zohomail.com with SMTPS id 1787964609497689.1917788456784;
	Fri, 28 Aug 2026 17:50:09 -0700 (PDT)
From: Jonathan Seth Mainguy <jon@soh.re>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	niklas@aldervall.se,
	linux-kernel@vger.kernel.org,
	Jonathan Seth Mainguy <jon@soh.re>
Subject: [PATCH 1/4] ALSA: usb-audio: add Roland OCTA-CAPTURE multirate support
Date: Fri, 28 Aug 2026 20:49:58 -0400
Message-ID: <20260829005001.534571-2-jon@soh.re>
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

The OCTA-CAPTURE provides one alternate setting for each supported
sample rate. Add the 48, 96 and 192 kHz playback and capture settings.

The existing S32_LE description causes the white-noise playback reported
by Niklas Aldervall and other users. The device sends packed 24-bit
samples, but S32_LE makes ALSA interpret each sample as a four-byte value,
which misaligns the stream. USB captures and PCM streaming tests confirm
that S24_3LE is the correct format for every setting.

The device provides 10 playback and 12 capture channels through
96 kHz, and four channels in each direction at 192 kHz. Correct the
product name in the commented override.

Tested on a physical OCTA-CAPTURE with full-duplex streams at 44.1,
48, 96 and 192 kHz.

Reported-by: Niklas Aldervall <niklas@aldervall.se>
Closes: https://lore.kernel.org/alsa-devel/6b623cb6-3a9b-4fe4-a57c-9a165d261692@aldervall.se/
Signed-off-by: Jonathan Seth Mainguy <jon@soh.re>
---
 sound/usb/quirks-table.h | 104 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index dd02c6294edf..ef618a0f18d3 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -1227,15 +1227,15 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 {
-	/* only 44.1 kHz works at the moment */
+	/* S24_3LE; altsettings 1-4 match the device clock. */
 	USB_DEVICE(0x0582, 0x0120),
 	QUIRK_DRIVER_INFO {
 		/* .vendor_name = "Roland", */
-		/* .product_name = "OCTO-CAPTURE", */
+		/* .product_name = "OCTA-CAPTURE", */
 		QUIRK_DATA_COMPOSITE {
 			{
 				QUIRK_DATA_AUDIOFORMAT(0) {
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
 					.channels = 10,
 					.iface = 0,
 					.altsetting = 1,
@@ -1249,9 +1249,57 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.rate_table = (unsigned int[]) { 44100 }
 				}
 			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
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
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
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
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
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
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
 					.channels = 12,
 					.iface = 1,
 					.altsetting = 1,
@@ -1265,6 +1313,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.rate_table = (unsigned int[]) { 44100 }
 				}
 			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 12,
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
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 12,
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
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 4,
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


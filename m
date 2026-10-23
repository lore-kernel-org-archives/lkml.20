Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758428;
	b=bDCmkrzbLa3RPgTkL/m6F2vtRKN5pThk7UzsEs9cJOeZ12aOBsMJiFGizSunDZ8m6F3C
	 TS159CL3iqeHdsPgNitD5VLdq9TT6doN/deuJYw5sFcFdtFZQUBY57QQ0iQnzQPGd0KwI
	 bjeBNhBsqWJiS0ItPs42aWBoKt18wt3q6z/gyftXbTQlPWCbYZznw4EOTGoxkF6nWvh7R
	 Hd4XnbOxoy4nGspAWp65Lo61Ryrwg6pXq2ajjWbzqVxR5aw9y0pCVk0KrNCbgyAY6D64l
	 +uXCerJYrYzaKIrDLiNYmUf51DH9Cpy7BB3uZFGKBl/rKaYnoWOr/DDeoeAeuYVevHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5rFfxkItEyGktyLFjZAN1/ktJQTlo+F+VqHQTktoxH0=;
	b=d3/YXNCxkeTO53Pi5aAJyj31wTSDMhCpy35avyZzOwOIDQxQrZ+HX+mVZjv3aMZ+mzHf
	 85/39GsGZZzktEbHXWA6ZzsV5b7JdmA71ei9JzIGszKGQhVhl21MJ6iTBSgD+yCdR2h13
	 0hFh7BLcZle53eIm/C8U6uzBCm83h5vXWV68GpJ+3wp0BBEMScVsshkWJI9/DQf8AzArq
	 MbD2ql+OI/mNm7LK+kPLXZeV6hU8Z3msewHL5uXQpJqVghy6X2isjK53Kq/3H5kO+m7D3
	 eI4mbd71GmU8bw7pU7X+UqQnvukE7bGsFkNW2hoBicgYGYezccnN9Xa/kjMQqHzI4IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RvNVmHq5;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40B1606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RvNVmHq5
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5350d9ea106so8539011cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758427; x=1793363227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rFfxkItEyGktyLFjZAN1/ktJQTlo+F+VqHQTktoxH0=;
        b=RvNVmHq5wFHtOgZS9OwyMsQUkU0YYOMsbBoe2cKeY50Va8EWhjPCs9+BPvzikCFsK0
         VRANFqNZUh15pKtw4ivfalaG7MmMjveUmm+SsLvvSzS62hH8qnhjRZ0Gfl0ESSU22OCp
         OnAurTmJnJtXw770KLUYjUK9h+qnw69GH+YOI+qas1Wsk9S54cT0yUzmiRoYXCiDYYe8
         POBW2NRtDQx/wZfEkcG1xibVR1F6aWkv4UqEBGLOY2aqsvsfGOoeTxHmYaj7C7Q15kdm
         jL2iGGAIlV2+P/NEeFi2W5kFz0EJFpIYp7OC7vU724FbHWEdGSf7q1j+1zGZbtK2HtVJ
         Da0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758427; x=1793363227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rFfxkItEyGktyLFjZAN1/ktJQTlo+F+VqHQTktoxH0=;
        b=SV+qrbL9tGj845gScS3YrPo0x7R7iPsHVQJNTOPKQKbB0OtOOo/f+5oQf+mvsIAR79
         TYZt65OgwlreXL7pDn4D/D8ry+/YDkIVpNd+88RfRoU16cNcQGHX9rCrK1IdlraG9sGm
         bB9TUoOk+LkXsKWEE/tuM44wWdG58Q8OfLonzh9G8l6dt/PzfRfSER7p0apxDBFqYEfd
         5CKqRFhItG4bF57Aine4FAkwEgjiUIFvLhPyCoxWX2U+BrGRXQmhHpe5122IuRLEBbcd
         789XCZX9cR/2RD4TMbUQPs42OVESJbtO6EaYVCPaKY9rdwRCMsirTmW8WFKx+0at7WP9
         xm5g==
X-Forwarded-Encrypted: i=1; AKwUvByiWtfdcXYY8IXkTYA0LEwDTEVaohLsJwtZquIK45cx7hP4RQVVWH+B/haQWG9w7y+14W1EsVd6rkL5eLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlJg2A0/UDh8hYrTGLIvFIdzkS8v3AE2EnQisAY2S7PPywohJ4
	YQQpFnVp9Nc0sNTX55cBgnB/xV7sO1kyCOnxm56YgPPbBliaLItaJvw=
X-Gm-Gg: AYBFou0kFuIZQZlQUWOc44dNW93CVusNqQRPaqyNYbOaE4h1QfeeNlyudIeaWHhVqua
	oTiX8Do/ka/mcMhI8nzeEishuh0+HSJ0ek5seUZSXUWBIp9HQmRHieCeNgtdbxgUypDps6qRmFu
	bex86PH150kLw5nQLwRViOWB32vr7Wb8Frlfdi+0SFq6UsmikZfLTGJE0UgPAu7n5q5KCO0wWLg
	K/rpQjLZc3pZ7igvryNNo8JaBP0UCCZcXuVhY82pOvSzJbXTJNkpyMlY1wIcGn/LhNEKlvSc6S6
	bDprrl2NUDQLVHeJK4Wx565iCrM5xlzWjcvKy3onFAF5fgm+UPMYfLOGJGMohZ5RFJRRk0FlnmQ
	/WlKpgbUP+gFC0WbW+TMKK288RUC1l4RBhpjs/jjyRdOPndJIpQq/MCVE1swZYt7eKFtk7J99yI
	diWsXaWlbnzfUELqxip2veLxBEmYjC/UGc8RsL7BPmrVr3LKaAsS2AehMii85/2A0e4RdY4g87p
	jhVR+EQApgptLFpgZAD9FFF02ikyj0BtHtCukPsRrZMSFzFcUDjkp9WEVFfuCZgFZaFwKCk4b5S
	+MbwWBqW/4uamGdsVCNh/8awvrMuL42HBdMahKkkYG2Ba2eVVII=
X-Received: by 2002:a05:622a:230a:b0:536:3d54:a309 with SMTP id d75a77b69052e-536c2101b66mr28168281cf.11.1792758426626;
        Fri, 23 Oct 2026 05:27:06 -0700 (PDT)
Received: from raincloud ([2600:4040:7e20:9b00:7285:c2ff:fed1:7bde])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18b0e2asm15041051cf.28.2026.10.23.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:27:06 -0700 (PDT)
Sender: Shawn <rainey.shawn@gmail.com>
From: rainey.shawn+kaudio@gmail.com
To: Ajanesh Lal <ajaneshlal3@gmail.com>,
	Shawn Rainey <rainey.shawn+kaudio@gmail.com>,
	Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
Date: Fri, 23 Oct 2026 08:25:11 -0400
Message-ID: <20261023122513.1025684-1-rainey.shawn+kaudio@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Shawn Rainey <rainey.shawn+kaudio@gmail.com>

The device reports vendor-specific class on all interfaces, so the
standard parser rejects it and no card is created.  Add a composite
quirk with fixed audio and raw-MIDI layouts.  The id table entry
matches interface 0 only so that the vendor control interfaces (2/3)
are left unbound for userspace access.

The endpoints advertise no synchronization and the device provides no
feedback; both streams are locked to the USB SOF.  The playback entry
is marked USB_ENDPOINT_SYNC_SYNC so that generic sync-EP detection
does not pair the capture data endpoint (0x82) as implicit feedback
for the output stream; the capture entry needs no override, as its
.ep_idx = 1 already keeps it out of sync-EP detection.

Verified on hardware: audio duplex at both supported rates, raw MIDI
in/out, and complete patch dumps as SysEx on the MIDI endpoints.

Signed-off-by: Shawn Rainey <rainey.shawn+kaudio@gmail.com>
---
v2:
  - set .ep_idx = 1 on the capture entry: endpoint 0x82 is the second
    endpoint descriptor of altsetting 1, and leaving ep_idx at 0 made
    snd_usb_audioformat_set_sync_ep() treat the capture format as
    playback (is_playback is derived from get_endpoint(alts, 0)).
  - drop USB_ENDPOINT_SYNC_SYNC from the capture entry: with ep_idx = 1
    it is no longer needed, as the capture format exits sync-EP
    detection before the synctype is examined.  The playback entry
    keeps the flag, as without it the generic detection pairs capture
    endpoint 0x82 as implicit feedback for the output stream.
    (Both points from review feedback; re-verified duplex and MIDI
    on hardware.)
v1: https://lore.kernel.org/r/20261022164340.78664-1-rainey.shawn+kaudio@gmail.com
 sound/usb/quirks-table.h | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 6343a50fb..2e4f21890 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Novation UltraNova: vendor-specific class descriptors, fixed
+	 * audio and MIDI layouts.  Only the audio and MIDI interfaces
+	 * (0 and 1) are grabbed; the vendor control interfaces (2/3)
+	 * are left unbound for userspace access.
+	 */
+	USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "Novation",
+		.product_name = "UltraNova",
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* playback */
+					.formats = SNDRV_PCM_FMTBIT_S16_LE,
+					.channels = 4,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_SYNC,
+					.maxpacksize = 392,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* capture */
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 2,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x82,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC,
+					.maxpacksize = 294,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{ QUIRK_DATA_RAW_BYTES(1) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	USB_DEVICE(0x1235, 0x001e),
 	QUIRK_DRIVER_INFO {
-- 
2.56.0


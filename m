Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194213;
	b=y/ZqjkXzHAFQEcNnwR3HcTRF6Y39fpz8lBnrwrqINKHmqGrCSG6Bkl2YSryuTLAvcruz
	 +4IWXByAjQYQ6PI2zEFocJaw/9mSmktdo5yhr63VmUbu1fAUoBdWntkFl+ErAvHPUuk7w
	 BzLgluVJkvJKmq/n1mLngC48BZGdzt6rpG2+r7c0UOM2U1fAjj57y/PU6BZ4iTfMyoQKX
	 6NrfhJGTRDb142O+7uPyQ0jlQD2yJMA9nes87ieEUAvKlXh6PyTeLAaYt7uhJoFTBw6Z/
	 /g8K/eVzEyU9CeDl9/Birv8R0WakxYNixI94IwlnrMkZbRAUPVmlxKroAwWuueZ2I3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
	b=g80OHfymEovFq+kwc0iMc3RHetUUsuiBx+jCLPiekeh7k2z2SJJEdifkGo3phKSkCnzV
	 kcvcxXH1ndl2rUW2/p/LHeJc7PigNFGLMIvOlJ7YPkQXn8SO6ZQoANE32YbKwlsDGo0Qa
	 poUm/HSBZ8/DW7HqrU+IPvIrBF7QP30yS3HZDRhCbHSJglTjZi6LBHosKqWK14Ad99Vjr
	 yp9mCvvf3a6x2/g+yYp3v3UP0QJBimKPb48paOvM61+IoX8PERTD3v6L+x8lXI7I9crNL
	 wiiNSboYNjJHMuqrMShpFw3eqALXGdxTSKfMWwPeoISLg2HEGepIoHf0UO+XdTSDsPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvxrqJ99;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB41606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WvxrqJ99
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac99992373so7513171fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793194211; x=1793799011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
        b=WvxrqJ99zwvaqod4/2gjx2Pk9XxspHhavfGzN8VQcoRla9pZs5tMSXCjSlZ6s8jC+q
         d2UnkRjcL6/i+8RTPyWem1p+4mYqEnsKBxJ/ZfFwKvlJ8UQCnuZhUDeXgZEQnKumnp1G
         oiktPJuJpT6+lEfXOf27+phCY9pPBVCyq5FS2iueRe4UqWZzw/VyxRdzWfrAENWV3ElT
         3rMJ/Cw6BE9hZYu0e7d9pR+1tSl7TyOYnwRMV99Q+2fk4dMq3ueQtw+boVBefFxw97Ic
         u0kDd2pCu6OV41B9kQoLOC8YPO38kpBtCqSmeLES99dAGrl6aW1gruhdaruqRBQSWA+M
         FK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194211; x=1793799011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4Woc3XyMt/SHCxQyb8Mu+ku7o75W8y7G3fAoa1yCU=;
        b=XUDn+ZMX9G5wo/sd4po7fJGGpDHF2o+XHownduXxZlXMzmLDAZVAtvcJ0jbNfULIVi
         sX4JxM5VXZKnjwi0hKWaNmts3TEPwWT2lMMZw4mDQZXOR8dqcrbHjlc9gGlRM80H6mBy
         x4ufI1DATTyaNTSD4Sd1szohlPIIqr7dGjrccfzTNzYO5h9PQk72Uf3D68QHgdMfik+o
         OdL8KzCZK/oeFuZsTzUM32/bM04N0jk0RN6LmvhaX6uqXrYqYNBDQ6Z9l9vEphWv1yG6
         9g9dU/SYMOqv9dCtDBk02vDjtMXEtTgLEEm+faJzAdSUIwXPThKv/e96hyn7NLisqerR
         LwCw==
X-Forwarded-Encrypted: i=1; AKwUvBwRuzlx9wCKqk768sbihgy2+dKaBwGqs4qXnfUFCfvInpLky8yYjsz9gQcGxCX8Gout0hOCLFIl3rkKCY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPUliVsE6VWdw5hn/xyVbYinTaL9LJP3zSjJYzQhbEKfNZBJNX
	lbz+KwXJIhl4nRZbFUFyDI2tc/lwbFafYi7jG93eQjnQVeu+oyalsSU0
X-Gm-Gg: AYBFou0vz2y8/lh3YdzHPJPuotX2Wy7ugrNIoqCcZvJOdMXrPJ6Gnb19XvlDxNLsvfD
	NiPT+SjR6/DSA9CJcPWzMLgvWxCAE7gJEzmfPb3RBnL9xwIGVx/g7DKC8yH/X3zJjuJbHe3vKZh
	hkfMkVM/vNv0Pew9YfP8AJTov52EE5AAg6ssIWN7hmWYmxqgiA19sUNP/ntckj3Rwhn3ParPobg
	cJcJG2WKDnEGsO7SVEXiMg9PgmPSigj9DiQjcBBGTPXRMPPRBBV/6Y8gcPf2P9kqTvJjOPbzVkb
	LD4O22tK62a2bHOhpXOESrd1MTufa1AYjLjI7OGgM5bTwNBD8xnxYLiJUYTW40/BeL/Iwwupaki
	FOsY4Hcq3PVBoon4Scweof6s3rZ3qj7JjoNjg4kYuLMg7vH0YJ04Bk3ZVsur+V6w0EIAMXiPacT
	6+mTHHjiIM4Jtpv9RNXiz1NXYFWg7+F9FRUkh+NPhlB/VoF2mUk4WaZdNX+oi8YdLoNCbuxRnxi
	8HHPGSsJ69D1unrqbehl1cK31bOEJXSFKBPuqgfvn/GGhjTQvifR0fa/dfBCQ1ytaRVPv4mKeu4
	F2R30IU8Dti92ZPblfpGqx1Q95g9mbTFEvPG3H1SdXorExDgxmESZICZuLl5lN8HhMKlXeDi
X-Received: by 2002:a05:651c:54b:b0:3ab:483c:9149 with SMTP id 38308e7fff4ca-3ac9cf56f02mr4952551fa.17.1793194210831;
        Wed, 28 Oct 2026 06:30:10 -0700 (PDT)
Received: from NOT-THE-FBI.miamioh.edu ([134.53.242.65])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993a57sm30955841fa.12.2026.10.28.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:30:10 -0700 (PDT)
From: Benjamin Pryor <programmer2514@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Andrew Udvare <audvare@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Pryor <programmer2514@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Extend ALC1316 fixup to MSI GE76 Raider
Date: Wed, 28 Oct 2026 09:29:51 -0400
Message-ID: <20261028132951.1253841-1-programmer2514@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The MSI GE76 Raider drives its speakers using the exact same ALC1316 smart
amplifier as the GE66 Raider, but under a different hardware ID. Thus, the
same speaker dropout fixup should apply to both devices.

This patch extends the fixup that configures this amplifier's silence
detection to apply to the hardware ID of the GE76 as well.

Link: https://github.com/thesofproject/sof/issues/10475
Link: https://lore.kernel.org/all/20260909193104.26508-1-audvare@gmail.com

Signed-off-by: Benjamin J Pryor <programmer2514@gmail.com>

---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23aa175faedd..1d3f60ea9adf 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8330,8 +8330,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
-		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
--
2.43.0

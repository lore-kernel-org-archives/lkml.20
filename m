Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982754;
	b=NI4xUFe373SwQM8SLWq3V+O6C2x/DtYK6qoWhoKFj+/HotCGXa0GBTDLcOspNedoQCRn
	 nbKilNlTHtEoM9fm+Iealf4mrJB6c+70J6FCwrfeYB+gMmbltW+U2kjM4bWk48AIGefXQ
	 M2K40a80spN0d7qK79ixG4ypo1+74MtfGlB3qiOcHUfzfF7o9JC2Tkxnui8USzSZO3WdG
	 j4zwe9JJd3VXw5cU+QtEp41LaILfUi1tXp4ZjoL7P6Y/qOpBz8KxG0V4CnV/MnTCu8e78
	 YTuUpUUl67PFdpQ2MF0NbyzUJmhrmLPNQVJMAoH/I+DdUzfO0/UAkp8lsobnNbgMw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
	b=XhJA2TaZPBE852/edf6I3PxIBVGpPSaiLFWedAIkgb4V+jOHrxCBrVDcU9clDgSn/zKz
	 eOq/V9+LgKrGRjX265h8nSR1JqE7wn2eLq96CqmuodJ6lJ8xC8AcyX7SIEg8PcebShY9+
	 2L0gkoILWGS6QB9E6L3PCIWXjf4fuS5LvWlDAdcZoRbwtdWoByuVDQmjPlblloebybeMA
	 izT/3eapB2DWBREW5ZDb3JPEJyD/98xesRxwPLWxsYDnyKb6uHNP3ZITPy2QlLUehIAS6
	 pYE1bXjMfSKdw5Vs2HsYYYT4EKVGNEdXIw+o/OVx8viUn5+qlmQNWnNTamgokoFa+fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/V2FuDd";
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56013606D810
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56013606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/V2FuDd
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-833e671ee9fso875878a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982753; x=1794587553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
        b=U/V2FuDdEDEtf0+B1wT4SST0pLKV+HGGd6oDsQymSbHAm3iU1GikEmTVKVy1rc5XDb
         a2aWLDCh4UFk0goQV1fDJsXukBtJvmfs95xXAt51ZVsa2+LanjLb9v4PzxU8kLekXOEc
         kOM+2Nc6px6OVHJrU2sRzDL77BCHOC3CdBeweg2ReUOeV7d1rQUd9USV7A40tC6iHkxr
         46RY1OQLhm+2V0XnjjX2fJequ96FJrcTuHNH3Q7tyzabCZGPPfBWnePS7AorYExqSggm
         wRvlvccDiRq0kbdnXs6HyXwoofd52dvWDr2W1SYO2HheGd32pVYuhWGz63Ai5loHMOzK
         lAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982753; x=1794587553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6ShSOONdIeZ2z9nbJ4Fo059dFw0ZGNOijpRorR5LZo=;
        b=WJB6BIlTIrmzn2xS3KRPklnB9RORNb22VVybh1S3RftOOYTzNeJzXnOxel90arUl94
         lC09ApVmyF+59xIMbzjkszUFuUQflhx+1WwAB2BZvL3BuyPzP84EfjaUTDQM6+sqVBUy
         mOt2NR6mOWTGKMnIwkpFz+vQqEhlINZmIRpsocP8601mfbzplsB02Z/xW6eOBMY69qnW
         W6X46avxhgT8533jdKWJ0Ghof67slZsjYbJAP9SnbCdIinRbZaj5US9xeU0dlIYIPRSa
         JPhYsTddf4K9oLj/HbH2FMUp5FnGKPCxuW9cL3NOQhfAFPR2tZNig0eJkwqBkVhAyXTI
         KptA==
X-Forwarded-Encrypted: i=1; AKwUvByt5Tc0UQYwcW4pYAg4tYtanL51tRm2loL6JErs5jnSWCvpmpY9qoYiGnqLq+UATt+fMFaIIhFAuiixTVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P3zhPZkeB8+I1FR/9FDP+WvqKaVAgXTj/BRxZRTg+BPwWg77A
	mrJxa1mplXL+9+Vj8nwV5o5h6wxXeexzjKlkmNLt1/76Y7hlZ7cDs9nJ
X-Gm-Gg: AYBFou08queo+aNFaaJyJc7K99AUgdhzcuTbB8obo7YiFUtDSqWZ2QGclcuCFofRm6T
	Xg7EDKtOunBiwj/tEzgfuk+GiHOXEZu1BtbvhEgyNql0W79uBWPQxzYjwOZRckldVolTcfrfu0s
	sssAAm0yrmW1Ly80aZpoGiSeGgJvP+Wf+H6d00hp54pTxgiVxBL7QMMviJlTSdApN+uaLLX0iMQ
	DmJBQwKFd35y6eDOe+LbmG0EUe6lT73MnhO6ls9X/ZsXVeo8AsBvV554A6uNSK+ShfO+mfMWKhw
	opkUkIdISyKk5bZFEXIVMnt2Rq7HRzJWXnVMehnu7/fMuAFK0wlrN1ZyUMkC57O6qffTngDiPC9
	7BiTGDYyndEkTTPVug7hQ0MC7MeCQyixT3fB0HuKmzGlXfxJzGv9bTTwe/hgjZUkwpT1wub9d4V
	12LQn3V5sUc4/GYpB30VFNG50y6KbndjjjAwy5mdh4WYcIXt0RoRGxBLVAAJpFMpCkH6u+a4uL1
	fNsQGxm3d0+MF2ZJG/9C+UM/QGYQIB8LCqiUqNuLS/ZNrD7M2vxKPuKTeIhfAab8S1u483yMNmv
	pRP7tyJamyD1OB4qMY5d8At3nBm9E9ZJWTmFQwlZjCRmrQ==
X-Received: by 2002:a05:6830:314e:b0:823:e626:2764 with SMTP id 46e09a7af769-85f1cf83852mr3451308a34.5.1793982753115;
        Fri, 06 Nov 2026 08:32:33 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:32 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 09/16] ALSA: mixer_audient: Add readback-free parameter set
Date: Fri,  6 Nov 2026 10:31:22 -0600
Message-ID: <20261106163129.1006907-10-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
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

From: Christian Ruppert <arc@gmx.li>

Add a flag to systematically force parameter writing without prior readback
to certain control types. In preparation of the id14 driver.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 70ec3274a5e4..f61f9fe61345 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -39,6 +39,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 600);
 
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
+#define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	BIT(2)
 
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -313,9 +314,13 @@ static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixer,
 	int ret;
 	u32 val;
 
-	ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
-	if (ret < 0)
-		return ret;
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+		val = !value;		/* just make it different */
+	} else {
+		ret = snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (val != value) {
 		__le32 buf = cpu_to_le32(value);
-- 
2.47.3


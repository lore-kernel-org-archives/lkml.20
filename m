Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EADB48D899
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461880; cv=none; b=WmRYEm9yZ8VEM/L4HT5kH3cdrt+Z/jIuUMhgMbs4v7LAOZA9Cx8qX3t2Xpu5mMfAdHn2VQAooi/Q63mD7eXOCkfyyxp2iIhlJF1aBse2xa/a0zmt61Pu5cG5vknSyiQXNOoyoQLfnaMEc4BBM/XqtbzrNiN2z2s2/fB4g58kW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461880; c=relaxed/simple;
	bh=wEou6iCBaR8Arl13mju7oJ9HR10iviRiTLsvQYtRInc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbVz9MRGoKg2OcsEGdO6tdNN1U5Oy8hAhjcCeu6Q4EmfE2W5hEr1xCGKUyg0QRi6wdyM8WJgNUtc3qlkPZK+I+JcK/HJTL4j5xYTp1xP2sPgoBy+KmZVXk3v1Th7Qdq3/EqbA5PYeESUhucOqiamrXEw2FxY4Pwj7HTyZPyRNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7oDniFA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7oDniFA"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304833so2270631a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461878; x=1790066678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XgSRJYPXzN5Pd7ifD1h1NQICVqbFX7iB4kBPa0wx64=;
        b=A7oDniFAZM35s9UPhjHezIogwuzpt6M1RlyXUnPKMWoDzCSfTwvxo/qK3VPCd9PmQH
         XwBIpswPxU3uoF3P673E7yGL9550LLFTgbTvASbc/Fxw2IDBPR+UMtXckOia8aNgU9ah
         5b5FDlrSZRpAVGNHCsA2Etk6laFxK+rLWgWSw9HMZRld1hDyLezLCYfx9FEjjTAo8ZFy
         KL6AqjqYn9O2AyYP1Fpd+lqXz3ktBo6oSEiCKN9LVYcMgQmywZK4N+AN7g4X8Wgecp5Q
         G8nDnInjlwHUCA6VkDzVTwY2Urmq0SZLojYtJa9BHtxQuyypY3e9qGxAlx5Xu1pW6dRM
         rGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461878; x=1790066678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XgSRJYPXzN5Pd7ifD1h1NQICVqbFX7iB4kBPa0wx64=;
        b=1vSCWeqTcpXbf1QTt7qCsrdqs5tFylOOZ5VW+J3ql77MAJtCrLtzb68gqa+Y7EwegB
         ojbgHpPXzT/4ttWepnrvurDTGo91j68PsSWGibMztADnK6sYu5+kkTpRglMGrx4wz1vn
         e6vdwI+T8RCZQiEOE4S2oYhlE73jWQx2hgWho5D9YUIKDNnwqDcTXsXN1UwDJNtP5aXI
         gLaFKXI8lOqjST4ekGOo2ZiWtJe2vGXJ/pFFUhXWRv1OhhkktUQ2kcqwVduATcbjM/QU
         fv++Ix4oNGAShKc3kM/PFIn70nIj2cfosDsxe6o5rvfQNJp72EjBDC1dUvbgf82EJdkK
         nfAw==
X-Forwarded-Encrypted: i=1; AKwUvBzdVm3/t1topV1pvo5E7463QK7TVBdXWe8VBC6Ji2ByNbxO2LVpnt+9DApfjAi/rJdSjbE8uvyrQ1vsG5A=@vger.kernel.org
X-Gm-Message-State: AFuF++lM9Z9g4oA3eBZDBxbPGWPkgpFQVznIF34+K0E+62ylxVkf46Wg
	qQAV4+L7L77DMM3IMmEEYo4/NfjSszDkL9h+SlCHtjfYylYyc6cNmouF
X-Gm-Gg: AYBFou1t6nm0EpA+0y2R0LwrRogJkfCCBfOudSoppLLq9Se4IDrEDLQgCdR8ajiIo5c
	y0i4vxXm+P25dDFoDl1ZYAgoz4bpP4029tnoXhlsJ0xGzEFDX5kk3kbkkXvv2UrCdRAaIik2Due
	4HHWpUKJJmNKO2pYF2KUEWtXo4wWFsnILgToDsYCam/stW63ieoJ6IzL48YxXeScYyy561MFtFW
	YJrlXYR6Pqa2Yt/GUl0MSPld2uy8ZWC+jIG9hyjgJw5T7n6IepNkjSgP/nrtHQyKeYsfRGyAKnf
	oYpWJmxWW4mRb0wOOO5z7IcEn+Ff18WoFbbON+F68WRlcyPvFGVGk45Ff7wGnvaZVIg/fhg78UM
	Xc0xd5ZAYwGIPiZ9A2ffgy3ke/vR4BLyCuUyM/suw7HxTCLQr7/LkgrJmiPGCcS81dbQ4H0gNKZ
	mTY5HSKDcVjI2AD+bz2K0aALoAQoZpaIvnAGIm0bfgYUepRmHE+bIYUzPW2bgh75D3I31ALCLXV
	ORubNdmrIYEN7wuXWweuR5JEEAVAP46RCbO
X-Received: by 2002:a05:6a20:a128:b0:3ce:d411:8120 with SMTP id adf61e73a8af0-3db4052c030mr13488840637.15.1789461878280;
        Tue, 15 Sep 2026 01:44:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 03/23] ALSA: usb-audio: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:04 +0530
Message-ID: <20260915084424.1007757-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/usb/mixer.c         | 4 ++--
 sound/usb/mixer_us16x08.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ecaa8bc08d7c..33a6a1281410 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -786,7 +786,7 @@ static int parse_term_uac2_iterm_unit(struct mixer_build *state,
 		return err;
 
 	/* save input term properties after recursion,
-	 * to ensure they are not overriden by the recursion calls
+	 * to ensure they are not overridden by the recursion calls
 	 */
 	term->id = id;
 	term->type = le16_to_cpu(d->wTerminalType);
@@ -809,7 +809,7 @@ static int parse_term_uac3_iterm_unit(struct mixer_build *state,
 		return err;
 
 	/* save input term properties after recursion,
-	 * to ensure they are not overriden by the recursion calls
+	 * to ensure they are not overridden by the recursion calls
 	 */
 	term->id = id;
 	term->type = le16_to_cpu(d->wTerminalType);
diff --git a/sound/usb/mixer_us16x08.h b/sound/usb/mixer_us16x08.h
index 7b8583dd3b07..e98fe55265d1 100644
--- a/sound/usb/mixer_us16x08.h
+++ b/sound/usb/mixer_us16x08.h
@@ -60,7 +60,7 @@
 #define SND_US16X08_ID_EQHIGHMIDLEVEL 0x03
 #define SND_US16X08_ID_EQHIGHLEVEL 0x04
 
-/* EQ frequence IDs */
+/* EQ frequency IDs */
 #define SND_US16X08_ID_EQLOWFREQ 0x11
 #define SND_US16X08_ID_EQLOWMIDFREQ 0x12
 #define SND_US16X08_ID_EQHIGHMIDFREQ 0x13
-- 
2.48.1


Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701D395AFA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933718; cv=none; b=TX3chuHdI1J56lv5GcrzDNBAbu4n0vkwQ7ao7wsALgkqk8fASnDRcgFSC/9IxEdsdfKMmNSsWsc+ORF/c9tIMsD3ExEAvnSx3wCM8Q4zuGVnO10qNUSUZLrqa2QRB+Wnv/xrZ1yxy7oqf7OGlwIJS8b0i/L79pg1fTE0VVC2AjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933718; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvMBryYXWPZ0/DzzzOndOYhISVioCJmfaKEUZaLbli4vNLKXhfXkZNP0+rfogO5iDzdIyu7BaExEMN6ehZMKCFW+8QsiZxtj3I7/2da6EbI+jDHB9+0JXdQ4SifmA3A4sCX/TPBxJzyMESE+Oh5dsWcF85oLKAxyL66lq0or0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aedxISqV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aedxISqV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fd4531020so659804f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933715; x=1788538515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=aedxISqVpS+pC57LZB7dmiXtGX/IIah4W7huwcelL0msHfNLgoNCXtDYNavgfXVROc
         WdsL+nhgifb2CMafViZ4SUc71ijtj+iY1yXrvXtephnTKpnF+D92Ahm3UujYXtVb3STT
         HUrDMl/JmG2kUCImbscT9j/mBIzngTNlR4xyCpNknAlTX2LviGlIfNHDdiwPy7lwBRZV
         F1Nz1Y7KbTjpbrGXWDeo0eREs2I32FrX8EaugW8KR2GDKua5/YITzCLQacwivgjwqy89
         5GaCVsQYgBfrCKS95jClpQJX4dCCNQnCOHooWZZ5BgA2TlklV6qGXN5Oymt93FvomdGs
         iEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933715; x=1788538515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=P18Z8wtfkQN2Z9vDwKCi2i4l82TYt2tnGJeIeKZkhD4drMkdqHxoWN7OC19nSS9TfC
         e+7sabfrghfZ+7Iubhf8S0ToacuCWNNc1LChugTq/qQxHLh9+vGlmNSVdxXDwPj/63ki
         JJW+3Bd94U4ArU1BFDWwt7M4fFnbht3vsOxP6QXdGTd8YJA7cWl5usclPCb4rXLrwnY5
         yB0ELJskxmCzmuhdar8mtU60fnjyLNtKdIBOMpYSlOhbQ8z7cvNKm6RTsdxXHgAyr74l
         +1BBwepD/wY201D+K9ZBKT+zMAIuahuDh/PQ6b96bKFXG5prcHqsE0VWc7LdMG+p1zZH
         fC/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpjoiX56WxX3MGuaGp1PYdbjlVyjWm1KCA1tbDMiG20gF2SxhBYGboqRuxp3JNN9ZS5YaApDBCs6Np0niw=@vger.kernel.org
X-Gm-Message-State: AFuF++nlVwaxqhjNiOdNcWW/jQdv3S/U84kWMiSurDeUgaUgcQtUX0b1
	ZyrcuCtCUIHsjyVjzXue/o9oPe9iP9hKZ9E8lctdeNpVyAOdwZZWkmWi
X-Gm-Gg: AR+sD10Q+rFWdTUgsq+OMv6/nLtu4jr91YzrnDLbQvs/BpJDTHPi6vgw6SJ/kcIkj+g
	w7SUHlXKTYoVYtrAATjxU5IsKpUWZ19uK15owKdGFfYkNJWQoFBzK9VUn6Of3jr/OYwaJqJp00l
	gli+eKjnAjKC4M6cqQobRsEOSGO+rskVLDiK3vfrt4g5Gh3E/W7+A8anU5pIZ1u8gxC1lVqj2fx
	gP/44LrhfOicuEZlJUODjrAHdoBEgjJypCWoaV9mNiyMwsnAaFeGiV3sVHx9uTsEcnWk2yO7biu
	ksDH24qlpn5X4yedbMsJmEPPRB5w7s0Z6ivplmS5FxrOaYdGSyHLvCc0WAG8wCmN+TeuRigmOSm
	DvKryaW1sTAmv75JEcyn84sm0DvokW4eGOSZT0RrQ3zZhNwZJ9E9ej+5xhHQdqH2vjEWh0o4P+p
	3t57B/tkxNYSChpIFFcaREOF3iu1F9dd7Fos4WlfJgSCXg7c0zK1Hzy5G23Xrf+QEjd2WCjGd6B
	KDpFlXrlktXbfhs+GjUSnDZOzp2zerwmE8q4JJPRQ==
X-Received: by 2002:a05:6000:653:b0:482:eadd:174a with SMTP id ffacd0b85a97d-482f79c941cmr12152664f8f.17.1787933714909;
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 06/15] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Fri, 28 Aug 2026 18:14:48 +0200
Message-ID: <9b618d8076337f8129e235313cce90d86f95fc4c.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0


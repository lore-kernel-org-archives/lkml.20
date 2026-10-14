Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBC3563FA2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999260; cv=none; b=cs4X5zsjMiX0azNLMjVEDInhTFYuawjN5Sk1f+Jux/ReSYEH/ugxfHMiSe7tCmsdGInJsJbyodDsO4Ao3l88HCnWtb0w25V88m15U7mX7m+YZ2cUmtVSZZ2Fuf+SXYvkEGwuQi0H/erN5APoZvINInpiZbUQfQlug4gBIWI0lng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999260; c=relaxed/simple;
	bh=wYvYZooxr0D1eXxyAs7RyhlSeI5pKL4CUGAokR/iUDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oP48AB4zujg8eDTtxOTwB9wsQ4YJarVFTn2j/dRbPG6f3F/grYqkdhgpshcHMi2mjaRw9OEJPiTB6PwI7abT74pyA1NQ8V39rWLEcDLmUa0sqJpDgGvkLFrS2At/pmI3lfF2tE/KqMxXumdKDU8LicIA65S28Mb+nRBHkRpp71U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8jPRoKc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8jPRoKc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e5f8fe879so705656566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999255; x=1792604055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBS27E8nAsA1v/XdjrYHK0evNjP09PVvsY7+Bln2L+4=;
        b=q8jPRoKcFssfJ2HTRJ5epil3rJ+0kV6rz0Oy/wwIiwyQyDSJIkcaZrlS2OuncqHDTP
         rckpmHu5lA8jwe4yPG5qiKY8mUN9/F5Uhu3zxbszc0nMXK9R2yQNASkF/HHMVsBAJ5Lu
         9TLj9Fp3li6Lo0GkingmFvclt+YkRXRmrNB6a95+rBna97HI6k7BmMaN938noPoFVbuI
         uPsFRyXVP7AmVsn3rG+mQaQDNOXKZrrnpD2ZPOi1XG3pqfh3RTg98G5pU48wsYxl14nR
         XWCFzTPftzfGrrNWTIvnNCqH6DulNxS2YU/oa4WAcO2D0Kj6FTCbkkslBQiv4bBvCx9y
         zKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999255; x=1792604055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBS27E8nAsA1v/XdjrYHK0evNjP09PVvsY7+Bln2L+4=;
        b=vTW6sPm9MckSfYaMzKMV0c+Z+KZTpKy/GTN5i9dZiWt8V9D+CYsARZ+lsK9HAIBZPy
         OY8g/Bxpg9W1XTHTxnEFWVsjHwqSscuDwPbpgcPF5yyLyDJC+D+nNhDebDdSMXBwMNSF
         GtE0Jc059y2irMjqvejddhVeUhiAJStLBCVpNsE7kIurhutrOiKRWbbKFvJazF59qzOf
         OC2SStZmBWuO0aAly+QXyuF1SOGAkY7nUiJBOAAYzVj46uDTWSStfm6Hc41hgNb9ZL3/
         PiCLxJB3FswEMI4qM4SIWUoDkl2HiwtoOSZjHUTV1Dq0nSL6WYfvSOHNvaABGZBLNyld
         xcvw==
X-Forwarded-Encrypted: i=1; AKwUvBwR0Ycd7OPZKxrjcaR8qHtbaSHW6YzZDabYmMKeR/19xWjJkotCt0HommEciqVaBUAXIdpZE92JosxgczI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbiHnywGJIHxvxOfQtc85BSh/OaTUFXfy3aB8gUMkkB/zCY7NW
	EIMNpdtm/aGU+peeNPtNKcAJTyOwS2Cisd2W68j6omo9KtaSSv7cO5Ch
X-Gm-Gg: AYBFou3hVWlHG0m2PHmLRlXKm4+n7bbQj1MgPDcxreE2i6YSc/v9uyaRZVXLfb4SG3i
	LT+w0dDmr8DOk9TwHdwsVCAM7To425WY9bKQQ0sPPUh4MesX4oa73FYhEggjMyp1RARQtKFYgCD
	zeWtc8XNicayMnZTJn+9mMhQnDLYLnxdxodpr2E3k2cSBPfRrvRiZkEetJ/KI6g4CGZfSH71Xzr
	mRgnCuCPSI+b70Jahz1z/2Nw5LRbtOQcZRXHrqYis+iR3OfMnAVv+wHbkn8Bz7BVJULWzSuJ+oT
	RUGzOckGt8QeWnQJj1dj05HbaCYMuq/VYgAs4+q0r4mPE8vNauLkg8Q66qdP5x8FVW2Sykz477N
	x+rxNfOW2y+u5A9g4pNhb7vw2GtyvSkmKn0bhaZkrg99jrwJQKOg7DLZ28cduVda9iFGUmc6QCO
	v1feovKjoTgKaWcF6zlDvsmqlez+E9J5sdE4waNZ09X/Rffu39lzkywrbWYwAwmQNyDIv9A650Z
	LGaiNmpmbZJG5vE
X-Received: by 2002:a17:907:c611:10b0:c3e:e677:563a with SMTP id a640c23a62f3a-c3ee6775af2mr9419266b.47.1791999255183;
        Wed, 14 Oct 2026 10:34:15 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:00 +0200
Subject: [PATCH v3 01/11] hwmon: chipcap2: fix command error diagnostics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-1-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999251; l=1483;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=wYvYZooxr0D1eXxyAs7RyhlSeI5pKL4CUGAokR/iUDg=;
 b=W3cZt9Sh8KFwjVGXwR1flSOtWOTHFmIVMNX6I2ubqpqua3O9a5Mg9wKacL2nRtmFId2xkL151
 sjesXFvVNTADlEBGndnR8LpVzGvdu+KCFrog5i5f3A8hnltWiq1OTlM
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The command response field only contains bits 1:0, while the
error flags are stored in bits 2:5. The existing diagnostic
checks test the extracted response field, so they can never report
an error flag.

Test the full status byte for the error flags, and check the
configuration-load flag instead of RAM parity for the last diagnostic.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 9bef767b589e..855057892852 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -167,13 +167,13 @@ static int cc2_cmd_response_diagnostic(struct device *dev, u8 status)
 	case CC2_RESPONSE_BUSY:
 		return -EBUSY;
 	case CC2_RESPONSE_NACK:
-		if (resp & CC2_ERR_CORR_EEPROM)
+		if (status & CC2_ERR_CORR_EEPROM)
 			dev_dbg(dev, "Command failed: corrected EEPROM\n");
-		if (resp & CC2_ERR_UNCORR_EEPROM)
+		if (status & CC2_ERR_UNCORR_EEPROM)
 			dev_dbg(dev, "Command failed: uncorrected EEPROM\n");
-		if (resp & CC2_ERR_RAM_PARITY)
+		if (status & CC2_ERR_RAM_PARITY)
 			dev_dbg(dev, "Command failed: RAM parity\n");
-		if (resp & CC2_ERR_RAM_PARITY)
+		if (status & CC2_ERR_CONFIG_LOAD)
 			dev_dbg(dev, "Command failed: configuration error\n");
 		return -ENODATA;
 	default:

-- 
2.43.0


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D773911C1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856771; cv=none; b=AggICKqGQbPWbLBCfc1+3hxQpbGYRkP+IBZ9et4EmII6p/G+HumbkyELELDD2qJLdztpnFNsNBOKUbQfFb6jt1mm7gaRbbY2hu9wFfTxzybCSCFDPGu64K8ILufVmU4Ay1sKan2jvKHuTJQQDBiB8pciPivUeDpnRueePGF9fTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856771; c=relaxed/simple;
	bh=ynDCyRyx0YRpfYn7EZwrTZMMdTMxmFqgMrh96xitSRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asI6VQUKtpb0chzg+RHOK/oGokTUIweypGmhus94Yr4EsnW7Wdm5oblJ4aQYBETr3bMviecLFBLaUTMOdEnrC7+crkCFTOZEh/BKPS99NYEJXIe5MpGOlaVL8fXLfDf6QWqAdu5cNmlx2EQoBpL/zfamUUP//gVrWeL2ZwVosgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3zUN0KA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3zUN0KA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso14219785ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856768; x=1790461568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhVtdGz2dTM2a2C4ypaH/vqNyNg6K2RZqdkAXsZ+5po=;
        b=U3zUN0KAzuyV9bLFAHZJ3Oje3kt8QjTYTxwBYIvxQWvwCk66nRTYSLbfKJdT3WuEtx
         +ZWFqCSM0rkrAPhaQhILO1PE3jvI5m9qSRrNU7/C5V8du/ZAXVaabWm+OXmLOl4FNCkl
         QIpyZuEwHlRClA/OQAc86RiaoLQv6GIoPLUePsgb65bKXLhwanBNoDXZmiu3tZK7MTTn
         8Sie1xqRRZo6+hcxrxm3HfGh3xbwnX+Al3IMGWB8ExIpN/4vO2SwJFm7bvAc+gM7xp8q
         b7XgPjcO+vV8pdUY38wsIcNDUy10jpJ4rP2USCOUJ59aw1gkEd/j56kUtbUab7EZzNfA
         eghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856768; x=1790461568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhVtdGz2dTM2a2C4ypaH/vqNyNg6K2RZqdkAXsZ+5po=;
        b=h2iaYViKWv3uXV98UjNI8dDlJpoFSihdrmDkNlgh+zgaebYwNxWwZboLxZ4ndkXpX1
         083bl4jnKjItVWFzswrtb1oEmfrT6Few5hQNFKIELQq4Tctf1zno8FxfZcgE+hpeJxCs
         8EwPin0X45RsGcSddKs8eC3vvsjy9X2UtrCTUDxB0tgvTrIigNvWMNMz9r72YUX0IhFY
         ZIYFAO6RPX/ygn2Ss4KiFCMqUhR5a2DsYwAOh8JCbG826sGFAvEMc1QUrqk56ft2bcNA
         tFT4SkJrkE9Czw33qpBVXYre1NgbTF+CDI2u+9o3IudLqsiAy54gme0U6uD13xEsliyJ
         pz8A==
X-Forwarded-Encrypted: i=1; AKwUvBxyCyRJT+35MchnUtWsL3uJuYQqeRHTOBrkA1voLbaAmvsaJWGUcAJy+ZHrdtOoaAB8qi92EjHZRCWXCxs=@vger.kernel.org
X-Gm-Message-State: AFuF++k2doeUe4/yuufz0MJLD9BzzDMtaoc5Bych4JierQkPu+68RwIy
	S5hRkaSdyDM5YbWF+ZrOZx+vOahJYnAByYQtPLeZGkqCDXFSj7Yy6ooTdIcrp058
X-Gm-Gg: AYBFou3c3bvczajHqiQ2biq2yVZOBlkAICRwA6H29OjvvNh+gyZdQPswRDY8DYSVeDf
	WvQlHc7bG6iVakHOE++4iAnwvF7e3YPOV7AGTiiYi7s65cTWklWgUeCAFT5DtytQdN3VopBa4F0
	Ge4e76lalh8qDrt4PoPWZzcDwYkXNrWEktbloDCGSDRvKMYTkBLvIsBtbMrkIApRtgT2rEnv//T
	LfuSkGmPhQ4/OFgUraM5X6SWeCa4Yh+MLKMkjBd3HQTUbpo9VUagfh7dWA+OK7XXzE6hpfnxXd3
	skrq3Qv0196AzbRWyPnTzDCYRLP7PVBsXL/UzDBU9I2mwHUrrGs6ycOPiKPKxZ0GB9sgwmPec/v
	ObZx7pPKqGZcpFF1KIimOuHgzHqbd3p6TXzuy7pPaJlOWmlbFlt8uW9DlqOUtkqcxEsWof4VqSG
	reCBcQ7o9BcYjtF0L3wUdJPyhqNnNwJPsZ6/HVd5dOoFf5jvgHMrjv+aS5fxwUdlltZrlL9xvcw
	HBN3sTsB28PVBHzuVsyglLY9PcYuwgnrxqPf0SKIKYaj5Bzw/TwjoubMtbyEqx04c+APLx6IHdj
	dAI61FAt+g==
X-Received: by 2002:a17:903:32c6:b0:2dd:ad74:ac29 with SMTP id d9443c01a7336-2ddb1bae2b9mr101877825ad.27.1789856768286;
        Sat, 19 Sep 2026 15:26:08 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df378440f4sm7398615ad.59.2026.09.19.15.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:07 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] romfs: reject non-advancing nextfh offsets in romfs_lookup() and romfs_readdir()
Date: Sat, 19 Sep 2026 22:26:07 +0000
Message-ID: <20260919222607.3794829-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In romfs_lookup() and romfs_readdir() (fs/romfs/super.c), verify that
the masked nextfh offset strictly advances (or is 0 to terminate the
directory) so a self-referential or backward nextfh link in a corrupted
RomFS image cannot cause an infinite loop in the kernel.

Fixes: da4458bda237 ("NOMMU: Make it possible for RomFS to use MTD devices directly")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 7f783d6173e8..4d787ee06d4a 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -191,6 +191,8 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 			    romfs_dtype_table[nextfh & ROMFH_TYPE]))
 			goto out;
 
+		if ((nextfh & ROMFH_MASK) && (nextfh & ROMFH_MASK) <= offset)
+			goto out;
 		offset = nextfh & ROMFH_MASK;
 	}
 out:
@@ -223,6 +225,8 @@ static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 	len = dentry->d_name.len;
 
 	for (;;) {
+		unsigned long next_offset;
+
 		if (!offset || offset >= maxoff)
 			break;
 
@@ -246,7 +250,12 @@ static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 		}
 
 		/* next entry */
-		offset = be32_to_cpu(ri.next) & ROMFH_MASK;
+		next_offset = be32_to_cpu(ri.next) & ROMFH_MASK;
+		if (next_offset && next_offset <= offset) {
+			ret = -EIO;
+			goto error;
+		}
+		offset = next_offset;
 	}
 
 	return d_splice_alias(inode, dentry);

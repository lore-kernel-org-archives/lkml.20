Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8531E84B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220935; cv=none; b=svnXXV9cdEvu9mJmok9HJIGWriQOsZwEBdO1x4bnOn+DuedBn/mhpqv5g18XCER0QW7lSbFWYLz8bzqCZK4cvbRC4Yczw4uynnNSXeNBAwyCfYdmc1NHafqD2yaymFJsbDE8qBakKS9bCyxGNIdsztLK7806wDQxuNpJ7N76AzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220935; c=relaxed/simple;
	bh=6pVt0PUQ4LIcwar5ugRNpizavgzQxLUwL/Y0pJ784AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWyzT9fGtexs5OlBOisw8/RL9DvgdwmbIlx/oVI5Cle18sCCKJQ8EhHf4X5hZRiKvWbgPFVoe0M8uhqr1PmL+rHnPQNwP+zXmaiyyUc6tD9NjbIJy3K7eyHO/qlmoEDSekh4Nb0r79W060OcV1s8YtlHkOOChLBWDNeSR7IwHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noFLW9/R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noFLW9/R"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so228861a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789220933; x=1789825733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRE9clLLWxIBFYz3gEl3LiQKErgqN/9gBQjM8vZ0D3o=;
        b=noFLW9/RvD48s1Bzji5giq64hw/CN0vnaB37wiuJrOT3kmOVhLEpldiR2JrG9ga5k7
         wV7JcpDb4uiGR0VP70bAH4SXgjVZ6k/+TISyQxocLUzmbF+Dvfc/08db8ghV4arH+cu3
         9th/uzeE6upQfpyqKFn2ZU8McvEdcnqN2ytI7i4NmYvrpASfZNXZJXnZsNaR8mPYy68K
         M+Bk5SpoJFprIiZQX9ninYR7eI3TeXNc8K53Ye4JovFaRzJ+0dG6kZU4Wz7fbvP5tqIy
         piQkPCBXUL2Toulo8jTcxzSYMupitNr3hrHo9jBMOzeu8zKdF1EkdLc7SuHz7fgVnb61
         UMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789220933; x=1789825733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRE9clLLWxIBFYz3gEl3LiQKErgqN/9gBQjM8vZ0D3o=;
        b=hx5ciqcR9c27p85aAL8yWTkl4Y+mrZANhtMp7ODlV1kgCrdBfAMdfIOQt0NKIlIgnR
         stcNOBw5hsriNOy+i5l9UCZ9d6XTu/YE/rjnSqQ+g5LO8330mWPj8v0O24RuKC1Y88+X
         CSw+UUyNcVvlMo/lERvtNclBFbbl31PwfYuQ7Ancaed+2/D7NeIPzZxg53ZkW7dlhFHS
         +sxz84dVPte7wcGhzVnD/JuM2khnTzxeEUH+foJoZWXb8W/a2lvQuZQEOFdTk3LkF979
         aUXxkRzBK+hr0U4ovJIWUtRW+GtA9/zZoesy6inANJh776KCDjBUtKjDkXDHxfC1GOaK
         x0Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/1J6StfdpdZ00K6JzFlFIk6Hvq1GVK9WrU54cjYVo+q8QD4i+lwTjpiPGu+D3vOXOKNKA/ARA4/sYV8=@vger.kernel.org
X-Gm-Message-State: AFuF++kHn2yN0UmmifwhqP2V96P4pswF4bcj8CtoDXdTnJx34tBb9Rsd
	dtvzRAVP2Rvk0porwbWzbyzuRukiC7+bkSmYEsuHiq22DC4M5xo/O2lQ
X-Gm-Gg: AYBFou2x0YvAo5Ra2G/M/iMRvTCJHqHHfcVSVVt5YANuAzzL4DrAjOIuj6ndtDRBjfZ
	+H/tTm8TbJC4XmqQZGrBFnRUCEiVTlIPS+7aA6Vc047y2hI7f825h/dIbIPx5/y9S9rcmoQjfdb
	XUVhsf3fUYOqgjBNgqHuruS3NmpTGi0RMqkJYfLa3j49oqbmAW4QzfnDS6JM5unWnVlwXbGkwZ2
	TnNdlpuLTh9BLspZzE9viRrygsQpyVJYg+GLJpIwWlv/iLgzSyBgtGEXBYU1+NkISI9Q/GER8ya
	OramEe5cysA7mHf4w0D4Xg0Y3a3ZanlVrTaFUflnpzLOd+E4n50JimxvbBWi9RS6mn3bXjo/hgL
	8bCygp7y3G3HgOsdNCbKcKExfYJaHyUPm0JUprld/9lvdhgbsJIpom+/tH1kFpLUrGpc7p1MIpL
	ZpfBXZX8yYdby1cfbFWmw0iMx/jMVG903FFTOjD5fmuAnFWyMaq5TO929xXw7zbRB2
X-Received: by 2002:a17:90a:d410:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39d980ac288mr8416579a91.12.1789220932772;
        Sat, 12 Sep 2026 06:48:52 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm11078347a91.0.2026.09.12.06.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:48:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Paul Mundt <lethal@linux-sh.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] cdrom: gdrom: fix gendisk reference leak
Date: Sat, 12 Sep 2026 21:48:21 +0800
Message-ID: <20260912134821.981705-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe_gdrom() allocates a gendisk with blk_mq_alloc_disk(), but
remove_gdrom() only calls del_gendisk() during driver removal.

del_gendisk() unregisters the disk but does not drop the driver's
reference to the gendisk. Without a matching put_disk(), the reference
remains held and the gendisk is leaked.

Call put_disk() during remove_gdrom() to release the reference acquired
during disk allocation.

This issue was found by manual code inspection.

Fixes: 74ee1a7590b78 ("cdrom: Add support for Sega Dreamcast GD-ROM.")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/cdrom/gdrom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 4ba4dd06cbf4..cd8c79e4a5ac 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -841,6 +841,7 @@ static void remove_gdrom(struct platform_device *devptr)
 	if (gdrom_major)
 		unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
 	unregister_cdrom(gd.cd_info);
+	put_disk(gd.disk);
 	kfree(gd.cd_info);
 	kfree(gd.toc);
 }
-- 
2.43.0


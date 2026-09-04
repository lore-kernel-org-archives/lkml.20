Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C04189DD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521875; cv=none; b=Pt1V2U9lK8o3WmpoorBXc67XPCt2B0jWRogSFC/Rs/jnkZt740nHyCQGiodX+121/vat4ZMYZJ3Ux/FfPyyw26/U6JeZ4HKBKRIn6GWosQ/smllGBiPtDhIQIx8/9oJ+EpZjJB2XIl5hrjPMzSSED+ywnuO6BuIJy7po/k4KADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521875; c=relaxed/simple;
	bh=zL/wt+2D7/0Ng/ZTxiOzTvTVNJVLv66apNuBFy3C+zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+imqdYUAuDJ9xnWoIvBiHRMoQVIpKEHBzFJOuXeg5ThrHMCVtfFem7AlYnnIUIxpQMv1ZG882sJLyWFiyoHontvk+CekEUyElniKu3RVdmDLYeO2CG2bxYyFVs+en92dBavvNL7KmjjUfUMIw95XzsVhTTtIs2W9aztzgTT83U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ebn3mA+S; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebn3mA+S"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so753072eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521871; x=1789126671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZeQkMTJNiBbmeCpigeJTN24zonEe8584ZhFeJSidNw=;
        b=Ebn3mA+SrN29WBPjzBgrvh51iuHaREg3A5LYLuM//20YHkAVFfmpH/93E6BWbjcQ3f
         CpBVP4n7ILxNvCFLpjgeRmUWFBa0gFfKLtqWrQPcx6zlhBzfpHx6tyU5kksM+18Xtv+k
         vUpqTBfHua0SQQBgtFHh27OBqGz6KKHutJbHP6L8K+OIMFK1h/fb7kJh4Oo34b25ZUgS
         lHLcL2y+ggMXd5k8xXf14pxk46dlSxAqvjUbKY/DUaZoyZyuRiRwdI7V0kxwsIMC8ZlT
         B5jli8IzgbUoM8mXSEDkeh3rU+4POFN6ofnNug6+sQye7BzheWhOdtoP5kFDOETdn3yg
         yHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521871; x=1789126671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZeQkMTJNiBbmeCpigeJTN24zonEe8584ZhFeJSidNw=;
        b=b1NprxfGwOVUvVdzkxr1WXIuV0LVmZhx77UF2ScaCAizErKxh1/4XUZhJbXODQnLJu
         0LCmg8uRi1RETF8W/6mbRu8ExA8MUyjNk06Lt6yWjv9WlO4X0MQrYAG0rjZhhdZ9Qvpq
         14yir9/rw8uEgoq4j+0xqbn1ZV3zmy3pod5Q08vs81qiycSPqUiGd6YWMMD8Sm9n2bcS
         Fet5U2kaT3JoRSYPCbVBXiEHt5pQ31ZoZUTE2ZqmGiIcDae21XxiL+yufyGqIck1ugDZ
         3eOQ7qwow/pXeILUKrL2+Ii5yCMoKk7FZkjHbuq0lniqRmfoRfYyi8TTCqjs9pmJ+OTO
         8dpA==
X-Gm-Message-State: AFuF++mcpsQsStG6w0WwkYHjDT/SufOt4IuJ00xi2G7oEo+JNDQBpw3p
	hduCNhoN3tLWVV6LcaT4qblNEPZ9ddiWsuFMxXqwtMQiJ7jG4NfGXP0I
X-Gm-Gg: AYBFou1lerdoosiy9iU5dGvpc3u7Ho8DrKelJdnoxV60LWHVt4Wx97qzpq41a2/4Y/h
	kBn+sjHs2evguwonjKpJ1evwShiP4VlIvYBod2fVIaW6AKOE8Jf2ZBwnwKztu84KPA2wNJfl3nQ
	/I+VVOsD7T+iGYfEcxDRUfUx2QJAJOqDiRc9i8EpsYgM5XQh41tDZYBMrlomRYeGuSMpRPKJiUn
	mSk0F1sDhIC4CNrd/fiMeQPKgXlcXI9Pg/DdNSWmDC/osgV5D/iCJXnT1GTEtF/e0SfxYrpBB3g
	Qbb7fm7rVVFCzJquserjtaWxzLsqfy3BykkaL3Tm1fLgLIK1z5hu1CcgpdrR0St9LFfv6S+B6iv
	QeoEZoagywK4RfoMGzT+DgohkCk+FtYmLvf0rMqc/frIPa4tSLGG0wYGqjQEx7JOtgKnxnhnFeA
	ujsYQgwNsgivV+JTtONLvYuPOB8tv2B1joDBMKebwLt956I2pIi5nSMbgVW5uyp3iWC/2oRFE7m
	iYDMazHfba26S0=
X-Received: by 2002:a05:6820:220d:b0:6b1:4061:4193 with SMTP id 006d021491bc7-6b6f7988a8dmr3358295eaf.0.1788521871595;
        Fri, 04 Sep 2026 04:37:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9102897eec.15.2026.09.04.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:37:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 1/2] watchdog: fix typos in comments
Date: Fri,  4 Sep 2026 17:07:40 +0530
Message-ID: <20260904113744.19872-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113744.19872-1-hemanth.selam@gmail.com>
References: <20260904113744.19872-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/watchdog/davinci_wdt.c | 2 +-
 drivers/watchdog/max63xx_wdt.c | 2 +-
 drivers/watchdog/pcwd_pci.c    | 2 +-
 drivers/watchdog/pcwd_usb.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
index 6ea0434f45c2..748dd24affb3 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -120,7 +120,7 @@ static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
 	u32 val;
 	struct davinci_wdt_device *davinci_wdt = watchdog_get_drvdata(wdd);
 
-	/* if timeout has occured then return 0 */
+	/* if timeout has occurred then return 0 */
 	val = ioread32(davinci_wdt->base + WDTCR);
 	if (val & WDFLAG)
 		return 0;
diff --git a/drivers/watchdog/max63xx_wdt.c b/drivers/watchdog/max63xx_wdt.c
index e9073df1a7de..0aecf411f91b 100644
--- a/drivers/watchdog/max63xx_wdt.c
+++ b/drivers/watchdog/max63xx_wdt.c
@@ -64,7 +64,7 @@ struct max63xx_wdt {
  * delay (selected with the "nodelay" parameter).
  *
  * I also decided to remove from the tables any timeout smaller than a
- * second, as it looked completly overkill...
+ * second, as it looked completely overkill...
  */
 
 /* Timeouts in second */
diff --git a/drivers/watchdog/pcwd_pci.c b/drivers/watchdog/pcwd_pci.c
index a489b426f2ba..80fc4e6d3b0a 100644
--- a/drivers/watchdog/pcwd_pci.c
+++ b/drivers/watchdog/pcwd_pci.c
@@ -114,7 +114,7 @@ static unsigned long is_active;
 static char expect_release;
 /* this is private data for each PCI-PC watchdog card */
 static struct {
-	/* Wether or not the card has a temperature device */
+	/* Whether or not the card has a temperature device */
 	int supports_temp;
 	/* The card's boot status */
 	int boot_status;
diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index d7c18c990649..b923fdaaa198 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -138,7 +138,7 @@ struct usb_pcwd_private {
 	/* true if we received a report after a command */
 	atomic_t		cmd_received;
 
-	/* Wether or not the device exists */
+	/* Whether or not the device exists */
 	int			exists;
 	/* locks this structure */
 	struct mutex		mtx;
-- 
2.48.1


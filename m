Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B546EF64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521877; cv=none; b=tY8Ul2yE/A24BBPObRpUH8jLgFX1E20Df17C0uiIV9N60lTgAf3tylWdVj5w1+hrFJBwis4vf/Yu/qRnjlDX0gTVk2Ei3gqFxz0zmA5ulDtNpIz5xX3Bap8gEH8/LUwJRV97G/PlbyC4z6VnOiIa03u531+UXzoFofPasR2AElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521877; c=relaxed/simple;
	bh=qWMJGM8AnYVp2OPlKLVXba+UrM9RAuLKyMuqrtk60g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axxohElB+JNvU9UBI90yttxzf+a0ZQStcZNQ9bOaFasbg8t9F7AqkLivE0R7C2EESLo+Z6HEipdu4PomdOqvqD5sm+q4JFjB1eXuXvlXv1Gz65J0PlqnByGTu3JljyOw18HXAH9BxMTTDa8JP03cdbGRIfgv/OGln3Emf1dkFec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8RHm80y; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8RHm80y"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso736874a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521875; x=1789126675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG8v6QpE6WfnDLt4tJvRslvwmOMs90K2S2OxyydENuE=;
        b=W8RHm80y6Tm6cfm9uhX2RTPNAf3oL2gM1QQx3jKBN3EmtdH6R9BXA1Y8wz3SUr6ALH
         vuUa24BN7+y6Gc2Erga6ZbMWggBXgjWLT3z+BBb0VNSBNscKQxGAIv78hCdhxgugpcdt
         6BDW0QvDWjwY64fdynuY3JtdHlELM95BILcJf7jCZRsHPdXD3ZdsSr2lcB34H+/MeeBO
         lEzzK9ZUqe4ujp8bVTfeweR3tJ3Q5o2NjTo7tdRVeOdRuC8WAOBmq0JrlA06O/kWOcP0
         DOYv7HHmUgO94o5wHXsn1Bm5ticdYV/loEky8mpMx+eBc7qpzPNjbWxa1RPJOTKuWvTL
         TZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521875; x=1789126675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG8v6QpE6WfnDLt4tJvRslvwmOMs90K2S2OxyydENuE=;
        b=YERapbHW2qie73HaNZIM3ZPdcalMv3NMshdaczuDgh+LwGI/n9rLGMzcQFakI3lX8V
         NfBQ5sOP9eq1FqWZsS/V1ztA5AALefAgc6S+7I9GDii3ffu2apnVmO2t4eS8XbVsKc+g
         wGHLQHqRX5WtOlfJ48kADP9XQMBRgzaIEM++vnw56wT3+0DzX4SK3c919BUcL3lJ+13c
         u7p+inDaVXk1ewzaE6/Z97orKeV32HI7UtmRnPC7SXTnyMTERULtHt46kLld3r6MLpCs
         xFjxe+xWUjThsXvOVmfX8B6jCBcQfWVsZhdUxF5jtbBZncndR9dUgH2h/c3NcgZNLEBU
         tE0Q==
X-Gm-Message-State: AFuF++lHgV5JVm9F2PcZvWdwLSm8WiD6CHCwpd9d5gAPNFM4cXOz8j9S
	Df2WNP+GLCZwKoT9+w9N+O6Kddc7AssJq3B+TY5wdL2PPr80JIJOcK+H
X-Gm-Gg: AYBFou3Kj9VNbm9t9dI3yykogij3kQ5KcnkVZHtZAV4ELgU8jkuVf2NxRkpDDY4KAVM
	4QsJ+CKl55FJY8awx0MgfMWdg+2RCaiJwc3F+8bNYKgN+yX6ftbqbPMsgLU85h+Tc/UM8SnDUMw
	TpERkAToqleyGadAu2vYAHMj+Pd5+iKZsNHbAMzgFQhKcO//JO6X7q1NQgSB48RyV5YsMIH2MVc
	vGh6v0BD3/f0hinSVUjl6mCP9L3LcyOfQU8cM84P0qwXhCAJYeMH19Rf8cniVl390PLNLNp79L/
	jPETHakNNnQs4jL7s1z4V0yKB4lnuaOtWfLPNmaO6he+pqMCcb/xWtxP3xLZ8WLWNIpFdkC6BiZ
	Jn0ThQYlew0Ur0vzTrHre+p7rXlFLM+aVjrJaML6fEH7tv355ZW09xihbM6mVfftay/Sy1GzIME
	y3AN4j0TdMc6oF0PDN/WU0xXIdU+p7u2+0nqfhAAboaMAq0WIAllSr1vg8VPkrRlBnvuevwdCer
	aYZK4QssKArTK8=
X-Received: by 2002:a17:90b:5346:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-39b26190fd9mr8964352a91.7.1788521874944;
        Fri, 04 Sep 2026 04:37:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9102897eec.15.2026.09.04.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:37:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH 2/2] watchdog: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:07:41 +0530
Message-ID: <20260904113744.19872-3-hemanth.selam@gmail.com>
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

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/watchdog/pc87413_wdt.c | 2 +-
 drivers/watchdog/wdt.c         | 4 ++--
 drivers/watchdog/wdt977.c      | 2 +-
 drivers/watchdog/wdt_pci.c     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index fbf835d112b8..7c17f9eb1f8a 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -333,7 +333,7 @@ static int pc87413_status(void)
  *	@ppos: pointer to the position to write. No seeks allowed
  *
  *	A write to a watchdog device is defined as a keepalive signal. Any
- *	write of data will do, as we we don't define content meaning.
+ *	write of data will do, as we don't define content meaning.
  */
 
 static ssize_t pc87413_write(struct file *file, const char __user *data,
diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
index 3980d60bacd8..86aedaec1fef 100644
--- a/drivers/watchdog/wdt.c
+++ b/drivers/watchdog/wdt.c
@@ -311,7 +311,7 @@ static irqreturn_t wdt_interrupt(int irq, void *dev_id)
  *	@ppos: pointer to the position to write. No seeks allowed
  *
  *	A write to a watchdog device is defined as a keepalive signal. Any
- *	write of data will do, as we we don't define content meaning.
+ *	write of data will do, as we don't define content meaning.
  */
 
 static ssize_t wdt_write(struct file *file, const char __user *buf,
@@ -406,7 +406,7 @@ static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  *	open and on opening we load the counters. Counter zero is a 100Hz
  *	cascade, into counter 1 which downcounts to reboot. When the counter
  *	triggers counter 2 downcounts the length of the reset pulse which
- *	set set to be as long as possible.
+ *	set to be as long as possible.
  */
 
 static int wdt_open(struct inode *inode, struct file *file)
diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
index 4f449ac4dda4..1627b589d817 100644
--- a/drivers/watchdog/wdt977.c
+++ b/drivers/watchdog/wdt977.c
@@ -298,7 +298,7 @@ static int wdt977_release(struct inode *inode, struct file *file)
  *      @ppos: pointer to the position to write. No seeks allowed
  *
  *      A write to a watchdog device is defined as a keepalive signal. Any
- *      write of data will do, as we we don't define content meaning.
+ *      write of data will do, as we don't define content meaning.
  */
 
 static ssize_t wdt977_write(struct file *file, const char __user *buf,
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index 3918a600f2a0..3468c831d90a 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -347,7 +347,7 @@ static irqreturn_t wdtpci_interrupt(int irq, void *dev_id)
  *	@ppos: pointer to the position to write. No seeks allowed
  *
  *	A write to a watchdog device is defined as a keepalive signal. Any
- *	write of data will do, as we we don't define content meaning.
+ *	write of data will do, as we don't define content meaning.
  */
 
 static ssize_t wdtpci_write(struct file *file, const char __user *buf,
@@ -443,7 +443,7 @@ static long wdtpci_ioctl(struct file *file, unsigned int cmd,
  *	open and on opening we load the counters. Counter zero is a 100Hz
  *	cascade, into counter 1 which downcounts to reboot. When the counter
  *	triggers counter 2 downcounts the length of the reset pulse which
- *	set set to be as long as possible.
+ *	set to be as long as possible.
  */
 
 static int wdtpci_open(struct inode *inode, struct file *file)
-- 
2.48.1


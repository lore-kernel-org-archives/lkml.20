Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494806;
	b=DQEe9cFNY7Hy5QylUwzfOnZbGjkTJjMly2TNiWWWQWsKgdeIfQjQabbLOSWi84Cz+ozb
	 JtIR1drqz3jyGizTJ+kaexh1CMe259qvuvlHkhck8yCTrLhNWtgnSm9mxkDGQLve7IFfa
	 neVQM+WpTH5GztdjQQ1Jmt/mV5+9k18xaenc/0woUU19+ixw18A4Q7DXXLsVtWXZ49ZyD
	 YYhrm8vZAIgdFC+jSvshMlI/GeR+rMvqwEawI0o6KIrpl4THifldbxgqMN3NPMfxbUo8g
	 cPP7r2j/cRDPvMCXgMl51BfWDYMbAbBNoS83vpwfO+/x6oJewHYtLvpZd4GaKpQZxHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/hafU5ZqWQn7Ed1VMFu7z2rJjDnpY9h268ShvCRjPto=;
	b=MNHI/p/7W4Fa2f7oUneliB84txuE26+JvKis7dk1gMF9c/hNqHpp0oHx0FUAjzC0Q++8
	 ruOqwTooD7xA/HbhBbX6vO9mqSki2ydwVUe24dCvOQMkAUZaT1urfSrU+PR9tvqOHvdTa
	 pDq81JWfVQVttFuQYLpapGbPigDX0/p+uGkAm7jKduet+bCSpKG9WliNJdzT3Y7QSbfUe
	 dSvnNmMHr7SsE/dqQACFVuj/diOjoc8izJxLR5Q8qLdy2dvOvDIGrf58JrYF1XNGmczrJ
	 Kw2lVa7lWaQ+FQtLb1V6HSa+6/Q/Km6xncAeiO/DXOpH3d1tf80z2ulRfQY/IUeEL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfHR10w8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC7606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EC7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfHR10w8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso5440534c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494805; x=1795099605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hafU5ZqWQn7Ed1VMFu7z2rJjDnpY9h268ShvCRjPto=;
        b=tfHR10w8f6H7uSBIHChEh0ZFUclNmqzVoWhRdxtDipIsIg+KbPSom0zO0e80dSXS+l
         eO10nKOKO6oVj99HCV8VoHf2EFJE56OBM4ZTLf/C2Ljz/29T19NjIn5lQRWaXbQaKmij
         9gjxbr5NNdVXxrrbBOjlHgb0M8DmlurezxH4BKxl4UiU1ywpeUeWwFuu2395Y/J0oqtb
         jYMjhQcfkojnP/DLn9m7OPIO1UebXDdoJKxFqVxFJ34gjc639CkehNP+VmMpeNejBIra
         Fab4aPsWf0ogIw1lcQlVc5SfFAf7Z+eBmym7Ns66ZZKD08B2k/mClMik8uyfMxIEVGZS
         7g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494805; x=1795099605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hafU5ZqWQn7Ed1VMFu7z2rJjDnpY9h268ShvCRjPto=;
        b=WfUehNzuaTKlllolx5Za9xyyBZIj6+fJ2IuhgRIrvgxyzoAm54MpEHalEUMZweQMKl
         V9jF0qc8XcLBtkIcTOBvj4yixo8lfBIlyjhF6j3GbhgptNHl2/pk9bXtsYgANkNP0jt9
         cATrVdlI6w1Os1NbVyt7+F5CvkxuoaNftqrcqUY/buCKQmalvLfFALZLGfHchP6TClzT
         v2TE5JxmFYWSBcggB30dPZJMXqdNLK/LiWghCOjbv1p/amzAjQNEtErcr+rz8GKJfZTt
         zEHoUZaM5fzyRvGVSv97E41J0kiu8YGLtIRO37R1Ub+gSNWKyDxxiBwZzGKIejr2T5ju
         Qe7w==
X-Gm-Message-State: APuU4Z/rJ5hg8IDKDFwxCIxluyBh/caSQ89mFEpMeG5viCfmfbCiDwx2
	HGKcghHaHUXBpHzjap+QMSAMOqhCkBtxYJAbLLWo/hOlfWF90x2oMOVQJS1lkQ==
X-Gm-Gg: AYBFou0NXMraia+/hdYxLBZBhbu7Kp14K4KM/jtOp5E44U2R84SbLK6u2f9niDbFUkD
	XvqvL/XgurDnomm1JRkAIU7Kenw+A8cTAe99WasrJ+tTtajnfU9S0wJfmSjp3cptWObvAqEuusq
	4J+XKTj0yVYL1qwxTrfcGysaMbMfyhFOkcgLiwS1tnVf0Wbnvxh13l3/oda9Rvdd8KQXwVs10Vx
	pRkZbuvsig04Gd4/ds1Z2uwcjt+5u60ibW+zpRAFByBsjgjVTHMrxsB8ai1qvAcTJ05QJlpQnS/
	fhnZhztCHb8IOZaPd6qBXX/vuWscYk8J9VKOgSKopPtwnIJ5H80uRNgig8tl0tYVv5TbyXbzfy/
	oMx2yaPVwt2kBUlxKChyVdi6ujIpZiiyJEzTvoVSHUfhPAJPDFmx5wwMMRHKaDCFE3zyacOopN2
	pXQadNPdzdad/Z6X1jjH5FGz2rmE0Mw3/bkegUezirjq5adiqEElZEkCzD355RVlzVrYyI2Gt92
	Uh1LTxwiiJ2KYX76vKbwQeVY2xecGyROhDIa/1wo+0J///8Wx82RnGZEltHna0aGAQPca7fdX++
	/8nvs7f4ZAnqONBCsle/LHnIxFQKWI58e98uCxP8kpXDbXRdrQvM
X-Received: by 2002:a05:7022:5f11:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b3c023c407mr4645042c88.1.1794494804782;
        Thu, 12 Nov 2026 06:46:44 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b502a5d5cfsm181971c88.4.2026.11.12.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:46:43 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] fault-inject: use a shared initialization helper for the random state
Date: Thu, 12 Nov 2026 23:46:34 +0900
Message-ID: <20261112144636.840042-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

fault_rnd_state can be seeded from setup_fault_attr(),
fault_create_debugfs_attr() and fault_config_init(), and each of them
uses its own guard. Configuring fault injection in more than one way
leads to useless reseeding.

To prevent this, use a shared initialization helper fault_random_init()
in all three places. So fault_rnd_state is seeded only once per boot.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
As discussed in [1], I didn't add any tags other than my S-o-b.
But feel free to add tags if needed :)

[1] https://lore.kernel.org/all/20261105160209.1504867-1-ekffu200098@gmail.com/#t
---
 lib/fault-inject.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/fault-inject.c b/lib/fault-inject.c
index 9182d457baf5..599bd06fe453 100644
--- a/lib/fault-inject.c
+++ b/lib/fault-inject.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/once_lite.h>
 #include <linux/prandom.h>
 #include <linux/debugfs.h>
 #include <linux/sched.h>
@@ -13,12 +12,25 @@
 #include <linux/interrupt.h>
 #include <linux/stacktrace.h>
 #include <linux/fault-inject.h>
+#include <linux/spinlock.h>
 
 /*
  * The should_fail() functions use prandom instead of the normal Linux RNG
  * since they don't need cryptographically secure random numbers.
  */
 static DEFINE_PER_CPU(struct rnd_state, fault_rnd_state);
+static DEFINE_SPINLOCK(fault_rnd_lock);
+static bool fault_rnd_initialized;
+
+static void fault_random_init(void)
+{
+	spin_lock(&fault_rnd_lock);
+	if (!fault_rnd_initialized) {
+		prandom_seed_full_state(&fault_rnd_state);
+		fault_rnd_initialized = true;
+	}
+	spin_unlock(&fault_rnd_lock);
+}
 
 static u32 fault_prandom_u32_below_100(void)
 {
@@ -51,12 +63,7 @@ int setup_fault_attr(struct fault_attr *attr, char *str)
 		return 0;
 	}
 
-	/*
-	 * __setup handlers run before slab and workqueues are initialized,
-	 * but prandom_init_once() calls kmalloc() and schedule_work(). So use
-	 * DO_ONCE_LITE() instead.
-	 */
-	DO_ONCE_LITE(prandom_seed_full_state, &fault_rnd_state);
+	fault_random_init();
 
 	attr->probability = probability;
 	attr->interval = interval;
@@ -246,7 +253,7 @@ struct dentry *fault_create_debugfs_attr(const char *name,
 	if (IS_ERR(dir))
 		return dir;
 
-	prandom_init_once(&fault_rnd_state);
+	fault_random_init();
 
 	debugfs_create_ul("probability", mode, dir, &attr->probability);
 	debugfs_create_ul("interval", mode, dir, &attr->interval);
@@ -462,7 +469,7 @@ static const struct config_item_type fault_config_type = {
 
 void fault_config_init(struct fault_config *config, const char *name)
 {
-	prandom_init_once(&fault_rnd_state);
+	fault_random_init();
 
 	config_group_init_type_name(&config->group, name, &fault_config_type);
 }

base-commit: e6514b988537d8577052c88b2a44c79610e8821a
-- 
2.53.0


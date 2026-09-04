Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5448AE39
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525458; cv=none; b=Xh6XwAY89H5plvIKvQE1qygvPTU39e95pgkYoCjElpsrBlYJLfcByKHOjWcK5wxEh7jxNIBdZAkbs1dXhJjdfYIJ17ZVdhBwF95JhbdlDlIaIegJCgOc85vkKtW+CUNPRVtRnvyx7bcggd60TtpesUPoAWh/v9W1m4jgP/3p+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525458; c=relaxed/simple;
	bh=x2wbt42LUYfsWIWbxHFEFI9MOJsb09wZigy4zayb5GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp2MaPJ2Y3cx5PqiPStiNTwO0KovoRnkBdLvCj+v5RLL/FhztBiwV5ifUzXp7brj1UcSc0a/KV+ZY2NefqDXgGDV3yXy3siHSpWpCLn0A9k99H+1jzTt4CtaGkQopcrQC7NwRFuMhvIER4KXj3wLmLsu11WgyNyddqU7KqLF1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adTXw3F4; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adTXw3F4"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1b881a8e9so382568eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525455; x=1789130255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oAKlKt/QjH4lFsAPxeLcj7oKRn+elbiY1FdXmIqGpZ8=;
        b=adTXw3F46O9R9U7g4qcDuBvHVO3azj4WJRQ/xGfzJKLkTZDLCFE/MXoWzNYkPdhxyW
         YNu6VUUgBJEo7d3h7IA1taxjDum4ZnQVVMpZAQOKPgjFzRRGa3mr/gr8JryZDRmFwCXB
         Apbq8HuMdaHtCkdalG3YfqUSJfBmitbm8B7suosVJWsMQO69FTDwM47TEB5MwftTK0Q8
         2hM/jLKIW3vzxqZeV9SdmMwLGbQhA75MQLfMIFRuonxKuCc9AkXD84kPUiyKQtwfJ3MA
         4LoMNzIeBexBnrY0Otq0lGT0lizp+4tWr2eHc4CmbrKuqL+3Y9lalrkyCBQzG5MjK4n0
         Mktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525455; x=1789130255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAKlKt/QjH4lFsAPxeLcj7oKRn+elbiY1FdXmIqGpZ8=;
        b=L/krNiqlFh8y4nbforcZWrFosL4+Evs3yVIuT+GC0s2ioDdO3DAfyh5yjs1mtMPWpL
         VhO8Or923ok9M4HLBVdaZS+/f1e8z5VZDdUpFHgdEHiLcs0kv9goGz5WQTEd0sl/K1zk
         ZUdSfKQcAxNrbhkzYMKiYennAOOq4RiLw3bHj+AipGmw1/MrVzIFc7O9gbqmJsndfv6F
         vkY0SiD9ibFguXZkzWMnlZtl1sPVNzIGMrU/3fVbnpDTiYdLHGo/YOtYzWl8l7cJ+hFO
         8U9Lcp7zZiEV5HQWBUeJSrVtGzWaUEk+EfQIOnQmOERyhhVTdfcQjswOg+DAgR5uuqC3
         XvkA==
X-Gm-Message-State: AFuF++k+xsuYPkUiK8O0rLt47TEn6/W3WZa+QdTfDrZmqU1srAJQcYem
	JY9/bP7HRuHyTXJCNtn9uTsi+h8E0a4ZxGsNAKrYc0bQuPVX74Zv/ZEX1FX4zu1qdKQ=
X-Gm-Gg: AYBFou0/BwGON63aIun+jmioWTxn4tfCSGyGyc70zYHgjLYa5o+TlRRYn0El7tZxviH
	/3c84jUPbpExoN/hKYO7b0BTZCUBKM+RJOitoPWkAFxUAveMf/DPSAikho6fH2GsOb8u8pdZyuP
	rKHNnBBCUL7PiV7VwjZM5zOXip+vpS0xHDl5oolx/pd2xKSbQ6RjVsIuHAthL20Jf+OEu76DJ0E
	+JLiiPyhuuP+Nf9TyTCbnzonZxKf2s0sZWpYZwY9kKL++6c+wYcr/pcQtBnvaqyy/PNdU0lAyUf
	qi/RBtN4rhoqfxzaTldwHvpe7b7dD57EFzKFqeiO4Ha3QLOzsaAMGzE0S1JpqlWdZMX5XWZSbjH
	7Z4YKz3KYaPFqrNZtsa/rTI3rdgOWq2VMCXZNHvyNDVDRolMEQ9Ew38UhZ1kzs0l7RFRMYOTL4U
	br1iMqoq27esBllYU8vSV4ObKdNuQTzkjBB+BiqKS0AUgrObZjNufHzjdONXzKIanOchPXj+jgO
	9ZYinG9MfbzUmn+18Yb2chbjQ==
X-Received: by 2002:a05:6820:184a:b0:6b7:8396:f3d7 with SMTP id 006d021491bc7-6b78396f903mr1393858eaf.57.1788525455285;
        Fri, 04 Sep 2026 05:37:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm6750111eec.5.2026.09.04.05.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:37:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Coly Li <colyli@fygo.io>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-bcache@vger.kernel.org
Subject: [PATCH] md: bcache: fix typo "idel" in comment
Date: Fri,  4 Sep 2026 18:07:29 +0530
Message-ID: <20260904123730.39849-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "idel" to "idle", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/md/bcache/writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
index 4b237074f453..7734fe0dd429 100644
--- a/drivers/md/bcache/writeback.c
+++ b/drivers/md/bcache/writeback.c
@@ -162,7 +162,7 @@ static bool idle_counter_exceeded(struct cache_set *c)
 	int counter, dev_nr;
 
 	/*
-	 * If c->idle_counter is overflow (idel for really long time),
+	 * If c->idle_counter is overflow (idle for really long time),
 	 * reset as 0 and not set maximum rate this time for code
 	 * simplicity.
 	 */
-- 
2.48.1


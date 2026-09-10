Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0B135BDDB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010348; cv=none; b=Kn6maXogxKo17AnP+TDyIYLaep1XEZUADup4M2LfmgN0NiGYyxvuXjvh+KSZhenOQAO85JKyWN/CREdt3T4NaKIrAKrRw2eHcCAj3mO99VMX+d3prBbh9wXxDhZlqgnhEblbKP8FoH4KhGNXHwwsbPpOCAFL726wcEf76wdM4qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010348; c=relaxed/simple;
	bh=CZCZphFtwnyR9V4pnluF5ZaUb2LNgvX6iqLOQ9kTly4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=clVYADaosDmLnRSpni4irEtkAetPTzoB6ilBY3dC9cFrKMrcfbCXpnJ83GlKPq4NItBoeaYZqfPWSHISa2p4g7auYqeJV9Ukp3xZhLli6vToGWGfTFHgTgSi5hCmR1Z+FVAJXAuxGPGygmTazA07c1oJgzU4MN/lDcUHcrp/loM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJC7HJN5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJC7HJN5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so82159335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010344; x=1789615144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7h5a++gvjff2+ABbxAEfyPjYnS85ALwwS0YaPZ1LMBg=;
        b=tJC7HJN5+6oiu1emA7TkYcrvA+9lATR1TwaEGFVxZVZCkyf47Ua8ryD8xu2pK6RH5E
         U3jIS/X3iGhEKcXs3bNtq+JRhh7idZ2lQF0690/hvCoIfIeLsY9ni2w9o6iPgHoet+TP
         dgrYa4olGaYn5UsBOb1nZayAYikfqWb0cXbt3LuwkIWWQwUJCNFJ45mwAXdTBTXgIA2E
         y8JQLzqy6CHl4mWfexIVuOxZidXJYWAbiqgxF27NmmGsRz2/XV78GA2x1PcQtzGCLQrx
         r66FLIA+Sx8eFI4UU+2MrouK3v/cgLCtvENa/iD7zct8j19mzQrS083rSjU3xNNtwJsy
         7uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010344; x=1789615144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h5a++gvjff2+ABbxAEfyPjYnS85ALwwS0YaPZ1LMBg=;
        b=r4yRgEyNprMTbDVDWraN39WGRjqmdBbNZyhsD5pMU7uGc+Lvp6bNMK2xNkrB4mErLs
         zlNuce6xVEihv641ctOCFWYhXWBriwTc2a0gewSsVySLbdheWz8D/cU7UDcGc54vaRVs
         SLuAwuSePQKVaIT+dlKxG5oF+DIInWIsNctE1SmlDQlNYTi+s/33XKfm2WJSR0y8i00v
         eHPWqkdGPry3sZTfvihln0LKcbbngHFjjFSz1KnK/DVBuz90KvlyZszzeF3vuFzUa4In
         Z1VLQmy9g8mCEeTstehVcbcMFUHwuQlZXZOxHVcE1NuF6oYzYzv7yfJFbau6RzYzsXCk
         QGXg==
X-Forwarded-Encrypted: i=1; AKwUvBxO09gBniON6s2A6m3S0I6E3ljmuWqPDgYycTTqXrh6bX5azWL0Z0tIQo0BCGpsHBLIT3CLklQJRphYbwU=@vger.kernel.org
X-Gm-Message-State: AFuF++lbYMZdHjoTnvZPUi5AjTK2Tj1Qm8tLhYyUh6dBDQ9HoM9CSU3i
	uDTj66uHzl8iIolxX23Et90wQwCWidLuvkFXx1oU4NwC8QmX+DPn+7WK
X-Gm-Gg: AYBFou0yhb/epeq+vsodFzBWYybUV/U6tvEaQNeXgMhgKiBiTqaEb9QB3wMzcN3X199
	aUoP4r9M1Ee0ON32CPtOTplPQt8VMY2Oci/YN8Df/dkm1NdZaruGxzX+MlEGL3utiQrFD7b26RK
	jZNY/b1HeIVVnAE+Q4d57LmNHlEKduRB7r/XCoc6V7HLCLVzwkLu0p0ba5t7+68NfBKDM9i0byP
	kl1gtlix4noq62qkX1ntKetbUv+XkmdY+JdOf8vbFcX8rftlyIQC/yCx7r0lTHR7MfV8ggI5KwH
	yIFoncltdIUf8p/2FzVJXOVU3hxNDoBiISwSmUbah9qLIYcgsgwPUWuR55nKEWAtzp9T/lWYI0N
	V51YaX5Oq30bYtSqYiKi/jYUJc6yWmFymVtm3wVhQFs/dOd+1qE1Hdt/T9QJe+SNwe+lymvKHDA
	Q39yKUd9YQlkp/QGltmvviwjWE+YpMMVuUWt1IWV2Q5M4sQH5sS4wM+4YvvIeowSCUbx7JLpIuM
	Y9qDHp4cXCBhwO26/e0JNp8XHbQ3z2wsmTrOpBCq9u1gpbZv74p6xTsv2MDUmdheXBFwk9DT+Um
	Xc27r6iC8o8LUfe4R7OYjevn5HGaWRXkzxaX5SXaBtt3eYQ29jFEvJrQYKl/IkdWM/xutzDMyvI
	=
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr393723595e9.25.1789010344521;
        Wed, 09 Sep 2026 20:19:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb1e60bsm90976765e9.0.2026.09.09.20.19.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:19:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] efi/libstub: Fix efi_set_event_at() parameter documentation
Date: Thu, 10 Sep 2026 05:18:53 +0200
Message-Id: <20260910031853.15236-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

efi_set_event_at() documents ids although its array index argument is
named idx. This produces missing and excess parameter warnings.

Match the argument name and fix the adjacent spelling of array.

Fixes: 8c0a839c2bcc ("efi/libstub: Descriptions for stub helper functions")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/firmware/efi/libstub/efistub.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index fd91fc15ec81..049263a541ae 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -224,8 +224,8 @@ typedef void (__efiapi *efi_event_notify_t)(efi_event_t, void *);
  * efi_set_event_at() - add event to events array
  *
  * @events:	array of UEFI events
- * @ids:	index where to put the event in the array
- * @event:	event to add to the aray
+ * @idx:	index where to put the event in the array
+ * @event:	event to add to the array
  *
  * boottime->wait_for_event() takes an array of events as input.
  * Provide a helper to set it up correctly for mixed mode.

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)


Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAE538D72
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172405; cv=none; b=Oygc2o3z5RtFZX50sOzrDDOXByMVi4s60kNHo0lsKXcGLIqxaLaYfglUe39vRSYkPXiEwxaWuLLArvYCL4NX2/HGzTpRbJXvO0BL6vE9rhzNlwC4bqGPYa3Y9cJ7DayiFr3CK7ZcPGGldjNDVYzSb1hUVsuNWupb71ITDaPopSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172405; c=relaxed/simple;
	bh=GlB3Y2tQPHLzYKtxFX/9Dq0VZmwRG2B6cqN7HfVlLCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DnVQRaLL8EL+a200LD1qlJtAqMPOb4CvSxAQBkQsq9wJiw6zomkQaeQ2paX1PCqDRhjC+LXpWZTT1xWxfFY6S+AqhQDKwM+3IVIXGsEldGAtNv8LkH1ytKYCDRziN0YNo9UUyOMKwiNDpxb9hW+LOAbgttCUtYG1ZDMx1mVxoe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=w5nDBzhN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="w5nDBzhN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so814552f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1790172400; x=1790777200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Jv+EBHDHVTqvAzcDsBTs/b5ikUux5eKi9OrKqTVCnM=;
        b=w5nDBzhNEip1jK2A9UqPzUUj2NNo/f8RGTo0iFgSiX/LsisKqnNClMS9LztwUyGKy3
         XxQPvRCU+NjY02KrBigyq/SnBms8nx/Y12KNwDuuB+/QjKu7qhxdxF7oZNgeifV6rXDg
         XO+1t3gq2oeiaQnbCZySehBU074/5BavdIVeBbBdquAQKvs+5mn1E4xvxUNE/MLGdCWQ
         k506d1wMuucPdjPjADiygP6s+w0XR5oW+tSAE+PKcP2GxfpuHUdyHmQm+AmmxCAUVeNZ
         HVq5PP6OXpsfDYTT441FEAClmsF29ThSDBMzF1fRWiq8Ga05/w9GaFsqekisHmXvQh8n
         s12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172400; x=1790777200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Jv+EBHDHVTqvAzcDsBTs/b5ikUux5eKi9OrKqTVCnM=;
        b=zvn65cHZ9RtSAogt94N+6ea6i0O13TFpfPUT2eRrHKJCNJh/5A2NK+4aewvui0UwwL
         Bc3LhO2k6XOQrFGZB5FPWHUPjUxSQ087r1LymovCUC9sRldZE5+mIQqbtG/Vo5ZNm+PS
         9REz8jhPkANL5KBX9idx0TL1KBTSH0vjvb2nnLXI6vCCmaFruFhdy1jfeMm7SLtsm1fv
         PClcdFfPD4tJwjLIYzGY9FFSP5D4Mk935iCALazFEXrWAsG23B0dBO3JZSRt4HEOrbAB
         PIAccuG4G+iwfJXj3F2FyEchoQJ/5Eoo09grtiIaCKCnbRsXKdml4zOnptH5HJo/lASd
         RMqw==
X-Forwarded-Encrypted: i=1; AKwUvBzcB08SHHgOSbYb7ACHqVXA4tWnw4V5unGaCl2gsG4qOGJOTAYBi3+R8uDvXiebkTB4T9SBWN29hAyWJzw=@vger.kernel.org
X-Gm-Message-State: AFuF++ni43CGCfAqGCiN74RcbWIoPba40w2ZQbrqxmN1ra1/I/QFfwXY
	UtAm+6VA3FnB6MC/KX9aTP4pvYEt3qpDAhMRO6vxhqC86yUg9IwDG5gDFeMeG8PAJLCsKKT/Rf+
	Zm5IKgFk=
X-Gm-Gg: AYBFou1KToNvxC13BzdZJ84Ei1L3yK/2V1t6KP5ma2AccwPf4OwWGkatoIV1HzDKrN6
	zQqIaLLB1WpF+EXyyK4uN6MP3Mw5+qB0ErgXMuuXPZ3X6M/TxrMsj1oUVzFermzJflCp59QLDih
	sGke4JucsSIIzsZlcBXH13G3oJF/hEYTSNbtEJMCZfRpJyOlLOXpRYb7iTLaJNLTejYh03sRnpm
	BTphfid/HWUCjkJTQXHXCAyQ+lMTVUqESqoCl4a/Gv8btliFDpqQjfoWzvSkPzk3COGp5fFoPha
	NnG/MsZVTDePo4jLYVXC1uk7B41CaKyvkyyzW/m/oEl6Yk/L3HmfqFM+Rftppq61HjisATE1+nX
	XZAFC8qGV7gDTGGhdjLfStgsCy91wp3eTdj0bWsrw9ep+5XqDpJsGyPrrlKD4x3A4X4BisnoJuc
	VfJo1PJZ6Iq8U6VwA54cXV7lJrNoRq0owaEyZ9pIQbYMU/M8F0a/olDq2dXgm8+31xT/sLT/Gs5
	8Uhnk7v/8aVZikAIaJxhAetOjJOydg=
X-Received: by 2002:a05:600c:34c1:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fdf148205mr37610215e9.28.1790172399746;
        Wed, 23 Sep 2026 07:06:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b01f:2334:39d8:9506:1776:f780])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde18a8a0sm78087455e9.5.2026.09.23.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:06:39 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars@linbit.com>,
	drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: [PATCH 2/7] drbd: modernize the file header comments
Date: Wed, 23 Sep 2026 16:06:03 +0200
Message-ID: <20260923140608.1116713-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
References: <20260923140608.1116713-1-christoph.boehmwalder@linbit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the pre-SPDX "This file is part of DRBD by ..." blocks with plain
kernel-style copyright notices, and add the missing ones. The license is
carried by the SPDX identifier since commit 93c68cc46a07 ("drbd: use
consistent license"), so the prose about it in every file is redundant.
The file name lines were partly wrong anyway (drbd_vli.h calls itself
drbd_receiver.c, drbd_strings.c calls itself drbd.h).

This is the header layout the out-of-tree DRBD 9 sources carry, so the
upcoming rework no longer touches the first lines of every file.

No functional change.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_actlog.c   | 13 ++++---------
 drivers/block/drbd/drbd_bitmap.c   | 12 ++++--------
 drivers/block/drbd/drbd_debugfs.c  |  4 ++++
 drivers/block/drbd/drbd_debugfs.h  |  4 ++++
 drivers/block/drbd/drbd_int.h      | 15 +++++----------
 drivers/block/drbd/drbd_interval.c |  4 ++++
 drivers/block/drbd/drbd_interval.h |  4 ++++
 drivers/block/drbd/drbd_main.c     | 16 ++++------------
 drivers/block/drbd/drbd_nl.c       | 13 ++++---------
 drivers/block/drbd/drbd_proc.c     | 10 +---------
 drivers/block/drbd/drbd_protocol.h |  4 ++++
 drivers/block/drbd/drbd_receiver.c | 13 ++++---------
 drivers/block/drbd/drbd_req.c      | 13 ++++---------
 drivers/block/drbd/drbd_req.h      | 12 ++++--------
 drivers/block/drbd/drbd_sender.c   | 15 +++++----------
 drivers/block/drbd/drbd_state.c    | 15 ++++-----------
 drivers/block/drbd/drbd_strings.c  | 12 ++----------
 drivers/block/drbd/drbd_strings.h  |  4 ++++
 drivers/block/drbd/drbd_vli.h      | 12 ++++--------
 include/uapi/linux/drbd.h          | 12 ++----------
 include/uapi/linux/drbd_limits.h   |  5 ++---
 21 files changed, 77 insertions(+), 135 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index b3dbf6c76e98..04b8d50e4e9e 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -1,14 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_actlog.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2003-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 2003-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2003-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
+ * Copyright (C) 2003-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2003-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2003-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 65ea6ec66bfd..8416c7e8257c 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -1,13 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_bitmap.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2004-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 2004-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2004-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
+ * Copyright (C) 2004-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2004-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2004-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_debugfs.c
index 371abcd7e880..b8e698dbb475 100644
--- a/drivers/block/drbd/drbd_debugfs.c
+++ b/drivers/block/drbd/drbd_debugfs.c
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
+
 #define pr_fmt(fmt) "drbd debugfs: " fmt
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/block/drbd/drbd_debugfs.h b/drivers/block/drbd/drbd_debugfs.h
index ee3d66eb40c6..e02960c6ec35 100644
--- a/drivers/block/drbd/drbd_debugfs.h
+++ b/drivers/block/drbd/drbd_debugfs.h
@@ -1,4 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/debugfs.h>
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 48b45c3142f7..d3ca2b730a11 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1,15 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
-  drbd_int.h
-
-  This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-  Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-  Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-  Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
-*/
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
+ */
 
 #ifndef _DRBD_INT_H
 #define _DRBD_INT_H
diff --git a/drivers/block/drbd/drbd_interval.c b/drivers/block/drbd/drbd_interval.c
index 873beda6de24..2c12297ffdaf 100644
--- a/drivers/block/drbd/drbd_interval.c
+++ b/drivers/block/drbd/drbd_interval.c
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2011, LINBIT HA-Solutions GmbH.
+ */
+
 #include <asm/bug.h>
 #include <linux/rbtree_augmented.h>
 #include "drbd_interval.h"
diff --git a/drivers/block/drbd/drbd_interval.h b/drivers/block/drbd/drbd_interval.h
index 5d3213b81eed..9d290ac120cd 100644
--- a/drivers/block/drbd/drbd_interval.h
+++ b/drivers/block/drbd/drbd_interval.h
@@ -1,4 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2011, LINBIT HA-Solutions GmbH.
+ */
+
 #ifndef __DRBD_INTERVAL_H
 #define __DRBD_INTERVAL_H
 
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index a2a841c89201..590ac5cb84f5 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1,17 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-   Thanks to Carter Burden, Bart Grantham and Gennadiy Nerubayev
-   from Logicworks, Inc. for making SDP replication support possible.
-
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index b77f901fc3ef..51ba8e542928 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1,14 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_nl.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 6d0c12c10260..fb2b68c5c5f7 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -1,14 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_proc.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
+ * Copyright (C) 2001, LINBIT HA-Solutions GmbH.
  */
 
 #include <linux/module.h>
diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
index 56bbca9d7700..be7dacac5a86 100644
--- a/drivers/block/drbd/drbd_protocol.h
+++ b/drivers/block/drbd/drbd_protocol.h
@@ -1,4 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
+
 #ifndef __DRBD_PROTOCOL_H
 #define __DRBD_PROTOCOL_H
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2135c14354a8..2c4507add143 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1,16 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_receiver.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
-
 #include <linux/module.h>
 
 #include <linux/uaccess.h>
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 70f75ef07945..1648d0dabcbd 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1,14 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_req.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #include <linux/module.h>
diff --git a/drivers/block/drbd/drbd_req.h b/drivers/block/drbd/drbd_req.h
index 9ae860e7591b..51b12a960e45 100644
--- a/drivers/block/drbd/drbd_req.h
+++ b/drivers/block/drbd/drbd_req.h
@@ -1,13 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
-   drbd_req.h
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2006-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 2006-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-   Copyright (C) 2006-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-
+ * Copyright (C) 2006-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2006-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2006-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #ifndef _DRBD_REQ_H
diff --git a/drivers/block/drbd/drbd_sender.c b/drivers/block/drbd/drbd_sender.c
index 0697f99fed18..df0b6c99a59f 100644
--- a/drivers/block/drbd/drbd_sender.c
+++ b/drivers/block/drbd/drbd_sender.c
@@ -1,15 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_worker.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
-*/
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
+ */
 
 #include <linux/module.h>
 #include <linux/drbd.h>
diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index adcba7f1d8ea..f1a5d899fd54 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1,16 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_state.c
-
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-   Thanks to Carter Burden, Bart Grantham and Gennadiy Nerubayev
-   from Logicworks, Inc. for making SDP replication support possible.
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #include <linux/drbd_limits.h>
diff --git a/drivers/block/drbd/drbd_strings.c b/drivers/block/drbd/drbd_strings.c
index 0a06f744b096..a35ff87a93b1 100644
--- a/drivers/block/drbd/drbd_strings.c
+++ b/drivers/block/drbd/drbd_strings.c
@@ -1,15 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-  drbd.h
-
-  This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-  Copyright (C) 2003-2008, LINBIT Information Technologies GmbH.
-  Copyright (C) 2003-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-  Copyright (C) 2003-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
-
-*/
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
 
 #include <linux/drbd.h>
 #include "drbd_strings.h"
diff --git a/drivers/block/drbd/drbd_strings.h b/drivers/block/drbd/drbd_strings.h
index 0201f6590f6a..397c2eb9b666 100644
--- a/drivers/block/drbd/drbd_strings.h
+++ b/drivers/block/drbd/drbd_strings.h
@@ -1,4 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
+
 #ifndef __DRBD_STRINGS_H
 #define __DRBD_STRINGS_H
 
diff --git a/drivers/block/drbd/drbd_vli.h b/drivers/block/drbd/drbd_vli.h
index 941c511cc4da..609a91c68a86 100644
--- a/drivers/block/drbd/drbd_vli.h
+++ b/drivers/block/drbd/drbd_vli.h
@@ -1,13 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
--*- linux-c -*-
-   drbd_receiver.c
-   This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-   Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-   Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-   Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
+ * Copyright (C) 1999-2008, Philipp Reisner <philipp.reisner@linbit.com>.
+ * Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
+ * Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
+ * Copyright (C) 2008, LINBIT HA-Solutions GmbH.
  */
 
 #ifndef _DRBD_VLI_H
diff --git a/include/uapi/linux/drbd.h b/include/uapi/linux/drbd.h
index cf1ec3eb872f..b7d6b1c52df0 100644
--- a/include/uapi/linux/drbd.h
+++ b/include/uapi/linux/drbd.h
@@ -1,16 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
 /*
-  drbd.h
-  Kernel module for 2.6.x Kernels
-
-  This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-
-  Copyright (C) 2001-2008, LINBIT Information Technologies GmbH.
-  Copyright (C) 2001-2008, Philipp Reisner <philipp.reisner@linbit.com>.
-  Copyright (C) 2001-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
-
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
 
-*/
 #ifndef _UAPI_LINUX_DRBD_H
 #define _UAPI_LINUX_DRBD_H
 #include <linux/types.h>
diff --git a/include/uapi/linux/drbd_limits.h b/include/uapi/linux/drbd_limits.h
index acefe84bc602..65d3ebf2437b 100644
--- a/include/uapi/linux/drbd_limits.h
+++ b/include/uapi/linux/drbd_limits.h
@@ -1,8 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
 /*
-  drbd_limits.h
-  This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
-*/
+ * Copyright (C) 2014, LINBIT HA-Solutions GmbH.
+ */
 
 /*
  * Our current limitations.
-- 
2.55.0


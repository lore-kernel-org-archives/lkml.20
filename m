Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746779;
	b=bes6LxO2XPJ18Q3luewhpSxgT/uQdueS02x2bd7jEy0AnLeKc3DbqR/81Wrv0PBDTFUA
	 wip/1MpSRPJ2C2uWUr14tOQbcxFk2rSzIAXkNUzUNGqeD2FAf8RhMbLjPDGryryLmDYgM
	 36qrZpeST1rWZa3IHD3ReLwW21Zj5YAkHWRXVhKDiDofCGTzVvELjOIiQYfiGZQokHNbn
	 5KFpSNcWd3iwC4k1RcIZPSVV6PdRbxm4y++jaf75XUbtRVxerdBqj/Oc1OZoSfnTu0rVi
	 DSuhEDK4L5zT5Dlxq82ji9V2hEVuLp2YtI4hMhlXolhIbJRQvJ55N7WpTQLJs4y0HuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K8Xl6Cocv0cl5LTtyFifxzrgj29Mq3NqZ1spMjgXTok=;
	b=JGBIhp9FH3kuncFc++iWgnF5u+kVykgHrfKgf4c2ikfkkpKuJemrP7V0UTeOVRLsgFy/
	 m/VIrByqv7m7b2P7JBM6JnEcERfcDzwbDE/84KtBTVVjROWkfpzJlDzCbOnSJD6JCpAzn
	 noOcGMGuH/jgg4JynTXNHbd1I+Npo+0PRlBeb9bRA6hDyaI0R4ZXcRdz3D6+8sH/ffPTz
	 ixfrCacDoIDe0mbyabUifFSvMFTPMwMgGgnEGdOr9dWlKVk/cgQz9jhSzVMuv9U/0HwPe
	 XBNq4WjpPiAn3QR/zIWTN9/UtshNXcGroTsvNnmmoBUaM8hmLqarMeNoVe0zs87GcwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6dmqFFK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6D606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC6D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6dmqFFK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso103137eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746773; x=1794351573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8Xl6Cocv0cl5LTtyFifxzrgj29Mq3NqZ1spMjgXTok=;
        b=X6dmqFFKDgPuolduHlUByfe23WmdYyeRJH/7WCxeu8+9SiD2WdJO+mQoqt9m22R2CG
         c/rXWu/zk1oEcv6B7E8FV+WcUNhR4+beBKD3P+AOqNeMki9mj/0SWCVBu/Hk+bb1bDQs
         w9bcjmh2eNQq5FsOW0Oo7uRTLzdIxsIJoSEiDYNI0vVpQiBKfyOvloc3IbibWDdEgsVE
         w8unhSX/Uxfr+JbDoHxlTA2q+B9DFS2whxzacqK/AIhUn6RcFa7Z6k7GcI5ZZG7N9mLR
         kxmFqXv5klupYFw9yb7mu7a8iQP1wsa5hffWWHZHk8xmemKyrxiT1Et5VI6rAvS0aCWP
         pMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746773; x=1794351573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K8Xl6Cocv0cl5LTtyFifxzrgj29Mq3NqZ1spMjgXTok=;
        b=hj4aFKnkFlZ2OavbGT7epFWqAFpnBbVNQ8+Hh5Cu5j14DTVY+hxG/xWcZJAx8GdqGZ
         IKBZEKv7/cxmZ4AnfxsZyn7aSVX/B018eoWkWhOsgtRgH36orUnyKb/FTk+OCODPx8FR
         cVFpF1Ti+G+lj0ecFRQ8+JoDdIugx9Jgm8ouNb2WSphGR8NIcIWd5/6z5R+pyVisreu/
         u4hAsCnZ4+wzitjuoPGi+FgCL7F/IwPE7tGf095ki9rbhtnewXtrcEqG455rF2syrHI2
         Qm5y0NIs4BKXyekeu0I95DkX6UlG6ynDFPUg4guStC6+QZNGsMhifBxdthuaAWACfHww
         n7gA==
X-Forwarded-Encrypted: i=1; AKwUvBxa+0FCEykZolvQvTTd8r3uMMcWxIh6Uw+hXCTS2ExnsVgARwUkdS9WS4YqTVKn3qoCMwWvuAtiS/tpEEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fVSJjjOgUTX0G37OFo8y+djziLv9yV+ooE4YV3wCE7bs8qnMB
	SsvMlY5IJxENFV+WvufE/UOl7ylzSveLkiNVKhumJDkj0RBcOHrcedtn
X-Gm-Gg: AYBFou247cCKuZS8KvsMjz2yIkBNXdwS3u1GV+NgSpl0TWaUfZ2YLzf/aYTZ7tdu021
	xbUEEqOwiCJdV0rhjYQr9Ya/K4b5McI6mV3Ac8KacVT1UvTz2wHQCnB9tHawW8li6GJ/2XTzkxK
	rZWp0w9T9SUCfKOOb6s+Kl4dMmXOvWi3YYj3u6pUh7RcvualTFyVilt2pchf5YZXsB8qWHPbL6i
	3V0RQ9Gfbg5WyBWMVbipEkFgIDOzslKUwS8sxDYwS8yCulgpcMzyGMn6bu4IPrg5StKk+46N+DB
	P0YuBRfvXcx3VC+mlGwByM1eMgrMOAXdH6Now1eaxFPf3JU8X4Hp6Cn8k8RkmNp+n2k2NadhZIj
	K7LQoaxWsaWJHF15ibnjmw8UdlPHryZ3lUcK9EJF7smDt80f8BYIlvxoojN9UPYAmtVZ/nfiau/
	l+8LTyzgSH2wH2qbwFs9Bj3dg7yuYRKdJ8BLI6ndOqSTWmn+tbQpEU4Km5n5Bmvlxo1VLsnX9ih
	WBAYmNSAYqJgdkpiY7+WUjG4MAmblrdxC9/+1d5HmuYWAb804gSwlKounzRKcEL95EkD3wxlfzH
	2iLQIC5jB9N9O43pMGjEj7BYL2omCjpMNd6tARHBc7LmTJ2LjNscvDDfffAKWogReeoYOk5h+xV
	97739wBerUQ6D3tMI
X-Received: by 2002:a05:693c:8817:10b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36a423fd04dmr21957538eec.34.1793746772523;
        Tue, 03 Nov 2026 14:59:32 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1187111eec.8.2026.11.03.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:59:31 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: stmfts - use touchscreen_report_pos() for coordinates
Date: Tue,  3 Nov 2026 14:58:43 -0800
Message-ID: <20261103225923.3892612-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
References: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
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

During driver initialization, stmfts_probe() invokes
touchscreen_parse_properties() to parse axis inversion and swapping
properties into sdata->prop.

However, stmfts_report_contact_event(), stmfts5_report_contact_event(),
and stmfts_report_hover_event() continue to report coordinates directly
using input_report_abs(), ignoring any configured axis inversion or
swapping settings in sdata->prop.

Update coordinate reporting across all three functions to use
touchscreen_report_pos() with &sdata->prop so that axis inversion and
swapping transformations are properly applied.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 25d127aa8642..f68da3e1309b 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -241,8 +241,7 @@ static void stmfts_report_contact_event(struct stmfts_data *sdata,
 	input_mt_slot(sdata->input, slot_id);
 
 	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
-	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
-	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
+	touchscreen_report_pos(sdata->input, &sdata->prop, x, y, true);
 	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, maj);
 	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, min);
 	input_report_abs(sdata->input, ABS_MT_PRESSURE, area);
@@ -344,8 +343,7 @@ static void stmfts5_report_contact_event(struct stmfts_data *sdata,
 	input_mt_slot(sdata->input, touch_id);
 	input_mt_report_slot_state(sdata->input, tool, true);
 
-	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
-	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
+	touchscreen_report_pos(sdata->input, &sdata->prop, x, y, true);
 	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, maj);
 	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, min);
 	input_report_abs(sdata->input, ABS_MT_PRESSURE, area);
@@ -375,8 +373,7 @@ static void stmfts_report_hover_event(struct stmfts_data *sdata,
 	u16 y = (event[3] << 4) | (event[4] & STMFTS_MASK_Y_LSB);
 	u8 z = event[5];
 
-	input_report_abs(sdata->input, ABS_X, x);
-	input_report_abs(sdata->input, ABS_Y, y);
+	touchscreen_report_pos(sdata->input, &sdata->prop, x, y, false);
 	input_report_abs(sdata->input, ABS_DISTANCE, z);
 
 	input_sync(sdata->input);
-- 
2.56.0.385.gac671c819a-goog


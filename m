Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D4415B7A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871461; cv=none; b=O7u/rm8bVJe37XKtKdPZKP1PhWowSWEl+alUiDf3q5UkS898GNXpdI5VT46iOCJGMkR9xKDBrjyempzWGZfdGG4q/QXjruw6f6UTXQsZbteEUEXUr3/BRyKwCDCXztQiy7+Mix39jTYdQfzv0O85jLdYiL6UJPLgZJPlXSrWI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871461; c=relaxed/simple;
	bh=k/5ig5ONwsnkdgPMJ5jhFJBX5ppFH9cc/Uo9rdAI8a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UoCMhoaa4fcfUsgt7p+67G8TD9FH5zozEHL1MmL9EyTViDHjmC7azpLlkfLVAGo43LNEjEDY0uCmtG2x26PhtDWy7CvgZ5NwBVgE/SpV+msvMEKjrblfl+98fTrhlGxObpbFeHtY1PjPyOZV3kl50bcJWIXEYDPpiPtXyzlg0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFvXF4Ul; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFvXF4Ul"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be84so7918206c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871459; x=1791476259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUuxBELaGQbgmCKkI/Vu7XcacxWn6YEXtbMh1ZJI2Ps=;
        b=aFvXF4UlmTUbW/BmS8FoDg8O8NGXYDKnxsLBltb5kOtRRmdauMmFxSUK4N3N8pNh4u
         azvSeTvrO8Yq/QWLXiwsXBHVDsGGqjJabH7DJfITPtFtJHwmlglwN6zeDkaXR24ncwow
         a75LQe+JVuYLsf7dSslIj4MtJC384jtgqnPX2OyEqRgSJBjPv13P77Ewu288NHAV1+VR
         uS/tuhO/eCYcmdZUT4A6qFZQoJLIo2aghsCuBYNimtvhkqrjnlFMGtNqAne3fgRTUJFX
         KDQAPkVYawCNDa/UgjICt807tDQEITZcvRhxFER6KCUGqE+iQX8Cgpr0RRqv30D5G7Xr
         cHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871459; x=1791476259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUuxBELaGQbgmCKkI/Vu7XcacxWn6YEXtbMh1ZJI2Ps=;
        b=1LgNrs8mdyy+fvZJxPt03UfNFaxII7v8M5GtL4MKr6Byy4pdTdViKBR7zT9ZY/wPKd
         Gd3Qz0V07liGjHCE1Q/fMcoFkYv7A4W1Yn3PjZq2UuzbpZA842fSgiZiau91P71JMKKC
         44nwNpVVP4PUBuCp3qTfzHqUHgAlWY2CU/8cafShRHGdlvnnPPqo7cFKzb7IUNkj+qUR
         S4dAUdFp4nlZNIjAcuxTQAJvdbNcvTnLz2mB8ozlY+Osffw4ELtPf3JTHpfenCWrQnE1
         Tq5njtOAgcIQDJfBj1kL9biE4L0a4Yp0QrfFzDi6qI7DRynCKMxd9IELYDrnWj3PAOb0
         0JVg==
X-Forwarded-Encrypted: i=1; AKwUvBzl5hqZuYn3/rl8e38+1ntQj9VRSHF+pskr6m6oC/2JPKNDtp5sewI4ACGAFXr6OU6fJxFWGoTzZfrs0bU=@vger.kernel.org
X-Gm-Message-State: AFuF++k52PBDFGcLejbhmuADYVr5M9qEwFSEzmsUYuEMbv4DwzsPoLV6
	V0Xju7r+uNX9tI7i/0apFzP7sKo37iYJcgirSt/8QPFCPga4rgZyYpTq
X-Gm-Gg: AYBFou0FMp4/keG8yA4r+vwKGZ0UPsxSPHKOGOAUz0aPyqDLhpnlbeEW4JUPCj7AXGp
	36rMBCIBjl4dt7QIAvWAzdjtv1PfDfdyhXgi0F/R14Pc8vBamYUDbvmLZ42EK8tsFIuqdEpLu8R
	zmMWU94J/UYFDRyjSIp0Bt5mEg3s8SJWz1fGeUo26CrH+XopmLnTIRbPXyuXE23/y92/E2DPxGG
	juzujK252Bd9I+w2kGTzTN3ZeezVLmmodtN/Ug5leXXtfI/6NDt/Jorbv1X76NF2fapYnsduqY6
	r4Zvfn/1W1u1MLfe9vyeGy45qC0lvHYK6oqra7NIKY6f0UGh13Ynf2tgDhSQOatR80Dci+2nOnd
	LvAOCA9yGf0KHSW5SRxxyi/DmwGTweYm/rUEW6SYwFMmKpTnVWWLUe5/MDNhTTuuk+F67n0QfRh
	v4dyCkpXiYlQLvAXgkGH9jzPXZsWM8JiQyRf/Xd3EtaSN8PGKBxVDUZM3bzwPFz6YIh81syOPN+
	/wd9BiT8cJ+pq5PO7vcBx95LouaR3bFyisHsRwFciwHgU5TAEFBG4xh1TSO87rWYEBmx/3A
X-Received: by 2002:a05:7022:b889:b0:145:f4:1401 with SMTP id a92af1059eb24-14d36cf68ddmr4922780c88.46.1790871458840;
        Thu, 01 Oct 2026 09:17:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:a4cd:e25d:fdef:4a3b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f27d322d9sm369601c88.16.2026.10.01.09.17.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 09:17:38 -0700 (PDT)
From: techyminati <sinha.aryan03@gmail.com>
X-Google-Original-From: techyminati <techyminati@outlook.com>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH wireless] wifi: nxpwifi: fix NULL deref and leak in authenticate
Date: Thu,  1 Oct 2026 21:47:13 +0530
Message-ID: <20261001161730.49134-1-techyminati@outlook.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aryan Sinha <sinha.aryan03@gmail.com>

mgmt is allocated but never checked, and the auth frame is filled in
right after, so a failed kzalloc ends up dereferencing NULL. The skb
error path also returns without freeing mgmt.

Hence, Check the allocation, and free mgmt when the skb alloc fails.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 86304ea33..9eb809caa 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -3403,6 +3403,8 @@ nxpwifi_cfg80211_authenticate(struct wiphy *wiphy,
 		pkt_len -= 4;
 
 	mgmt = kzalloc(pkt_len, GFP_KERNEL);
+	if (!mgmt)
+		return -ENOMEM;
 
 	skb = dev_alloc_skb(NXPWIFI_MIN_DATA_HEADER_LEN +
 			    NXPWIFI_MGMT_FRAME_HEADER_SIZE +
@@ -3410,6 +3412,7 @@ nxpwifi_cfg80211_authenticate(struct wiphy *wiphy,
 	if (!skb) {
 		nxpwifi_dbg(adapter, ERROR,
 			    "allocate skb failed for management frame\n");
+		kfree(mgmt);
 		return -ENOMEM;
 	}
 
-- 
2.46.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689952;
	b=oo1cMrdxY2rh0FfJXTx1fzd8lLa1pYZManJpSgmewKFSfE6On9dmaHO7d/eApjJ81jo6
	 XB37kMuuiBwEiJOdaFaC87tDpQKCTjHZjzGJGx84SMwSd2158oqi2X3bESeHCXCE7CPp4
	 FRsLzRat1tKfSqO+9KCwUAnlB7LAUxPSIqxNv+sN4WNyqBWOhCQZxzlrD8cMdupo1XBpC
	 iCEcQGvTQ47mfbac+FVta+TXmIcADML3vNUNgIvGvhyr0bqAMD5lyrOYp7x3V9AT07MTN
	 WQyt6f3h7MuFOEw7umh13yS/TJ1mgfWniaPLAO2vI8/9lRLjveMPi19xyOVrXFFp0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AqKxs5uUt1YSeqbBR/C8gR3VaWJED/4MoRfLDJact7I=;
	b=4n27kfYx2xd1iSwuSMOemBBkJyHwfirHx+575kVclG2fIvrTcb07g00yCZE7tzwswwK6
	 6QDcJ1Fqlp8dxMb0bJzNVi3uMVFKGvuZnFbbhrxfQPnWRbbe3kf6qT6CZQZN9RDHjHbGd
	 WnieKvzJQPkG0U0CxT2wwq1fHhiojgc5Jmou3yZ48iOnPbBTISityYSZweej61T5ja2bn
	 3kkX0buL0hek/RaAP4PeaFU1zLwNPQh0oOLfJbZPQ+eClR5OMLdjKogZCFJARMwreirKE
	 IfsIFKa3bTyxycvGXFM1Epp0XntZ6X7BCCsj2HqAQHcHrOPCGM1V5S7NcjxrLWY9Zxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=remarkable.no;
	spf=pass smtp.mailfrom=remarkable.no;
	dkim=pass header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=ZRIUOhY1;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B701606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B701606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=remarkable.no header.i=@remarkable.no header.a=rsa-sha256 header.s=google header.b=ZRIUOhY1
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso4550556a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1793689951; x=1794294751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqKxs5uUt1YSeqbBR/C8gR3VaWJED/4MoRfLDJact7I=;
        b=ZRIUOhY1hytSyfv3BuM36boJvBvWuRAd0KZMGEbjxGbl9T732kCHYid1rpCfCYXCQl
         7bUu4IwUXdTJ4wiElejBWnbENqKF5qf0/paHnE7SB68nVKPz51Pj3hRu+GeGkJQ4sZBb
         87/q/VJLHYOS0jeM+7Y1aLgQ16gTSCLKkC3UL0lTa/KPj/LuVGeotYUH1Y4Vzs/cWeWQ
         fmgNU2TOqkZTY5lJr5XhUnA+iLXJ+yaNd3c3M5hKvphsRW52IM39NrDO+BVO9EoqPzg5
         S4vP1fdQeU8iG4sl5/o7yuazCzkNDfLHC7OyWbRrFbee2KIDJjWiG58vNNSxg9wkJ6Y2
         Es3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689951; x=1794294751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqKxs5uUt1YSeqbBR/C8gR3VaWJED/4MoRfLDJact7I=;
        b=KKQu7y4R1/eliD+sA6uKncRHOC1eyV8QSMDrqLV/NtwL5Hnmte44+7i8P8siW38ajN
         vXqtAYES4mjW7cCXWwTql/WUc25l1b0bZIWxe4muZw5QhsUr3pXYN5lzyss4cJ8qk0gK
         pqIjVL6kWbJAvB6p4JPrdIMLAeLh3HMbC0PBCsvTEcULVbtU2wOyOzmA1kcHzxJ1zmk8
         vo6Jwy7XFBgDvhXZEXPhPotetm9PUIMg7lZebHPIqWqYzeTwwRQ9nQeA3Np+nhIpeEHt
         SHVSieHPxNvEzgRgsshIAvMmv+TU9PJ5K7/XaJwwUpkHuKd+wphg43mZ7LWroeC9Poy3
         vnjw==
X-Forwarded-Encrypted: i=1; AKwUvBw9+4D8rbRxbBQtZKENlT0jucj3dojWvuIIhXzjZmMqTrcIM/1eELLUv0cgCVJi/Afz5/+uy4gzCjqEcBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OG3ZbPhTo9O6EtaQS3/saKPLpL2nzmaMlcbDJLEbGkZfegn6R
	5jY2NhZGdL/VGQEETy/R51/smkG2KhsZt7fEReda1YVRuaYfqXnft8R3nadS5i27cRc=
X-Gm-Gg: AYBFou1Wri09iqBsb3hUDZ8quSHpdnPVlU/lDR6sydTzUgTDsF2yY5fHNwJ6ipY/SNC
	DTEiVirtr6N6kTscHm56475sFigMJ8VNn0MBy+Y9XnccOwZe6qs4jzO7vf5kfF4c6LYQobxDHUU
	oiOFH9NqL5HFQeObR9F6llcd9dysQGktMsIu14GMkhOxVn2Nn+azABccjIIiH91M4L3RH7BQl8e
	ikxRJ+eS3B0hSE1cbBeknH+H7jGu+7tJd/znU+/4LcUx2RFsMugV4mpEQgVX35QW19LrRBRFvr5
	uPOVSl2hwVJd79PbRBXGUxBPlHrbQJgQ575UW665CZy/IvOj+eXFXtahgMhKzsiUSgY23mK1Qw2
	ijqoluoARh9URTO9errenrxgJSXTi/Mj5S+Mtxg5O6j6b5z6+xyiYobutBPLo4z2Lh5G22s/MWb
	ghP+le3jzywtJJm7e4tElt1WfbwGj8MNhACfMgf+41uOZf5a5yrVM14Uu4f01hlUCTK6/d+VYsU
	d4HkUA9yUnAIOkLiIajKT+nVXf0DxtNYJp/rEGEarXewLvVjXKdVobnvQOhvgYmrpSUpPoSO7XS
	5mVjFX4HVY83yI04KQIinrCXUrJTm0DeeyQ9VVTPOy+1
X-Received: by 2002:aa7:d488:0:b0:6b4:2fc3:7d85 with SMTP id 4fb4d7f45d1cf-6b4d4d8257bmr6199677a12.26.1793689950891;
        Mon, 02 Nov 2026 23:12:30 -0800 (PST)
Received: from vkn-desktop.lan ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm3895470a12.10.2026.11.02.23.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:12:30 -0800 (PST)
From: Viktor Korsnes <viktor.korsnes@remarkable.no>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Viktor Korsnes <viktor.korsnes@remarkable.no>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v2 1/2] wifi: nxpwifi: fix hex parsing in nxpwifi_parse_cal_cfg()
Date: Tue,  3 Nov 2026 08:11:59 +0100
Message-ID: <20261103071203.1288146-1-viktor.korsnes@remarkable.no>
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

nxpwifi_parse_cal_cfg() passes a pointer into the raw firmware buffer to
kstrtou8(). Because kstrtou8() requires a NUL- or newline-terminated
string, it fails with -EINVAL as soon as it encounters a space after the
first byte, causing nxpwifi_parse_cal_cfg() to return 0 bytes.

Use hex2bin() instead to parse each two-character hex byte, bound the
output buffer to the command buffer capacity, and return -EINVAL when
no calibration data is parsed.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Assisted-by: GitHub-Copilot:Gemini-4-Argon
Signed-off-by: Viktor Korsnes <viktor.korsnes@remarkable.no>
---
v2:
 - Add missing <linux/hex.h> include for hex2bin() (kernel test robot)
 - Change src to const char * in nxpwifi_parse_cal_cfg() to avoid
   -Wpointer-sign on architectures with signed char

 drivers/net/wireless/nxp/nxpwifi/sta_cmd.c | 28 ++++++++++++++++------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
index 5e8ffd306b31..c2ab32fc8e12 100644
--- a/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
+++ b/drivers/net/wireless/nxp/nxpwifi/sta_cmd.c
@@ -5,6 +5,8 @@
  * Copyright 2011-2024 NXP
  */
 
+#include <linux/hex.h>
+
 #include "cfg.h"
 #include "util.h"
 #include "fw.h"
@@ -1391,9 +1393,11 @@ nxpwifi_ret_sta_mem_access(struct nxpwifi_private *priv,
 	return 0;
 }
 
-static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst)
+static u32 nxpwifi_parse_cal_cfg(const char *src, size_t len, u8 *dst,
+				 size_t dst_size)
 {
-	u8 *s = src, *d = dst;
+	const char *s = src;
+	u8 *d = dst;
 
 	while (s - src < len) {
 		if (*s && (isspace(*s) || *s == '\t')) {
@@ -1401,7 +1405,8 @@ static u32 nxpwifi_parse_cal_cfg(u8 *src, size_t len, u8 *dst)
 			continue;
 		}
 		if (isxdigit(*s)) {
-			if (kstrtou8(s, 16, d))
+			if (d - dst >= dst_size || src + len - s < 2 ||
+			    hex2bin(d, s, 1))
 				return 0;
 			d++;
 			s += 2;
@@ -1423,14 +1428,18 @@ nxpwifi_cmd_sta_cfg_data(struct nxpwifi_private *priv,
 	u32 len;
 	u8 *data = (u8 *)cmd + S_DS_GEN;
 
-	if (adapter->cal_data->data && adapter->cal_data->size > 0) {
-		len = nxpwifi_parse_cal_cfg((u8 *)adapter->cal_data->data,
-					    adapter->cal_data->size, data);
-		nxpwifi_dbg(adapter, INFO,
-			    "download cfg_data from config file\n");
-	} else {
+	if (!adapter->cal_data || !adapter->cal_data->data ||
+	    !adapter->cal_data->size)
 		return -EINVAL;
-	}
+
+	len = nxpwifi_parse_cal_cfg((const char *)adapter->cal_data->data,
+				    adapter->cal_data->size, data,
+				    NXPWIFI_SIZE_OF_CMD_BUFFER - S_DS_GEN);
+	if (!len)
+		return -EINVAL;
+
+	nxpwifi_dbg(adapter, INFO,
+		    "download cfg_data from config file\n");
 
 	cmd->command = cpu_to_le16(HOST_CMD_CFG_DATA);
 	cmd->size = cpu_to_le16(S_DS_GEN + len);
-- 
2.53.0


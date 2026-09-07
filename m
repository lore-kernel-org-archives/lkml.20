Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A202E4257
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761614; cv=none; b=NWP6lBvYf2vjMEsxUTTA8NxjWZzDVawDNuMM1r2qvpiJ+jFB/zqGJ0t58hJkK4hFLzj/NoDDbA0swn6amcGOUC8ydtMEz5Hiun0FbwHaFdS5JBlwNsvHmYjpI3uK7kqM9Jq0o1ywDBpvzX2iYJSmKIwbW6eMvrW91xQHmVhfzwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761614; c=relaxed/simple;
	bh=JkhQsDhUIEm/FKGqUwTqIifZDkdcapBU6FPgynLGqZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lu4TaQ/ZbMz0+xJOLabq12amRt9IR2PCFDKWkQh50G5Z+3suNn0hU1RbGhHmFAFAohV6r37sdR/R7n610qWbUaXppYZaBiEFycWDqr24hpupqFjPyoT+Fj1tJk/U0nLCTk1piMD8nC2xXuNcDctKw5R+Wr7bv5K9Iv6YaaGLw1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnI9920P; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnI9920P"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2248303a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761612; x=1789366412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMd2WrlSwtLrj+YkB5SmHSB5gQaJTN683ra2r4lrfrw=;
        b=VnI9920PuV8QuJmwL6JMOPre5HEQXSiwjp6lpOC9GloH49xlUA71x3A29EPSECSmIH
         xLlHX8XLFNc27dbR8F0il0K/sBGKmBP8otShCMDqqBHwc7ym/c1JdTu3OvyzXYSMVrcD
         cZE5Z7ry67+O+aA2YKp6r9oTuHB9atp8quPVTgYYXGMC4PUUfXwD00xrqaQgEosFfHNq
         g6fgTf6FoZyPe7YPmA4iavBMEaTkhbmx+E7B1fAsjOlzCVPbSdEFKh83RUMHddmE2PV4
         EVfNFi2P5/h58aDg4Y2OS8ULWGNeyeRlAN4VxZ1NKk4q1PawlgfGSejgMMBGowbzmozI
         hvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761612; x=1789366412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMd2WrlSwtLrj+YkB5SmHSB5gQaJTN683ra2r4lrfrw=;
        b=TB8zqds2HDts3x7yc7ohMfAQ/MkJEd4ZJP35J1BqIsJHOBO0qU7rIYWf3nLCHf14tR
         DAgFPblHPgmODiCdFn2JP5T1R6whPRYJjl1ZAwmXomRysc5guZQG4ECOvOIO97JfOotu
         nIMR9OTKBJx5Pe/pYr85eTzq7Xie+NVM12n4lAlp162WAly9G9s8rG1MXll7ZayoZSn/
         lZ++8rrP7mreIZbaijKI535+HFcrPDQofdUo44rHq5VngHIJ7EXLeHonAvdF3BxE8Kd9
         8bmNFOhlh4JNZ97UOYk5+P0PGSzoYHBBCYmZXbl0z+S5hBV3FKD7yILLITtaRBNa3znE
         VeZg==
X-Forwarded-Encrypted: i=1; AKwUvBxLPnXbIa81tB/bpHDq9IRN9qCoaLl57hsvFhgvIuDJbPIIQQ5MJAPtT4hT1H6bvk93iLyavVWvH5I+v2A=@vger.kernel.org
X-Gm-Message-State: AFuF++kcY+Av4i8n/0ku9SR/yzmCeU21pSek53mKBuTbh11SQIbmW3BW
	D9aZyAv0KOf2qetsC/Vob8yNg56OtSH2eeWTy2H829fU2vX4C+nl8WIdaD/Hd9QWN1g=
X-Gm-Gg: AYBFou0fv+LbD3283m9oT7e8oWakLMUBbckUFIGtfhzpBypGqMzuYqBjl0O+ebE3pfZ
	ncRh+AgBg4Q0OF/PXTY7emGKbdLrPSTLhoLf46e5X3yiusC6E4+IU6I9K6b151xyKQkxdkTHM6w
	ZUzXTTMVf4rfLEIBW/7BTiyvZCVRB9159cu5tQNTtMgTQ67olVm7gO1hrHsLvWLLH4VLyrF5InP
	hTVXjtDxgCDSzo59z9GszzQM09P1i3dBc+mEnOQKfyb/lKs1txJfn1t2g7ATjQ9w6wvM6LX7QV/
	RKcy70B0SAxpY0OO3rS+oR0VhQWM0GoUvWKRNiGoahPKm97jThYJYWcp3zGLWyDlzeSN16AAUAJ
	/g6exBg2kJ+FOWFsVeoTO9cCuvmT+Ea1mXj0acpg0uem6yJduNEGArBu9FlIPVA9mbfKzRkrF7f
	8wBhRC95BIRRCDgp6SbRl1LnlJpsLQWQb/MVIw0JFbKq3cvVK1ojPZXb89W3toNBjygqvMokHlH
	E9hsfozRgyqedM=
X-Received: by 2002:a05:6a21:e58b:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3da3a0aa620mr33657982637.16.1788761611960;
        Sun, 06 Sep 2026 23:13:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm27514156eec.2.2026.09.06.23.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:13:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: wcn36xx@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: wcn36xx: fix typos in comments
Date: Mon,  7 Sep 2026 11:43:27 +0530
Message-ID: <20260907061327.31452-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 drivers/net/wireless/ath/wcn36xx/hal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/hal.h b/drivers/net/wireless/ath/wcn36xx/hal.h
index ef9ea4ff891b..50c7b2ffb064 100644
--- a/drivers/net/wireless/ath/wcn36xx/hal.h
+++ b/drivers/net/wireless/ath/wcn36xx/hal.h
@@ -2650,7 +2650,7 @@ struct ani_global_class_a_stats_info {
 	 * shall be the same as the supporteRates parameter. */
 	u32 rx_input_sensitivity;
 
-	/* The maximum transmit power in dBm upto one decimal. for eg: if
+	/* The maximum transmit power in dBm up to one decimal. for eg: if
 	 * it is 10.5dBm, the value would be 105 */
 	u32 max_pwr;
 
@@ -3133,7 +3133,7 @@ struct wcn36xx_hal_nv_img_download_req_msg {
 	/* Fragment sequence number of the NV Image. Note that NV Image
 	 * might not fit into one message due to size limitation of the SMD
 	 * channel FIFO. UMAC can hence choose to chop the NV blob into
-	 * multiple fragments starting with seqeunce number 0, 1, 2 etc.
+	 * multiple fragments starting with sequence number 0, 1, 2 etc.
 	 * The last fragment MUST be indicated by marking the
 	 * isLastFragment field to 1. Note that all the NV blobs would be
 	 * concatenated together by HAL without any padding bytes in
@@ -3275,7 +3275,7 @@ struct wcn36xx_hal_send_beacon_req_msg {
 	/* TIM IE offset from the beginning of the template. */
 	u32 tim_ie_offset;
 
-	/* P2P IE offset from the begining of the template */
+	/* P2P IE offset from the beginning of the template */
 	u16 p2p_ie_offset;
 } __packed;
 
@@ -4139,10 +4139,10 @@ struct wcn36xx_hal_dump_cmd_rsp_msg {
 	/* success or failure */
 	u32 status;
 
-	/* Length of the responce message */
+	/* Length of the response message */
 	u32 rsp_length;
 
-	/* FIXME: Currently considering the responce will be less than
+	/* FIXME: Currently considering the response will be less than
 	 * 100bytes */
 	u8 rsp_buffer[DUMPCMD_RSP_BUFFER];
 } __packed;
-- 
2.48.1


Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DD1F91F6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002811; cv=none; b=J3Ry4vopBoRrX7Z3H9XIxkGW2cePbFeEJ3TlsCuWongC+mepqPDQrW3fiQoSJVt2lqRuSZfg//G48Mo6NytmtToL1hNBWFwj4dgFGL3WQa2sg6PtB1Cnb58MQrMMp0Db5WdJNtqoW5N2OrDosTNmKw2JeuH4Aab7Z2sPUeAEGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002811; c=relaxed/simple;
	bh=gIDbFUccMqnYFMZDIeOPhLXFY88ImLk2A6cLsl4slhc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S1YTphTtbXLMcFIOfaj2AdHRBDB2DMJByi3WKC+4ka8vx2JgCHCstWC/QRw2UHR2korqYbEelHTygRV3mieMpRPHxhZADIXlbDcHoTz5b6LjTgGX6bQkIGM3YBUWMe8CYlW1/lViVMPgT0rpoVuX8G0QE5dpiw1CH+GvvwiCE30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sptjiPoq; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sptjiPoq"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso26237e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791002809; x=1791607609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uHU7iI9EW7CI4ri+lRqVj5wszswoc/zT9qoMCUc6a0=;
        b=sptjiPoqJMB4D0qcIskqIq07u6taQAY7YwU05h88gWynwgz48p5xVL9JhSWUs/+jbz
         MHWV6ThT9Zl+OnvZhpojg+gn8A1e+Mo10SBlFpk3u8+rV8VpcmPcEm4/1MBmeNsIz2xT
         p/u7FzEdKWjjUXRP0vYDU6nc68v+mPGVn8WuSojAvA2ETon4dNypw73Ujxt/QhXA9T2L
         hIM6sPljiYc+D3IkFqXG6qHi7nJGqhVJ76VC5xwU1+NOebphCl0TuG8sG3+61R75Ds9r
         i+O4VcXR63S6Ls3DFOF/S6z9q5sxxrUrgLt9PyfgkXDv5mo/x4tGZk8ChwCCiqnVAWDz
         h9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002809; x=1791607609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uHU7iI9EW7CI4ri+lRqVj5wszswoc/zT9qoMCUc6a0=;
        b=V9HETCyJQT4YOA/DzVH7BOLJ02u8vpGK5xuDnOs1bcc2fFsVfrhdmHOBUF6RWmJfrg
         4Dva+Nr+sM2H1vzriKq1MRH+yEiAkH1FOt7XRArGxfxDOOABYmWBGlnZX8X7dfg9xDWy
         6daf1WhYvu8y5CRC54wnx5zpZ1XCzWbkTqWIvcjXsTTJy/tNZgqQIWGIbbm4eWoP6GBd
         ZSIJEMle0Px21AObQBxGmpGBhaQxB9jJ+mn0Itl94mKtwcF0XcGa7SueoMeGycQz2reE
         hi0RRUwNi4uo5FyNIj6lTiUlaf1CKFFYtpj1vzEzfijAmuNtq/hLCvKW4r9vN3NpiyC7
         aKwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQLClGxZ0obYzIqYANLpddTAJCkOolpMEXtce+Idktcg4p5dbG6lVFgXlutj1snlGMRbKtnDU9aFjlvbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLygrih86W0aOK2gi3BVcKuV72RJR8xgexWTsBXMEA/emFkpVCc
	dZwgvUlS2qHfASp3AsFiksLLMdmZZ2w3qBWYagHT21sDuBDqjhf7BVZXo7uiv/pKUg==
X-Gm-Gg: AYBFou0rMgc8cvMMcdRgKFMrXjm6TvTBVHA1efH2AjLaj3iPcyJBTmQHjT+u5lDOym0
	mKjxIxThBZ/Ud0SWG/TS+dy+oqW3BQZ8cRDaLjQmPZgHG9eiVH6y9SupmmeCGHItA5SZedKBaGe
	pMGFk6k+YiJS1rBwBM03zFeAc805VMxsPhmArqGDxmTlJRFiaTdkq0oP0NLeBghDiUbkjuUuzvr
	YvLY9esgf0y16dVZVemQncUrIaeOBzbOkAiIbID4q6WWPXenAFd/wy2muCAjRZ/BWg7VPoOBzCK
	Li7gNFM6vFNeyZIZEORTed4Z4XTrGzPWdv/8VcBJdJlz4J4i5JE5/jOTkgrjP/90dCDesc5dYvT
	McYdLPYhLn0ASEnvQL+2LAcVG3IKVnJWNUm+bZaSqiY0S2F1svzR8fe/gHFx34YrJPNsfgc042J
	YC/Aq+7SNYkIkSn+LTzTYPCWzBQw90JMyRlAQmz4ESPpB8aAI7l1+iUp4SIQwL/jIJ3AZdNYrXT
	NRyiRQeVicdHYBRSeZWX0e37TVcOi3DF7MX4LQKekG7V1xQd58pVkLexCKbXTy5wxfoOzcA
X-Received: by 2002:a05:6122:469f:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5daafc57003mr1406970e0c.8.1791002808599;
        Fri, 02 Oct 2026 21:46:48 -0700 (PDT)
Received: from x1-nano.. ([181.55.23.9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61112dfesm6006789e0c.4.2026.10.02.21.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:46:47 -0700 (PDT)
From: Steven Sierra <bizoru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Steven Sierra <bizoru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines in rtw_recv.h
Date: Fri,  2 Oct 2026 23:46:43 -0500
Message-Id: <20261003044643.2451960-1-bizoru@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse runs of consecutive blank lines to a single blank line to
resolve the "Please do not use multiple blank lines" checkpatch
warnings in this file.  No functional change.

Signed-off-by: Steven Sierra <bizoru@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 9c32d480a2..28d2f619bb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -58,7 +58,6 @@ struct	stainfo_rxcache	{
 */
 };
 
-
 struct signal_stat {
 	u8 update_req;		/* used to indicate */
 	u8 avg_val;		/* avg of valid elements */
@@ -140,7 +139,6 @@ struct rx_pkt_attrib	{
 	struct phy_info phy_info;
 };
 
-
 /* These definition is used for Rx packet reordering. */
 #define SN_LESS(a, b)		(((a - b) & 0x800) != 0)
 #define SN_EQUAL(a, b)	(a == b)
@@ -212,7 +210,6 @@ struct recv_priv {
 	/* s8 RxRssi[2]; */
 	/* int FalseAlmCnt_all; */
 
-
 	struct timer_list signal_stat_timer;
 	u32 signal_stat_sampling_interval;
 	/* u32 signal_stat_converging_constant; */
@@ -238,7 +235,6 @@ struct sta_recv_priv {
 
 };
 
-
 struct recv_buf {
 	struct list_head list;
 
@@ -261,7 +257,6 @@ struct recv_buf {
 	u8 reuse;
 };
 
-
 /*
 	head  ----->
 
@@ -271,7 +266,6 @@ struct recv_buf {
 
 		tail  ----->
 
-
 	end   ----->
 
 	len = (unsigned int)(tail - data);
@@ -298,7 +292,6 @@ struct recv_frame_hdr {
 
 	void *precvbuf;
 
-
 	/*  */
 	struct sta_info *psta;
 
@@ -306,7 +299,6 @@ struct recv_frame_hdr {
 	struct recv_reorder_ctrl *preorder_ctrl;
 };
 
-
 union recv_frame {
 	union{
 		struct list_head list;
@@ -361,11 +353,9 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 
 	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
 
-
 	if (!precvframe)
 		return NULL;
 
-
 	precvframe->u.hdr.rx_data += sz;
 
 	if (precvframe->u.hdr.rx_data > precvframe->u.hdr.rx_tail) {
@@ -405,8 +395,6 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 
 }
 
-
-
 static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int sz)
 {
 	/*  rmv data from rx_tail (by yitsen) */
@@ -435,7 +423,6 @@ static inline signed int get_recvframe_len(union recv_frame *precvframe)
 	return precvframe->u.hdr.len;
 }
 
-
 static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 {
 	s32	SignalPower; /*  in dBm. */
@@ -447,7 +434,6 @@ static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 	return SignalPower;
 }
 
-
 struct sta_info;
 
 extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
-- 
2.34.1


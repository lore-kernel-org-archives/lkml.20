Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CF53E310
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918966; cv=none; b=ltndSMNxhtwZU4z89nQnezjOE8Tt0YbB57YKvlg3GXm07a6j6M4ZDZoKjwbOEu8cCzwJk/TDLIwbDqExgqzDWP1gDDWXnEaR246vOzPeKbYBR9B3HIHyehjBucNnwtDveNOi4VHmwbaxX2fX8o6M+4uvbzqLEZHs2Fepli5dhzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918966; c=relaxed/simple;
	bh=IDJqFbIJ+Lq1Jf9DcU0KCW0ttxfoA2bTcIvvprI6nfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw1cAD+oW/xAH7aG0Ytpt2yjn0mu6Ff5+momFbHWm2gvMmqEA8ecu/4EZhfeHUswPfmyYk/oEzBaMKPYZh7AxKTka/h7zBAILtOtDck0w5GNXI9EMRWTofLOkmPbShaiSR5n1LD/2GZORjQoxUQCvoaTbpqZVZ3HfY1p9aMwv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9ORRWo1; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9ORRWo1"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a198438aacso5215745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918963; x=1792523763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDIRPE7o88CGHqIF/j5hvY6UjNuhEKh9m4Ei7y5vR34=;
        b=a9ORRWo1J4RFsPk9mHFyqSCuJRMI5OF1eAn9irBkupzpw32P4JHJLk9cznLi/mooYU
         fIsCjr196H6phhd2cjSP6a8m/c74wCpTPTYliiIOHe474lHb1YYZ6jW5SeSN+TVt4xUc
         0ZpoOlrl1QSvziJTJ0/2mKb8yRkCWGbxzKJpJ7bgJxjTYo/j4tANti25QFmhKwJv18Gq
         c/XJuQ6paR3XX5dVYa3pBjFrujx1okcibR7+MYUN4f9iiHZBR06rs0MxasIGIrIHqLYR
         0ztR8mNZZtMKCC/ND5arwqx63KEe6zaiughYzOA7dunXz6a86I2/iF6nCwR0uMx4Yzc2
         C1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918963; x=1792523763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDIRPE7o88CGHqIF/j5hvY6UjNuhEKh9m4Ei7y5vR34=;
        b=kNuX7ukzYgYpdTbk/pINc7xHCouow/Kn33rdZYov2TLir6N8XpzDajqfahLU6ac9Og
         rpC9q3I3mgAIafU/uJYup7pggXx+LAw5Fi86KJPFdfkYqiN/802WuEzOmmFtwAnumxR0
         9izJfoIlobzUIXw0DeQaZ4pRKcXCe4tCk7l4pXA/mEMrBKtelJSYsJz2+C/GA0QBx3V4
         SFgD+2xipolE5G8MexK37E/TN0BealuPcNIuviVvonKx2iY3CQLybnto3B+3UZO4Aa4q
         ElICsyoc7Gq9VKUiAYIbFcGVB+rmafI63jhp4KCHshSw71DjM2qX+ztPDKoTuf82Mset
         YOPg==
X-Forwarded-Encrypted: i=1; AKwUvBxjBnLIArocC+MkQpZi6Mf6gz2Q4wzwsduPcOJO/Wz6zJKdKT9vXPgi58ufauR+Cqz2W/BmS1gw2b3Nm2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLUl1cqjvE546Fa8NH0S9EALywWXzTRBtHRZHKDHih7tOYCR2r
	f/m8kKPquzEdY5WG8fT7phVBHK1dGVStstoRxnqabTzd/kHBHgm8j9JB
X-Gm-Gg: AYBFou07XivfEuS7Bh6SHZpxnTXNObuU3APSt7edYYEMy6C5idakr8T9VIRbu18N9TL
	3VCtlGOe22fiEpnRC3VSzOjb4Esgk/eY9sX/4yqzu77A3sAVIsiqYVU20FGP4JeITsO2nOAbtDg
	VRxKCDrHhgrwFFYM99RFvESFLn0FfLccb9cva3Cl+MocSXpBDiHvXFyogWCxwUU1eufH4v+mpAC
	Jq7ViW2oY+vXaSwhm4ZlyDoQMCTXOYIOy6ZpcIkFYzEt/SQDvZtuZaw1Zpidh0kGnMftnUxocD9
	oEfkrARvANrZ047BdZoo/i1L/6GQeTZm0VQ1FDmg5FlTXF6ddKWs/ffRkXlVhP2/SrIyZ/+4ZOk
	euSV4F3LtTCWODaNVKMW4ox9oioAVaMzljVoRCmzc+zc5lgUL97I/Mvopl6MKyyM2ZCdIN5l3Hn
	hGzzFHVd9dYSymhUcuP6pU59q+bAe8lt/BAQDQ73lS+ldieos6SL8wiRi5y1sdhmxevU6Nqw==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr266379435e9.33.1791918963174;
        Tue, 13 Oct 2026 12:16:03 -0700 (PDT)
Received: from fedora41 ([37.168.42.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2fc4724sm7229275e9.2.2026.10.13.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:16:02 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v5 2/2] staging: rtl8723bs: unwind cast mess and remove phy_stat struct
Date: Tue, 13 Oct 2026 21:15:03 +0200
Message-ID: <20261013191503.152056-3-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013191503.152056-1-timo.joannin@gmail.com>
References: <20261013191503.152056-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the real struct type all the way through
the call chain to remove redundant casts to and from u8 *.

Remove redundant phy_stat struct, along with the dead function
prototype rtl8723b_query_rx_phy_status() which referenced it.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   |  5 +++++
 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index fb3a19da5de3..c0a079003e73 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -432,8 +432,13 @@ static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
 }
 
 /*  Endianness before calling this API */
+<<<<<<< HEAD
 void odm_phy_status_query(struct dm_odm_t *dm_odm,
 			  struct odm_phy_info *phy_info,
+=======
+void odm_phy_status_query(struct dm_odm_t *dm_odm,
+			  struct odm_phy_info *phy_info,
+>>>>>>> f52adf8 (staging: rtl8723bs: unwind cast mess and remove phy_stat struct)
 			  struct rtl8723bs_phy_status_rpt *phy_status,
 			  struct odm_packet_info *pkt_info)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index b63625ab4e45..072e2b5f6129 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -9,24 +9,6 @@
 
 #define MAX_RECVBUF_SZ (10240)
 
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..2f230e2d27a4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -84,7 +84,6 @@ struct rxreport_8723b {
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
-- 
2.56.0


Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D604241686
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788018618; cv=none; b=BIAxrsceupiNKCXtxC0FhXxd7rt+4Gx+O1c9UcS+3a7kkAf575CZJSSrrZUz4fJYOld72zcJhSGsg91XJuAUJtgAisNRmAOhjYAWxwBXGUyklOTd94kAstblaW+x/if+ig9EPzs9caCp7kWM7wndOSSXU704vBToh6kL93iSpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788018618; c=relaxed/simple;
	bh=FTPAarf/mizk0u8bdshHgq6IEz7WcpqwdItWjHX1dVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cb0AciSoo+mJW27W72FeWUij9WDzZLaf7JFedFzfgS7GOLGS9x8W6VsOm2EhU0O9rUTwSDleAICdhFF5cQWlwr9XKkZaOmyXPgpSqRvpBMOHluAWlcGInrN3hGupRNKSWbv43E4ToV2wdU9Rlf3VTzDUQ5nCy90ClTAweE5Hy8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrJp0/ys; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrJp0/ys"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1502851b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788018616; x=1788623416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnD97PHReqQB3H2W3lc4LNtjiJ2gT8oWqhG2Qo3SxWg=;
        b=HrJp0/ysyaFQ8c/3h8kQOOrG6ShvmI9DrGpb/Zyhr8od+IBygBCP1DDRYhSgcHKl2l
         ETT7jwWWEzZEhM2eKuf2SIe10meHfwHI/Xdk/lyhuKJKKHKv+ZXkMV8WbRit9QxLmCK0
         5I4VQGAgdH8DUAbd7rCwodTxq7+e4wCS20jaeXVBGdC6NJabkr26qsmzUXEUjtyqgEL0
         17qnvPimfVWmPCe8SmpLdEwjmG9j3G+/GA8QDomkZcLvxJyPgeiWn8UMy8KUWwHjBON0
         TfuEnzogSSbWA4yrDOP93E0nZ0LaiaWKEMh9H6wxHozUp1eSk79QEWCUfcKWJpA6XUqb
         Boyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788018616; x=1788623416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnD97PHReqQB3H2W3lc4LNtjiJ2gT8oWqhG2Qo3SxWg=;
        b=svIUtUSpaPybjzllekvbZ6vseyAU3+8S6D1MLyJ26j1HhwUx1NEPfId0cIF8JlRaQf
         o2UtuX4U/w5NK1uwpj59wBEDpfg3VktSW/2AR72TjSUne6xuYJp94nhKqgVI18Hy24Jd
         mnqvr+JVCPewAyW7oE0y47IWGntkdPDudeSiL2muKDKj9W3Vau0/RoN1vlRbp1ci7/G7
         xuJYY3Hqt3A/hBfmWgqGcbp+sdmEaxk4eIeFbdYMt4QzVFnO8EzQBLhbnkZI3TwNC4te
         bPYMG93ZcWbANSy8H9ZI0S7gjBpsBXBxbnv7QeC3zvKIKLt0bhtgRSr5SK1jnsyDwHtb
         2DbQ==
X-Forwarded-Encrypted: i=1; AHgh+RofO2KVkTBP5mjOe1EmwNIf4DZFc6/JiFRc0Y8OLJ2wwkclIwOiWxoWqswF9l760QCmfOk8qkmk01UCp2o=@vger.kernel.org
X-Gm-Message-State: AFuF++n2lmL6ueHjhZYvMvJHEfEs2z8T3nX3+fosT2IbP23AF/zHV9Zj
	qRXCR/V42fKipxt0StCtfV6xd3fc6y2yiOsxLx6/ck7gshbfHm757QnX6wVP1DT1
X-Gm-Gg: AR+sD129PTRR5RPqRo+IP0qkd9q34w+PKIwFY6BLtRTffXsy58GmijBP/RWeAXXhvp2
	Rivy5957UkkLq+3blcdMUDERgusLy7ABQxApTe885WZIA/GWuIqhfexct1xExJtT+T/5q6X+eoI
	F9vutZFH1ms1JwsW51sQKqpQpMb9zcE/8e65hrxpWN64Q1/SMSGbcL/dk39lOS0Jslm9/+QDFTf
	UKJYukntYo8FI/HmI6aNB0y44SrJ4RbAe+TS+Zo6JdltcGCtAXHFkdx3v0IspN6xTccj4JypzyM
	iLuouYWiajYRMHIFmO5LtgxFvEq+iBylYz0My42Xe+umJQtTHdsS/QKsmxW6WysMCSksgi89aex
	X1v0aGY7/ttMJ0ExKg1t+HSztQCuWoW+KL2Tr797n9i07oD8e5HBhREUTxTatQmGUR+mpxRjj7x
	Uuv75u/pihOC9AsfYImbg73VeicQ5/U/CUTkXezX3/ZJ/dax4CfG0knMN5pdUswhM8lzcI3s5or
	XhMa80DHke2Twc+ZB3l5Ta7
X-Received: by 2002:a05:6a21:3995:b0:3d3:adbf:777a with SMTP id adf61e73a8af0-3d3adbf8154mr11208534637.22.1788018616268;
        Sat, 29 Aug 2026 08:50:16 -0700 (PDT)
Received: from Debian.tail44843d.ts.net ([183.82.161.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm23838131c88.4.2026.08.29.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:50:15 -0700 (PDT)
From: Mirza Ishan Beg <seedandsyntax@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Mirza Ishan Beg <seedandsyntax@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: refactor traffic_stat access in collect_traffic_statistics
Date: Sat, 29 Aug 2026 21:18:38 +0530
Message-ID: <20260829154838.4533-1-seedandsyntax@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807150940.5066-1-seedandsyntax@gmail.com>
References: <20260807150940.5066-1-seedandsyntax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace repetitive `pdvobjpriv->traffic_stat.` dereferencing with a local
pointer `ts` to improve readability and reduce line length. This resolves
multiple checkpatch line-length warnings without manual wrapping.

Suggested-by: Nikolay Kulikov <nikolayof23@gmail.com>
Signed-off-by: Mirza Ishan Beg <seedandsyntax@gmail.com>
Link: https://lore.kernel.org/linux-staging/agDaGJ5UKndFUNPY@archlinux/
---
Changes in v5:
- Removed the `Closes` and `Reported-by` tags.

Changes in v4:
- Fix incorrect struct type: use `rtw_traffic_statistics` instead 
  of `traffic_stat` (reported by kernel test robot).
- Added `Closes` and `Reported-by` tags.

Changes in v3:
- Fix missing semicolon in pointer declaration.

Changes in v2:
- Added Link: tag with lore URL as suggested by Greg KH.

Changes in v1:
- Repetitive `pdvobjpriv->traffic_stat.` dereferencing replaced with a
  local pointer `ts` to improve readability and reduce line length.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..59f13f6b85ad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1109,25 +1109,26 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
+	struct rtw_traffic_statistics *ts = &pdvobjpriv->traffic_stat;
 
 	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	ts->tx_bytes = padapter->xmitpriv.tx_bytes;
+	ts->tx_pkts = padapter->xmitpriv.tx_pkts;
+	ts->tx_drop = padapter->xmitpriv.tx_drop;
 
 	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	ts->rx_bytes = padapter->recvpriv.rx_bytes;
+	ts->rx_pkts = padapter->recvpriv.rx_pkts;
+	ts->rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
+	ts->cur_tx_bytes = ts->tx_bytes - ts->last_tx_bytes;
+	ts->cur_rx_bytes = ts->rx_bytes - ts->last_rx_bytes;
+	ts->last_tx_bytes = ts->tx_bytes;
+	ts->last_rx_bytes = ts->rx_bytes;
 
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_tx_tp = (u32)(ts->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	ts->cur_rx_tp = (u32)(ts->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
-- 
2.47.3


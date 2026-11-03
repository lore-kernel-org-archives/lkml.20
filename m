Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699659;
	b=ly+P7VrTWMpiTnmIm22a5eLHpQ26CCF8f6Y3X7ATH+lX93wLjtqwr6EaNTRCdQ3hm3P4
	 X21LBnnUE2ILAffKtX4+FeVmqXO2Gy82gTJp/m7A59LlczVoEEkJzKZCp7rKwA2TDEm8x
	 vpGPXeJgSOMbL87uLhH11pHvpXvZa+x0erT6xtZNgTu02Yv1JfGhB20btz/0dlvVMh4Y2
	 4jbUY+Oa+/0/a25cojdLuVcT8Rz9wkuByGGpfNMmMHHmt9GR+epreW98mh9wR68hLIS6O
	 pUysuwxaXldojr0q3HcNSd9tGPvyGdJjT8R4i6BC0MopO7nzdSu0QL/r2I3Jb0f2PwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1DrmLhOc3MXaompyGxcHHoD5L3ZlNcw3m6Bj9oCs4I=;
	b=n1UaYMmNzNKM7+SWbOjC1ze2cTaz7dYudBCbjeRYTPg8/QX66LHpBh6xxim78Y1XrqPH
	 decZ2dQpV8RKGDHt6iyrXtBHuYjr8MJkCXnl1W4ChyzK07Q+OWtGWADXkW2pteIU6JPWI
	 bHsMmHnV6GGbLt4/dc2Sb9yDcvsUgpYaLgYNsxfE92srbbMmiX/Edkk2bNp+/FOfWtTIp
	 IUqPcqIEuOlutWId0/boYsmDlFm7mwMosx4SSyTKcFTXKRoavqATYS8UPRx0JGsf6UxQk
	 Ca+4xuHaV6KyxxR4fEelxJ4FupUz11CiDMVvioqAq5ccIBFkEfgLVEA+Z88ndnIEHHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zg3uL83E;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5BC60A2639
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5BC60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zg3uL83E
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so4926002c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699658; x=1794304458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1DrmLhOc3MXaompyGxcHHoD5L3ZlNcw3m6Bj9oCs4I=;
        b=Zg3uL83E9KFWqiJc3kKjlgKWitAniqjMvZQc2gWpVGxj4Qep/TmlBLmwTvg6OS4kYc
         QUw/Tr4Y1nsQA0spOBxuQo6yYQfCaWFRKbmgNSYiIP7bxmaN+TPuyUCQYX7/1fePT53+
         QpcCBhkE4rMYeyoGTI6t0oXYWai1d6BKGCH0MuXsJQCZwFoOLoHZAYjZT2jEBqSxsNxe
         WSCn11ZwT8iIjAyyjjAx7SWWbdi/AAKpuPvoMUYgFdCVHGcFHOOwAjkuuBJyxpQzRqzN
         FYeifowytzGWzVTfpWoINzxgTxhN97sijhXWZJajxJkCu6uF5ip1QHNN2vYI1uTzpgXG
         fxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699658; x=1794304458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1DrmLhOc3MXaompyGxcHHoD5L3ZlNcw3m6Bj9oCs4I=;
        b=r6hb4u0ZwQhtG/KMGeSQXnNu8Aarp8og+X2C6Uy1TZltXKa64r1BdnGEgcnaBfSAD9
         Fd3DkVVuml2wEW21Pcu95jW0W+0bkn5Uwym4nQ/KrcT3EQ15FCcWJCLoJZZYY3T4Yp8M
         VndNZQvOHY2VMs8UDEVoNM/CtwFi5ruUWlUDKncG7KNlRlsOYWIsCfcBVvX7xsxesMmw
         va0edrbbgKVobbN4nFGrAHziAEdMvnxlN0ptLH80RKxVZpLGTaAgqRWtAG8pumL9R5Om
         7gxPNrKT74rQk1zVBcV+dTCF4q1cG7l9KC2tEOcT8eZDIr97ZPcNZxcpKKFEzdRLsiEU
         wodw==
X-Forwarded-Encrypted: i=1; AKwUvBw7UUGXi+IUjuNiy7F7dmTQRtXJJdfIDQqlbLCignRIXl/qX6I50j0BOM5keuL6ArghN+Ed/hBL4qh6cEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c6CwvG88fP8T+K+/8H18lmdq+iFwHheRNK93XA44rggGdMnJH
	Zp0cm7ZHHH0HrO4uSNhxvo0T+uSmk/3WGnpv1T2oraErhcojB5SxL8Jx
X-Gm-Gg: AYBFou1wogPbwB7Szx/tGqUZNumd4modzUczO0NNgY+XmpkxGhcvHisBUXjdlxnlZXY
	0Qsz6XKgrMGgv1vb4cNXjM1F/cBTJOycqPOiGaPcyPv+uANdd90BzOe3P1WOZDLfqIiktiOmqbu
	MnjdtSlCJahpIxBJgX6qjbPexEhrCwKVUOAdIMMI/A4YpwXyXFsHuxG753Jtp+Ml5w4twiMPtLz
	nq4I0maYl6oWjXz2c+WdeziZwCYO5NN6HpdO3Sm6CLTzqzWrNPTUGDs+9VWbyNGXVZlcY46NHSV
	SVL7mTJEu5ECbEQyNPVmJakBTLWR62CWiADopvRR3orOhK3/jUkGoOIlskhRmyWOhXl1C8C382e
	Zn0WbrKA357DUV+P3ynB102iIF0qemdGtD/3P1HW1KvlXQC2SovA7DJBXzzQU2UNXtyXOw6qG9E
	ZWQUZI8uagogz4mnHUHrP0IgX9uKGEdgIJCDM8ETNs6luOq/Aw0o4C1tPbq0bN1VoBmr/0qh+ni
	enrWI880YQMDkhPmsalN2OYGYMCyM8IsFTcEjCnneilo+NFp0l+ztB0IjYJO0CCFx9kXcYD+3W4
	EPw9Mulunx3GfiWlrTQskHbX+x8dN3AH35SmSX5hfgkM2+N36IScoyus8G+W+D+N42hYnR6rQJ1
	Wf2nOCCJr
X-Received: by 2002:a05:7022:eb44:10b0:154:dc96:c1d8 with SMTP id a92af1059eb24-1ac56c9fda4mr19080291c88.2.1793699658098;
        Tue, 03 Nov 2026 01:54:18 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:9e8b:5db3:accd:585c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm44178383c88.12.2026.11.03.01.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:17 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 5/5] wifi: rtlwifi: rtl8192d: let the firmware use all rates
Date: Tue,  3 Nov 2026 17:52:54 +0800
Message-ID: <20261103095256.949327-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095256.949327-1-hjf3108@gmail.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
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

The rate mask is chosen based on rssi_level, however rssi_level
is always 0, since:
- for rtl8192de, call to rtl92d_dm_refresh_rate_adaptive_mask is
  commented out and function is not implemented
- for rtl8192du, it is also not called.

This makes the branch always choose less than optimal allowed MCS rates.
Enable all the rates.

Test results (2.4 GHz):
   before after
TX 6.4    12.6
RX 32.0   39.1

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../wireless/realtek/rtlwifi/rtl8192d/hw_common.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
index cfefbe86380fbc..0c921c049b5178 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/hw_common.c
@@ -903,7 +903,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
 		else if (rssi_level == 2)
 			ratr_bitmap &= 0x00000ff0;
 		else
-			ratr_bitmap &= 0x00000ff5;
+			ratr_bitmap &= 0x00000fff;
 		break;
 	case WIRELESS_MODE_A:
 		ratr_index = RATR_INX_WIRELESS_G;
@@ -922,7 +922,7 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
 			else if (rssi_level == 2)
 				ratr_bitmap &= 0x0007f000;
 			else
-				ratr_bitmap &= 0x0007f005;
+				ratr_bitmap &= 0x000fffff;
 		} else {
 			if (rtlphy->rf_type == RF_1T2R ||
 			    rtlphy->rf_type == RF_1T1R) {
@@ -932,14 +932,14 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
 					else if (rssi_level == 2)
 						ratr_bitmap &= 0x000ff000;
 					else
-						ratr_bitmap &= 0x000ff015;
+						ratr_bitmap &= 0x000fffff;
 				} else {
 					if (rssi_level == 1)
 						ratr_bitmap &= 0x000f0000;
 					else if (rssi_level == 2)
 						ratr_bitmap &= 0x000ff000;
 					else
-						ratr_bitmap &= 0x000ff005;
+						ratr_bitmap &= 0x000fffff;
 				}
 			} else {
 				if (curtxbw_40mhz) {
@@ -948,14 +948,14 @@ static void rtl92d_update_hal_rate_mask(struct ieee80211_hw *hw,
 					else if (rssi_level == 2)
 						ratr_bitmap &= 0x0f0ff000;
 					else
-						ratr_bitmap &= 0x0f0ff015;
+						ratr_bitmap &= 0x0fffffff;
 				} else {
 					if (rssi_level == 1)
 						ratr_bitmap &= 0x0f0f0000;
 					else if (rssi_level == 2)
 						ratr_bitmap &= 0x0f0ff000;
 					else
-						ratr_bitmap &= 0x0f0ff005;
+						ratr_bitmap &= 0x0fffffff;
 				}
 			}
 		}
-- 
2.53.0


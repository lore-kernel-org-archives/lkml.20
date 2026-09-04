Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47751A721
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547994; cv=none; b=hBJyhLPDP26rPyLEiNaqy0RNSZjsMl9WXKGdQ0F0gKT5P1DEt8S9jb9oVM15yG3/PqkfXvlwqfu9CNVfVOJjV2+vnsOny4PjOFgdDW8NC/aQ9J0gsvyRqLVC/ZwSHhhNaEy1UytUr7lCKi2G6AzI2GmF1hwzq+I0tsXt3A5WI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547994; c=relaxed/simple;
	bh=5x4dulZK0+121XejeF6S/bpx9DVjzeNeXGD4og3vsyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fC1P4GNYAQA0xDNFG3T1nRz3NETQrcYGVOWWSXFmCAyv0/seaC2IN2KSYYfh0NIXThFQVv1T7HIdWpAnfO6GeoUI9EWR31sxVMk5ViBIaNX6C5vQjV+iZou0eYp4hup/QVs023KN8kVwZI6MpQR2ajnpbaQUE3EKKG+Y9vo1fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJd98wSa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJd98wSa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso18362975e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788547990; x=1789152790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LN+PUjIhc1QRgwWnqFTrNClD/WVs9AN63AUQ/okw4kc=;
        b=ZJd98wSaGXr9l8ELnHJl2uBnBZL0JeQUFeKdxfiCs+ZIHJvC8bCUEYjwMkkFisOG5Y
         qIOqncdGdBa9hJ3BWPwZose6mKBoERQDyllJsSHPCFhE+G27IsKmTh+oUO/vIU73paKm
         9XtZTB+8pU6aTAK7NDCGKP0d1svcVWJHAe3GcZOAOwjj1RR3KyNuC3dWTC746V5em3Pd
         1HCBBFBrsbjz1dqJFpUkSry1nI+oxF/PSBT+BQjry+BYylNhFHzS3J714O0qAPKkfakY
         AVlsCpQMzqt8mBwm7itxT7+fgg1bHssnEEjbRWArbfiW6W4D7ikc+TFVDmsgn2OcT+8j
         j9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547990; x=1789152790;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN+PUjIhc1QRgwWnqFTrNClD/WVs9AN63AUQ/okw4kc=;
        b=tD3nIQ1Ovo2gCivAprhXHB1H/4jZI5Ll4lqkMnhh+Y4O9oaUWQUrzA3EsI0CMvxQb1
         N5ts1OblETzs8TKyMqiB6TZrlLuigWkfJGYMyRzkfPA8p7kq+2GMRYF1qy1G1bp4mstI
         6cjMDAa0jpzeGnRuUVVFFaHILKW0S0rUk8CV+uF+eLHncout9m5oWj2bIL6TOsfKKYYp
         mQUUrQANHLj8l8xNNAVf/iM2Ij7w9calmE8YOYakQn/pqqOOoP9kD/FoFzm9wBv7ihJH
         Ns0m3W6OgQGn5r3PJMDE7vtFJAdX1TcOy2LfTwJt5cFIVzyeXzScyhaBtPlEzWui5B3Z
         NggA==
X-Gm-Message-State: AFuF++l4ZCr8cfrpTcKn1rLm0ktgjdt7pDlS2ugVfAo4AIEhvB0MusUF
	pw3O9RGGornEa9S9iRmYpKCMKxk1UvZ5/iDISxuVUg3PceUr44lt41y5yiC0
X-Gm-Gg: AYBFou1si34hbjGtZcmHro5jsZyOc+Pihc8toJ64tQZ50rwQQ6DZFATnux9DPWD2/Qh
	l2pbE420nzhaeKMw7uWfsG951gygbPaxfW6uTfrX7uoCTHcU3NJVqBiohkRhNJTe6Gk743DCTjD
	dGFGvW7/fNxx8ACnux+7l2WoHMLN1tq9porVb6FQzpKc2AvO5XTHANBc9TVjp2YUcvCLtG+wWLf
	yaJfTmJ9r00EifGN857XrP07DeStAwc3aS1XoUyNhOYJHgGp+4gzH+7hPjpowMN4KDbJqm9BtLy
	RVxk+RvOLuh3VpoPmUajun5AjpTpDk0NH1Pc4rseqdhUVzGP0JiOy1K0ORk2DlEdTS1s0PDtBUJ
	CcTu71kmKOW0ILaFFvF6o6V9Zbb8hQzIBa5blr8PCgELUp8ojNIpPXSmxfkeJvxykAmBM/k6qiM
	tbcmjftauTiSTuwzhLYrsYwHERD61XsLZnoHjT1aetTKOAvFnmzZ7o4OAlAnUTI1ED0iV/Jzk9s
	h1MuI3uUMZN8639BUW72sQQ4hlw+FkqnyBRQZp8fylZJO1TZAt1rzZ5VMijPF2QOY5ZqVDSZGTi
	iiLG
X-Received: by 2002:a05:600c:5397:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49cf82cba17mr68895295e9.4.1788547990271;
        Fri, 04 Sep 2026 11:53:10 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm58607715e9.3.2026.09.04.11.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:53:09 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] wifi: ath9k_htc: report a failed multi-read as all ones
Date: Fri,  4 Sep 2026 21:52:49 +0300
Message-ID: <20260904185253.809209-2-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
References: <20260904185253.809209-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the WMI command fails or times out, ath9k_multi_regread() logs
the failure and still copies its result buffer to the caller, so the
caller receives uninitialised stack data for every register it asked
for. ath9k_hw_update_mibstats(), ath9k_hw_usb_gen_fill_eeprom() and
ath9k_hw_read_array() all read through this path. ath9k_regread()
reports the same failure as -1.

Fill the caller's buffer with all ones instead, so a failed multi-read
looks like a failed single read. ath9k_hw_first_txpending(), added
later in this series, relies on this: a timed-out tx queue status read
must count as frames pending.

Fixes: 09a525d33870 ("ath9k_htc: Add multiple register read API")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 6de78ae85726..f5844e9bdd2d 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -273,6 +273,9 @@ static void ath9k_multi_regread(void *hw_priv, u32 *addr,
 	if (unlikely(ret)) {
 		ath_dbg(common, WMI,
 			"Multiple REGISTER READ FAILED (count: %d)\n", count);
+		/* Callers expect what a failed single read returns. */
+		memset(val, 0xff, sizeof(*val) * count);
+		return;
 	}
 
 	for (i = 0; i < count; i++) {
-- 
2.55.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59984E236D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449800; cv=none; b=sd0H9AEDde2JCHz+2J9QYVOq0DBeWE1ObF/NSiPNTp6c/IenefczReeW+NDMbqTtgeciB5/NaEGOhP7TotCl7dUlpd17y5IukdRZKydHPYxyLJIiM25BJLWjc1ZMO9fRCcyufq0Na5CtYwj54l/v3jdZ8e67MLHDbD7Zx8zRD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449800; c=relaxed/simple;
	bh=SM0mRtUxaHoxR6ZHIxi0dRk/J3NkAPKmE+EazTtEt88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEPg6NvQUHcEREmdhcfMn2ztFdqwFZskSIwENo4R8XYZuC8AMsyGW633d/agnABF4LuTyKLY+dh0vEpBd4GSGWu5IIj0gqCl36XkD2NdnqjBRF/hWtaqXwO896RLcFmr3hN6ONqjedWTqXqHWhRXnX2vTUryEwEIAlTAL0rCN4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfIYQpDU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfIYQpDU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso26784515e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449797; x=1789054597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcouK0eCsqKz/evCB2s76zDGRnZRiqQtBAWxyElcQTY=;
        b=nfIYQpDUdPN9+QqD5muayaGfO+WUMkhGizlhLwjC6a5jjnHXEW0UlkfVeuuM02YAd/
         SwaG6brUpB3wSi3wcNvJBrzSKsjr6UcAVTs47fpGR2BNS3FEQVR13CQ91TQ2DjI9EMGL
         OowL7GH+8R4QNAMzC5cmbO1RzVht0tSbVfdI17cp8xO08Agm/AUwO7qncyApXtCXUul4
         XF0Hn9Sw5BzTvJ+/PPeZg2azF9LxRlJoQzRozy9IbpZaD42/zcc5VjxcjQd97Yzo2v3U
         GYVLrmCZNQCQZbVpZ/6mn2RSOTkP79rUT6KZB7mff2f22WuasLEAviJqlJKXGlEAjihl
         /r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449797; x=1789054597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcouK0eCsqKz/evCB2s76zDGRnZRiqQtBAWxyElcQTY=;
        b=Ik7/+Zjli1qw0Blt7SIQUhAkiLE9jF618YqQ8ItZ/xk2ctmNaaW84j5gzjP1bVxyID
         53CfnqNzDX9xLT2/6Pan3rE3lQFOPaHmGTaSyRqEUlZfemW6XJ7qcaYmB7vmXPnWifhj
         IiXxNFgYOX12bc8BQ1aF6MKQ0ga2TIZEC3OA1p2PA2pngs+BIBezTAZ4z+m305v6oAta
         72jNUY0RG3a9hHtwo3bjbzT7o7rzpo2HZVn3LSKDnkg8H35ihD6dkNTi5bW4iZmD0dev
         AprWOaL9ql9OO/PSQOE8N+6X+YEDbsUQRDlmT++jY4LWVI9/+GPsyocJslxZCqURBPaH
         FdRQ==
X-Gm-Message-State: AFuF++kUsUMfPNJs/zM4G8toqRA+OVYKP7tkwN2LlgUZcpEwpoDUnkrw
	xLoZREccXRoAsCyPmJsBVR6hrqvxwhnvynv0wnrRkG1bDRxNJV1Hm5w=
X-Gm-Gg: AYBFou3QiSlt3lZbj0k9AaadiWn6726sCUm4XKA+ttVLXZbE6sKnZ7HNZxzgwtAL3/n
	O8WW1j/B2TC8vvb3yMmWw5mvfgE8loS9QLoF/yj9dh9ZzFMkWZscC/Tpv6O+yAMJ9x5Xcw/cenh
	trNoTzYjZkGHORdQF78dergehMJz8EjIEtjHbqPSphOsthebDwojLpy0VNPax3RB2SsD/Isua/U
	FkyYMbfDpRE4Rvb1t7/hmlxChSrD54jYM93yXERHJ/IaClGW8FeFF4IAWHVM9vK02udY7lRZQ5X
	HvA9O3E5uyT1jL/p78KkhdOugiUpMR+5Fl2ofs+c2DcORoCVaY6vsdh3GbsFAZvR3gUxetQaXr2
	nhlxD1V6T5Kce4P50PXIz8WIRIhS8NMNEBJN0f9a5Ax+xkAuTWKmoOiLHXpDrmw1ri11ssbPpVh
	Frz6TBD1hGSb7QX6IhXU3egn+EYOsj7Pjio2+WcfiaLKWrl3NJP+jmOHK8eeVy2NKBqCIl0WC8F
	1EGjq7LkOWGdBPMlWB73zhsfME5k075sm9DTjZizXCw1olnKATDZ8ieO6V972Pj8U7MIah5KaKR
	2UCv
X-Received: by 2002:a05:600c:5306:b0:49c:c9ac:a4f3 with SMTP id 5b1f17b1804b1-49ce5810b6amr270638835e9.1.1788449796652;
        Thu, 03 Sep 2026 08:36:36 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm75568425e9.1.2026.09.03.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:36:35 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] wifi: ath9k_htc: report a failed multi-read as all ones
Date: Thu,  3 Sep 2026 18:36:14 +0300
Message-ID: <20260903153617.990995-3-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
References: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_multi_regread() logs a WMI timeout and then copies its result
buffer out regardless, so the caller receives whatever the stack held for
every register it asked for: the ANI MIB counters grow by random amounts,
an EEPROM block read at probe turns into noise, and ath9k_hw_read_array()
hands back values that never came from the device. ath9k_regread() reports
the same failure as -1. Fill the caller's buffer with all ones instead, so
a failed multi-read looks like a failed single read and a register value
that means "busy" or "pending" is what a timeout produces. The next patch
relies on that for the tx queue status.

Fixes: 09a525d33870 ("ath9k_htc: Add multiple register read API")
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_init.c b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
index 7fdec25c76ef..bfde58c5965b 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_init.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_init.c
@@ -276,6 +276,9 @@ static void ath9k_multi_regread(void *hw_priv, u32 *addr,
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


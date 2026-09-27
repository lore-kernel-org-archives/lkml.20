Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A46381AE7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475425; cv=none; b=VOptswEIXjt62bsg/Nxih9GeiBbPkpTUH2gc4/u/RhZrEiyc9wiNzZTQUSNxGMJ+q3fK9SduBGD6WvfBcIUx7O4dxlF7mLBuVU9hHh6wNr+Bpac9sh3SicsjCV0krx8/mRJ2aDAPI7B3yM2+IrdMEXO7qvGaHAKwUjU5rwgDf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475425; c=relaxed/simple;
	bh=CimnbEdL/fI+14EzbWIUB3wxS6Zq7zdxIR5jRBUDEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWc1gcbaZLkhwrDEomslVfNe5VQy+x+T03PXU1Uos9kchAvptrJJKNI4OFomGKCpBjRJuKvH6J3wgx2ocN/8aNLg1TGHH2Nr5J7TATWRadZ9FaMZ/nU2kOC4LQ1HO/Vs6rXZGDRW3gjcba232KSqGiE7Tl4JBjsBdXlrFaiv+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgcDPnaA; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgcDPnaA"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so874919eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790475422; x=1791080222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/SZOGr7JpcDmeWPHecdCBMiWMxgwXtwWIncAhWIkpk=;
        b=XgcDPnaAMOo1Nirw9wLTovHRyPoiJJYNKaXEM9ecn4+Us/0uLbedYYjNSodSG3Kk9u
         dBuuGi/QB65N2UcAmNLNeBsMAM1iiumYpwdrf45rrG2ddi39lItfA+OvmfVAw2r2v508
         P7L0ZRvviLGHVbUmuoeYbUFSLTkOPyr1dTIfqVJLt+/k9rtLFcJLK/4mk7nE53kknOlH
         8QiQVMkiaVIhSafUUgyIe3MoPGavzegyka462nD8QvGO5wuy5UlyrpOskdOhByDj+hjS
         W83Mdg6xkfk6jDwCsRe+jPXPWMFGWY0ZhUIlY85PoXQbQ1gKRe17+QsaXmZ0zTeVVEat
         tFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790475422; x=1791080222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/SZOGr7JpcDmeWPHecdCBMiWMxgwXtwWIncAhWIkpk=;
        b=zdzi95R+uW+4dBzaVdPujWXciG+o50WLOerMkj9ekrEG5DP8VGnAzutPljtqHvVnnv
         n352dox3zxZzX3xc80wjAe6boYs/ZjAI70wRZFWf5fah44Dcjz4unjhxdp3GvELTe1Lr
         dqLGjQlJNXjs10gnQTGl/Gq8XTJKQrbRGlWphaB9+vFyLTxcjyv/viCVXkSM6y/TNUkq
         +K9N3xHO8IlkIgteqJWnTRRkio1r1tERfoWMj5VW1SRE5Q0tBUOy6MstMxl0zb5nIk4x
         8XESeVsOjjlzy209XoNipLByMzUpgDYpT9Ws7Oat5UY2AnySC2rZ++lqvkWWWXi8N0d9
         2PzA==
X-Forwarded-Encrypted: i=1; AKwUvBwsygkST99Gzjh78bvuuPF2O3ZKGkSRGocuxpYjcS9cFmfz5VoZ/Kihsu3YEpImGrRkhjOBe9kiOgD9MNg=@vger.kernel.org
X-Gm-Message-State: AFuF++kIkXj9fvNaNalk7lzyNA7Rsc7om4pXaT8CrtSB8bYqrbIJy1KT
	O9n05wabCJMmGMD4CHWsy6XpBInMx1cK1NAbC+DKkzhKaIsDQ2ahsbrE
X-Gm-Gg: AYBFou2Hah82DM0zM9KzLZZ2Wtg4gYCyGfHHoG0SkCl+2yiiNqO1pTIJXBgdzApSika
	bP9OocYpr04yyRvFo3ZtSj4nH1PTYIu2nwFQxc1sykgn6wmL870XFUm2Wh0A6E6C2qowRNngLmB
	UGYly5Ku6SNq6PBulUQf0QLYuKRmgQchytT1+HAly8/IxZVQBnl629Jj7+RKaOsdF/kEwdIbhy3
	z19i41Uu9vHMFi2+iL3GzSiZi+A9CZEcYBjjwN8jcJiDZxf8IYP0nDMz9EebVegFiaqOrxitQ5y
	Y4hMTp2MPSNMW3DorGvD38eFsMJWfAHamvprZJ8iDrqZfpMQW/3/93F8NphjUnsB8uTt5Z1DKdX
	2h4ZPe0V1HUiqyogKhHuOJ2wZZevYmNNvwmRSsfRyRDF4K+AjAKr9z/rvkawcenP4zWJEU5wUW7
	OYHlb/c7u2UikE/hbN1fgL7IC7UZQB6djIlM/XOI4i+dH13lIBrEXERYQCS5UfoilNpHoyWyO8F
	oS33qoP51PU9ayQ1Q==
X-Received: by 2002:a05:701b:2406:b0:146:852d:60ac with SMTP id a92af1059eb24-146cdfbd198mr4755230c88.10.1790475422169;
        Sat, 26 Sep 2026 19:17:02 -0700 (PDT)
Received: from Gris-Laptop ([116.169.71.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm15757238c88.4.2026.09.26.19.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:17:01 -0700 (PDT)
From: Gris Ge <cnfourt@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gris Ge <cnfourt@gmail.com>,
	stable@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Skip CAM query when partner has no alt modes
Date: Sun, 27 Sep 2026 10:16:46 +0800
Message-ID: <20260927021649.8967-1-cnfourt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Thunderbolt alternate mode support was added,
`ucsi_altmode_update_active()` is called on every Connector Partner
Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
PPMs even when the partner had no alternate modes registered. Firmware
that does not support the optional alternate mode details answered Not
Supported, which produced a spurious error on every partner change:

```
ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
```

Fixed by skipping the command when there is nothing to update.

Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: Codex:deepseek-v4.1-flash
Signed-off-by: Gris Ge <cnfourt@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..71b28e4df470 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -360,6 +360,15 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	u8 cur;
 	int i;
 
+	/*
+	 * Alternate mode support is optional, and the PPM is not required to
+	 * support GET_CURRENT_CAM when it does not support alternate modes.
+	 * There is also nothing to update when the partner has not registered
+	 * any alternate modes, so don't send the command in that case.
+	 */
+	if (!con->partner_altmode[0])
+		return;
+
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
 	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
-- 
2.55.0


Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8A41F5D8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536435; cv=none; b=X43Em0hmdNko1waHWUdOXbekpMpITgFtylusnR2YxOucn6V7kbxf6bp8oCNtzQchsIVKa9YpkJslpI9+9uTqox7oz6wcYm5txC/M+/GLOtqWkBLodCYY8wIArw6t2Zms0AzU3z0HCpjimyb6P56TNc6nHFPaRPWI/SCsVkI8WUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536435; c=relaxed/simple;
	bh=DFo1lBS1bHNWcZX9CR6dFzei4mPeTy6GN55jMaiGgC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/DXUOKmDaCuK5Mu0m5r8dJy3q39wsFNYfjZNmzOA5S0syodX1RZtFhjwE1qWB0GvVlcTNDREhOt4W1ZJ9R5Xk4Gz+WSI5hcnMpa0HtooyVGAg6mUM4asebcB4yRD5XasOTj6CedTeKjKONnxnRVSXlogEXaKhH2NUe3V0cJIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=YGtF0+kp; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="YGtF0+kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536428; x=1790795628;
	bh=OPbzCjA45cNhLzmZg0NDhQ6zPvS6tyRJiZCA/BV+CTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YGtF0+kpDpxvx8jaUDew01eYREwPvdALDBusPa6w1qmIrATS4zzUIsDAgw6pVoYCG
	 r6C3UmVTFUq/ElkggJs7W2XVmHQcA1yhM1w5+knHDi4P5w3Jo+/3X861c8WfoWVI1Y
	 SLlFrAnwm+7odmo5BDL4e7YDOz+1hXXgA2J4N9RpG1ZWDBG0rzvr6onH+eTbj4uIV5
	 kjZcKZ1fyOhIKYBWK1plMLXYEuLnNbppT1TyLx9s7J+Ocvy3hC4i1taN8toZ+wrvV/
	 mvFrXMIwGMH5am9bOhwv1O8olU0kzTV6rbZV4dDJucNJMn3yI6YwHya8MO/BXxdJfm
	 ynXB8Eu6tBG9w==
X-Pm-Submission-Id: 4htDcq4PZbz2ScPR
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 2/5] hwmon: (aquacomputer_d5next) Expire the initial sensor cache
Date: Sun, 27 Sep 2026 22:13:13 +0300
Message-ID: <20260927191316.4137752-3-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial update timestamp makes the cache expire at the current
jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
expose zero-initialized data or skip the first legacy report request.

Initialize the timestamp one tick earlier so the cache starts expired
for every supported device.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 33d292228..0bd1886ef 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1534,7 +1534,7 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
 
-	priv->updated = jiffies - STATUS_UPDATE_INTERVAL;
+	priv->updated = jiffies - STATUS_UPDATE_INTERVAL - 1;
 
 	ret = hid_parse(hdev);
 	if (ret)

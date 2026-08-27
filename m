Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE4360ECE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830382; cv=none; b=P4sj6Jy8T1Gg2hIxDrrcxYpvWxCz5BeTTG5PHy9lf6ueQMxuusE9GcZ1q2JEvbfj1v4VRezcnNLJIcRyfyH60UJFDwdM/0kXRX67IpK7lB40LQmnGO491JMUAh8Ee4qGBXRuON+/BDJ1f/MPLFV91mlUjk39yUIkEG/v4cw+5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830382; c=relaxed/simple;
	bh=aFboEQUKOgtqGi1HmtTJrsu21tmEZQzBtlGP/6ax/go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOvm3aEVRI1d7D7IzkZjOOGIo7WahV9Lh7BxEISQw86pAMI+EtRyl7hiPty6GNR57Okfvni195bmyMEG+ur3P4ZYyQbDgX6bI8YjGLG+1n+eRf7NeFAujj8hVLxRP3XImoq+dLWXSP9F7xm9JozzrdA+a1gPR+rgx/4eua6UnF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cM3k6Wru; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cM3k6Wru"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1714695b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787830381; x=1788435181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MioZ+DUe3WCboe2Lc9ge7bI5SNhCFb/I3FaxFf1rsxI=;
        b=cM3k6Wru8hniSpOiKRdoIr4HWzj3sDfHE5EfXdVK30fsP7JD+pUUpuX74vNZw+r/kd
         1UPsXhubjMFat2CBmij7d6v8uxGygn+55I9OSlCtZygY0WeYbaTmZGhjhpc7efSpluIz
         qli9O2KDbY1SKLl5BMh28BDBUxulVBhazhPL4FljI2uJUToI4HHq9RfoF66n+JW75ypZ
         PWGcU8zqAeh3licgh9wyFmpJxXFaVaf304nGNyX9gSs676ZANtWbqW6dk4mK/MS1/9KO
         fwycvpbZvCF/w9vcbnwEuOF6HHuQI4dEkYmzZg+wUtCkSU7jRB8ZubpVR0Vj1v3lBjwD
         5hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830381; x=1788435181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MioZ+DUe3WCboe2Lc9ge7bI5SNhCFb/I3FaxFf1rsxI=;
        b=aO4NeGhwNHeHZYu3p7/P3mkOcA0yZv8H/fH4cYos8evMZOVclxHRlNUVOpjds8k5Yq
         CH6Cme4DT2hV6YwyIbmnHp5qwnjlXH78gR+cDiyPmVhot8aKqTA0BeoTLc4y85P07ATx
         HU6jXS2YbotFErwdAjG1wsz5GyJvA6WoZhs9Xr/27cA1cFiCLkdHHgNhsdYkE6Nr+yiM
         XOJ44907AtVS+BKbBZQKuTQjX8WI94/JcWETtIZuvzese8JmKhnmWad0DZMAWg3RlYsJ
         mpSZRW55vehEocoQo7W/EiYrSruodMZArO72Ut5KiGKov7l8KYOEhk2G4wXEiVvJ7EJv
         y5mA==
X-Gm-Message-State: AFuF++k+I5O6TOHDNV/Di2uRRM8Yge3bHU3boJ/zoxeU9EwcZX07IC2z
	CQYBeZDjdVOX8ezpeIHNINITxPjpeLQE1vGa57VEQW7UK+MxY8Pnw7XN
X-Gm-Gg: AR+sD10izNaJ4En+vwUECvF45fz7/wAAAFO2CFMjCRhpVOJ0lIKcwiguiztkXsLw3M1
	etynhRLIVXFGOuovxrgionitWllPzYH8oqsg01f9yoLevDFBwxdKfoqkuk0mmAEpHx+uSJmZuJb
	+t082sE74ztrpOLVythoj+Q7j+VlVzfKsqiOHx8i1nKgEG7+LLqBp37J4JmFAan2O60ltJR0MXh
	gBCMK7qaca1egBAYYq+6nW+LoTXrsCSm2DbPj8e2o9v3kYsl02hPZ4syiMTmVfsLM8PqpMtvnrQ
	Ze9VAeCbmL7N4B/Y3OZFCRy6Wdx5JcSjdgGaD738gjGONSsm3r6mxOQXq+EhhCtRiUy+KwbiwSr
	ZWZvQlxsCn1w5tBbec7Qktj6WvllmYccPlGC1H6/KHlV2xTkKUou+THriamfrLumLLpsqxDn4IM
	lTHFbODbTRrcmyPJB/1YwOd98pQbp8HaehtcqYCNcWzxlhIiB1Ju04ZSLPiozDyA9Y2qruqxNvg
	1Nm1YBMeQ==
X-Received: by 2002:a05:6a00:6ca7:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-8536ee112damr26946481b3a.0.1787830379646;
        Thu, 27 Aug 2026 04:32:59 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cd71e2sm1940207b3a.12.2026.08.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:32:59 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Thu, 27 Aug 2026 11:32:41 +0000
Message-ID: <20260827113241.993923-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Developed and tested on linux-next (next-20260826).  The affected file is
identical in v7.2, so this applies unchanged to mainline.

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3


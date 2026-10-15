Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497C75208A3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068317; cv=none; b=pQpN7chb6CEj6JhevBZtcFGhXpVp3190cdXjF+xgIq498XGDrUKMTOHkuwxS8lRy6hx4ne7kAD5SKU4bFYJ6v9HRZSjzg5BzBPQE7q1s0RPiECHNe/HcDJr14vSCXl3AbK+Z2NFleug/Knt8largeAHgQgNc+10niXMrHPcP8jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068317; c=relaxed/simple;
	bh=j4bWdL2KdzuWTN7mQcdzbBE3anUhrJg5Qh62aTSfhog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JoEmiskYwgTk/K9L8EQSa2KhkOGR4WUXs8m1PW6GTduf9nOlKlYCd60HVBM3qblw8qWSEYMS8aP174TUIQNWSX//e6N/cOuFN+MYJbENM4na1VvMBhm1rV5wH2ju2I8CFWOTsIAEs33WtXHhrZIhWWPaeDsTpZlbDsH2MeRSAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=gkEMpKuu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="gkEMpKuu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c6f764f82so700720f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792068313; x=1792673113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Il+ddCvnfoN5BE2PTqdZxQP835L2JzCkXFfKNhKcR0=;
        b=gkEMpKuuiZju3dY3nJTJkhpwyWzd0DF21vBLece/CRWwY/ho1cjniWk0xPech7HhOv
         qxVoaavz4VhMF2Z4HUncGzoJlE8FfWIh0Nn1/HQnid1xpDEVcRIJWHeYN23bf4BNgevY
         vd22S4b8aQVSGXzX8akUHu+yDokTc5RGRBapK+JXDNly8s/6U7QcxG/W7Mh6Y/Qzw5OP
         2OwkZcI9V8gsCr6cfKPRJS5xCAcv729qwlhL/FOiaijiPqR34YB5UvYAEw7zD9O3saVp
         HADZLtA91EbIAi+vrF/FX4D4DkG5dnYkjwPQ30WcoZgkF5aIHVJm6BlF3RtrP3Sqrjrn
         jb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068313; x=1792673113;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Il+ddCvnfoN5BE2PTqdZxQP835L2JzCkXFfKNhKcR0=;
        b=X1Gyumc3N0KlPAYKSNJcqqRhLc51ZJzJXcErWnDXo11hjFz7biuTomeri0OhN2FtGA
         BcZrTc/HbxswlFvNhQvYOdHjiSug/pWmUk2yBfgtpF4Rt1hULs2qV0RY8eHcP+LCQBD3
         aJddDm7jJIQAaGGfQxNaXBHtl7aBTnXpOgyliS3vOCi1bb2sbM/Qnt/MBk/8yF+kLXei
         GkDSz8sdCyOkxuS4/H1IZxCFENKtz8sWPziFATt4sI7ZLxVxpgIoWHAwgeUicGMtCLUr
         37V5TDhWciVmGrw2qkMr1iltER3Rp52j4gjTPg8efePVr668LT/ED4IaQ47mRqq3aZpS
         OxRA==
X-Forwarded-Encrypted: i=1; AKwUvBymEqp64TRbJWZ0fY0+lWM99ZUjM1dBHpQwHVFNAM01FQDcECtH39qd4QRE3AU9M+q8PTMfllOb/rmS/jY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD5mR4SG1ri/byAf1m8oarYzMZIWf0XJQkZigho1XmtsGWkya/
	L/zrHnkg1zFFXu/bbfVXPgtT8xBuHbXQ/kKmd6MpRkNv9ZPQKNazfdvBC6JBSPDvv0c=
X-Gm-Gg: AYBFou1Ru6a9nGAjTiTOEnVsDRk7MUKnwJDMATQRrefxD+lG05ocKNwzT3utqqiM2Xk
	a8YfGRCjtE9LHWQteDIPzjNm1eX+hlDeLznZzGZgtRO3wh3ucq5Yebo35Fl0I+YQAC80PdXoBVL
	WXc3L4ak9s4yCyAEaVXV7oo3a88xd2HU7IU5H2jf/USqvHAsT6tp+XcJeGRefU2F2EPIraOMvca
	4Z0phqJRhwxWYctcDcCiiTQbMN0cjl7TJ+DA6OLvit/4uxlmJTmL3VeIpJylAfW/WueCI+CpiA4
	1+RHB/c9fuCH2E0YFdEd/G77yJzJHucX8Tq0pyCoFctvXZ0FJi9TD2/WXO0aGfQEFe/YBu/DOvN
	XRgwsW/016Wr5pm/Bf2IwtF773YOiquGQoEnJqqSaDzpMfXTB/JIL1Y149i2dwYC5embwXh57H4
	DFa/i+vT0jteNonCzOXr0ogt4k710DeD5fGbonTHwbB2RstHg73yIU1TRdSq88Q90nhz+kbG5pA
	XG3Lw9HcgA4/p58LBq/BQ+i+zMSl1CLRZ+JSvWrcE+ovYOF7Wd9ykQ=
X-Received: by 2002:a05:6000:41cd:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48df14a92cdmr7027218f8f.48.1792068313379;
        Thu, 15 Oct 2026 05:45:13 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm19586102f8f.26.2026.10.15.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:45:08 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 15 Oct 2026 16:45:03 +0400
Subject: [PATCH] power: supply: bq257xx: Describe the dev field in the
 driver data structure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bq257xx-dev-comment-v1-1-c87ee6a3b251@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTMJLbQ1XoWwsMOoY0LRFkkTw
 t0punyL/zdIHIUTXKsNIq+SZA4Fqq6AnrfwYJSxGHSjrWqUQf/RxuWMI69I8zRxWPDiyGiyru2
 sh1K+I98l/6798Hf6+hfTcq5g3w/p9fQrdwAAAA==
X-Change-ID: 20261015-bq257xx-dev-comment-87c52c67346b
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=alchark@flipper.net;
 h=from:subject:message-id; bh=j4bWdL2KdzuWTN7mQcdzbBE3anUhrJg5Qh62aTSfhog=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRdOHX5enzCpVxpoxlqoj8LFIK3MvYU2b3RbHNf8FPEc
 efc9Sk5HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1hDXDf1eTI48Ujh1TtdnJKW0k+T2Ip+3lD+/JX6tCLfIZdiTUCjH8M/LsecA
 94XzGzPCne7xU4l425k4SN7+2rZRJSe0k370DrAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The commit moving the device initialization to the new .init callback
missed the description of the newly introduced dev field in the driver
data structure - add an entry to the kerneldoc.

No code changes.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610120726.XkN50Smh-lkp@intel.com/
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/supply/bq257xx_charger.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/supply/bq257xx_charger.c b/drivers/power/supply/bq257xx_charger.c
index 2177cee29a4f..569608bc0d6a 100644
--- a/drivers/power/supply/bq257xx_charger.c
+++ b/drivers/power/supply/bq257xx_charger.c
@@ -54,6 +54,7 @@ struct bq257xx_chip_info {
  * @chip: hw specific functions
  * @bq: parent MFD device
  * @charger: power supply device
+ * @dev: charger platform device
  * @online: charger input is present
  * @charging: charger is actively charging the battery
  * @fast_charge: charger is in fast charge mode

---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261015-bq257xx-dev-comment-87c52c67346b

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


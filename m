Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12DF3F1047
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812334; cv=none; b=c7xnCkH+EBXNpAkaiO1wV88M5JKeJun+2OhpT2uGkLuqLPdHNBHpOOBta+cf/dm8dxepFQfDUklP+bphe5I9Bhiio6MFq/bwUlywHT85QgPiCcxvwEaeyv/bc/DMIMHd+sFs6dXWghd0M2XVYMmHbQsZibYW0ooF1HqwxIAeAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812334; c=relaxed/simple;
	bh=zOrIFFEGsZzAAJ2Vd2UyAityrjBTuPpf+1ezOhERrwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3xMQj61OcVyUQUkC9DEPcRetpYXZRLe58PS6ZvbiaV8DM3LLK6kT5GaI2ybgmUKkNUMo3t0MbbOhhLnJHdHy8oKueuJqN7eq6rnGOf6eOArDqlfMbxUd2DdvhWBXlLa7cDY5+eUdZS0/01vKQESgilfg29gQtVAAq8cnW8BpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zue37oPi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zue37oPi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1405204a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812332; x=1792417132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgISHN/0heQRsL4/w4LwMrsYPGJ0YsG2R5zhIxIusvg=;
        b=Zue37oPi5/FalqpG9EnCxfKsJ9JW1RXagaQ8eqqd1KHu+BzDvg+WIbBRhC8HHUzOd5
         pIyx7YVd8eQ8q7T2YOnK/gXIMU57ZBuJDUy2b4qqKWq/M6QntS+GJIqdhKf3UGkhAl5W
         swo18KumRlaBrsLn4CfEbmsolZmVB72mVJ9fDA7Bg7ozgJ1ZT9YMSUFRftOOFFRXEEAE
         5kvyR19rgj5y3s+2aA7YnEDc2+HhzsX4e9/iZkGWerZna1ScBJHJmrtIP853AyvYbg4H
         HOF6sYqmQRt0d7/i+MlFyjkxTo5cd0mINxxdMztaRBmdJxEdhVw/qCNv8LhSv+JxFTfP
         JW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812332; x=1792417132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgISHN/0heQRsL4/w4LwMrsYPGJ0YsG2R5zhIxIusvg=;
        b=H918olkRMuRoKF6BKT2iA+myISnAoL4rrU3ZOLv1cHLl0LikUMg+CbuTd7jRXW0Wfn
         BhwS0rwlKjXC1qEs9gPYS7aWpILdJDQyjtVMa/xmxNroqD22SlT2YElp0m5A/27YHLBu
         1RsK/I+pVisf6IsbdMwIb1wMZD6nqD9pPFUyILzWN6ZYGem5A2k6Jh3SdMmxIQlTMcYO
         +S4OgVuxNXBn+gkR2p8W9So2XVHtYpZkdNlWfQuR4467w8kt2eSIBaKWw1t3mjVXCkt9
         mhnwnIbVeTAI429ZyezUOB5zE0hTQxiCnCqOX9OfyL/0xvI+OqbfSeHQkyAlVyvRPYz/
         oLTg==
X-Forwarded-Encrypted: i=1; AKwUvBztdlg1NnSSKmgol9gSn+QpksbPjkaV5DbB8h+JPUIMkxUz/onUdB0z+9YZJCICT9AYEPrFs4m0tFgLAm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGiZwKlQpWOzm8XCAYGNThN7/uVeZu4d9xWP+GJi8l2XcrGyDT
	y2vANKaxIF0MXeyKVGqauwWs9APOAJnt17p1JbMlPRGrsuHZa+fNrD/0
X-Gm-Gg: AYBFou2i3We8Yw4XxwZcwxcjpySMhaexU7qJCYKyR246Ezw7pcezOELJW5UhGFZlowI
	QXGcsly0LC+KNEzZ6wDp/OI+sc6n4X/dSsmKSxVbPFwkWyyJpFX/zMm9f7oYt0IiR1/DfTu3Xh9
	osNB6AE23NZoCpt0ftRYz6GtUflqeh+chDLL2h0/6KmQe3J/x7Bl4PkrOtjuJIyi2HHoaw2kgRt
	uq67QP5q1nExrunn8fYr0+4vzQ/kVg8yvKplg9OD8z7LosohuwS/HDZ0PCIiwTthrcbuV3jmJOW
	exVoettBR2DehK65z+tHF782xwbcFyoLlskGxFpacIR412ELBMcSv6j0VkyO94dhgKUlkGZS05C
	qPoKvQiyiERbWCAZZh2yRgB6PrkYDyBwLQpX3u64EMauWw3GFeuNukb/8Ev54IiPtA5C2inrwpB
	YUqItEq8TInw64xXUwzRxaZWOgGnjJU+O8h7D2jHelEvhbpMZCcxynmVUE1K/iogIMqR2vLjk=
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr2088657a91.11.1791812332329;
        Mon, 12 Oct 2026 06:38:52 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:51 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v12 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 12 Oct 2026 21:36:48 +0800
Message-ID: <20261012133648.132363-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index fac1cdbbd778..44b16b7b4034 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.55.0


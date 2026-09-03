Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884823DA7D9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469689; cv=none; b=hM7433aKJHaRcTqX8n5lwpVenDjolMjmMYt2ZN9hOSR2ey6+g3j19v+M+KvALT+Hra2jmMpp6czoyxO/leyPUiheZIi5zeLfR29I1IHLuONtthGE0Q4np4I+pu3WZ2svY5FlrpuW2vI/aJLHhPWIMSy9+uJsZmG489msz3FrUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469689; c=relaxed/simple;
	bh=EkwA7aGDJfEGjmuteNX1FzlNd7OD3Fs0oBxnoz5r7wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HcOrXNt4631WngWXxPCqc4RSDOSJQ/zXj1V5yLHYCS/fmWpuo2M2FAbx9HTqPvOe/RPfSh2UD3R30InoPlzl6o3Knf6HbYsWX8/a4zZ33F+icoUEeBTnQ3rCBjcTP5deeumwDcDEakRqjVKCHNu4vFYUjD61cqpp6geWlGTtJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyRb5afD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyRb5afD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398b3c37877so312085a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788469688; x=1789074488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9qMk88WNjm6tym9wKNjhsNjwQfstK6W3opdEkr+jUE=;
        b=hyRb5afDcndWjRrqjNfYef3ocGoANWp9JC4gtLq0qdTvITjYu+g0G4qgA6LBjXf+vl
         hxVpt7OVCKRTwDVt4UyM41FX7nSOejp859C1YiSdJmo6Q8H2Uu8u7aHkF3+aL9VYybDx
         ymOLzQQBh7LMGLgOvwu2Jngf7PPksVn7c1kae/zp2ZESaGPaai3WRp0wz7ogIsNa0+yq
         BM29J3xiu8twZx+fnzFA2zUL5TgO6XLBq+sVxU/1JpjVLFKn2x3cS1DJJ5i5Xraa5KM9
         gxMsYFyCQ8VSLChrTD85tvWlwV99hLROVG1s/Eo/zR0QF2D3YlxXQmvHjwcCJ4PXjDsc
         mBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469688; x=1789074488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9qMk88WNjm6tym9wKNjhsNjwQfstK6W3opdEkr+jUE=;
        b=SYqzsE6aQSNw+EVsgd3FLYTkfydLmigBXAC/VIK6vqaV3mpuEcS9ea4/qaBqsH3Yox
         GeSgrrlKN3VhRrVcAlFApmaRYZqa3s8myzzS6/U0YUxk9ZwZH2FqZb3UieYZFgQ70CKW
         TAd9ufyZbrarlhhwuebRXjEA3Mcqmyqmjt0Nw0twtsSVd12WiWh2l23Y8SpGdnq0c9LX
         08fLgKzX53nanl+v+2Ib35VdYwHAabBAfNY5QiWte1o+A1FxEJyqGmpS5J7fGCIZ7a7J
         rveYDgbuBhPlowmpTtB+eYnxIAlDqKzrtFOfHfHT7Q0aLWAV3MCKvm4SsSFqC44pHPYY
         R+Cg==
X-Forwarded-Encrypted: i=1; AKwUvBzvZh6iIDMIIwdTGCA5c5Hxk/71rykPAuaKRC+22ky7q8NN4ql680lOnIRWCSmmxxWpsFAyJKfFnsKbc2I=@vger.kernel.org
X-Gm-Message-State: AFuF++kVIgs1XDEMPg/Rs1tqbWzCkjEXzLm7IKJTq/DZaTYdA+cuptWc
	Dwq2HfysTy0k2xRxAoW9WVzyH5b2y+KJMzDWO1zOTlRyJk6FCRvjvI4B
X-Gm-Gg: AYBFou0OxMr7VjniAQxWow8Mh8egtL3AbGi6t2SIEgZ+03dhZwi6GajjhsvUnn5PslC
	U02+O+qsK5M40gkW0DyLXsDDBSTW02vlf6wLFzWlgCxrxJXTytfxFxpNNesQbwljSHChPUNdDA5
	EKFuKy4GvW1PZq02uRzPWsltkEWlxHx0oxGtkgnHaupbuUyGFPHoICZ/yHqMJVHfzxQUR6S9KHj
	j6L9PH6cqvy5BDlw+6tppso/LiYjY4pd36NjG7mUecK2HO+abQMJIhusH/39QzbtOY+Z48VQGtK
	W5W4TSZnDwQe3iQuarZtIwrD9w+qFSbbgZnbsoeTuIRVkHkO0pmyH1WPUFvs6Pt9byiZCEaZ2co
	M63go0mhNRheRY9XOLQp+7oGCz4kmtFvD36CrwvVKJkKArTpD7CdgmQZKRu0LKPKB8N8a6RxSH5
	JzBO1Cww62/Ek/VLAk8C1XUMkRokV7KCUGL5IrevHreRFVcGt4e4hHSyXGk1D/NqQUp6PGx/+9o
	MmUyuw/MJ1llQIAkbZm/AZ7N7iDZ6XDmgs=
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr2193919a91.16.1788469687526;
        Thu, 03 Sep 2026 14:08:07 -0700 (PDT)
Received: from lza-virtual-machine.localdomain ([223.160.226.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm7023324a91.9.2026.09.03.14.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:08:07 -0700 (PDT)
From: Zhian Liang <liangzhan5dev@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhian Liang <liangzhan5dev@gmail.com>
Subject: [PATCH v2] Input: tca8418_keypad -  Add devm cleanup to disable interrupts on unload
Date: Fri,  4 Sep 2026 05:06:39 +0800
Message-Id: <20260903210639.22472-1-liangzhan5dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903192942.21906-1-liangzhan5dev@gmail.com>
References: <20260903192942.21906-1-liangzhan5dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tca8418_configure() enables TCA8418 interrupts by writing the CFG
register.  If input_register_device() fails afterwards, probe returns
an error and devres releases the IRQ handler, but the hardware is
left with interrupts still enabled.

Fix it by registering a devm action that clears the CFG register
 when the device is released, disabling
all interrupts on both probe failure and driver unbind.

Signed-off-by: Zhian Liang <liangzhan5dev@gmail.com>

---
Changes in v2:
- Fixed typo: tca84818_write_byte -> tca8418_write_byte
- Fixed typo: tca8418_diable_hw -> tca8418_disable_hw
---
 drivers/input/keyboard/tca8418_keypad.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 36d4a7c38bb1..413b404a08ba 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -270,6 +270,20 @@ static int tca8418_configure(struct tca8418_keypad *keypad_data,
 	return error;
 }
 
+static void tca8418_disable_hw(void *data)
+{
+	struct tca8418_keypad *keypad_data = data;
+	int error;
+
+	error = tca8418_write_byte(keypad_data, REG_CFG, 0);
+	if (error)
+		dev_warn(&keypad_data->client->dev, "unable to disable interrupts: %d\n", error);
+
+	error = tca8418_write_byte(keypad_data, REG_INT_STAT, 0xff);
+	if (error)
+		dev_warn(&keypad_data->client->dev, "unable to clear interrupt status: %d\n", error);
+}
+
 static int tca8418_keypad_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -356,6 +370,10 @@ static int tca8418_keypad_probe(struct i2c_client *client)
 	if (error < 0)
 		return error;
 
+	error = devm_add_action_or_reset(dev, tca8418_disable_hw, keypad_data);
+	if (error)
+		return error;
+
 	error = input_register_device(input);
 	if (error) {
 		dev_err(dev, "Unable to register input device, error: %d\n",
-- 
2.34.1


Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130253EA66
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806305; cv=none; b=feaO05M/eyZ8A1LK6YOYPgSynHT7oBSJ7KmqxDoULZDhq2ZoOB2CKvWlN0dQigR6+qZ7fnaJHqStRz/5cgu+/adf/ffC7nd99la83v1CCXcILWTKR64CSw5ZwHiPczv/RJtcoDzuMHMVqZKL/5ayLNuihUM8YDgdLW8uNXGnuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806305; c=relaxed/simple;
	bh=A8auyNhtEuZ3z/ymr7Ywj+due7d7kFFg96HOAkuK8BU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I32BJefXV/SlSbWkbqAC6nwYkXIDTFBrN5tHLzYJLOg/LFZnBTzM18uCZBnOCqF14SqJ4W/yG1DcQq3znr2Tdi/v0fjBYiXvAXaJBXWahq153/K5oOSRqbQX/QCghWa0+IGifIM+axKY8QlvB1SJfyMuccGxI0eDrh5Au4R0Q7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElJaZ56j; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElJaZ56j"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so829106f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789806302; x=1790411102; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qpDnZPzt3eeYFUUVAX0CfXPjosI2peSH7zQcL7jvG6I=;
        b=ElJaZ56jTE2OKjFFTiL7YOYkI3gSwGhhxqAEiKG9kWboffxQLkRvdz2wWrGooyJ3g0
         5CCr3tVPLvjagsKz71uLVaoB/z5E4Ym84mzQ1Goz2A5YQ7dF+YeJmzsHXDoFUTmeRLxk
         3/0IYpUgTWhWvPSgUaeOTBIbpy+BYuE2qjtNxFGAobJvlrmXe6SG7BmiyPFCHc0cC9YX
         N3lMk8WVwuVywvEtwVIFerzxilVD8lG5QM8HWOnck5tbaOdHsNgBxqRFhlXdxqoBYxsy
         D2XnTAPyOD8W+rmoFjBnaA8KL0aOMVFgx+i2FHZWi8SAKZvkPDNBD1xuFLSUZjr+6+5K
         4VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789806302; x=1790411102;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qpDnZPzt3eeYFUUVAX0CfXPjosI2peSH7zQcL7jvG6I=;
        b=ff5pUpmfuscMqSvXRkLKMAaeaPhGN0oLfKURwU5hxSLgwcG+01ssvCQjmCn1jgHk2O
         qGGfceC5bm1uqqOVHoLXmnxT4rpofqvIiZ6U3/fxd1FzxVaWcsyU0JXWbOZNpkS8AxSV
         bmYjVE2GsQGoYltNAQ9WlWSbymR8Fkj0J/R51qT6mlYV4Xoyt54w76aCJsZqGFxeum9Q
         hYEcD6CF8ksDJVPn5e7dZ31V5PJP8lu0g3N7ifzeH90fglzUI+FxVrbJzwHZahg4s2Eh
         KXTR13SwqqNS/XXIYd0SRNybZVQF4zjvxJZYvzLwqNUites3vBayVWrfZrt4I74NorNr
         siQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUZLMi8qTF731FpURIxjUk1o867hrnWNf+GTUDRqN6fN+U2+rsaqWI/uDFN1t5XiwotKTfQrRqfl58/mw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFD1Q6J2EsTiElvGnwnCML/4uAiEFeS1F3BdERGZU/0jx8C0bR
	g9npFl/qKPPHgEEl+HwQuWrROjxuz7xRKztn1zlaz61e8M2oeIy8rMyEv291Sg==
X-Gm-Gg: AYBFou3Th5FtMg+xCC3vKLqrGIGItoGNA8YUFGZD03MzBcUBuGKPeDQtCrCNrK1VcCR
	mqr3iUEUVPNsJiKdq9abAQ8XhZoE3yH5M+j3UebGK29y27ZB4tXFn0aJwwb1Bz5ECX05R2HyaTI
	k+tiEaWVrPTrkU7+BBSQmqNEsh+DNrgc0kWunyoayVvFAuAxd8KjGVoTmiN3bZr8MYD1FekHomZ
	QaGoKDMvQy9LbMSpZpRdK9hTo0P+HLtuSq+HizfBnoJLZaK7zPnjxdh7Yw6wwI3TN0c7I1hRuu8
	A3o+PSd1kdJGPRrBwALj08nNE5HAPn7fLkNF+sddbJ0QYXYTawFn4QCgp+FyvJVMCHRJuUacmJP
	k6IrfiigXfHeL19Qg65cUjCvSyn4+DmAjco+Sec+9byqFYL4dqYxrghycrbA1xop2cnsR3L1HEh
	6XK6jfZT7biPbcKSCaBi+XAIUHmXgZM9MC2YS0VdgMOcdABtbI9zlyINEzjKSILayPXfXYzB9kl
	FeR2H0Um3bn0SPwS5iRl4OirsonLb7alfMRKcvDRBRg3AggeVjG7sNNBXowdkk28KWhO462Gggc
	BRy459ov/4QRQiDXrHzNz8j3lLFGyUQclKoqO0O8Ta5giZ6rs6XJL/QAwW1/UFT7pqHTICxhXu4
	0Mq5IE/Jhock9j1WASP7/bZ+E7882RiWB9ZeWbbxMeLjDSA==
X-Received: by 2002:a05:600c:8709:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fc573514bmr121069665e9.12.1789806302202;
        Sat, 19 Sep 2026 01:25:02 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm124608575e9.3.2026.09.19.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:25:01 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 19 Sep 2026 10:24:28 +0200
Subject: [PATCH] PM: runtime: call pm_runtime_dont_use_autosuspend() on
 reinit()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-move-dont-use-autosuspend-v1-1-f6e2d1315c23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgOxBUWvIg7FRs1gK40VQby7x
 fEN/z+gnIQVhuqBxJeoxFDQ1BXMmwsro/hiMGRa6pse93gx+hhOzMro8hk168HBIxmy1razMx1
 B6Y/Ei9z/e5ze9wMZmtPeawAAAA==
X-Change-ID: 20260919-move-dont-use-autosuspend-0203336ca270
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789806301; l=1969;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=A8auyNhtEuZ3z/ymr7Ywj+due7d7kFFg96HOAkuK8BU=;
 b=7Kqg/mFBM8Y3F5ZHoSq29REYCM9b0RIiz5Uue+7gez/oLWEK/pBUXiVEvtaljGJsmanqtLFVE
 HBQn3CT01BvCStZiii4oh0mGMspJqebT/5/T+/RBwhoSnpOE9G4Jl6Y
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Add a pm_runtime_dont_use_autosuspend() call to pm_runtime_reinit() to
ensure autosuspend is disabled on driver teardown.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
If a driver doesn't use devm_* functions for automatic cleanup on
teardown and autosuspend is enabled during probe, it should also be
disabled on teardown in a _remove() function or equivalent. However,
due to bad documentation, driver authors usually omit the
pm_runtime_dont_use_autosuspend() call on teardown.

Reason for investigating: this week, several patches popped up in
the linux-iio mailing list, adding these missing calls to several
IIO drivers. For some reason I ended up writing a cocci script to
find other instances of this and found ~195 offending drivers.

After a discussion with Frank Li on the matter [1] when sending a similar
patch adding these missing calls to the clk subsystem, we arrived to the
idea of actually adding the dont_use_autosuspend() call to
pm_runtime_reinit() and have driver core handle this instead of
submitting 195+ patches to amend the issue.

[1] https://lore.kernel.org/all/aq1N863eJpD_ZrLU@SMW015318/
---
 drivers/base/power/runtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index fab38bc98113..9a37f6162fe0 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1874,6 +1874,9 @@ void pm_runtime_reinit(struct device *dev)
 	if (dev->power.runtime_status == RPM_ACTIVE)
 		pm_runtime_set_suspended(dev);
 
+	if (dev->power.use_autosuspend)
+		pm_runtime_dont_use_autosuspend(dev);
+
 	if (dev->power.irq_safe) {
 		spin_lock_irq(&dev->power.lock);
 		dev->power.irq_safe = 0;

---
base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
change-id: 20260919-move-dont-use-autosuspend-0203336ca270

Best regards,
-- 
Kind regards,
Joshua Crofts


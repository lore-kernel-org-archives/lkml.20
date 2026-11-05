Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864836;
	b=H25/XKlbVh73dFrI8DReJoi6yIpsfQmkrH8SvHScVF/SXNxyVGkfyFZhzVqf0EzrAMwD
	 IAb6ahQi7LI5qYUuo8K0sFtwrZcnzf592YJb9X2s51mfynurLsDfznPq1sj6fuV8i1e6E
	 GRRAqvRlpGxcVaQSl9F1a3HgekqjvBSNTA9QY+kPZikVfmw4qsjs5obRM3U65qyX0mdSy
	 jA0Mpl1F/J3ujbx00Pc3KvqiUCGU7ETE46so4soLRDDZlQ7+tTJtnql1hVKKHIZJ6XRbw
	 X+HB72/kL55LkNkiWGH87UVRIlLRxVRPUzmisl3h8oUW6aLeGWaKcSpOe0hHmhmeyNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
	b=uvGcaSgJrqe+J9jysw4Hgjd4qCmfSffqTwxH5aXcU4Y4Z5DhXiBqMBsHw35ucmMz+9kZ
	 5kCFM2t4aLvECTboSI/w6LAkBqk/uMJopJkBr6bElU3HIzoEkVoYG8WO1NveJz4xnNRX/
	 PHoVQnKTPpRu7oerGhqb9Y0NCLNc8loxDA5o2Jr+dksfaNlUJ2ZcVRJj4qdq4dtHijTLK
	 /qCKyXoH49yOrjBar2WujBp7ZXuHs73T3SXxL7rHMc68BRmTByYqeAxpfehLuYMsl8nRu
	 VlUkfVjXTxbc9yl2NsOKna7Rr5yRgaPXBE7iuHnN/QCmqXimqoF9UIz8aPBQRoZh6Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WReuqVC0;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48C606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C48C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WReuqVC0
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b1a705b88aso683878b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793864836; x=1794469636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
        b=WReuqVC0z/1gy24QpBCOxOFMm7Suoz7RwtJds7iPl7fipq4Tr1/4pETx0/qc6Uy3u2
         mZ4bi3datcMZg+VwomEAedEIGqPeGfPE6Ad6eup5wFcRy00wW8FVXotoOlCC46t0Kt6E
         OcoLSKm4OUdZ3/J8sFEhEF6p7D6Ni/W2X5Z1z+93TKp3Y31m9Xxx67g1OoHJTjzcLgXn
         txQ8p5ONKybl7Qlg5WmedwJV0PXd+1yahy2PWO2oT/rCmKE9KHztiRyAtSxGjCU3kJrC
         IoZLsHqkmrrFre+OBpGW7QBU+vlJmuvScDLdKR+Khqo09jsghejNKj8/9JcRjP79YpC8
         obRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864836; x=1794469636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+ptvV24y3XbQc74dkMGtzcsL/R+SrDapCbwiLFbiJs=;
        b=u8EgGV/jhpEDZzhU/wt2qxSJQBZLMaz+EE1W9Fp/eEFXaRfp8XMGTURzmxPkoGJAHW
         fIesFlNx8HnG1sN0n/wK9sgRiVFr5Cg6pKo2Ze9puAiqi5FBkIzOAqhNnnuHaccsHNpk
         eLHTDfzqT0OoPpK5L95fO9wkqSu4GAgKgTqKrPE1FVHosJB/a3sK02SJI6WkVakVNAuj
         OslIuFBo+nEveSNEgrUcZ0amZxuUxlLoL6lMWM1oPe9cDbzzLn5YRE7n4ublHtvqjZJh
         uwhptU7QRv2Sw7A+RSz9jE+5pDjwfZF1il/uqe8gDLbS4gLPUs68/R/nFd1YCZ9r9swp
         Q2Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxI7CG++jKihFYy8q8trCHCxno8ckW6d0ag29DqrEm+YK5v3S2BlDo4hR9rSc4Iv0jVImhDdlKGMy68v58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FEC2DQmSicVk0bEGBGl4r40b8Y9zAf72sMyCQKdhQkq9HHWq2
	/x/BPbafa3T4c0bdin1f//oMEbxV/orjxkzA0+gx6fLEvVUKW4AT3o4SWOwY7tM=
X-Gm-Gg: AYBFou3kRgxYaoEgvHGDd4qvf+PIlMrSNzU3j/A4S6Yir9dxOksb5oSjbptkdee/6HG
	o/mmOgh+mDD58nI7nX4U+p7Aw9b3w7orVaS0aIUI0UBkNN6et5ng0XrJNXblOfekYjNA3v+uY2N
	oAS81+ZP4PqZDxfjKNrvGjbK6cdUaZiveo15pBYLZjD6vQ6fVAtBeAD6Ial5K1o5QqYxuDhRTZX
	VDzJfJOUC85xEPzyB2cArbdfOzAEvMOyNYK4rgyf3beqDqMCw1d7J8JBEGjGurFIyeAzMVqUd+6
	j4TphuscYvkZFaO5zFZO7TBUYGOYMTQZVrrGBoUYgu1ugK4O21QIlYAtiaBfZih27CimaBOFO4R
	RLEI66WPVnJblAZJ2sQoWdsLm6CkKLXQtyw2dybLZ7KRWabRHG5AzGKyFyizZGmNvj1kmxhISNc
	vPRm91227hmmBoummk54C8qMSUxECMrWL4S8KsluyqVtXUy/1gky/PG1tyv6WMIFdNiPuxJa11y
	jhjrbk80HIdBeDhPHs289ThYIEd/TdbWKGYc1uRCiQCbo5+b4UwL3HtRsXqnQ7+KwHXw5Iu+1N9
	BWFvRBT8wg+SUsbY3Ug8qV7J9YXbZ5qy1O+iS4aYembinBk6iHJ8v+iAFZSu/shkFg8XGRBJeA=
	=
X-Received: by 2002:a05:6a00:189e:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a9bf3393e9mr16363711b3a.39.1793864835640;
        Wed, 04 Nov 2026 23:47:15 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918d8sm1684628b3a.22.2026.11.04.23.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:47:15 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: chrome-platform@lists.linux.dev
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nick Crews <ncrews@chromium.org>
Subject: [PATCH v2] platform/chrome: wilco_ec: Fix device reference leak on open failure
Date: Thu,  5 Nov 2026 15:47:09 +0800
Message-ID: <20261105074709.55016-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
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

telem_open() takes a reference to dev_data->dev before allocating
the session. If that allocation fails, it returns -ENOMEM without
dropping the reference. Since release is not called after a failed
open, the device data remains pinned after removal.

Take the device reference only after the session allocation succeeds,
so that a failed open does not leave an unbalanced reference. The
successful open path remains balanced by telem_release().

Fixes: 1210d1e6bad1 ("platform/chrome: wilco_ec: Add telemetry char device interface")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Move get_device() after successful session allocation instead of
  adding put_device() to the allocation failure path, as suggested
  by Tzung-Bi Shih.
- Drop the obsolete Assisted-by trailer and retain the AI disclosure
  below.

v1 Message-ID: <rc-review-20261103-vc-85-d1e3d35e7c31@gmail.com>
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: baseline and v2 arm64 target objects, GCC 14.2.0, W=1.
CONFIG_COMPILE_TEST=y, CONFIG_OF_DYNAMIC=y, CONFIG_WILCO_EC_TELEMETRY=m.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) helped make the patch.

 drivers/platform/chrome/wilco_ec/telemetry.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index 45be318b05f6..b91cb62c4192 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -245,13 +245,13 @@
 	if (atomic_cmpxchg(&dev_data->available, 1, 0) == 0)
 		return -EBUSY;
 
-	get_device(&dev_data->dev);
-
 	sess_data = kzalloc_obj(*sess_data);
 	if (!sess_data) {
 		atomic_set(&dev_data->available, 1);
 		return -ENOMEM;
 	}
+
+	get_device(&dev_data->dev);
 	sess_data->dev_data = dev_data;
 	sess_data->has_msg = false;
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043

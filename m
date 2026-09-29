Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655B5581EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707663; cv=none; b=IwVhua17b7iy4uzE4/Y+AXV2SfAUbqWUGX7yllpEhPhqL6KA4qI0iiJ3CswerhAf51hMk8hbzQUaf1omXnl/xuQjLWnJJzPfL2wm42uIRejBi9e1m23js6ZOJl/biAB42oE3jNsCpUlouOwy6XWlVevZJzmMCg5MoOPfISJp6kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707663; c=relaxed/simple;
	bh=JioQNAbaO2zxScrtYnq2W3JQL6Zeg8GcsqgswEq1TRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbOztArQXMeH2a3QfMV913qJqr6c9E/7CFjkXFTFKoWpdsOzY7Nr3v2xBn3FLdueVzOFejdY2iQc8sCJB7Ru4r84N/eDPFy/4Heqyim6lbkkEwpFNJrDSl2uGLo/4ZuLjTPpYH/8m2G3ZNbdz0Mu1sL6kr2AzJmd0yRRCfaM+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lzYt0s8v; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lzYt0s8v"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-145047ad220so1511025c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790707660; x=1791312460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwRGPSmzjoMGKC7mXVXKyxtr8TeKLQ+FOQu33IyOJr4=;
        b=lzYt0s8v7+TAzg1WonAmU/oCzOu2XGF5mr7sSdW0/2FRF2oO89wkpdro+e4Ao3qJxx
         88dprw106yudQNIIgVY9J3JALVW3Ma/nJdEzeYc+vwhT0N0rIjMFQEShVB0Om40htv/J
         /fHQUqe/QCY2vpenfRyqtB+qQQS4pU9a2UC1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707660; x=1791312460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwRGPSmzjoMGKC7mXVXKyxtr8TeKLQ+FOQu33IyOJr4=;
        b=USjoy0V53fCEcw5ZpZ+HAhjt7f3HbiWDkcIwmfql241GMeuPLHmaqkpbUWsEQSaMHs
         IfTZ3k2QY/HchZMpvtAwiym/46Osz8VKYKlqVdK2iAVtCmaspXsajqf2d2G0t6oXe9kX
         vetzUYagpcCcp6Oefa7gWR24WqBw1j2/DpRg+FgQSUCDUFPiUNlVTe7MR57AN8SiOpOW
         xELgckFtwgeLnKgyMZbXL5LV/5Z6ujur1eBixKvpQlU0aLJpC5Ng4Tr5ETi5ax1j/2hI
         5gTodFaV9ajz63tlP3894H7A4o1io4UngVeGEvr1w0HyqbNvJWLmVIYulX8/yZWw3VFo
         VxhQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8GcPs97k91fKbXP7Jm9/fLQt5FsIxzfHHGZCZd/C4E1GsYpgEHTTMxPUqtzGmRrq7XZxh1uh9aiRn3KY=@vger.kernel.org
X-Gm-Message-State: AFuF++lbBsajdMHTfDuiZFCig94b1e5+/RBJ0chZHv/R1HaKciDTOilU
	2o1+VKDwsHqST4LJxNweJNBtLNmhcp0S77KUAQUlnlnqfqOyS2Oyg7rVSEydWqzFpQ==
X-Gm-Gg: AYBFou0rbOXKodm8qVDKwA8Cw0WRfEgEaCLB7Dw5YZxfSO14o5LRIqINnbx3muDJJ0I
	w6C72P/zjXMp3UP4eg0coJyhBn3Y+Bn8Cc9l6x5BmDRfbljCvWuodZ1TVyYov6jN4SkyyZdgNoj
	UQo8aYMAxqy/bqx+2SEFGEgryLDVDog9Fr/ySHK7R6lteDl3ho63kpuXTH4TF0zkxoD8Fir9HvA
	yC6F4nvx6FCKII4JyfHcY7dBwqT+zS5hA1V6A4G2YdoalkM+fib/QyWTMO6Ztz3ZTi/EuyoQhwF
	ZOdkEJzK9C/n5HcUU2kV+54Cf9eaTWq037lsNGTR+7IOkzvGAd8BXiT0+KwBs3Fy3ql36z1b0+7
	xX6Vj4Q5xswwaIlw1r5wfs6dQCTFrAv+6mzR6aekbBkxgUVvQyCvxUOMtcZU9alXhJxZrQnR3DW
	jsyjEK0eahl17WJ+7U3Ijw+7DupdBuyBiedlj2cKwzbJnBwrknF8S3pyrtN03nTr3GEP1TVfPPz
	AraaLWJcOIq8xGm3/EZWWHyXJmLXBMkw+g9
X-Received: by 2002:a05:701b:4513:20b0:143:57c1:6242 with SMTP id a92af1059eb24-14c9ef3250dmr56017c88.26.1790707660315;
        Tue, 29 Sep 2026 11:47:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14c640bc413sm946319c88.11.2026.09.29.11.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 11:47:39 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/5] PM: runtime: Autosuspend race condition fixes + tests
Date: Tue, 29 Sep 2026 11:47:10 -0700
Message-ID: <20260929184729.2346769-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes a few semi-related bugfixes for race conditions
around autosuspend and asynchronous suspend, as well as KUnit tests.
They don't all have to go together, but because their tests are added to
the same file, it helps to group them to avoid conflicts.

- Brian


Brian Norris (5):
  PM: runtime: Cancel pending only during non-transient suspend failure
  PM: runtime: Avoid racy clock checks for autosuspend-retry
  PM: runtime: Add test for autosuspend-rearm
  PM: runtime: Synchronous suspend when updating autosuspend
  PM: runtime: Add test for pending-autosuspend + teardown

 drivers/base/power/runtime-test.c | 97 +++++++++++++++++++++++++++++++
 drivers/base/power/runtime.c      | 52 +++++++++++------
 include/linux/pm_runtime.h        |  7 ++-
 3 files changed, 138 insertions(+), 18 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


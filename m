Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2758FD0F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892482; cv=none; b=LAi1oi86ic3gcklutlSZQ4y1nNX9rDTuRdk8gonSBZ/T8llGJXGo5TCOqQEMFwh2Cg0W8p0RxokR1jTXLYQaoPDF/iz6/II5AydV7JQGQfolMZlt3cXccQXX3iKtbZFPIzbZ4E1bFRZzzYB0nUrfatpv897v3rofs7qhLb3o5u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892482; c=relaxed/simple;
	bh=/VPU7Rkj6vLIJ5qAiVTp1qZlJHmo5K0QLBH58A5WbIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FB1RRZTa2hbu83g5yx+D6il2GQ/X3UjpmaX6qi9Q5tRynov/lA/8YTVJeNr3ERYTHQUPcBF6WQUVXnaMLvhmkSFXp+RBpIqg1Ku+caGma8MFvD5BhvfkNlaG4tPdYg7Li7CVrx4XDRPAO2yBLjGepP5Ar+G9XtdlhnZwuHTXss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYVH/3qk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYVH/3qk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so39838845e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892475; x=1789497275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=TYVH/3qkwIztXGtxFQic+aUi0zbl0oDWS10elWAOT4iPLBHc0WAEOHEqDv3QRWNm/8
         qNOkMUGt6ST2TLFcE4T2scErdY/PBLW3E2CKv5tor7IfEWHBomczvJdmRVmP9G37u57j
         Unr/+/XYm/fQnXf936arXjtd3x8dhRloeN+OLfbOpyB/Q4H6GlZxsgu58sBNo78KJbDc
         DQdGY0xQNqtVjCINvvgPOrX6UROZXcDOLyWByIHMLlm+m+12C7aIFsVFmDam4xGh8zNl
         8YoRZ6PrAd5j46lys1QLWPKEbPZ9YEQsaXo/sewZLdeNNXsw1T9/eA7suP0jo23IKyHq
         kt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892475; x=1789497275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=VZ9U+qb9MY/vQwj24ongqGKpen4KaXRczDIn7ak332doywThSzdkAoi4dQFH1C54hP
         W4npL7XvxXiu0MWmLA3/6+jI+f/aZX6EyXsqGOYTxkb7oPb8zHpXDv2hDI7YwPuZ8Ku+
         DoeAXdsh1Vcpu8+HZ9cPmuBJyOgZKPd28c17/og9lqR51xumQZY8qKizDayTNE8549+H
         4L7ec/LiXQ27F57pNzKOE1JhW0MjQ3/+Z1pWwoK9PpH4R987SCA8v4ygKGQBYuNLVNm7
         3hnFnZvyX4Vhff+26/Q2DpbjV/1YJd/zwRZXzuLkScUfnAHJI/6ndJuN8XxSQBzuEHxU
         Ni+g==
X-Gm-Message-State: AFuF++mKZcHZM3elqsZivK+ct+nJSnT2CQrOvbP3pi0qGRxyfrTY3nZw
	V5gempMavabAdE2mxZwHDc1DMcwqWZAOBrct0WjslT8zC3Vcvqwumr8/
X-Gm-Gg: AYBFou0weCcr9R5ehB63H9zZKEhbxeOdABwsWprscOXilosimRVR8mS3mGVSnpfOWxg
	IIFipyfFYGTv/6qJLdtukAgtdDEkJAIQhUk7uR/x+uwH2HtcoWY6pJxg4xoKvtKcUOGyp7vekCi
	Jkk4CHft/3RltAMT5NCRWchJ9MIn4WKnzw0mBfLyN9p57frAQRQPLcyG5cMTWDHoQyO8Df39r18
	rlSONZqpDwOjG/OUyhDlFH3KyKb8CsGao+cTZd0CBLHqM1niDqfYclPImrys1u69gthqPcnAkIM
	96vs4CGSZFv/5wf9GphmFKZznS8CBk0jES0qFVP3zvrV3l6tHu93Xbse4xc1jGkoveY+fw+kit6
	O4w9Ea0V9sWX5cqIH2oTKhotY+kPUklNEnGJ78aQHarTztXN/rzUWBXbpyvxD6Qaf0zZQvDiJd8
	gC0U0jx2qxKFkQt3qyPBDglaspLlxhG8b+oH5IEdUZ+/6lLfG4M3gzJaXUhFLlU9G+w20=
X-Received: by 2002:a05:600c:1549:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49cf81f47e6mr325532285e9.6.1788892474368;
        Tue, 08 Sep 2026 11:34:34 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:33 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: update TODO list for completed cleanups
Date: Tue,  8 Sep 2026 21:34:27 +0300
Message-ID: <20260908183430.3256-1-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 34c216e6d..8de062b47 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,7 +1,10 @@
 TODO:
-- find and remove any code for other chips that is left over
-- convert any remaining unusual variable types
-- checkpatch.pl fixes - most of the remaining ones are lines too long. Many
-  of them will require refactoring
-- merge Realtek's bugfixes and new features into the driver
-- switch to use MAC80211
+- Partial: remove remaining code for other chips that is left over. Unused
+  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
+  removed, but more legacy code remains.
+- Partial: convert unusual variable types. The channel control APIs and rate
+  helpers now use kernel fixed-width types, but more legacy types remain.
+- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
+  have been wrapped, but many warnings remain and will require refactoring.
+- Merge Realtek's bugfixes and new features into the driver.
+- Switch to use MAC80211.
-- 
2.55.0


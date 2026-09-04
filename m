Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90856493644
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519739; cv=none; b=vA168c8r9FduJh81m8MG6B3EfCX3K4bx+229wv/aC3lmOvA0mMpfEzkkXCq8fDcUhsc2pTD8MjKYhNU/z2bEIRvQcgFHrpoN5QnEHjlyxeBG9UXfSK8vUryW3h5Fo++hPcYjyTqpxERnDKlev+GSP5cdJt4F+2BPDacwRgvqKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519739; c=relaxed/simple;
	bh=07+rRTXiTjhiXbi72kUeeMfUe9Z/3adRk3fPqN7NDGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiSgEa8CociP7LVmkkGokXMTSMl5AlecMWUxWt0PMeEWOiI6ZZL5Lrtc3E/HREH5x3EmYjWWfdmtvSQYP9JriwOhiAX6fiPPYtR+BqDzPQbLeJZPe05BfH71a5ZEG2hCBBkfuEip0o2ZhXgNG90D+o+kfvQu6dGoPRmJMjRaTII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ4kOxZ0; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ4kOxZ0"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-855c26cf490so7299087b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519736; x=1789124536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQLkEfjESf7gemBMJ4GXvain7prbX4HFssUR+m9rITM=;
        b=bZ4kOxZ0W2wK0HNNTNS048cffIA41yJX+HPmoHX/s/Swr+vdB2Dmt/+Vw7s2pA438I
         moS4/k4Kkx4hmzgseQVDTG5xkamwRu+/uu5B1jUZ8DTHuBRoGsuQtTqf3EuEyrD5WW5+
         GeY0aY7VNH7ry592zcXfunnlzBAVy/Ua9x63JvZS2Xua6/rr/OBYCpb/7BRE7Iu4PamH
         Mxnl3e8cPbD2aUdscI4b01+KwTcGIRQrdTJq5NcuGPt9pPqfl/UUMveNv63qiCtuiM7o
         +WNICx31qsfcp2goeG3DzZa+bOyjP2OBR1uOKjgCCdibF57GfBF1MyFadfRFlm586sXr
         DzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519736; x=1789124536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQLkEfjESf7gemBMJ4GXvain7prbX4HFssUR+m9rITM=;
        b=FJkvHGLu5SCv3CoCzOjhBjUVt7agOSZxlSdirsA2JUuYdiGcw/0TR3n9FwkgV+Ot1K
         VuKtWe5F6K1BQtiOvizVx3fx8z7XwS0nIXCqM6BQUruWD0jsNJDiWsGvQW/BXOBdZhAg
         0ON982HCtgfHh+9Qh63+Fbx+6+9qRdm+pi9HEZudk42ojvcxBtGXyTjaExoR8SWYTguq
         PWiaRuhg0uQNoydgOu03MWkB+lqQk/O47JPJCfS1Drf59mu+HsHWwAwFy34ks7daau3e
         x+N4eHSpodwa6mEb1Y015fzcegs1UozEScmG+jkAYVf90PnJpCqo6ikseDMlI9MRoPET
         JzTQ==
X-Gm-Message-State: AFuF++mw9qa1p5Ey9zvjsMEJZh4QVMXHLngEwUjdR5lVLMj68CVzNQmx
	gs3dDLZ06wS8yxA28wEdNIKWiX/uJMsIWDvXsWxRKmv/Ytp5oHWMXsxn
X-Gm-Gg: AYBFou0bAwE56PUvc2SWrD3f9isnLhy041ejHLJ18T6r1q6V0SdXPR/Le9ZXQSNriZ5
	ExqdTb5TUtUBg8PsUj9EXI6fFFEOKJchhLEh7mlKqeyuRCktDTbNCfJH9DNg8AqgL19GOA87VBI
	D+8eLubh0C7RIr9rh1siN9dL0rCGKMTrVh83MfV3PdnTBNO392USiefLRgIwqn+pey0GBSY6hq3
	JiCxMkdUImfIOQpoQqYJh/Vvm9GnHCJRscm9Aq/7/22nfScoj8VOAKhojzuYfvo9ZMsh9Q1HTmh
	n9hzs2kJwprl1ColgNeMiv9rW0GlMiYt/tAbGuQtBkL7MfHovSco4II2Yw4HWsBVADUCH8Vgm4k
	FyWBg0Hc/+eTLAF2f0zh03ZaWiUQk8xdgu+nKq89ZcPNpwWH+X554UfzoWyhb5pYHBLGzuQc5LP
	IzWM602CJXn9h20HJvB394jfW0YidGFcuCQgEpAurGGfvWk/tNYK1jlPKiluxJEE9wOyq8vGpT3
	ewjQanezOoR+lyLYY84iYjdgA==
X-Received: by 2002:a05:690e:128a:b0:66f:b413:8b7c with SMTP id 956f58d0204a3-66fb5ad7109mr1840078d50.43.1788519736455;
        Fri, 04 Sep 2026 04:02:16 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5454090eec.28.2026.09.04.04.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:02:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] regulator: fix repeated word in log message
Date: Fri,  4 Sep 2026 16:32:01 +0530
Message-ID: <20260904110203.10113-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110203.10113-1-hemanth.selam@gmail.com>
References: <20260904110203.10113-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/regulator/tps6105x-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/tps6105x-regulator.c b/drivers/regulator/tps6105x-regulator.c
index a09c6ae6a0ce..7f99f3e90bec 100644
--- a/drivers/regulator/tps6105x-regulator.c
+++ b/drivers/regulator/tps6105x-regulator.c
@@ -65,7 +65,7 @@ static int tps6105x_regulator_probe(struct platform_device *pdev)
 	/* This instance is not set for regulator mode so bail out */
 	if (pdata->mode != TPS6105X_MODE_VOLTAGE) {
 		dev_info(&pdev->dev,
-			"chip not in voltage mode mode, exit probe\n");
+			"chip not in voltage mode, exit probe\n");
 		return 0;
 	}
 
-- 
2.48.1


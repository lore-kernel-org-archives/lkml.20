Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB34A2058
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104532; cv=none; b=Cy7utBdmEAn2oNPECABQ+ii+xdPL+fgPdtLwUF7E4UtFwjuO7IMd5lfi4Du6Uvco/d7DzXt1wUp0hpeGmM+BMIYwoBJsh9LMXo+g+Jo30RHjwtatoZBCK/wFkSSdURKUxYGgK7T4TZSfBQHAKxZiU5xCUunV0Ilnm+KqwHgVqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104532; c=relaxed/simple;
	bh=GGGrHfPUNnU7vN3InUKRrHMF5nRSvl60onh/MkaxJiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3wks+7RI05k5otj8vXBcOAbSmMiZrUHzsn5hlgIi8Tj4xfuq15WRVOJ3/DXINxHpTzTgFMD8a44nQDIiU4QtW2sAQLjJnzV4QZPSOKOt0TSf1qnxJGsqqVPSydcoid6WR99ew+eQ4NDMCAdSGSpYjyqsBfEMZJ52OoUplIfcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raZq2TV5; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raZq2TV5"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664ef78fso79662eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790104530; x=1790709330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qphYHRO7sCmm53m8nDFwegl6mi2o4Xt3NOVldHfpRrE=;
        b=raZq2TV5rREXb9pxtJTj407/2OXizaZdAidN1MXQr9JjjmJ2uDiMHC0OLxNw8gom3/
         RBjq2hcSTamUKlvx0IhB7h8bV4E/Ej8DkH2TNzKalSf977SKsnIHtP+A/huTfmisePN6
         eWTszahDhl+L+3tPfqUOCwqjYU9Xa00cGlvdm0p7UsFyRuUNuRUmY4k6Gl8/ZGHQa4RJ
         WnzoFkJYDQOVInnTHVSOMsbi1lDIft9N11PRmXxWhU3DcFyT/ZzWSdwnCo4ukVxMvFQI
         Rmb9VXXoPmOC8XYcBJ9QeWypJMqhvRxI5bVo/RQ4SvLVG/ul1XraHWuncoo/rfBfJHq+
         Y2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104530; x=1790709330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qphYHRO7sCmm53m8nDFwegl6mi2o4Xt3NOVldHfpRrE=;
        b=BWLE+48f8hmD42WVS+T1cRzCtGdRZGxYHmkmp8vjo78wB6cZ3+1ixBp64a4jD5Xy1I
         EF/E0ClMQDZgiQ0vWwC5hzOA9QGtgJQ7eDFcdSIy2rgGZjk4P2F4DX2eqZs8BkeTxmwo
         LnrJ4R2IWJxE/nVxkusDsGvTBYQ78FIy+k05uqw9buYCDvWvzYEtTNyuujjQwddrWGnS
         eYkXSJZLLviSDpzi88RubZ8gj3whKrwrl5wTjX0v1T8It4X3imEMA4UGfXjOlgDlbOOe
         Whm9y4Pr3VVuKiWryPjOW9Cgpg2Qt+NGilVziB/5Q1oyTqERXluV3EcMjL3VlaQKlA6z
         JvDg==
X-Gm-Message-State: AFuF++mdpjkv7VbL3GLYq8DEPaXQuEhAhQBqDt7M3KYhukbgfPn4lUYs
	3kwPNNEmR/TxvKuWjcfepHp1HuEr3BjOiEghGLslSVbsZzhbB7ER51ZV
X-Gm-Gg: AYBFou1qNHMBYgwbk22TP3oX7STK/yIPSeS3akLc18XUpVARqQfFEl7H0gGzsVn4MH5
	oELPGIHpeTXBh/nn8yTmMJZMOma80+31JTyVLFG3DfskUeK/ngcC1sTgsLoySLwQVnSpzwqyWDX
	h/YQDs+nYVxb3J21WaIwpgojn6WhjwE3OSwRgx4XrZIZ8tFTM+4w9/rvuO51gXsEvvJ3SPcTQKY
	AZooaZWnPzTaJvfRKzUJupViTddxEmYcgoIkkFjM3dMptb6RsXc1LuhVq0ZL80I3k7yToxcy7PS
	CMPlbfQ1vlGD5xHZesomMglOmKvbrrdVdlxcBIPvHyqHyleJgUZ+6VTh7sxD4EWhMuVqWXjzSwL
	CVF9YHQtxJ5Zi94j7FJ3LkeZpB+pkyjO+9pQzP6bKyob4hu4HPZAWrc5dY2Qj8WIR2UCFeBvM46
	Mih1LdMbza92lMaUBxRpa4yXhO3iO6XMb4loKlHhn5HQ74wJTboY7KfeGbtVXRJa6KZjNOe3fVK
	uqy9EKyFw==
X-Received: by 2002:a05:7300:c3a4:b0:33b:e264:362a with SMTP id 5a478bee46e88-33e8c24d878mr232313eec.13.1790104529788;
        Tue, 22 Sep 2026 12:15:29 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm310518eec.25.2026.09.22.12.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:15:29 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH 2/2] remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through pm_runtime
Date: Wed, 23 Sep 2026 00:44:53 +0530
Message-ID: <20260922191453.324983-3-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922191453.324983-1-sid9.karanam@gmail.com>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly invoking ti_sci_handle->dev_ops.get_device /
put_device (that is direct firmware logic), it is better to abstract it
through linux/pm_runtime.h's pm_runtime_put/get_sync which will call
the vendor's specific firmware logic automatically. The rationale here
being better code quality and reduced scope for refactoring in case of
any changes to the ti_sci protocol.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 drivers/remoteproc/ti_sci_dev.h | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/ti_sci_dev.h b/drivers/remoteproc/ti_sci_dev.h
index 897998a97d7f..ec17af3ebf5e 100644
--- a/drivers/remoteproc/ti_sci_dev.h
+++ b/drivers/remoteproc/ti_sci_dev.h
@@ -59,23 +59,30 @@ static inline int ti_sci_dev_is_on(struct ti_sci_dev *tsd, bool *r_state,
 	return ret;
 }
 
+/* Request power on to rproc through the TI-SCI PM domain */
 static inline int ti_sci_dev_get_device(struct ti_sci_dev *tsd)
 {
-	int ret;
+	int ret = 0;
+
+	ret = pm_runtime_get_sync(tsd->dev);
+	if (ret < 0) {
+		dev_err(tsd->dev, "pm_runtime_get_sync failed, ret = %d\n", ret);
+		pm_runtime_put_noidle(tsd->dev);
+	}
 
-	ret = tsd->ops->get_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device get failed: %d\n", ret);
 	return ret;
 }
 
+/* Request power off to a rproc through the TI-SCI PM domain */
 static inline int ti_sci_dev_put_device(struct ti_sci_dev *tsd)
 {
-	int ret;
+	int ret = 0;
+
+	ret = pm_runtime_put_sync(tsd->dev);
+
+	if (ret < 0)
+		dev_err(tsd->dev, "pm_runtime_put_sync failed, ret = %d\n", ret);
 
-	ret = tsd->ops->put_device(tsd->sci, tsd->dev_id);
-	if (ret)
-		dev_err(tsd->dev, "ti-sci device put failed: %d\n", ret);
 	return ret;
 }
 
-- 
2.55.0


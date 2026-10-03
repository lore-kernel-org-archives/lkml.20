Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8D3815E6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063924; cv=none; b=khKRfYkVi1UKk1V9IDza73ERXBpSTZCX8VUJfAapGl2FlwDjeCLfa/xv9jL/PRCIaXqaBm09+LEvxL6K7HJBRKu4KhlwfdvkeMPMOSS+Fzf2+GLGnUSQKVPMe+X0HfOgS79Lbxv08AKiydmdHDGxH5UiG+UAZJiaBNhltFLcIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063924; c=relaxed/simple;
	bh=h2y5ekLFmu6lTIqptxUqfe1ov4xut9/IMYr639ap5Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qf1X7/4tVno82SRhVigAXI6G/N49VZe2BVPACQt9AmMAd705b107JRP1wU+N3NBGHWS+DENTFwAFqU7SilAUNQBYJyhRS1R0ufGD+zH1rdc3qSoo8pPyvCeidlYT1fCE+2cR3F08vmyyXqY+Cy1/1A1hU9gTRrb08rCn/EkmZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/waC3bV; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/waC3bV"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bb54bd5076so339257e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791063920; x=1791668720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAmnXAdXxOh3z0LoSvp9bSH7NOEWelIN6hCn50zbh8g=;
        b=P/waC3bVUH73V4RgSrC2x0rrySeFftK2FnBJCtiW1V/jDT2aqTsiNLFhJzQOpRDbCT
         Zd01KHvD/6YJPzb+4+axz7QkFRCLb0I/8xx3/x1HPoUQEgHUhUgHCAc8VF+XVXTPqDD3
         GwBAYoYJwmD7+vX0+OOXTLlAtgeVTo2YmkvDJQluleYAAhpxOtE1FEkmsewBG1hSr0ch
         7x3OAT1bhys/LBJ1JuO4TkFPDpFWNKJoIRC0+83LSQ+t2KQgi57fhJQAtkoEVc/SOnG4
         OXQr1InBba0mM4geZuEGG7QwEB2rGzomq0iNjpit3QN6KHptGbTcy7X0vsnq6aLCqEyO
         /6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063920; x=1791668720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAmnXAdXxOh3z0LoSvp9bSH7NOEWelIN6hCn50zbh8g=;
        b=Ipc54Btqqk0VrCJhTZBqqBJZhMOPUSfd/zGTch8MNmAOOkCiZTv3qDuqzxjRjHjJbq
         56iiU90JHVhXNDwzRdvAqaBL01cOLP4pDYn04oA/9AiGnBartxkEduRowhukhUnuYnLr
         WPwgj7gAWIneyVOLOLuNTJmfl4jISfZGIMNRv9E+7RnV8tIA2oQb2b+G2knLsfwwBd8q
         K4GBsWZhLJ7/9KmN9NX/e310hJlpD87aMRTTfDF0g8m5BvUj83K7AcSiLlx+jL0U9lDl
         IUAcRk3PKdfC0/uEwyhEMpkttByOKWdilh76sICcvhH8DTq4rreW/cKFrQvhJdnKMD/o
         O7Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwWdTiFkPfaMbXgGzKfhFmqPjxH6K/LS4JDBr+SZ5zYhIJ5LvsgDqSy5+RHUAuA16DOWd0Ht18kg8yZB88=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxKgnD/Ul6sVFPOk4kx2tRI4FkC+f+XMweG9uaiLkCOFCqu+jO
	Hq6Hz0IqsDfK0FmMGxG1fR/bTh5Vv7pDllP9n2tKLJtmtV4sMpGla/yA3+XlC5kN
X-Gm-Gg: AYBFou29clavBJj7rJMeSx49rUd3KRBepHOHkVNn7dqzwSk2LvODUfDAMp7a5jA1L5g
	wAJDE4+yhkZDStEuFVpU77XlZ8dAU0+0zQOExNxW16gFO1A4RRXtvJFk0ReZGCKQVrnaOwXwsWY
	8yMXIbLNX3yvy+isqxAqolMV4HZ2CR694MjY+dorfgabY8uqP4/fnL5uuslSvFYitAMKslH5mK3
	HdWs9sO4hl2Lun0cGPAx2GmJuCFTVYL22UrIdShh+Fr5b/Pg84jlr6xX0Jf9+F4ZKvEGsSSJ5Nt
	SCyPfIk/qang5aJqmykeOA2HhNqB9gkT0pwZC6rNIpvOLxOcX8YOdJtErZH/yjRNpcOiZ6wJzIz
	TTh3ZocLgCSfj+3VV9J4ENkwYANxV7td9VPzCBVrKk0+Yt0Y89BAnQVDxi9h/DpSgWL57amWXHp
	S3uALFdbplNNm+JcFCAW9tHE5YaB3bbpTs/2TwGx16ddLFFU7n3uAXF1ik+Qw2NIzRUMlW4KIFS
	sNEOwYW0xnZX/rT4UB7VyKb+/dlEah8IovgywxIgEXw4WXvGE2i3QYcpqUaK7qmWgFbIg==
X-Received: by 2002:ac2:4984:0:b0:5b6:1a7c:1f with SMTP id 2adb3069b0e04-5bb9bb22272mr1993059e87.34.1791063920290;
        Sat, 03 Oct 2026 14:45:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c719110sm1859789e87.2.2026.10.03.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:45:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Sun,  4 Oct 2026 00:45:16 +0300
Message-ID: <20261003214516.128573-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __acquires() and __releases() on adc5_gen3_mutex_lock() and
adc5_gen3_mutex_unlock() name adc, a local declared in the body. With
context analysis enabled for this file, the build fails:

  error: use of undeclared identifier 'adc'

The lock and unlock are split across these two helpers for the ADC_TM
driver, so mark them __context_unsafe() instead.

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Build tested only, no hardware here.

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..6a3cabedf4e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__context_unsafe(/* returns with adc->lock held */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__context_unsafe(/* releases adc->lock */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);

base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a
-- 
2.43.0


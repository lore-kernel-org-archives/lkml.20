Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35477411A16
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376168; cv=none; b=IBKSr/XCG2BtmITC+mj3JNy3E/fpFMDWbAhLV7cyW4lLsvMr32YiT1tRd2orI2jWNod2gig3A+vpeQYtcNYVhLrkDzFacE06Hlh1fwK8r9xVI5HQ2DVa1D1IvfZ/TBuregx8ZxxUYokyoeFxDgDzoj6M304LPDomvOTlm8ngX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376168; c=relaxed/simple;
	bh=udSeO2SM7u5F70GVWuzJCWev3yVYkJLzouX7XDHTfCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=do3ei+It3iuNsJsJHSCqLjpjekGjb6joiNzOC+pRtWrMpIt/ZyuieJO1lJ3c2sphBCBB/PD+wI1SG/zRJ7DtuuCiCbil+geEe6uNveYZDNsdjWNKzuqoSh7pjHVyboU4jheOLDOaDnNRyriX+8Y/MpJmQzkVTvYzosKc+xAPBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2tu1nGV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2tu1nGV"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso15287685ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376159; x=1789980959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQQuZfHbagcPKZy5EeFp3pnDLGdMdLr7Ly2KqLSH5Tw=;
        b=n2tu1nGVIc1kmR8qVoR0DYU1lroB5pk3C8Q2fklzXrfLcdmQBB1j6E5DtahQt5Iceg
         NqqDw/lLiqAqijb7mZJyTivrwuJJPV3OZBCzPrRcH4YIB+qtMeRWziuGudECVs2r/QBq
         hHRu+7xHY+iUqIVrJLoGaCKegD9Kwl8Iolpi0a22YRXjNYuqp4r795joDKyo4DoDRZ0Z
         sNdj5xHQKJ4zJBQGuFA2W5UK+yGuQne6u1UUvhO1aAeJeOKICc7wrGb4Ygmm+F2FbP4G
         FhMhDzi3zA6N9cuhQWY2+K6j40W200CjCsW2WN/lcIwBFOIsZp+zk6TLEXIYoHoTpVuM
         r9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376159; x=1789980959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQQuZfHbagcPKZy5EeFp3pnDLGdMdLr7Ly2KqLSH5Tw=;
        b=fjAJdFL8VuGxUOX1SCxWJCcB0Qdsbiz4CJlx/iDHSLqrkSASx1u1SZYoDbUEBvjSDD
         h2NENr43wcq6x/wF3NqlrXLrqZNQRcGT6zENvktPmoyRmUduA1IHilTxWYqnkEWOGeQj
         R9NrRS1qhtGled4mE6QLo8nB4mtL3MnKGPB5q49ht2hFXeDw5Ed+EYdsUi8jK+vWOCuh
         mMxcZ5MynleWUpa6zYcCWNbqcM+Aua30f3BvQM22rRY+g4o6IBt0ccdImmzCyU6VOZ/V
         /7qZgsGXdgt3rLeUzBPLL2TK0oMoRqudiiAAj49gpCJX9s9KfGK6RMHb2rlhkU+1euXH
         9KOg==
X-Gm-Message-State: AFuF++mYhavefn33pa8NhdOwgVzs78qTYw50eHM9ynymWjDgWjzqsVa8
	VKdarHChUVClA9mSnuIf6GnUDeKiwP+MsBlBg1fVkhIpArouJGuyBgE=
X-Gm-Gg: AYBFou0h7ggckLclWT48nLtm1RTNUD1dqNBasTd1ZwLptkcGUbGYO0DpZPrTdmmY3H1
	bnftLemy/Lttum/8vkBg5zNL4cZTgYAaKfNl5YveQMqlNGsddByra0GKeHcshORZ1fdssA5geUa
	V+yVQtOIO6iOAPhjA/tP2wZq9PfYfTUe/uSB4WTCMztifF479J2xp3Cgtz6/p9OWbZTkEJXJIg+
	QcABF07wgxFG2tuEdHyzq5o/t/lnWPDsvFOMl+FvhGhmefqPF2etRJ1BFpLbRVIvNMpNaCBZoSI
	dyjz7mj+IFZ0dG3ILh5ZuTvZS2aG0pKWx67G8figQaRHvUGAY9vH/dDd7sQRWf9Jr2iKhvVJtAy
	VaULadFVVGw+zBYIgaJHbDgjrYwghMzDnlnlR+bI4sTgmUBcBdDnhgSt3NywPVGkns8CpOFjmjd
	QMmVAHOVAAlILvfJPYUNgEsMoCYifjfEevwPA23h7xLtfVGKrGQLgDQK1nAaWyt2G2nmVo4eGRi
	W3tcg5sj6UG
X-Received: by 2002:a17:902:f541:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd6c73381dmr33672585ad.16.1789376158331;
        Mon, 14 Sep 2026 01:55:58 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm44569105ad.62.2026.09.14.01.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:55:58 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: linux@roeck-us.net,
	tzungbi@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	wim@linux-watchdog.org
Subject: [PATCH v2 1/8] watchdog: cadence_wdt: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Mon, 14 Sep 2026 15:54:44 +0700
Message-ID: <20260914085451.891675-2-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
References: <20260914085451.891675-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_ptr().

This lets us drop the __maybe_unused annotations from the resume callback.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/watchdog/cadence_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
index ad46b33ce5f2..94e74f451c7e 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -359,7 +359,7 @@ static int cdns_wdt_probe(struct platform_device *pdev)
  * @dev: handle to the device structure.
  * Return: 0 always.
  */
-static int __maybe_unused cdns_wdt_suspend(struct device *dev)
+static int cdns_wdt_suspend(struct device *dev)
 {
 	struct cdns_wdt *wdt = dev_get_drvdata(dev);
 
@@ -377,7 +377,7 @@ static int __maybe_unused cdns_wdt_suspend(struct device *dev)
  * @dev: handle to the device structure.
  * Return: 0 on success, errno otherwise.
  */
-static int __maybe_unused cdns_wdt_resume(struct device *dev)
+static int cdns_wdt_resume(struct device *dev)
 {
 	int ret;
 	struct cdns_wdt *wdt = dev_get_drvdata(dev);
@@ -394,7 +394,7 @@ static int __maybe_unused cdns_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cdns_wdt_pm_ops, cdns_wdt_suspend, cdns_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cdns_wdt_pm_ops, cdns_wdt_suspend, cdns_wdt_resume);
 
 static const struct of_device_id cdns_wdt_of_match[] = {
 	{ .compatible = "cdns,wdt-r1p2", },
@@ -408,7 +408,7 @@ static struct platform_driver cdns_wdt_driver = {
 	.driver		= {
 		.name	= "cdns-wdt",
 		.of_match_table = cdns_wdt_of_match,
-		.pm	= &cdns_wdt_pm_ops,
+		.pm	= pm_ptr(&cdns_wdt_pm_ops),
 	},
 };
 
-- 
2.53.0


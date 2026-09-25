Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83644063A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363822; cv=none; b=JEsCjI7xkRY68q2hSxPTKTVAI5zCeTpHFprqwYM4HQdL8uEVqGP2RUbFH3ygEUBh3hw7dgW+Quqgeyldbs3y+d8tKozWsYsh+UviXeJaDzxPu/P1FCmJt+Y4ZdhJobJ0EUncJRbti2zJL3p/hk+YQ6TfL81R3kzQdhLjZouHgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363822; c=relaxed/simple;
	bh=+96OmNdu52OLdp6PqNcnZbKt8nrAE4bnHJngCEEGTaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoEMJsV0V0R6YLNJg6cacA8itVba561dpSqKv3B66ZrHs0yHdg8EAgz0jwzvqWAoqa7w+xRxdZaK+6ik9cLhEimoFInW8MpcvHdwLwvWCTzxDIz9zohKlGg5O1zeF1aGkpGWJAgtGqZK7jj3hN3Yg81tvlNvgVRMlwiI1XIFKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruPTmgrk; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruPTmgrk"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2dea320fso124072485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363819; x=1790968619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvpGMpsWr2y15kZYUKT28HeHCdI9j+YtoSYsRebbgn4=;
        b=ruPTmgrkZnuKH7sceS0e5xg0u0Ob7erHTEHHECzWYsDJmsfJ9WfHojMjTlMvfUak26
         8TtmeyjGbwa6x+q3ImVrgkXp1cZzq922hUaR1ftJops/zXaNOJ+lQZ6JiUGcN4iDfJSJ
         ujp/ziptN666wraCJf3zIPF2le9K8NWyusg0SjLwYgrFsXYlGlj37u6pig3oZO4SV7y+
         jwd/DTAaV68lRCBticIVsF98trlNgESmNEalLtdSm7iL5oFBwb5Ol2csVQLlYNKDtWC+
         jcZoT+OlLh/r6RcSRpNbqgfl4GhCGtwZPf/HQ8hBwbDRuu4NJKmAOyD6qSfWJYHnR+/8
         YvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363819; x=1790968619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvpGMpsWr2y15kZYUKT28HeHCdI9j+YtoSYsRebbgn4=;
        b=EuQ7Q7ZGzAoGzRqv+xZ8SOv/TwbDUB6xQ7/eiQgOVLgIfPYT9Vz9Wt8v6oRnNmS7gY
         ZAxRRJeQ8O3fg2pgGSIMsN46LSDfavWSB5co3UlXLRid+I7YlfdQcCqSV3eODnl4xiuP
         /cNR+OpIi+1/v2oEhOZBLnhRrqhqm3bZKJ2EUo4dhoaqYiB3Z2eplpFc1vJXl/jqEmZG
         PpLFhodd2U+pkq4CobSSPAGd35opy3JUlkkwVyHaEjzTahN/aWbg4z+p5cg5oc6aGOw7
         cj3dVIjTbe2zQK2wDx+He38BvGf92wGIv1eUVtu4R37whWwbEn34OLBGUgAcj94eEAPT
         tZrw==
X-Forwarded-Encrypted: i=1; AKwUvBy5jcqnQlORXZxlvOKU+einpDkFf3o1X/D2gLcpurp131uhRzGnbbZOzexqxWFM/SsViSbu+jqfprfwsfM=@vger.kernel.org
X-Gm-Message-State: AFuF++kre2DVPelAQS0YVRldVkaF6MFBg6QsoJN+gC+ibNVM9tfdX2eA
	7J7u8B6JlvH0SpEk9IM8kTdfhOfZ7/X+ffBI1V8ordMHJ621x1j4MU4=
X-Gm-Gg: AYBFou1JCJADW5Usk8t+2NeLSlYxHyi7s6plwZUuJHUjjypmLQ23GbzLaAT3arA8JoN
	OS2A44ZJ15P2EfCfdg2MKeeF+7VBI2+t54LaxUlnxgYqDyYK7j9Sh6DYCrfG0vRzwCw4ZbEoAI8
	BLJfA5lbVUh+1LEggBZP1Io3o9OnShn9Kjrn3L12HR4qDILT6vB0XJMKgOV+ytk1wWExzsnrmbr
	NzDnlncBIsVb+4H+L4dI0PezDPmhFbxNgzCkec74qciDoJkEZ1Lvfn75Fsu9h+a+yxQSDlyLlHg
	6Kf5D8URmbzfPZV1Ro3aN8iFCKu9aakcBVzz5lzDNKkaVIjySomNQY9P2RsCrosBHt80zq7lWhm
	bzSojx7KYX88LIJ+TJCg5wI5HCDoQiR/jX4sD4OqzH8TWftWzc9ypgL5r3AZ3KGXdYN0kq4nijK
	07j5whcuW5+0Pui6aL6UbMkQ7Xt4+Tzz2B8czvrscEHk2HIsZlGHK7bko3bRkp10P5Gh8L8s9xk
	b0z0DVWZMdgMhW0lnDFf0joHmIua0TjCGbFPJYr0VOkf/lmF0tYOSIKofeU6vDYQ4eVnqBSZYrT
	VHI2flZuFoXcwaaDzzl0fUf3Fkm/
X-Received: by 2002:a05:620a:1a1b:b0:939:7c8:78a9 with SMTP id af79cd13be357-93c43b61a84mr653468985a.3.1790363818750;
        Fri, 25 Sep 2026 12:16:58 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm24142666d6.6.2026.09.25.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:16:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3 2/2] media: venus: disable recovery work before HFI teardown
Date: Fri, 25 Sep 2026 15:16:53 -0400
Message-ID: <20260925191653.3144006-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191653.3144006-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0


Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C39332614
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678680; cv=none; b=Rj3CHUtEyg/7kZ6dxaURY+kTKOx2nr5whpioI70zM7EJinKwpcWS8c5ql7U1Q1HS1LHAZ1kxJhJjU1VeWQ4THRe4APDjIZEgNuyOM9DwwXlwkISU9vyd88WSQlbVc4R15D1E9dbMYU5Fp1G5jUQgL0dHLpCGzZUC7sYwMahkEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678680; c=relaxed/simple;
	bh=WV19nRgnlTczcJCJcJLqYj8F5k/1pRJmdKXrBvJGuXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXfo3o5Eyl965F2F3xIU5tG+WroV00Ad88nHPFMJ9WyVLuRZublh3ojZo9WO0DSp8IxuN9/uxMzm5ygXnFC7vyT9LmDe1ZCl5fNPdEMVpiEV8Dd1U4lBPiOrQ23jeaT9vj6ZxhIzzQIuXrvLhPJn1mXcj2tFbAE6D0MOjE3HL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCw6zJ0m; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCw6zJ0m"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso19291295e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788678677; x=1789283477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuI8ci+AOd5iWfmTxSoL7IT2ohrWp2ZssNC41x43tJA=;
        b=oCw6zJ0m8TkQCRg4vXWwu2aOly11JMcS6FPz9Yr46kffpfoBFKpQYHFPnZvy565qnm
         qhVvOM9y1mGNxb4JHaQsKm65noMKcdBVXp6W0vWflCkG3anjIFgFdGZ813wQ4VP6NDHh
         EpfT6zXgodrfiFoxhPGYwOhFMHZr6Kf4T07xbV44vvV8vNr6GpGqn1cHMrZrkxUMwxJW
         YQX08gYQEae17lj5Ub70uX6AR2yc7Jn1IJocv0vrY9rHU0bDNI8HSMhxCwv2FSHzfO8Z
         aGaDmc+vmdhuUkSE4vpOJZx5Oin3Pxsau0me6vWdw6ZEgWczOLZ98i7GWW3qW5ruexhi
         Nv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788678677; x=1789283477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuI8ci+AOd5iWfmTxSoL7IT2ohrWp2ZssNC41x43tJA=;
        b=f0Mq1MNfSnQaY3KOZl9qYBsalu1Vsm46Nlwzr7Lk7lBGqHVhPVcKTo5Fhx7cT2DfCe
         ggfZyDd1NREFcmTv9fztyX85e+93FW2sUS64pLmmrUYj5xsU5zxur+Xl0tGr02ImTM9w
         MT61Fwjy/NyBC1tDIQOrJWXwLmZWWhLzmH2ETeKYa9HJ30JFnFHPGDnwXfWXc6SZaRYN
         cNEUvxlysna3p9x8pFI+463YU9mzjI/Lx3uUMY7HTV/eR9O6pnAzHZeNiqDpS4/45Tqi
         qhFCdGV1OAB+vQ5vTrxnG6TRaG7V4jR5QHLjBoR2fqv6MdOG3yaTpCFedR92GCBaplgy
         qDBQ==
X-Forwarded-Encrypted: i=1; AKwUvByGl8//A4OG/bPExxHvhgSs7EDr9iDEOXsQ9g7Csi9bIY0+lDQDHSEANG6qhC7ibU0iq4hZnKTCWKgh/Pg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKm+4SFhyXiWOtl8BEOwmLddxhkX7bH1XjBS26T6PuB84fW/At
	VYhnNj/6whs2is+UxBpIP8JEi/HbYjO4bWdM/Wz3uV5xgrQyIC+ikx5e
X-Gm-Gg: AYBFou12KS2i8oq9Pd3Oh3K3rmy5oSOHqL+H82HJxLUeX25EJI3crx1KMmBaIOBm9+/
	hsVhWbqchiBg/LW06iPjhvB2oM4tMFLfl3hb7TvdKlhKPsoAc55C6/W6Q1fL9Pz4GkGztbTY497
	2eZJWHBaoEA6Wsn8ekBvRwD3YbtG8GfbTEX9z9oHep9VOUKnvEispXeCdb4sJv5B38DxRp8zZGo
	Y7toWBvu4Aq5kbS9KgfM02iWUul5ra7MRuPWbza5QSuObf9ouJv9v/9RVH5Tf/cQf3DU/H14YHC
	mTL9Ei4YYF6aWOpcbS+nR1rULfO1ZHlCMjovtXzSRTmyMFkPoobHSR30VQm9hi9pG6dFQGSNOvs
	pdj3VBEIJJBR362085i4xG27NXCdUELomA5x2I3fuOiLTD2J+nxqR35o0aHojpDgwAmCctdEM12
	bl5rgw/EZ6F9NDcpG/AyvOHRTrDvIGhba/Vq/OKiWSqtjXinG2CHY22KzR0y4Xh2C+au98ELLlr
	iPBs/V4R9O/mbRtQTE8fze+GSCJWRWW85V/TySwYTP5WtEc
X-Received: by 2002:a05:600c:1548:b0:49c:fc6e:a3d4 with SMTP id 5b1f17b1804b1-49cfc6ea70fmr132686535e9.19.1788678677246;
        Sun, 06 Sep 2026 00:11:17 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm169995245e9.3.2026.09.06.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 00:11:15 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: mali-c55: Free the ISP control handler on unregister
Date: Sun,  6 Sep 2026 08:10:30 +0100
Message-ID: <20260906071112.48259-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_isp_init_controls() initialises isp->handler and adds the
capabilities control, but mali_c55_unregister_isp() never frees it.
Neither v4l2_device_unregister_subdev() nor v4l2_subdev_cleanup()
touches sd->ctrl_handler, so the handler and its control are leaked on
every unbind or module removal. The probe error path already frees it,
and the TPG subdevice does so in its own unregister function.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index e128adf6ee37..c45a3760e084 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -641,6 +641,7 @@ void mali_c55_unregister_isp(struct mali_c55 *mali_c55)
 
 	mutex_destroy(&isp->capture_lock);
 	v4l2_device_unregister_subdev(&isp->sd);
+	v4l2_ctrl_handler_free(&isp->handler);
 	v4l2_subdev_cleanup(&isp->sd);
 	media_entity_cleanup(&isp->sd.entity);
 }
-- 
2.55.0


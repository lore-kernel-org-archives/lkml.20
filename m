Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F86476059
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940981; cv=none; b=tjxnNIdLmSYckEi5k0FpBI9xn7QyCOJxpVnRjeMRoqjIVd9/mWJ0sUdjKkoEID60jEV4wboCN2IZisRf1FzCAR8nZGQRRsCAOhtBa0knEyBfOcMFP1T+mIspsA3Z1Fqd8jzwDNTHl+N+cbo1oup7wBINK1c/VtRwp8cKSFgx23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940981; c=relaxed/simple;
	bh=kJZh6y94i6h+wIueUxNoBcL4CgBSHgSQrOmgm0f33jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y560EpSIEkKsMxqEBZKPKjnwRSMm0MvWTSnvQvn7UDXFRB/KfmDBQzDRehFJ9seHqNf8VNZatKalkGwW/AvnnNYDLp+6nMpo/uLuFLDhGXI6qwUuPYmY5nk02XwS3ZEfatVgiK4tlVDO2Fr6dPiAFVfE7NN3zDG9NPBJ2htern4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMsAcUIi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMsAcUIi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso45324585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940978; x=1789545778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0ImWj6rAclHhabuY+hCcTXmlRAswzPkBoaFWxuqP+A=;
        b=ZMsAcUIiUF6C3BHL1mLewfKZAyI0WyMqrU0VOXcxtvCPQSC6e2HxnaC7fv182denl0
         G9lzp8fA/qFbq6ODMUCulMDRXtTgvLdRnGvy9ojjw9XutRty9ICE8r3lt3Um28XyZbYt
         U5JLXAQyfooNdvGYI04ssVoY25M/M+Q1b4nUEFjRTA8v94JYKez90eXjSwuipGzZWwdJ
         KQ6XF4CCY3VCKdinF5aMeghd0fQQJxseUz2QXZJMJxlUdv98G6q/S01dwnqCb60FAFeG
         rE90MH094RudPzF9BizB6UY7VkjeVEw6cXN3XWBo1o7CR78DaLzqTLyPFVQS++cX6wru
         1tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940978; x=1789545778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0ImWj6rAclHhabuY+hCcTXmlRAswzPkBoaFWxuqP+A=;
        b=aX2x6cGT55uiKFFrixK8WzznOy+kFK3Y7NAQgqpnsMnypnMEK1knWLC3DIyuB87uDv
         OX5Gxnmvueqh1LI1m6He/rjW6MZco+BpT3G6XAAT5qLVjUBXQ+XMCWk6jbnFHvisHKo4
         o4/hmgcKH7hzM6PlH6o92SIPspEPxynviMzu5g71MGZtIdQeFOHMlFfnFSIft22Jt+3C
         4LLdVzUSo2dbIyvDSjjAwI7Uxc7Gf6+dexY9+Xl6Cd59RCKDBPF5/hUFeXxzqnY+9H9C
         1MESS7V609MI8o7M8EDEcG7U2ilDMAIorKwDlAxjQCBjXw3IYZmwnoz2e/ejDkXowQmW
         V5ZA==
X-Forwarded-Encrypted: i=1; AKwUvByGg5smmYYymU5EvSSYgu2nBP3y4l3hZU6atufD7coigzfgpgTc8dcqOQO5spyvHT/SyidObSoVAc0bJ8k=@vger.kernel.org
X-Gm-Message-State: AFuF++n5gFPti1UL2LYFtJoRfo3AaN5YOcJVoy0uzTxxIuRomRLEgzsV
	QBvOZilRlj8jx6zPLrxl7AALg8C9pywYTElLoelVIuLdDcQinVUf0j+a
X-Gm-Gg: AYBFou3dFDcBAo8aURqzumxGmdSM1p25Tw0fxYUsTm/SEwt/kRY3UCJMwcsIaI7sfuo
	a3NF00No5DaBL18lPt/fbUGu5eYkE/Paxc+YRBIh+Ka7bmF1SsMaTODv3usf3KHtU53NKNMuMZF
	iTvX8PMOvFaaKlqZGoN3rWSP/QBJK9tSb0yhMTWzAxhalbYw4ou0fRQvlksrVusrDcDqAYK1vrh
	FnfCWLUoEV+4Q+VUeY6jDnt3yls4B29lExIJalP70O6jIdYIt8kYolEhxSyDciYtvTC68SBN5vc
	8PCek+VV/Y7A7MX7ef/cb0d1ELdkFiUhEI7lvbZ6s4WFtArhU4IqErc4/PSE8RzNYVxT7aqfRUC
	uOBguyojXv4qmX9d2itMnVqDHnspR2HHVC+qO+pNxTk8b/yhCC42sADrm+AWv1EJ3oiR0XUijcT
	8TIyFiUBRGhqo5icJRgCM7+uxMziyx0E/Qv3QNhqXjbuFHJTQOEpGUVRdkZugPhtz/sBK2i5HnQ
	S2O5eomQgoCElK47yOT4Lw/tkhHO70TaubHLZ9SFA==
X-Received: by 2002:a05:600c:c3cc:10b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49d1d6a4d7emr53938015e9.1.1788940977612;
        Wed, 09 Sep 2026 01:02:57 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:57 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 5/5] media: i2c: st-mipid02: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:27 +0300
Message-ID: <12ac971583eaf4775a0242a58a6ed0a1fd08cdb3.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind. The driver has no common cleanup helper, so update both sites.

Fixes: 04d170b288b3 ("media: i2c: st-mipid02: use active state to store pad formats")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/st-mipid02.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 4675181af..b2f275129 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -919,6 +919,7 @@ static int mipid02_probe(struct i2c_client *client)
 power_off:
 	mipid02_set_power_off(&client->dev);
 entity_cleanup:
+	v4l2_subdev_cleanup(&bridge->sd);
 	media_entity_cleanup(&bridge->sd.entity);
 
 	return ret;
@@ -937,6 +938,7 @@ static void mipid02_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		mipid02_set_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&bridge->sd);
 	media_entity_cleanup(&bridge->sd.entity);
 }
 
-- 
2.43.0


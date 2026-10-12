Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526204908D1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815743; cv=none; b=DgSaQPxsjflcey+g715KQqX9nX+rQZZENti5mFuRPt2kVFJYajAI2NnwI/mmEtcg1wGozteMlwDnOoxPmu73MBS0lltdK8S6WWl+hVWI1K3qHZ+t2SfHmq0dl8JKpM2U1t7Ew+ImQYAsxwXfERRionaUA6TCFS6Ca5h+2l1mDq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815743; c=relaxed/simple;
	bh=olHtY0sEO1s9tOBA/T+Hd7sa5yfIodktJQm/3oyRQyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7g5AJas8GfkQhgmuU4h7aYDMbPRlPiXCwyUwdUl/Pqdb7JsfcRlkuJKb/Jw5g8JpbO+8qeAbmtMpxezdyUizBlT8LcNiQIt6z6bGzKF3Q6UDbQKV9eewKKM2O8J9boHPxGJYnnTIe8irPBLliHsjZ6WIqcHo3jwPAahnIv1igI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8SLU4Xv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8SLU4Xv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so1487738f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815738; x=1792420538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SY94Iu0xUCaLlywfcje8bRGgz8FcPm7pfqOfRX8wxI=;
        b=b8SLU4XvTTSPdbT/iFSpHZWXYhOUCCokJTLVjFkKVAQoewiYEM6/AbazBSgcHIzUhy
         A+ph5qjkz1n9t2Y5iEkuPfebDyUdfwgOoDMxDw3PqRgU8yoe1AiqTGKIAktFVwlnAxlp
         ISOBqOab1vt/GFWSOCuAuPPTO9lQCCO1PJGINkiEx/KvX/bcapsiTfAdyR2ctm0e5hOV
         0qkJJBKBzLbBzyS8MaEgXoLYOkJ7pZA46wMy7gOrT+pMHQHCPwIa6U/LR52uEv9os+Hi
         5gK2NKEwSrVZU5cNh0J3e14/hrbOihSFrloRow0JaFyQEc+LrL3i/3RflNAw/zIDaZHS
         JHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815738; x=1792420538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SY94Iu0xUCaLlywfcje8bRGgz8FcPm7pfqOfRX8wxI=;
        b=qMdxmhkrF57AI4AOSgZzukObsnK+7DziHQDO7nJyFPA5bezo4qwxFn7Uu25qjFVZBQ
         bhFstkhLCA1w9E0qOUOde/LorWTXDFjmYMcPixoczvw5FRl3TcdTnr5zvMj1dX0P56i8
         /vZmXk6jd5pFW20jo4up2VjD8iJxjW+Lw3QuMjD50WciKV+qYx6ffF40zc4X+UsojaMh
         bnruG6M1crH/7KgRoEZMFZQ/W0a3mCdmaifVhN8tXzWGxglBuJVnFd34ThceCMjpm33X
         7kfcqQzzVj7i1dF4o4X48cxOHio1eGgUENeKoR6PQXKPGMSWrGjydv647DBpB231cbrX
         NpEA==
X-Forwarded-Encrypted: i=1; AKwUvBxc9vVn3FUb2Cj237nCJ/zhUVa9VXAKsXF3SMSw7l/sU3yjF9mxsjCot018I6mkUWzO1ysRWEo1XxGTaIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDYo1BJ36OadyucOa6yJQ/a/J8ASXpbcB3VeIP7NUm4N3JSF9M
	h7kk7/vGzp/vaWq03bQEULHzAgcNpzIh8hJ1i0NW95Yu2/ZGOETGW2ZX
X-Gm-Gg: AYBFou0tVtxiaa5M0i7vQIMrIi5nPvuRZei9Jy+QLAYMWxRwS9EbwAWtIzUzCMiIleA
	0EW1DP8kB/kVVL8GbdDoEPZo6F6tCZaGCblqZfes6Ib00r/Arl/ZVBucBZxVZ3zHrzVADX7R5gJ
	tpb62XJRh8tl0lrH8lstBtot3h1DLAS5P+32NO/O93iZWIymcqTkXQfDwauPF65/FeWs2U4RU6w
	oip7S8b3cfvgzEDgttVOe/XF0Ru4AzrQcCLHEYQERBAlZcQy5kPgdvOq1+DQ4jdehTsJmLZTnGx
	Wz7ASUwtmRK//JLoZs6czWTmHB8g/WusKfOHtgYE4E2Kj79u03ulcbWqeLH6AxrFgc3pIFaVkmy
	WA2croPI7O4h8kd23z+LOdg78TZX2I5h7PKeCx3MiEWQv1hA1Dn64EwcwfVIIL6UgD9rkyo+6dM
	Ndg0Lm/4hnNGcA/GvdeB3sW1DH7icAgFXVH3SY/esgMtR0/9KUIKBnqTknthVjvh5ntU9A3lBZs
	bCFfIqrpP6PXuYiX48KqMr3t97oln2rzVMN5+zUzR2HO26Mm/CCV64ZUL4igVz6umuYh17xbKEm
	w4rkdE7qIl0FKbInIDq24bbyhDJtRPfhHmVle/Yc0E6AVEVvKub+M2KL9XrN1262JPkTLlIEdn/
	dX1F8H/AEVkpluIKauqZmobN2IulrKm6BnxigOuZsYFaV4c6YairLyA==
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48dbaae9e03mr15467705f8f.28.1791815738106;
        Mon, 12 Oct 2026 07:35:38 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:37 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] media: ipu-bridge: Add the GC5035 binning link frequency
Date: Mon, 12 Oct 2026 16:34:42 +0200
Message-ID: <20261012143443.34897-7-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In its 2x2 binned mode the GC5035 uses a 175.2 MHz link frequency, set by
the PLL of the vendor register sequence for that mode. List it, so that
the driver can offer binning.

Assisted-by: claude-opus-5-5
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 851096d7d..3caa07529 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -60,7 +60,7 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC5035 */
-	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
+	IPU_SENSOR_CONFIG("GCTI5035", 2, 175200000, 422400000),
 	/* GalaxyCore GC8034 */
 	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),
 	/* Himax HM1092 */
-- 
2.47.3


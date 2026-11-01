Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793539472;
	b=bJSNuZKUDO1fAFID5yxJZok4uuJWj0VfOqB3gFyTAu9Dpfb6enwirm42HVi6Pcw15bFk
	 0oVTF0Ug84SAU9pj7Xo6lSU1chQ5C0hN5jFpjQbDzngf/kxosEPx8+ZGOIucsAI6JrPC3
	 zjPAeSiJCmaNh1VXlI2E/vvCdmYvwu45vGgAuM5my46hwfsWBZUsvHatYwchjGJI1Z7KV
	 nhlF9rAM1IURlgJ6X2D9rjHFscj84SL8L4AyQ303r0szrCvZIEVipRqt3GsYqsCcaMORo
	 LACy27t1fqY9x9qZL5SO4MLD85RiP9keJqE8LPqk82gvROXFcWK0AnPeT8k4Nq0OtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793539472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
	b=wuyxrL59vnYZF8/3rksO1pUjofR9HfPx9lxli2O7BXxrUtWznL9znaQ9YDMd92c8vrDU
	 tHrigmt1kSGqSPO7iBGdE8y+0XkKPQdKD3dznQPcDNbr7tLj/bLJySJE+1IzQzTx2uk01
	 U/3YFq2OJQzbTFS2BHOAka39ucLSOGvhnTrYt1o0L2aFL6filJpfunYFichVXbxxQqabE
	 30bRRZp1mqZFx/JhzrW/d0HNAgawKKRFbKpxJGu0gvAWc0tZTpkim0lAiyL/iO5nvdTBF
	 iVEckCbcXVT8wvClbrS85fKvYpdNg9eRR2MxxNxqfIrH4bPj3VUoxXaM11r8Y8VSWJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ETepvLu0;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76509606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76509606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ETepvLu0
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ac9d666d4eso18765147b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793539469; x=1794144269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=ETepvLu0v3btKNzRkiQzA8a2GUrFc5vI1Pg6UN3Q759yFkLyQJh7sqyODCeM0gEGwi
         YFnwzYXL2dtvZ8q/IIGEb5bveVzbGBsLNLELkCbs/6ARqLbj4G0psW+zjvHZxqTwiGkl
         PDO1ZJ5sLqwfQB8MMpZ6UB7hwuSf32eYRbvK7rLwgRTBh8679DF+4Q4c4+NgCnxeAwT6
         ZpFYlyr3cc+eDFZqGot95/cQxNBt3nq3Dimr7tvTiNo4g/Uj8GA27s+YeG4KXWIZVHDO
         95HNmnIatqbqN4kwgwSbwggyr0tshtyyT++f+F5U319CEWlILSH7awfSkDFGmD3vOCK1
         atag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793539469; x=1794144269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=sOmt4GioJzJ1kqfe89eK+WXTi5KFxxad2UUe1chBjoRJeJzCa6peFi/MQC53yphSMV
         nH4apo7kaJ09Mr8Zx8NCY3O8Yj4EqtE2QNvx0Mt/1SgS8O3njAg7jTbIFdY++cYgfkKM
         IUo8gByIXnS1mkVpAZUPqF2mw/FlWb8mzCv/7NADuHkF9v7M7jPl90GgnoPPqkGkEUF7
         /C/no8mK99Tx33ZdEWRYO0wLh9/MNRQCXSya72I5HqYISgUzNTaVl5ncOljr9Scrrzf9
         wnhbdxwxVetLx//Sw/O2mx8fM4k33siM0SIgRCyuxWUPm9eGPnZ02qBCdPJ5M3kT+ymm
         0tmw==
X-Forwarded-Encrypted: i=1; AKwUvBzKl4alFQHGsKKAYu44RJvT1hgEqKIAncOn4cwhD3dMikxnvMnJYdB9wYsLrhsqhewWE06kf1A8rwVB1iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UiVbCB02h6QyxwiQthAZe8oInW8KitwOKqRX/96GrRtiyUW7R
	Gh/wcicPzNNpoFmLNHdsnIahar/2CQoougurfbvy844KYO9qmsSQzK4IbVPUXCs77w==
X-Gm-Gg: AYBFou1OadYgQl6ZzpswuyjT6aoKJh6rqMTVhO++7wKMm1IPw0B9R9GVfENMr1wVuc1
	zhHUU8yYm47Kq0py+FPmj06038QAngySJ23FLhgjVnw1UH8AvpmehhnCOamDMUpfaFvu4AAoiM9
	N8LVghdOEF6UFb5PEXaRXernrNFJ+/SXt+DF0x25AFvZfittQfgcn64OeAAijIZsyTZnaSz1sbs
	otDLfMgPTTezsoczHnu1vjKer+RA35WgMYF3o6NXnOzPY9O5JopW/YwVHnq83W+AzV3A8JQYxIa
	7I833/ec+ZtmeE7NhJea54Lvoxa6oUsrAzN0alyLbzf9GDTg6U6C/DcKVtnyqBqgWFbH0aDP9j2
	TAX9rOMHtXDdrgfRy1gd52WvnipmufvjUL23tvN2Q5pnNkyhctPumC25QFp5BJPVOP5wXAx5/wq
	KoUe+bwx3XJC6V2TUDZjRaOsDjoKm1o5sn+xW4MPuMtd4D2gcAd4YDXbOL9YsXJHRzC/xmzQ3IW
	5HZTHJW/RCd2atXZCVdffrSrD3hCbUHz/HjVdGrXW+VCT8wARYouCMXQSWWJ4TgEP84LmRQ
X-Received: by 2002:a05:690c:4:b0:8b0:a352:f978 with SMTP id 00721157ae682-8b2b65af008mr40507547b3.4.1793539469488;
        Sun, 01 Nov 2026 05:24:29 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716433bsm37301417b3.26.2026.11.01.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:24:28 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Sun,  1 Nov 2026 22:24:22 +0900
Message-Id: <20261101132422.1396104-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Cc: stable@vger.kernel.org
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Add Fixes: and Cc: stable tags, as requested by Jai Luthra.
- Collect Reviewed-by tags from Dave Stevenson and Jai Luthra.
- Diff unchanged.

Link to v1: https://lore.kernel.org/all/20260514193148.2357371-1-ingyujang25@korea.ac.kr/

 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9f..91e9fa0341e06 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.34.1


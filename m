Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981204;
	b=arj1qvcFuZvIHM9V77PYLFrVy9GfVK+HrYlVaWPMRt0p5XOrBkkaoygcSoFU4efn8W+I
	 JjLldOENLxs016boROq9UYdkmCDVIw6dfo+gDAZH6r0jWCI8Xz43dcRseetz2MmaDlM0P
	 zNlOI+YynLKOgeZTL4VAUP9gA0o4gcvUtx3hmf/HzjVNrUYmCuXCxYEmucRz7ffAvg5oa
	 HKtYy4uf4EHyNHzttH3VYfanLspNCBTFsHTSFFmEWNQG/vdFlXaDIhRQb5mToOEoD+fL9
	 4Y+t5+tudxiDztXDRUgT9nIG9Ain83idDE49+CUWkfBYGohyE6fF3m4P2RFrDdKHG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QyITsV3GE2/jXTbu1YbYi8AKwMzzCHCnDzYN+d5C+sM=;
	b=kKn7n4Cgj94MDgfDcm/VxJi+OHt3Xtx7HMdlOF65LoTyMvBdwkc+BI8zAGkHbALHnPFh
	 sSee5KXZWQ9R9Rv9spQzQfujHmncgNyOTLculdQLHjC+TEG/MtxRSOQNHU9wYmGnNisLK
	 e9W5w2nxNC7VJU6IRZ5CgWOKNiMBZD/R5XUJ/24yyW3V+Jol1hBBqSjwiQeeI8W5rJvdn
	 55WrSpyPSJGLwZrPkTkO/C5QZ05IINfp3hUw8oLx8juc5OAXVGD26MMIuBiXD7EAcsVhA
	 GTnIQy8iTm3U5d3VdoYd22bsNApgxYMl0ZLChZPwg110G2IOKzVuapyxLbbWG/ZPpLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DWq6ujn;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41726606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41726606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DWq6ujn
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363316fa0cso8633291cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981203; x=1794586003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyITsV3GE2/jXTbu1YbYi8AKwMzzCHCnDzYN+d5C+sM=;
        b=0DWq6ujnkqOBlw0+5bxao6e+MKKW7YSzeADPnVGzfA5v1yCZ1ZASbKVO5eDYua21wk
         3KVCLbGDWAO2M9OCg2XemszoBedLtHvb8jmlZhgxJvivkZPV2BB0a8mxHzr7vbGpwowZ
         c8bLecdsp40oDD8s09osS/RBuGXKrjbtyz+wt57DfyXT2nVqSsMDp2ar4PmdSYVE64v2
         o8YvqP5H4Vwrxw6vtNTrjuAhuY9AVzxtvphNakmzOVknVAfuZk3rhXi5F59qjkM8OrKf
         Ol5f3l91qzfbgKA4msmxHzQyu+WiK91TTJQW6UScY+Vj5j383nGBX6Z/zjpbUyb270f5
         2zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981203; x=1794586003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyITsV3GE2/jXTbu1YbYi8AKwMzzCHCnDzYN+d5C+sM=;
        b=HmqbWB4uCygkbF/ibfpQKUbtYfupxsL6VCrjATz4t9wh2sAzTENp6TD3ym/16lhRea
         lra6KlQQdQXs87aNwDrmql0e051Po/QQOiM3Ydq31SPQITsykdQWtFtbB3OCibAkLtz8
         /Pfyr/oe/3jEizCmAJWBqhk4ESinvTbeFjmOysJY8JoSMcB8K8xYMiwMzYdCLHZOzjMG
         unRTgN3iYjR2LkO/S7UWTktTraXWzRLBUSaqW/Z6RwdFYrZO3oFldU4cTrO30XRVM/yO
         x5zlHPYfxcK9bOjK8oYP+NCpSh9Opy4styhIuzq3P3CxuMINxXohH0/aftBLa8XZPlXQ
         rIhg==
X-Forwarded-Encrypted: i=1; AKwUvBy1CMjhsVEKAE/joxBOeINRhgMM6IFcizI4Wy29chh11DTaZSD58dSuNBc+VS3Na7x82qlzq0u/3plVjTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/gmQHHZpe+fSOeBGYCFr75DAXujIilj4vgH4v/gJ7R1SGWyz7
	mcQicq71/Z7WUWRArWKZiMaGrQgnbjo17g8uAdTeq0KlRmqS/243xp3I
X-Gm-Gg: AYBFou3rzcc7Uq5JF5mNe/fLn4Np9nOk+hYlGdMpuOBQj9AaCMqSsn0hum3Bki9COYy
	sdDmZwqkTJmx694dfy9ACDXTc/lVYmoUOW+Nm/Rgba1uRLDjHillw+OAJmZVDhWpu1wAdZAIWLS
	HIrWxk0tA1qFIfTQ2pYOtpdDenOipg452L1X+uCJrhW/y7RPZG+GjuFvulMM17R1fY/XNRuorBP
	O4vq9rKNDLo+Hzg/jyY70xeV0/L+GaDkaMx0erp2o67h5jsxzWPyVs1+XgiTU3wITwyn5nDCiCV
	zJTFeYNA+oNw1DRSP51KegEueVsS9oceMC4Ghwi/Gfy/bDls7aSTf0tvkiIYFXnm9OgIPI4Qars
	FO2tYo8SaSbfXDEnK+iSZkWIWbt5ossWXmK12kOfaGleJZzu/227epRUsRvrfF/xrAMKXgom/+s
	FB695yuVFD+zf0BYxtk8WwmU1iIcKTg7PmwegqacFmTDmxh1Wji2iQAM/DfCXOrtgvOYuyIXhMu
	d4iQqn8jKqsO8dRjDypSytLWi3WiuTC448AwoHGdwglEX+0GslWMyB/1fLjGNn9EpdRHH/JkxbQ
	cTvYmUddeUHhEwUfbQ==
X-Received: by 2002:a05:622a:514e:b0:535:11bb:c2a3 with SMTP id d75a77b69052e-54e14e69326mr40210301cf.53.1793981202935;
        Fri, 06 Nov 2026 08:06:42 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e2625abafsm23468801cf.16.2026.11.06.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:42 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] zloop: remove the device ID after del_gendisk()
Date: Fri,  6 Nov 2026 11:06:38 -0500
Message-ID: <20261106160638.2385495-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

zloop_ctl_remove() removes the device ID from zloop_index_idr before
del_gendisk() removes the "zloop<N>" disk from sysfs. An "add" request
issued in between can get the same ID, and its add_disk() fails:

  sysfs: cannot create duplicate filename '/devices/virtual/block/zloop0'
  ...
  zloop: add_disk failed (err=-17)

Remove the ID after del_gendisk() and before put_disk() frees the
device. Until then, an "add" requesting the same ID fails with -EEXIST,
and another "remove" fails with -EINVAL from the existing Zlo_deleting
check.

Fixes: eb0570c7df23 ("block: new zoned loop block device driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---

Notes:
    Found with a static analysis tool we are developing.
    
    Reproduced in QEMU (x86_64) with two threads that each write
    "add id=0,..." and then "remove id=0" to /dev/zloop-control in a loop
    for 20 seconds, with the zone files on tmpfs. Without this patch,
    add_disk() failed 2126 times with the error above. With it, add_disk()
    never failed, and the requests that overlapped a deletion got -EEXIST
    ("add") or -EINVAL ("remove").

 drivers/block/zloop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/zloop.c b/drivers/block/zloop.c
index 65634a39b0bf..8fb1f7fad286 100644
--- a/drivers/block/zloop.c
+++ b/drivers/block/zloop.c
@@ -1467,7 +1467,6 @@ static int zloop_ctl_remove(struct zloop_options *opts)
 	} else if (zlo->state == Zlo_deleting) {
 		ret = -EINVAL;
 	} else {
-		idr_remove(&zloop_index_idr, zlo->id);
 		WRITE_ONCE(zlo->state, Zlo_deleting);
 	}
 
@@ -1477,6 +1476,10 @@ static int zloop_ctl_remove(struct zloop_options *opts)
 
 	del_gendisk(zlo->disk);
 
+	mutex_lock(&zloop_ctl_mutex);
+	idr_remove(&zloop_index_idr, zlo->id);
+	mutex_unlock(&zloop_ctl_mutex);
+
 	if (zlo->discard_write_cache)
 		zloop_forget_cache(zlo);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


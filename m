Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6749737DE8B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787802734; cv=none; b=HECluTDd/c+d6zADbyHoSKB0Xlw5/40v42HNB9rrcsPK8Uf5R1fuVE5uQwvCPWHHAmM1FQs0W0UAd1UasvMO9nHl0PQbES9nW8MxFHsxMZcOZP6VORJijka1aI1hIY2tnH7dBH1VHbKtn1dxk1aveDfHHUzhSnDHgUeTACbj09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787802734; c=relaxed/simple;
	bh=wqAOpz+o/OmBXLvAWwJjaJJz1u7kCcgSqoUoQrl5Sbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyfAEPgGIhbiFB8V7/YFZNauU41lpRG45tdK/Z6imrbj22fGNOdpUS5w7YL+hLI1DY/CmKbig+dBauswF/Q6Fd/SNCCMcLXgdISMWkqxpVhmmLZoNCzsh+U156yZtWOnVLuHUIK0HpR+SzeL8auWlRjLmed7WdGCD283QBaNDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8e7AZIs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8e7AZIs"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so387064a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787802733; x=1788407533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJfrPdFq+EA9k3+W6F0OPeNTLDq5MohHxFERw6Hx1bo=;
        b=m8e7AZIsD7kdqLgeokh8eqNjcdbuW+SWyNNlOIq2Id//PyKBds3Af0j19qHjQ2YWvH
         QMnEECy6gj6wnO4kNrer746kaCvGAz419/bWKL016PF0scpROiPolCW2+RFGx7dSvBbl
         IArOfoFr79l83SZQs4tVIoZ7/hhs8ESe/ThAD9+sMa5LhBTrdPYxYSsStpATxr0ZAPwe
         eyUzoP3yeszLkDw0jpSiGX1IH18mD4LOxoq0qoXjBmA04RFG7wRDv2l0i5w7MHrMPlc3
         MoCfeBeG/w3sAry88pKSdEp+rIf3IdGl2w/OVWo2SkASkgcPpCYrhoia8OwBkdsM1tXj
         2+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787802733; x=1788407533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJfrPdFq+EA9k3+W6F0OPeNTLDq5MohHxFERw6Hx1bo=;
        b=KEXRvLpdGO/ym1EbmlX4c24t4LAo3r7lbxQ5WVOWcfMslmKpdcX6ubKhX6e3UBfDqE
         3rIyLyQ0lZGA7KcU+lzdjf3o5hE4A9gcNdGOYKUD600tuOYXhxdth2jet7LMaLCpT5Z9
         VqCbJiOyTOXDPNE2Sqemw1ahm932Td/gb7X8MiGg5pnCn6FmmMjp2PUAUY1BClBXvpOu
         T2nUXFdwQQKK+Ng98YQlmbpVShzgnzrtPGrrrwmV4ZiaFYoiN7USMDUy6M/myg6nG2o6
         C8jw2ZPp28hYDCKFEtglLZ467qKspdQIMWqAJLuGW/VrNIHh0xMalRERjnxNh80ACiAP
         Ud3g==
X-Forwarded-Encrypted: i=1; AHgh+RonO4q0GQVaXRal7biZN2UeRAqNlos5MXhdfiV+Y/Rmk18dwZRMWFGZiAUDayudLcXL9iPFilIN36/tcOw=@vger.kernel.org
X-Gm-Message-State: AFuF++mry5T3G9uGRv07OeZKtt/sq23xCruOsjmHPpX8Y1FFbXCzJIOu
	KvFGmp8d36Ghakqcx7iuOoFCOHbKUVwtdiz5J4cG47Oz9zoxpE1lG2+S
X-Gm-Gg: AR+sD10Ik0DpANMKA2pL/FJOSAZ+gsEoXd9p3Yv71hyGix5kdC+yZeGFrzgKej8wXaV
	gIVn+vvdMiX9XH9B0lmT/PNAlRbJf0/a/37jB9nxiga6wnWKUDgxmfWdcIFFgIt0suxTeV7rLBi
	mXnLVTm+wfhcISxoiDCVB6v3o/XZ5t+O96cyItKLXm+JgzLRaDt8G6NPCelBEun55B4OKi2c3DG
	d6RGwSdAmhFqR8cda519gWrvmLiRI/q7jAQ0drX9nlvGEBSVu95uGUX5mLLPj9wFgvZKSjYtoOg
	L8xuzRiYm8CVmqTn8i/LgH8hDJ/S2nFNZWlJolldZJ6XrQk/0+1DS8wQhzaI2mz561wnqNJ+LL+
	QhEqe29FJrm/awO0D/5qVk6TAqoakE2/y2ST4n8+SZbWG9V3GDBkJXh+2wYxZiZ69Kyh6gJ60DC
	krsT3cm+r54L6pSBB4NBsOnlH0C3CmIt+KvBXHA9mLMnPZGViW6/t36Rl8jE7AStLjBVjdsYoUE
	H4vfg==
X-Received: by 2002:a17:90a:d2ce:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3966d3dc5ecmr25814435a91.10.1787802732642;
        Wed, 26 Aug 2026 20:52:12 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm20222630eec.5.2026.08.26.20.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:52:11 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: hverkuil+cisco@kernel.org,
	kees@kernel.org,
	linma@zju.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	stable@vger.kernel.org,
	syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: dvbdev: fix uaf in dvb_remove_device()
Date: Thu, 27 Aug 2026 09:21:55 +0530
Message-ID: <20260827035155.10725-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822112256.12346-1-jeffinphilip14@gmail.com>
References: <20260822112256.12346-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 16:52:56 +0530, Jeffin Philip wrote:
>In dvb_remove_device(), dvb_media_device_free(), device_destroy()
>and list_del() all dereference dvbdev regardless of its refcount.
>Thus, if refcount for dvbdev is 1, it can be freed and we
>operate on freed memory causing a UAF. Fix this by moving
>dvb_device_put() at the end of dvb_remove_device() so dvbdev
>members can be safely freed and assigned NULL when dvbdev is alive.
>
>Reported-by: syzbot+37578f730d38898f4b74@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=37578f730d38898f4b74
>Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
>Cc: stable@vger.kernel.org
>Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
>---
> drivers/media/dvb-core/dvbdev.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
>index d753d329502a..9aa4b8fd7379 100644
>--- a/drivers/media/dvb-core/dvbdev.c
>+++ b/drivers/media/dvb-core/dvbdev.c
>@@ -598,7 +598,6 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> 
> 	down_write(&minor_rwsem);
> 	dvb_minors[dvbdev->minor] = NULL;
>-	dvb_device_put(dvbdev);
> 	up_write(&minor_rwsem);
> 
> 	dvb_media_device_free(dvbdev);
>@@ -606,6 +605,8 @@ void dvb_remove_device(struct dvb_device *dvbdev)
> 	device_destroy(dvb_class, MKDEV(DVB_MAJOR, dvbdev->minor));
> 
> 	list_del(&dvbdev->list_head);
>+
>+	dvb_device_put(dvbdev);
> }
> EXPORT_SYMBOL(dvb_remove_device);
> 
>-- 

Friendly ping, let me know if you want me to fix anything.

Thanks,
Jeffin.

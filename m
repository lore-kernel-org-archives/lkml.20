Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E350EC11
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161627; cv=none; b=Vi5ssJR5UrIn54IPHDv3QLeewulvxxMgYYWWRmbSvqL/knH9ihHNSK4UPq5/wW7Sma+mT3r1CD9hrS7SIn1556qY3wC8g2G8iKNdmPBUq0TKVQlT6bjaH3vSI8DP3KuXbSe/EZ8fpZi6+Ug+V3xaT18j58YQ5dYqEBZvj1w9Hfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161627; c=relaxed/simple;
	bh=X/a1c9AObFT16Ev2KwOXO/4lc4TSMFYD1lfCIyt6wWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dogs0fSVoRhsDsDF6M6xl9ZslmxftVe8hxKkRKsCqyZF8P199FjXeWesun7R7ztXIyJiVGA+s29gLWe+1rjvy1hOsHFQnuaLCcSyfw49pNj3zcySnmczbavXT6qBmrhjEOplJV50Gz5nNszvf28YcaQA96wdr7lTNMFfbLSNJQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6Xk/qtR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=APh5LUZV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6Xk/qtR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="APh5LUZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789161625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rraEjiiy4l51ce5bMczYGMJpLu6aXZqS301wSkD3/b0=;
	b=c6Xk/qtR0xhCxqq7c1aQnLpEJJsObY1SWStlbZgUs8SYKOTYNB1b60lM03+rdlCcokkOL1
	9G36uBpoAZUnuAenJq/aSa51SJ4iVTwTig4jqnJYjeil1qb6DJipJBPL6UUNSZSHUSyW3I
	J065Vk7/0ImdiedCOA7FtHi8Kv/Ds5M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-MxYqyRPhMGeptZL0cZaAVw-1; Fri, 11 Sep 2026 17:20:24 -0400
X-MC-Unique: MxYqyRPhMGeptZL0cZaAVw-1
X-Mimecast-MFC-AGG-ID: MxYqyRPhMGeptZL0cZaAVw_1789161623
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so9493085e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789161623; x=1789766423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rraEjiiy4l51ce5bMczYGMJpLu6aXZqS301wSkD3/b0=;
        b=APh5LUZVr6/wiKAvZUd5Si/RqaoG4F6QM3RQWqiyVCEdeHwrS8HdO1QPLuzsbUlmqO
         zAgeTwomGTf35I01FOEeNWi27iPAthsfLRT/vMjp4p3+eB2322iKE6jioRYeu9qwSKqq
         cgaW9fJj3dlb74PTc1WGW/MtZc7/LxOUPFhm8GeNVcXdtPlXlnz8kanIy3gNesb8Fp/S
         VHTKRzb4kvNDohK0oI8pdPm5rgV/SbVP6JJI/zh8acAJmH9rtQGI75gI/1cK0C2+4bYq
         cY+PyraLdG49ocnGklj12Ls/QWCkDaISmYEvpBqzt4kkSME3B4NlPXWKFqmaFfR5aPCS
         vNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161623; x=1789766423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rraEjiiy4l51ce5bMczYGMJpLu6aXZqS301wSkD3/b0=;
        b=lXPvjY+519uLknHZ0//aaAHRBa8awZMLbdWtejxrzM85Q7JOWkEV9N5htw6T1NjvAB
         OgRc/c1ES90xEDp25h4fhjB1E4Ib9Yy0QoIFIzrxbfx2SNRU8ND6TQ2DBuZBygnt6wzS
         ZF+hmbUENvz9k5IWCkAzGjdlXyY2Y4/e76+JE0SIcWyOA3vjYwQ4VPfoBOGg0XARBpl+
         qvAMC+e5LzdZKAnHzCmt4GEKM9yqWdf+/9wzijjtLgu/oHoaH/3sqk6cUyPg1WZGv/PI
         aIM7dbAQecX0043ZzagVDpQsWNMQMw0S/uvwwgAJQe6zak5nuhfgwHXKSQrzkaOeFJ6g
         kGsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNjHnBMxELDgj7NN4PDJ8/LcCZBGv2jJ0qYXAGkXUIYa8P9+90tFAHq3Bc2C5jxN8G2/B0bOlpmBdniY8=@vger.kernel.org
X-Gm-Message-State: AFuF++mwuSsKWRqOOaNNcBwxJwDL9J4eC7TiHwSVa+dNZCadVyr413zt
	kBEQGrp+tjFEotVisn/aG0tp8SLNrCYQyKfBjgqF9Ah0SWyI4dgZxU8XbBq0aMaeXsX5nPwrcVH
	8tjLpZiHZWHhJZIY4bm99viRhRvGgskf0vPFD3m90HqiPVlgb4G92pjoO5sMvRRkRDQ==
X-Gm-Gg: AYBFou137Hkcn2BNBRXBsypH5e8zTh2SkXbahGGU2+wN4eWPpYqCa9omhSmk9JBFpbg
	I4nzKbMMT8WSupIyhQZPl4TpLSKq8vVIUjWyRDVqrDBIOuU3NebKqJ5ap5RUOYdP+2MM7nVEe/q
	Va1ZDrZeQpqrEkzhJRspeO+gGCKusOoj6aGw5Rl46iynX7cHyLLBBC4ZSPZVaTKu0EM/SGC1pJa
	G3f4xEdR/M3wbFvGXVqY9sJJ8a7brdTJ/qHU1YueeJ+2hQsaIbFZDGndDY4z25rhaFZFAiXPiq1
	/+lMx8H6WiFSKQ8nAmg0kxtJRop4iNERp47s2wRtMBFJZM9cbN7RHjiEX4nX9ehAia8=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr82101615e9.20.1789161623194;
        Fri, 11 Sep 2026 14:20:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr82101405e9.20.1789161622739;
        Fri, 11 Sep 2026 14:20:22 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm86381105e9.15.2026.09.11.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:20:22 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:20:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] virtio_pci_legacy: drop callback sync on reset
Message-ID: <572661b65eebb784652e5843944d284bbceb2954.1789160982.git.mst@redhat.com>
References: <cover.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789160982.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

The virtio core now synchronizes callbacks after reset,
so the legacy PCI transport no longer needs to do it itself.

Assisted-by: LLM
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
Changes v2->v3: split from v2 patch 2 (legacy part only)

 drivers/virtio/virtio_pci_legacy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index d9cbb02b35a1..8115aa39e01e 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -98,8 +98,6 @@ static void vp_reset(struct virtio_device *vdev)
 	/* Flush out the status write, and flush in device writes,
 	 * including MSi-X interrupts, if any. */
 	vp_legacy_get_status(&vp_dev->ldev);
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
 }
 
 static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
-- 
MST


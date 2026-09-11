Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90B4AA56D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161614; cv=none; b=ccR0KUGcR7MyZHQGcxa4Xf6BwMUHXXK+grBapJEv59eFJ0Xp7Sh/A8XQ9/rVpwSiwqa3RG0jfr9IsFped1XuUYKMB3pOex/cdbdtj05zXhTxUkVVV7NI9aQy1ks5C3B8T5qTN5C1GFHU/c/TG3bRmA3ewbZrTofBjXF8an8Ors0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161614; c=relaxed/simple;
	bh=/9FF5fmnYmsdPuZ3HFtP7Y+pDjKKXbLbEbhwpauKOXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM5G4AagpqbTl+cn5/DKbgmC/tDMG+g9McBhIXT43z/eHinqufcQrLtKVfe4rYTYFZKrJ2qSJZmxa11byv7O9xiyXEzCAHnj2Cu0ZbTg5KOVdsHvXi8xoR6HUTKdjC6Sj1nDWyij81XMwLpC4Qdkh7mZQX/NHdGKBEXkE3k5o58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eunEb5m5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K4TyuEHS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eunEb5m5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K4TyuEHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789161612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pV7huyjZiJZG4cWVrdUKjI6VdJ9E0y5yBTEYPT1U8tw=;
	b=eunEb5m5Y3iXD4C1geqrRdAyp2+DYeFC0pT/laXc0xZ+malAmD4z703tMXG6qylNDr4x+w
	8K4CcadkrgaPKfM6MGy0UJdztz8v07qLrzjDMKi801YGcQcAUl7uO8OBgaAFGeKoveKyE+
	xyUEIGYIxSSYbpT6TodUZsdJNXbvBnE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-YYmfD8-JOBCal8U-xewRNQ-1; Fri, 11 Sep 2026 17:20:10 -0400
X-MC-Unique: YYmfD8-JOBCal8U-xewRNQ-1
X-Mimecast-MFC-AGG-ID: YYmfD8-JOBCal8U-xewRNQ_1789161610
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso692772f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789161610; x=1789766410; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV7huyjZiJZG4cWVrdUKjI6VdJ9E0y5yBTEYPT1U8tw=;
        b=K4TyuEHSn3FTc5VIs6MF6tY6a5OvJv5A1TBgAUdeE22+EJcHoSG4cOWRO3YDFNP0yH
         GVrMjvSebf0iYrp1SQ8jdsaTeHAu59zOW3DDH9oCwWzQVxg2tlvAJW50hrg3wYlwUp2s
         5IMnwsSIJAiRik9gpNmJ/s658H9wvs+F3Hvu74NSFxTdJ7Ye3cs/a/HaHvwpemzIqi7s
         q92ixuVFpapj69nu2X8O6D0EQOYjj+TyCL73lP1byzAwVl6CYpv3ZOyqqSjnoXJoKs1z
         A/VQPfIR0cStInIvWP5PFLdBwOWxmHbCjdyV7h1hpmu4LzqgJGvKzRAMUr0vk5pWn+Nt
         5dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161610; x=1789766410;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pV7huyjZiJZG4cWVrdUKjI6VdJ9E0y5yBTEYPT1U8tw=;
        b=Q8VosBW/TnCRuwY8OIMVyhQLBE/kGN60OsHoGYcg4zeY66Gqhu0BWIbt4z8ET8GQt8
         g5FNaiSI6iNIU2sI7Tw/NEKlPdO2RF3cpit1trwK7bKjq5lSa7qU5oYqiOyV9YJ6Z0HP
         FpqmGmVzAP99gb49qjp+YneN17ZgrItplhCB9JpwX+yI73ON632jSKsniCRxA7BAqoxb
         74mEH3ZYI8FGbYJcUtXiGU4kIeUnchpKIRSfwHsI0xYQs9otxpCT+CPc39CF0crdKnV8
         WKH8tCsVcr/HfBn3oIrtojWiuXBc39eRbA+oV8etNpY/g46X6TXHvxEV3JrFkvPGkTbV
         AXgA==
X-Forwarded-Encrypted: i=1; AKwUvBz7eO92VtknmpKpVCh1Gs0NOnSEACAy2g6CAxW8es5oAI4FNQBxFFbY/2pcQ7pLbmrL71VQtDbHKvgn3iM=@vger.kernel.org
X-Gm-Message-State: AFuF++mZOllj/iJusZHA8SDXRzmlAjD9RuLHgVOCSheAkru7/fNv9DS9
	cul50/VlzpQL4zWqJwOKgDbN66+Y/8NpOhbWqjE8YmD5sW8pwl3bmv8kdDIA9cYw+bjg+gBgMYg
	fErfGDAOC2J6KIGuJ4EAmabfoz68yGRvpYouGYnohjYnDXaUSLwHaz8VSpSabsirSwg==
X-Gm-Gg: AYBFou25gHk1rdCp9o4lwiujQ+njRZ+cjWsnaYQr5/KxOlqDZhOXNe5O99P4IBhYzhz
	9ihXlfaqc1BU1OQVmw49fc0dJQyDExAAAjk2/6kZgzsYC8P7j6AmwLgDqMg45NJI+HS/LgHgv97
	6kQ83RkhmAuhA33/eGD5LrX1Kn/IIJmKrQvncE5JYCUxH3Lt9Q96FXvgu/hmhPtFtr5Zv40wjsI
	KD+pY84325VVE22m2TGxnRVDwvWF/bdM3rTK0VC4HE+RmePnYDwmijQq50i1S658+BvkUMPjXFB
	ZZ8oYSddkSo3MJ1oUFp3a/A+p4DSXpsA3Rrz5Qw/j/SnjNXakAcSdpePq4WXwSu0m90=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr119115725e9.14.1789161609566;
        Fri, 11 Sep 2026 14:20:09 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr119115275e9.14.1789161609057;
        Fri, 11 Sep 2026 14:20:09 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm181919475e9.13.2026.09.11.14.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:20:08 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:20:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] virtio: fix callback synchronization and avq cleanup
 on reset
Message-ID: <cover.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Two issues with virtio device reset:

1. Karl Mehltretter reported that virtio_reset_device() promises
   callbacks are not in progress after reset, but only PCI transports
   actually synchronize callbacks - other transports leave a window
   where a handler already executing keeps running while the driver
   tears down state.

2. sashiko reported a race in virtio_pci_modern: the avq interrupt
   handler calls virtqueue_get_buf concurrently with
   virtqueue_detach_unused_buf in vp_modern_avq_cleanup, and there
   is no synchronize_irq between reset and cleanup.

Fix 1 by adding virtio_synchronize_cbs in the core after reset,
then dropping the now-redundant per-transport sync calls. Fix 2 by
moving avq cleanup from vp_reset to vp_del_vqs, which runs after
callbacks have been synchronized - and is where buffer teardown
conceptually belongs.

Changes v2->v3:
    patch 1: unchanged
    patch 2: split from v2 patch 2 - legacy part only
    patch 3: new - v2 just dropped the sync from modern vp_reset,
        leaving avq_cleanup there before the removed sync. v3
        moves avq_cleanup out of vp_reset entirely into vp_del_vqs,
        fixing the race. Adds NULL check for admin_vq.info needed
        because find_vqs error paths call vp_del_vqs before it is
        allocated.

Michael S. Tsirkin (3):
  virtio: synchronize callbacks after device reset
  virtio_pci_legacy: drop callback sync on reset
  virtio_pci_modern: move avq cleanup from reset to del_vqs

 drivers/virtio/virtio.c            |  2 ++
 drivers/virtio/virtio_pci_common.c |  2 ++
 drivers/virtio/virtio_pci_common.h |  1 +
 drivers/virtio/virtio_pci_legacy.c |  2 --
 drivers/virtio/virtio_pci_modern.c | 10 ++++------
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
MST


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D53C9ED6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209020; cv=none; b=hGCZDRKvJl0mRWvLaTD9gpbx1U+42NjB7RHzBx2HRD+lQ+ywkB0kX8F+nMJ2nYWwl2L9GgMMPoxPfmhDhow05EebB7Vvfa9zdQ4pW0zFVGyfip9QEz09SO0z3pyoIYIJzL8Vp0x35EP/1igpWTMbOcIezu/414ZZw6EMjsv45Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209020; c=relaxed/simple;
	bh=uidliuKGHw2E/ldvvPAHKDIwXVmXlX9yLSj8Rr6/5q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCFdIGV4EUGLPgNUsbju9PWnaLJkqsxlDvfVE/RS5AjEvnfzOsdiCf1g6Zg7HszTwKrlHv3DpfwrecpDRp/Cf7u43Qh/n6svzS9tnNcZoanfcXE9HORibyAEhV/fN9B1KVMqgQwBdExIc2YlEVXF49g8bvieQ8NbwzUe87CqTfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ehIKw9AU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUwKAq2O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ehIKw9AU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUwKAq2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789209017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=tKE4fvWSK04nXM2Txdsuz1dl1KZf76ZKjdSpilIXM+w=;
	b=ehIKw9AUG5XB2iCO5/p9yki0KcPNKBGQriw0QzkwCc6rzfn09b09qbe4o6XkzNbbFKUY80
	x1fA5JXqvXNfVB1KKax+0O2hOxndkGGTucmjC7MpW6CKn7KzEqBHVVRGQz5ri34s65HtwQ
	Vs7k8/E7zoSOAjKx/8Oz/qe21phVr/k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-orPAN5A8PSOseO-PSyP9JQ-1; Sat, 12 Sep 2026 06:30:16 -0400
X-MC-Unique: orPAN5A8PSOseO-PSyP9JQ-1
X-Mimecast-MFC-AGG-ID: orPAN5A8PSOseO-PSyP9JQ_1789209015
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so12906935e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789209015; x=1789813815; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKE4fvWSK04nXM2Txdsuz1dl1KZf76ZKjdSpilIXM+w=;
        b=EUwKAq2OrUEoU26Vo1hzpGbB6/bZ+UjwTtOd/RBE1PnqniYhCaDnxNx+08B6Z6xPAC
         PKn4D4xqPg62kWXiiy3C+fNd6Tr/bQoYdXK0l3Voq0Vk3jDRsdhLcsB2EhShCTzpP1Ye
         Li6kIU5FL1FXzDclblXYgqGfTgwe7aLPCUNPSn20sraq1ac/7xOFYyaulI8Q9Z+QF4TE
         KsZvhuK9lC2xWJ8KeGKn7zXYl1eVEH94788PUQ+Pfv9iJD4fNqNEi+KAFYw675g+01Tf
         nJAa3Gz+9Ax/3DHjZGa18UUeYIzvx48Fg3mm+f+DX7JbIAT4mjHhVWEG/bQ6Dg127DN0
         ZYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209015; x=1789813815;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKE4fvWSK04nXM2Txdsuz1dl1KZf76ZKjdSpilIXM+w=;
        b=rVAChuWzkcL/5cmYSNHQFxtuA/ettYqsJfO+AeLybJ9KuiUyKDHp5H9eWu/tK+HDjZ
         wBeQIlHgmnw7SQpol5nhKNxCQf3yEgZlmVZ2VWQvE+A0+vscZ+luc7TB5Nko+8HBMXTM
         6TR+4Ta9dBEBxXW4sZDlySSXux2BuqMCiExTlRb0NtYIMQvsyB7Cah1SYAmnOK5JyJFy
         3Xqgxz0CwllRS0Qqtw0Kl1g61msd9rtt+EbnsxTU9G8ZszukA24t1thpy2BOkzvg7aRR
         V7SdMXTwjLIV/FGHCVreTb4meX/3mzXNw1jXp2CI0urHYJaD+oqAXyPaVU0JyiDK/lpQ
         Jnnw==
X-Forwarded-Encrypted: i=1; AKwUvBzbmUWzqUjNyj7qrdpIfmwCGFavmWsre05tW9NSLMHmVdWsXTbAaWV+kL3TX3oO0igWat+4RHEIQJR+IIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nSMMAAVLOg3wCqPOeZyy36hVxATps+TqPs5Jf+M5XErLimtmQk
	r4ZB8R3w+p+TTyAc+2GvsCXxhHFtshh2ZPGG/JgK3jK52QiFau2UJODyYEYsAgfHFAv82XGV3MV
	mNIP4bm+GC2cLYFdls5QRy6ZAlWiNLEG10L6wD1Q9P/QtS5wWPkU5M/qq+DvIzlgJJA==
X-Gm-Gg: AYBFou0Wz4Pz3VtAfM6I4tuRgLNoC7vIZqgM2NjitT9N7zJk5iJCc8tOqSQTll63QOr
	EH9hHpC0s+SaXS5sjiICXJGfO058WcUHaDjap4n1Zc2ZS2SKCCImBP20cIQQOYDSoMk2NBIkOFd
	CprKtCSLX/hVFo9rz9n7TaiwiCtt98ISVb2djKj6V5kG0NKQkKo0afrpAX/PQptPoLdEGFESPYA
	wYcU44Nju3iXfxnXV20SqYgFslOmMVB6KmnaMecMzxw7vO2/VviAheF3ONDREVhLgwNOfTgi1ne
	ZPrcT0xNOgsafUesqgc9uC1XSK8wnP+I3c8NuF1+WL0ql0ybj26SqkmMospBSJtvGvY=
X-Received: by 2002:a05:600c:138c:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49e6cc078b0mr17506645e9.25.1789209014712;
        Sat, 12 Sep 2026 03:30:14 -0700 (PDT)
X-Received: by 2002:a05:600c:138c:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49e6cc078b0mr17506075e9.25.1789209014057;
        Sat, 12 Sep 2026 03:30:14 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm12850975f8f.23.2026.09.12.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:30:13 -0700 (PDT)
Date: Sat, 12 Sep 2026 06:30:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtualization@lists.linux.dev
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	jiri@resnulli.us, kmehltretter@gmail.com, sashiko-bot@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] virtio: fix callback synchronization and avq cleanup
 on reset
Message-ID: <cover.1789204858.git.mst@redhat.com>
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
moving avq cleanup from vp_reset to a modern-specific del_vqs
wrapper, which runs after callbacks have been synchronized - and is
where buffer teardown conceptually belongs.

Changes v3->v4:
    patch 1: add Tested-by and Acked-by from Karl
    patch 2: was patch 3 in v3; instead of moving
        vp_modern_avq_cleanup() to the common vp_del_vqs(),
        add a vp_modern_del_vqs() wrapper in
        virtio_pci_modern.c. Split out callback sync removal
        into a separate patch.
    patch 3: was patch 2 in v3 (legacy only); now includes
        modern transport too.

Changes v2->v3:
    patch 1: unchanged
    patch 2: split from v2 patch 2 - legacy part only
    patch 3: new in v3

Michael S. Tsirkin (3):
  virtio: synchronize callbacks after device reset
  virtio_pci_modern: move avq cleanup from reset to del_vqs
  virtio_pci: drop callback sync on reset

 drivers/virtio/virtio.c            |  2 ++
 drivers/virtio/virtio_pci_legacy.c |  2 --
 drivers/virtio/virtio_pci_modern.c | 15 ++++++++-------
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
MST


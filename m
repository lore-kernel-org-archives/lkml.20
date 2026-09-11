Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA9390C90
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130265; cv=none; b=D3ZOFdzTFuqO5pa2XHphreK7KErnaB321ii6iABfEvIH+J3xymi/uYn7+6J2MyoYjq3RSrZP9hj/kWuwTAsOEUku6mJSykEfC8iWr0/Mv7Ff0a87vZ1iiG+UMEG/1KBXYUBVcYVxAjl5ehVjinwa/PFULpZX3hICUXBlnXslakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130265; c=relaxed/simple;
	bh=KpRc4cJbkwkmh5HrpghW5jngw42IRWT9s8NB45nt8q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5vZUx5xzP4bS7sWUO5ZTnRNutVhq66/+nadVpJBRzLcULClXLHMfJsvVH2tXXEyt+LILuWgYGwYPSyr6xy/lgWNKPlO9Kan54ttIIvhJlWihbI4voFvHhHbXBW0jtoZ95C+DYg0LPg5CL0cKH7MCOByR+CioIBChNc6u03eYrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UM4zQkVK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sXmIHfyG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UM4zQkVK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sXmIHfyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789130262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QX5fEdW6ISh8Lzeqap4wMGZyyUxBjtTVcogMT03UXsw=;
	b=UM4zQkVKM9HMEiN2biDfwKilVxK7rjgb/mZbvIua05+nx2YmD2OgXHBGQg+7NvndMN64+s
	1S1E2UGSZuM109hMgw2f10ifHNvBhaoRoXq5H+a/PG9HF0vF1NnfUQxFAg7DpIQ4lmApZ+
	bwHUV8QQEqf6a8HknXUg3PeFZNGMG0c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-j-sPbOhoMpqTat28pC3Lgw-1; Fri, 11 Sep 2026 08:37:41 -0400
X-MC-Unique: j-sPbOhoMpqTat28pC3Lgw-1
X-Mimecast-MFC-AGG-ID: j-sPbOhoMpqTat28pC3Lgw_1789130260
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b8c651ac0so12118175e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789130260; x=1789735060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QX5fEdW6ISh8Lzeqap4wMGZyyUxBjtTVcogMT03UXsw=;
        b=sXmIHfyGmluyVOMGTVYHWuYMvNPw0mGIFGp/BbuuHcj2Hya0d29GwilGtFZtXBk8dz
         oRAvMVajr1+j9UQId5EJ7lterm9OBHJCJ8EZTFgBgZJ5+hePdDU1dQkeL8Od/2OHtLDV
         GUyKKzz5+JEZvSDe7ica3cE5lRNCL1uW/NKu0CYd2ZQnAyHsx56FujySvBxU8J7ggPsE
         5HADHaYJoTRXgzqPhMB1NXRIGX2KL8de4nJ0m/kVU4xG7PhgqD+uiEF58u4B0ZD0Ls7u
         Tnohm/OtHBU9T4sYritSfOekJSoFSVgMCuBmRKNIuItPodXTca4p/3KspXNK7qq/2qFw
         oxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130260; x=1789735060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QX5fEdW6ISh8Lzeqap4wMGZyyUxBjtTVcogMT03UXsw=;
        b=KiJP7amXLejc6uEsE02kDk3Dyg9vcdHO5OJLQm4kXxlv1AAapt7aQHp10zOta11SKg
         sAOewSL+NJW+iztY7T7T78hELaMlqWyqC0c2d5VH5rcdKnbsxDya9n14Jh4Q10hHPxCh
         aWuYZDoO8bsly6NCsVrSfUJPy3P6Ncdvma1O9CQJyXPaqnEYIMx9zu0pRwu646+SdXeS
         Yw4D4duH1FgNEpYjNoAonzjzv/nnMm8o4UtD+EtQzMYYMSvvfnnA3mJfsp+UPN5IgBZF
         B32mBbRksxs4F7qzgcSqiMh9suS7wQfJDhkyLzwQzUfAP4t1GcMMGtE2yxr9N3K6EGYD
         8ifg==
X-Gm-Message-State: AFuF++nLDja0T3pT5OzA63lPpEYvE8aZAe5iqa/ZBF9VkmfaIk6V38I7
	bl3PnGI13JLvG3dSf+yHaYFGP9IYn9i9zPvVIxNYa02ntAFDOHUkDyXozZvXGgTZ7as/uu/XWS2
	Pt+6JI0AH2W7kdOs4HqYI/PRqyiJp2h9wB6ad2AERdclK3+6UF1gQlyE3trcOzgsuMtVQRDFifY
	hMDcv8SgXHuL9JpW4B/ETZdGAHvgEvqGOUY48f8wkz26o=
X-Gm-Gg: AYBFou1CS7QetGRmtzl1ebHqdhRWLe34a0sT4kcxF+V5nrhGP1dEXsesTsRXxvc751O
	OEehMFuGzUSFh+wc+EhOZR4ulFlLg7JwDNB3V6qIGX/aOR14DwVAahePHsckAU6DbEyn75jgYZK
	AFFnHHU/zbrjbiFiY7JOjIbdXkbyVckZc4BirhlMVgfjqAZYQGnz7yQulahWG+LWlgvojZoq7Ru
	D5R9FqhttH84hMkQ7hwqujDiLq0/zrL/1rLN+EKT5jN99MJb/P+IEs5yr2MtGVxzl6iuf28AVIE
	gMrYDxm9cLTvV8NvaIOdRIZTpCB86YFKvrheYYOrH8RlTxYkFvBBhmIvl2jjbRuzFaeiDBRIquK
	W/avuXbYpTBltzf4hCkUXlN4=
X-Received: by 2002:a05:6000:290f:b0:485:a394:58ef with SMTP id ffacd0b85a97d-486eb2eb3damr4418987f8f.30.1789130259798;
        Fri, 11 Sep 2026 05:37:39 -0700 (PDT)
X-Received: by 2002:a05:6000:290f:b0:485:a394:58ef with SMTP id ffacd0b85a97d-486eb2eb3damr4418934f8f.30.1789130259157;
        Fri, 11 Sep 2026 05:37:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5862959f8f.31.2026.09.11.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:37:38 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:37:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev
Subject: [PATCH 2/2] virtio_pci: drop extra callback sync
Message-ID: <082fd9b2bad1db0088caa38a8d738aa848bf36b2.1789130213.git.mst@redhat.com>
References: <8f71425918a148dcad1be993ccabd39582d246ee.1789130213.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f71425918a148dcad1be993ccabd39582d246ee.1789130213.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

virtio code synchronizes callbacks on reset now,
no need to do it in virtio pci.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_pci_legacy.c | 2 --
 drivers/virtio/virtio_pci_modern.c | 3 ---
 2 files changed, 5 deletions(-)

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
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index 6d8ae2a6a8ca..c9e21317c51a 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -559,9 +559,6 @@ static void vp_reset(struct virtio_device *vdev)
 		msleep(1);
 
 	vp_modern_avq_cleanup(vdev);
-
-	/* Flush pending VQ/configuration callbacks. */
-	vp_synchronize_vectors(vdev);
 }
 
 static int vp_active_vq(struct virtqueue *vq, u16 msix_vec)
-- 
MST


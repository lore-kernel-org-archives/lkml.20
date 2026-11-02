Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633830;
	b=5aq6YcpOtkZ3gWhRf9ucB8FA2dDnsHQ3FFs2V7Gn9J8evbeBTO64bMr+vVlImu9e6ONl
	 38RR2lsMv40yeXnhDKjgXXpgeO16pNXMT+C8L9NVlF61rrHGsYhNkUz7HqwzFoPW98Hz3
	 pDYuz1jvN62rATUy/X+MvQzMsAVhWtB4zV06A8chOWwjdElo0KMZYuBFZBUwkW/hDE7Xq
	 VFmYfRSWfAwV/K96x9wVkas95avhfUJKowsk8aO2xAOY5V2xq4szjKhFix49+5q64Xzhs
	 LK5mNLEEKR0rc7AhzzhQtJ7ZmF3TI2WfRParEVDohaWphE8O80kc4/a6Ae91crT6t6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z+ppaxYmKgFAGGAkOJ55j6j/Hm1uYafLIHrUuvA3BIk=;
	b=dN++TAgRc4jedi6Innjf2BQoDFqHEG/2nc6XiC221NNvOBe1pT0wtd3qaXjeTJpNOFWQ
	 PCUscsptQeky34RceurlZhimWX8gGvMBlmYoc7tztPaHGoOR9F8MhqYH+0ovwcMAuBrUf
	 4hJN2HE/n+3m5NJWuqVRSmjiTOYs8XodIAXnHg+HInordfSKx+1FpFZ9U+81gByzemQoI
	 WHo8YXCYpELuW2OKh+Z3Mc//nur5/sfDmXyWoCrGp+VF7BlO8woMPizJY7i1j4S0qXf97
	 ggcXC5rRZnuLVhI5OB4vITViHjNTOpkenmCcK+2uyRR8AafD0lm76O0fRQA+I4E5FRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHPknbIb;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A460E502E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 805A460E502E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHPknbIb
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e869e00005so49835095ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633830; x=1794238630; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+ppaxYmKgFAGGAkOJ55j6j/Hm1uYafLIHrUuvA3BIk=;
        b=RHPknbIbBuIHlHHpM+0mhs9tS8/MLTkheddYOkdNGOyFLmEGT944Vj4CKBLdx0YaJu
         Dev5zbaIf51qW40wRu0B7H4K9XVtl+vkwOM/eW9w+GCgSmMhvQrhhHamlfL9Ao/lFjW6
         Z/8apUu85BYGwHJLBcr8YTGnEGeW6gU4s/np3+7VkJ2p0adAqkIqX6r1EThLrmWkG5oG
         wwLsnsjXxqYlhBUPiQCDNldLCi3yeQ+TWM87/k82MUS3u+/Je5RNYTYMPpJF/+dhXuXk
         SSjvXJFiPF/DZO2+R9mQQ1Rjxvgx6qJKTi7fqJhV2SN5+GEUOyN1lJuBkcUJnGU7ehAo
         r9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633830; x=1794238630;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+ppaxYmKgFAGGAkOJ55j6j/Hm1uYafLIHrUuvA3BIk=;
        b=Hhzxitd5NVHbH9tLuCrXhTqEZ6gLrZHKVAZiJZadZiZf+4NmVO/IDD3JswvjW18KtB
         O3Ar8B3AEZWyXYISLt8rROK9VIZR3weANUXN2IeUV2TZWTuNLz1LHI8ntfBnW00GaHgB
         sYl5IdPr0kz9EfqtIXXGNlOP9AJIwSErkuJ2V6+X+14X/GhW2tOOAZld8ydeymZl3XP7
         Qa5g4i7S8mA4kK9y5ibYDNSWAA559tLQw1Gzkk04aVxXGGxchp8O71Cfouw8VuihgYn+
         W8vabLQrKwgI6UaZHqC9f1khRbpXpsLn27maXi0fOr6KAMoE9TpqhTpTrlfseTxEgf6Q
         A2Mw==
X-Forwarded-Encrypted: i=1; AKwUvBzwJBsBbQlTFST3SWE9YTqQv6weH0GeEM08ddl7Lov3KXK8wuXjfkDA7zbf14ZCb8JooB+EXARXMofQ1V0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xIpAtARWIFgvruP4NqEj7jRxfjG86zpH1+mqAjICEf/TWXPMg
	nru6oYUUw7r7n5yQwkYo0odJVbTQq3E1UBxJVfXgAFDvYZ/9wGmrA+KWmuUOJdbpSqiyOkSPQVW
	0rRDkEKVIMw==
X-Received: from pgca18-n1.prod.google.com ([2002:a05:6a02:6392:10b0:cd8:b247:58f0])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:134c:b0:3ab:9c73:12f
 with SMTP id 98e67ed59e1d1-3ae897ee533mr8958349a91.24.1793633829608; Mon, 02
 Nov 2026 07:37:09 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:38 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-10-vipinsh@google.com>
Subject: [PATCH v6 09/27] vfio: Refactor vfio_device_fops_cdev_open()
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Refactor vfio_device_fops_cdev_open() to use a static helper
vfio_device_cdev_open(). This helper will be used in subsequent
patches to support opening the device file during Live Update restore.

No functional change intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 23b229468151..d83e99137e1a 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -20,14 +20,8 @@ void vfio_init_device_cdev(struct vfio_device *device)
 	device->cdev.owner = THIS_MODULE;
 }
 
-/*
- * device access via the fd opened by this function is blocked until
- * .open_device() is called successfully during BIND_IOMMUFD.
- */
-int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
+static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 {
-	struct vfio_device *device = container_of(inode->i_cdev,
-						  struct vfio_device, cdev);
 	struct vfio_device_file *df;
 	int ret;
 
@@ -46,14 +40,14 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 		goto err_put_registration;
 	}
 
-	filep->private_data = df;
+	file->private_data = df;
 
 	/*
 	 * Use the pseudo fs inode on the device to link all mmaps
 	 * to the same address space, allowing us to unmap all vmas
 	 * associated to this device using unmap_mapping_range().
 	 */
-	filep->f_mapping = device->inode->i_mapping;
+	file->f_mapping = device->inode->i_mapping;
 
 	return 0;
 
@@ -62,6 +56,18 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 	return ret;
 }
 
+/*
+ * device access via the fd opened by this function is blocked until
+ * .open_device() is called successfully during BIND_IOMMUFD.
+ */
+int vfio_device_fops_cdev_open(struct inode *inode, struct file *file)
+{
+	struct vfio_device *device = container_of(inode->i_cdev,
+						  struct vfio_device, cdev);
+
+	return vfio_device_cdev_open(device, file);
+}
+
 static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
 {
 	spin_lock(&df->kvm_ref_lock);
-- 
2.56.0.317.g454f8302e1-goog


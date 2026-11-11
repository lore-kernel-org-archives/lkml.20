Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425058;
	b=nPU4TZ6rS7uxfN+eB4PaPHInyyuFN6bwn2gZdKfWdj3CAOEzdHSxGdHOUjgpSKF0hQYj
	 o6cK+IFcw9/Xb3EfLNyJjz5L3ZgWXeiDPtTpykIca49ofGX5+7SYajddReLUu/dhayqiT
	 hHwebbFi4KJSd7xt/aOu7z254bW6z2D1zQFDaeOOiM+laYAiNhjzEOhnS0u7oz24L7Dc1
	 TzV+mPGGe+//o2MlSZiNCJg5KcjgZ6QShrJo6yHFFqN6XcFg7sfAvQof7XCAbS6g8aYCV
	 Oe6XuYf6O+9hE+yzjMHuDLhx7mJ9+ljXP/BzdeDUpq4/Pb2L9Ui637p+WTjRIQXoCiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
	b=UFCqiAoXlbzPvHwuwH7RScSlqtBCaGoNxYbEZKy+Ju4hFAtcSljqBWKHbkNJb8bASivd
	 ntT8ihkPtrYBwWnbJtOB8l4ZrpLdorRN+AEv70gamiXD9bg75VoumyFGsMtzy7K6fk/OW
	 yXPJwAvcVqfdnA9qi8AU4kow4ls38Dt8Z2vXU5B3iifU94o1S7pDQh68ka+LOjUI01z+B
	 G0ezgFuaDOtXeqfuMEdVGqzsC1eAa1aK1uorV2pgH98UZKONtfosddjJxN25Vkskv3L45
	 ldrnSVfGtgB3mZYLg9HulfWAOvhQ1oPf6B5oKUQNE6g8KJy73ckc38X0urucUYyPb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD4606A8BF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECD4606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KqDGXT6s
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f2040e10d8so2560697b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425057; x=1795029857; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=KqDGXT6sHwxeuWqo8YplC2Ceb9xg+9zSmZThwIsQvt2GedE/QEV6pbzsu3tpPxAEbt
         fqrdrqCJioAudnnhcPnpgu0LgJI1yN61YRZkFlgh4B3aZFjxfmiidRDIVL7fvLq1UVOq
         MvK9Ou3hPvxDpyg1iPrWSuO1kPKdk0MItTwB21eYhGOAu83p8l1FwjdL7G2xpl4EsPRv
         oNbOIZ5tZGO8pwExlshG31m5aRc7+6TLjfnGqIU9fzQQDPhc4iNA6o2m803h4jOHtL40
         QrV/hM01WPvp0ygNA8B2ZzQdG4Z+6lH1t9q3hekvBRIuhrUpss2kHVS6P250crF7pp9M
         vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425057; x=1795029857;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1gmqyzGXPZYxPfKkRYqwd2gnFVkzUbXgN8JNV1Au+8=;
        b=mTR4KPP53sH+IPrMLpCVWJ/oisTnkTlFzZdDTIt2cvG8u0KsYGFZX3Dr5tXvw/wr+k
         ro1/kW4xLtM00/lQqKqNpyIpJRxhaDWJ66qc3hBTJXLqQ8bLFv3awPUd48mzgvfw/wuP
         3xGeOrq10fHuzEjTRpnkis3MGo8VVjc9CV2lsHkAUAFRtaRy1UE0DlDdT/rAWcCORW7/
         wsY6w52oorH3a327TGc5I3ELxZqMJw5XelVeL0L/XE+Yh+yejJMzTkrOgEZi0qJ8aD+C
         afCY69x2PRpNmzqxo5jQBCOdyl+qOmYjVfG8Birhlf41vMlDG2uxyMQZCDPPwNmWdt+2
         Ofiw==
X-Forwarded-Encrypted: i=1; AL+hErF6WuuNvV9m2K90ux5zDgJieSYmeYq3xojkOaO8b6nXQJFKMSEXwW+2UoAqKtBlE1EtDZ+zydslcZ9JrLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WJL6nQi9tv3AwlkticGtw7BC8Cch/SiClaI8FFESVQ3lyaRKY
	q579i7LOognhKZ/qaiKy5WxY7tQ69P/+PdsdFskttETxsAZveR49E/q68u+2qXUcflPC98cuTT0
	B5dlDKlwFEmEheg==
X-Received: from ilbdx27-n1.prod.google.com ([2002:a05:6e02:421b:10b0:53d:3ab5:58fa])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1382:b0:567:f784:f939 with SMTP id 5614622812f47-56b9791019amr2605655b6e.51.1794425056843;
 Wed, 11 Nov 2026 11:24:16 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:05 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-2-dmatlack@google.com>
Subject: [RFC PATCH 1/7] vfio: selftests: Add vfio_pci_find_mem_bar() helper
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Mina Almasry <almasrymina@google.com>

Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
a BAR) of at least min_size bytes that behaves like ordinary memory and
can be safely read and written without device-specific side effects.

Detection is backed by a table of known devices, starting with QEMU's
pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
membar-backed=on.

Suggested-by: David Matlack <dmatlack@google.com>
Cc: David Matlack <dmatlack@google.com>
Cc: Matt Evans <matt@ozlabs.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     | 10 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 67 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index 007adc322c1e..19d458adba1a 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -15,6 +15,13 @@ struct vfio_pci_bar {
 	void *vaddr;
 };
 
+struct vfio_pci_mem_bar {
+	struct vfio_pci_bar *bar;
+	void *vaddr;
+	u64 offset;
+	u64 size;
+};
+
 struct vfio_pci_device {
 	const char *bdf;
 	int fd;
@@ -162,6 +169,9 @@ static inline bool vfio_pci_device_match(struct vfio_pci_device *device,
 		(device_id == vfio_pci_config_readw(device, PCI_DEVICE_ID));
 }
 
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar);
+
 const char *vfio_pci_get_cdev_path(const char *bdf);
 
 void vfio_pci_group_setup(struct vfio_pci_device *device, const char *bdf);
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..d5308fe61490 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -19,6 +19,7 @@
 #include <linux/log2.h>
 #include <linux/mman.h>
 #include <linux/overflow.h>
+#include <linux/pci_ids.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 #include <linux/vfio.h>
@@ -245,6 +246,72 @@ static void vfio_pci_bar_unmap_all(struct vfio_pci_device *device)
 	}
 }
 
+#define PCI_DEVICE_ID_REDHAT_TEST	0x0005
+
+struct vfio_pci_mem_bar_desc {
+	u16 vendor_id;
+	u16 device_id;
+	u8 bar_index;
+	u64 offset;
+	u64 size;
+};
+
+static const struct vfio_pci_mem_bar_desc mem_bar_descs[] = {
+	/* QEMU pci-testdev with membar=<size>,membar-backed=on */
+	{
+		.vendor_id = PCI_VENDOR_ID_REDHAT,
+		.device_id = PCI_DEVICE_ID_REDHAT_TEST,
+		.bar_index = 2,
+	},
+};
+
+bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
+			   struct vfio_pci_mem_bar *mem_bar)
+{
+	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
+				  VFIO_REGION_INFO_FLAG_READ |
+				  VFIO_REGION_INFO_FLAG_WRITE;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(mem_bar_descs); i++) {
+		const struct vfio_pci_mem_bar_desc *desc = &mem_bar_descs[i];
+		struct vfio_pci_bar *bar;
+		u64 size;
+
+		if (!vfio_pci_device_match(device, desc->vendor_id,
+					   desc->device_id))
+			continue;
+
+		VFIO_ASSERT_LT(desc->bar_index, PCI_STD_NUM_BARS);
+		bar = &device->bars[desc->bar_index];
+
+		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
+			continue;
+
+		VFIO_ASSERT_NOT_NULL(bar->vaddr);
+
+		if (bar->info.size <= desc->offset)
+			continue;
+
+		size = bar->info.size - desc->offset;
+		if (desc->size)
+			size = min(size, desc->size);
+
+		if (size < min_size)
+			continue;
+
+		*mem_bar = (struct vfio_pci_mem_bar){
+			.bar = bar,
+			.vaddr = bar->vaddr + desc->offset,
+			.offset = desc->offset,
+			.size = size,
+		};
+		return true;
+	}
+
+	return false;
+}
+
 void vfio_pci_config_access(struct vfio_pci_device *device, bool write,
 			    size_t config, size_t size, void *data)
 {
-- 
2.56.0.567.gdb80ae8cd5-goog


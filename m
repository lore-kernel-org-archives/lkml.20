Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424758;
	b=lH2MqGBN2IkXslcrSjGzZsR9orNoqyGPZ6y90600WPwihJrWV3GqvSllPtkNVeimtNqd
	 G/wTwBeNc19AaO1EXRWqBv2ywMLjTM2Zt7Kpny4mmqAhskf+zmWgBMZBmxRpLWl2BFx/P
	 Y12EXN4OLehECQgpbtGQikNbAXIhz6Q9ZUkhWwXQLVwgtn9LAT1QzaYxP0EdRR+4WosAl
	 Bof1A8V+SskIDJY3XfCUd88YtBlWTOXG2uJOjUVn628DQLm+JgVTkLg7aeeHCXTKIaHJv
	 AyZX9wdFbXRkwEn3WUgV9hq//Q8uZ7kM5+TESl5z5F8oKsYAQU65kbJyqEUMdCwZBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DNMNS9bjIlPpM4mJV2mBmIlqngWBVSFIpNHBbmVzyeE=;
	b=gAzT/MKuNJxw1fDAAPS/BCPzuxC+Ylygs2Oa/IL++f7bIA/ABL/H2vLue6ChdnDDRpYx
	 Ta4ODqYaVfinx31zdWrUBHidN3OWCo34MRLjMcQqgHP/2XT0Nf5iSMNanfvMCbt6O7psk
	 J8gilJ97CQ/gd2erDso9/tpgYpJnvpKCmwt3FEn2FRn3EljsPjyknaXM3Lqz1SwL9jMjS
	 ljaDuGVF0KXnNb02LowZybxr1HJjL1RnSaqAl7pm6rOoeUu6GJ66O46rAvmPYRXgDv4UG
	 hf8otiTUeCpHad5SaescF0DpMbgPm12imjDkeyl1K7UZbWZ2c2nPewdGzTfUA+nT8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rGUz/LH1";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932E606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C932E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGUz/LH1
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso25481836d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424757; x=1795029557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNMNS9bjIlPpM4mJV2mBmIlqngWBVSFIpNHBbmVzyeE=;
        b=rGUz/LH1Hg4ztzYnaz0kw8LJKtEtrnr0UUfOvAN67vVaber3yRKo/TYg7KU49P+wTd
         O0rMBJXbiZB8qiLv1xgXmLavkJ0q8MhHR3KHsqj16ZxznvXlu7pF2BZHeWRCLuJA4rfO
         MNjXk+rQE9F6kw3jSZJjar5Izm57pFLvQmD49TmYS1J6auglt1H5teqzLNqTZba2Mv0o
         QXmHhKwbh0TbRVy4fj+6lp+QiplAtz2MrhjaofBlhK/+uW24czwIWmgAfzV/t6GSYAB8
         B0DDCS/4WYC6H0mFrhJxRNyrgUnakvujrUUhk8Fv9Yg6TnR6x1WbRWJ73CgQU/boRfgi
         ve8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424757; x=1795029557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNMNS9bjIlPpM4mJV2mBmIlqngWBVSFIpNHBbmVzyeE=;
        b=ZnfFRt5hD2BXv0VSahQeQv/bh04tmsyn2hqPmFifKRFGukP2SrgSbqyGiWPv6hXiOz
         lhZfrCbhm5idYlIfgXo7/Zt0mIrKVTDH/S9t4fr6jD4i2jpLyuYIdP17nDH+HJeYIH7U
         /Od9Sc0mrFe44RSrBjZB0iXo4HbmcpZCyqAHsh+hl5gQDYqJDy4Yok6vLlXWOdYvxVMq
         WptJ4ekh+20HGRSNHj2CekGFKBfG2ttIggMR++jlGS/mm9Z/OrBAIWjwof/jpOXQ6HL3
         XfBrBvoEyZq7aprJftulpZC596Oy3gUddhYd1BLVCbKk59OEDrvAEV4RRHjary9TXL1D
         pGSA==
X-Forwarded-Encrypted: i=1; AL+hErEgky4b9HEagLYLmT7H/PDYmpsrWxylALt9eE8AT/FuJpGA2P5Kj8sh7kBtIuRtwvHGGHCS4oB5VRrlVzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x/HIJ5OX4sIjLuiBDnLpOq23twbXBvVCzRk/tgYUy36hVQCft
	N/mVgG6olUCj45FrNewA1YfnEAEkPm0c031vz55TdtIUWuqcuC+he8MU
X-Gm-Gg: AYBFou1nWYX+HzHMPhi8gaZ6uwWa2KObK2lFUgVuG8b0Hb6ueV/p+PpBfdrrOdyG2C0
	pDw6OHO//aLjtyWTXxhbysWrhuDCtdkPCADcb7bpkuQBTws/qYr+aS8J0mau4Sbhu/J7GIy/ObA
	1d398GYNHIIZQuOalfS+g1eD4OzqzG8ox2of/UCUmtWuJW6Yeh+RnO6MQgXtGtwisaNVcDmNCOQ
	A5FATUjCVFGu9UFLHERi0iXUan1FtaM/n79ivNoap4/2BEzoZ3/ci/7O8CXWa/rjSWxXNYqys6X
	5u1L00f/Ut9XyuvbNc2nsolQQP9AvItXCUKUgeCwr6526qNVocTayw87yI7tCbRTQk1BftmIMzP
	knz4974um+YLnSBkBM1KeOJ9agx3LbPqV7q5LTcQEFIxLeDGjNzQQ20ah5B2Ty3g/hQFODUutM3
	edRznajrSlxSVmDcfY9D8Gx3DONDBAUztAslGcKnIc9btzITXDEbNAUzCL1uMkSDvqPs13wbkRi
	l+tT5NSCKuzT8aBKhLW9YAIC5F5NbW/s7qMj0fj7PkgQA4hsrDmVC03uybp0nI4qtO68FCNPFwX
	AO8NvqbGPIWJ2iJSx5msQy8MbU6p3K8dM1gQs3F/cev9UYc4IPKph5ya/kLSyRr9BGPdCe8LygU
	=
X-Received: by 2002:a05:6214:1c82:b0:91c:6258:ec97 with SMTP id 6a1803df08f44-91f0402b4f3mr63373686d6.11.1794424756577;
        Wed, 11 Nov 2026 11:19:16 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef05493desm53753466d6.45.2026.11.11.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:15 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] RDMA/cm: Read the remote_id_table root under cm.lock
Date: Wed, 11 Nov 2026 14:19:13 -0500
Message-ID: <20261111191913.98044-1-lcy8047@gmail.com>
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

cm_find_remote_id() reads the root of cm.remote_id_table before it
takes cm.lock. While it waits for the lock, cm_destroy_id() or
cm_reset_to_idle() on another CPU can remove that cm_timewait_info from
the tree and free it, and the lookup then starts from freed memory.
This lookup is done for a REJ with reason IB_CM_REJ_TIMEOUT.

Read the root after taking cm.lock.

Fixes: cfa68b0d0440 ("RDMA/cm: Make find_remote_id() return a cm_id_private")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64, KASAN) on rdma_rxe over virtio-net, with a
test module that connects to a listener on the same device through
rdma_cm and destroys each active cm_id while it is in IB_CM_REQ_SENT,
so a REJ with IB_CM_REJ_TIMEOUT is sent. Another kthread destroys the
passive cm_ids. The window was widened for the test with an msleep(20)
between reading the root and taking cm.lock. Without this patch, KASAN
reported 46 to 48 slab-use-after-free reads in cm_work_handler() per
20 second run in three runs, on a cm_timewait_info allocated by
cm_create_timewait_info() and freed by cm_destroy_id() through
cm_reset_to_idle(). With it, there was no KASAN report in three runs.

 drivers/infiniband/core/cm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/cm.c b/drivers/infiniband/core/cm.c
index 1a2c2775b14d..5347b7519a8d 100644
--- a/drivers/infiniband/core/cm.c
+++ b/drivers/infiniband/core/cm.c
@@ -734,11 +734,12 @@ cm_insert_remote_id(struct cm_timewait_info *timewait_info)
 static struct cm_id_private *cm_find_remote_id(__be64 remote_ca_guid,
 					       __be32 remote_id)
 {
-	struct rb_node *node = cm.remote_id_table.rb_node;
+	struct rb_node *node;
 	struct cm_timewait_info *timewait_info;
 	struct cm_id_private *res = NULL;
 
 	spin_lock_irq(&cm.lock);
+	node = cm.remote_id_table.rb_node;
 	while (node) {
 		timewait_info = rb_entry(node, struct cm_timewait_info,
 					 remote_id_node);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752967;
	b=RzUO4/VFtC7IafMi6RzPxaIIG8Z4KfEt6jfIg+Y4wJfwzHdfNgIjB/155RtbHlbWef9K
	 Pl0Z2kLNUQo37MWQQxJ5k+noMA+OZhIKxjZt/l0YrVdOEQY88eKYSuPxdPyuR32dBD5Ja
	 6tYx0LPfscK6y/zMsAtoFf7Ln1C5lNntF9YiMw75qel/evwcA220YPsxIr5iCfjO9VnBw
	 AsGcDQ0tdKXS+sCtdFg5XaKOHxVavHhdBiNsmNYiqpcWNX530K8BjGZrx5Y6/+9EBAksc
	 /PpmOqQO0FUFosNmXK5fCNfqi8zrdnymqkYRvZi7DxiMrdXEbC248OkpV+0Aaf3AIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WjclKcwplx9taVvKi16krzdNqwtk4wWsBv60eOBTtB8=;
	b=BG9VrONv0bPWTNLzOkq+SvttqvKu7b+O16+Ytl257cBqzXyKpoqUasrd7sDJw0VgPvl7
	 ztIM07E4yqOxs3ecszbKJlQMPdhpycTxwOLjYXZVoMW8Tbs9CxT7ewL0PvsST1nlgJ8BI
	 OISKcmI+lP3hi7K/YyThbwJVRHp5G009HV9AvUspoVcEQR6MiothiPgQnubNQYD7YFSR1
	 NpTCh8HEmp44lqacUqJlRrGWEBtihc6Oz6JldLPWZcduPDLX0SmGaS0A7fMB760guethK
	 2vEVq9mKiaBH5n/+deJy7YwhYVQtcYFNdIayYZ4eKOEXJf+zXDIkNnXBDeCVZS2zSRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kugfSTGR;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BA606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411BA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kugfSTGR
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37f14feca60so220591eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794752966; x=1795357766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjclKcwplx9taVvKi16krzdNqwtk4wWsBv60eOBTtB8=;
        b=kugfSTGRtKxyvNeQnU3q+Btfs6ZHx5iwC1Xh2t7EovosTN575u61PHsnW9cyVobBSI
         t0yOMUFkp/DrbzcdY9xnFTWaq4ZoWJXFTwMjQNRZ+rzZfzNE/xZOn5ArLMMdAW1XoOqJ
         ZXV2lD/ATD6+SL99heT5/BGbT8U1aC/MnFZaYQ7+OUJAYLbeMCiDNPbLzHroIirv1OkF
         SAWp3RxdcPUVtzjqHr2Ce1OVSafrFuAHvjR6eOXMaF7XtXYOvvf0d9mG6tMFLlFyMVAQ
         W5EZBj9NKVBYIrx2iT42byGb/cFz2F2tBzE6PKLm2S+huRsmZW6PIJ3hNobyhLfHtQwL
         Qs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752966; x=1795357766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjclKcwplx9taVvKi16krzdNqwtk4wWsBv60eOBTtB8=;
        b=Uab5UJ+dyDYcVIRXxqwS3vlIzggAbko32bvzA2UK9rHGeI6Vwwv/Owcrn+glXz3m5u
         1wesmz4a77EYcIpfRuwD0gPP/S9Jkp0c+hwaR0jtOIBIX+k5MUtxdLcq/wQy52k5+sde
         DjhcphKZkmcYDURk0f9GHm7n46QCXfcsP1OMajyJ9tH/boX/PkxInDSpU8RVNUbTrG3L
         snPMHIYp+NMbsr1vC0yhH6bbC0cE0xtL/yVXnnWdFpQDkylF8l5KYuTslw3p40l1ASJn
         +fFEFZ3quo321FiTXc0uOtBrTSfl/dplG2MIcyD4Le2YnSuBzr0RlzWOryxes+mwH2kx
         jByQ==
X-Forwarded-Encrypted: i=1; AL+hErFjNLoPEjneDTWQy5VW6efl42YXjYp+RrWGHV1t96MIJHCm6rVGrlFx7IKXaAs0YanU2w0/ncMkOWN7pmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jwxbd2iYgH5UEa+luoJwySIKdqGggCOCKQYVV23fYyo0zcuam
	BMIysw9VA15CHBTHJU7nfQOmVJlA0YACyriZJrZTAe8huL3ejz+E5qhl
X-Gm-Gg: AYBFou0IrLdxtdmRMvMrtWuTuxN7lh8s6+H0i/FhdiGj8Vtk+EQYH9H8WpAe7+xt4IT
	+TzK54MbgATPepSYdnxm8XqigF6iM9V1ETjO8Us2ERC1OdqEWQFfdIeOnoPdZYD21zFlPOxA1BK
	JrZ3RQfXFHvarX7ZwvoMNXdITlfKP1gdCWew14mVeo1q5OdPpi0G9RLeNBPApme7QsR7CyCzpip
	LxSkQUQAQiZ1ypMR7x3uqfDPhiIklyDKmV/oo6h3bxDtoOqJ0Q4sbveeMuKQoaFtl/RvtYvy+c4
	GvwQseWmcVfw6ZWdGqvSMARTsETJe7nry0b1W0rJLsLmlSeErmuHcN59RCv91OXtP4lLVwx6zsQ
	nBSNFALGpX/msqw0XuuSrh45gXhRhKpVi/mGtzTKIX6y+3PkkxEW6QeL+AHHBj0dbzoGCmD+SIQ
	K60cMhYPMX2K4dzOmAlbZj4Z9gmHzv6dipjSJ4dRjXJkwZAUT0JkrpTnyUI9v4KA9VP6l9Gs5JT
	0ZrS5JpzLNE5XAl+2k3i8mtk7/bMMLo0J6b582FcJIYsyjAWRWu8gPrcsdhKVddNBZaB4/kUy1c
	UvdsRwHQWTkVlfKRDaebfYc3n0PqF5n7LIiH92eOvT7cCRJWh6HflEPbv2fAbZyK5V+KM9LgnyG
	y9kLqwv3uw3F5970TckoGc/MHNvzzwYxempF4JS7R+X4H3r/AtUj0YG5vy+SA+P94scSAjWZrQ/
	8=
X-Received: by 2002:a05:693c:83d2:10b0:377:2663:5fa4 with SMTP id 5a478bee46e88-3796676b191mr9341645eec.20.1794752965210;
        Sun, 15 Nov 2026 06:29:25 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2401:4900:416b:f7:3763:c5b1:411c:ff3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25168019eec.12.2026.11.15.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:29:24 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jgg@ziepe.ca,
	leon@kernel.org
Cc: ynachum@amazon.com,
	yishaih@nvidia.com,
	edwards@nvidia.com,
	mrgolin@amazon.com,
	hemanth.selam@gmail.com,
	michael.j.ruhl@intel.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Subject: [PATCH v2] RDMA/uverbs: Free all radix tree nodes in uverbs_destroy_api()
Date: Sun, 15 Nov 2026 19:59:11 +0530
Message-ID: <20261115142911.21321-1-kartikey406@gmail.com>
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

syzbot reported a memory leak of radix_tree_node objects allocated
while registering a siw device:

  radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
  radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
  uapi_add_elm+0x61/0x140 uverbs_uapi.c:41
  uverbs_alloc_api+0x85/0xc50 uverbs_uapi.c:659
  siw_newlink+0x36a/0x3f0 siw_main.c:433

radix_tree_insert() can fail with -ENOMEM after it has already linked
intermediate nodes into the tree, leaving them with no entries.
uverbs_destroy_api() only removes populated slots through
uapi_remove_range(), and radix tree nodes are freed only as a side
effect of deleting an entry, so these empty nodes are leaked when the
uapi is destroyed.

Call xa_destroy() after removing the entries so that all remaining
nodes are freed.

Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
Changes in v2:
- Drop the dummy insert/delete workaround in uapi_add_elm()
- Call xa_destroy() in uverbs_destroy_api() to free all remaining
  nodes, as suggested by Jason

Compile tested only.
---
 drivers/infiniband/core/uverbs_uapi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index b67db3790f03..77a4eb494936 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -621,6 +621,7 @@ void uverbs_destroy_api(struct uverbs_api *uapi)
 		return;
 
 	uapi_remove_range(uapi, 0, U32_MAX);
+	xa_destroy(&uapi->radix);
 	kfree(uapi->write_methods);
 	kfree(uapi);
 }
-- 
2.43.0


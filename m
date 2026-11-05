Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881287;
	b=DmGOTr99MM//wuoqWKhUiSH6kfPqZ4SBbGSArC7RPyhscyierh/xuucTt4AqGcMcubOw
	 Yd0kUs93vTp+pwGA3O3fgJe66YWz6tFJAsZ21famQ2ar1ZJcXZle4ZKdKh1CjBdRtJAVF
	 TYjg+F+66EFRlNE2sL4JA1D+22t8zavjSkoKCTRwsXJ6oS9h7nmjv2qKrOiOpF+ONo9lA
	 cH1nEI7IIEqexeD2bDAo+iTYtFSBXqwjBaY4+JEc2O4s1l42ExjNoOcLivtlMTbzddWsp
	 90U3hq46lKDLieSNz8VSeiIYLSfH5YkNuysepjIbUPv+evUgFa7a+UT5DU5ViCxuTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881287;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=jlmVDfSbhpE28FVC116e7MiMAoE24nVTpufkOLUmCl4=;
	b=GTtLkNtsnT6oZCjg7HYhaLiOXEucwezwB6J0Rz0KMsBZxejexQwCMdzdFXuIyCmL7JkS
	 mGeIO0ukxDL22g+El9iVmH95rTL8XaFB8njRH79lTzG1V2oaDrj9s6sL47E2DDYKYQZb+
	 5ikpzRLVb9vac1PMDzZHH2aaBipW07/zeA01XiELYvkwHd+C8ATseXiMoyfCcCeZX6NBI
	 OCXwMZQvvZMZZeHdIHCwX6PniQy9tLa8+SeMNNfZmMIAZWzH4Ncq0v1yEaq8CyKXk3UbO
	 My+cMcPIolVppEI8jeRq8rYKLPcKgmNVjFgUW+Kqj3jv09zIl6ueXLVoHLcv2UERg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C3606D826
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05C3606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c7f887ac6bso2692164b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881286; x=1794486086;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jlmVDfSbhpE28FVC116e7MiMAoE24nVTpufkOLUmCl4=;
        b=EWXfyfhCgd6UF4tZpB3STV4AA+K2z7QawbtbOoq+mj28aP3JrmbNUYIMVqWLrh57Ir
         h0QkC8HfqOH9rWVbU2dOcDOYXDJzM81T+Wf1UWTiHT50dZZCnVCStcoiPtqUGuTDY+V/
         YiADkpUtlmIOrjCcJ2Zonnq9SJ4APSJxf0K2pH9DWsA7KSW63o12MWoOuka4zFhpllV1
         DgaX/meQ1aY8eAlGy4tTpSYCQpcSdNNdoBxFbiZjMAu+orpcNfIKlot8WIYqp/NXzhIQ
         31UjoM8SMCEvFCzjz70iW8GQUTWh2CEpcg2Kh0XyJl2yvcfzWi/3twBulhQUA85Gs1OZ
         pgRA==
X-Gm-Message-State: APuU4Z9GA9yKitXZ6dId7xYSy7/L1dqcZqo60eWtvP9t70OHxuo/HjE3
	nOfoldDKeZxIqZnUKpsa6voeNXMPhPAFmzVtr59eKGgp/LM+YJSjSnMfgQlWTEIDse0FxP0pW0r
	/bVy2QjyLjCp52woZV3p2MucRvqX4iRVy7CIEUZsc+ijjx2ZEaFyLEKXe0/M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1687:b0:50a:6fcf:d287 with SMTP id
 5614622812f47-5640dddd751mr13246930b6e.37.1793881285901; Thu, 05 Nov 2026
 04:21:25 -0800 (PST)
Date: Thu, 05 Nov 2026 04:21:25 -0800
In-Reply-To: <6aec6433.0ce67c00.35143.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec74c5.92c8cf76.1fa4d5.0002.GAE@google.com>
Subject: Forwarded: [PATCH] RDMA/uverbs: Fix radix tree node leak in uapi_add_elm()
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] RDMA/uverbs: Fix radix tree node leak in uapi_add_elm()
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



syzbot reported a memory leak of radix_tree_node objects allocated
while registering a siw device:

  unreferenced object 0xffff88810d78f488 (size 576):
    radix_tree_node_alloc+0x81/0x1a0 lib/radix-tree.c:276
    radix_tree_insert+0x140/0x390 lib/radix-tree.c:712
    uapi_add_elm+0x61/0x140 drivers/infiniband/core/uverbs_uapi.c:41
    uverbs_alloc_api+0x85/0xc50 drivers/infiniband/core/uverbs_uapi.c:659
    ib_uverbs_add_one+0x1b1/0x350 drivers/infiniband/core/uverbs_main.c:1196
    ib_register_device+0x4fe/0x7f0 drivers/infiniband/core/device.c:1503
    siw_newlink+0x36a/0x3f0 drivers/infiniband/sw/siw/siw_main.c:433

radix_tree_insert() can fail with -ENOMEM after __radix_tree_create()
has already linked intermediate nodes into the tree, leaving them with
no entries. uapi_add_elm() frees the element on failure, but nothing
frees these empty nodes: uverbs_destroy_api() only removes populated
slots, and radix tree nodes are freed only as a side effect of
deleting an entry. The nodes are therefore leaked when the uapi is
destroyed.

On -ENOMEM, populate the same key with a dummy entry and delete it
again so that radix_tree_delete() reclaims the empty node chain.

Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/infiniband/core/uverbs_uapi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index b67db3790f03..5afe1cf9b6a6 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -27,6 +27,9 @@ static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
 	rc = radix_tree_insert(&uapi->radix, key, elm);
 	if (rc) {
 		kfree(elm);
+		if (rc == -ENOMEM &&
+                    !radix_tree_insert(&uapi->radix, key, &dummy))
+			radix_tree_delete(&uapi->radix, key);
 		return ERR_PTR(rc);
 	}
 
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885596;
	b=OI+t68XlJQ41uEgPHkHqigdPU0DhJgOrnpmwRKeorOYXEd+6xEXj5wGDuiwWGoJpNCUk
	 BS0H4eNDRnM6MbDgpqy0eODXNmIkdmaw8ftpQEmaymXyX7pwdKNptJDowCNMsjkY4ozNy
	 WUabv4cAReCP4o4Lqv717FYR5ZAs/2asQJRK+N26/FUPx2rOLEVohGrkP3IlqVIK4ZqyG
	 iitLZlIcf/gSztPWpJ6ZcI4tKf7tYu2EVmsYCCfJtyztKVCEoFEleQXB3noTHVHTwMTYZ
	 r9EgKsT79I3ERjaxShDIBWebkdJM6U/0gEGnzZah1WyQp43p0lOzNquJnS7CrurZ33Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885596;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=/xokk+mumoVo5RGwLyOL1H9rS08KX2wY6K+MTAP66tA=;
	b=CmtmxwyBgoI2rJvcAyGmjDDaTQg9RVEifCnmshE+HBLWXT4a3s9OzDEQHhKRGMAjt/ep
	 ujXgc0KlurOBssY5qjnZr4dUApGVaCxb10fuKmbDVw6+24IVeIm8b3r8yzPrTrXxwsJZW
	 bdu0e8xbInDhM0elENjW60xX5GjmAAkD6RSXuVn2GLWCo9M9TACN/YF1TRa7ssOL5TlJi
	 fu1+fkhc/9Lk74WO98BfFaYRufyk1kTMlAhTywJU20FjKjuZ18WIxOGJSITl/poZ7s9A3
	 tifyMnfFXYLKSae6J5PAL+Z8/snPrapiGQXizDkFsLDTDEI9czAuZfAxW9cbDkq7qBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42195606D820
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42195606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so2554483b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885595; x=1794490395;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/xokk+mumoVo5RGwLyOL1H9rS08KX2wY6K+MTAP66tA=;
        b=QCnt305cSjrq1qIgCPIDueMSrGSHJNFwMlKqLFgErMq34E0r7PZO/WRd4EJGx1aw6d
         c8stwIHpXj4O2VW50/Q9Q6zCIhlunHBXdzfs+ZpS1TpaApkWajpoW0Lzk0n1CMu4sBmF
         GPT+Lv/F9SySaOIAfvYHcRES3sWOudLWmhkfTH1owvoARELGtR/mdl/jsIXqrr9MBJ8u
         kk1YQ9ANHzc4tP2cYfTAKnzi8Qfr99F9DvdkTMM+wiqX+1HtPX2QJFCKWIIVLTaoQBsW
         nUaa/4ULvJ1I/sT8vH3LfswO/2c6VUFL/aQ9sYdZKd9YGl/lVBkpn4WVmfQuWkRrPSkP
         T7Wg==
X-Gm-Message-State: APuU4Z/zJfWMBevwRYQjr2uRMRSCVqTE2U3sMrzocDUIhsSK/Bt67ppV
	F8R25pDlUAwTZWKKbwXTW647M4tkP/C4ROw6ceskeiFEWVD4wzkmCJTD89WgOBQOfhqGUi+X5zO
	RL8RFG6/jgYKYElp09Nn8L9KHN/sPEuBg7G6TQa4OX+tE1bD1Khf6f6KZmIU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6408:b0:4d6:9283:1df2 with SMTP id
 5614622812f47-5640de79c53mr13450992b6e.61.1793885595128; Thu, 05 Nov 2026
 05:33:15 -0800 (PST)
Date: Thu, 05 Nov 2026 05:33:15 -0800
In-Reply-To: <6aec6433.0ce67c00.35143.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec859b.aca85a03.3b899.0012.GAE@google.com>
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
 drivers/infiniband/core/uverbs_uapi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index b67db3790f03..aa0c980ad1e8 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -17,6 +17,7 @@ static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
 {
 	void *elm;
 	int rc;
+	static void *dummy;
 
 	if (key == UVERBS_API_KEY_ERR)
 		return ERR_PTR(-EOVERFLOW);
@@ -27,6 +28,9 @@ static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
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


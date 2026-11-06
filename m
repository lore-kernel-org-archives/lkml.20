Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929173;
	b=PNBlUAcp+G8iOCCnkCjsClaFihXB4JGSqE6nd7j8QNUINo6sJK0OkjgTat2zL/5JTGmk
	 j33RnCL/+EE2XzVXPbSeWPSASQyhuAgbt37ohDuOs8XoLmBkSMZbtmKbiAQtQEdz0xW/S
	 UXGHtMKiu1+2t+GCAeSGCo0d5LKcFixUDStLifuww+HJHQOxF50SpA1ax2IlOyOSDdODo
	 ymmFAqVG24nt89eVcMa41XEw6hfdTlZqLOhQihQfesEfCEoWXaAUrs3XmOJ1LJFKKeE5j
	 Fsc6ywQ0AT1LoBypbLmKWOoyjIHFWDqGWpKdxYtwGxk3pZB/X4J2vNgcy55+E33Ib0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pV/kNvfzk8F2VpUAoJWwVRBZCZ8dFSwiu/B6DvmYRHY=;
	b=DkTMp+YnKSPtOIA2ddssX/SrzuRaJ0r3+Wj+9nRo885MzXt1SnzYtkV0NaWsx/pkFhC2
	 Mbeuql9Iu+kdJKz/mqM4se0SmPFkDY0ajMwtVnx3gmDVW0Ila49AoZiuLBYfojaeQhDHG
	 jJED6VEOSAnH3TzKHbawFpieHZ1o7b8qOpyDfBg/Sm85kGIl7MLrYF/mmaJg4+2vp2tsm
	 2ewRyxp/2NUeCpJTEMoRNpWGplRFtCqBjbKEt3dxVu/SB7QxF6eTsMc6gdZn0lxAhX0bT
	 vWn2zbEbavGZY9W1SFZYdkQ+wD5twYeVacyOSc7sTuH2yudoYGnJcmhCawLvr/XqFbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tv6GLX0f;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C6606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81C6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tv6GLX0f
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b24f4b15c4so72588c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793929172; x=1794533972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pV/kNvfzk8F2VpUAoJWwVRBZCZ8dFSwiu/B6DvmYRHY=;
        b=tv6GLX0fyEfho2UYnmfo57BkKedAtXn8lB+TNhXnenV5HgMj3UgR7LVY2VvhFiD5Co
         1xrjTlsRt4KJM/9XjhNzGpk6UuiY31/LQvno2ZBouvkrtzJ6+SpmToVSE6q1sn94tNZg
         GmJXWBZqW+zfRKEEeKPClSylMKdn19CFOaHTgcfpzHx9ZOlqAgZfY9upKMEQTcuYgcAp
         QZ9jMCus4EJj2LixvXn17RSeVe6N6CeiEDXgllveTiKNpNycARbJD5RUklSpCs3EZqfW
         uA/vagr4j+3ku3lOS08GCQHPHKB6MISgKSZyGYLzJRgFB99BucByQntGj+k/wHRzMu0u
         Jlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929172; x=1794533972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pV/kNvfzk8F2VpUAoJWwVRBZCZ8dFSwiu/B6DvmYRHY=;
        b=z3erx2ShevcyLc8hWPwTSVMdgN6f04VKkH90O2iwN2VwFh5Y3VmEKi7zvGGqZxinzO
         k6HnEQwLOjafghv4Apl/ua5Q1BaufPFprBCqG4LTme+zMXRRyNMm37t6Jyi/XOU4CrUg
         KAa1XWylh8XtPG8ozCsQebcOwpQtfLzzV41Jl77wExics4gVlLsPHqb70XWRkiN21A1u
         Nb/ve2sOjqp/rAFW1IVYmmFLWySuCCP+SftcarxU6mzRIDG/bALT1OVnDcjaIWfXFVpo
         kigBgL4r6inayCP4KUIlteIoxUr32X9Zm+GzPPMKUt6QAhCx5TUBSKmFNB5YgjLqu/jP
         /SVg==
X-Forwarded-Encrypted: i=1; AKwUvBwdb7sZ2J/ppgjULd05idTBS8UvDnNQ0XrrkyHItyPLQBgCvyVfaMrZhi4zo+7XiBGpb7maFjsVxzh1FZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oUbe0GSJN3NPgaBNZ272WVQj3CsnT2QyxRoMXLw5zmDe9IY0K
	zSHtnZn8oBoZ/AUyQgmf7R45cpTHfZoRrt1BnMEoNY4XARxRbzzmidQ3
X-Gm-Gg: AYBFou1qbywVUfPwD0FEniME68xVWQRTiwuHQJ07vzH4WFFe2RkW8HAn3ynTkuUj/HO
	OYZ8adtmaU6kLTFEPg1PiDjlCb6v0hNitYL1ZJmm4q5fF6sfJOywalgtv2Rkyhz+n2IDllqwbai
	4f1bwh9YiUz7quxYLHBg5ca0d319d1/wgDd8SHDnqrwZP6g9wJJcuMaBAz70Q2fiMLfDgRV7pUn
	P69V6wOMrzbq63oqNWIhK0bq/sT4OBCnE3u10C55sMoHGh3VuNuB7wRpQtTPaaujev5Y+aPtLkT
	OrEmSFZhugmpxrKqILB9xGZjUBzvegkT9+xKgi8jYNaJKL3YAZi8/exajLhuHyJN44286hm3nGm
	QKrO16ufF1T66eyjbfhzPaDllRTtHzrigY9J36Uhm4ZegGcjvgwSxA+EniMcNQuMEEKbEYndMh0
	iWTTLatOuAGJgtoPFjKHSTCL2WyujRcjJekkpzr6YxS8npc/dxJGdLnH4AxkPqf3W8NvJIyaH2x
	6tONqZV1++q6/g8F0d6I5z9kUgne3PzMCU7ACrDTmEN/zumqUyFmX+EOQHbhfE9ZjQV9yPslzUJ
	MytOnqpFRf9PrgwFp1UDyzxF6pZodxP3VcyNJFOpBKED50CLS/fzB/k5c3gYTJf+EHtebK4Q2Vo
	39bU1rICoGar1YlJbRT7dMAep59rDvu9yqyqvQgQ37NEpCB273poXsODLhLoW5KTjKv6xA0/B1K
	w=
X-Received: by 2002:a05:701b:4192:10b0:1b2:581d:5dc7 with SMTP id a92af1059eb24-1b2581d604bmr2850197c88.25.1793929171358;
        Thu, 05 Nov 2026 17:39:31 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:101:8f48:8a62:6bff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fad14sm733468c88.22.2026.11.05.17.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:39:30 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jgg@ziepe.ca,
	leon@kernel.org
Cc: hemanth.selam@gmail.com,
	yishaih@nvidia.com,
	edwards@nvidia.com,
	mrgolin@amazon.com,
	michael.j.ruhl@intel.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Subject: [PATCH] RDMA/uverbs: Fix radix tree node leak in uapi_add_elm()
Date: Fri,  6 Nov 2026 07:09:08 +0530
Message-ID: <20261106013908.21789-1-kartikey406@gmail.com>
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
Tested-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Fixes: 9ed3e5f44772 ("IB/uverbs: Build the specs into a radix tree at runtime")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/infiniband/core/uverbs_uapi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index b67db3790f03..6b2eb392b076 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -15,6 +15,7 @@ static int ib_uverbs_notsupp(struct uverbs_attr_bundle *attrs)
 
 static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
 {
+	static void *dummy;
 	void *elm;
 	int rc;
 
@@ -27,6 +28,16 @@ static void *uapi_add_elm(struct uverbs_api *uapi, u32 key, size_t alloc_size)
 	rc = radix_tree_insert(&uapi->radix, key, elm);
 	if (rc) {
 		kfree(elm);
+
+		/*
+		 * A failed radix_tree_insert() can leave empty intermediate
+		 * nodes linked in the tree. They are only freed when an entry
+		 * under them is deleted, so populate and delete the slot to
+		 * reclaim them.
+		 */
+		if (rc == -ENOMEM &&
+		    !radix_tree_insert(&uapi->radix, key, &dummy))
+		    radix_tree_delete(&uapi->radix, key);
 		return ERR_PTR(rc);
 	}
 
-- 
2.43.0


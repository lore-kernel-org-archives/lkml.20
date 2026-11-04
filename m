Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825126;
	b=C+G6ctr0C4zDOhzVCZN039ZThW3Nw2lfF+jvQq7PSiL6xj0J5SYjsutmrZdDaaksx56S
	 MXL8nDoK/tDMd7AB9jzYSkg6z/oJq8ccIJh7goldNdqbOV6bnz1iFgHITmSDyv/c5mmBk
	 UV+FHy20U3XSMX/xTfgiz+A1za2TLnDKlVMBuqSn3KO1CE9kF4xkC3pzZ3f2tFgLPQy2L
	 gp5uyOh3Re75xpeFkfmtNYbTAD37HZAanF4nbN72P6Lta2yUOnzUDIeQNp4LtfWnWg1Ma
	 yfkR/ONqPYSpwuXIZWfdN0p8qiAIhAo6+SyVLCCAKEc+j/X6AnUOCW9WcdV1vwqQ6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jwxSG6kxNQXfd3MBU5TUyTIg6qqJuNYboB40oYoca/M=;
	b=V8kWUzUgFkeL3sMlz1EfuIfkx7RJEbbRqd4ZY5T4xw9sbn2f1WwzXwU48FroX1AMA06o
	 jn7/FfeQGUSC4YOu0Tx0J5f4KDrNaURtFlEqrIFFgSzxPJuwz7sBtRfEIxED5sbKlaLsw
	 QhYTO9UlbZqXw2gyLTRmI8vXRDo3H855zqnmDuBTHTk9UdXc65cbD3zKHLarQ5urzzFb3
	 ZHj2JtGWamxzqfOOJ97oNMsmGrgOcX/R/fw6AXuQQ0iXS/pqNEUimkbg94yt3mmRNV4jz
	 X70iH/y5Z62bvdfLJhPZ6FD4xYoD/hg+VH97GNEtY2fsA+WyPXLBlGdw5MeHSat+mwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ph5nNQSJ;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44886083633
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44886083633
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ph5nNQSJ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c7a0c1617so16076156d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793825125; x=1794429925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwxSG6kxNQXfd3MBU5TUyTIg6qqJuNYboB40oYoca/M=;
        b=ph5nNQSJNGhkwuPhD372JTXVjIV7yjnkzaElKB7gmlzAF3Ru8ismasdmKNc7H0L/Cs
         x5iV/ymbCytrpEdEX7bDMTBkdvA0h4aTfeZZCLYkjD9NyLOuYTj1wztps6dOYNo7wfwg
         mD4COroq6ETwLR1JjKQglPUJ/k26dp0teLWc0UHAXIfFU3U+LFZ2df6PjnHFY4L4JVNS
         m/kpQ5gVqWmPPEltXNbfNQIBU+h24CnvgQjVD/WwxvEBSGX1kw7MnHlkdejewxlyPGq6
         +Oq4CBjyUG2qNdVqeQ4yBY5uHTdH+smO819Ccl4VEzhthqfvbKgFX20I5rkjjsbs0qBS
         vWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825125; x=1794429925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwxSG6kxNQXfd3MBU5TUyTIg6qqJuNYboB40oYoca/M=;
        b=R3zXcbqn3MHayAK2vqgkZdVN95iCedOD9op6x48GCyLbwJGlrUU++FIJIpxt3ERYJn
         R2UoZOj4dQElxKcmbqueuNeRqNQOntb93IkcqSxYM66jAg5683uh/ixeOIVivUqzQi81
         NKISaFFUHn3an+6VaCxL0o5GREZW0gPNYeG0JjoIe9oHChpbuJosWj/C+RB/e+4JfjtG
         iHdDr5qtRHBe3KoC+goGutimzIgRXk/nK3dihRsQFPp5znRdRUiKsXaziap853ZID5f7
         ThoXlJzAFhl1GM0rA+4gQYnjFrYCDyAzvCCb+AQxMaXgHJmNq65hKd6TMHKBa908Yr0B
         pJ1g==
X-Forwarded-Encrypted: i=1; AKwUvByiHlk8nN4ExhR6nBYBtdhSDu7zpLASs2c3BjBRjbPHj6CO6cYPqykPmyqawXqQg6hU6/T8ehNv3NLDDSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k/SKK3VLNg+c8ZwHgwaqJAF6nnjyoqGkwdTrK2hZmZZXK19F0
	fPyB0m7L7BaUpWZUBJb89Dc7MyK1+2ScRmFFAjLCrK0rhcEHU0YFpPZcN7nqk+AT8BM=
X-Gm-Gg: AYBFou3mqg/LFlulBDb9d2U7uGnhAvKGJk9N4jtWecy8QQ0XRkqcrCevixlGFAnef6/
	8yP6ez7cFiwKU8Qt1pGpJT2pWyW3YK4FJ31HHknh6AKiTAA/Y7ZFgNZw3qkMwB+2a3h317zpNKH
	1hM3MuVhM2OJzqf2YzLLEIRKu9slCFWSzkNFNAqb9A0aYuZreon8s8mFCTVo06ck3wgVre+Nkah
	uKFn6q0RGkstSnY+mOuuM785oCg4zTv2cGBi9JX/WzP/KPD/wG9h5I5fyO5sCaCnMgMG5wjRFe6
	tAsWDDTt1w97BTmNMd4oSySdMQaJpE+vmMH/+UMn413NBqSVcWKZe+GMSdUll/B5y6e96d1h/nn
	t70/inG9Na/rwccujrqC718I8876zBF9qfMOEbeE9S49E/y5/2Am6Ag5q2vMbQSGNhfdl6lnYzd
	LBkIvGj3w5ZlnXS7g0BIjgfyprh2KmdrxSz6CNhZdNupmw6ZRxnS4K26uE+FjsM8/29Smjbj91B
	mkKdb04NwKttKJ1zIAPxEkvP22AhUUqGbbvFeg1hGUUa3LYOTPq/2tdBCADF3DWnnaD22kELir1
	9SFA3PxWU9JWvIz9HJFBXuAPqEbnCC1snUXDLRTvfSWzCw==
X-Received: by 2002:a05:6214:5504:b0:91e:7f01:f95a with SMTP id 6a1803df08f44-91e7f0200b4mr45796446d6.46.1793825124629;
        Wed, 04 Nov 2026 12:45:24 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e76a9c8sm28500416d6.40.2026.11.04.12.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:45:24 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:45:03 +0000
Subject: [PATCH v3 6/8] ovl: cache dirty overlayfs' inode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-ovl-containerized-sync-v3-6-8daa20144f53@toxicpanda.com>
References: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
In-Reply-To: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825112; l=1773;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Fb/8suIHH0v3scMIhqAM6fg69jtShxcacWyi5TFUHZA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGdUBvUWtNGstE1DzXnIADs8qyDyHOogJZqYtkTAGjfXl8ErwjvmPk6vrDGBONd2cS1RDBTY9zK
 qQz2aLRS+kAo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <cgxu519@mykernel.net>

Now drop overlayfs' inode will sync dirty data,
so we change to only drop clean inode.

The purpose of doing this is to keep compatible
behavior with before because without this change
dropping overlayfs inode will not trigger syncing
of underlying dirty inode.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
[josef: also keep an inode that is under writeback, rebase]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index c1bd70972519..fe626e9d78a8 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -387,11 +387,27 @@ static int ovl_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return ret;
 }
 
+/*
+ * In iput_final(), clean inode will drop directly and dirty inode will
+ * keep in the cache until write back to sync dirty data then add to lru
+ * list to wait reclaim.
+ *
+ * An inode under writeback has had its dirty flags cleared, and only I_SYNC
+ * pins it.  Such an inode is not clean.  ovl_write_inode() may be about to mark
+ * it dirty again, and marking an inode dirty that is being freed has no effect.
+ */
+static int ovl_drop_inode(struct inode *inode)
+{
+	if (!(inode_state_read(inode) & (I_DIRTY_ALL | I_SYNC)))
+		return 1;
+	return inode_generic_drop(inode);
+}
+
 static const struct super_operations ovl_super_operations = {
 	.alloc_inode	= ovl_alloc_inode,
 	.free_inode	= ovl_free_inode,
 	.destroy_inode	= ovl_destroy_inode,
-	.drop_inode	= inode_just_drop,
+	.drop_inode	= ovl_drop_inode,
 	.put_super	= ovl_put_super,
 	.write_inode	= ovl_write_inode,
 	.sync_fs	= ovl_sync_fs,

-- 
2.55.0


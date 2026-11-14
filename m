Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634204;
	b=fjManC0phSOROCgVv5sRbxuLQejZMyaGqqak/prUus/WisAR1IguyYsKoYG8QSBrRY1u
	 8YGwUISGqvsLvjB7hwqxYURnudH/BTe9Y7MUaCEmg9WYDOmT7kA6n7D2SkGLpYT0z+I9F
	 8y/suVFM7/5gDjirS8vhpYX/DT0UvRMz74Nchiezrf/K9JiA1chhotaEinsOfpRUqYVK8
	 35Nhds0S7H+h8QPFcAM9SP+Em30/fHx3h+0mnxvc6gBhYw3ZFa1YPd17sIFDfiaSIr5K6
	 WgOW1KqjljmjtwT/wX0OeInEaUKuE+x5WJwTtFwPFueYIxe9fowgWuRXHlJoE4tEg1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
	b=uC9MYTxZUmbu9M3zMew9CBkdj0PqmCf2IQ8BnSY5MR17EBVnmIrgJvXBnERLRaVY/vR0
	 zn6GWmZU1YfsFMwVXEkv/i34Sjyjf9nOcbvX5JDbbtl/YlKs7XRz6v7Z6h7CGLr1Y8kNw
	 U/zAD0AIGgCe7T3tfUUanQQn8lm86rNrDsnqPOozcHYGt6y5rGOXSVuo6XAOF8wQrQKLc
	 gux6eAJaHTTjPsqFssPiFnCwaUQKnCCCl9C/GPWQVABaqF0m7rUgWMEekHTp3wFJHD0Lp
	 MKq26DJkQcmK2PXcRCeMGHQsLntrAo7cnt13BqCvNgevcdhaGQTnpH/DK9gXe9Odb/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKNP8Rq3;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A473A606A8A5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A473A606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKNP8Rq3
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0890476fso19131645ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794634203; x=1795239003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
        b=xKNP8Rq3c5MhKwI76Wuq+fTw/7dLuwchlW/ggx+qwxVm0T/odp+ptsW4DyOxF13nlt
         +MdQmi7potl4/GHSLHcJdAaVSbdHye+8iG0paTR8VVFnHqTioAEsn+2U+TG3onvubptx
         jEtx9dPm1P+1Ypgvw+NiEaZhif8tAT6Z6+YYngDfmsd4KMrSOmJEta+XYEJOYncJ/3Xi
         zaOhZNPBBoeCWyn7RkFj0Z/k/uotvh3zcMF0PsQm6mH4kMf/Pobw/JY7QMofY09+/psi
         2UGzWPRk6NGGkqdWf3W17uc7p8pHP6hUV4RH8EIZG7kEjyoJu8gZBUg+0zSbPaWyvuTX
         lAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794634203; x=1795239003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feB30mQrQhZDK7EQi84IVLLPpSeQhnjihIk10tU2imU=;
        b=vcJpvGn6mmrj+H996piw4zV4bjojWFjok3jPvN9EiQwGLrX4CXyjX0RsrIokb7zmO0
         5mrB9escCf3xS7pN/llCQ8OefgZlevyiZIZ7yDLrTQsUJ6PkUmVntnWFieKez+NDv4Jq
         OyZwL4KkBt3LZhYvRl4TINd/ZDMbAJ8gHcZ3NWG/CHfHUrUA3MJyp85QylpHCqY6Ez3u
         TEbtEIOkxVtVZXyTI8obIsnwxpJb1lLlImQjGRto0VuSPQP4XEhXs4cVCcRI7jnfNaV0
         HpNDKMG8E8iejGJHS5Wz3fBNhr9ncr/60u/mlOGaHXFx2QMo5SJ5nOp6eu5RCcD7mnXG
         Jfcg==
X-Gm-Message-State: APuU4Z/rqj10Oiie6rqxWfgKcOsINQdFvdqlUpVsULtjWSbd9F2cBl9b
	XzHMSS51MwI24lEQmq13NKVrhRElkRq5yqeMbL05bECmtdrkUV0LHMdZIdyukwaX
X-Gm-Gg: AYBFou2uC0XPJdCKrEofwshZF3OZ9h406npuokFFto6/2uvymAfxnSQrN1o5UsTSDnK
	DrPTCuTn6qZxMhfGtf0Qo7UB8kA1Uopvn/0aEou0+EjQsXoq7M/3xMt+aUt2Hqq2v1aUhuEd/fx
	VGn+8pLdrPU0mDubkikmH0DXfbhlMUhXvmN8TJHhgSwgVHGzr7MQF5CeWO1z/rNLHIne73Hxmgp
	u4LQn1HFBxX31QRdI5sRxqtx+hpvO99yBqxZyZSrjFHbq5OZTO0tL1lTVmnX25oVgv76cXh7wtE
	oXhtg4Ddl9rFXxwJGdHr3/9KSharXF/DiCqPevdlFWRFa6wD97sbrrLEmfI1jXXGFZ6ekgBGya7
	JbniJiSQR42HRMd7sKssGdHIheTMyrKFuU6kzJDq37Iary9Ol1spy6mK9pRPrduf2OHtUuE6LnD
	2HfclgvnJOQesndll+L8DQT9bhYt+nIpvynElSzduEPcdH/PkSp8Q0xSGQH/I/SLJ7IWJyP0f4/
	v8d4SX1y627XpZzJAEVlysibe73dMjo5bequV0dkFnkqK8UkCAabTwIYgyMwLPq5a80uUtZ6GuD
	r4BJl6a+XWN/+mJjzE9BsqtUVBmNmBkWm5eutL4DoFDn31mJLMawrn6gMXrF7YBf4avs4BvHErJ
	cMSaPChcZzmk8GJhiw/157fUV775bddKSMmwMgWZD8BT8+oKQHPAMZCA=
X-Received: by 2002:a17:902:d2c5:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2ee0dd2f0c1mr50807015ad.10.1794634202540;
        Fri, 13 Nov 2026 21:30:02 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([2001:f40:90e:5ed4:d53:b5f5:a144:fe4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm17760225ad.54.2026.11.13.21.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:30:01 -0800 (PST)
From: Izaac Chong <izaacchong934@gmail.com>
Date: Sat, 14 Nov 2026 13:29:47 +0800
Subject: [PATCH v2 2/2] configfs: pin symlink target against rmdir before
 ->allow_link()
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
Message-Id: <20261114-configfs-symlink-uaf-v2-2-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
In-Reply-To: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
To: Breno Leitao <leitao@debian.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Izaac Chong <izaacchong934@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794634192; l=4170;
 i=izaacchong934@gmail.com; s=20261114; h=from:subject:message-id;
 bh=UIE5mUHlEZhN2q27XJYyysbnwCRZpYvfHe5txtUgaYY=;
 b=nKNzeaQuUVFb4bZ02va2E/wyA2bAbqTpbF218DU8yauUBpyJp/ViJGGH/6nQdW0uvi1/DkasR
 NsB5smgDYncDTvXZvgHXEKJIrO5MErQ+CRPo5tRPxJGu/Yc0dRroXGF
X-Developer-Key: i=izaacchong934@gmail.com; a=ed25519;
 pk=IFfOWcK2ZRkDtCqaNggolAwpvIidYMt3Oar3NEnvqzY=

configfs_symlink() looks up the link target with get_target(), which
takes references on the target item and dirent but does not stop the
target from being removed. The target is only pinned (target_sd->s_links
incremented, refusing CONFIGFS_USET_DROPPING) later, in create_link(),
after ->allow_link() has run.

A concurrent rmdir of the target can therefore complete in between.
unlink_obj() then clears target->ci_parent and ->ci_group, and
->allow_link() implementations that walk the target's parents
dereference NULL. With the USB gadget UVC function:

  BUG: KASAN: null-ptr-deref in uvcg_streaming_header_allow_link+0xc3/0x270
  Read of size 8 at addr 0000000000000030
  Call Trace:
   uvcg_streaming_header_allow_link
   configfs_symlink
   vfs_symlink
   filename_symlinkat
   __x64_sys_symlink

target_fabric_mappedlun_link() also walks the target's ->ci_parent.

Take the s_links pin before calling ->allow_link() instead, under
configfs_dirent_lock and only if the target is not being dropped, as
create_link() did. configfs_detach_prep() sets CONFIGFS_USET_DROPPING
before checking s_links under the same lock, so the target either fails
to pin (-ENOENT) or rmdir sees the pin and returns -EBUSY. On success the
link keeps the count and configfs_unlink() drops it as before; on failure
it is dropped again.

Fixes: 4768e9b18dc6 ("[PATCH] configfs: Fix symlink() to a removing item")
Link: https://sashiko.dev/#/bug/linux-df6ae898-b1a6-4091-be3b-fbe4c177763f
Signed-off-by: Izaac Chong <izaacchong934@gmail.com>
---
 fs/configfs/symlink.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/fs/configfs/symlink.c b/fs/configfs/symlink.c
index 1b2c9048a920..52f0f3a6cd7e 100644
--- a/fs/configfs/symlink.c
+++ b/fs/configfs/symlink.c
@@ -90,23 +90,11 @@ static int create_link(struct config_item *parent_item,
 		return -ENOMEM;
 
 	configfs_get(target_sd);
-	spin_lock(&configfs_dirent_lock);
-	if (target_sd->s_type & CONFIGFS_USET_DROPPING) {
-		spin_unlock(&configfs_dirent_lock);
-		configfs_put(target_sd);
-		kfree(body);
-		return -ENOENT;
-	}
-	target_sd->s_links++;
-	spin_unlock(&configfs_dirent_lock);
 	ret = configfs_get_target_path(parent_item, item, body);
 	if (!ret)
 		ret = configfs_create_link(target_sd, parent_item->ci_dentry,
 					   dentry, body);
 	if (ret) {
-		spin_lock(&configfs_dirent_lock);
-		target_sd->s_links--;
-		spin_unlock(&configfs_dirent_lock);
 		configfs_put(target_sd);
 		kfree(body);
 	}
@@ -220,8 +208,28 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	else
 		ret = inode_permission(&nop_mnt_idmap, dir,
 				       MAY_WRITE | MAY_EXEC);
-	if (!ret)
-		ret = type->ct_item_ops->allow_link(parent_item, target_item);
+	if (ret)
+		goto out_put_parent;
+
+	/*
+	 * Pin the target against rmdir before calling ->allow_link().
+	 * configfs_detach_prep() refuses to remove a dirent with s_links
+	 * set, and sets CONFIGFS_USET_DROPPING (under configfs_dirent_lock)
+	 * before it checks s_links.  Without the pin, a concurrent rmdir can
+	 * unlink the target (clearing ->ci_parent and ->ci_group) while
+	 * ->allow_link() looks at it.  On success the link owns the count,
+	 * which configfs_unlink() drops.
+	 */
+	spin_lock(&configfs_dirent_lock);
+	if (target_sd->s_type & CONFIGFS_USET_DROPPING)
+		ret = -ENOENT;
+	else
+		target_sd->s_links++;
+	spin_unlock(&configfs_dirent_lock);
+	if (ret)
+		goto out_put_parent;
+
+	ret = type->ct_item_ops->allow_link(parent_item, target_item);
 	if (!ret) {
 		mutex_lock(&configfs_symlink_mutex);
 		ret = create_link(parent_item, target_item, target_sd, dentry);
@@ -230,7 +238,13 @@ int configfs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 			type->ct_item_ops->drop_link(parent_item,
 						     target_item);
 	}
+	if (ret) {
+		spin_lock(&configfs_dirent_lock);
+		target_sd->s_links--;
+		spin_unlock(&configfs_dirent_lock);
+	}
 
+out_put_parent:
 	config_item_put(parent_item);
 out_put_target:
 	configfs_put(target_sd);

-- 
Git-143)


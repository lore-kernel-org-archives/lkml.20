Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907477;
	b=aGZ9yFhkV/rqbzRq8if3k4c6h6KWqq0/rU5Lq3C8VaKIE83nkc6JLBzp4rfJ7c71fpyE
	 PW2WAmkkt5G83d6SJHBiFdYZLdAxVfOLfCGeP5ehWXZnWknOV2fR2Bnfz+MDtv4BU3WdN
	 vx9u6Wn+oGoj5BvITZ6isDZdxo/Jw3svUAR1CK5MBp20EMYWsgbJoFO5+/E9uedOI4q3o
	 vtSN5UC6vuyFIac0PheFrKNblBSNyiRoVSJGppymqYxuOnOyyekO8OqHTNMNX/vBvr7Ie
	 HCJLVWTT6Dr6B26bWtdladkUoQ2g0ODV/PLtnKfFFGNdzFdga4etlnCdprEd2cvtx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
	b=jlXmMP4/k1lzbDXsg4ZPCWxjQS8DKRT/aH9IxebzpQBix3pJfxE9NhEtKwKsYi2O4rCC
	 thj6qhePXhP6wnUL+3HF7Z7CFOY45Ls6ykwUQvD0WsqcIcIu+WaMIu/6foNJowIkrhEG+
	 kUrm2cks0Y8UXv9h5JP+RJaqFd8w45mlrEFT0C9rjs8bkcRpOZBKk1tHZp5zSW3wteDPV
	 fXkEkcBlv7vb2cnN6wQfDb00QU5B7nojfxRAwWdqEm8JkEIWIodGi7Dx3OErK774U/Rxw
	 Q181kyKFlpiFPgEntO71fhTzQ1M2NzaFN7b9VTEej8Fd30fiGy6uNCQtY72h8pljtDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CpWYY4HP;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465E607B95D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7465E607B95D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=CpWYY4HP
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso3072559eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1793907476; x=1794512276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
        b=CpWYY4HPqsMqathLuCP0SqyPHsMFAQWoskfk2GdP07u48l12UmKTiwONJuvB++DOZo
         Yclhv2OYTvpyVQe0nGDznRS9Z3hWx2kbCBFvY0pqnRrXO41EfaKHYTGa75im9YoH0HyQ
         yVlSieODB043s7YTZG83QMLxA1SHJ8toDshd16zaROUJAf2wNKauWeStmi1bLrH6/8Tz
         mQQW4N4m8vwam53SdfBwr6BB3a+iuCtW3J6Db2OjYNgcUSfpF/y05AZgZRu+kEXd/N4u
         Ct4MdT86o/xNJxf/iCp+y8jz1OLKeZSYtEQMz8MNbuIitFs0Ewo+oz4HzT9k1iLJwTE9
         Ebzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907476; x=1794512276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEs52XSVkXr3Lysumh8vBcPCuRt3C+96FDYzKDRWk9o=;
        b=s+twQWNs5PTX/a4E7U6idmkBsSIr8gFz55x7/3L1DUmcMKWJyzoxCNuroWdkuk5eH4
         i/yUyg8Vlw2i4mwIWeweN7rcKCERPT4s1zrXBwBir78eB3emwv2Oer3C5Wd5N1LQaHmi
         m+jywAXCn1SwPXOsF2fFCokE4hURLR5GGNE6uS3OaHMwAOXQTzB/PLILYn0BOXJ99f4F
         NZQVX37pk+2MMbML7ZAzTzWZPDxPqVyLp1CFTm4g+KKLL9UofcvzOenOi7hWrLsWKVYQ
         NVRDWqCDMxXY7qBPzrFKoUtE2ElpAKKzmGPrz87fHznqOMzF2yRSrT+QGIXLbuMhl1oD
         NDdg==
X-Forwarded-Encrypted: i=1; AKwUvBy4o0TEFifXJOlLIM2t7jYO15NKbGFnS2mlx0lXIENvZKQPbnRRuaLd8+6Xrg4J1z8N/wcOCJTYATqUYVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mT/fUEV72C67uWGjQeuR0beJr4ikFGQ/6g30YI0Dp1bMhTxLF
	jS5JsXLLSmUROtvFJ1w5z2L5zJI9fdjQscuU4gnYZJahEfmRi04LAu+tXxzobyp80g==
X-Gm-Gg: AYBFou2G9o/W8xWFvd0EBTbnyAJmFEYfrjScdQJijO0Ly/vd3BlrUN70kDl8FJtevAL
	PIl/k3hyO7IfgW4DoR5051HnEpyZpsDdempPxyqrFPAcwJAdcg+W3cBKzo/g+bQKUaLaXtdwN4y
	lFbBHp1Yc19EZhU20KwRSGWRkvY/lKnraKk6ogChhePpgJm/9wEwDa3oUdMQwHrTufeuDQd2W5i
	HpyyoTlEVRvvKIGfVWoGusTiOa0l3g2BClGwmabtNK5yvHW2RqQZcjv62n15lVt6AWWgKJsvOfx
	D4s284UjOMmENT6PGr0JUJ8wJ7klhk7esOH+tdeF3pXSeX7pa23SfjRamuyT4rRC2Im+wygRTgy
	+TK0o6kEbZO/vXoap8tWPw1JHD5RRTEIkPv5lxYmBPorni1HIkd9S+yZ0z6YVCVKGuBLWvdJ4uc
	jmRTPaswL/Cc5FVDXq5ilkh74mtOPPgPFW86pTEx2d8dt4cbfjgiHwPmMBmmRDo0VO9cj6kHNK1
	egj/a1+xqq2v63moOWpuCxplffZ642liSU/DCXbxHldbkQL/lsv5dCXNF8WVbh0UMENtRBOa4jl
	1NXW24fy1z4GoyNrJYy74WbdvQyT/NLK49XpWod8agSVKd8PcdNLZbcr5JRFLUutrddH23cceqa
	xrC1fKWX2azdyRLJ7PnZWRoc=
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr150454eec.10.1793907475358;
        Thu, 05 Nov 2026 11:37:55 -0800 (PST)
Received: from dannyhu-upstreamLinux.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72ec8a02sm326134eec.11.2026.11.05.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:37:54 -0800 (PST)
From: Danny Hu <dannyhu@arista.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Jan Kara <jack@suse.cz>,
	Victor Kamensky <kamensky@cisco.com>,
	Taras Kondratiuk <takondra@cisco.com>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	zhangguangzhi <zhangguangzhi3@huawei.com>,
	Danny Hu <dannyhu@arista.com>,
	Jason Yan <yanaijie@huawei.com>,
	silviu.vlasceanu@huawei.com,
	hpa@zytor.com,
	arnd@arndb.de,
	james.w.mcmechan@gmail.com,
	niveditas98@gmail.com,
	pierre@arista.com,
	julien@arista.com,
	kbharathi@arista.com,
	alexandr.lobakin@intel.com,
	linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bug-cpio@gnu.org
Subject: [PATCH v6 1/4] ima: skip algorithm availability check until initramfs unpacking is finished
Date: Thu,  5 Nov 2026 11:37:40 -0800
Message-ID: <20261105193743.2654656-2-dannyhu@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261105193743.2654656-1-dannyhu@arista.com>
References: <20261105193743.2654656-1-dannyhu@arista.com>
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

With CONFIG_IMA_APPRAISE=y, restoring xattrs during initramfs unpacking
can deadlock the kernel if the xattr being restored is signed with a hash
that the kernel does not already have available. This occurs when the
ima_inode_setxattr() hook calls crypto_has_alg(). crypto_has_alg() may
synchronously request a module leading to a circular dependency where the
userspace helper waits for initramfs unpacking to complete while initramfs
unpacking waits for the userspace helper.

Guard this crypto availability check in validate_hash_algo() until
initramfs unpacking is complete. This prevents the kernel from requesting
a module during unpacking and allows security.ima xattrs to be restored
even if the hash algorithm is unavailable in the running kernel.
Essentially, this flag distinguishes restoration of existing metadata
during initial population from setting/changing an xattr during runtime.

A benefit of this approach is that once unpacking is complete, all
subsequent xattr updates go through the same codepath as before which
preserves the existing behavior during normal userspace operation.

Signed-off-by: Danny Hu <dannyhu@arista.com>
---
 security/integrity/ima/ima_appraise.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/security/integrity/ima/ima_appraise.c b/security/integrity/ima/ima_appraise.c
index 63b0cb957c65..1403f5653973 100644
--- a/security/integrity/ima/ima_appraise.c
+++ b/security/integrity/ima/ima_appraise.c
@@ -20,6 +20,14 @@
 
 #include "ima.h"
 
+static bool ima_initramfs_populated __ro_after_init =
+	!IS_ENABLED(CONFIG_BLK_DEV_INITRD);
+
+static void ima_notify_initramfs_populated(void)
+{
+	ima_initramfs_populated = true;
+}
+
 #ifdef CONFIG_IMA_APPRAISE_BOOTPARAM
 static char *ima_appraise_cmdline_default __initdata;
 core_param(ima_appraise, ima_appraise_cmdline_default, charp, 0);
@@ -738,6 +746,22 @@ static int validate_hash_algo(struct dentry *dentry,
 		if (likely(xattr_hash_algo == ima_hash_algo))
 			return 0;
 
+		/*
+		 * IMA validates the crypto algorithm whenever the security.ima
+		 * xattr is set. Restoring xattrs during initramfs unpacking
+		 * can call crypto_has_alg() before unpacking has completed.
+		 *
+		 * If the algo is unavailable, crypto_has_alg() may
+		 * synchronously request a module. The userspace helper waits
+		 * for initramfs unpacking to finish and creates a circular
+		 * dependency.
+		 *
+		 * Skip the algorithm availability check until initramfs is
+		 * populated to avoid this deadlock.
+		 */
+		if (!ima_initramfs_populated)
+			return 0;
+
 		/* allow any xattr using an algorithm built in the kernel */
 		if (crypto_has_alg(hash_algo_name[xattr_hash_algo], 0, 0))
 			return 0;
@@ -829,6 +853,7 @@ static struct security_hook_list ima_appraise_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(inode_set_acl, ima_inode_set_acl),
 	LSM_HOOK_INIT(inode_removexattr, ima_inode_removexattr),
 	LSM_HOOK_INIT(inode_remove_acl, ima_inode_remove_acl),
+	LSM_HOOK_INIT(initramfs_populated, ima_notify_initramfs_populated),
 };
 
 void __init init_ima_appraise_lsm(const struct lsm_id *lsmid)
-- 
2.51.0


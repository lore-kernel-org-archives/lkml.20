Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601251;
	b=IiZ/8qq5IyM1c7EReAyLaWqjm7VGBSLpVxad4Dln7eDbbzBP+PEgusIzx431EKUJff8E
	 1SWfo/jXwpCRQa/Gz3WP9Tc0NOBW6h8SNBUUfvc7hhYd4A/WF2mLdvVTwLiCmNAOTObPE
	 dG9SKVQ03Z9NH7cr6jEptXfDIZ7ExUSUybY/cIuIrJppirLKpddhSmJQ9yhYLxjpFKNMH
	 eeNiaDnGt5eSiWWcOniiacdxrbJr0/nVHXNnUyUxbaWjEquINfjsmbLVRj9mA1cqRb9G0
	 yyI1N375Wc0vGmdL3Hh2CJ56jk/y2RvPG9duC5/N9D7pOeS8aSG2XDvdoj/xUDPGUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ddPNju4D25sxiyQq1FcpinjHERbC1yn6z7dI6ktWvqo=;
	b=TXVPIMpLvXlMOshDiKo97Ar6D87OvuOf+hMbe85e4BiEc/RoSYvjB+XSLFlhUHXdI3/a
	 bn8Ba57Xc93WDpFiAIRtg02mKZzNdu7ODONwa/7OVyeyr+5Rss7hRiEyyM5G2qNSsXAqh
	 PMly7pAXI8MFUkaii1DD7s8uWYXq4vuI5DSaSA7++oCEY712qLz1mcOnLDMZ+8yBchM1d
	 b7EBU41Sks5emzhhWugjLgV++G/qKs9ck3CvJTsmrEtS0FxBveQJ8L7jOl6VH7Zn0V6le
	 QRuBLtq95iz8/8ubpI84ZvS2NIC5Fsqv5xfphxgtHPhjKqPUdb+YuPYb/M7BmOrnMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ne7Xdxrq;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC6606A329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DC6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ne7Xdxrq
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53634b8328eso7790811cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792601250; x=1793206050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddPNju4D25sxiyQq1FcpinjHERbC1yn6z7dI6ktWvqo=;
        b=ne7Xdxrqqaa/hd2nJek9OLBpjlYrLXEf0C73FwfM0w8Kfvd3EuouwvSNmoAABAWyRg
         Z49ur3LziBi+VW9hdW8d+Aq8YZRsaXl2ReCjYk3iguMlIxV9xh2mE9L5CgBkvLluEylg
         ZbZ3TJy09prJWxwuwdfpT1Jnb5hVxV4s9m79ylyEppDQdioZvp53VEJ7ne0XGZmUZz5Q
         V+n2JDDdrFpucQb0i3bNeFCZ5bMRoiKjOCof/pBNeHXAj/lPTnBzz+Xm2RXAAOCDZbPf
         hhItzm91I2Oyxng9JIjUJX3Z4ET6FvZAWnmC6ejrxNsWSKuF2CiGqEJ0BZuu3Lx7SISz
         Yc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601250; x=1793206050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddPNju4D25sxiyQq1FcpinjHERbC1yn6z7dI6ktWvqo=;
        b=Py4QGsSuTuLxckGjizaWl+CkZlMnCws8Tg28za3dNvnZhdQCOFkY9L0Nhd8SNMGXgc
         1xl2gCu+9Laln7ZrGpHJxzasij1ZOEjMV6250ZEUDUsSpbO2MTOmVw2f7RTJErsvIJt/
         uizYI24Uwd/EyMERPUWcWm+Ioi3Qi+Jcf2ybTtuxcDyS5iHFM9i+Lf1FcJ2sPlhWO+8v
         0xTuD5GqU07/6hlH5Uldjgw9GwM2nEyXwUNLpDC/zHC8zwKZXIOzvZxxkyPFICERwNQh
         tu5a5aEFZQ4TF7qjEmkWckuQJcTadlXHvqapu3mUARnYner6XOAEh7ZNwku68x25IOfP
         +MJg==
X-Forwarded-Encrypted: i=1; AKwUvBxFR1zKoRJSUgixFqpHaueCGL5hyrTCYNPZ6AyPE5NrMwRSI4F3SLcYcXMz7u3BOd8XhZJz6Hfnr1L+vmE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1OYVzsEA5jdduLeSjGxgGlKTX95sb5Gr4z4kp9XOfU8r2QiKU
	YabL/ZANgsoyZRYyImssZ5TFTUtniHZQzyk/bPNIPA1s0QbjZfP7p+wSvi6ddGmMmhm7h1sZ3Tb
	eG7C/
X-Gm-Gg: AYBFou1sZbkSHNhflW8h7w/5jVKYdqZIN32xxU+VwxCByBxUNVCBfGc9FxpGgorDQAU
	9mcMyDKOis5F4lYmSmCuCZKcxYrCPdd0doscvTthA0bJ2fDskZcaxep5JiaZrsEIEFMr46gDXzS
	NpOGNX+Ps+FNMgYzpTCj/OMp0+8LtjFeldfsGhjFanpZKBXOxPAuCKYcBa4geduwBGvdgWmkqtY
	HdVFKzA9Zo0ZyBUKHCrEITdOG005ClADJiemytcFeGZoE+Jxj5LlUs4YWVbOhhoke+D/RVjTL2u
	pgnnHSpmnBaqTAYtnM5VbNprYwtkz9pYyp1RkWmuQ1tv5D9iGCNJ0EMmz1xkqtUHmJcmbHyp3Sj
	cjsjtPubFIVVSh2K1CQSwIZSLlM4WJvVGWSPrQDcmj0qZdtj6BENg248jBb68Rri9cDNaNafMjI
	/+dYdK6Lp/NDf3OAhKB9HeQCrpO4kgKQrHAFdv0NTmOS1+m6lsfPxRU2NvSbbXskQrjCik5xfW1
	/D5tjzY6/7zlpOt1hV7PUC0tVQkM0aZn5bo56sCwulPYQKSMpYCqlAclw7qq0FyaDcNda1c
X-Received: by 2002:ac8:7f07:0:b0:536:6856:f590 with SMTP id d75a77b69052e-5369b617724mr36273901cf.18.1792601249936;
        Wed, 21 Oct 2026 09:47:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab76a3a2sm3680471cf.22.2026.10.21.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:47:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 16:47:01 +0000
Subject: [PATCH 5/5] fs: skip unborn superblocks in drop_caches and Q_SYNC
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
Message-Id: <20261021-b4-super-lock-unborn-v1-5-0265eddb6dee@toxicpanda.com>
References: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-unborn-v1-0-0265eddb6dee@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792601235; l=3703;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zTDWcYWzoDo8/94Xg6nLn0s5owmVnnz+Vo7YSVcNaSY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNOcD8om5fSfSdohwSgTPqi3phNz1b9Ldot8kpCZnhlvTh964CkGhXG3XO+vzDcFKQTLgfFmnb4
 M3Jd3us6khAQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Writing to /proc/sys/vm/drop_caches and quotactl(Q_SYNC) without a device
walk all the superblocks with iterate_supers(), and like sync(2) they hang,
unkillably, on one whose mount is stuck before SB_BORN.

Neither gets anything out of the wait.  A filesystem which isn't mounted
yet has no page cache anybody would miss.  It may well have quota turned
on, ext4 and XFS do that while they are being mounted, but nobody has used
it yet.  The only changes to the quota so far are the filesystem's own,
from cleaning up orphans say, and it has to get those to disk whether or
not anybody calls Q_SYNC.

Add iterate_supers_born(), which skips such superblocks, and use it for
the two.

iterate_supers() itself keeps waiting.  Its remaining user needs that:
selinux_complete_init() sets up the superblocks which came before the
policy was loaded.  NFS calls security_sb_set_mnt_opts() from its
->get_tree(), so before SB_BORN, and without a policy SELinux puts the work
off until that walk.  Skipping the superblock there would leave it without
labels for good.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/drop_caches.c |  2 +-
 fs/internal.h    |  1 +
 fs/quota/quota.c |  2 +-
 fs/super.c       | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/drop_caches.c b/fs/drop_caches.c
index 49f56a598ecb..7ba726837075 100644
--- a/fs/drop_caches.c
+++ b/fs/drop_caches.c
@@ -61,7 +61,7 @@ static int drop_caches_sysctl_handler(const struct ctl_table *table, int write,
 
 		if (sysctl_drop_caches & 1) {
 			lru_add_drain_all();
-			iterate_supers(drop_pagecache_sb, NULL);
+			iterate_supers_born(drop_pagecache_sb, NULL);
 			count_vm_event(DROP_PAGECACHE);
 		}
 		if (sysctl_drop_caches & 2) {
diff --git a/fs/internal.h b/fs/internal.h
index 71ab0ae11941..dd29e98e05fb 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -137,6 +137,7 @@ extern int reconfigure_super(struct fs_context *);
 extern bool super_trylock_shared(struct super_block *sb);
 struct super_block *user_get_super(dev_t, bool excl);
 void put_super(struct super_block *sb);
+void iterate_supers_born(void (*f)(struct super_block *, void *), void *arg);
 int iterate_supers_sync(void (*f)(struct super_block *, void *), void *arg);
 void __init super_dev_init(void);
 extern bool mount_capable(struct fs_context *);
diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 33bacd707580..713e66e4d00f 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -66,7 +66,7 @@ static int quota_sync_all(int type)
 
 	ret = security_quotactl(Q_SYNC, type, 0, NULL);
 	if (!ret)
-		iterate_supers(quota_sync_one, &type);
+		iterate_supers_born(quota_sync_one, &type);
 	return ret;
 }
 
diff --git a/fs/super.c b/fs/super.c
index b8d6f1c969ce..1cfacd71a0d8 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1110,6 +1110,21 @@ void iterate_supers(void (*f)(struct super_block *, void *), void *arg)
 	__iterate_supers(f, arg, 0);
 }
 
+/**
+ * iterate_supers_born - iterate_supers() without the wait
+ * @f: function to call
+ * @arg: argument to pass to it
+ *
+ * Doesn't wait for superblocks which are still being set up, they are not
+ * passed to @f.  For callers which are after what has piled up in a filesystem
+ * in use.  Not for callers which have to get at every superblock there is: one
+ * which is skipped may be in use a moment later.
+ */
+void iterate_supers_born(void (*f)(struct super_block *, void *), void *arg)
+{
+	__iterate_supers(f, arg, SUPER_ITER_SKIP_UNBORN);
+}
+
 /**
  * iterate_supers_sync - iterate_supers() for syncing all filesystems
  * @f: function to call

-- 
2.55.0


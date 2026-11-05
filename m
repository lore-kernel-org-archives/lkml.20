Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890701;
	b=NlAAe+WycIc27/glg3IDOO882xxL4yOhYGtJ4P/Mc7xxfdWefT7wUHka0sMii3bGo7/L
	 thH7vQ2WIdyHF2iTHFmpBN+gcmCEn0lNjOxNWPd9Nz3r9+R2r0l0z1291hIU/PFg4oOuX
	 CGQ6vT0bCXRBioko22eJGaRNEmuocwuzli3w3sAERbwYKT52gm5m/AsENSBlLP6NTV3rM
	 yUKmEPkgpPquuie35lhSD1rj9UysWdgo3Lb9PbHOMdF7mWfjFzZs5iR6WCfI+siMEI6mJ
	 q6EqDZhm6n33Zj+7H/dorf1wrdPWpXplZuR8D9+FKpcNuVdJKzYWt7ZxGIdEzJIQTqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7CZsXFnxA0NxfAsYE7DuSXbwqSdrAjqhWj36gwSAHOE=;
	b=Scxo/b028XKHsRen+5OXdZUNi96WABgsgPum+2Kia2CMILo85YotxCNNuoSljOTjQZsv
	 9BLh6YSZ2WhlaywJvJa9ZnT4hhS41mhb+GUjXFvsA0XYYNBUYShuYakoif1vG+5Eo8ZdC
	 ojMGJQoDnSBQgPDFzYRmjt/RK4fm6DGF0nWE34YVrc3zcq/sPtDpoW2Dp3fAuZOhN46we
	 WtZw7W/yKtr5EWhNt3RylYKWFnBILu0nfcQrmlWn/JGlh1ky7uIPHfLhvl2thh7R6DxYn
	 Rmpl4bt4+Mi4I5OXp6hLQIfJrcgBZcNGyY+j+2Xk4NunZ+KTn+OY1GxHPo81tS27ifA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=YIjppOw3;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B930A606EE82
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B930A606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=YIjppOw3
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-451a49abd8aso1766310fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890700; x=1794495500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CZsXFnxA0NxfAsYE7DuSXbwqSdrAjqhWj36gwSAHOE=;
        b=YIjppOw3HstYQrgg6qQSltIsmr2+eYL84a7nDBKGOpZ+vKMUC9BsV7rVousld/vsN4
         wDj/U9UxthKrIPdOIbP8DGPtiGPpzRksANPMBLFoAsz70/HJRZ8f9aRxGUylahM0CAX9
         /WV96j+LLEHnjtz5vbHWBJgSYreowg4fVgREeBRVQaRTGlaKXMzR0LQ0uBrJIK6anyHt
         kD7owvqocfQL8b1gGb+1Vx2UB22EOfvuh3GZWcUjZ0bCOJ48oSQ6uK8xeX/+1u70uHmz
         XKEIyuxPH6W9A9qhtcJWk7KlLW/dtK6WU9tLv8r7CV/6/6ThC96lZQxkFtMgfnFRhreJ
         eVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890700; x=1794495500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CZsXFnxA0NxfAsYE7DuSXbwqSdrAjqhWj36gwSAHOE=;
        b=W+p1Nr9GyFx5ODxSYyPVKXZIx/KkaXGc2lFy2YTAqQhk8uuZg53J6NFCmXqZv6uzPv
         DkocH6Uw4JpMx9GL+z8Zrk+ArJDX7I73ybkV6FWmbtycVBIrak6a5t/Gec/yFSS3g43r
         zUG1s6mNuMKnFtjjgm7XiR9+KdA93bpMcVMbaVGKuXBJhQCv/Fm8P9+MgkRAIZ5SswKj
         mWKRIEbCr1o3GVKndex1E+Uo+E+ZIcd6uOEinKC25bGi9x4z/IycRF4iZEsjqDAET7cy
         npllQDPt0NHy5HdmZw26G79vkP3zlCkHVJuuqSVYPNAuNXWxAU0lYuCt5K5S/Psj6nBS
         IUcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsohecmqWCIjm2Lllus0LoItfXlJi8KSdM3tsJ5ha+mrw14uMEswzoTpg2imkN0qrNO/IsjkgzgY7kKp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ay7bjhWkLfCBwJVGDNnSI/xEpWxMvCZFvMnZChHJrMDSR2h9s
	1u/KLcqJS9cti6wSzEbqAtNw2qZ3evkPRL011gAT1wa3Ufm0+sLz+1SDgeay4BIcQnc=
X-Gm-Gg: AYBFou2qr0v7Dr+oorkst5MAihWYOhl4zYXbuGRgedgj2a2WD7W+nHxdYHtUzrfiwUS
	84YdSQ4QaqhdmrLA3eVYhs4SmLisx3HbHXbQjZt/F5Q10t26URS4A3Fn2BOGnfpmwMSJueSBmzL
	cUu1xZOWilHaV6UgTTS6r23hVqIPabg9ai1tG+m0kviyYSPIw8sjLGdrHYhdbB1t5wrl6yjrZg+
	54kuilQBQTQJXUkYhCpFDbM+MWXCEcywrRL6mwlxmOT4qeI2zfsQf1fOpdxjkLelhSr/v1DeKYE
	oXei2Ae0eEvd2wLZRuzVIC4KEwKyWJBFmPeLjOY6UEukb3vEMY03Eiy1/F49kQR3x8cne7BylY6
	Ep58f8d4ayXwBnCw0bQC4qg5zoI7QySIlXyaIKnOyasqpmIy+JXqLQU+RtSvcyJEwXc1tyCerDj
	fRsIN7prjIJZeDRLZu1KCG3+IOixETM3JXk3FQRqaPRdeKRJ1R89OpozKNT/9f+che8AvlAkfdC
	nmD9oO1RgC9A7Qx6sSD9/n/fV9QkghnN5ik0qqpqeJjVMQsBSFHtPU3NLC6q4FfZFReiOBsNAEK
	kYhZd4/oOdf+9Fge9FXX0shBddOfSdj7cQxcP6Wg8aqVWw==
X-Received: by 2002:a05:6808:1925:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5640d919f60mr17839809b6e.8.1793890699526;
        Thu, 05 Nov 2026 06:58:19 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f4072fsm4508039b6e.10.2026.11.05.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:17 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:03 +0000
Subject: [PATCH RFC v3 12/90] fs: add kuid_has_fsmapping() and
 kgid_has_fsmapping()
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
Message-Id: <20261105-b4-cells-v3-12-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=7293;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Zkvj7+76gUCid6/nPY4lXzK1IonusIHS+kGPBZPjOQ8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLy6fn/eyr6PKUy3EcvE8xJFanyKdnxyBj2+PH7H703pzVt6XqfF0VB6B43Xpuk+J999JyT/jw/
 CEIY5y7aARQE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Several places ask whether a filesystem can hold a given id. Each of them
calls kuid_has_mapping() or kgid_has_mapping() on the user namespace of
the filesystem:

  - fsuidgid_has_mapping(), when a file is created
  - posix_acl_valid(), for an ACL entry
  - the uid and gid mount options of tmpfs, fuse and bpffs
  - ovl_copy_up_one(), which runs with the credentials of the mounter, so
    current_user_ns() there is the user namespace of the overlay

The same two helpers are also used for many unrelated questions. Nothing
distinguishes the callers that ask about a filesystem, so there is no
place for a rule that should apply to filesystems only.

Add kuid_has_fsmapping() and kgid_has_fsmapping(), next to
vfsuid_has_fsmapping() and vfsgid_has_fsmapping(), and use them in the
places listed above.

No functional change.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/fuse/inode.c               |  4 ++--
 fs/overlayfs/copy_up.c        |  4 ++--
 fs/posix_acl.c                |  4 ++--
 include/linux/fs.h            |  4 ++--
 include/linux/mnt_idmapping.h | 31 +++++++++++++++++++++++++++++++
 kernel/bpf/inode.c            |  4 ++--
 mm/shmem.c                    |  4 ++--
 7 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed..37712fce905b 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -888,7 +888,7 @@ static int fuse_parse_param(struct fs_context *fsc, struct fs_parameter *param)
 		 * The requested uid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kuid_has_mapping(fsc->user_ns, kuid))
+		if (!kuid_has_fsmapping(fsc->user_ns, kuid))
 			return invalfc(fsc, "Invalid user_id");
 		ctx->user_id = kuid;
 		ctx->user_id_present = true;
@@ -900,7 +900,7 @@ static int fuse_parse_param(struct fs_context *fsc, struct fs_parameter *param)
 		 * The requested gid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kgid_has_mapping(fsc->user_ns, kgid))
+		if (!kgid_has_fsmapping(fsc->user_ns, kgid))
 			return invalfc(fsc, "Invalid group_id");
 		ctx->group_id = kgid;
 		ctx->group_id_present = true;
diff --git a/fs/overlayfs/copy_up.c b/fs/overlayfs/copy_up.c
index c147ad155b79..48cd09a2b69b 100644
--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -1173,8 +1173,8 @@ static int ovl_copy_up_one(struct dentry *parent, struct dentry *dentry,
 	if (err)
 		return err;
 
-	if (!kuid_has_mapping(current_user_ns(), ctx.stat.uid) ||
-	    !kgid_has_mapping(current_user_ns(), ctx.stat.gid))
+	if (!kuid_has_fsmapping(current_user_ns(), ctx.stat.uid) ||
+	    !kgid_has_fsmapping(current_user_ns(), ctx.stat.gid))
 		return -EOVERFLOW;
 
 	/*
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
index fe77934ea8f2..a2e2ca984d95 100644
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -260,7 +260,7 @@ posix_acl_valid(struct user_namespace *user_ns, const struct posix_acl *acl)
 			case ACL_USER:
 				if (state != ACL_USER)
 					return -EINVAL;
-				if (!kuid_has_mapping(user_ns, pa->e_uid))
+				if (!kuid_has_fsmapping(user_ns, pa->e_uid))
 					return -EINVAL;
 				needs_mask = 1;
 				break;
@@ -275,7 +275,7 @@ posix_acl_valid(struct user_namespace *user_ns, const struct posix_acl *acl)
 			case ACL_GROUP:
 				if (state != ACL_GROUP)
 					return -EINVAL;
-				if (!kgid_has_mapping(user_ns, pa->e_gid))
+				if (!kgid_has_fsmapping(user_ns, pa->e_gid))
 					return -EINVAL;
 				needs_mask = 1;
 				break;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 88748be03505..ea9b9d5a667d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1589,8 +1589,8 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 	kgid = mapped_fsgid(idmap, fs_userns);
 	if (!gid_valid(kgid))
 		return false;
-	return kuid_has_mapping(fs_userns, kuid) &&
-	       kgid_has_mapping(fs_userns, kgid);
+	return kuid_has_fsmapping(fs_userns, kuid) &&
+	       kgid_has_fsmapping(fs_userns, kgid);
 }
 
 struct timespec64 current_time(struct inode *inode);
diff --git a/include/linux/mnt_idmapping.h b/include/linux/mnt_idmapping.h
index 78eeef4c2996..b5e0772aa190 100644
--- a/include/linux/mnt_idmapping.h
+++ b/include/linux/mnt_idmapping.h
@@ -136,6 +136,37 @@ kuid_t from_vfsuid(const struct mnt_idmap *idmap,
 kgid_t from_vfsgid(const struct mnt_idmap *idmap,
 		   struct user_namespace *fs_userns, vfsgid_t vfsgid);
 
+/**
+ * kuid_has_fsmapping - check whether a filesystem can hold a kuid
+ * @fs_userns: the filesystem's idmapping
+ * @kuid: the kuid, after the idmapping of the mount has been applied
+ *
+ * Use this function, and not kuid_has_mapping(), for a kuid that is about to end
+ * up in a filesystem: as the owner of a file, in an ACL, by a mount option.
+ *
+ * Return: true if @kuid has a mapping in the filesystem, false if not.
+ */
+static inline bool kuid_has_fsmapping(struct user_namespace *fs_userns,
+				      kuid_t kuid)
+{
+	return kuid_has_mapping(fs_userns, kuid);
+}
+
+/**
+ * kgid_has_fsmapping - check whether a filesystem can hold a kgid
+ * @fs_userns: the filesystem's idmapping
+ * @kgid: the kgid, after the idmapping of the mount has been applied
+ *
+ * See kuid_has_fsmapping().
+ *
+ * Return: true if @kgid has a mapping in the filesystem, false if not.
+ */
+static inline bool kgid_has_fsmapping(struct user_namespace *fs_userns,
+				      kgid_t kgid)
+{
+	return kgid_has_mapping(fs_userns, kgid);
+}
+
 /**
  * vfsuid_has_fsmapping - check whether a vfsuid maps into the filesystem
  * @idmap: the mount's idmapping
diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
index c6f328e4752e..504bb7accb39 100644
--- a/kernel/bpf/inode.c
+++ b/kernel/bpf/inode.c
@@ -1026,7 +1026,7 @@ static int bpf_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		 * The requested uid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kuid_has_mapping(fc->user_ns, uid))
+		if (!kuid_has_fsmapping(fc->user_ns, uid))
 			goto bad_value;
 
 		opts->uid = uid;
@@ -1040,7 +1040,7 @@ static int bpf_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		 * The requested gid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kgid_has_mapping(fc->user_ns, gid))
+		if (!kgid_has_fsmapping(fc->user_ns, gid))
 			goto bad_value;
 
 		opts->gid = gid;
diff --git a/mm/shmem.c b/mm/shmem.c
index af21a89abb0f..8e7b51797ab8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -4793,7 +4793,7 @@ static int shmem_parse_one(struct fs_context *fc, struct fs_parameter *param)
 		 * The requested uid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kuid_has_mapping(fc->user_ns, kuid))
+		if (!kuid_has_fsmapping(fc->user_ns, kuid))
 			goto bad_value;
 
 		ctx->uid = kuid;
@@ -4805,7 +4805,7 @@ static int shmem_parse_one(struct fs_context *fc, struct fs_parameter *param)
 		 * The requested gid must be representable in the
 		 * filesystem's idmapping.
 		 */
-		if (!kgid_has_mapping(fc->user_ns, kgid))
+		if (!kgid_has_fsmapping(fc->user_ns, kgid))
 			goto bad_value;
 
 		ctx->gid = kgid;

-- 
2.55.0


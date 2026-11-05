Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892030;
	b=cIYqMdmxzYQR7YJhJS44RzkmWS5tbHwY6GQ3EaFRI6V9jJjsVv2O4QOLtaUJwhhu8dio
	 Ypn3H9GbTtKTM65OJAA3Wu+UihkV335Yro1UvByCllhie8tyKlN9JR6Kf3qTDTsgj4vI6
	 mCZJgbT870MAvbTAU50ikUrSxVTyBPDnWSoJ9y49FzyAj1T4KPEQFe9iFQM86DNhAlIPV
	 1LxiJRVP/q+7shCJF79DKkLfaC6bvt5KeRJkLsX2ZQrHErr7X849cdmiZJHKKCCn1NFDV
	 WKdj8G+jownp+OiKntxNFtI2UE58I7QrNV78yN3UdQCl3DEY+HoA+GD0OjA1KsEALkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0KmWGsVhWT2tIS8qTau5tAMp34mec8ReoIQIp9XJHck=;
	b=aQiBrdX2NdYDS7i1SpASRyIf6k4Ykr/h6ckt2zJgbxT6TFMsSW1Sue3oQhOHOZdJ9L7C
	 pPiItMN3eVUEk48TeYF8sxpl2thm9YzgYy0ajhvJ5RjmNHW4jo2vFPiectoN8JYUxJNyg
	 O6GUYRgPh0BdCnoZFDdH7RVQj8LIWCDWOMxiOxRDy0E5V2Kt1fm8A2TzOYNQdrID/xWnU
	 tscCBVs3aSAX62kGzIkJNOutvy4ZoNOPWiwHrvSUg42jthyYsGUcfNmZwFZi6Ea6UkPIF
	 aZtF0F+wDzWxOGVi8NlR/3PpXaHCCMS+8XPelQPlzMeLxdfaeFejudxcgbMyf8FqRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jn3gEM9x;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF39606EEBB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF39606EEBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jn3gEM9x
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so820423e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892029; x=1794496829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KmWGsVhWT2tIS8qTau5tAMp34mec8ReoIQIp9XJHck=;
        b=jn3gEM9xruDn7Twg4rCoNKUUQkCCMaoSKCgjDSYInXYovkQTFkmrwzTa8acj6xxrT+
         JT78XX2/7/ybv6zpbS/xYMUrEjNP1MxwhNGIf9Dg10fNY5HgK1tQJrg8Z2Zh4tS3IeFc
         576c4JpBtzihCQJpix2Mgq7G3UW6afHcUty1Rxd1vYPcd6Hc4a16ZW8OF7FldhMD7bZx
         hccAlUh1AZQ/rZg7Blyuoa8SR08BlLkBcgWyas37xep8dmpQ/4P2MO58M9bIqHKo+GpU
         DsWDx0xwcjyRaSEQdUI/3t9tVgZa1unFYUDpHUKzJuO1YTBQHpZcBMwmJn4zTin37UwA
         vzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892029; x=1794496829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KmWGsVhWT2tIS8qTau5tAMp34mec8ReoIQIp9XJHck=;
        b=ROTmKC+3r6bI3gUznuEmshKKwveVwp+K5hPbnp7evosj5pC/SdRTGJ8cR6Zeoj8+CO
         BywBgnPfhXmOx/ihhITV1JPk6mdMDK6ebr1eCAN9HxmUHfULVQqL7DpeQxgDUG3ORG+s
         UjYdbomURGax6tPfSiBRAimByCrNprC1OqJ/TpNBJV+vIAk0GzngUhFtOzhcOZVQw+9K
         /KwflOqix1tmzUlz/98A96XJXm+2lmwX0yKI0avykzjPWk3mx1Ce+cASn47jMF0vd3l5
         W6lSbsy/tJ8EWI6TmJ7bBWKMmByWk2LgCqgwg/kvviqdrDSoQH2/PtrabnVw6RMgEmWH
         bJPA==
X-Forwarded-Encrypted: i=1; AKwUvByO6nqXeP7sV1V1rlHxlO2H5HJCOJFPIPvQlVDgxHLAnvR9T5XKoIv1y/V8tDKeL5wkAVrSFAoZRpnrjVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u83mtDjHJ7NM3ahgnUixCoPk2I70sWtzED/4+zat2MB21hKg6
	pDCAi5PwDNpuLwfwO9jS6TF8k4Q4aOnOeeiobsxMsgFQHmcAJB7ngjE4Zyx+sRryHuo=
X-Gm-Gg: AYBFou0YZ4qLrgSyb8xSh7AF77OG6mOrXu28ke2a+q4ooll73jzW2REcpCSwDaHJ8MF
	K38sl/bjSKbCELJqgchB7b3WzQ7gk7Z/wHMAayqTysixVjHVNpo8upym4YoGZCM5YJACB/RUNtd
	F0HvfSGRn+WKfsKUCTRMx3h0nr4PHFsLyIfJXNSZBN/PqfCGxTwebmmygLk1Q+D68T8smO/hso7
	8Tm9wEsUtEX0TQ/1NMht6aAO0/3/uRmUYXUy2dxu8mDoNdSstRPU8JDhYc/oqJcVmQYG76hGpqc
	aMFcp7Sq0r+by/jl6V+kdjOA5iIHwng8eliu37YKQT2K2q0nxuwB/OezRTRmrXouPR8KSEMhySh
	E4HzW9L5+0tVvr73OAU0pxcX/6mSe1mi874fy7vAAKC7kTTvwgxuPN/zvdqKsO74M/ITCBPAj0i
	YjpLEKnk1JgsuVONYCcVJzc09+pzbSq/EvgaLnvi76WvpR/7qP3V8IEUXR+J1GvLt7xV5+7ftM9
	PYTWAQVLJ8mi66jeAht9XTxTnBFaosRQDesWe+S5Xajp08dxNxapy+qbJs+a8iMVH8a88umny0B
	uhV0kWqMVRMozIIQhEZaauqlI/XFfw==
X-Received: by 2002:a05:6122:298c:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5ec6882f8d1mr9384291e0c.6.1793892028993;
        Thu, 05 Nov 2026 07:20:28 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8da73e8sm4444051e0c.10.2026.11.05.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:20:27 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:47 +0000
Subject: [PATCH RFC v3 55/90] fs: let a filesystem hold ids that go with
 the cell
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
Message-Id: <20261105-b4-cells-v3-55-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=5025;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=UUg0QNdov0WC0UgOyYH69+fR7vhjYoKSlu6D6AIHlJQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKd/crIPi0788ZCHn5va8k+WUR65MpIhx89M/NxnJlmKsZlUr5A2tFThFR7wgz0DqZ774Ecfpi2
 Rs6kDLgKrTgI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A filesystem that a cell does not own cannot hold an id that was lent to
the cell, because the id would outlive the cell. That is the right
default. It is wrong for a filesystem whose objects do not outlive the
cell either, because the kernel removes them together with the cell.

Add the superblock flag SB_I_LENT_IDS, with which a filesystem declares
that this is the case. The filesystem promises two things: whatever a cell
owns there is removed with the cell, and the filesystem itself controls
where a task of a cell can create anything. In return, a task of a cell
can create objects there and can chown them to another id of its cell.

Nobody else can. sb_takes_lent_kuid() and sb_takes_lent_kgid() require
that the caller is in a cell and that the id belongs to that cell. So root
on the host still cannot name such an id, and neither can a task of
another cell. The helpers are called where a superblock is at hand: in
fsuidgid_has_mapping() for a create, and in notify_change() for a chown.

No filesystem sets the flag yet.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/attr.c                      |  8 ++++++--
 include/linux/fs.h             | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fs/super_types.h |  1 +
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index 9706d370f34a..10cf1b3827c6 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -520,11 +520,15 @@ int notify_change(const struct mnt_idmap *idmap, struct dentry *dentry,
 	 */
 	if (ia_valid & ATTR_UID &&
 	    !vfsuid_has_fsmapping(idmap, inode->i_sb->s_user_ns,
-				  attr->ia_vfsuid))
+				  attr->ia_vfsuid) &&
+	    !sb_takes_lent_kuid(inode->i_sb,
+				from_vfsuid(idmap, i_user_ns(inode), attr->ia_vfsuid)))
 		return -EOVERFLOW;
 	if (ia_valid & ATTR_GID &&
 	    !vfsgid_has_fsmapping(idmap, inode->i_sb->s_user_ns,
-				  attr->ia_vfsgid))
+				  attr->ia_vfsgid) &&
+	    !sb_takes_lent_kgid(inode->i_sb,
+				from_vfsgid(idmap, i_user_ns(inode), attr->ia_vfsgid)))
 		return -EOVERFLOW;
 
 	/* Don't allow modifications of files with invalid uids or
diff --git a/include/linux/fs.h b/include/linux/fs.h
index ea9b9d5a667d..e1933649e885 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1565,6 +1565,44 @@ static inline void inode_fsgid_set(struct inode *inode,
 	inode->i_gid = mapped_fsgid(idmap, i_user_ns(inode));
 }
 
+/**
+ * sb_takes_lent_kuid - may the caller have a filesystem hold a kuid of its cell?
+ * @sb:   the superblock
+ * @kuid: the kuid, after the idmapping of the mount has been applied
+ *
+ * The ids of a cell are only lent to it, so a filesystem that the cell does not
+ * own does not hold them, see kuid_storable(). One with SB_I_LENT_IDS sees to it
+ * that what a cell owns there goes with the cell, and to where a task of a cell
+ * makes anything. So a task of a cell can have it hold the ids of that cell.
+ * Nobody else can: whoever is not in the cell is not held to any place.
+ *
+ * Return: true if it may.
+ */
+static inline bool sb_takes_lent_kuid(const struct super_block *sb, kuid_t kuid)
+{
+	return (sb->s_iflags & SB_I_LENT_IDS) &&
+	       userns_is_cell(current_user_ns()) &&
+	       kuid_has_mapping(current_user_ns(), kuid) &&
+	       kuid_has_mapping(sb->s_user_ns, kuid);
+}
+
+/**
+ * sb_takes_lent_kgid - may the caller have a filesystem hold a kgid of its cell?
+ * @sb:   the superblock
+ * @kgid: the kgid, after the idmapping of the mount has been applied
+ *
+ * See sb_takes_lent_kuid().
+ *
+ * Return: true if it may.
+ */
+static inline bool sb_takes_lent_kgid(const struct super_block *sb, kgid_t kgid)
+{
+	return (sb->s_iflags & SB_I_LENT_IDS) &&
+	       userns_is_cell(current_user_ns()) &&
+	       kgid_has_mapping(current_user_ns(), kgid) &&
+	       kgid_has_mapping(sb->s_user_ns, kgid);
+}
+
 /**
  * fsuidgid_has_mapping() - check whether caller's fsuid/fsgid is mapped
  * @sb: the superblock we want a mapping in
@@ -1587,6 +1625,8 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 	if (!uid_valid(kuid))
 		return false;
 	kgid = mapped_fsgid(idmap, fs_userns);
+	if (sb_takes_lent_kuid(sb, kuid) && sb_takes_lent_kgid(sb, kgid))
+		return true;
 	if (!gid_valid(kgid))
 		return false;
 	return kuid_has_fsmapping(fs_userns, kuid) &&
diff --git a/include/linux/fs/super_types.h b/include/linux/fs/super_types.h
index 72f4288e16c5..727a3c0a72dd 100644
--- a/include/linux/fs/super_types.h
+++ b/include/linux/fs/super_types.h
@@ -359,5 +359,6 @@ struct super_block {
 #define SB_I_NOIDMAP	0x00002000	/* No idmapped mounts on this superblock */
 #define SB_I_ALLOW_HSM	0x00004000	/* Allow HSM events on this superblock */
 #define SB_I_NO_DATA_INTEGRITY	0x00008000 /* fs cannot guarantee data persistence on sync */
+#define SB_I_LENT_IDS	0x00010000	/* What a cell owns here goes with the cell */
 
 #endif /* _LINUX_FS_SUPER_TYPES_H */

-- 
2.55.0


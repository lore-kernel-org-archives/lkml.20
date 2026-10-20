Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505569;
	b=mULc3vM+F1lD6E15gC5iemtfP87yC/BzKhkeIT1416yZDMfzRxpodNxbS4ygieYHkIcF
	 xl/VkDdvbMklHNg35sfXDJVKR0/zpgKWN7OPsXJKHwY/Q2GCC2jzZT/bSeza/TZV+Z6m6
	 ifu5nwx5QbFf8GSMqUyAef/yKmuS4anpB+wqyIkki8iQwx4L+fkn92Uh/ZqtKJUc3P573
	 1QRt17ik817q1SvoruahGOMYQGk8+C4hSrEPV1/BdyAP6jIbK6153HkX8AB013iA92F9d
	 v5pN/u14S9t0wHaYmMnQ8vV+MNXpBGTIPWQtiaRAvvPxp6dcYGhl9C6hS50vYr0wt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=46wvXUGTTdCYQp+GZN/U7O2xBO5cyNdrY69XbjYPghs=;
	b=jI8XuRu48O/RMNSU5NrAv3UT6ufnx5mYsmiFBF+df1yr0kgncWInrju0RrYqCGyKs9tu
	 /FW5+pX62mUSGNcH1D+U3IVk+C+/B+5jKxnaRNZGYM4ri6qwB2xKVB9Yrztg2PmXOdyUq
	 zXNHHSwA8vaHpwoW1WGEZWBYF717ipukPGnSdAHBoFTzbXaNpFMJwZQAMB5XtzyLp2bOk
	 7nADjvZ7AFdTT6Gm7vuXU/8QFtdXOASUbYtbBOj9OmA6ih0lOfNMZ/a9pAznr6Uoq5TNm
	 fO7OtI2UYCv7CjjSXCitkFycJATAwMUAyKs2hLXbwyF0px59ajcfc661yd8pZPJWF4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="BwuSN2/6";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF74606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF74606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BwuSN2/6
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea0efd636dso12512965ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505568; x=1793110368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46wvXUGTTdCYQp+GZN/U7O2xBO5cyNdrY69XbjYPghs=;
        b=BwuSN2/6UA0XGNVZntwzsxA0/3Mm2L/VYaOWYBJBQqxTa1SCS4NBC5KUK39VYFEcsB
         GLsvhe0tELu7dWw7f2QidNRFuA48oJ1qSpQDpETuolOU7RnrbnICBlCUXSDJvWlN93Om
         QdQzVYkuDTF9xiNDMrD5pUV2mEpsFhsKSAJCq8Ibcg8iinna6kHcdoZRXJCB85BQ97Hx
         NBbElJ7z8swt3PLLNVJlr1QnCRhpif8RkYl9kpgVLa8kslMgf8EcwNpQlAxXq+imoFxw
         cGYjMze35IdkGxozbjbdcje5Eq0kugAc3cUDyfiDDnt2OgJi4j6M9jlzzSECg7vJdiQB
         iwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505568; x=1793110368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46wvXUGTTdCYQp+GZN/U7O2xBO5cyNdrY69XbjYPghs=;
        b=nXb/YFLNDOb77+mwZaZ2IGpFruxjaA8M5srjPOQ7GhhecZFJ+9eXuDWBYLH447nEVu
         S/WpunRyU11yIsqqtZLbcnzDWw468k2+v6mkJzgJ3pgfIubWiUC3RQsLk5/SATE051WL
         I3ka07ojdYhAQdWx3tNiDewENse4k4NpNAgkz8huyIAWpMrgd5EUZ4PVHJ0GJuhA8aeX
         UexKB+XLGKOTbEIiJ2GG0YtNYdHHw62xGJOYLEuzHj6mBDnpoypJHtyiEejMEWpEMe3H
         SxgRHqXcLmUqTyTZt7SVRmuiCo2JybER3j9KQ0jCBKqC1wZbKJ+zZ7OZjJpd4Kp50FHy
         rsjw==
X-Forwarded-Encrypted: i=1; AKwUvBwLBPBnCY883t2K7D0GS6at5f6L3pH53f+m+w3+uRfFKRojD/Q45UTrbYPCHBku2GBQ0K8yNpWsos7CsMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5lZpSTrpOPWa3aQDfQjUJm2rUlNHW7DvpiAnA7FnZTrGEBTkI
	Ze8RyFkxby7CI/cnIRUhX2SxYXrefhCxHmA4ctwvk5YBag65Mb1xP+qz
X-Gm-Gg: AYBFou3bqxyqq5qO0DEe/mMOtAwpyFauL3qrL0Jefm4NOaQj5eIRz0HQlgYp0szoJS1
	NsxK7wsF1a1yIkxSA6TJaFK+2g6vDfEvzg8t5wMlLs51lmlRL2T/K0S9V4keaghHmOn+dXYt4EN
	9Mg+GqbLfGNWJqy00r/xAovSnrmBfQtzsuW6tR+t2TPUPAc5+kJOhDkiS9Gx5MDpI4sb1i8P/60
	M4Jb49mfHm2s5+oivRncVCg5FgNFJuxrvT/R9xeAldLtCK/lr15naP8a/cjOeiO187pZnz6x1gY
	5A3m0PMnguxU2uSvDDt70YAVB9hz971c2FQAJe3eSN+PLMHveqNgzomKFQWu067JjOHTuwJD+mH
	NL+Gs/9QOX40NuqdEdOcllQLaFQpIPvOTNdp4WX9CyU8r+1O9rtkOuSZfFjEkKZItL5Eg5e3egE
	O2OHy6J6aCcUyn95Djygpy9Exk2X0R0+NgQcK01063CqxcrlUVbfFePY/chDUeXu4dGJOeB9PD0
	Ehwem7HYX0z8aAEtlzKxR3TwLsg43kTHqn5qdnOpcCgisSVzwzelLYjfQ==
X-Received: by 2002:a17:903:1a45:b0:2e9:5714:6081 with SMTP id d9443c01a7336-2e9a670acd0mr95980245ad.0.1792505568071;
        Tue, 20 Oct 2026 07:12:48 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:2646::3d0:4a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14ca2909sm12535455ad.25.2026.10.20.07.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:12:47 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+d123c96491067a2ee754@syzkaller.appspotmail.com
Subject: [PATCH] configfs: give the root inode its own lockdep class
Date: Tue, 20 Oct 2026 21:12:43 +0700
Message-ID: <20261020141243.87911-1-ngocthang2710.1999@gmail.com>
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

All configfs directory inodes with s_depth <= 0 share one i_rwsem class.
That lumps the filesystem root together with the top-level subsystem
directories, which makes lockdep chain unrelated paths into a cycle:

  gadget_subsys.su_mutex -> func_lock -> tpg_instances_lock
    -> root inode lock (configfs_depend_item_unlocked() from
       usbg_make_tpg())
    -> frag_sem (rmdir under a subsystem directory, e.g. /config/dlm)
    -> gadget_subsys.su_mutex (uvcg_default_processing_bm_controls_show()
       called under frag_sem from configfs_read_iter())

The root inode lock and the lock taken by rmdir are different inodes: the
root has no mkdir/rmdir operations, and nothing that holds the root inode
lock goes on to take frag_sem or a subsystem's su_mutex. The report is a
false positive, but it disables lockdep for the rest of the boot.

Give the root inode a dedicated class so it is no longer mixed with
subsystem directories.

Reported-by: syzbot+d123c96491067a2ee754@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d123c96491067a2ee754
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/configfs/mount.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
index d8cac1cbf3bd..1a7c882e9f70 100644
--- a/fs/configfs/mount.c
+++ b/fs/configfs/mount.c
@@ -24,6 +24,7 @@ static struct vfsmount *configfs_mount = NULL;
 struct kmem_cache *configfs_dir_cachep;
 static int configfs_mnt_count = 0;
 
+static struct lock_class_key configfs_root_key;
 
 static void configfs_free_inode(struct inode *inode)
 {
@@ -74,6 +75,8 @@ static int configfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (inode) {
 		inode->i_op = &configfs_root_inode_operations;
 		inode->i_fop = &configfs_dir_operations;
+		/* root is never rmdir'd; don't share a class with subsystem dirs */
+		lockdep_set_class(&inode->i_rwsem, &configfs_root_key);
 		/* directory inodes start off with i_nlink == 2 (for "." entry) */
 		inc_nlink(inode);
 	} else {
-- 
2.43.0


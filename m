Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B5D49CF4E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436308; cv=none; b=bSDqIEw9aKAy1V72P7sMxGum/MGR2vBytxBPouENILCSRingLZNa32e2oa5FxYqkVsQoQO8pw2z9dkfaOOF61b0UrHsDsDiTzzsxvijGnP5HlLDopxoCJdVr/23Td7OknEZmroXEanZFvlO+AGN6A8eL10ZzFN6mtRD3eq70EO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436308; c=relaxed/simple;
	bh=I/o0B+U6DalnOsTcEmAG0rK+NVMF2eOxour2nwHS6uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJnzm9LkmVULH1CD08mj7d1TuKezNmanAEExeL+l5Yj2BVpWKHy8cK+otdqZYjqATLnTn3IWwQ6Lsu2L4HeNQ2GHHwgtuxzUXuMj3lYtUV8pBZvbAT2jVyfZrh41J2pmeDw2eWT4ngGeCrcpTLs3VXfnYBpy5aPExc6diYfgQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9p3C5/Z; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9p3C5/Z"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2544ff970dso330587266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436300; x=1789041100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Uzx/sArEiSDEeDHsMNzdeWeAZ++sejZ/sbaE6acPVQ=;
        b=F9p3C5/ZT2h5mZU8UkyPiahUpjPUSHcobs6MP8IOpIrRpc3OYazfQla0WS1zydLGOi
         1gFoN5WmpAlCVWNzuX/X9KdABf6mUE7esACt2yLgIpeaJv1b+Ya/9iKRXOGGJ8zipGLv
         wJtXvrKKMvjb1f8zJdtdNxDbE8bn2ewBmHF1HBEn+gcjFGP+uKckOQonNphUqtIONDmc
         LcMj27Nqoj30eaPsQrVJEKhaEXgY7175eImbgkdwZiE0GJPT+gkIdTuO6OCfDeu+YpFs
         8kMkhWKuhMDO8/BumNKqFMmkYQYkfPjYwo1WBtOYJ7CSgeCnO5TV0NqpBzXMkBLSuFXy
         iHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436300; x=1789041100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Uzx/sArEiSDEeDHsMNzdeWeAZ++sejZ/sbaE6acPVQ=;
        b=RcFThhQQcyuN6AJ9adoqNYNSMxrBoLDeeebMbcjszv6pSGiyznbw4VeNrFs4v6RKYk
         ffHeOBzsUf9arRf2z1ySglboPnkvxbIVbXylF53cZwNvdKFXWyvizTPabS2AW6EnzWUS
         BGXE0G2iS1hGdi0NM5d9ZrzXjTCQh+YwLXaRluVD8Vbq9rQwh5trkQAHZ8d5UndPmpBh
         sNcjmoTqnbEuSXcuaVW1GTGERp17ZrFhYhQoFZKz00s7/hzrkguAPQlDEM5IvXEhaqT1
         ZJpgAEtGWmRbfAb+iCgKd/mGaNqftA/IIahjh1idi7JKE8wI/iLilJUX423KTUk2FMPC
         GYyg==
X-Forwarded-Encrypted: i=1; AKwUvByA3PtBRz/9eiKv8M95prBGW7qhlroUBde4BkFa5htKrmMv1h9/ygHSi6YtI3AuXXTz5RJmuqF7V16Pjbk=@vger.kernel.org
X-Gm-Message-State: AFuF++mwbuJA7oijMx0gkXwnvRGKpfTtt6YO4QwPybknE5Mguz+L3qIB
	vt9lUmE5SF9CSCxszTx0Fnk2Bu2FkVRBBrKXThVejbT6UwLA3K0luwWR9e0fyY2efTZGPrW+
X-Gm-Gg: AYBFou2I/u32ERLrRvwuhm2CEcIcic87po8DWdx+spWeoawAGyyx1MFXtwKT401BUQw
	jbOUkvSoGGruYYTN7c3Td6lYmWoMfmzdt1ycbZUezx8VChFiW4KXLEgtKZrw10u8r0R89RWkA2+
	03UBAksKgljgTtwwF4DgtAS+frLfbPE5cslCT9qeFKghcsHfBriE7TJCXinxlzUt/3SIGGWP4tD
	mDKAz6nYHkH0kskTSOqDoNdTllQ5DmpbMjydI8LbWdejgHm7Xm0ZogLrS2g2HsfEcKq62RQ2JqZ
	GCRo8Mz9uIBtvWoYq8VdvrlOs7pLcM2/B7u+dxegPnQ+gtT4mgUkGMaZcJYCmYlzw7fa0W/iK7J
	FdUJ8Tue2xzqdJTeb09PUKv/3FaHmPAaLThR45jkltwgmwuJBp6ER61vHopucEj2ImNxaOrROht
	jhkswWRjDV1aiyntdZOYUo+9p6XzWO0xMOnX/fhC6agL5964RGcSGHbqkRih+jmFzTVvPWHO9SK
	Qn1saa2jhPq7g4z7oai1kHAAFUvs1S4MFgekYHHsPD7ZdABiSN/FIHcuRXU
X-Received: by 2002:a17:907:3e93:b0:c24:6445:d19 with SMTP id a640c23a62f3a-c25d54e1bcbmr699666066b.17.1788436300312;
        Thu, 03 Sep 2026 04:51:40 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41a104fsm87815766b.28.2026.09.03.04.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:51:39 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Cc: Yohei Kojima <yk@y-koj.net>,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] debugfs: don't warn about uninitialized debugfs for an error parent
Date: Thu,  3 Sep 2026 16:51:35 +0500
Message-ID: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c3a280ff728a
("debugfs: warn if file creation failed due to uninitialized debugfs")
every boot with CONFIG_REF_TRACKER=y and CONFIG_DEBUG_FS=y prints two
errors before the root filesystem is mounted:

  debugfs: Unable to create file 'net_refcnt@(____ptrval____)',
    debugfs is not initialized yet
  debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)',
    debugfs is not initialized yet

Nothing is actually wrong.  Both files show up under
/sys/kernel/debug/ref_tracker/ once the system is up.  The kernel is
reporting an error for a condition the caller has already accounted for.

net_ns_init() runs directly from start_kernel(), before any initcall, and
calls ref_tracker_dir_init() for init_net's two trackers.  debugfs_init()
is a core_initcall, so debugfs cannot possibly be up at that point.  That
is by design: ref_tracker_dir_debugfs() is documented as safe to call
again later, and net/core/net_namespace.c has a late_initcall() that
re-registers both directories once debugfs exists.

ref_tracker also states that intent to debugfs.  ref_tracker_debug_dir is
initialised to ERR_PTR(-ENOENT) and only gets a real dentry in a
late_initcall, so the early call hands debugfs_create_file() a parent that
is already an error.  debugfs_start_creating() honours that and returns
the parent error, but only after the new pr_err() has fired.

Move the IS_ERR(parent) check above the debugfs_initialized() test.  A
caller passing an error parent is propagating an earlier failure, which is
the pattern debugfs documents and which the warning is not aimed at.  A
caller passing a valid or NULL parent too early - the case the warning was
added for - still gets it.

One behaviour change: an early caller with an error parent now gets
PTR_ERR(parent) back instead of -ENOENT.  All callers of these interfaces
are documented to ignore the return value.

Fixes: c3a280ff728a ("debugfs: warn if file creation failed due to uninitialized debugfs")
Link: https://lore.kernel.org/all/6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net/
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

Tested on x86_64 (AMD Ryzen 9 7950X), Fedora, v7.3-rc1 plus fixes
(940de590b839), CONFIG_REF_TRACKER=y, CONFIG_DEBUG_FS=y, with KASAN and
lockdep enabled.

Before the patch the two errors appear on every boot, and
/sys/kernel/debug/ref_tracker/ still ends up with one net_refcnt@ and one
net_notrefcnt@ file per network namespace, including the initial one -
the early failure is recovered by the late_initcall() in
net/core/net_namespace.c.

After the patch the errors are gone and the same set of files is created.

#regzbot introduced: c3a280ff728a9039c72cd64ad0b32bc3a28c25b2

 fs/debugfs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index e054e62919ec..a4d08bd3743b 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -368,6 +368,9 @@ static struct dentry *debugfs_start_creating(const char *name,
 	if (!debugfs_enabled)
 		return ERR_PTR(-EPERM);
 
+	if (IS_ERR(parent))
+		return parent;
+
 	if (!debugfs_initialized()) {
 		pr_err("Unable to create file '%s', debugfs is not initialized yet\n",
 		       name);
@@ -376,9 +379,6 @@ static struct dentry *debugfs_start_creating(const char *name,
 
 	pr_debug("creating file '%s'\n", name);
 
-	if (IS_ERR(parent))
-		return parent;
-
 	error = simple_pin_fs(&debug_fs_type, &debugfs_mount,
 			      &debugfs_mount_count);
 	if (error) {
-- 
2.55.0


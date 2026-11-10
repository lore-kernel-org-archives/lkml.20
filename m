Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318110;
	b=o2qjDmfE2Ux15Zd2BnNwqceN0c4dwccpl5zK68EazQtxiNCMOogGW813arjZNL1auRIU
	 3cAjKpeTtFwCC65UqnQ857ii81mIETqeyT4KBvKnO6Pf0xaO7zIf8w1lQ9mCZpAr1WBv1
	 GmTmtV9dBV5drWu8GyQBckzGQzDcaIVl39owjpyUcgr3eYQq/TMmYlOBa6bcFffM9Eou0
	 nyIPKgiEoVjTohMrT59hysw92xLzV4swyYEIbMyp3S7ktPN2TPNyNYAQgQvOvjCwrIKtR
	 wJgSWAkg7CRBYJGxFgUkIuTQp4MN42UFo5x4krCjehn4Qw53hyTYTI2JDoaLdILRTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318110;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=I4NC7lUnuU3t6RdztBdinj8K1pbEHcL7U0ZmdoGloDc=;
	b=Uz3hdBoECw7a96wcCxgab1RyIxW/pY1NM4APOmX95KsZtzSbE5oMp85QiYTx95NYP7bD
	 ESB9wYbaxQsq8gtQCD+kCyF5Ny/W0wU3Xw0dETodaTklDEANzmxuhbdiaTnqZknJx1Mcf
	 fMzcXmUtdTmD8nqSpcQMLXR2ukbowrCzPAwkbvp5kNAyocVxiCa78LtYHWTKOOjc50Eff
	 itoDgvs/v2fYxwUFnyQmbddUiZcvcH0C41b33Jid1DJ9IIclK+SrP7VzLNB5IcforIcu1
	 zF1a1OFe5CxyJ+heXUtW3gO0+HZyymvv5zKgxG8RhgrSSP8ST3/rIQMnb4iDTrVMchg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=oeAHCfdj;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B35606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=oeAHCfdj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=I4NC7lUnuU3t6RdztBdinj8K1pbEHcL7U0ZmdoGloDc=; b=oeAHCfdj9hG7nViqF+JtS5/7lQ
	QoT12sD6vmUY/ZE9sui9TSDfrb6BQVp1vZEREFpVvQgaTQMMp9Cu2COr++Wfsv59Dn9s9R9ZknZ1t
	LE+pF0DaTZHwk2hMFVcNL2loQTBJXbPi5n7j8wPeJ8KPut8tE6dTCgguC14gJv8BBfv4G7qpMDvBL
	MTFiyR2OPquilVrno7NEXYvCj4jsWiHxTjgRpRWGcIxWgpANvBiEfk8xptaueQdgPmqbol7WjbcYw
	383U56D1KEeBhQbLDKSpr2iY0c2jWlkTqyl8zDQQ7+7O6/BaY7G9pj9T4UePdS9DfovweVEwYsyBk
	GL0EmQmg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xQm6a-00CRbD-1T;
	Tue, 10 Nov 2026 13:41:44 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 10 Nov 2026 05:37:32 -0800
Subject: [PATCH] configfs: lock the group inode in
 configfs_unregister_group()
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
Message-Id: <20261110-b4-configfs_unregister_lock-v1-1-040529e5c509@debian.org>
X-B4-Tracking: v=1; b=H4sIACoe82oC/x3MUQqDMAwA0KuEfFuwnbjRq8gQrUkXJu1ItiGId
 xd8B3g7GqmQYYQdlf5iUgtG8A1gek0lk5MFI2BoQ++9b93cuVQLS2Ybf0Upi31Jx7Wmt+uZpju
 n5TGHGzaAHyWW7dqH53GcMd8Ur20AAAA=
X-Change-ID: 20261110-b4-configfs_unregister_lock-6fea7fcd8b23
To: Andreas Hindborg <a.hindborg@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Joel Becker <jlbec@evilplan.org>, 
 Daniel Baluta <daniel.baluta@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487; i=leitao@debian.org;
 h=from:subject:message-id; bh=lZy4YFtwcqYImJlydQp/C9CCDBO/2v8XFYbkoIpRTF0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq8x8TNg7J8twYc8Nrs523cDHp1G9cQEEiW7fml
 vlHcIim+pSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavMfEwAKCRA1o5Of/Hh3
 bbRhD/9CbWmh+OEi5RRkcMfSEb2J/AiToqn53SZ0HZH9K+a7n7Pgyld+UPsJ8k3797E6ozjaEi8
 EANUH4Mo/HX78dM1LpeK5GOO4pzGrC0oJuo24sH42Tu2/WAxE1vhUjXsEu2qxztsANP7qa7Mb6F
 d6tBiojZJVW3KS90NM6u0eiPCJVwmYh0z2UiG/ftkFMEUSoousSYrRRdxTI3pfMQgOyn8iWG1jU
 +x5hLpQB4MXWQ8aoqPQsXdzQmonUMGcUqptyheWQoMt/lYHnsTWshYuqPFH9aMzvhU+9UhzV1oH
 FlRiHdxS5zC/tcZXK274HzO91etbb6pc+u+MrqPbgRZ/HktlArHAwj1X4Ls/Njzai1WN+Epm9sy
 ZUnQuHxCJ8gi3tK83CLeApdeG55D+Mnb0Ikoo8gb/IvU6U4UFhRAgRS5oo48vnIhKmjy+ZbIqNd
 cE98mjOg/0S3muRkxoyPnh+VaNG97OAOe49JTyP8aAxT1g0NdNll6uXsCbaOWQCMmCQj4cIx6Wi
 nbCvmbCMJ0ipJoziSCzIO0Qoq2h898v63ea0760/ENvz9kFIWhPGzc4/wBRkKAT3A2cdGyuBKTP
 0Zji5Eb9KOFj/Mb7OfDH9jmm891G4W5fr77OwRb457JwRX20wIrCmMpEHeJdlA7gkVSuOsYYKU7
 ruMvrIuDNuWhjrg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

configfs_unregister_group() detaches a group and marks its directory
S_DEAD while holding only the parent directory's inode lock. rmdir()
and configfs_unregister_subsystem() also lock the directory itself,
and configfs_detach_group() documents that its caller does.

Operations inside the group depend on that lock. symlink(2) holds it
once the VFS has checked that the directory is not dead, so
configfs_symlink() expects configfs_get_config_item() to find the item.
Racing it with configfs_unregister_group() breaks that:

  CPU 1 (symlink into G)          CPU 2 (unregister G)
  inode_lock(G)
  may_create_dentry(G)
    !IS_DEADDIR(G)
                                  inode_lock(parent)
                                  configfs_detach_group(G)
                                    d_drop(G)
                                  S_DEAD set on G
  configfs_symlink(G)
    configfs_get_config_item(G)
      returns NULL
    parent_item->ci_type

  [    9.725911] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN NOPTI
  [    9.726694] KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
  [    9.728710] RIP: 0010:configfs_symlink+0x132/0x820
  [    9.734253] Call Trace:
  [    9.735132]  vfs_symlink+0x25b/0x4b0
  [    9.735379]  filename_symlinkat+0x11f/0x300
  [    9.735637]  __se_sys_symlink+0x16e/0x410
  [    9.735889]  do_syscall_64+0x141/0x440

A NULL check there would not be enough: the IS_DEADDIR() re-check that
configfs_symlink() makes after its unlocked window is stale for the
same reason, so ->allow_link() can run while the group is unlinked and
freed.

pci-ep-cfs registers its controllers/<epc> groups with
configfs_register_group(), gives them ->allow_link(), and frees them
right after configfs_unregister_group() when the controller goes away.

Take the group's inode lock around the detach, as
configfs_unregister_subsystem() does for the subsystem directory.
mkdir(2), unlink(2) and rmdir(2) inside the group rely on the same lock
and VFS checks, but only symlink(2) was tested.

A test module that registers and unregisters a group with
->allow_link() in a loop, raced with symlink(2) into the group, faults
within a second without this change and ran clean for 191k cycles
with it.

Fixes: 5cf6a51e6062 ("configfs: allow dynamic group creation")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 fs/configfs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
index 7f4f448a6c66..c4f570686bd2 100644
--- a/fs/configfs/dir.c
+++ b/fs/configfs/dir.c
@@ -1822,6 +1822,7 @@ void configfs_unregister_group(struct config_group *group)
 	up_write(&frag->frag_sem);
 
 	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
+	inode_lock_nested(d_inode(dentry), I_MUTEX_CHILD);
 	spin_lock(&configfs_dirent_lock);
 	configfs_detach_prep(sd, NULL);
 	spin_unlock(&configfs_dirent_lock);
@@ -1829,6 +1830,7 @@ void configfs_unregister_group(struct config_group *group)
 	configfs_detach_group(dentry);
 	d_inode(dentry)->i_flags |= S_DEAD;
 	dont_mount(dentry);
+	inode_unlock(d_inode(dentry));
 	d_drop(dentry);
 	fsnotify_rmdir(d_inode(parent), dentry);
 	inode_unlock(d_inode(parent));

---
base-commit: b8dd3e40fe051c328e71632e3f88b4df5d03ffbe
change-id: 20261110-b4-configfs_unregister_lock-6fea7fcd8b23

Best regards,
--  
Breno Leitao <leitao@debian.org>


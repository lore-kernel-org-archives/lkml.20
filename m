Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C62EC54A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789809082; cv=none; b=LuTXYV7x2T+FyNn+MLvyyNLVKkDIqFPGrWqgVLmHvvZsJYIh612+lxSxdwVAWIZDoG7A10CsZakxUbe5gaoJE2UuE/CuyAEqEQNORvhNqy/4cVSZSRpyfUzi2r2Aw9ZONh4+Aw9bgJ38aCDhzdAsE4Kwwe0rnH+PnW6idHc4fA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789809082; c=relaxed/simple;
	bh=ORiRHKB+JwrO0GltKtdW0BQA+brnPJnWcmeQgWsJZ54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOXMfzxJc0PBs+LhRBjxJZUOJt2KQvQUrgHsi1idt/xTrcAGn2HRafAwKkZVWJuZ2eoA/0wP5Vu/ebm9cuwXa7fxYZ3u66+oEiXFJlcXek4Q9A7lsD9rymMaqRzWbnkh5YVCbaJA3mWV0D7VuuKuvF0uISUnySYgSR2bU5W68ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jl2VmNtw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jl2VmNtw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so11075955ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789809080; x=1790413880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsLqqxIKZBmCtXjtHVRGzVbbW8CvpkjGmMtPkbi9pEw=;
        b=jl2VmNtwrkH7BOGKHoUgEW7ygZ93hpoWULJlseyH5+USs7v7FrSQ8zDGBeGy6CnusE
         Vg6n3Vl7y0/D/B9b1GuVjf6FX4zwrQm7uveXNOPPe12Nrb/xprgRRQEcsnINPMO35ad7
         Q+uVUo+xRuJkWKEIUQcmFb0M+oap+e0GCXmto4oDeiNyNZvsJaibe61YTBDE4Hxgyxsw
         LPcRSb6fHYLm8lpBp1ETi5Bpjez9Xllntd5MSOCYk4Xv0w7Epx9oRtr4Iq1wPNP7eanW
         L9pxsr+5/085lyYKGd9NO5gIVd/+MfKAdezmCgZaVwxXkWEcbe+8WRKW0In3giefD8k9
         CdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789809080; x=1790413880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsLqqxIKZBmCtXjtHVRGzVbbW8CvpkjGmMtPkbi9pEw=;
        b=IAP7Mu1mRFIOLcFq3TswAj3T8nTqMM2UNcTC8nNMkohNRQb3NawGCHpn26hBEP3GqZ
         FlwaCE7LJbn5OkJq+Nl9Hq4GBbaSYjcZOg8ki0H8YnDMcXqKajVgEBLrXEmh660kNlsB
         qLWU53YKk3OZuqqyZKPaduRDP5Zu4HerTfEw69SzLScW5rjY1zrcfnNUOV/ebL/r2K7O
         +/oYfJxS2/CwBf1E45dkCudYtWMgtx08eHIGStXQxS9RplQ5+HBGhFXHTESJK3Hy8fil
         a3M//TekSEJc7U/tr/dJMPkkOF/OQiMFeoLAIfKdEgXRQ5Wgo1glWSb7g2ErpJnWUDaH
         tbGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuH40jSuJHhzaJGGRQLi4T/szs7VrCjSPQJktAy+Ai1pb5Eg+Px+u8Tq9bXA1BYvLWrfWn8fJeiMtK5tI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7PFkFEoK+ejaqMPfplcG1r9ke9J7SjtrWtRTYznZpmdgajkDb
	WmXdjzxJyrt98PELDCETf5Di1nq7gat9PCa0iToFnGqvxUJgrow9gs1u
X-Gm-Gg: AYBFou30umB8tJIfqAsom/ZYreQJlD3z+SYK0zPs7AFtzHN0kHucq+jFGFs6QD2bOP1
	jFpfaYd9+vM9Mxc63LEsAmqeHi5MxdT7sOafnuq39dvNnhVQs6+RLqWqZcCxd/FG57cMifGYZKM
	+32z1CqtRoA4KtpQ3KA8s/7p4QRVE8dJ7QtOSz0+p+WrPQwOsjLYhS+dG5RhEBrm2k8oNXsOexl
	9YUuPxsqr6bSbPxZWvv+JwQ2XtmahiSR9WBScXJHOHNNyDCsBeLiaapve4a4GeTNIzhTAhoDUeX
	Hp3D8BQbtdsbiIjqJlUAYCWYhDJWisVeRdKV8TkuD8klJzWkIi98hgev6oiTCYTN5DGkq1Vgym6
	OXSIf60r9ugDxewtL2WokLv+SH6d/HWUIk0GJtyy277WsYD4Yl5wusAodny5h64JsORflvCcCYl
	OSy366yjzcZcYafodjjEZo0fD7s6Wpic1ZSyZ+KqmLeb4NzRJiQCw+lx4rhA0zQdWMqgnnVdqvF
	Q8Nk+nP0irxV6M0YJHYlWUYU5fLz/DNpHS7xroIjF3aspy6aFUq+8Udc78haydbeACTy3nId6AP
	blsy1iK0Sw==
X-Received: by 2002:a17:902:e54c:b0:2df:34c0:7300 with SMTP id d9443c01a7336-2df34c0744bmr8020155ad.37.1789809080076;
        Sat, 19 Sep 2026 02:11:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179e248sm7853415ad.36.2026.09.19.02.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:11:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH] md: reject raid_disks >= MD_SB_DISKS in md_set_array_info()
Date: Sat, 19 Sep 2026 09:11:18 +0000
Message-ID: <20260919091118.3272955-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

md_set_array_info() copies info->raid_disks straight into
mddev->raid_disks without any upper bound, while also setting
mddev->max_disks to MD_SB_DISKS for persistent arrays. The resulting
mddev is internally inconsistent: raid_disks can be far larger than the
number of devices a v0.90 superblock is able to describe.

super_90_sync() lays the device table out inside the single page that
holds the v0.90 superblock and picks slot numbers starting at
mddev->raid_disks:

	next_spare = mddev->raid_disks;
	...
	desc_nr = next_spare++;
	rdev2->desc_nr = desc_nr;
	d = &sb->disks[rdev2->desc_nr];

sb->disks[] only has MD_SB_DISKS (27) entries, so an
ioctl(SET_ARRAY_INFO) with raid_disks = 1000 followed by any operation
that writes the superblock walks tens of kilobytes past the end of the
superblock page:

 ==================================================================
 BUG: KASAN: use-after-free in super_90_sync+0x1c5e/0x20c0
 Write of size 4 at addr 0xffff888009623c00 by task init/1

 CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G      D W    7.3.0-rc3-g5dd1818b15d9 #3 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x4d/0x70
  print_report+0x153/0x4c6
  kasan_report+0xda/0x110
  super_90_sync+0x1c5e/0x20c0
  md_update_sb+0x850/0x1e90
  new_level_store+0x11a/0x190
  md_attr_store+0x12f/0x270
  kernfs_fop_write_iter+0x323/0x4e0
  vfs_write+0x54f/0xde0
  ksys_write+0xfd/0x200
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>
 ==================================================================

Reject the request before mddev is modified. Non-persistent arrays do
not write a v0.90 superblock, so the MD_SB_DISKS limit is only applied
when info->not_persistent is clear.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
No Fixes: tag: the missing check appears to predate the git history I
have available, so I would rather not guess at a commit.

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU:
create an md array over a loop device, issue
ioctl(fd, SET_ARRAY_INFO) with raid_disks = 1000, then write to
/sys/block/md0/md/new_level to force md_update_sb(). With this patch the
ioctl fails with -EINVAL and no splat is produced.

Note that raid_disks_store() has a related but weaker check: it bounds n
against mddev->max_disks, which is still 0 before any superblock has
been loaded. I have deliberately not touched it here, since an
unconditional MD_SB_DISKS limit there would break v1.x arrays with more
than MD_SB_DISKS members. It may deserve a separate fix - input from
the maintainers would be welcome.

 drivers/md/md.c | 4 ++++
 1 file changed, 4 insertions(+)

--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -7926,6 +7926,10 @@ int md_set_array_info(struct mddev *mdde
 		mddev->ctime         = ktime_get_real_seconds();
 		return 0;
 	}
+	if (info->raid_disks <= 0 ||
+	    (!info->not_persistent && info->raid_disks >= MD_SB_DISKS))
+		return -EINVAL;
+
 	mddev->major_version = MD_MAJOR_VERSION;
 	mddev->minor_version = MD_MINOR_VERSION;
 	mddev->patch_version = MD_PATCHLEVEL_VERSION;
-- 
2.43.0

Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CE63F4122
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808604; cv=none; b=VPC7XUvCF5so5ghsnpVdHKIsvkG4TSlP+fB7dFbQ74wJXSaEpL0nP5SIt8359/OaX5BeDxgpvF3DUYBAWNiDVhjokp0O20QsUagWMK44SNk0XqcTN4fJdnrBSWwoVdDPdit4TUnIjb6My8JaF3A8vyIMFfRcgOEFIr11wBwLhMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808604; c=relaxed/simple;
	bh=melq5UXdrQWJJ2k0jZPaqw8rThkFHS1ZvrDkkHIBXg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a+dIlMtl5ubtIxr9NKItwkKuQnRXRpBj0VNOGChPQmzx6Y7Tv1tYv0SHnWKQQ7p1zJ7ZcVB2VdP6COWqaHim++TsQApBXtAw3TDH6JJAOtln6A54wOzgXz86HziwdYZaMWLIX1fHXiW9z+2nFgPncaQM4l8MCAjLPU6yF3pifU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnopmVHm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnopmVHm"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1178355a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808601; x=1790413401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QaSNMO0uUfr1zM6qLt8sUm63zuw2vovwqSO29roHTM=;
        b=fnopmVHmakt4o7P5cYEQt9v9bfEFoC/xmCkEwMkpgb7YQw1v6jr1FFyK5stczEETDn
         /bMp2eHc8aI4BzKaRG+5XFLk1NeSzNcZLyDv2bmIUWZ/1K85eB969wEW3AknO8bUoxI2
         ZJds3DCKE7MXZfE3y1DQqRviEaVwppM06cDi0ZBqQx2ZJRb2deeCye+BxKTSTIHfPeCd
         9Obs4Pgaxj1ura1WYsyuImTUpLjLklKkr+7FAoTLdgruIZJ8No+funLRmaPrOPnuRiHF
         Xu9mNfcJ8+XWtYXSJT/MITBsFbpWpbNTXIPRSBYIwBhL+PVP2f4dfxCRR2D0sf54cu1l
         I+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808601; x=1790413401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QaSNMO0uUfr1zM6qLt8sUm63zuw2vovwqSO29roHTM=;
        b=CfmSRScSuuJ6dbLV+hTK0I2V1yREnyM/j+7qiXAa1oUMk7sy40GH+Vu9DANBcqdgbp
         xX2Cfb2EFrXaKErL6hN6IFudoIoANvPQNN5GxZ3yqfynVmbjRIJTEwH7YNFeHx4hnHaW
         2rlnSELqaWfr3bAexoNyLdlt7qkSqV7n5TA//VkMgjx3LRwSPMDw4mU2gMk2Ruln+3RA
         uNEnzHo3M7iKo7R1MC6H7S5qcxVJD2aZXxPo/CO+7E3PigqSLvZJVmKQy7aw+V1DfaYa
         BB1CkaEx8aFVF6cUg9S6ydGl2SqDQYfEVfZ1Mt+x/YHZSmuyQUIGU48O0jxEnmJW/g0j
         4K6g==
X-Forwarded-Encrypted: i=1; AKwUvByZILsUzyx8hjty0ksrVRIZ+Hfj1zNq691NABG2QQ9fuHUbojnGgU8DugWNKSDrohJf7AcxP+DcbxN2TTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lnotX8018YCSQFc8y5bpDQTtDw22cQu7lx+PU4bXYfFmtDzM5M
	auUT3e5HR0Yzjru+OWDrLQx2x3Vp1APF4wDM7Xphkg0mQdfPM5OtuYai
X-Gm-Gg: AYBFou0BEyKz7PFjOXvWWr3vbCFaql73EMhvgqxw+ETIz3KZBsPQ1StCdJwNGixvdmp
	QxCLzF520GQLIR7CY8W3dBwoLtOdQAHFi8w0g9y7a4zO5nBt/KOU78n/+FJniXSwDVABqeLtNWL
	VJkLc18dOJqlNslAQ+kxzD2mr467QHFOetQqGrzr0WqJq7lavUW05fpxc0BPFmoLCUrdP6O8jDj
	a7MMhheSqn9C/VYIsNz2oTepPExOTRRmISbL2iSM3Yv2lzt062Au5gzptioUwhTleNpaDimbHu0
	TDy64V1wZVsUIgW7IwQK8b9nDGkVC2vtGJ0pRlNcztKW82gVz6MyxQrTyRen62JDjqaW6nj6MGG
	+BC7NM2VexMkgHQm7vemmv3yZc5BtgMFOOOk0Hwgab8YhevvGd+4cK+EXnlPnprKTMPNczov3mi
	kZO22URk464Y3VebxD5rKh+KzF+aeGmxMkWIKD1MUm6wtOiR8fuCTNtMG9+qIXmTNAXyOV4gaHK
	929CHe2VbJKZ1uEeHKRrhesH1KImHLfDVBJO1AE6yBQ7ylONvWdGXaNwmfJMEbdKqqaDt0HqScA
	zkmBYdhlc/E=
X-Received: by 2002:a17:90b:2686:b0:39e:6a81:c91e with SMTP id 98e67ed59e1d1-39e6a81c997mr5758631a91.17.1789808601184;
        Sat, 19 Sep 2026 02:03:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm3563781a91.11.2026.09.19.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:03:20 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Russell King <linux@armlinux.org.uk>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH] adfs: validate bigdirobnamelen in adfs_fplus_getnext()
Date: Sat, 19 Sep 2026 09:03:19 +0000
Message-ID: <20260919090319.3238583-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adfs_fplus_getnext() reads the directory entry name length straight from
the on-disk F+ big directory entry:

	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
	...
	ret = adfs_dir_copyfrom(obj->name, dir, offset, obj->name_len);

obj->name is a fixed size array of ADFS_MAX_NAME_LEN (260) bytes inside
the on-stack struct object_info of adfs_fplus_iterate(), but
bigdirobnamelen is fully attacker controlled and never validated.

Mounting a crafted ADFS image whose big directory entry declares
bigdirobnamelen = 264 and then calling getdents64() on the directory
makes adfs_dir_copyfrom() write 264 bytes into the 260 byte obj->name,
smashing the stack frame of adfs_fplus_iterate(), and the subsequent
dir_emit(ctx, obj.name, obj.name_len, ...) reads the same out of bounds
range again in filldir64(). adfs_object_fixup() may then append up to
four more bytes for the ",xyz" filetype suffix, extending the overflow.

Reject entries whose name length exceeds ADFS_FPLUS_NAME_LEN (255).
That is the maximum the F+ format can represent, and it also leaves
room for the four byte filetype suffix appended by adfs_object_fixup()
(255 + 4 = 259 <= ADFS_MAX_NAME_LEN).

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN by mounting a
64 KiB ADFS image (loop, MS_RDONLY) containing a single F+ directory
entry with bigdirobnamelen = 264 and calling readdir() on the mount
point:

 ==================================================================
 BUG: KASAN: stack-out-of-bounds in memchr+0x82/0xb0
 Read of size 1 at addr ffff88810099fcac by task init/1

 CPU: 3 UID: 0 PID: 1 Comm: init Tainted: G    B D    7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  memchr+0x82/0xb0
  filldir64+0x56/0x5a0
  adfs_fplus_iterate+0x1a6/0x2c0
  adfs_iterate+0x1bf/0x4f0
  iterate_dir+0x1c1/0x560
  __x64_sys_getdents64+0x13a/0x260
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 The buggy address belongs to stack of task init/1
  and is located at offset 380 in frame:
  adfs_fplus_iterate+0x0/0x2c0

 This frame has 1 object:
  [32, 320) 'obj'
 ==================================================================

A matching splat is also produced from adfs_object_fixup+0x3f5/0x480
for the write side of the overflow.

With the check in place the same image is rejected with -EIO and no
KASAN splat is produced.

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
No Fixes: tag: the missing bound check has been present since F+ big
directory support was introduced in fs/adfs/dir_fplus.c, predating the
later refactoring of that file, so there is no single commit to point at.

Found and verified with a QEMU + KASAN reproducer (crafted ADFS image
mounted over loop); the fix was rebuilt and re-run against the same
reproducer, which then reports no KASAN splat.

 fs/adfs/dir_fplus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 4a1592401..517ffcc91 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -192,6 +192,8 @@ adfs_fplus_getnext(struct adfs_dir *dir, struct object_info *obj)
 	obj->indaddr  = le32_to_cpu(bde.bigdirindaddr);
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
+	if (obj->name_len > ADFS_FPLUS_NAME_LEN)
+		return -EIO;
 
 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);
-- 
2.43.0

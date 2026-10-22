Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693184;
	b=hSiQc1r4lotrwlweR2lUfftAISgVI/yHMfu1vYx67bg00UXkjw17lDEp3ELFi+ktACTi
	 duw+E4AksZpHCtAulrLOkr7fN5UdRJHSO00WgfpYDBUS75FnvostRYFle3DinVebNEeZ1
	 2rA944ITr5uTgaI2vm75VWn6V4/RqCrFGbJK1nrH+0tbGLpWIQ6hYe0b4lOp/NDfhBLtA
	 UeOBygyl+NhsS1+gm89/KC7Pd7QnvjWoSTKMF677D3KLOEllINJ7zw6BJ0q3ffj5Sykgn
	 u6otttRqqFUn/9zQ+gkLzkSQ58Auipm1Elp/DZnoqplqLmAW0aHiVI92ejo/X+extrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V68G4ECg0nxR7NLcm3kWEbTu8pdqcWjj0F2hAFNOQxw=;
	b=qCEMHi0ggwMijYJn/OIvG0FIwavk2BWSuA+1M3HyrSn6FhqeigqVLBP1Gg+GwQfeRFKd
	 yaRo6Tb2AiTjqTXf5HMLoV+IG8RAkAaHEfCfxnhS8xw+TbXkVQxZWcOkCywymOevBsB0f
	 tb/C+IkW++SH11YshUhP54Ek7+R+0+c4IgW3t0BbNxbx+ZiWps6xeESe+wp6+meow6tF5
	 6oluZhNZbp+VulEj3uGlsDvcgwNy+PSZNEZL15v5PpUf+8dg/9SaynBlA/m4tXa0oS3pz
	 lLicCyqJrPmjHkoubi8osgBhxz2ZfnjOFMQ1FFjW+ljjgkIUrYyhROcb1dr8PG/Pmcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b="MEf5SB/i";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4964606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4964606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=MEf5SB/i
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-702dedeb70dso56826eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1792693183; x=1793297983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V68G4ECg0nxR7NLcm3kWEbTu8pdqcWjj0F2hAFNOQxw=;
        b=MEf5SB/iMERqEl/ZPWtQ/PuJKkq4gx2uEzScL2GNdPwRrzp90LizatoTI3kfFyCava
         h64ccf+4SHvF1MsHwgT+t0UvSx5HHJRHCyBjLzzB7ZE5wQeWjp+NE9Lo4S01mfMSqEKv
         QRtUujZZH5dBBGyp100TITE7XgeTjFOJZCyRzSLzyKNF3MaUxyQF+1frnWjkJ2EPPsyd
         qY75jTQrEaJD7vHW8DaUVcon/+EQiPfxprXpN1sRhg9MG+lDSzvRsXavM6KXSQ0LmU2u
         1ttEC9a4rGzeFtFWe/QlQiA/fAu6fA9t5astcgnkCbeh7asiZKYai5QCrl9SI9bEFSJj
         EwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693183; x=1793297983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V68G4ECg0nxR7NLcm3kWEbTu8pdqcWjj0F2hAFNOQxw=;
        b=OhEbnnrqU627n/BVzgP8UnyC2mRF0ovJEfnz7RggfEVS7qWMMOdcR9k6DOJmqScxvU
         qiJziCygdNsXJdocvkH34BUj4V/jHgmv0cfjHoMd4M1mSC9U4DgG19x+rnnR6YfDHJ/r
         46qO87H5NG8rLLcD/pBuIl3ktd5O2GguTRPSkg7c0OZUisatHNzZ4zi0Qco9e/pCI0/0
         YZh1GNoPN+oi4tT17oN0btXTVk+MY6apzzKL5SPXfzRXYGeYTLNlJ/i+CfzfACqwamuh
         uVDjXcSw2DTIX2MYOipJVqgach/FMDt6m1/ooMUl6K/D2Z7uGdjlxOw0LvUXRF2gCOWj
         dEXA==
X-Forwarded-Encrypted: i=1; AKwUvByqKfOh/w7M0nAIsE0F4wr+yFni97pcHJpRnzPnlkZkRCdAmtW1NgiwGsesrj7ofFjzlq9cls76scM6+Pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGb5oEjqZWFxSavqlnVkHmOTQ/qT4WB6GdpaNgobZA6/vwzXTs
	n9LzqciPe8/5MevA3ARjEas3N7izsXvCKkLOgyFSQ/vgh0KA03rAyoEdJ/P+ojVb5kQ3
X-Gm-Gg: AYBFou2emlDbYtZ+VO3pOhrBFKGB17aSDvFCDaii89h5UC+Nz2UnUR8WVN2h7J8sRD/
	Ub+zsPq+JAA+MkDU0/NLwLd83cvrg0FEs0Q0CzAiAASrSdsap6tZVvHma5gMf2F7cfi3/7j748g
	G3ncbCaxmsqEVbxrByP61z/1A7/v1+6sk3JIEAugeoBju2IX4HNxFqFDXt0ayNzCRCRVFNT2wEu
	0IcD8Ndc64swywHNxL2ZXQz4OVX8OGBcIlua8jEyWQdvTeGfVniEjEjwA+k50WbmS0XKQkFWLDJ
	MPerR8xbEzy3ftxRzmTJY5InmWIbpAJ42utxSGpGXog0d70KM+CU4moYmBhLBAVdQgnLzSIq6nt
	SDW2JIMjwb3uGuRmp2mwdXj7rQB8K6vrNTwpQ1nC3SnZzqbSpqsckOMDssu7XSuM7+u6xotN9Sm
	FOrW4F1zwdvdN9PANZSFbViiNpso1lRRORsxTAqGAzszL1QcSdCGSmvTFKXZpCxmILWOtdqzK2L
	TXAfsyehWQ69HyX33inWXQuAe8rSrZuIBkai4XBQl+tLHh/qigm
X-Received: by 2002:a05:6820:4589:b0:6dd:25a3:94cd with SMTP id 006d021491bc7-70b88a87127mr172354eaf.52.1792693182739;
        Thu, 22 Oct 2026 11:19:42 -0700 (PDT)
Received: from nixos ([2601:280:4a87:2c8d:3b7b:2fa6:c84c:64a7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b895f270bsm12151eaf.2.2026.10.22.11.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:19:41 -0700 (PDT)
From: Jay Vadayath <jay@artiphishell.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH] dm-raid: bound array_position before indexing failed_devices
Date: Thu, 22 Oct 2026 11:19:34 -0700
Message-ID: <20261022181934.35685-1-jay@artiphishell.com>
X-Mailer: git-send-email 2.51.2
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

super_init_validation() reads role = le32_to_cpu(sb2->array_position)
out of an on-disk dm_raid_superblock and then uses it as a bit index into
the failed_devices bitmap via test_bit(role, (void *)failed_devices).
failed_devices is a uint64_t[DISKS_ARRAY_ELEMS] (DISKS_ARRAY_ELEMS == 4,
i.e. 256 bits) living on the stack. The only guard is role < 0, so any
on-disk array_position >= 256 makes test_bit() read past the end of the
stack array (array_position == 256 reads failed_devices[4], 8 bytes past
the object). For a raid1 set the role != raid_disk reorder branch falls
through to the same test_bit().

A crafted dm-raid superblock therefore causes a stack out-of-bounds read
during table load. Reachable by anyone able to issue a dmsetup create
with attacker-controlled metadata (CAP_SYS_ADMIN in the target
namespace); the crash fires in the constructor / analyse_superblocks
path, before any md_run or array sizing.

  BUG: KASAN: stack-out-of-bounds in super_validate+0x1cd0/0x3390
  Read of size 8 at addr ffff888007b17828 by task poc/152
  Call Trace:
   dump_stack_lvl+0x64/0x80
   print_report+0xd0/0x630
   kasan_report+0xe5/0x120
   kasan_check_range+0x105/0x1b0
   super_validate+0x1cd0/0x3390        (super_init_validation, inlined)
   raid_ctr+0x2c4b/0xa0f0
   dm_table_add_target+0x66f/0xf80
   table_load+0x2ee/0x780
   ctl_ioctl+0x362/0x9f0
   dm_ctl_ioctl+0x9/0x10
   __x64_sys_ioctl+0x134/0x1c0
   do_syscall_64+0xe2/0x4b0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

role is a device position that must refer to an actual member of the
array, so reject anything outside [0, rs->raid_disks) instead of only the
negative case. rs->raid_disks is always <= the 256-bit capacity of
failed_devices, so this both closes the out-of-bounds access and matches
the intended semantics.

This bug was discovered by Artiphishell's vTriage pipeline, which
generated a crafted raid1 superblock (magic "DmRd", compat_features=1,
num_devices=2, array_position=256, level=1) and a dmsetup-create
reproducer that reliably triggers the KASAN report on an unpatched kernel
(the precursor DMINFO "raid device #256 now at position #0" is visible in
the serial log just before the splat). The fix below was drafted with the
Claude coding assistant; a userspace reproducer is available on request.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Jay Vadayath <jay@artiphishell.com>
---
 drivers/md/dm-raid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 8f5a5e1342a9..d497d7c68596 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2420,7 +2420,8 @@ static int super_init_validation(struct raid_set *rs, struct md_rdev *rdev)
 		 */
 		if (!test_bit(FirstUse, &r->flags) && (r->raid_disk >= 0)) {
 			role = le32_to_cpu(sb2->array_position);
-			if (role < 0)
+			/* Bound @role before it indexes the failed_devices stack bitmap. */
+			if (role < 0 || role >= rs->raid_disks)
 				continue;
 
 			if (role != r->raid_disk) {
-- 
2.51.2


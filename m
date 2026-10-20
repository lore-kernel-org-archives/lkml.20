Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792503335;
	b=aWHVVKdDzqBCtfJsklNLr6pZin0skshz+4+yFIhTdc2HFfjJ87TcIkKv7WWwn314H2Su
	 wRdUarFU+0ClLNK24pHp3c1OeIiA49EKvRxVApr/Q5XlV/MO6VNk+mZJ7IVcfY/vRTTHa
	 QxLvTYSLpF7TSpBZ9ojmNse91hquFrucvjhEqd8CYA83uXJgnJ2PYpB+miK4Fj0W0Zevj
	 tCBqpgB0rFpUqUy1xevGozEukKmUoFo8II4urGgSnHRWV6EsNHVJilmcAYoff6wMo3k5v
	 i161UZiVW1cdS9QrCbHMr8SUOnbIzJpMygTY2iiY2pbx9qAHwNm/1frJGsiJeQ3+gCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503335;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vQHCnrJ9xf/9pAY5nN/7uv0nfQEEhssZELCdjiGat5s=;
	b=qZTc79+JTN0ojrK1jb29fFjwFv+OiaEbmDvdnq6dmQH9hHFSlabF0NhDOBLMqKwEnKj6
	 bI41L93kBNu8PErbR56qnaDu6RvVSu7iBgxcw6zmTxh3wLQMY73LUvXF5SNdKz6FYWdx6
	 C8GBKWvl1n0oSgBPT4NLEESLFMztnCGXW1PiKWCFsnTNd39uPuWYF5zdZ5xk9rDFR9qbj
	 EcOJu7pAAd6818/3zWESG2O7sfaCUIGhuGWRIr9D4ebyoMqSlutngyetLfoWaAIZvHJMb
	 4eV+dVXFcPUj3QgBdshjBBqY5hpFkg96SHyJmphzZ20JjDSxVCFWDsDaPuHLy3hoGsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUbciXK7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDFF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUbciXK7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792503335;
	b=Qe5GlRrB17anpTyfcGYZ62L+T1a38WterA5DWKwdZSjhcmuWwNJAU4gIaHiHwMDHw2xH
	 d9j+2xdIwe5GOcOD8+GwkZXmwDXmpMlH2kDu+DvpKkwqviqROspXv2F9LLQM+UoUl05HH
	 s42sJ6FvACivXXUY/BK2BAT1ziPl0h1NdfWxquf4dHPCP3XiwyUH1lx1c+/1HW9EUSEOi
	 D6KCYYiahb7e4NHPJUAddA83y26Wj15/sV0O5KAWyF5dnivmRuC7VcjzuLJEj/Rew4Rj5
	 BC/aAz0ULdKgRpuwX3aCx/O2pZ/pS0ay9eIlHdFdmT1XS+BIyGxoN0gOpr+VHPRc9DQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792503335;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vQHCnrJ9xf/9pAY5nN/7uv0nfQEEhssZELCdjiGat5s=;
	b=x+Ry10++O1OAaFpeV7D/GmgUBuTsC2V2oRYWwC1hXFmsITSmqxrh4QoZQUuy++cUMgxi
	 IHECLAVLlsc5F44KQtgbj9yXcCsMT7MPJyaooRF/Q4TfdrOdZn7fHxHNYYQ2WTH8iJguR
	 Q6Bsn0zdO/1NkQvRkiypUhX3CMvVBYg1ZANemiyHhytpSA9+xYNCZvA4BMrlrW1KnH6fv
	 qH9W0ptwhcYCl5r402TVmxTbnIVmcZlX6Reb9ZPH4lb4QqFUmsYycYVtM5IQNEGsynLts
	 sB2nd03zRfPXs697h4ROZobQhAU8TlkmLWDaPI43xklzsLC/sX2nPuN6dzunPnD4BRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D51211F000C4;
	Tue, 20 Oct 2026 13:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503335;
	bh=vQHCnrJ9xf/9pAY5nN/7uv0nfQEEhssZELCdjiGat5s=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HUbciXK7CWW3MDt+QhK94CWA1Xyfcb4NiCbKxAXLsY5DwJuFh+n7IyoSjg6Ub0mUR
	 vX4mnPEmpgVhzGiVqI8dsjQLxchane/66EAsBI18oUIIskLupb2MRh84a1f6DkElAV
	 TSkKTct+ocM308ZTpG1eoztZv8s7F4Z2XY1vH4ZhaH0Asu7MXUbno8ehy8mgUdHOYM
	 8Vqi21ZZ/dMv7RNytnCWa75k0V96n+VCMwTztAXpQY7K0BOqdmoVazpmrrnojWYGDi
	 zRuV4H+7bF1FzqY1YhKpueliugsCr+SINUtOhIgxFrH90PY25d55lJlpEKeCzOsvL9
	 lk6Tw9EIIGYcw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 31041405FF;
	Tue, 20 Oct 2026 13:35:34 +0000 (UTC)
From: Nicholas Velten via B4 Relay <devnull+nicholasfvelten.gmail.com@kernel.org>
Date: Tue, 20 Oct 2026 10:35:34 -0300
Subject: [PATCH] jfs: reject slot 0 in dtroot stbl entries
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
Message-Id: <20261020-jfs-dtroot-stbl-slot0-v1-1-3a62946f24b7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACVu12oC/yXMTQ6CQAxA4auQrm1SxsiPVzEuBuhACWHMtBoSw
 t0Zdfkt3ttBOQkr3IsdEn9EJa4Z5aWAfvLryChDNjhyVUmOcA6Kg6UYDdW6BXWJRngjbhtfB19
 fG8jtK3GQ7fd9PP/Wdzdzb98ZHMcJ91Ib73kAAAA=
X-Change-ID: 20261020-jfs-dtroot-stbl-slot0-50e98a7fa738
To: Dave Kleikamp <shaggy@kernel.org>
Cc: Yun Zhou <yun.zhou@windriver.com>, jfs-discussion@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, 
 syzbot+b547ffac63b636628299@syzkaller.appspotmail.com, 
 Nicholas Velten <nicholasfvelten@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792503333; l=4028;
 i=nicholasfvelten@gmail.com; s=20261014; h=from:subject:message-id;
 bh=bzSwpEFa7DNnn/drp2rNoMNn8KIb/+T/IrxFdCNdEvY=;
 b=dzwy0d52wRVj3KPDLcijhVgqbA9dvAd30EtSWzaOULuU1nhvKk3oqJfUkMsYcgLz3wA7ecEQ0
 GTXfAkOIWxGCz+VSydRvs+FTCLPL0WDRv6E2uEKAnX2LJlGYAHMSq2j
X-Developer-Key: i=nicholasfvelten@gmail.com; a=ed25519;
 pk=WVTZgm6yXQ+XrhULAObg4lwcHPhhxAXrAY+YY6svXzg=
X-Endpoint-Received: by B4 Relay for nicholasfvelten@gmail.com/20261014
 with auth_id=1173
X-Original-From: Nicholas Velten <nicholasfvelten@gmail.com>
Reply-To: nicholasfvelten@gmail.com
Content-Transfer-Encoding: 7bit

From: Nicholas Velten <nicholasfvelten@gmail.com>

syzbot reports a general protection fault in bpf_inode_storage_free()
when unmounting a corrupted JFS image:

  Oops: general protection fault, probably for non-canonical address 0xdffffc018ef8da81
  KASAN: probably user-memory-access in range [0x0000000c77c6d408-0x0000000c77c6d40f]
  RIP: 0010:bpf_inode_storage_free+0x1f4/0x5c0 kernel/bpf/bpf_inode_storage.c:67
  Call Trace:
   security_inode_free+0xdc/0x180 security/security.c:1289
   __destroy_inode+0x2a1/0x630 fs/inode.c:363
   destroy_inode fs/inode.c:386 [inline]
   evict+0x8d4/0xb50 fs/inode.c:847
   ...

The inode's i_security pointer has been overwritten by JFS itself.
The root directory of the image has a dtroot whose stbl contains slot
index 0. In dtroot_t, slot[0] overlays the header, so entries live in
slot[1] to slot[8]. check_dtroot() accepts 0 as a valid index and also
skips the duplicate check for it.

jfs_readdir() then calls add_missing_indices(), which treats slot[0]
as an ldtentry and writes the new directory index into its index
field. That field overlays header.stbl[4..7], so the write corrupts
the stbl itself. On the next readdir, stbl[4] holds the new index
(11 here), add_missing_indices() computes &p->slot[11] in a 9-slot
array, and the index write lands past the inline dtroot, in the
embedded vfs_inode. A hardware watchpoint on i_security confirms the
write comes from add_missing_indices(). KASAN cannot catch it because
it stays inside the jfs_inode_info object.

Reject stbl entries below 1 in check_dtroot(), as check_dtpage()
already does for regular pages, and apply the duplicate check to every
entry.

Tested in a KASAN guest: the syzbot reproducer crashes the unpatched
kernel within seconds. With this patch the image is rejected at inode
read ("Bad index:0 of stbl[3] in dtroot") and the reproducer runs to
completion. Mounting a clean mkfs.jfs image, creating 80 entries in the
root (forcing a root split), remounting, deleting them and remounting
again still works.

Fixes: c83abc766aeb ("jfs: add dtroot integrity check to prevent index out-of-bounds")
Reported-by: syzbot+b547ffac63b636628299@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b547ffac63b636628299
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>
---
Root cause and the hardware-watchpoint trace are in the commit message.

The reproducer is syzbot's C repro, run in a virtme-ng KASAN guest built
from next-20261009 with JFS, BPF LSM and gadgetfs enabled.

Not tested: architectures other than x86_64, and jfs_fsck on the
rejected image.
---
 fs/jfs/jfs_dtree.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458..b30eb0889 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -4360,19 +4360,19 @@ bool check_dtroot(dtroot_t *p)
 	}
 
 	/* Validate index validity of stbl array (8 elements)
-	 * Each entry in stbl is a slot index, with valid range: -1 (invalid)
-	 * or 0~8 (slot[0]~slot[8])
+	 * Each entry in stbl is a slot index, with valid range 1~8
+	 * (slot[1]~slot[8], since slot[0] is occupied by the header)
 	 */
 	for (i = 0; i < p->header.nextindex; i++) {
 		int idx = p->header.stbl[i];
 
-		if (unlikely(idx < 0 || idx >= 9)) {
+		if (unlikely(idx < 1 || idx >= 9)) {
 			jfs_err("Bad index:%d of stbl[%d] in dtroot\n", idx, i);
 			return false; /* stbl entry points out of slot array range */
 		}
 
-		/* Check for duplicate valid indices (skip check for idx=0) */
-		if (unlikely(idx && __test_and_set_bit(idx, bitmap))) {
+		/* Check for duplicate indices */
+		if (unlikely(__test_and_set_bit(idx, bitmap))) {
 			jfs_err("Duplicate index:%d in stbl in dtroot\n", idx);
 			return false;
 		}

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261020-jfs-dtroot-stbl-slot0-50e98a7fa738

Best regards,
--  
Nicholas Velten <nicholasfvelten@gmail.com>



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662290;
	b=0AqQIbjdGr5X4WXof988q64PiUCi5Dhf9i35Op1oE+9vPPbuRsGqnaUvFFpGIaYixSuo
	 BEuiYbu3PKQaljv0XcnaQ5OQ3XzMISgX/Xhqc8xJqEiLx25DvmdmEwcGUqGlfG3Zd/Kpr
	 RULOVbZZHEEbXzx9t2x+7lOC1xsVJA4+5akYiZecL5HNjC2Zo8t6uymJup/eDpNZQtLLG
	 YHIFCbWYb4MZP7sFuEXWw7Ju3+8v+3UYVvZbi9K3xFOji1W31SIn6UaYFk5E4q1y6e2+F
	 7Ke6iw22bozQCRpSPlRTVwtka0iCHvsaXCl1Fxlj77/XWrY4NgGcTVkKWdgLKma/+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OoWUKvavyBp7l0yEFdfI809FcCGWR9loHYOW+zBH4zE=;
	b=4MH58PyC6itQOxO9OlYQ3ysljbqAbVz0EONz8QHLJEllkLT+MUN5JOuYxKYt9bNVbpAd
	 UBRoCktyFHlI5HRbZuFkSpkFFi+F5ZGPI69+t4U/A7Msq5AwvCcHip09VbLpVesIrZZQy
	 qlZ3vtrcDho8OLtBHDl2oZw2ubOGMP2aCx9SBAKf2f5+TsaexAJa3HN9oL5x8VSJIIYmX
	 4ipVwnHXCdUAjhD57WpB72YE36myoafIRFY4myo5zOz0IxQeZUSVt8mLi6iXm2Xr6GRkm
	 tD3iP3KLNpbaYb1GuQxrwvIMtCLzeWWqcUUn9BKcwKuyda+qFLZ26wavJJoa64K1AmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=eXbDDDaq;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73747606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73747606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=eXbDDDaq
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so3529074c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793662288; x=1794267088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoWUKvavyBp7l0yEFdfI809FcCGWR9loHYOW+zBH4zE=;
        b=eXbDDDaqOn7p2D9K2i5RdUvuZtVV4rFbqujBe0ac7+apVn/zGAPsyZ3IIg0yADPnuz
         x3wvEdq+ELIWFEyk25Lsr4EwoCT6Ks3YkQ2Y/x1teCRbRyNziupOGnC5GhNyMqDQPwkT
         APa4xQUzsbH6VdYOeXS+Zm06Lv8d4YgC+sD3EdAME2MrNBsMgnu5S2fJf2nsmGC7tOYh
         wntG2pZ8Oz8R1okbS8eaU+0wkdsshorwEi7cI/hw8kLz5zCwqYay7sEkvE/0LluEDaPr
         1rJcRtIs0RefrMpzzG0zdcxi9tH38FAP8SI5Dvn8hwj+MRiwxGruyJh0wC5zyN4Hm4Qs
         HWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662288; x=1794267088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoWUKvavyBp7l0yEFdfI809FcCGWR9loHYOW+zBH4zE=;
        b=GTG/Xb69XHfEPh4HYfPkxaaPtkhqIdG8WzxbEOFUpYPCEB6MgO4veItVEqUX0HCNij
         QRP36l1hlUqyWoRiBbiM/Td9jfZ9XkOJwvMkvOIr58C6vwg5lnCQBFLdWUL7EaROlpqO
         NuB+B9SpRGtS+BCFQJ+BdeaQkfiwh4KcPEjfNjVWotnyZ6tPA/mEvNS8IQ90SD8DbE3H
         2jbj89YoGUIYH3fFhNaex18wqAns6rI6Eh3M1iDhjVQZkwzBZaFJzizOkGtxjCuTHKx6
         ms6BHbaUjJ0Pr1avOJdT4MB3qddwpFHWKozH8dtjrNsefyapbnFnm/84xsITlyUP2Oaj
         ux/A==
X-Forwarded-Encrypted: i=1; AKwUvBwmNeH9BdPY5YUeJZ8sqHD3FL3qrrjWYWt9pzANh6UXIph3jUWqFJi1x+BJpdb/Ulj+fo55ncxifhEju7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV0CzkzPMr6MSgZrpJIGvJ/rmQpmS/spOZb9OFf5Dses0wwJxC
	1TBfpzp0NjmmRY3lkJaz2WA8LW17dpX2klbdE81LsOeBlx8ferXucBtKOYXI38WVFw==
X-Gm-Gg: AYBFou1BKjN19XEJPo8Do/nzHyu3FUqgNX1O0B/WWAh8PziiBOXkSM+RovPWX9LxxZq
	AZ0rOa9gcxX/1NKkcGCg0U+FLQbC6MDOd8WWDJahJpa/OQ4aPxypQxU75JnucGyrv7w85GQOjBS
	p+xCAEZSnLYdm8xOG5x6ihLtIqnf3T4xatlmOCkOGsOldteSXhLl+wQoG7NXLS09r+5M5qGH3Bw
	KQSMNTj73zlx6+gTx/dBEwjEHjfz+Nyyh+h/FXDLGqV60CkAt+URFCcrk/wp14eaa0r2mu6o9xl
	Zx0vJH4LHs0cHX7Z/ix3hrh+d3PRpWL0ypH26GuCN6W2NTkzRkJIuJc8I39sqib/UNilDu7tnNS
	JGhGEynifu+N3aQgMOao58RASJxJ39nDKxV8xP0iyDJibuKZs9KhD05Hvu13qQGgtkJ9eOAgLYZ
	zm7lm5GtnncIOvJIKr49N0lLbY3Q8PXT3ObG80JNktGhpPUw/cO3vhw4GOILez8L2UJmTAw0X+P
	VkxlohIwpwbYNujci1jt7mB1pHGX1W9n+l9Bz+AS+EJYBjnc9AYchbXR/8S5g/LSu3k6++FA6hC
	CZX+sGcxZy/zTxiZ//mUZqAlF0zJd1UyF+h0
X-Received: by 2002:a05:701b:240f:b0:151:2e62:fe6e with SMTP id a92af1059eb24-1ac5e322fc2mr13871385c88.19.1793662288465;
        Mon, 02 Nov 2026 15:31:28 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm36527415c88.5.2026.11.02.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:31:28 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: David Sterba <dsterba@suse.com>
Cc: Qu Wenruo <wqu@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <brightprogrammer@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] btrfs: do not check support for an invalid sectorsize
Date: Mon,  2 Nov 2026 16:30:41 -0700
Message-ID: <20261102233041.310900-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
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

From: Siddharth Mishra <brightprogrammer@asu.edu>

[BUG]
Mounting an image whose super block has an invalid sectorsize (for
example 4097) on a kernel with CONFIG_BTRFS_ASSERT=y triggers a BUG:

  BTRFS error (device loop0): invalid sectorsize 4097
  assertion failed: is_power_of_2(blocksize) &&
  blocksize >= BTRFS_MIN_BLOCKSIZE && blocksize <= BTRFS_MAX_BLOCKSIZE,
  in fs/btrfs/fs.c:137
  kernel BUG at fs/btrfs/fs.c:137!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:btrfs_supported_blocksize.cold (fs/btrfs/fs.c:137)
  Call Trace:
   btrfs_validate_super (fs/btrfs/disk-io.c:2525)
   open_ctree (fs/btrfs/disk-io.c:3507)
   btrfs_get_tree.cold (fs/btrfs/super.c:2133)
   vfs_get_tree (fs/super.c:1943)
   fc_mount (fs/namespace.c:1282)
   path_mount (fs/namespace.c:4337)
   __x64_sys_mount (fs/namespace.c:4542)

[CAUSE]
btrfs_validate_super() rejects the sectorsize because it is not a power
of 2, but it does not stop there: it goes on to report all invalid
fields.  The next check passes the same sectorsize to
btrfs_supported_blocksize(), which requires a validated value and
asserts it since commit d728f2e5f8a0 ("btrfs: simplify support block
size check").

[FIX]
Only check whether a sectorsize is supported after it passed the
validity check.  An invalid sectorsize is still rejected with -EINVAL,
and the misleading second message "sectorsize 4097 not yet supported"
is no longer printed.

This bug was found by fuzzing. The cause was analysed and the fix was
written with the help of an AI tool. Tested on btrfs for-next
(d6f76ca0a70d) and on v7.4-rc1, with KASAN and CONFIG_BTRFS_ASSERT=y:
without the fix, mounting the image hits the BUG above; with the fix,
the mount fails with -EINVAL and only "invalid sectorsize 4097" is
printed.
A crafted image (22 KiB, xz) and a C reproducer are available on request.

Fixes: d728f2e5f8a0 ("btrfs: simplify support block size check")
Cc: stable@vger.kernel.org # 6.18+
Signed-off-by: Siddharth Mishra <brightprogrammer@asu.edu>
---
 fs/btrfs/disk-io.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 8e8fb942d..b348591f8 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -2520,9 +2520,7 @@ int btrfs_validate_super(const struct btrfs_fs_info *fs_info,
 		     sectorsize > BTRFS_MAX_METADATA_BLOCKSIZE)) {
 		btrfs_err(fs_info, "invalid sectorsize %u", sectorsize);
 		ret = -EINVAL;
-	}
-
-	if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
+	} else if (unlikely(!btrfs_supported_blocksize(sectorsize))) {
 		btrfs_err(fs_info,
 			"sectorsize %u not yet supported for page size %lu",
 			sectorsize, PAGE_SIZE);

base-commit: d6f76ca0a70d0c814731394a625ff0dc1feb390e
-- 
2.54.0


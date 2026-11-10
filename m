Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279938;
	b=cvF5+SKwMguwUFdiNEFlO1r0jS3ctrfC2pv+qmRthndN3/SZcdHWyZOURYOEGTgBSnJ2
	 BU17zIEX6hbobvxIj4q24gKF9MlgMrIcYydXmyQaQCddVZA5IeHwNBCWHPM6Q0envWW1u
	 dyhfyqi7WLqDxPj5lyrEj7uJNw+vnQIxpPggYdWaPcB8ahQL2UdPYnXS+c73uOg6hSjYu
	 YtwizbLG9IDvOXjoQwFZpAnMg0OVAPtgaDWmB6cRixiW6tB41ZOhM+8xewx6vciMEUCPv
	 XpmJoedESHcZ73cVMd51va04ktKNfd7SaJgmxK3fzW6HAv2MZhMguqoE1KlTOjM1A1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=WX8HAKlzGxNN6geVNUiXNfag9XxIX/lb5PTYIBvV6kQ=;
	b=k+DeQyTKQ+ed+mlufLezwCMD+P5G3bS2KmUZhrVwl6c+oRYJon07B+B40ZCWbQQXDuFW
	 QpH+NFCa3a8rYJCgCt+E7kSm/W+il5b0D4up9KYlD/NW40b2NMgm0ivcv4/R7Tj0vWbnb
	 nLLMF+39ClwwjVvSfO+WFwxvUDaUJJRHfhv+x6zg+9JP3O6X26Mpxb+esM89K7PB8RMyg
	 BilsZM3QCDXYlcn39QZNWfjYtE3eBa5QjPoTAyVMgt7U7ud2aOiJD8DNQU6fiyByeH660
	 6G4egXaLTwx7+1aVxzseOhRrq8mkAI7LCcxfZ1sXPpPLCdjo9vsIqxVxKpUpxugAVsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+i0H708;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EE6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EE6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+i0H708
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2ed216ed287so10624195ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279938; x=1794884738; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX8HAKlzGxNN6geVNUiXNfag9XxIX/lb5PTYIBvV6kQ=;
        b=A+i0H708U0QhhS/auEv9RXynihAQg5JUK56vhWJuStLBuxsYlHpMBakfVnh6EzLj3b
         Gy9vlMUuqNOnWne61jTAmePg+MOto1QYGb/dtNUzm0g4ptrrxBY39l+jXxVszQDbD/eL
         DOLMiyFNJb7FJ/duLezj0VblqoAeaZnN0PYZMT8oGOeM0svmYHcb45CCUUhwlCV09t/+
         /P8h5qAky1D6pDcpqDzU0NQE8OZCIvBNdFsB/+JujP8Ujv7VWfO1LBxBDvurdxYSdIuX
         zYi9vFydpGS16c/GCkcWZXLtyzTVffpAwRdl1VAX4qd4/u+nw0aJqxJWXN47YPAukMYC
         6MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279938; x=1794884738;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WX8HAKlzGxNN6geVNUiXNfag9XxIX/lb5PTYIBvV6kQ=;
        b=I7d30FZF9kxW0JDbPuLYl7r2AywOBmRAeYTM0QVxmJ1EEMY3ZYr/2nTcx+AT4yKzJS
         +EkAaDSGsyj/5oHfYZTsfIEEZxSACBgXR9hOMqAOWl1z7lg4k+8OhpQcA9G1l1WNX3WT
         LmdYisFTiJwPM+3Vut5Ibgz8TTwPLi/bz7eGzpUjd6oWpwDusRofFWE/YqmN4ceRGJMs
         FaruhmglOv2DAXcA6HvLXsxnY7aaZ6215lKlNpVTH2d9CutIdFokJu2htue3SmsTg8c/
         F+yeZ5ZKAPNB3n559rFRpLDVPt0o6EcYJbUptpls4yQxOjHnv27fxOY/FBaBQAZLia1Z
         8yLg==
X-Forwarded-Encrypted: i=1; AL+hErExMgh/KScchQ37LKfQxwXf6u8qVbIbHCaBP8kzYMPkgnmktu1jqS0aSrS9mD4VO+ux9YbBxSxAL3+JKYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+E3vn7dE2a0I8K6QiBl+uurQ2Uym6UTCxNMb09h7CYVBK+rGU
	2fGrDUYXFxkXsa8GHG7N2fx6fdMQ6T8EdFmV8ULAJfF8g9MQY/MuiT6vM1quf9Sx
X-Gm-Gg: AYBFou2cyZ1inKv/WIydWGVFFSHSU+jbIrygtoOac/O1FGC15t/Ow+A5wC6+sCIFrss
	pU6IwaMVBQ9HG7BhCN7qwA6Mq40yCv5xyTqhHY/A+Q+btDn34g4D8SJSLPdctFx0J1tOikniNci
	6OAZJ7PbY741cFtHCIcvhnpAgsuyNYUZL/3HpnwLyWSZTfRaBgfsY9ONzNV55Dw2rIZNPbFSVU2
	Ssx3Kn8DpS9HcfU0HAOnyTE/CLBeymdCSdcWEVElKR5Q2ZakoeDrDxq+BLm7TMFYZWTurc2Zxvd
	fE6tJlgeJFebBnlrgvCgp6EAkbca5FdkWMkhRV0l/vrdaPMyk/tSC0rn3to/O1HOB6Ota6pljdZ
	72j6J1HMTDttS8n+GotY0Co7GjynTyjqBCpbzhnGCN2Eg23oijo7W204mePR4thxffQl3mQCXiJ
	4IokpQKI8mvbiyioo1BkeF3CsrAexKtd7nPWNKL3AzjwPJXQ7hBWATcxVG6QVWgdK9mN6nluBv2
	HFwCL7wAySoWf+X7wkfvvegQZGxNMRb8Ok+qu4aW8hE/RoTxvt4sn6xHlUEnxKb7LORnv2KHSIy
	7u8pvRWv0dkFLF7J3+8U
X-Received: by 2002:a05:6372:a80c:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3f190087dfcmr1128599637.64.1794279937902;
        Mon, 09 Nov 2026 19:05:37 -0800 (PST)
Received: from hhost ([120.231.212.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab21835fsm321901b3a.42.2026.11.09.19.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:05:37 -0800 (PST)
Date: Tue, 10 Nov 2026 11:05:20 +0800
From: Xingyuan Mo <hdthky0@gmail.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Xingyuan Mo <hdthky0@gmail.com>
Subject: [PATCH] btrfs: bound free space runs by extent count in remap tree
 setup
Message-ID: <20261110030459.2640203-1-hdthky0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0

create_remap_tree_entries() sizes the space_runs array with the extent
count read from the FREE_SPACE_INFO item of the block group, then fills
it while walking the free space tree.  Nothing on this path cross-checks
that count against the items that follow, and the only guards in the
walk are two ASSERTs, compiled out unless CONFIG_BTRFS_ASSERT is set:
the FREE_SPACE_BITMAP branch hands the array to parse_bitmap(), which
appends one struct space_run per run of set bits without any bound at
all.

A crafted (or corrupted) filesystem that advertises a smaller extent
count than the number of runs its free space items describe therefore
gets a heap out-of-bounds write with disk-controlled contents during
relocation, e.g. through BTRFS_IOC_BALANCE.  The free space tree load
path validates the same count when it caches a block group, but that
check runs lazily and only leaves the block group in
BTRFS_CACHE_ERROR, which does not stop the remap path from re-reading
and trusting the item.

Bound the writes by the extent count: make parse_bitmap() take the
array size and return -EUCLEAN when a bitmap would overflow it, and
replace the ASSERT in the FREE_SPACE_EXTENT branch with the same
check.  This also covers an extent count of 0 (ZERO_SIZE_PTR) and
keeps the downstream entries array, sized extent_count + 2 and filled
with at most num_space_runs + 1 entries, within bounds.  Consistent
filesystems are unaffected, as merging adjacent runs can only shrink
the number of runs below the recorded extent count.

Validated with a crafted image on a KASAN kernel: an info item
claiming one extent next to a bitmap encoding 40 runs makes an
unpatched kernel write up to 624 bytes past the 16-byte allocation in
parse_bitmap() during balance:

  BUG: KASAN: slab-out-of-bounds in btrfs_relocate_block_group+0x2a46/0x3600
  Write of size 8 at addr ffff88800c992550 by task balance/278
  __asan_store8+0x85/0xb0
  btrfs_relocate_block_group+0x2a46/0x3600
  btrfs_relocate_chunk+0x82/0x320
  btrfs_balance+0x1071/0x2e30
  btrfs_ioctl+0x2943/0x3c60
  __x64_sys_ioctl+0xd1/0x120
  The buggy address is located 0 bytes to the right of
  allocated 16-byte region [ffff88800c992540, ffff88800c992550)

with create_remap_tree_entries() and parse_bitmap() inlined into
btrfs_relocate_block_group, while with this patch the same image fails
balance with -EUCLEAN and an image with a matching count still
relocates cleanly.

Fixes: b56f35560b82 ("btrfs: handle setting up relocation of block group with remap-tree")
Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
---
 fs/btrfs/relocation.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index b2ac5b836b217..d57522cc7f386 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -4013,16 +4013,16 @@ struct space_run {
 	u64 end;
 };
 
-static void parse_bitmap(u64 block_size, const unsigned long *bitmap,
-			 unsigned long size, u64 address, struct space_run *space_runs,
-			 unsigned int *num_space_runs)
+static int parse_bitmap(u64 block_size, const unsigned long *bitmap,
+			unsigned long size, u64 address, struct space_run *space_runs,
+			unsigned int *num_space_runs, u32 max_space_runs)
 {
 	unsigned long pos, end;
 	u64 run_start, run_length;
 
 	pos = find_first_bit(bitmap, size);
 	if (pos == size)
-		return;
+		return 0;
 
 	while (true) {
 		end = find_next_zero_bit(bitmap, size, pos);
@@ -4034,6 +4034,9 @@ static void parse_bitmap(u64 block_size, const unsigned long *bitmap,
 		    space_runs[*num_space_runs - 1].end == run_start) {
 			space_runs[*num_space_runs - 1].end += run_length;
 		} else {
+			if (*num_space_runs >= max_space_runs)
+				return -EUCLEAN;
+
 			space_runs[*num_space_runs].start = run_start;
 			space_runs[*num_space_runs].end = run_start + run_length;
 
@@ -4047,6 +4050,8 @@ static void parse_bitmap(u64 block_size, const unsigned long *bitmap,
 		if (pos == size)
 			break;
 	}
+
+	return 0;
 }
 
 static void adjust_block_group_remap_bytes(struct btrfs_trans_handle *trans,
@@ -4608,7 +4613,11 @@ static int create_remap_tree_entries(struct btrfs_trans_handle *trans,
 				space_runs[num_space_runs - 1].end =
 					found_key.objectid + found_key.offset;
 			} else {
-				ASSERT(num_space_runs < extent_count);
+				if (num_space_runs >= extent_count) {
+					mutex_unlock(&bg->free_space_lock);
+					ret = -EUCLEAN;
+					goto out;
+				}
 
 				space_runs[num_space_runs].start = found_key.objectid;
 				space_runs[num_space_runs].end =
@@ -4634,14 +4643,15 @@ static int create_remap_tree_entries(struct btrfs_trans_handle *trans,
 
 				read_extent_buffer(leaf, bitmap, offset, data_size);
 
-				parse_bitmap(fs_info->sectorsize, bitmap,
-					     data_size * BITS_PER_BYTE,
-					     found_key.objectid, space_runs,
-					     &num_space_runs);
-
-				ASSERT(num_space_runs <= extent_count);
-
+				ret = parse_bitmap(fs_info->sectorsize, bitmap,
+						   data_size * BITS_PER_BYTE,
+						   found_key.objectid, space_runs,
+						   &num_space_runs, extent_count);
 				kfree(bitmap);
+				if (ret) {
+					mutex_unlock(&bg->free_space_lock);
+					goto out;
+				}
 			}
 		}
 
-- 
2.43.0


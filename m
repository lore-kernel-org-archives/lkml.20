Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283151;
	b=gSvaEMG0/rgPmmZftlvcCyGR++sF+Y6YzY7RJQqxIQJbEvC51KVuUsVeOenGvKA0ICui
	 81uYvyzKIOdvqzpqzdSgkEh7cAaNmMCcIeu1GxdTXx4XjuJIsvKxZH301R5VYoA6QuniM
	 ibqmscVoE2ODjU6e/7PwO/onNlURCnkYGmNakw3Bgb1Vw2YE0HKT+pgYens7Q4ClFoM6Z
	 CdyA+88r4PvbpnU/aUFQmMOYG6eHFf9AiHRyNg6i3G3+pxFaiOWeix0Dp1XZJiC7554pu
	 3lQb9Zcj9YspEDrqVjDgKebW5iMXrUZIG4r7fBf8seYPPRP8G6yKqM5oLkbciIFOuKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z04WRROPPrp5uX+ZqPL+HyzsZieHk+OVtnfHzFqKFIY=;
	b=FzKRpg6ZmRibuCT+ygudORss3AUGDs0j/4+2Zp+H6fFlws6GHpswbHtNxQuk4Fo28X2D
	 Thv8Hnzm+noZmmzlcRDszZ0GX9P5XYGo9lWbdt7t6toiDHSZGNQ9NOxSyYdHlW808CVII
	 EiiWa9rlZ8XVWYs6XFo9gfLe8eDIu8fzR9gDIFvqF8q0P+krKU7qgwS60cZiKcUm+qDCw
	 NQdttsYKIJIxjm8e/LK4KLrWMszKMbYON9G6zvT+xDTJteEO6dTWnpTDYcsqNS+DV5/4K
	 AZE73okcTgyI0c3AlxbKcPDg2tdpYCKYMCUM+oem9+uVY4SnU/R8Pp4C/TTegPbeVsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plMf+IvT;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1BB606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plMf+IvT
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so3237575c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283150; x=1793887950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z04WRROPPrp5uX+ZqPL+HyzsZieHk+OVtnfHzFqKFIY=;
        b=plMf+IvTY7+LBN7OFHJ5S3/3UZK4x+bIrisZT5s/oWkJLkoDpW5BdnDYfJK8GYrxsT
         epMyvwB5DN7XSRCpPNF3tKj+hvwn2y6GBqH5h6jTViOnUWJFfUHrtpF9wg0WMNbvrIHe
         DoPbd98OQDC/en1E+VfU/L8u6HrYYV5kdhecIxDbxkcybx4qGAhtdEDOQHEGLBq/EUq1
         vq8uRITaB3u7K3w71p0R++LP0nqVeRkxoJlZhpM1IIt3l4+YH8/mYjgaq2TLrMHcCAwa
         ixHo546OzuEbKeWVnFnEdYrnEMNNVXbRYMuAAflW8FI+1Izp0CuSjFRsyxxqZgHVdiOU
         ezlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283150; x=1793887950;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z04WRROPPrp5uX+ZqPL+HyzsZieHk+OVtnfHzFqKFIY=;
        b=GAq2qIlMaKf55QH1XYMiNL9V0RBUjA1Y4SIp5xvshWlYHG5EfoXN2j2Uy02S/6iCdg
         xENYU1Ct079wi0pkxysQgcEat/b56yXkt8VlYc51JDaYpgaVVnS6jG+k6kkk2+/vhW3Y
         5k/Q8GwYFdLlF/beEhWfwG8lo4MDm7i1wW5d6xopCW/jFF1EVWktAp7WD0izVUljZPUv
         QtOE+3Y43+2+BZR1/LAMYxK2z8wq3lr2MfQ3YtD8d05W8oVBjFOa1g/X1mJoBC24qL/y
         bjs18k2qpKAjhxzQBaZksR6DvzqUqeY1YU+znHlE+uL5Ny/z4jAcNHSyyiE86XW8wVyK
         bYaw==
X-Forwarded-Encrypted: i=1; AKwUvByMFWxwvF7trjD65MPDPDWcEh03RWkge1UE+8q0aEhAks8BIiM8t631MVnNHi8akgs7mCw+kENvZBfHwf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUuQTX/cL4+DalS772CpWBbQg4n7Zst/QWvrNHLnixpBqqSpl6
	Gv253Bmy17bsaIwcaSa22szKLSOqtrtnWA37EMm7/W9C40z+CH+K1rtpGsW1I8i+
X-Gm-Gg: AYBFou2xoeoknQl0i91n/vl0oNyniI5R2pi5ODR7ImQhDRPm5bLScE1xnG/WpPLSd7H
	OB1IMiLW5nE4YNXg1KYuvZ6P/f3Dlbztqa1zhS3BKRRgkoKA95qcrMgkznQ3jUbRhLgoBG18Ixp
	NHxYS9EKalA6swWLFXzMmfQ4TivhaLtoEJIzve61BnFsgavu/uf33e/dL9p+vlF0I5LMBH7gi+X
	peq7adPi39o6zFYUIZj0IMhvmWlTcHK9PACN45QuMKnowA5ZrsLB0tc0og6BYMpFhoTgRQ+FLtx
	u4xPEtHCjr8V8SasUFx9Akypgm90aJSA7NJUABDIrQQHMNlLljbZogylqUQemxQJ796KWLNbZFn
	+HFhm135z/4IWm/d7/6q0SjWWRxx1vdyXjBDAntU2QLV7rAwlb4FORBDIAMhn0o8E2WtRRFF++v
	I/nLohLpX+dz25jMHE1g05tAZX8PmQCS1AJuZwG6JyXmX/dOuJLungDvXL9OjFZdVaI3/rN57FJ
	tbqqlUwLkRF3jgbv0jsGdYYN31pvh+OMCuVLaN1MJn9eM+p128n8TcwqonxjPWbhjEHj0GZvGPN
	xJLA0YUd8Fv/S4FixGg46I6BddubLPRFA0kCHuOv+iTOwfDEwrXBAA==
X-Received: by 2002:a05:7022:423:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1a6c2e5b801mr9762994c88.0.1793283149798;
        Thu, 29 Oct 2026 07:12:29 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:12:28 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: reject zero num_stripes in the system chunk array
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314071.648427.12527832319954042748@gmail.com>
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
Content-Transfer-Encoding: 8bit

validate_sys_chunk_array() reads the on-disk num_stripes and passes it to
btrfs_chunk_item_size() to check that the chunk item fits in the system
chunk array.  btrfs_chunk_item_size() has ASSERT(num_stripes), and the
only num_stripes == 0 rejection is in btrfs_check_chunk_valid(), which is
called later.  A crafted superblock with a BTRFS_CHUNK_ITEM_KEY entry
whose btrfs_chunk has num_stripes == 0 therefore trips the assertion
before the invalid chunk is rejected:

  assertion failed: num_stripes, in fs/btrfs/volumes.h:714
  kernel BUG at fs/btrfs/volumes.h:714!
  RIP: 0010:btrfs_validate_super+0x3ce7/0x4210
  Call Trace:
   open_ctree
   btrfs_get_tree
   vfs_get_tree
   do_new_mount

Commit 2a9bb78cfd36 ("btrfs: validate system chunk array at
btrfs_validate_super()") moved the validation out of
btrfs_read_sys_array(), which rejected num_stripes == 0 explicitly.
Reject zero stripes in validate_sys_chunk_array() before calling
btrfs_chunk_item_size(), so the crafted superblock is rejected with
-EUCLEAN before the assertion is evaluated.  open_ctree() turns the
validation failure into -EINVAL for the mount.

Fixes: 2a9bb78cfd36 ("btrfs: validate system chunk array at btrfs_validate_super()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/btrfs/disk-io.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index c628c50..920ca4b 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -2389,6 +2389,19 @@ static int validate_sys_chunk_array(const struct btrfs_fs_info *fs_info,
 
 		chunk = (struct btrfs_chunk *)(sb->sys_chunk_array + cur);
 		num_stripes = btrfs_stack_chunk_num_stripes(chunk);
+		/*
+		 * btrfs_chunk_item_size() cannot represent a chunk without
+		 * stripes; such a chunk is also invalid in the system chunk
+		 * array (system chunks are never remapped).  Check before
+		 * btrfs_chunk_item_size() so a crafted super block is rejected
+		 * with -EUCLEAN instead of tripping its ASSERT().
+		 */
+		if (unlikely(num_stripes == 0)) {
+			btrfs_err(fs_info,
+				  "invalid chunk num_stripes 0 in sys_array at offset %u",
+				  cur);
+			return -EUCLEAN;
+		}
 		if (unlikely(cur + btrfs_chunk_item_size(num_stripes) > sys_array_size))
 			goto short_read;
 		type = btrfs_stack_chunk_type(chunk);
-- 
2.34.1


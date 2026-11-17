Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884638;
	b=1X7Se+pNcD4AJCa1jNM3fjwmRwEPjc9DpP+c3W4LwCLXor01M5w4//7IVT4cnrgmWhs3
	 iBkDa+KKjrPllGHxXyzQMMcIpbm6kVoCBOVcjebZEAbjnr2lStyehw3rTsZlHNtBvLbIY
	 BxV2WxFAtYfJJVhTbTh6buMCOolNf+hfJHiZSzArgzuNX6dVzMlfX7d9C3iI/va2nwqq0
	 FnDrB4vJrEkZKh4Oz9tKDwSnS/9KwtmWpInwG6Y+UE6POS/Exa+KUo35YFd+YTVxH8Vfm
	 GTk59BFHQFsqson+x8XW8Pz3Bv2N2ZePXF3FGY0qXQSbxUitjcZnnbyIfA2iOJg9RZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=59i9qNCywloB8yPnm+LVlMAqghoUzCqvi5ucPAFlF4U=;
	b=kkOCx/8ty3WmdBS7s8w4wyDpSYzARGRcCUG3Fn7V/qzObJPGYEUcwXH+CQvjB2ZpLPVF
	 uGAlNCml5EAD3WT58ztreCT36N5Vjhbk+eutaTJe7W3/Fxm9ZE0uKhWyhi560PJuF6j7r
	 147nAlvN0MKGM3OF7F15sIte/Sp6u7S7WTvxoM26thTJ4/RjkBdhvAX7zRWKKaV2XxBxF
	 XrZL2q/EhROJvW6ELS1DEI3bzpXz9eyT2JGbICowbHHgv1roIaLD9VeMC7X4RkFFbDUss
	 /9GE881GzPke8HYR3kgmghmoF1vlUn7dwgXV6ZPL1bSe7MOR2i7K56iFX8SxjepbfDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=UPWM48sC;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467B7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=UPWM48sC
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b30cbfa628so33454467b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794884637; x=1795489437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=59i9qNCywloB8yPnm+LVlMAqghoUzCqvi5ucPAFlF4U=;
        b=UPWM48sC5oymWjtmL5e4xI7owhXfoZezZn2RXAp8qjflD0A7ZVgU7zD8z/gcqRdyIk
         9W9D4HtslpZaadRDTQF9HMVEixl+DEE3B4spBL01R1Lz7K6STQqqwzBgxbu9LWKYcAt2
         GpU2IKgBbMC02NJGJDSngkfls5q1+6YGGkhAb/3/uPNWKa2xij4TT/3D0prYRM0Dd2c4
         xJ1l7wkP9ARxvbIgHnv2fsRcSL1IWhPrLcByhtSbdfamnY6J5K4+uvM8iPFk7jbA87gW
         R5QU0p6Nk5ZSKUiLVJayzcbAJgzS539HWZp+ubhCywupnOA/bLJ4yhyHlTmGBzcAC9q4
         Es4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884637; x=1795489437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59i9qNCywloB8yPnm+LVlMAqghoUzCqvi5ucPAFlF4U=;
        b=2bCU4pEy0Ad/eg/ElPHY0fnYQqbGT2VFuspySVyT2x+iM7vLthNg6KwjUtFP1N4+ko
         pWMROEKug5Vj1TsKbiAqvaJY0GLDDVWZfyoNgHznXveeSCEBZZlEss73Gt16uJsY7SgB
         1ypKuN1uFLbB58Bw6mN7AaFj6AcWC3tMVgettibj/AKkEa/xXsKKi5HBp/6V0xYaQM04
         CY8/OND4Y+lHNWHkTyeojQofuNpuDXN9e5CfxvPXqU9GQ8nakmif7c8DDc8wq3xHJqTo
         F0cRDVQgSRwFJi/UvEsEy5800u3oLeF4x1iWx6U+tpCajv2uEtmP7ewSmirC6sCawDbL
         EP1w==
X-Forwarded-Encrypted: i=1; AL+hErEz1EIJk2q/l05AxrYd5aiy6ubqdmbtcv5LhN3HzsAlxtTEBUDN4KmYFTHymyRUArAwOMea7RkvhD6kOEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tJLmMHgrklcmwCi4f4S/V5eJCCSxR0rz/BtcCcKbGHkSnHJI8
	KjDpPO4SVxsbyXZMyE8q6l4zIxVYtqArkQg8EiYeFdw5jseps/1kpzCGlTRhaM3RVg==
X-Gm-Gg: AZFdTZeLCRiIjr7ERbIml8VV2r9Eox1c6/xzh00uRiVwezD+kfmr4euW/NpPgnsi2y9
	C7wuX+p6beoPTI1A2yge4YxlYVsBkaseb+8TSo009vIhZZXB/pR2XLI4bFUKetnEKEACPsmXEAe
	nAwSI0CPZ3cNyf7Z+rgQ6L6QS7yCbYmYDgh95Oo0BhvMUcey5Y4wWFw8Q4pgkC3AQpXQJjAmq20
	g1tIXyJSfUfWws2E9qfJHK2fW7ua0s6qFLnfE8KNkHXrbIx/r4zpuAnFG8t/DdmhuNNOu0qvwiU
	lmYeX/sd0i0bhO+MXZOsWR3tJ5DeTtk5F5H3X+86ey7hjandJvFI3fRDxazPYjMaNlQ0BVdgpLe
	14K2SdtWe7Js4dIVNwCWthHfFT6LYj0RiPZIdouM4EmdWBUYtzLNpYkfzmxbYf/9lAIW8pQQls/
	E9sSRWS8WVNiEerNuAQDDEdy/nNSsnX3R/492AlCWEnebWHdQz0mLRK7QzTpftihEVMZXSNyJ4M
	WI5BnvditryGvFnIwR040Y5T1YcWR7CpCMSe9JBHz6MipYLU9PZfhUmcoZ3Nd/RIEWq99Xw4bWG
	G3fXxRm5rRNRkHsrpvkeJnbLEFBuW3ZnfR0zYZVUv/kc/ss7UBk=
X-Received: by 2002:a05:690c:7488:b0:8b4:c615:62fa with SMTP id 00721157ae682-8b4c6156634mr56285737b3.61.1794884637083;
        Mon, 16 Nov 2026 19:03:57 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec29d0b5sm14482677b3.35.2026.11.16.19.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:03:56 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: linux-btrfs@vger.kernel.org
Cc: Qu Wenruo <wqu@suse.com>,
	Boris Burkov <boris@bur.io>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: remove "rescue=usebackuproot" from "rescue=all" shortcut
Date: Mon, 16 Nov 2026 22:03:53 -0500
Message-ID: <20261117030353.1738805-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

[BUG]
Since commit c73eb6f72741 ("btrfs: always use the second newest slot for
rescue=usebackuproot"), "mount -o ro,rescue=all" mounts the second
newest backup root even when the newest roots are fine. As of now, the
changes of the last transaction are not visible with "rescue=all".

The issue can be reproduced with a healthy filesystem:

    mkfs.btrfs -q -f /dev/vda
    mount /dev/vda /mnt
    echo old > /mnt/A
    echo old > /mnt/C
    sync
    echo new > /mnt/A
    echo new > /mnt/B
    rm /mnt/C
    umount /mnt
    mount -o ro,rescue=all /dev/vda /mnt
    ls /mnt
    cat /mnt/A

Before that commit, the result is "A B" and "new". After that commit,
the result is "A C" and "old".

[CAUSE]
Commit 2fd3f6a2711b ("btrfs: add "rescue=usebackuproot" into
"rescue=all" shortcut") added USEBACKUPROOT to "rescue=all". At that
time the option only fell back to a backup root when the newest roots
failed to load. Now btrfs_parse_param() sets USEBACKUPROOT and
use_backup_slot = 1 for "rescue=all", and init_tree_roots() calls
read_backup_root(fs_info, 1) before it loads the tree root.

[FIX]
"rescue=usebackuproot" now selects a root instead of tolerating an
error, so remove it from "rescue=all". With this change "rescue=all"
never uses a backup root by itself. When the newest roots are damaged,
"rescue=usebackuproot" has to be given in addition.

Fixes: c73eb6f72741 ("btrfs: always use the second newest slot for rescue=usebackuproot")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
This is new in 7.4-rc (v7.3 mounts the newest roots with "rescue=all"),
so it can be judged before the release.

On a copy of a disk taken while the next transaction was running,
"rescue=all" on v7.4-rc2 showed 30 of 60 files with the data of other
files and no read error, as the space freed by the newest transaction
was reused and data checksums are ignored.

If "rescue=all" should keep every rescue option, as btrfs-progs
documents it, using slot 0 for it also shows the newest state, and I
can send that instead.

Tested on btrfs for-next (26eb4d70f96d) with clean mkfs.btrfs images:
healthy, a damaged data block, a damaged extent, csum, fs or tree root
block, and the disk copy above.

 fs/btrfs/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index b424cc836bd4..d67d678451f6 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -624,8 +624,6 @@ static int btrfs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			btrfs_set_opt(ctx->mount_opt, IGNORESUPERFLAGS);
 			btrfs_set_opt(ctx->mount_opt, IGNOREBADROOTS);
 			btrfs_set_opt(ctx->mount_opt, NOLOGREPLAY);
-			btrfs_set_opt(ctx->mount_opt, USEBACKUPROOT);
-			ctx->use_backup_slot = 1;
 			break;
 		default:
 			btrfs_info(NULL, "unrecognized rescue option '%s'",

base-commit: 26eb4d70f96d9bf99e87c2565d6234eb652f9c26
-- 
2.53.0


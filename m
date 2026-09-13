Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7D3491C9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312879; cv=none; b=exQXhz5uXEuN2UKzB3tYWGHbblNtPRvVrzlq4DXPwDwf6t0m5PH5W7cbdN/hhfQ+sWKaAC7L/CUxb5Yv6K/bHiBgAuEhJnkA91TUcECf+8MUSqvIe2WSxKUHPldv8RKy+lS5LxGD8jMCNp8P744KgvwfQt61vwv23L1cT8+VEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312879; c=relaxed/simple;
	bh=DgB6f+Le5FdI78fWM2Sva9mnOW2u4b2hnJI3ywfkRKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/S4ElFjRcoQI3qskgh560KDzz9ZNs0mGIT4RyAIZ4pMiXZEjHY6LAbJEuBuT67UhNiDmXdy4Ndkj3geTYjdba0YhyWPKWARW8ap61BaDzPOY35oV8ChGNabd9TDUsG8w1nUn3gtksr+y73aWH4dEiXGUNkFWUGfdmTY7joc8LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jcncq0Ic; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jcncq0Ic"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1721645a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789312876; x=1789917676; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ip9XsplZZI6M7A/DCwYddhmObFwWqZyH4LV5HQEECB8=;
        b=Jcncq0IcW8Az5yx+OuZOf4T7Kr8rxhdu9euOqXzoowmnSug4QwYwV6BJhqzeHe/xbV
         jPgG8+uEdnbWubkDp6/h780hrKmWz9janEY21C8x62NwpFywmwzNtz56IXe8jlswmweQ
         mTz+vIGlKJ2Z5JOg7FMSKzKxaeOUCR6Jt1YJ3mv3zPXbfW2QCfO6oBqb9jzbkQxiCV8F
         eczdR/JGjB3GG5dLXAR3Pix+6tQsE8dGJX/at9yNfR5YhFh1iB5efp8Gy2TYM8GtgSuf
         SYRXbCrTUnjgWOKIKXIUdMTEZF0tlY3pms7O78lwg50irWJXQaQWmB+ffNaKBfJ/fV08
         uIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312876; x=1789917676;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ip9XsplZZI6M7A/DCwYddhmObFwWqZyH4LV5HQEECB8=;
        b=Ensxf0peGur+Zreyl2kBRFdA+LUzB18hDr/LPuu7AM/2AQ93MsmRfVXPw95pOK0fnt
         sE/1MH5Pc1tYS+hM3BzGUVEuACKO6iaEQ33u+HKr6sR70i/blLqs+pSRoVhQytkPhF3Y
         6jG5ZwBR9SSIGd86lJE01QuuKNexori/beBzVA/2ABtHFLiOXCf08sW7Z1ejJRhMiteZ
         c2PWrwDOlYIMASEmQIoiGSMpVC0TS7aYZVhnpSdoaoru4VgqYsmAn+SHWWofwK5tG4EB
         W0UiWnbLxQzomo5Gsp2tUKxEoUmaf4i6TSCVYiBXCEi+4jnqERhXBhWo2eLlsEhmMxoZ
         7j7A==
X-Forwarded-Encrypted: i=1; AKwUvBzsNUEv/KeA/TPzr5t3tWak3E8XY3sZQIPDwX4MD6mOfmCMeYBo6do8qE62cJsCG1MFR5CPtwfuUV73BYU=@vger.kernel.org
X-Gm-Message-State: AFuF++nv6lYWopTb5Dmw5rgYjO0fk8AzAMTNQWW0fJmBX5qVY+locVG7
	CFPhgOGpjcOYJlmbxUKhE4sUHb8yJDC8W58A1697UwGIvPYUdKDkViZS
X-Gm-Gg: AYBFou3iEAunnlSMmALIZ7rhkjKryhU5tUO93/mi8/6dVYRmgWXkFtpyFc0nxOxm3lR
	roB72BuP4T2bFuVUIhTQQDt8k0AP9Sih7xQrU88w6RPqYOxHZoaUdPEGp7UAqrWBf+74NamGp2k
	WxEUp1hO/xEOozbNZT4yzHMiq+OhXPjhD0jbCiOU5hPHKr1eS3BHCEpE/67szjt+/gLHLrvzaEu
	vtRP2Xho++yKSjKLM3xCghkCjl6GiX0e0DzNqyP1jqsoiMaTHcU2GFzELx/MXl1IMf0Tstd8zX5
	aWymdQMTYbtrHFZpROqTA0Z6l9rqvJGMRLUZOvGOAnIZMduG8492W1sLCdoej4xEudSiLk2Xyd2
	/OYJOwUdN77DmyGcFZvT+TxwtrdheVWcVinUPV+mCkj5gY4Xxs02icaNwtKhw8MaqVBn0QxC3LL
	y9pI3X1gz7lGR+1/XDOt8MLkhI/EFd4E+T5n7iN3NcyEeuB4RIdeH+ohdVon9QVA/HRiQ=
X-Received: by 2002:a05:6a21:138e:b0:3d3:ae0f:5268 with SMTP id adf61e73a8af0-3db0e45a4eemr14380575637.20.1789312875863;
        Sun, 13 Sep 2026 08:21:15 -0700 (PDT)
Received: from pc ([117.147.109.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c659b9a3sm3531056a12.29.2026.09.13.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:21:15 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:20:41 +0800
From: Zhaoyu Liu <zackary.liu.pro@gmail.com>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, 
	axboe@kernel.dk, tz2294@columbia.edu
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs/buffer: check for NULL pointer before
 folio_test_dropbehind()
Message-ID: <pfk6l6lsgecie4xwy5njrgtzpave4uayxbl4lkz3iekcdds7fg@bpihjzlnz7m2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add a NULL check for bh->b_folio before folio_test_dropbehind()
to avoid panic for non-pagecache buffer heads from jbd2.

Sample crash report:

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP PTI
CPU: 2 UID: 0 PID: 332 Comm: jbd2/vda1-8 Not tainted
7.3.0-rc2-next-20260907+ #3 PREEMPT (lazy)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 2024.05-2ubuntu0.3 05/07/2025
RIP: 0010:__bh_submit+0xa2/0x240
RSP: 0018:ffffce590064bc48 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8ab102861960 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffce590064bc90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000009801
R13: 0000000000000000 R14: ffff8ab10ab90600 R15: 0000000000000000
FS:  0000000000000000 GS:ffff8ab2e2571000   knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000109364000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? __pfx_journal_end_buffer_io_sync+0x10/0x10
 bh_submit+0x15/0x30
 jbd2_journal_commit_transaction+0x6c3/0x1840
 ? psi_group_change+0x201/0x4e0
 kjournald2+0xa9/0x250
 ? __pfx_autoremove_wake_function+0x10/0x10
 ? __pfx_kjournald2+0x10/0x10
 kthread+0xfd/0x140
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2a4/0x320
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30

Fixes: a2c924c240e7 ("buffer: set BIO_COMPLETE_IN_TASK for dropbehind writeback")

Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 427d8a817cd5..4aea0bb08609 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1106,7 +1106,7 @@ static void __bh_submit(struct buffer_head *bh, blk_opf_t opf,
 
 	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);
 
-	if (folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
+	if (bh->b_folio && folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
 		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);
 
 	if (IS_ENABLED(CONFIG_FS_ENCRYPTION))
-- 
2.45.2


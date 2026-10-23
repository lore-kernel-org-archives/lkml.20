Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779189;
	b=AgZ3Lz1qMvu+RuC1Em3H59+dAqA5URAjh8/xC/tBuPTHHjHei6H+Q2Kjspwh5D1/6igL
	 LV5naCTrAbrp7DSNba3P20ThCuXENHou+itHqYUsOtXRja3GrqBsDfrnalDaCRm4u2O+p
	 7ZY4zrmZZuuphqCA2/6ZwGSDCpsn4l/g372w10Jo2k6jQrPz44jm4NmAu1Yb1rwScEMg1
	 UPLSVIQeO+yz47DFukE4/4+KAqsvT9gceKuzmwFsOHxNB9iapSSwQYnH/+oxhnIKQSxij
	 0JvB6N9sQi+d497ss9SYnsUSxIpZZ3oXUAn1S2fLXOzoma3XxjWFILa38VDIIX/cZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4FoCKLxbV8UZ17k7ny+PDZ4wC8nV8QJxctUdFkqIFLA=;
	b=G0UMmaMCoF4moLPCsWXijQJ580dXsQjq612pSBjQSJ8+srqItf7ZMBS4+BiyLv4hvg3D
	 FQYbgSdZ3daIheRuhe8lW3JMw1zcbj03BDW5+rvMt3d/GdYAA9v+I6kq8l30+YI+ow4Y+
	 bzpTwQfsVu49YjcnbCmTGKkLO0fiVCibK3oqA5+jo9zZOkviyEr2ckgFCb2bcGWf7oX0O
	 sqGrjQ75MDEiz3sP2Us+rPqBlZDGgVF8RDZGkCMnxsJiezmqMYhlKDXcVJkMPzkypbfT8
	 LouyinO1uftkR5ChKrec7z7OKs43hMeFzQoPVo0IdCs9kQV6OkAnpVl+UMW2CebmPfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=JWi7MxIz;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40526606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40526606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=JWi7MxIz
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679965fb848so1224154d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792779188; x=1793383988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4FoCKLxbV8UZ17k7ny+PDZ4wC8nV8QJxctUdFkqIFLA=;
        b=JWi7MxIzEivg/dE0FlI7yoQ64woRjflvy/p66c7W5Hgs5umFzQJ5SAZ6vRNEzZrE1S
         6cHHw/U1I6OTEILgYXEMAmHqHiMh34kuYHCyq/+c3ocWPeXwq3kIqZ1BAG0Y7ThAwxrO
         D+F+CaBrG9OnRahT8d4Pdt8DN8WNgfa2pjZ58O3F2xx1fZXl+RH0JGXLtAByV+4Yj7Cc
         /Dn8qx+mU+3xrhBUKLgEKoUYow2lqxRpyY7xuP11VGLKmMX3lRfrknXf1lYBGU2F5uoh
         4xg+vjidzfbEXZmAz5WxRoYOgVYKzgcj99QfBPVNzJIgXFlaisl80mWPOtxSCkkDN4Nf
         SjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779188; x=1793383988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FoCKLxbV8UZ17k7ny+PDZ4wC8nV8QJxctUdFkqIFLA=;
        b=TxiNYNvzPpopncNU8OdX/37pQf9m07ZmR9lzUl6UgRUpC3GyvwISfuVEWdEOGAWd2p
         dOa8BBk1M1ELKYETKW2K16eBCSEaFK1283MFPw2KxKmYYbmDjyvdECOsuVYEdgVhGRI8
         gpPai8cOULwRnGpR2KAL7MG/ULIytnXwpqjmFf87RG+orzWUqJ8pr8N2KUK4vugiA47Q
         Lsj0Suon4iBKtt+AZPRAubakb4+bdEy2kBe+/pZVxbKvCPuLK3d37DF+p+0MAV2JO5Qx
         AXRgaO5RwB8cm2ZVSlD3wtuCo5MlJe1tF4QkgMVZ8Elo2RRPLDYU/HPmKPHikgM4hG0/
         e/xQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ5AYSEpYXU26BQAUHz02vO0gyAO1B0VkqoRowPhPmeEHaF+FClMnrFyLRXO4+HauS5VKltZfbouKyiy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDi2/pE4ziiNBYKDpTc3UG1C6H8riJ46bDHOPZPnhLjZlFztL1
	B/KzqB5/i7+XPQWWd9hHYnyiOvBRx93hQsBuQahwQClrbnfWJqH2RXX9rdqxLdXXPA==
X-Gm-Gg: AYBFou3UXffn4LFBr4exfIsRHLrPWKGYHl3U75RxDZa0J5oEO1oJLltKCH7KTyne/P6
	x4UyKsgQQNkLnQqLW97xhN04BXjuEU0k6k+3qqzA4hEYrmdWFcLVK4wsv/vlib4yPNtMxYVfvel
	LOgUBfvYJq9Twgft2Kh2NE6yaNEfEnS1ZKc418CCBLiH99gbaB6k6Qczha8fo7sjzxKqQZrLzst
	qRSRbhUjxYyKgbvzqcuVMUEI0EGKbZZgltV2vBD/gJkilkNpxqkN7GFEvZbiHrVUA/5YRWyepuj
	HlN8pVPf/wPjajYAkYj7MWPNGVgivupMdQNNkQo7j66XCAko4q3Npxds8ZHzTq0XnOtCW24w5w9
	S69jnWGZtrus9NTvYxgidlIcXc/XoeodvhL8qDFC4eX3WxJmFVRJyJPYo+WrxO/p4gfsX/Y13aC
	XF2tf5HBchF3wBUNdfHpciDDs9blrvg8C0PLGMpCTGmyuqqCBJvFlDy2SFSeaCLtgvj9FqO72TN
	M0E3BFbf681kYdjw7jBNP9vpQETlkCEk9VYE2Tdqq+46iHpnpcy19ZEnMq1ziOpuFwoDt+y6ALi
	kmNfG0qYUzkdD6//G4wNXiQ=
X-Received: by 2002:a05:690e:43c6:b0:676:8cc2:bee5 with SMTP id 956f58d0204a3-67a35c97da1mr1062555d50.85.1792779187892;
        Fri, 23 Oct 2026 11:13:07 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4263bed4sm341889d50.0.2026.10.23.11.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:13:07 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	usama.anjum@arm.com,
	avagin@gmail.com,
	mirq-linux@rere.qmqm.pl,
	arnd@arndb.de,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/proc/task_mmu: return -ENOTTY for unknown pagemap ioctls
Date: Fri, 23 Oct 2026 14:13:00 -0400
Message-ID: <20261023181300.3366487-1-hengyul@cs.unc.edu>
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

Commit 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and
optionally clear info about PTEs") made do_pagemap_cmd() the ioctl
handler of /proc/<pid>/pagemap.

However, do_pagemap_cmd() returns -EINVAL for every command other than
PAGEMAP_SCAN. Before that commit, pagemap had no ioctl handler, and
the VFS returned -ENOTTY for these commands. As of now, they fail with
EINVAL, so tcgetattr() and isatty() on pagemap report EINVAL instead
of ENOTTY.

The issue can be reproduced with a simple C program:

    #include <fcntl.h>
    #include <stdio.h>
    #include <termios.h>

    int main(void)
    {
            struct termios t;
            int fd = open("/proc/self/pagemap", O_RDONLY);

            if (tcgetattr(fd, &t) < 0)
                    perror("tcgetattr");
            return 0;
    }

Before that commit, the result is:

    tcgetattr: Inappropriate ioctl for device

After that commit, the result is:

    tcgetattr: Invalid argument

This patch will return -ENOIOCTLCMD for unknown commands, as
procfs_procmap_ioctl() in the same file does, so that the VFS turns it
into -ENOTTY.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Unknown commands should fail with ENOTTY: Documentation/driver-api/
ioctl.rst says so and calls -EINVAL wrong, and POSIX requires
tcgetattr() to fail with ENOTTY on a file that is not a terminal.

I found no user space that relies on EINVAL here: Wine and the mm and
kvm selftests only use PAGEMAP_SCAN on pagemap, whose results do not
change, and CRIU and LTP only read the file.

 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 5c54aebe2118..92b275dc0d59 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -3307,7 +3307,7 @@ static long do_pagemap_cmd(struct file *file, unsigned int cmd,
 		return do_pagemap_scan(mm, arg);
 
 	default:
-		return -EINVAL;
+		return -ENOIOCTLCMD;
 	}
 }
 

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.53.0


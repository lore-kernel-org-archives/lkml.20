Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D413CA92
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792279951; cv=none; b=IRmW0SyNQ0ZaZaMbOgNym9WTTCX2hFY+JIVoVTnsFxEW2Vd5L9Jw66zFxIK0P6oYH8tthO5vk8Lr8sWKfUDABvsOfff8RWiulOdvO8PYtfhW2FXGFdNiRO8qZJgMJq8okI3Xt/qDQL41wwuO1MEX0CZ29wiRmwpkURNDNV30U6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792279951; c=relaxed/simple;
	bh=rXpTC85O7fl/3GCT8MAEIkrg2z5a+RfcYbSoLzd3VDc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RPn6/46YA3h4IHXHbiNqdAKptrc7mce6dkBFNx8MNZGHcTfG+8ukosn50jeL9chK0TAj5pgYxjD019g48Op/JYK5ptjuT5HvVfIj9qMCxgIxArgehTMGhDDQAGp7Fmtv1BfJP0mHcb3WRa1byztfiOvzTswJOVZewQplnmJ43h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ea2c058e67so1947870b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792279948; x=1792884748;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hhOO3D5szP3vWpDmU334d8kbcDKVVnlO7PTzavOlQnk=;
        b=uyOsCZS4M2h47i8K6gCH/8x1v8vIF62jg8LRZSNxDlfp0pyqctWK6i6xBTMuhFIAdJ
         gQhZz2ROO6/1TA9OdNjWJ3iEbH8ZPbfW9KRf0S5eWb8zGknNS+ERT/aJ7bP018Q7cEBf
         Xv0PFfF0CVxx5qhz/4E6u7Hu/BeITfJrV1wTidfoFSjUgpqQQ9ctZkGQw86ijECMXwZI
         BNvxUcCDfRWP5vb165tnjD1Q2EbRZ4pabafw8etOfxssd2JRZ1z+o50Ysetdc+dDHtzK
         zpBbbQbTVfVsef0aJrJbPvtqX8PHaqK6Mvr48p5mXBd6fRPP8nhk8CrlYebqRDrH0RY5
         yixA==
X-Gm-Message-State: AFq9FYIhxJ292uErjHFwdwre/p+5tsdIe2ZMEmgyDJs36lityW/gaV5h
	8rB/AsG8/Z6teP4xfcLzlHAQkeTRyW76HwNgCthMxqTTBVmb0siI4IBqBePoWx7cAizayMKpiJf
	p3Qyerazd86vkFWtbe8vzV07Ej5OAWZyywFrBmwbIQiIdI2wMQoIKokE0TLE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a2:b0:4eb:649:bde2 with SMTP id
 5614622812f47-53ccd5e0bfamr3626437b6e.34.1792279948492; Sat, 17 Oct 2026
 16:32:28 -0700 (PDT)
Date: Sat, 17 Oct 2026 16:32:28 -0700
In-Reply-To: <6ad3e0c6.a6d1a155.34a93f.004a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad4058c.6814cce4.34c49f.009c.GAE@google.com>
Subject: Forwarded: [PATCH] mtd: phram: fix memory leak in phram_setup()
From: syzbot <syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] mtd: phram: fix memory leak in phram_setup()
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


phram_setup() allocates the device name with kstrdup() in
parse_name(). The error paths that follow (illegal start address,
illegal device length, illegal erasesize, illegal erasesize or len,
and len not a multiple of erasesize) use the parse_err() macro, which
expands to pr_err() followed by an immediate "return 1". The
"goto error" statements after it are therefore never reached, and
kfree(name) at the error label is skipped, leaking the name.

Replace parse_err() with pr_err() at those sites so control reaches
the error label and frees the name. Leave the parse_err() calls that
run before parse_name() alone, since nothing has been allocated yet.

As a side effect, these paths now return a negative errno instead of
1, which is the correct convention for a module parameter setter.

Reported-by: syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/mtd/devices/phram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..7aed57b31967 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -289,34 +289,34 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		parse_err("illegal start address\n");
+		pr_err("illegal start address\n");
 		goto error;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		parse_err("illegal device length\n");
+		pr_err("illegal device length\n");
 		goto error;
 	}
 
 	if (token[3]) {
 		ret = parse_num64(&erasesize, token[3]);
 		if (ret) {
-			parse_err("illegal erasesize\n");
+			pr_err("illegal erasesize\n");
 			goto error;
 		}
 	}
 
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX) {
-		parse_err("illegal erasesize or len\n");
+		pr_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
 	div_u64_rem(len, (uint32_t)erasesize, &rem);
 	if (rem) {
-		parse_err("len is not multiple of erasesize\n");
+		pr_err("len is not multiple of erasesize\n");
 		ret = -EINVAL;
 		goto error;
 	}
-- 
2.43.0


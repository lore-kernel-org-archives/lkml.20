Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A3396D19
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791233707; cv=none; b=pTXX99JTjXMxgQH0lawMQFB9sD26R6k4H1+1odQ1GHTMLztFH0iyc0nLM8w2N26uF5bO8W8U1i39jToR1nCGoslbIQW6Lhaj/AQ/OioDNUM4lfO9VUmnxW9aE5BRu1pa4fQhmSyvxHXt7MMEWg+q8MZP+B2OxIynGail+kx+gRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791233707; c=relaxed/simple;
	bh=IIMMIB5yZntj79h+uvpZEG92MvGuR49gw/nRCTIMEsI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pKze/vCK73XVa6FV47U9AdkRT9JxxFJKKAI9KtvFcEaaKxjqEJM9RZK61Y6vS6MgL46a7Yjmjd60HDfrnxudfKOsbYbVFtEVcgrUnB10OPBvZRIJB1Dhy+SpBG1bjsWKIuZ37rLpWoh7d86pYiJhbWEF+VugPEQWNdS1t4lhLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso3448437b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791233704; x=1791838504;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+v4hJ6i5lxdKH51nxY645I+vQt6491YsupVDGPjZvU=;
        b=AtpuIlcKyO0Yl1B7Ie6IPg6dzGyJx9pIFtvs9xUsUN6fDuJnis2Z65OaGwvYuMiJ23
         DIXnQ0BekOI0RO9Dr8KHmFnXsM2DwT91S5YCrhpoRwRavgKiKGIK7V1Gs1k55ankKFxW
         vQ+8IUCD0/hSJzB6XShX/kdXwcUoqaVWVtMcxkLkU61NCG4eU1/iyGJApMaVEFUlDWjv
         x4/w65jC0sQk6ojacDpwmcFk7PX3gpTAgpSWphvPubxQNukgWmDuDvnqs1VbMmjHup00
         0HD1FJoDWLMR5Av8FhRoYKtvoHjlIvrWWdZzJHhJLy5C1ROwbhEtng+LLmUi2ydGImRm
         y34A==
X-Gm-Message-State: AFuF++nGjKo4BUUMbruR2Ne2CJb5IZ02AT13fHpTMs5ZcjIt2fnt5TkZ
	1+s83mpoPEMelmHWyCsrSwA6xGvjLezPwVpNhdn87BHwMDVzZb969UbCpDXsMJs2kCx35HZjUK5
	OTYvYXrbQr7DZEBsIq7AZLfvDUpVIFeY+TlHQ+DmpNyh32bKu/R2rw+JdG2Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1205:b0:4f5:2195:e3d4 with SMTP id
 5614622812f47-4f52a572fb5mr11224843b6e.36.1791233704693; Mon, 05 Oct 2026
 13:55:04 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:55:04 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac40ea8.598348e0.18b15.0004.GAE@google.com>
Subject: Forwarded: [PATCH] media: usb: siano: do not resubmit urb after
 EPROTO status
From: syzbot <syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] media: usb: siano: do not resubmit urb after EPROTO status
Author: jakovnovak30@gmail.com

#syz test

---
 drivers/media/usb/siano/smsusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..a1db99a64bef 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -93,6 +93,11 @@ static void smsusb_onresponse(struct urb *urb)
 			urb->status, urb->actual_length);
 		return;
 	}
+	if (urb->status == -EPROTO) {
+		pr_err("error, urb status %d (-EPROTO), %d bytes\n",
+			urb->status, urb->actual_length);
+		return;
+	}
 
 	if ((urb->actual_length > 0) && (urb->status == 0)) {
 		struct sms_msg_hdr *phdr = (struct sms_msg_hdr *)surb->cb->p;
-- 
2.56.0


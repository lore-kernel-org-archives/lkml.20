Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540F3E49C0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283997; cv=none; b=GU9YXc5n87kuZklZNtHd4biq92KEpVxu4RR1xxWgJWWtGu3/nG9GGOzxzbYJpNWLiBSw6BUnWHhLM+UtEQcUsomrtMcMNweYuqtNm5hijUs+EQjKD326ulm3OYSAWe8AIuKdbX7azqIRpfMRbNgkR0QR/oslaMA0x3FjrDFMKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283997; c=relaxed/simple;
	bh=aJOTH1wdiYpSxIu8FahUsidia2eXOmLKrx3l9DlY/Zk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CTVQDoTfrhDIHYSayjRAIMxJwq/kMjbcIuo1fx6HhKO9Mx1CcTUR2vYqAX2qDZh9lZ81om3gQajdOHbAfqmqDcOqkisCq/j2xmuTO+2jEpjXIlhdIYgThMNjz7YqvUOoy2DZ4jtodDF1ibjWuAgg1IoM0fm63bbF7aBBhYg9SoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so1009324b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283995; x=1791888795;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cGsY8F+iXCBY3NVIk0QCmEfCminGOu/56HSQv3tqCwo=;
        b=J6N7Rc2jNf9XIhovBc4xal1iV0AegquWiJFjZWAe6b3H3gJwYtuUF5FgC6UHvs9daE
         D6DBcMjCbMBhSc0PjX30NeCxBL3b3XRU0MUC9MbLLacgVePTvN2Vz1+jFcb87iIgMAc0
         qPp3+UAPxSPXeJVf4H4meT+GrzuYJgCjgO9oS1Tf9Ilhwcu9PhyULngi6lyvc3/j+uCk
         9FoI834Vf2EQYmUxHjVEPP0s+E+3kd79k3acb1CQo+//179jqwQPYdwaDwNIRtQRJrFF
         +2qp/Z+TYG4+kzhIE+xB9B+hSNV7iT/pQfYaUlCkHO6enRSqEUteHgu3Q8u7xtSbkXbK
         0neQ==
X-Gm-Message-State: AFuF++kzooXV8JAX2g1K0UnveaZGi3XS/2Eyjf3eVQ8IFlfQNcWdahTz
	oKF8I/RNriFGggtr0yBdxN4GVD9/dV5gwPedgLfiVF1CmhGTElDu8YTRwxTavS5S8Jd6noPmp9D
	WB0+IABvWL1Mbkdrj5kVxYvjXfjjGe+LpIK2MYZGLYwAysusTQKYnrGWQ8fQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2e43:b0:4e9:1d81:a952 with SMTP id
 5614622812f47-4faadeb67d8mr1716423b6e.19.1791283995229; Tue, 06 Oct 2026
 03:53:15 -0700 (PDT)
Date: Tue, 06 Oct 2026 03:53:15 -0700
In-Reply-To: <6ac332eb.598348e0.18b15.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac4d31b.0c0f1d1c.10e9d6.0000.GAE@google.com>
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
 drivers/media/usb/siano/smsusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..e5a13ef31482 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -168,7 +168,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
+	// surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
-- 
2.56.0


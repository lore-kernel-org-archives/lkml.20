Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112153;
	b=kLC3+32BFbaTdCQWb/99thA6LyygfSHk1plxuEYaynr+VF7U9k1l3gempq7lznGnegDb
	 NJpwmalAt1+Bd/Zp2B5JtcAuDDGUoLynkIRTas/UfJ8DL3U8BUtlTBhY49X5IHDQT1a6/
	 +AeQNLi66PvSK7PzMQUNtcfV/C3pWGPzVKMQsUVXcChpMIpw27MoQdlyJHFS9i2dFggVl
	 cIISK8mRMg02HMmfVy0siwJqSlzKoA39woD1ywrARw0dG6f4Lxn4LqB+xRyqXzpmxtEeC
	 WsvLUuk386y4B0F5Xs1D6lfjenm5iXLhj1j8DtG/ui04OvRfmzT6D7KfGiPcrmuSxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112153;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=dXAjRP7BC595V+3Lvb8Om1eJYlMYJ7rrB3Kx3GGcSBI=;
	b=BMY2fwy19FgGNzUxWIsuR18nB4k1knoUYfZJG7q+HTZDbu2Tcf3j+8/ZZ4PBAHJDZOqb
	 8yncmZu+Dd0Za1iBS57pYkFwNIVzwEgU/up7K2y7hBB3Zar/UlPBS4968ekh6ggoPZbRv
	 ouj0dhwFgaBi5o1Pg6oUMklcuUjsHji6WN9fZ27heFHyxPzqCyZ1K+qpHBeLOo8Y3tyxP
	 bj/br1sE3daMGgNbwS8FhprNMOqgSmds8/t2yk8jxI/h4y/yNe7MKWzlplId6VhXBTyzv
	 a4gnJsBdpSy5kXZrsYlHgd43yxrOHQqcbaF0xTMZpFfHVyRDHv9kI0FFqYLlgRgzrZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.79
Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A33606BA4A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A33606BA4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-482966c4f4fso1402497fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112152; x=1793716952;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dXAjRP7BC595V+3Lvb8Om1eJYlMYJ7rrB3Kx3GGcSBI=;
        b=UA9KhfhIsfO+cifaAbBde1b7OCSu+KkmJAXv4FuxFpmNzHIjDkAuiuXfN+g/roxJHa
         0J9bAQr++n4eskePsnFyNejMtyudrhNNhKaquncOfFwGuPyv6/nmRBVRbnGlD9194BpD
         stJ/q7LWzWC+rn2vDHJIrCv1JmvPQ8mPNSHx7p39wtHFGZC8zhAUvVd8Oo6p4tb5/jlH
         WTb8v9mkaNmZj4Eutb8D1dC2DXBg0sudZJKk6GjE7N5t8qaOVjCfeydnOgg40q4Gwv8q
         W6qXsAbjWrNRQQyamXNCBjBL/xw4F5MHBOJYY7jDA7LOxTgncNxE64BS7Z1301n55rU2
         WqVQ==
X-Gm-Message-State: AFq9FYKqjqGqd+sQSyiGJkLOKw4s5Me+xAHvaUEa+HPs1be3ze9JZy5q
	Gs8OAe+op9BPQAy6mYTLunF5XddHKoXb0JwNbJFDdpsYLezJWMZAdpzXfKNS7L5Y8I2KGZg+hq0
	xfNNd7M8RvM/Li7uRbhhOxgm+ovXPghj2H30cJNFIQfeyzyTuhWjUTU13lnme8g==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f96:b0:4f5:214:fb96 with SMTP id
 5614622812f47-55f80a8e80fmr1539171b6e.42.1793112151831; Tue, 27 Oct 2026
 07:42:31 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:42:31 -0700
In-Reply-To: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0b857.47d0a7c9.33355c.0079.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
From: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
Author: harry@kernel.org

Testing whether the pending siano fix ("media: usb: siano: don't set
URB_FREE_BUFFER flag",
https://lore.kernel.org/all/09b616df-ea9f-4ea1-86be-ab600119f9ae@I-love.SAKURA.ne.jp/)
resolves this report.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5b0764a53235

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..8140dc0c8b7d 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }

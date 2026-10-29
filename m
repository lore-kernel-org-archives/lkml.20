Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282869;
	b=NIIrxZyExexy7WsVTYnvK2uRm5t8XPW4o5qoidGYTIeCiMl6BPZUkwFGD7+6WXAL5UBx
	 JJKKal9Q7aXqap6gGn6Rii/Py7JLo5z89h3A5iO99v8+VFY7Q9o2PrM2n9B8BYgc7cDTP
	 QtI0Jx7ERrI0eKCUWpzuAobnP4WJLRXOmeOF1YRGufmCqiJL23sA+ITmTilbO0PxqNumD
	 Z7XT71BIrKzXL+B0+Cm9P0bNynmVp7oWs3ZgaZ9LY0OB5Zx0SQtLnbsgDML4ORwEqCTB8
	 RsQn+Q+2F1A/XjBWnduccSXh6cCmTOvyNatyiLt6ytGRnS+RbyJmuR6qho+Y+xY1wfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=w87Fsky0NgxDuxHBRoTymPJmUy6XO+2+F5+Frr/38EA=;
	b=Xic752nnSMRK8T4IOdWGNOtJqBMGIKUQbQWT/8VS2Mou3lI8ybUwYapHVcdwQJ79Akoz
	 7qeyOQ+YTbvuxuB7k9/7kWSl7vPjtFX/fWZ/wWCB76aGWX6zlTuGzlZFm/2t4KUc/bl2r
	 QlPZh9Eb/hclZ0Edug4I+dRMLbdnR8JapaagxzUTLPxpz8KgfMEelHyMa+EfvGPmYfvjA
	 sJxM2aXqdst07X0jtcWHIqTGdYGu52fMAzvpgQ+ut+svRl1XgXtN2CXoo6qKYOB/VJPx6
	 83I4NwPDOevD6BQeRm4lP0fmc7fre8iO4JXgP3WHSfpk3Vhb9lI9trM17k6dEly1aHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF4A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so3108782b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282868; x=1793887668;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w87Fsky0NgxDuxHBRoTymPJmUy6XO+2+F5+Frr/38EA=;
        b=V63/qMJsfyEpXyQ8jSEu47BjqS9HKq+wN1XzeCGeijGMG/gHWa3LP7efj/z4o/5QsD
         teNOpe4CJZZxwi8MOh23A+Xay0coHkcJzCY19TgbPDvD8/mkdG9/VvmOQbNhxNaOy6A7
         Y42vu+uAWEDpNKNde/b/mnUrybW0US2hBnvGUmfVnSRWcL+kWulOVE7gxASU79+2J5JV
         5Vfmd7uSzdu4HWLu9u47/klkrPoU1H/if4LZ7DO0polNqvxyRCmWJGyzXodCsc+EEhlo
         ZB2X/SqKk6rbEi1AiqRYJ8dCUJwQTaQVC9Ds58xQU2KGt4o4ucNFjWn3jxvrLlBK4Ist
         ciBg==
X-Gm-Message-State: AFq9FYLpx8TPcMuYpKD3F+rRXAKZo7P4dkNTaZdn2Gf84yI7ZBjpfgk5
	kZS0BFmjDS27jx60D5U4cpLhR9OhFKcdF0PBW91gkKtGkCNTMkpdR/NRXdMBmdPjVN/5HCDYK10
	bfcbPjehli6sc53cv5oiuvs6borfB92RRvo+Zs0C0othCID3mlajNEouc7KY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:151e:b0:508:c44a:63f4 with SMTP id
 5614622812f47-56382684c39mr4106451b6e.35.1793282867974; Thu, 29 Oct 2026
 07:07:47 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:07:47 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae35333.55b94f83.31f4d7.01a4.GAE@google.com>
Subject: Forwarded: test
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: test
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..d35efa876274 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3050,6 +3050,11 @@ static struct r1conf *setup_conf(struct mddev *mddev)
  struct md_rdev *rdev;
  size_t r1bio_size;
  int err = -ENOMEM;
+
+        /* check if mddev->raid_disks is valid before passsing through
kzalloc */
+
+ if(mddev->raid_disks <= 0 || mddev->raid_disks > MAX_RAID_DISKS)
+ return ERR_PTR(-EINVAL);

  conf = kzalloc_obj(struct r1conf);
  if (!conf)

Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B94E592205
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890322; cv=none; b=AXBHLhPaNu3CsJMypZRzYCIMZ186cGlOQja9Acd6FMbJO2J2i7F8hk/yUQauH3Ke7Rh+WG4KCKAaUwtUUt3Tpy8MRx0M/i8VGQuIdAiig2QqvnVLzVhQCXqaOhh1kFeX1sR3oa6yWvd/Y6s03UiLeSbOvCfgAMnZL4uDGRetFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890322; c=relaxed/simple;
	bh=Fhkzj6cqtLKv5U4VNEwQ9lXc0H5vFJkUCJB85nqfcas=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cLQa+3j6zBcCRMbfm27o/4Nrr6QYd/ZoU3YhZkrcMigBoK0a2qE2gTC9Z3u7OV1XIhNJEvbtltyveHIHHy3M7y7Y0hUcBV//SrC4s3Hnmnu9wDMSdZRNTyw94jllI0ZUl/3WEVriqazTTnaZtPQNgWbBW1MOR1MMMgUDx1Gn+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b173742296so6046215eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890320; x=1789495120;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SjkBqCYBpA4dQZFMRprnrPs8xpJtChv2aHUWrWmapFU=;
        b=pFctTJrwPNXU7wruUMzR/AKuIN88sWJtgFeD+w10ew5EOvhG+o8X7PrD1mmWZoumyb
         Wq8e0jusZ8RVKCun9cjkU896w4Yr0RGpPdrw0xxxfIXu3CSyfoOS7ABJWkm60d96XeDH
         x717cgxq0FupEe+cOwxhzQ24A2+w5ZblkN/n16Wr/XCtAmW5KURq+s7MafRRq+5yo30P
         3aorcmZcZSDnY7Mxk1XGtJT9w4Q6bBbmnzMOjIyUDam7v8+Z6qLVoiTgqvxX0CxF7QMN
         0+VaStXzYn/x7KhVwMSIeW1Dm/j/6B0zmMuEBhzy8wVlinkGXfxBia4TGEU86FI9ou3j
         d5Lg==
X-Gm-Message-State: AFuF++l7mA1jfzEX0U1m9N5a96T8c4T9KAfPbURmgMKDQIcNehawk8rV
	PwNooX+aAPMsV1ytd7mBBT8haBkuIWjMbotqnrpX23v3HqkKU8IovHGCil1e87VizW3nN6okWmG
	DzOXMV2C0E6UptWwV78vmbnwWjCaCo6XLn8dC+4yI7Fw5j2DMy4FNxDvpJ7c=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:190d:b0:6a3:6f5d:4d6c with SMTP id
 006d021491bc7-6b58341fd2emr15301361eaf.6.1788890320099; Tue, 08 Sep 2026
 10:58:40 -0700 (PDT)
Date: Tue, 08 Sep 2026 10:58:40 -0700
In-Reply-To: <6a9f6314.6e6c5f9e.28f11f.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa04cd0.f614420e.2bf292.0010.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [fs?] BUG: unable to handle kernel NULL
 pointer dereference in getname_kernel
From: syzbot <syzbot+6c46a179b56c651c4c96@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [fs?] BUG: unable to handle kernel NULL pointer dereference in getname_kernel
Author: pavankumaryalagada@gmail.com

#syz test: https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux 73ae59e97596

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index d74c01c98f19..336013139ef6 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -591,6 +591,11 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
        if (ns->enabled)
                goto out_unlock;
 
+       if (!ns->device_path) {
+               ret = -EINVAL;
+               goto out_unlock;
+       }
+
        ret = nvmet_bdev_ns_enable(ns);
        if (ret == -ENOTBLK)
                ret = nvmet_file_ns_enable(ns);


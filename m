Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF730C171
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608148; cv=none; b=aGiDLGmXJUXPhOAAPAIBZ8IwA4PR/vyXwRF0+TMyjYZadi5XZBbz3KwZd2paptWTtssC+2IufEfoKv4LBk+yyvt5PI9IWG8zfJvlhJ7TfIMCyZGkYRhZu9qyMA6/nayNDgoa7b6qBMGhd6pSne/hKsOTR3AJZLiXOLOnFZI1dZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608148; c=relaxed/simple;
	bh=gV6Z/v8MXkgr2B+lD9l/RvbludTpRW+5vhBVDG+9Buw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lZOY52XMacwtRPZvMONIqYZmCRhlkUegJSrH7OU6fRWINED9OP5dBiDJVvseYipzJ2Bbf9mfhTdAk2odEffD8V8wJ3bh+od3UYarIJABGEv7aXHZPd4uR8ZJf50nCcP5EG60CvfJqXk1kALIG1SM7spsbjlpquHvPuNnh4RAy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80491594629so430754a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608144; x=1790212944;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LITwY5RbXcVXXI3JVykmQ5tJ1tUEKi/Zdof4i66r23c=;
        b=P8yeNu0NejS30aghETMDVUBGCd5YXVpX4yYvLZ9//jU/QKkDTywl3J6vrAfhxVOGBB
         GgXdhoOJNrD6oZ3JvIw0D7MbeompGbFNaNJDxC9wu2TV8jahBgyoOo1NWLXfJJhZplH3
         QmDDIVaD6P43X2p5qQfdLXWGCpQmIgfPzSRU2tIYy14i8xaLkWZ5wMfHzrH+zPk72vKn
         D5F2gEuH6ZM46f8p97orWxN1jQCcNRh8OpFk0Yg3A8ZPfIbcRy0V8DlNh3VGAOxQ251K
         8L5WQStp3khpaE9dANCiEpfZX1OqQ/M3tSlE4+9N7pKerVxCL5dwJEGh83sm91Gj3mKX
         PsUg==
X-Gm-Message-State: AFuF++nH2y/odNk7x/lFOl+Kx6tGqui5nj4wLPW1MAHqE1sBHvLqHjJB
	BqByPUw66YceSor6dLavk5Mx3kXtB2vC48xtckl+IzdFC8QevV+codgHeJ4DqiS1ctQbvEeArto
	gSTx1gIV7zRgC2g/ZGNQfQyDk6lpW9aCelvsNfASbCvMFujfsixT2lEuRtGQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1844:b0:6b7:f498:cec3 with SMTP id
 006d021491bc7-6c8ff1f80b1mr1284251eaf.35.1789608144797; Wed, 16 Sep 2026
 18:22:24 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:22:24 -0700
In-Reply-To: <6aa52208.f81106d8.2ab401.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab40d0.87c06881.1db2b3.0002.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in ieee80211_register_hw (8)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main

Reported-by: syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 02b6d81cc..cef2f4b08 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -7150,6 +7150,13 @@ static struct genl_family hwsim_genl_family __ro_after_init = {
 	.maxattr = HWSIM_ATTR_MAX,
 	.policy = hwsim_genl_policy,
 	.netnsok = true,
+	/*
+	 * Avoid holding the global genl mutex while creating a radio,
+	 * since that takes RTNL in ieee80211_register_hw().  A task
+	 * holding RTNL and waiting for the genl mutex would otherwise
+	 * deadlock with us.
+	 */
+	.parallel_ops = true,
 	.module = THIS_MODULE,
 	.small_ops = hwsim_ops,
 	.n_small_ops = ARRAY_SIZE(hwsim_ops),

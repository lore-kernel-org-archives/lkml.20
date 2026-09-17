Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD62AD3F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609460; cv=none; b=E5a89cEVyC/PMYOFDDHmPqQaT0XphEaQYRw0HphHiugygP2bzVqvzQYGQ+Jyl2BbK4+9xMEeKGXr07UrQuATsNklAQztdKI6ZTrye/edUAiyYZGz+n8tFBLpWirQbkKZiwQUKq29MpEF4sdIceyOLmJ3HrU5RhKXuhTBz7OYsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609460; c=relaxed/simple;
	bh=JIY/4f+EqnyIIBf3ixp0dM5Ex5+ohcxrizf2LXxQQec=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s55Go10vn+pLShpoeqelnysCv6WTb6PegCDftCQFi53GgXq+scNrIMd7O9uSPH7GXvFfw6vnyd6yjFm19VyBWJPSohrmtzBn+QOr4Kc/SySaU8SUhknWJuXgVo02ILAJzQGfsy1fcQL2Ff3m9Wk9Naap3XsHS0INXpWXhLpxalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b8b593a4so432747eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609458; x=1790214258;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ufvv9PHJqXbH8kc0yuHISDY0xHJpOzjargMexStr2Ws=;
        b=f8owvWGxpnnkhgrfABOSlRgGgU4KeXBsxGoztWzPM/8OuztI5BkIfTUwYmLS8MxZpC
         wD3t61kKp+mhoiNTbTRD4TDiFYLHSKL59XEWLNvCZZnxBXraQDt+cJg1ZWGCTkZxctg2
         q905CbakFZuZT7dzoRzLXwpTIp1jG5YEks6dtzLV2dX67T1g45kDb/curqDykqmmOI01
         q0lAqZardJRgT4FtJSy2JsmJ3hrdqB0/6dB72lZ0papOb94xyIs/Qi3TX7oNULSwXBOY
         qCHldhZ0t7Vij0/IfOSQUVLYsDU5e6K+azJlIblkTV2WIfeIXRkMESKx4hsqCN+Kwb8U
         MR0A==
X-Gm-Message-State: AFuF++nlzNE/Ndi7V5ueTS+y7fotfK5kbUeKUYQtfsZdFy3zIPWAPRwL
	LU5EfMB+Ftc6RQVCgy+hniOc3TccdWRM66UeuAlhW3+UljtA22UnayI8tZTq7KVuKSpufTZ7l6i
	5SVjU6WLriYdIkT+QIpTxu5aA+hfeV/fBD786DWdG6pu02If7H7WJxVkitlM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:308e:b0:6b1:a8b3:3b43 with SMTP id
 006d021491bc7-6c7d16c8fa2mr4652785eaf.24.1789609457915; Wed, 16 Sep 2026
 18:44:17 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:44:17 -0700
In-Reply-To: <6aa52208.f81106d8.2ab401.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab45f1.87c06881.1db2b3.0005.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in ieee80211_register_hw (8)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main

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

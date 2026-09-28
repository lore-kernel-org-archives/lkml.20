Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C04E3248
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608701; cv=none; b=jrdHx1qPpwQSRT5PqPgBURc6XadrvCgjMc9OWUMaIcUHOCilyjKIaE8AIcSqhScWB8ynDjcC9IRjq3ptlVPvOHob41Svyq9XNOEJDCjQpCXwjRLbP9/RYx40Or9NbnkeuXN/n8TyExM46NbzZWD9nQxc1/97do7v/5o1OuwcQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608701; c=relaxed/simple;
	bh=rqlDGZjLk8Qyrw3Z2onuAtlU1Cpp+kTv3xLzbDSSXbM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OCJi/dYT/Psg2nv9p05ogh6eMZrud/hMxT9aP7/zEMD6n4IzgaCLDbJu/1u87PPEotfXKKzKKjBvdB8qPk/YN6mADJzD0hIH3V19ymeSnPY6z38bekPIlixYbdlkJ7fGEfWK/jtfY6O65ehSD6t+htMj+oCPpJQCB+sbP5fiRKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb0b989f0eso1308053b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608698; x=1791213498;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HkA3bZ+2BTJK6zEplSDvNbDqSMlJUl580sgpU5PhQ4Y=;
        b=0L0mEtq7j58s/k0v1Ti0tm+WjNhPl2GydxZU/0axRzQvIgvRI2HeMr56Q8T9cTFtP3
         fT9nVVQAL/7WECHRSpZ3BvdZpghzSeeDb/ozt3wNIu5IvWIxbdDigcdq17pcdiFMs6JE
         gGuAPwPOvEpyHEkV7kGxthrQeJ6EvQ+rPfxPZZfm0N4O+B/KIvYNoSwLIh1SoaL4QIkt
         RSiXLBOeUcwUSsGWVBcsvsGigfmu5G14s28nnqsyAeAFhXCCzhUjeAF7tf7/aPY7rWWv
         Fr+N+ZJB21/JleWtZHt/NXrNIpjV/En22G8wn0iE0PdbUJBY4gIt/3bVZyNTgCn80TPg
         GdaA==
X-Gm-Message-State: AFuF++kEXesMiyTE2J12I7TaCuzntb9Rz5UXzu0H3UpMymcHSqJE87dw
	Y3PfUhRzsiA+RM7YTL/EW5m6ekrHN7NE+TJ8N9zZoTrRiDtDbtq9AQ8CkR98v/1/TmNXEwo9Fn+
	uKl6HVU6v7m+C3mmGX0SSbMurmA7NSoGX69M0B5UePPo992beaFz6R9sEMD4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1797:b0:4c7:26ee:3378 with SMTP id
 5614622812f47-4d72c740713mr10440109b6e.30.1790608698631; Mon, 28 Sep 2026
 08:18:18 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:18:18 -0700
In-Reply-To: <6a75d605.01d0871a.3a0d52.0047.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba853a.80e1c6cc.1e8e5f.0073.GAE@google.com>
Subject: Forwarded: test
From: syzbot <syzbot+ded267b328e950a7c0c4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: test
Author: idosch@nvidia.com

#syz test

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c90ee6dd7446..e1e672ada7e7 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3908,9 +3908,12 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 	}
 
 	/* combine the user config with event to determine if permanent
-	 * addresses are to be removed from address hash table
+	 * addresses are to be removed from address hash table. IPv6 cannot
+	 * operate below IPV6_MIN_MTU, so treat that like disable_ipv6 and do
+	 * not keep addresses without their host routes.
 	 */
-	if (!unregister && !idev->cnf.disable_ipv6) {
+	if (!unregister && !idev->cnf.disable_ipv6 &&
+	    dev->mtu >= IPV6_MIN_MTU) {
 		/* aggregate the system setting and interface setting */
 		int _keep_addr = READ_ONCE(net->ipv6.devconf_all->keep_addr_on_down);
 

Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE34DAFAD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608729; cv=none; b=f5PAOessCpGoZB9Jo7pgNGT0+Xzv6Fet4nT3wz10aBNpNOy66ak0Dh3QAlSE5Z3gn/AJLKNP/44M659IahA2Euks1PKW/mukBX4lFWNRaEtMCwLuMU8r/PnwU337p0Cr3yxeLrX9C+5MFv3ytc5oliYDDN3vF5fl8o6a8/XVUIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608729; c=relaxed/simple;
	bh=rqlDGZjLk8Qyrw3Z2onuAtlU1Cpp+kTv3xLzbDSSXbM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZtGHt4GaKAFDeW/VWmdpNHqEq3FKMdXDPv2JNYl0rP4cllVFnFoBb8OBTyRMzHaYuMdRCIkgqdXMz14TymqN0t1UsE8dh+n0qvIqZxuu1cath22u3dsR8lLLPhCo/2Yok6Iyt+EZ5RKjTFBK9rrgbFXcskw72Dg41Tw284/RLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dafb8e1so5854411b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608727; x=1791213527;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HkA3bZ+2BTJK6zEplSDvNbDqSMlJUl580sgpU5PhQ4Y=;
        b=A2K44K5PPURv3g3GbnycAywaQrlExDrxAnbNuDzq16WA6rz3XLDTZel9UEi5vZ4M4c
         5rgg/hzY/13qHunj4KtYL3f2MrJczdTd3c1swkcESkWM1fH7g9UyUTfOn81r5WdQ8fJ6
         vG35xFTPmSsm/16vgWC8cuUoMzhCmYOef5IGi/F3TD5XiXvbM9P4AS4vX/w1YTSeug0t
         fg3n6HpSU5gGrkUeWTlFnSDnN1FTt5SDXBWovRruWAQdrXVYetkQ1sIAhriHY7fEcgU6
         +5W1Cls9zOS32Q30FPhDaYrLX2bt0qYKniFWazopWNrsb6v1abvD4tEMM+lOVG175uhB
         Mw5A==
X-Gm-Message-State: AFuF++luy3H6KkjENgtC0nzRJtFxOEK7t6tRBtpDay6GXSL1SORKqHPq
	bQx9ZsAlfto1YLffIfUpYT0CtlKoy7tPpGdgl+lf1DbTK+/iXja01aZw6K4Ag6KC4ZNu0eCT1BW
	J4qyXQfAByMJFd3XtKjkwbeeqLF4j+Zjc8QoWyqZN8ruZ+epCB2RvCeVrA6s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bcf:b0:4d6:92b3:5c8a with SMTP id
 5614622812f47-4d72f14ff98mr13132202b6e.64.1790608726782; Mon, 28 Sep 2026
 08:18:46 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:18:46 -0700
In-Reply-To: <6a8b1833.dbb3a75c.13dd47.0050.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba8556.c41622c8.21b57.0001.GAE@google.com>
Subject: Forwarded: test
From: syzbot <syzbot+57f410c9a4f8d7a441d6@syzkaller.appspotmail.com>
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
 

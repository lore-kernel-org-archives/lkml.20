Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48031E82B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840492; cv=none; b=e8c1JkgDcAG84ZxmbckxER5dmQTkpFH0SFb1ZjClJdUyQTZYzxG275PEaWgEsdO6hKHoQFSoCfg9qt4dFq/wxkRsTN8b0DWjKYV74YepRc8s+dn6t8L9fSulAACHT5N39N2yW9ODQEV0U3xZ8dlOu5/UQkv0ivcCF+qfOJO+kHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840492; c=relaxed/simple;
	bh=1ARn5FU6OEs4OGMpAFwaVFY8rvOun5USCgfBGosxIh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRlNPRwlPsOEbuhYFUJO+GA/lsisXWrtOPQpuvSGz95oClzvgpSGoqpUzLW4FgGNITQsglWtHZOBec2DDj8xGIZe7Hci4W0br2BOFWRIMPlHptzdd3QM/O2c4+wwORUrSGdVxarSpTqydRD4LAlxtZdcS88quDrJkJGY1n2tGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phd8hU8N; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phd8hU8N"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2207900a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788840490; x=1789445290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ExDYy8ptGsZPqN8wr0vMUynJ6wwhmEgGfmX3mDplxlU=;
        b=Phd8hU8NH2w+ZlId1q0gMFi4S7sWeJFMXK0KiFlZM+RCIrC7okADdZKUjfobPiUs05
         UNoDsau7t4hl56gOD1bNs2pVsc0hAPwBcVxhHZVjMY/TL34ltnuEziR21kN+nyK49HNg
         yrk1NL93R+dnWzhY8o+kryYqEWDH/WEqn2H3THPirBx33Vb5id8GD2LyMV8tsJ0uKFCv
         uJqGFXi2iz4SKSCiWy+KjwKhc9ewHF8ovPlMaZp+P++7O6P/W0x2D8JyYl/vQHXF9o8k
         pEOUdbN4OI/lZ8TZpA8tPK7yNY5j0UeqUz0lZc4AYVeOKLI58kliB7WEmL9nQ6OpLALe
         Ndyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840490; x=1789445290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExDYy8ptGsZPqN8wr0vMUynJ6wwhmEgGfmX3mDplxlU=;
        b=jMlFA9GctZvmDIfH+3JfOYLWLCycgSL5Vc6QIed+cav0GR1+ZanSClJvOEgEPZX5Wm
         G1AT545aAoS72SDlgSwzNm1+J1Q4LxEWJsZrxdij+sqbQQ3Uj9Rrt51vgxeJCX2Rk4T7
         VGzMSuqiusygSfWViPaIPT32QTu7vdqiq/l7FvxSm49oZfZoe4jShl9XRdngpcn7LOm0
         wzQgACRQuf5S+tkAAVd+jIO2ed9Pccz674iSxcyIjS8Qvy9nuqyeHkxFctPNG6jJnJjv
         W+0Gzju/IyF38W2DwUj2SLNsBh9Ty5YsW8pJ1s3cmEE818OBpy8Hkyzcbdy5mSMzQSty
         6t0w==
X-Forwarded-Encrypted: i=1; AKwUvByVIE30WA1dX+GnmIeJEQ17PF9SqD08Jow74Y0gpea1oKJQlia/+IIM1dTmQkdOD19tp2ei8OmnO2Pi+Sk=@vger.kernel.org
X-Gm-Message-State: AFuF++mcgjaeOT5DlEh608iQ45mw6YzLjqH8OK/FtRavKav/m19+TiCw
	Th4xOaUH7KeWe3opS47ShVphy0cK/m4JAYLyiqDhjUjugZpBz/8fKPiK
X-Gm-Gg: AYBFou1YLe7AIARrBVom5tz3PmcvP/Z1PrK0YqSz9TH3PiFphQcHSXQCHJUAGBobf+a
	IO0C2oCS/pHI1gPYCqiKUA2XkVquEUrxokCjb9XFNwzNXMyG+tQlAo62FCXzi6I6g1kkvwKms/L
	n/wdctwTPHB335uevAgil38Ta9ZNIN51nmn7kCxvUK3tNsxinyVCZXvmuOfdyXYsY9ZACPwjW4N
	Q1kaLCezY7XWb0a45rbBq0jIuPg4CIN7VRssguKL+nASrlLr4AN7Wyuj6gAcO8GtNiwdW0Nsl6/
	AeK6eLeuNwhWX1KtvuN5amNBQrBqGQ4CziyznKoccuh+ntQM2TvOOn6VLOmdaM566kBnm6AspRg
	zKdnsoKhXlfnWySPCPZvNJr5QzFHfD20JFkYhv4Ua/nPDlA/Um9Z73TMAWGTncVUpWH0nM6djtc
	xIm0GXFopddUr8apX45/GfZ7Gcl92n+VgKiqesCtvl6gXxEgMMdUb+RapB5fQYCXh6taQ=
X-Received: by 2002:a05:6a21:6442:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3da5b4dab37mr23740538637.27.1788840489820;
        Mon, 07 Sep 2026 21:08:09 -0700 (PDT)
Received: from dev-ubuntu ([128.14.159.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm32042606eec.9.2026.09.07.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 21:08:09 -0700 (PDT)
From: faicker.mo@gmail.com
To: faicker.mo@gmail.com
Cc: stable@vger.kernel.org,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: net_failover: Fix the deadlock in net_failover_slave_name_change()
Date: Tue,  8 Sep 2026 12:06:29 +0800
Message-ID: <20260908040708.3972058-1-faicker.mo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Faicker Mo <faicker.mo@gmail.com>

This is a sibling fix of commit
b84c5632c7b3 ("net: net_failover: Fix the deadlock in slave register").
There is netdev_lock_ops() in the upper callers, so using netif_open()
instead of dev_open().

Call Trace:
 __schedule+0x2bb/0x650
 schedule+0x27/0xb0
 schedule_preempt_disabled+0x15/0x30
 __mutex_lock.constprop.0+0x550/0xaf0
 __mutex_lock_slowpath+0x13/0x20
 mutex_lock+0x3b/0x50
 dev_open+0x3b/0xe0
 net_failover_slave_name_change+0x22/0x40
 failover_event+0xd4/0x1e0
 notifier_call_chain+0x62/0xf0
 raw_notifier_call_chain+0x16/0x30
 call_netdevice_notifiers_info+0x50/0x80
 netif_change_name+0x200/0x330
 do_setlink.isra.0+0xb12/0xdf0
 ? security_capable+0x9a/0x1e0
 ? ns_capable+0x31/0x60
 rtnl_setlink+0x302/0x670
 ? netlink_recvmsg+0x296/0x340
 ? security_capable+0x9a/0x1e0
 ? __pfx_rtnl_setlink+0x10/0x10
 rtnetlink_rcv_msg+0x384/0x460
 ? __pfx_rtnetlink_rcv_msg+0x10/0x10
 netlink_rcv_skb+0x61/0x120
 rtnetlink_rcv+0x15/0x30
 netlink_unicast+0x28f/0x3c0
 netlink_sendmsg+0x216/0x450
 __sys_sendto+0x222/0x230
 __x64_sys_sendto+0x24/0x40
 x64_sys_call+0x1d5d/0x2390
 do_syscall_64+0x105/0x5a0
 ? do_syscall_64+0x140/0x5a0
 ? exc_page_fault+0x94/0x1e0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fixes: 7e4d784f5810 ("net: hold netdev instance lock during rtnetlink operations")
Signed-off-by: Faicker Mo <faicker.mo@gmail.com>
---
 drivers/net/net_failover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 3f7d31033bae..1b5213e87070 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -675,7 +675,7 @@ static int net_failover_slave_name_change(struct net_device *slave_dev,
 	/* We need to bring up the slave after the rename by udev in case
 	 * open failed with EBUSY when it was registered.
 	 */
-	dev_open(slave_dev, NULL);
+	netif_open(slave_dev, NULL);
 
 	return 0;
 }
-- 
2.53.0


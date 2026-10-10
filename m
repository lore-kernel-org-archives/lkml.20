Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9817A305
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613856; cv=none; b=d1ZCw7b2TB3R3/WgPbfneujU6DdLlMub/aA6byTeTRkAp6EiClntAaKxbCSEwvS5o8Zr+SMI6x7jkaazJseVK11dxQRMcTvG5gQCZ+BeCsbkcsjB3kwb0H9KaGabvyl1H9Q0Ow41CwJ4iL2b4dSnZ+n/3Bub3oHCWu/oVOo387c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613856; c=relaxed/simple;
	bh=UU9e/DIEZIoiwv6BQyhSYSDdVEcIQaOzjBs1CU/yQjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1MW4xirV6tgoCqfb22At9MZDeWliO2AySkeRJgWFtTjhM35FWHDKG52o4Yego5fst2d/65SRww5L4GI2dHdw4ABzJLs+XAqsWcVsGIlKRWcZPl4/GnMyaplBSQlapX8HW8XdEhXut7VTkZy6rukK1yaK7xPpK0oKS1db6xuR7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pH3kI7BF; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pH3kI7BF"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-826f42e479dso317664a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791613853; x=1792218653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2I0Ul8sPqzlVU5TVserEHspod34j/pr1dNRLi4dN0Ck=;
        b=pH3kI7BFeVA5H+GYQg8ysrhbUtIzrHJX1PbHbS4EFoSc2Lr3KKuxHX5+Qs432mKTVu
         zV6VgvHnABIlQoC2zrGMkL08j0AHvJwmDf2znz5CwLTsU5fqdNNM+YHx8ukl3THN+yiP
         LeFnugd3zVNcObeOgQsjJAeK1Oq6+TMCB59qUZJLjijHz0MbCRsROOmc+P3udQFKos81
         dZDeuxbltJh35bxDpff4puLluI3/ihEnrTAPdtzAWUpw+Y8aTKSE751nXM0+/57ofuYd
         Ue8HeT7QL7DwU2/JfWVuCeWJ3fdgGsCMreuUVJcOXYU7ghOSohrKTD3/H8mmbH32hAYS
         FiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791613853; x=1792218653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2I0Ul8sPqzlVU5TVserEHspod34j/pr1dNRLi4dN0Ck=;
        b=hWinNnfasmN1MvugcbS0kZv1HhnjWRkw6CSuI67efKofbGFTvRFa7vlm7gTpuLm667
         wHoA8OZR0JTAJvFnbx/txncJlvDjUy6fmarG98aD2Qy+yc2djb4cnI7AM2ykdsqtCpQ9
         cGCn/piWP5ldinJge0amVCVLnTQ8XzbMFUAhZn9COZTRKC9L/elbxXE2CGV+R5Lk2J1u
         AL+1X7sI7dwFo/TqVmg4U9+mJEr50YYLgc5Z/foKYw7tYYruDEyW7uPn/d/Qt+ya6zsF
         OiY2QY33l+Ebd39BWLR6OlfmmQK+moXyl2KCN1pahPR/YDGpzXDXPB/n1hYyeslZ4V5W
         re8A==
X-Forwarded-Encrypted: i=1; AKwUvByAA9AekaQoZKFQcolrgZqm0MuobIMBRgokMkkVqm5obfsirHZb8NXmjt57riV05VN0N09HBkH3DW9QR5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQXHrIL4XJQYUSaKJejLhI9IFH3rZbwQl4LQ056czQ4vfQCyXE
	LRRgBecOgZe0l8EAfxqbvILW74yxjqS9lAFcV9yNXEJzVASKdf8OkOdXJ0zdHNcS984=
X-Gm-Gg: AYBFou2mIrFvmHd4saKh/VdJGI3GgxcNNSQ/e4dtbyTpNCaelQsmssX7/l6ww3QjPWI
	RP5kqrV7aMLy+NPEcWAP+xCpg7FR0z621W6aHDAtlyYMI00/YnG7PfcWKEdqS3aS8lH0Aa3aH0c
	a9iPrXqtWdcy5JRajBS6TN3it9AZ4Wxu3zyOjShbAhIVvmdxmyBnLD52fQhX1yafS9GvMhr93rp
	fHDU97r3m+umE+tan8Q0UnyoBthW2DhE6Q54k40ASUlp8gDVekL06AFVGRvglHHNoTbshggfCL1
	3mwnX4+e+PfWs+OZezt9Aj1emzQ5/ClRCQ6fZNcP14j/LzHEIy9ILBQmNQY0V7W0gJvi1vDacSq
	caD4OUFBa33b5f41E/6RRx1tq1d46ZPr/eicWFIqWlmQnLPw1QCqylJSN+orMQPC/H4LMXSWHdb
	Pz8mVky7SeWpGKqCxMeM4y3whBUrZICjt/oAolxDU6k0wEGaDTiTu4NaYd0op5s5QCi34uoMJx/
	WVKvdIuqoaeMKDqskic0VzuKmfibYdsSUE5XR+gkpgna9EN
X-Received: by 2002:a05:6820:16ac:b0:6be:354a:1cec with SMTP id 006d021491bc7-6ef0d333abdmr2941085eaf.27.1791613852696;
        Fri, 09 Oct 2026 23:30:52 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.38])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a328da8sm3999286a34.24.2026.10.09.23.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:30:51 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] macvlan: require lower-netns admin for IFLA_MACVLAN_FLAGS
Date: Sat, 10 Oct 2026 14:29:44 +0800
Message-ID: <20261010062944.2671656-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5b782a811e73 ("macvlan: require lower-netns admin for shared
port settings") added a rtnl_dev_link_net_capable() guard to
macvlan_changelink(), but only covered IFLA_MACVLAN_BC_QUEUE_LEN and
IFLA_MACVLAN_BC_CUTOFF.  The IFLA_MACVLAN_FLAGS branch performs the
same class of cross-namespace operation: in passthru mode, toggling
MACVLAN_FLAG_NOPROMISC calls dev_set_promiscuity() on the lower
device, which lives in the parent netns.

A macvlan device can be moved into a child netns owned by a child
userns; root inside that child namespace (no CAP_NET_ADMIN in the
lower device's namespace) can then flip the parent namespace
lowerdev's promiscuity counter at will.

Extend the existing guard to IFLA_MACVLAN_FLAGS.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: df8ef8f3aaa6 ("macvlan: add FDB bridge ops and macvlan flags")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/macvlan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index afad90b9222a2..d30cffddb1e1b 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -1641,7 +1641,8 @@ static int macvlan_changelink(struct net_device *dev,
 	int ret;
 
 	if (data &&
-	    (data[IFLA_MACVLAN_BC_QUEUE_LEN] || data[IFLA_MACVLAN_BC_CUTOFF]) &&
+	    (data[IFLA_MACVLAN_BC_QUEUE_LEN] || data[IFLA_MACVLAN_BC_CUTOFF] ||
+	     data[IFLA_MACVLAN_FLAGS]) &&
 	    !rtnl_dev_link_net_capable(dev, dev_net(vlan->lowerdev))) {
 		NL_SET_ERR_MSG(extack,
 			       "Changing shared macvlan port settings requires CAP_NET_ADMIN in the lower device network namespace");
-- 
2.43.7


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799437;
	b=GVbyhjo7GEoSGn5KQBrvIKGQextXiVHi1N80OWwsDeWPlyAVqRI34J9f0lD0umvU7d38
	 nw3bS9w5ffkupQJdg2WeqlqeQkmuhKv9Va5XWbn8sKfelywMGLK5dAOO1R1hz49mVU/iG
	 zXlQeqVmTWYvBMQJWv0AimDU90upyPLjDXmSRevwby+oWJDwUXyGrtaB32G8VreD0Tcx+
	 Gdxj7GJ+v7D4kmaA3sUTnA5jYFv68I7d172HmbWpahjh7fnPhWoQlzgRtAAPD4evTlEic
	 RThfVdCe0r1G2XFyQ8ue+YPjtYsrR79Q12IusxizsEK6TnjI82Pd9kl5zPoinhcrvHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799437;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=opWzu+Z5P243dvFgeecQupn/CWh/Fay8et3OHPYV+NQ=;
	b=2X64XmxL9FTlTUvAtmuNLCFIPXhElbuEJfAvRe/0VOExbQNNpQ03EdwjYNYETZ8QbaQO
	 TFc/6BsfpF2jLY3iZ0Slp/5plLBmbVgiULBrrxj/PuQNQM21iNCtIzWMMZLiQNwI2KxBw
	 2d+BKK5c2Z3RNWj2RHJOmqTfBsdSi8UIUzfJ0ZzT7F+pMWw6Nm00iI43EXS6wDYXigQcn
	 a0Ovt7kKjtifsak2m/mpyUZZfRTuy4M78XlSUUI0Swvu6KJ25LT/GuL75MAA9OfDv9MLM
	 CxA9SO+1+hss6bt3NQky+83+g7DUq6DhjfmGw6PcB/e0D8JATFTv3w6zEu3YhnoZBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=ceIOQ++h;
	arc=none smtp.remote-ip=61.135.153.168
Received: from smtp153-168.sina.com.cn (unknown [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E136606A88E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E136606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=ceIOQ++h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1794799432;
	bh=opWzu+Z5P243dvFgeecQupn/CWh/Fay8et3OHPYV+NQ=;
	h=From:Subject:Date:Message-ID;
	b=ceIOQ++hhjia+mFBw6ZZFYE15MlRgkdiyjR8MKx8kLGV3Gqn1vRpEDDcT8QH020n8
	 RKPA/EIvIX/PrD+DzzMSmROqozgWsXXyY7VHveZf28BEkZya3Uf5TR2VKylWcmZ+p+
	 Y0lRKhNFviYxhwJwhJKme26TCy6x3qutO0WNKHuA=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.33) with ESMTP
	id 6AFA773E00004C0C; Mon, 16 Nov 2026 11:23:43 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7140616685269
X-SMAIL-UIID: 3F9731C3AF1743DEBB5EF9AD2E4A2B49-20261116-112343-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+667788430769ef9ddf25@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] [driver-core?] KASAN: slab-use-after-free Read in cdev_put
Date: Mon, 16 Nov 2026 11:23:42 +0800
Message-ID: <20261116032342.38850-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6af9e1eb.920b2b3a.148c65.002f.GAE@google.com>
References: <6af9e1eb.920b2b3a.148c65.002f.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2800868f6322

diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index dab37295c8c2..37cc015cd8b0 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -99,7 +99,7 @@ static int posix_clock_open(struct inode *inode, struct file *fp)
 
 	down_read(&clk->rwsem);
 
-	if (clk->zombie) {
+	if (clk->zombie || !clk->dev) {
 		err = -ENODEV;
 		goto out;
 	}

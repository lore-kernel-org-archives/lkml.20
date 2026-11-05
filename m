Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855812;
	b=KdkJ78xUSgnaqhmJcjObFt9SqP2oi5Yc33E/UtRfI8oJ8VLSZbDdbj5iGUe4K+/PSySh
	 Wmc+oFa5sg909l5tNmYs01v4Jd9acQluMYA5We7zAM5JWQ9Bcmpd/nEJXOv4NlqWEg7mT
	 hkiUyJtYLjrspzkOARniDOCgHeUkVz3NQJC82OUUsSloUazPB9FEyOmocJ2Y0PdvcQoLv
	 MmSQK6pwfJAOGEWEKPvH9itX2zel/0V2aDVln95/bwiyqA67d0Z6A+GpCmcxix9Dff2J3
	 Iy/QtFgG5KtHWUMBPrSLv6x0P8Plte3qGGNZfol7du2yYz1czZIzencU7iAQ2gI0UTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855812;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=U3EkY3zjiGDZ4jxmCIInUMW8zzIqQxNGd+yqgn1/M4g=;
	b=s9RZVyztgdjwVxuavzbRSeuu/cMei9h7EMe3F015TL5x4OK7iKsSaYC2Yvjv3MdJfV+v
	 lvcSNsTx56ahX+ql8huFwr6Q2fKGa0TSARk/P5EN1ViZb5YLpYiefOu3nrhb0IZrAIz7H
	 8EcyFZV4kVA4j3+/1bPwsqET1AXS1/IVqTKGATHVxe0P7czVpw5BcsZrxVNTL6c7jp6Ny
	 m7IAzTqpbpxh5UB1DdAUhSZt4H1uRO2XExzuRpztTOUHPLKBVXGgltg4SdRtQuPlLO+rX
	 /p2HwIQjEX627zTSvsig3dOCxze2bch2zFDkpm8pIrgRgvVsIxK+Flmoe7xecrnkc8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xqvFH9at;
	arc=none smtp.remote-ip=202.108.3.162
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B0606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xqvFH9at
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793855810;
	bh=U3EkY3zjiGDZ4jxmCIInUMW8zzIqQxNGd+yqgn1/M4g=;
	h=From:Subject:Date:Message-ID;
	b=xqvFH9at6+7ZFBp8Ta5Q4Us6AXK7W6dyiY4OZ9hYEPVitjCu7S5sfniv1W9gHTqE1
	 8pbrtF/39oRVxS75LQ7CATuYo2UsRh6wk5t5Z6SME1sEnoGZLeDp+g1venKZRWAWPk
	 Q2Coe1jcIudsKZ9+YGGB50ZWLpgxWJTtQhk8Equ0=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AEC113500006FF8; Thu, 5 Nov 2026 13:16:40 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 2986726291643
X-SMAIL-UIID: 60377CED8AB8493DB9D2FE4A8E093A19-20261105-131640-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
Date: Thu,  5 Nov 2026 13:16:37 +0800
Message-ID: <20261105051637.54502-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
References: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6628e7d4c6b2

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..6b37c52d4198 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		dma_fence_get(&pt->base);
+		if (!dma_fence_get_rcu(&pt->base)) {
+			list_del_init(&pt->link);
+			rb_erase(&pt->node, &obj->pt_tree);
+			continue;
+		}
 
 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);

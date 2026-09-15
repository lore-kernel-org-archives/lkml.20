Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn [202.108.3.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563B474255
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464307; cv=none; b=IAmwZQy7ibNCzDfXzsjiLyEPda7MBcrAEoy7eB3Q4CfPdn6W4J15pZXuYcJ4+0vcdqo7fT3JfDizZMLS+hoPSmuQIw1D/Bli/cmqkrE2dui+DxVOIvLxkLU3rxpUJVqsfV5Edgev84Hj/iry98dhvtiC0ZDAYkFL4b9vYUt4JnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464307; c=relaxed/simple;
	bh=oQuN0YvHJ6L9YyGddvtlCKne+3C6LtyeF23mB5loQCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUJdTxPYLt6n/mT4J1SLBYMXW9+7i1YB5TgjCTZy9DEqrfmsTb5fUhcd1Ll0Y2uj/4LLp6RIJ/2rso4JUNgQ5uxhiuNKyqnV3UDgncYzAl6ipE/CKAHHcNWIqXZiK3tdSNwU1Qfjna7K4sBxjoErGUBWSybiRTOgyDjf+auYuAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=pIODQhKh; arc=none smtp.client-ip=202.108.3.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="pIODQhKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789464302;
	bh=CR4Uy3ao/kp9TC/xBPGb1nCNrWv5fauJ457JaJcaT6A=;
	h=From:Subject:Date:Message-ID;
	b=pIODQhKh4zo0Qw5cg3vGdYdK1ykJAlzs8TDVfyOACGU2iwhZx9TgklXGnJAWiffZ+
	 bVM/mYiftgM25WtMdy0QmYWsR00qAbiweeorYursz3o1k+YUpcpbQUafcwlF0q4Edw
	 qeKghi/ewOiQx3cTaDihJvofHGycMyqpWnMx/tNU=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AA90EE1000076BD; Tue, 15 Sep 2026 17:24:52 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 1364096685211
X-SMAIL-UIID: 70E6D253C42C4ED58BCE540BA7E5673E-20260915-172452-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in atkbd_event_work
Date: Tue, 15 Sep 2026 17:24:49 +0800
Message-ID: <20260915092449.915064-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa8b9c4.f81106d8.2ab401.005d.GAE@google.com>
References: <6aa8b9c4.f81106d8.2ab401.005d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: upstream 704340f1cd0d

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index b9ad2381f885..7f102ff95af8 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -962,9 +962,6 @@ static void atkbd_disconnect(struct serio *serio)
 	struct atkbd *atkbd = atkbd_from_serio(serio);
 
 	atkbd_disable(atkbd);
-
-	input_unregister_device(atkbd->dev);
-
 	/*
 	 * Make sure we don't have a command in flight.
 	 * Note that since atkbd->enabled is false event work will keep
@@ -972,6 +969,7 @@ static void atkbd_disconnect(struct serio *serio)
 	 * accessing freed input device or serio port.
 	 */
 	cancel_delayed_work_sync(&atkbd->event_work);
+	input_unregister_device(atkbd->dev);
 
 	serio_close(serio);
 	serio_set_drvdata(serio, NULL);

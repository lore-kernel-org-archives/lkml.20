Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1F2BE02D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874370; cv=none; b=Me9TGOAHivqrk9AvKZZQJqQAHMBufaVPRwND+c3f6Qz5VijpFenG6uzVTgUL1StOAh3eilCpzcAqBOBfMFZPK1cp5Ii/6RoBVCLdstYukyITMSLbrdcWnBODGxd0SSCi+dC+ttYaLHaMGQ03A86RV2cPGHY/WkiJx/kMT3jVDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874370; c=relaxed/simple;
	bh=3KX/Fugr/Yv5DcLb8arEf1+fCu2wAAMZ9/Xxitb4YgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZivHgYGOO32IX/JhvtIWQE8Jge3kvcUjVu5mZBFnG17RMdAN6nSlk3yzwP29T6QXz2jRq3pF97HHej/hEZYm2QLJI59IurUMW+AfG+3gRY+9fa+Jcen+QYDHaHTebvwC6KxAg93MFHmIymoFSW5BdNIl0GKzxoZ6NE83rTLKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=lGPbokFX; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="lGPbokFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787874365;
	bh=CXmNRXpwDr9L+NRSTgprwbZvNbEWKioENjFRaHEwz88=;
	h=From:Subject:Date:Message-ID;
	b=lGPbokFX9whDKqfuSS5D9GXkPAjUSP3SNiLQxGO45d4M+H080O/R89raowZctauJK
	 KGG7iojlSUc4C0l2mGa0v+mEWpZwf5VVoz0qSSBT9z6yiJxYsOaAES69NuNeCfOGDz
	 nXHPhdWZ2sxbxwa3M786z365h9K8SxXKMTHyZRHc=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.34) with ESMTP
	id 6A90CC3500000F0E; Thu, 28 Aug 2026 07:46:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8115396292064
X-SMAIL-UIID: 0A5ADD4195004BCDB6DFE08C898C3124-20260828-074600-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+b5d7ab56d43de3fd5aac@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] possible deadlock in tasklet_action_common (2)
Date: Fri, 28 Aug 2026 07:45:46 +0800
Message-ID: <20260827234547.1861-1-hdanton@sina.com>
In-Reply-To: <6a655704.70955b6c.323240.0028.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Sat, 25 Jul 2026 17:38:28 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=13d446b9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
> dashboard link: https://syzkaller.appspot.com/bug?extid=b5d7ab56d43de3fd5aac
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1310a232580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c3b2ea580000

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

--- x/kernel/softirq.c
+++ y/kernel/softirq.c
@@ -956,7 +956,6 @@ static void tasklet_action_common(struct
 	tl_head->tail = &tl_head->head;
 	local_irq_enable();
 
-	tasklet_lock_callback();
 	while (list) {
 		struct tasklet_struct *t = list;
 
@@ -976,7 +975,6 @@ static void tasklet_action_common(struct
 					}
 				}
 				tasklet_unlock(t);
-				tasklet_callback_sync_wait_running();
 				continue;
 			}
 			tasklet_unlock(t);
@@ -989,7 +987,6 @@ static void tasklet_action_common(struct
 		__raise_softirq_irqoff(softirq_nr);
 		local_irq_enable();
 	}
-	tasklet_unlock_callback();
 }
 
 static __latent_entropy void tasklet_action(void)
@@ -1042,7 +1039,7 @@ void tasklet_unlock_spin_wait(struct tas
 			 * interrupt processing or prevents ksoftirqd from
 			 * running.
 			 */
-			tasklet_callback_cancel_wait_running();
+			tasklet_unlock_wait(t);
 		} else {
 			cpu_relax();
 		}
--

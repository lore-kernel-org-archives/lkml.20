Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E881D3563FB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161666; cv=none; b=ohz5SJeaRpFrvlEbk8h4irE9Fiwwy2Q+Q5H7ClWNzjcrc0/xhXDxfBW3fmZFNagdmA85a5CWo+qPFQGQGtFs/d+h0YKu7XZhax9M3rGaG6wA7hXgWVTuFue0UKSpCjLmD/v7Ju7kE77ZzWm4CtMLUMpwIK1g/jEoZJpbyrCHFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161666; c=relaxed/simple;
	bh=DQBMScUdmHcykm0n5oqrLLDh/B7YIhxcY4rdkjrT32U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSHaNpEaq6cPrBySu3lBBywehc8SUQnW9B6uTHdPj1C1e+ZGp8NSgud6C1RzWHbVUnd64wVVvah1dgNQwjqoWIArTt17tU9Uz/KJ0YR0UAWu3Ql/IQMOdadjE1P6VS42Qw3ftxAJkTjSjH++3p8tINBbwndMROoZXd0m9L86Ofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Ahva51Og; arc=none smtp.client-ip=74.6.135.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Ahva51Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792161657; bh=OO/5rzJUY2TjghANA+R9YBb35gGjSiidWbv54AUaO6s=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Ahva51Og9VlSiNvgGPwz6IM/J2ho7UmOWteR7JP1DJT73odkIGOeD01PVvcClWbD3MAMxJ3xT1y1QRqmeZEKtbvQ6rBn9hyG798fR0mylA+zoj59CFpUCkDSfg3K8rheYbb6asoQX67F3icgVwlEdxacfGnqc6b+fB7xI3taEfdVwFi0gUCounvPIeKZbFe1DFwpmbrKrUk/eeFkt/PGQm2IDPEG4LL5RUh+ZimJYTrTaVp9oWVeDtPCqvRsGCjaO4RBZi4Q95EWVwVvYookLkfWy8Nvcgab6iEUKK5b6l9UmCvs040FEq9kLAD9hz2CKeqIZ0PUmxZ+qwwGPiIuuQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792161657; bh=f+7hynz/xVav9dfNeg40z5ezJvMsJTTw3Z8eHTOahqo=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=lywX+fyq7Ici/ppeeZvD526cyuCxPauNOXD/UCSwzl2qR8yMmcBxp9ds/jaOtwt9EqOdrauBTzo64tudyRnPHLHzG5xGDxd4WF2vvA/iaAQH8dV6SiQN+Ku7+ybbi52Ewsm4HSU4+lb94242k3GIiZtoEJcVWWrYVmYwsskDJRtK+HlNjDkRE1jZkSsVYqYpZoscqiku7LhCe8DcTxZMdz6PEjMEr4DZ0GmPVlKvHImGgjqZgK5DjFX00wboc+Gv+jqtLZH9qLjMKYRsc/AINrR1HC2oxF4EpaeFDXVo4i75OzySr8J6E8gdli560xb1oNEN2HMgNFaFSq4/s+Ta7A==
X-YMail-OSG: yG7ScWEVM1lQUubxEUx3q2ekf2oO9ORZYu40uZsEOwTTDl6Dt4zwik2IinPWtbR
 4X8P3.9Zqr1DdLke2251UZiKMdwwwtBPsMxPOt.wDwwkyLo7tIlC7zSmfwKieKHDpfwIms_xllfm
 AfyRrHl3mCYQF_xAd6CQZlrVTB6ivqlxqFepeasc80UT1q6w_LI06NBjtmWrNkSVgnKnftlkPkyv
 yU6zpeKF4X3AtduB.NtMHMoBEUnRnhtAJ5wE05KvLM7PcGr0lb6MKLm0YeHLnWInEqtfqb0uK4F0
 wsY594faQ55lWn50rRxM6QJ4DRdfWnrQBpU_9RDY.cd8UCUl91SQntmOvpk1tWHytdAVx7bmGIjj
 BQzNyhCWljNhSFa7hIwrDwLLHsScjyZOu6YrZ9hZhis7oSmSAt1bDI_x5cMeVsOD6QDT_azeHkWI
 DKo0g_Pt3GQ4cbzyKQNu06jVZzy8DGe77JwvUyHXb7352Rke1nRgBSbohrJUz5l_.f._WYvRQlYH
 rw7_RrtjaMqFyqddKaP6CZVZ2s6sTRU5Yxt9fCmaSgMVksD6Xb2z1BqnahdI7sgjCVc5QHZNH7sj
 46tIBKzlM3ni83Qhbo2m.JPnypex9itutwdqScSvfAuTe873Uw8Qk0Wqy0RG.4nae8gRbdwjju8z
 P7iYuuu2TacyUIpE6EHhzokQckGEcPHSXQoUlFipSZIKgMOhUZQM73hxOfWSmH4n9sGbkO_LBYci
 VcjP3h0SauRpJytUoGB72oXx0hnIbz9SaBWsDwqy7G87EiIewGliSkDdNizsnjTHFQelkhTuvBRa
 jdAjA3T03r.zCsQbPcYEpXsk6EiIXGzCGP0kSsQcPanQX0CftzdN7yx.IlTC4tZM8IoWPN6jJhb0
 APeinOwvqHdSE5SvULOvgqV5PrsP6tK2psSNXTpmkcLvLNSmR1QslnbpbMMg41XmvhajSeRhNCRk
 YZl43sh4aSyaMFQgdHPJrYsUUYUSyiXJ89ppqmuSgPRj83JxZkcAKJtZPSiBgAnw_32QC6ru.yzU
 IuDpQEXeKedm5wrzGZQPkWk7qsISmtB533RsXyFVGFm11.PsKB.hs6nQkAVkW9QYrb0qV6I17RKb
 f0V5obFkyg_HAYCq2ewNDBg4FSW6h5k0wgobazai2twBsX0W8SfCQ2KwTFXA75IudZiDPc8LRAkb
 U5twuyF2oE5Px6.SOAnmE3e02GxKJk2wSFh_IG8JKEtJtRdAzkBIN1ENlrs0LcC1mr5wbBBefITw
 YdEl5fuYC2BSMH6j7nSua9t7zDxfvvD5p.5qikOTd99bTiLSXoBHQirlqgqDXb2n3HrnSWRGgA5v
 y0IxMlSu.k.s15aAqgd39sxVcg2PJP5I6_0wKBuZDE6DArUSPvPEh1.u7rU1kF..O1OcOLDpFJ.a
 iNQRUhUt39yrnlJ41pWjV0TzthO12yA99sI9MKPvsFnbH1ZLQK2r4dMqvgePQesnWmuyIFrGUvZC
 B8voJtiOmsqwR06pHIPRl4mJqX_9v2XPM_2oJX7OZn6O55BT7aI8rbUlhfN3yIoe_hjfpYvjJwK2
 GBQtQfmBAoL_bnIsOB4Sz5eDULZn1THw4gVjhcbcqlEiWd35y2HnoR4q7qSmz1EzEvUwYehtJY7g
 SjSNL0nLzrJ.VExGxw5yiwusldUyw9Rff_G0qhKJZjNhIKwn5TCaRhA0Qjj1Asm0piaYI4n1fYTl
 NPjgawqyFYX1_fW1FDhnpx79D36t2TgFpLYpgLaU6kwyASirnoXKMhxMfAWigImIUdNk6siAQkeu
 wrVv.YPjKjI_TKTVMhGTqWRcjP.6NgrEfZ5k5CmGkRBPWVptnHbG1vTWrGMQ1orPSCWbcrh1jzBL
 XfxbZE4t6urx1rrI1ueH2BsZoZf.R9MC3w7QQC7FlZ0qyhXectDchWfviCRNjse4Klkzgl4IzUr5
 4uzrRCbPYQ6kWWeuzx9wkmi.33XZGbwXkzWdUiafw3BCB_z0J.hoqxzfdBttYznKKSRm3zcU5cUT
 idBSg6YNO1hdoAADvNOlCMAtWiSVmIGSE1d6xhecsGoryQ3IykJI59bfczPqZIWKtG0guiDz2Svg
 E_kORdVwVjHk.s2C3qilPT4cOHlXOOFoOvirFF44XLPQoQNxKJR6dvP98REaCKWiTSG5o.gdEkHM
 LiEQou_mTTvT7k78s67EMPJzmjWnEVT255rlq4B7328SiEkGv635VjxkbUMHAPZ5Nx9L3VzfTt83
 pf1kS5nOdWXPdeBfI.ELOnG0BLJQ.mV7KaJFH
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 793cc6de-9318-4bc0-8b76-1cc1545a4dd0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Fri, 16 Oct 2026 14:40:57 +0000
Received: by hermes--production-bf1-6d6877594b-4bzzg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 112798bec21759cfff79130505659e83;
          Fri, 16 Oct 2026 14:40:53 +0000 (UTC)
From: Jeremy Dean Clifton <deaner92@yahoo.com>
To: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
Date: Fri, 16 Oct 2026 14:40:50 +0000
Message-ID: <20261016144050.105317-1-deaner92@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
References: <694c9ee9.050a0220.35954c.0030.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1726,8 +1726,15 @@
 		}
 
 		cancel_delayed_work(&conn->disc_work);
-		queue_delayed_work(conn->hdev->workqueue,
-				   &conn->disc_work, timeo);
+
+		/* Pairs with synchronize_rcu() in hci_dev_close_sync(): don't
+		 * queue disc_work while hdev->workqueue is being drained.
+		 */
+		rcu_read_lock();
+		if (!hci_dev_test_flag(conn->hdev, HCI_CMD_DRAIN_WORKQUEUE))
+			queue_delayed_work(conn->hdev->workqueue,
+					   &conn->disc_work, timeo);
+		rcu_read_unlock();
 	}
 }
 

Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECD27AC45
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629119; cv=none; b=qdNnpZk2D7q9uUMlI6NqRfSaXwHpESWvlBbyWJM50SlZ5P4j2mcFJBf1HNXsy2LylrRtD/e2BDQ9iZdw5QrijQn4RymjVKkJFB/9WdICLZWGysG3xM6f2nJgySJngWYTNAfu5X2vtqxHq+eRL3rwORi+7MxJuSqRkQ1HsMOk800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629119; c=relaxed/simple;
	bh=QBR7mlwSv1dk4hNeQ37EgwsGUdtF1Ev+BOdL7dwmGWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=FT/yz4Gpph6/clbD9dsHcJ92JQydZ1nEcq7KeBZc00DDoIEYUthHcY7djZ2587sB394Ur+3gr8O3GmSEi5HvQXO3Dju4hRoX2XUj/Xozuvj+Ffis303ROdmTza/vidiTkabdagVuoi+AhEfB0gldKSaU4bFZS0stO7dxf9zSb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=K8DDcVV3; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="K8DDcVV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1788629116; bh=W4RXCa9jrNOE9bN7ol6CCJvJkSsG6i1v3u6fS01EJhU=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=K8DDcVV3uYRN2PR7zAeDLuJK/3c1sKYRK4w8ms8rg3jHINDWIw7tloIAy3LV2nM6+C12yU2rGE7ZYhiRZDV6CyZmZKY9NZBg2EGbqYp+FQ9DZ9lHoWoVYErkG1MISrSN7QteJoV7uOxiKOp+Pmmd3zsBMg+KWT0h6Yo8Mf47J+LWKPb74CcjbgWWiQctDo/M7jH1MNqcY0ZzMBFeTFO0/yh8NqL6pjF+mzzp91sZqwLSnuvCjUyd0kpUtctbjj9eBVK8Kaiezr0rJWWLFq74HfNtf4YMnSObwFK9fph3j3FqymRVOqCUKPR+CdZJXq6TpqfMjq2WSL1j+FvZjdbJVA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788629116; bh=sn/Rf3VEDenWu1IzIT+kCxzXmJyO7zcjdnoaYAjsJGo=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=oeEfhtjA2PyT7bR//iSIN+GYvVgbe/FwctWAXecufT4lkQgjlZge6D5ciHwuiFB6n5KQ4s+RlsnuhAiJSNsxfiRsG4ErQ3F2JSkiqjuHxU2kg4iDvwD1KlG0kkZ+JzMJZ8ewv0ZiDj34oiU7X9chZdTB/qIsiRKPWVbeRjBG9+NDbiBMZr0LLlcnFKxoQxa/3HBrdZKyPt6w+L4hMOjCCK9EkiFHAldoVrPKJRxDKWdkZwPYEbuCdyRFPenK29AoaFalyOJM6VxvYqRYcGpQngxrUEHoLFlpqo6poVwhFr6RDospNPEIzLm4jHNevDLnFi9mPwe8bZlVJEVEXaODZQ==
X-YMail-OSG: bD5_AFYVM1mGI7ha2b4R74XXZ1uTYBmaoQMig0ajmPueJhOtjQmy__yG60AMFf6
 7jnUMc7p6hn9iqm4booB2YFIEjDnOFVjO5wop_c2K5qkgJpPWHZUDq9lI6CG_6j.F9WWSMXqv_Te
 xPEx_aN03qQsB9xNleb0ytGTAoMIJdjoDyIOQDdSiMbRClb7vg8xH9tqcqDS93v8IKfYwuxEjQFS
 TBCkoMpPsIeFkRAnkEyatTgvz.wdpGc1OZyOgawc73Q6ck4gN22F3jr2Udheg3Kimz1V0YDmkEV9
 1DgCSoebkY6BraeloaaywkOPUyQpBK.VwDDlVpLrjdWgEWQU1jxdyi3iDKvbPnQbceZ1TFXVwR5K
 UGSwrsshHzX4.htKguztT0aA2tmOqSApYtX790ZZI3a0ysYI_YjDki...kDEGJE.5iOsnpR9zz27
 TN1kwfVCzOh9Hg_I6QsixY.2YTt4JI73k9Zecz4j2J2QrmWz5DQmaRFe_I6tL0WdnFURWUez9Bit
 8O5JlK2WXxH6dqzRlpIjEfsLDwAvzMDw565AOeNooXv0eYxcuzjqVKZImRp43XokFvOjrkCK4MSC
 BDobmugQbSsyLbKwjywuokZleEuYUiG_MSUjPbFPfGe7Kx2VXU4DWCMXE2tA7cU303El_SMrmHe1
 zKax2sxwFwk1vA2Tu.tPiJhpYotVZH5aWsHAj9IZSpY2LcrRBv92aoIUtJ3hegCy5KakiAAs6aeI
 v5E5gvbj0taTc5FFBqnlQZ7cnkE0VQjxe6oT5HO81YsgFXIR0Af7D36eoQXwehdVavTMGtP6mjfc
 e4wOAjz5yoUs5mRmkG_gEOuonoc35rbvkxpBQaa08uJJOSHPJSRdhRG2hZEbiH1nhxEv3YPNvsKz
 epMt20flTbtLApkPUIymLDiA_wWawLYqc01lB5sH2GWZ0E8SWNWSdNHYSlC5QbRTE4f0vBSyJpBx
 Ibvc1hg3cmnWRjvCpXF9_ThC27DtNyrLI_0IN9Pr7bEyUm7z0LAdDp4NzaS88CZ75KQH.i74XsqK
 4iG_w09Us3N9pPAzBLgtllBp3oZSaDMCO0GwjA17MvRisF0ignc4zuDtiTkMroDx0OiwusPlmjOX
 Rzxz_tEpZmdDGzFeK.ER6XcZQ0WS9hJajxSOpFxL3kjcQVeYWfmVeZHd8RvQPAvFKA.ZmryJ7BGa
 .Ddw69yJHYi4qApRg.yPQr23jdVjxylSr1EfMQfUrV2GKVQvrARwDV12osInj9AQ.JRJFQczk4WW
 jAF5zYVm6unKCLDn9M_XHpMpzybWr7GyHTBRiDGerB..KKIOkzlkSVunHrHQmVL2IJnQB9qdswBu
 pLztqKp3NuKIUOoIeeutOHG3X5puNFi8C6B7freZxUaxTiSpVqsn3TaCteZJYGPpZNsZVCQ9L5h0
 6Bi7Hn017ItLqJ_2o6bMDA4ItsRpqJ.WdajYJeYxEJF3Y084Ae32syGwffB7OyuJ3ZE4Y9OyQIKC
 6wBz1unzCxw0_05xZRI1h67BDK3T1l9SyDaE0YtjdwuNyhpi1dtskFTvmVrD5TVhkTS.192fnwhK
 VsKS0lzdwsc.gmsaN2LZicyPPN5T7Ii1trUwR3JV2q9OJ4ui5pU9PL18x58tkabMpzn5Q2t4NKuf
 euKhLF5HHbqyVExgSSnTFU_Ke5nvnjsPgLN_2hWIRRZaTTvU5IPsTB9A7dCQg2wukopgG1LGCuZS
 nn8UtILfgeakk4RfHq.WteyokN1l4iLgJXfqKaQ8TvZU7dHmbmAA349CLR6NqqfU3D9g4HQOElOd
 e7lYzmQPsKeMnzhrusYvXcYMOE3mrokN8i_SJv0MfU4OVENC0jdO.WZ4kODgcaRgPVOMBvJMgu83
 7conxVoXcGvURaQY_DCyxrtTZYKxcSnssRxkUdj.EqYnh6sshhKrZtnwZ_iD1QJjwmU5WElYl8aQ
 Tso2ue5o3NTH_xZAuzqlqHB9snUhtNShix_qNRQjGTYppVxP4XT8Fxeo0hrQeqjuyYKBT4vTfuOC
 sfqLxUyEpB7Uvqkyme5l_x5dBuRGvYaczApSBs.oUkxAoKHs-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 97d9f4e8-f96f-4b31-b899-63e0089076f3
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sat, 5 Sep 2026 17:25:16 +0000
Received: from dip102.lsn.ir2.yahoo.com ([87.248.99.111])
          by hello (SMTP) with SMTP ID 242882be441f97b7b3fc17da0e8ca684;
          Sat, 05 Sep 2026 17:25:11 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 05 Sep 2026 19:25:10 +0200
Subject: [PATCH v2] staging: rtl8723bs: remove dead code in sta_info.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-rtl8723bs-sta-info-dead-code-v2-v2-1-06357302dec8@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTZQUtzUVxEvujTTiLTS1CGMv
 bt1u/w48J8FTIqKwaVboMispjk10KEDfoR0F9TYDOSod2d3xFJfp4H8aGg1oKYpY5QQkXMUnAk
 9920dAntx0CrvIpN+t4frbbd9xqdw/WdhXX9vAQx/gwAAAA==
X-Change-ID: 20260905-rtl8723bs-sta-info-dead-code-v2-3c623b7ac3e0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788629111; l=1737;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=QBR7mlwSv1dk4hNeQ37EgwsGUdtF1Ev+BOdL7dwmGWQ=;
 b=4bald/0hoonNtHKsQeY4VjLf/yl8vuC1MnQpGSV+heietPUnZxDQb3gQkx+kMeTtIQLh32OaU
 Rd/vl4uxFI9Alvh/Ius7e3fJBxstw3BV6dKhy0SUz0IPr9jDyMiNyKF
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260905-rtl8723bs-sta-info-dead-code-v2-v2-1-06357302dec8.ref@yahoo.pl>

Remove a commented-out unsigned char ampdu_txen_bitmap declaration
left over as dead code in struct sta_info.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Dan Carpenter reviewed the previous "space before tab" comment fix
for sta_info.h and suggested going further: deleting the dead
commented-out ampdu_txen_bitmap declaration outright instead of just
reformatting it.

This v2 addresses that directly.
---
Changes in v2 (per Dan Carpenter's review):
- Instead of just fixing the stray space before a tab in the comment,
  remove the commented-out ampdu_txen_bitmap declaration entirely,
  since it is dead code ("Delete dead code").
- Add an Assisted-by: trailer disclosing AI assistance, per
  Documentation/process/coding-assistants.rst (the original v1 had no
  such disclosure).

Verified with checkpatch.pl - no new warnings introduced by this change
(and removes a pre-existing "space before tabs" warning on the deleted line).

Assisted-by: Claude:claude-sonnet-5
---
 drivers/staging/rtl8723bs/include/sta_info.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 0f53e77c110c..fd831abdd172 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -122,7 +122,6 @@ struct sta_info {
 	struct recv_reorder_ctrl recvreorder_ctrl[16];
 
 	/* for A-MPDU Tx */
-	/* unsigned char 	ampdu_txen_bitmap; */
 	u16 BA_starting_seqctrl[16];
 
 

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260905-rtl8723bs-sta-info-dead-code-v2-3c623b7ac3e0

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


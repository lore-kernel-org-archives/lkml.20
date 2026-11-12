Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485586;
	b=TbyKvW4fzLg4EdUqshp2R8yvodSRIhqw+E56o7tW160Lb4V0wKlm27LN6lUj99Cv82nD
	 PSbLkaSQjqEJahQd14XuEVt3E7L9VrVJzVOQV3uCd3WKQEYsUzaWKDKyzJ14zCWcpwsu8
	 9Wxul74wt6RgTV79/08xI2I7rqBhO5AWRdkE3QZCRdHrESNhK9eZl6iLGRi9SdSOF0Pi8
	 h2jsZdYaW6NOCaiVxlPAzNhdVDYO5M28DpAYdHZtlFIeYFE0x30J6JIDYmLcomSDa4Ua8
	 fX+VyWaeUQfQ+HGqpqPc+qOV81SjJw/8bodhmiTYqN6e8vSq4pR2SL1wZbYxtyoF/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485586;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GWyoortEsQ83RaYOQe3KRVOe6BInJiEA5AdLNFUEjsI=;
	b=xjBzvUKzI8x7ihzfRT5Cz8kMNx7raV2/OmQjfXBuTMJCO7pGwtUsAuvMfU0bSIeowguG
	 GqoztdSaO7t5l/ncNYxOF77Dw0hMsMRwkyVwvkkYPEiEBBvfM/2mVVg9JOqORUmkyJyPX
	 NiNag4fUOq/BtoYLqH5mzLtKsmrW5DwiarmqEkhSzxiR0hoako0zTEJi3kzsgUcEqybwO
	 7WGpoBNZCL5qCzjDXiBuY+ExBw9wes1XCcLDGAYoEhppno2a0OTuTCmc8GAjyT887eVve
	 b+UqMKzKpNUjOQvtXNpQ1jru/xumc2+HeRyhEAZDIRGFV2v7Mtg0BThDWgL/Nka+FDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JhCLWoCj;
	arc=none smtp.remote-ip=203.205.221.190
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABAD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JhCLWoCj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794485581; bh=GWyoortEsQ83RaYOQe3KRVOe6BInJiEA5AdLNFUEjsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JhCLWoCjfzeunOLCuDm3NINky64WilzQWFJEk2H+JgXgDD6d8TiLaFHh8oZ9lVAW/
	 HGGcksz5GobBGwSxTp+et29JzNuuLMQHUdPrFjcpRdjK1xY4cD5wsMSRD4Ca095Mj7
	 tPvOQ89MCSr+gL3FfkpDfmkZwMcmkvWRXbiH6E+g=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 33AADA2C; Thu, 12 Nov 2026 20:12:58 +0800
X-QQ-mid: xmsmtpt1794485578t34rwxpsm
Message-ID: <tencent_D97A691A1634F9F6A6635C25B1B68964F707@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOJ6NrRzcrJM/hXLOwdMqpStp6nGnqqc12lSAIrOfkx2X8Ej2uP7
	 RmzjjaIEWu9n24IKTRiizpWGxqhbCjPa/Fqmiq1eGMuT5MKK1xLAuXDGafiGXqT5I6XOayS3B+pa
	 SJLg5ZYMoNJW5M4quYWIg5f0BDPZLldMKDy3nhGXuduc/6Fi7SBshJ4arBbldhCTIPUAiRK5Zfzc
	 BaqFOKEngLCRiiCBzUuGpaNN2u10Twz7w3NgrTxLDOSrsCzGKaMOXGAWxs2IICQo77M7Ee/+MUwz
	 2e6TYTneEguOgQ0CaIzMMjrf8191xatnxKHTOTaUCJ93lw2eVS/OauXRP5g/SbGBmuTCToGUD+0T
	 0FktLjSUS50IyaXIuaYcsoulREgBn4HRq+GUV/KYuKuYmYjpwKr8in8RPCSc7eVccklMbLvmQ8MB
	 yj1a2W6yF9wagLKe1T9pK7WvVA8fLOJhDQfiMlSczLv/SGgCO3qSPFwZKYguOczap7A3LhDz80If
	 +Pnwkxb12ezWXaN6I0QSZbRB0xwkNwZjd2qJ6c0zzsCWSU9hirDJGaTy2h0mddje6FWZg/affHRA
	 TN6uYq/7VCUv+nkNeLY9LZh9GdsBUEO+bbghGw5oSNTQrFvDnwiMnxdYwoOSgc0QToE9KbdA44Vp
	 tuDrquH1u8278o9yej3WIHqDkSwH5NKCiuVz028WMpvs9q4HXQA6Roc23mcaB/CdTXhSJkBNXBCF
	 hvM41rwZKaeatDrC4cYiFZqG/sFLaDKgwBoiIEZUxOYBkBiWuZUAVWexPmG0HzGuuNE+XZxlza85
	 nfUXmZFHC8iclYX8EG2N/rEBj3nUPV7/7CGizNb/2Kcp+gKeVOeJ0qBcz4c3O6Ohyo92xHXcjk58
	 jmin2D5lokvMnICe+Zwr2kdDk25AR0hJZSlQV5KqTcibu368gcTKO+4dyKfSMnX60oyYppdgNvZi
	 SFk1EDDisCYIIZt73b2+R1b76FiaQmbdohxjJ7fDUPXyAhZNL/I3YFBDyJEnS0ObYeqr89qTAVMv
	 cv34v5w4s26kA7lUsXWSDC02cF5fb6Y1P+5ymQ12Fqbq3RXiH+5L1QDoV3laY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: jfs-discussion@lists.sourceforge.net
Cc: shaggy@kernel.org,
	qguanni@gmail.com,
	syzbot+a98891ce2318fe7baf05@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jfs: fix use-after-free in jfs_readdir on legacy non-indexed directories
Date: Thu, 12 Nov 2026 20:12:58 +0800
X-OQ-MSGID: <20261112121258.267817-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612191204.95876-1-qguanni@gmail.com>
References: <20260612191204.95876-1-qguanni@gmail.com>
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

From: Jenny Guanni Qu <qguanni@gmail.com>

In the legacy (non-indexed) readdir path, jfs_readdir calls dtReadNext
to advance through the directory's dtree. When dtReadNext reaches the
last leaf page, it frees the metapage via DT_PUTPAGE(mp), sets bn = -1,
and falls through to the out label, which stores the stale mp pointer
into btstack->top->mp.

Back in jfs_readdir, DT_GETSEARCH dereferences btstack.top->mp to
extract the dtpage pointer. It guards this with "if (BN)", intending to
distinguish root (bn=0) from non-root pages, but the -1 EOF sentinel
also passes this check, causing a read from the freed metapage slab
object.

The existing code already had the correct EOF check ("offset beyond
directory eof?") immediately after DT_GETSEARCH, but the dereference
inside the macro fires first. Fix this by moving the bn < 0 check
before the DT_GETSEARCH call, reading btstack.top->bn directly since
the local bn variable is not yet populated.

Also null out the stale mp pointer in dtReadNext when bn is -1, so the
btstack does not retain a dangling pointer to freed memory.

The buggy ordering predates the git history; the EOF check has followed
DT_GETSEARCH since the initial JFS merge, so there is no specific
commit to reference in a Fixes: tag.

Link: https://lore.kernel.org/all/20260612191204.95876-1-qguanni@gmail.com/
Reported-by: syzbot+a98891ce2318fe7baf05@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a98891ce2318fe7baf05
Cc: stable@vger.kernel.org
Signed-off-by: Jenny Guanni Qu <qguanni@gmail.com>
Signed-off-by: Shuai Liu <847807867@qq.com>
---

(Takeover resend) This is Jenny Guanni Qu's patch from:
https://lore.kernel.org/all/20260612191204.95876-1-qguanni@gmail.com/
Posted five months ago without any response, while the bug keeps
crashing on current kernels (latest syzbot crash on 2026-11-11).
Keeping the original authorship and analysis.

Independently verified on v7.4-rc2 with the syzbot C reproducer:
baseline kernel hits "BUG: KASAN: slab-use-after-free Read in
jfs_readdir" (object cache: jfs_mp, allocated in dtSplitRoot,
freed by release_metapage) within one repro loop; with this patch
the same reproducer runs 2900+ loop iterations over 300 seconds
with zero KASAN reports.

 fs/jfs/jfs_dtree.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc25..acc5f1f9029ad 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2874,14 +2874,14 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 			ctx->pos = DIREND;
 			return 0;
 		}
-		/* get start leaf page and index */
-		DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
-
 		/* offset beyond directory eof ? */
-		if (bn < 0) {
+		if (btstack.top->bn < 0) {
 			ctx->pos = DIREND;
 			return 0;
 		}
+
+		/* get start leaf page and index */
+		DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
 	}
 
 	dirent_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
@@ -3293,7 +3293,7 @@ static int dtReadNext(struct inode *ip, loff_t * offset,
 	btsp = btstack->top;
 	btsp->bn = bn;
 	btsp->index = dtoffset->index;
-	btsp->mp = mp;
+	btsp->mp = (bn == -1) ? NULL : mp;
 
 	return 0;
 }
-- 
2.43.0


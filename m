Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849278;
	b=wxSx1rDBzGJeymZIOjGV+japrhMuL9la6GoI17H4qqlmXnoAz8Lcm5rZqy12uwX4oyhv
	 BgbjevvsaGG1ludHSe0T/N7xFsEU/kQKP+G7Rttdl+qXGhaE3dmR0KRSpWgYWKDf5d5W4
	 WpJbBF4Dgnp9KvJqPbzgxbxP1noqesYScJVUoy9Q8agFgIL8GAElWrNXIiV0grfts3DkL
	 bwDWGyxu/GsuHCJICsTsxs0dgyh9U+tSC9qgrJ3vG8mcQLUkSDrdzRrKgnuKIDxDutk35
	 aJVNT3XzjKEhqKiN5pGI9sTQ1RrE8OD//zt3SiIVHeJ8KggMnQezTGzZllOjqmS+k/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849278;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WSnrvizyH/3Y4hnKNO/DGtg+xlXa8ybuP1DvPmB6OUE=;
	b=j7yqC6SjlijI4Hvh7kXwqNcdGvRNoFgheodzYSzKTGsI/dc21IbKV2ILARKIc9uCF/rX
	 WCQLiVvchives7A3wEUPfPiTxWkEI+HSx1XXlAynSrxbDjcg3FOLi3LveboYJqHDQIWIg
	 sl3QuyjnOkqFU8H1MZzxGjbUrq1FJf91cJZqtkGKBIcxGC23+9tS4kZzoluUgXmIeKjRI
	 Bv3Cc05XX10vU8wXtOJZ+yr9UIK7YBQ8RJpeKn0u/1OlXrtT0dfcrielidWJ9FAkVUVnE
	 13egz0bJOSJMN8d9eD6i9chK+PtgqSG3Hu/84cfOVm5oOSihdrlHQdprHptOHsN5mTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=EpTH5Lgw;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC4606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=EpTH5Lgw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793849269; bh=WSnrvizyH/3Y4hnKNO/DGtg+xlXa8ybuP1DvPmB6OUE=;
	h=From:To:Cc:Subject:Date;
	b=EpTH5LgwDT4Pe8TTIzp4m1q5T1pZ+Nrq0/zKnJv4yiuh5lz6oG5oRtWJWjch3BSUE
	 w9SwkNmxxE4n55HAACdWkB7DsAN4TPmjplAduZ4YJpYQ/RTDUfJX6lizxSMZW/hyUa
	 6a+mScQ2NF6HhicSLScDzb5dJTuw2KtDPPqhjscQ=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 6EE1A02E; Thu, 05 Nov 2026 11:27:46 +0800
X-QQ-mid: xmsmtpt1793849266trffmrav4
Message-ID: <tencent_FAA58958D0E5079A7E70B1C4382752DC9509@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XFyWHgECT7Dl52DKp48LaCrLuTclpE9nXcDcZUhjtaMRgrIkjAa
	 y4zioyv0iX1ThnS4/YK3i8PCbZcUHARJYYGYBTcpcYnTTgayrlB/wJ2TSl+xojXRaxAZJxYsMIsH
	 8YplLfL3VUqb3tdh0t08sfigQfCa+11mw2GigfQ6EDj2yyfyNUAgIMReoXIu1+Su0Xa5W551I4cg
	 MfanyBYyp4Z63K2bP83GarHqXTxjQaUc88gOGzBAYuexogq8PROTKSs+HzDUSyQT1Qf2ftOd20FR
	 HWh78a9X2VsY/UDENztR89KNmxgz2j6dROnqykFjxSlhxZOZENwCayy0vO9bmHYiG1fH2bBm4Sw5
	 mrXd2iIlJtP2HN4E/pSNzyCgKd4qawTli1iHQOd5F5pn+a7WzMbsvd8hAGs9EJZGNEzMJGthlQxy
	 F1L+kaCDBw3pAFZFW3fzvrnBI4JFWWQefiYDTmtV9/85n4ve8EvRHiIQQ4xFApAWOTotiZMRDbRf
	 M0CIE/t7X7LkC/azCXGOu+jjyYnWaWD2vGFpkTPEW3lpsieCQM/6f/Y0VdLhsrIvdCoYJSImNrFH
	 xsJc6N5hmwjdDjNgqKlXTnYYssYGKTxOL15MVSXVttDEODApLztmE1azJqAvBABjta5ldFzT8o9e
	 UZ5Hc3h1xpaXt0wG2Xtobkbmyf0/3ykgLpf31m/xF7WoiqN7MPVWEQmTSIMXSAoADd4ctl8DQdW0
	 MnlQePzGV9ElE7zwmnKlsLxfdaBclBeMWEEDP14LfajbrbqDhasMeNjaLWXUHz+9kWu1AVvj6h5d
	 dkR8q9+e7Y8U6HvVwlelVICgE8GVcHS9I7c2lvyaGDOBXcI1S55Z9a8jfwalHlmyuzjrfDlBgQcl
	 w7RYjGjDh9eyRNfo98XlbdCKasDtK/lPZgu7xgG/v8IXVBb782O+f/YIl2tGOGWVMpBNNeXHi7yv
	 cS/abw6JWbHawcM2e6HvdZ6KbdwRWQb0zZGu6fKgvytE2lwNRkYPLl3KvKups+G2QnUtmUuAxT4A
	 l9UqlgcGgkUUVTOiu26FHO0gF/6oau3bVHjaURqhMLUo4hLWyGWUxnHnPTFCiifQIyKPjQGEyym8
	 TMyasg0yTrYJZkUw7KdYsZEN/SV+N1PUHLNKzN
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com,
	me@eltavine.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: fix kernel BUG in jffs2_sum_write_sumnode on empty summary
Date: Thu,  5 Nov 2026 11:27:46 +0800
X-OQ-MSGID: <20261105032746.19827-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

When the first write after mounting does not fit into the remaining
space of the nextblock, jffs2_do_reserve_space() closes the block via
the summary path and calls jffs2_sum_write_sumnode() to write out the
collected summary information. However, if no node has been written
into the nextblock since it was selected during mount, the summary
collection is legitimately empty and jffs2_sum_write_sumnode() hits
BUG() on the empty-collection check.

This is reachable with a crafted filesystem image: the only partially
dirty eraseblock picked as nextblock at scan time has too little free
space (e.g. 140 bytes) for the first reservation including the summary
frame, so the block gets closed before anything was written into it:

  jffs2: warning: (4872) jffs2_sum_write_sumnode: Empty summary info!!!
  kernel BUG at fs/jffs2/summary.c:868!
  Call Trace:
   jffs2_sum_write_sumnode
   jffs2_do_reserve_space
   jffs2_reserve_space
   jffs2_symlink+0x172
   vfs_symlink
   filename_symlinkat
   __x64_sys_symlink

An empty collection is a valid state: there is nothing to summarize for
a block that the kernel has not written to in this cycle. Instead of
BUG(), disable summary collection for this block and return. The caller
then falls back to the existing non-summary restart path
(JFFS2_SUMMARY_NOSUM_SIZE) and either uses the remaining space without
summary reservation or closes the block.

Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
Link: https://lore.kernel.org/linux-mtd/20261015145341.34322-1-me@eltavine.com/
Suggested-by: eltavine <me@eltavine.com>
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/summary.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..1e4a19df4c49 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -864,8 +864,17 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 		goto out;
 
 	if (!c->summary->sum_num || !c->summary->sum_list_head) {
-		JFFS2_WARNING("Empty summary info!!!\n");
-		BUG();
+		/* Nothing was written into this block since it became the
+		 * nextblock, e.g. when the first write after mounting does
+		 * not fit into the remaining space of the block. There is no
+		 * summary information to write out, disable summary
+		 * collection for this block and let the caller fall back to
+		 * the non-summary path.
+		 */
+		dbg_summary("empty summary info for jeb at 0x%08x\n",
+			    jeb->offset);
+		jffs2_sum_disable_collecting(c->summary);
+		goto out;
 	}
 
 	datasize = c->summary->sum_size + sizeof(struct jffs2_sum_marker);
-- 
2.43.0


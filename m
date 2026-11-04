Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776479;
	b=ZDFUwKVj6zP3X1fjeoZf0v4qiZ2wUFIgv14GxM6rcxNwQgWXGwHkw14QI9IwF1Ls2CdV
	 +MueOlqzQa/r7JZR3v1of9C1tkKdGoJlAckUQ4ZRpAFZTx24c7fo7xz+kbVT96kBPW8e3
	 Cq/1Ocsq1Bqy65IcOV/xO4F9j8eV8HYlGld3a4Ckw+nsUsIEzTiLyam6m72h4DaRe89Y8
	 U3JC6kFKEdofb2AI8svkd6rqKiWb3tFuDJ4JR6/u0WRJMiVdfCm72vtBbHVAbecTdsUad
	 wnUiU0v15zYBG2gsTNP1G64d7eceVoNe8NibVI2S6Koylk90BQ0jCbQLTpJ7KFcynvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776479;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=+dgTcsvGsxlfZFuOnaFwJUNgk5C+nOXTH/L5UK5A4b0=;
	b=j+6smgy03iiLtr9wA+1RlYcIBM/lAsNFVOZ3JYyS5E7c8MIa5g1081WEQciQHBJPnsnL
	 WXw+XnBQs7yUaXSm0XfV7RGfvMlDNL7mWNOsSHOviQLNHDxOnwzuw1rd0pZSI1kV/BjId
	 28TlRwttAEemiWn2ww472VIZx6p23upL7zBa6u1g/7UhTQcN5rsOck/OZ6cLPv2nMeF/y
	 itJOoTEQ/jPLdlq3dhRSowvL9v5tUD+JJA/tkM3qRipiCeAX/W0lN72YyBDdGyyTTVyy1
	 4wBCFnmuRId5avricM/xUDsISH51RdSZ+l5cLMCXOeBgeHaeos5fF/JCrtp+4JeLwlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DlGbcIBB;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DlGbcIBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+d
	gTcsvGsxlfZFuOnaFwJUNgk5C+nOXTH/L5UK5A4b0=; b=DlGbcIBBoy6bmZtUX/
	UIaSQcCY0b4BcrE0QbCNZLFoTzH/5y0ay3xiUgdDPMe5DbjVBv6ApwjWFFD6ktbP
	TG+6xqXU+OTaoVqRaYSrOzEh3cmwTWFqXqqCtSCZ3HRimUfrm/7Z+8WmsPZMQrc4
	w7U5AdLsozbd+bX5oP+FRrVek=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3UzdO2+pqGl4+FA--.8814S2;
	Wed, 04 Nov 2026 15:14:23 +0800 (CST)
From: Yongxin Yang <yangyongxin@kylinos.cn>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bradley Morgan <include@grrlz.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] perf/profile: Remove unused local variable err
Date: Wed,  4 Nov 2026 15:14:02 +0800
Message-Id: <20261104071402.1543517-1-yangyongxin@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824024251.279751-1-yang_yongxin123@163.com>
References: <20260824024251.279751-1-yang_yongxin123@163.com>
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
X-CM-TRANSID:_____wC3UzdO2+pqGl4+FA--.8814S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWUGFy3JrWUCrWDJFWrZrb_yoW8Gr4UpF
	WY9FyUGw4kXr1DGay5ZF4kCFyag34DXw4IgF9I934fZry5tr48Xrn0vrWY9FWFqrZ8Cr4j
	qay2vrWYy34jvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uyv3nUUUUU=
Sender: yang_yongxin123@163.com
X-CM-SenderInfo: 51dqwsp1rqw5tlqrjji6rwjhhfrp/xtbC4xBg-Wrq21BtJAAA3s

In create_proc_profile() the local variable err is only ever assigned 0 and
then returned, so it can never hold anything but 0.  Drop it and return 0
directly.

No functional change.

Reviewed-by: Bradley Morgan <include@grrlz.net>
Signed-off-by: Yongxin Yang <yangyongxin@kylinos.cn>
---
Link: https://lore.kernel.org/all/20260824024251.279751-1-yang_yongxin123@163.com/

Changes in v2:
- Rebased onto current mainline; the file has moved 24 lines since v1.
- Reword the changelog: err is read by the return statement, so there is no
  compiler warning to fix; the variable is simply always zero.
- Add Reviewed-by from Bradley Morgan, given on v1.

 kernel/profile.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index 13be6fc9fd00..2d3bef69d3be 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -240,7 +240,6 @@ static const struct proc_ops profile_proc_ops = {
 int __ref create_proc_profile(void)
 {
 	struct proc_dir_entry *entry;
-	int err = 0;
 
 	if (!prof_on)
 		return 0;
@@ -248,7 +247,7 @@ int __ref create_proc_profile(void)
 			    NULL, &profile_proc_ops);
 	if (entry)
 		proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
-	return err;
+	return 0;
 }
 subsys_initcall(create_proc_profile);
 #endif /* CONFIG_PROC_FS */
-- 
2.25.1


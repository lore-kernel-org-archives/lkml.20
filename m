Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784815;
	b=JRST7GIhEwdrkYenApchqabhqq2/BJI19IrORiJbtfCw+BLY5ULoaO6Pj2FW6AsaqMWX
	 P+A2clU6yB47v2NhW5Jog5pZBwRnaVM039Yw7hTyeS6vC/ks9Zu/mEMwO+EEe2iEeEbnF
	 9sGqQ2bdLlpP939+dtjUIldCyjBH/fmrbysCUc13fQ8KOkAWxxHHnN7FY7ssThNyQo7Wa
	 Ap4e0/QETdUcJOBKCD/faduRrxzRb+cNH1hAqqYeHIlrx5HcyEoq7tc/h7NReDkgsu7LK
	 DUd2Zp4wku/iWFrD+m6+1GsZDT9t01z7exccbO4YddtihZn1kN+G8wOLMKJsm6jQTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784815;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:Sender:
	 X-CM-SenderInfo;
	bh=r0PEJzNKBU2nu93jlbbvh9mzyYmpqDjhBFUhNv69jUI=;
	b=M9aeubmI4E5Wp1G+Be6vMY+ghDl/AOWgm76w5TdyUJkHBpkpd4TzeQ5cRJIgCl8bTpjq
	 u4zbjIK/Mj77HEX5VYzE9DemsuLseF7dG1/fvmqjX/QBX0yxAsZajBVlxYVHCEzO9GHEK
	 NAeXPjhEjWcVHY/bejE2Mfnhi8DcBqScLIjk/CDixchyW8/gD5XV5j2UW4TuyEt4zodE/
	 BJgyLlJGk7OAdxKHAVJJchg9Wpaxdlrc25SHlBpO2JU1LjU8BmNBdqCNGr+ffRCHD+knB
	 jaXxkI2/s/URy46A1nYTw1MV7jH9jcQeL4ZVwDWih8zUYqvmaI8lkPNc8Dxtn62ydrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qYzLaOXn;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B2E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qYzLaOXn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=r0
	PEJzNKBU2nu93jlbbvh9mzyYmpqDjhBFUhNv69jUI=; b=qYzLaOXnQ+XuFt2Uxh
	D+aIuoRGuiJpI5FZTthUOt4hWjGRIGqjeDrRDvG7pSPMx7Oo0Y2LPzF0/6tgpVZK
	BBNY49tdFCbrap/6MH9ptRzwxwwi5S0m0zJJAoWe8xsKx1g6mEASeVCaCPJ9NScW
	HZymOP1W8Z+ZzA1gaNtan6qaw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnD67e++pq7mqsFA--.5728S2;
	Wed, 04 Nov 2026 17:33:20 +0800 (CST)
From: Yongxin Yang <yangyongxin@kylinos.cn>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bradley Morgan <include@grrlz.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] perf/profile: Report failure to create /proc/profile
Date: Wed,  4 Nov 2026 17:32:58 +0800
Message-Id: <20261104093258.1802802-1-yangyongxin@kylinos.cn>
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
X-CM-TRANSID:_____wDnD67e++pq7mqsFA--.5728S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr43ZF1UuF4kXF4rZr47Jwb_yoW8CrWkpF
	WY9FyUGrWkGrykGayrAFn7Cry5Z393Ww42qF9xu347Zry3Kw40vr1FvrWF9FWjqrWkCw1F
	qF4qv3yvyr1UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UypBfUUUUU=
Sender: yang_yongxin123@163.com
X-CM-SenderInfo: 51dqwsp1rqw5tlqrjji6rwjhhfrp/xtbC4wGMKmrq++HBUAAA3P

create_proc_profile() discards the result of proc_create(): when the
entry cannot be created, the function still returns 0 and profiling
setup silently pretends to have succeeded.  The local variable err is
never assigned anything but 0 and only hides that.

Report the failure and return -ENOMEM instead.

create_proc_profile() is a subsys_initcall and do_initcall_level()
discards the initcall return value, so the error message is what the
user will actually see.

Signed-off-by: Yongxin Yang <yangyongxin@kylinos.cn>
---
Link: https://lore.kernel.org/all/20260824024251.279751-1-yang_yongxin123@163.com/

Changes in v3:
- Do not silently ignore a proc_create() failure: report it with pr_err()
  and return -ENOMEM, as suggested by Andrew Morton.  This is no longer a
  pure cleanup, so 'No functional change.' is dropped.
- Drop the Reviewed-by from Bradley Morgan: v3 changes the behaviour, so
  the tag no longer covers the code he reviewed on v1.  Bradley is Cc'd
  again for a fresh review.

 kernel/profile.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index 13be6fc9fd00..818098cc094a 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -240,15 +240,17 @@ static const struct proc_ops profile_proc_ops = {
 int __ref create_proc_profile(void)
 {
 	struct proc_dir_entry *entry;
-	int err = 0;
 
 	if (!prof_on)
 		return 0;
 	entry = proc_create("profile", S_IWUSR | S_IRUGO,
 			    NULL, &profile_proc_ops);
-	if (entry)
-		proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
-	return err;
+	if (!entry) {
+		pr_err("profile: failed to create /proc/profile\n");
+		return -ENOMEM;
+	}
+	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
+	return 0;
 }
 subsys_initcall(create_proc_profile);
 #endif /* CONFIG_PROC_FS */
-- 
2.25.1


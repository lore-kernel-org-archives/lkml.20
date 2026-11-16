Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819376;
	b=KsgwHBS7NAPZ+iEbyw1lJ4BgwzRyHbN98xlSpPSL4gvz8l9cadg/1kK1y/Ze7GnSrZVJ
	 0CX+M8kRUzcKZ3K5LSmESNfOgnnB44LeQNiLi3bFPobbw/aFoCtQgrjhFL+Ew3xYL/NpM
	 vt6eRgOykchUmAJxb0c7Vu/SHg3M5ujqWgy4eulswNC7yx/Qya11sRDAFvr3X7ivot5tX
	 9p41EEPAzUS/n+h/7tkzRTsbdjgkPXtYO2IRkpJZ3bFGZwSM2+uJpvliBW445kprer+Sz
	 H1ANVNjFW4Zytp5PjA+cEnzKloh/5G3Uh6JYfqsk9ZgLqRMiCoLXa4pczzfSH4GUxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
	b=bnTV5iVSMDFr0A5YhLLuhHDHA0xuRCtM9XbsmNC/kDPq0JRjj9J4llPhof/EAgb/nHBB
	 Ucup5spX/qxk7DrCXgKKv1J9yZcTWEpJiRZmdiVcNvfQruSspZfwOFoJcw9/7dOI8/z42
	 aCXT5z6fDejuu28419SUsLlsfvBWVSr1A8eHBoxwfX/jA1t7nA4J8XrUGvnhMjmO5E9Ud
	 sfmudp2exCX322ZD/EG3GsEX2HZ7goM76AKvbnhv/M/RQ6E4yXUvJbnVvvaFm6vrAoo4P
	 ulT9ImGdEPwo4LfQlJnEsp9RMje5wXoZ+osIRKkZwT+FAkTHwXYq2gsD8HJDJHg7Ptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjqR3QBo;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF07606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF07606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjqR3QBo
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so1315577f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819374; x=1795424174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
        b=sjqR3QBo6dcQcSs+FIlADbeG//0UI0FrLNL4nEiGdYxFwTSM00vfVExbta/9a/lU49
         3QkunhhLmlSqQLfuYtHrAYclwNPM9wG00D+Rgcpa4tm9/X0EcNRIqqFwONh5HgZF3eXl
         ImdZF9Bu6EaH8eTjLLkUpozXh2UOpuLLAErMGBaEzAgMLpRE63YUnP7cNiunxoye/nf3
         gwscc3ZBB8yNO9/iqgIpFp4uuMG15kRKKVeR0SLryYy3h7vEBZd5LnWz+uOLOka2GYVS
         wDxb4OVTall9S1tmJGaURwMKS8k1phhYp7l3ZLMVwwS5odSidaIvZN4p05Q3V7t9pZnn
         Hrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819374; x=1795424174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7jLssS4b6/Hj/S1vChj9ooMCseYQvI7tiM2Tbkwxew=;
        b=jhcUBtX2ilfQ6mZk1RpUT5Jcv2zIlo/x1vrFEZnhzVKf96LBzxCnHpf6OViLb8G19P
         PvncLAcgcD8FvymKCqVRuKdtNpCaRmabSPhsohTjS9pZwfeQlog/VXueK1yZVpg98cnq
         UmDi46s1SxTiNgKK0HG7akycwTR2VoDoyBzc+nfqbXFOeu4HRzHdNUpcOTUwBHqfWxeN
         7TtSqrtjlV5MCpUcyuGehy+w3QrdEJ+uXD0ih65V6+PjLRco+o51hX18ytl7rP5MvYiF
         xpP3AHV0fUi2NRoB9wXnqTGTj36GmswsLQ+nUay7uxn0PqslxdOyfZWGS9gw2corznaO
         GQCw==
X-Forwarded-Encrypted: i=1; AL+hErG2Uh5URnXI2Lw2//nq/aeP1HWTeZLp6i6ROzknKpB/smgTwxG7VKdw3By/kZrDCsSdQD1MDhkIQCapzjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IEfkuB5saYfNITf0hEfmeUa9WAvUhk3RCH3Bf2/aQxrpGZIkL
	09TbpiDoxvDhZPznDcpetBZd0oRMlDeGCmV3esSajVAZCjAoZhhSCP6b
X-Gm-Gg: AZFdTZd1egv632yPSQ4bfW8CClqjxxApwk8aUtRuTd/RIxigf1pRXrXBbxhk4EWt8Kc
	PpqHvcOQZFYINpYc7u6BuCirexhDiGMYdT8c9S6m/VsJFbu3iRzM7Xkbl2b0umbmCoHXCJg+u1g
	YjIA6OObFEnuhzIGOWPeTvmsT/gjX+Y0bjT74YP0QTYf5q2P1EYVEazp3KngkvlMWoFBDY8gvyS
	DP4bR9bLClrcjH2ai3HixuxjalXKygW54IjmWGL++b3lbFyP8lUlX71zNX95G4JWxDpLMjLvpir
	AKld/AAvWvErZWs1RVE/HXsFzyc1Y9QOemBVDTYZQC3wLaUVlVxPBT21NC7hBKNEG7WPKpBSrpN
	b622NWDdi8CWAbK/RHqGUsgZk0VMVBbSnSvnk6BpJprrMDb944AYt8sWPn9TzENJuRnzfYbA/Yo
	BzR7pyS4F8+5FHcTEdzkRuDXBZtCbPLae0vWA5ewE/2uAT2KJXlqS4C2ryHzBtdID2uvBndpNo3
	5FjFot/VwNVYxOOcIGTndGc/yu4kYG69nM/29Ft9prfwZQZs0FaBPXDquumuhgckxVsrD2ybjSb
	vAy7jaG3wUbKWbs85Oayy9bSVKqlBGVbyqY=
X-Received: by 2002:a05:6000:220a:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-49c71d49137mr17428762f8f.29.1794819374287;
        Mon, 16 Nov 2026 00:56:14 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:1c3:e2b2:8068:e97d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm22439034f8f.45.2026.11.16.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:56:13 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Chris Down <chris@chrisdown.name>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] printk: Fix skipped entries after index iterator restart
Date: Mon, 16 Nov 2026 10:56:10 +0200
Message-ID: <20261116085609.476250-2-thnkslprpt@gmail.com>
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

seq_read_iter() can advance the iterator before the next record
fits in the read buffer. When iteration resumes, pi_start() calls
pi_next() at the saved position and advances past the pending printk
index entry. As a result, index reads can silently omit formats.

Return the entry corresponding to the saved position without
advancing the iterator.

Fixes: 337015573718 ("printk: Userspace format indexing support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/printk/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/index.c b/kernel/printk/index.c
index a6b27526baaf6..642640a36abe1 100644
--- a/kernel/printk/index.c
+++ b/kernel/printk/index.c
@@ -59,7 +59,7 @@ static void *pi_start(struct seq_file *s, loff_t *pos)
 	if (*pos == 0)
 		return SEQ_START_TOKEN;
 
-	return pi_next(s, NULL, pos);
+	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);
 }
 
 /*

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0


Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66063911DD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340163; cv=none; b=HFJaI+62c1sXsW9S/DXGz33yI7moo+tISvCPfTveMh8q9vpSZJaduRPFUzgq9f7IDxY6Ax724+2yVMfhz5Sh0dVybbE/yiX/3fA+tkKCQWDrv2BkDV2FZxKYKuJF17z68Xjb8BjElBLBs5XNrncu7RO8ky+Y/9KgCCv8k4W1OX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340163; c=relaxed/simple;
	bh=0zSEScgElYG6Ej4031sP2IGXmyXTS1mtqMFTeVvqiKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHLdGkiYujxSJlaACKN/HjIs6Y6HNADcN0/4/x8ne5hYyl3pck7eiNJZQpa+8r/b0IS1rLSjlp0P/otng8NaEjEsrohTeobwDqaHNB6tSpxruqOHzmMrayP7qN6TvfiMyuH1b6wV+yBYA0C0RCz0dRHcrx85zMhs92AfE33Clp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCXfrzNp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCXfrzNp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so17214025e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340160; x=1792944960; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5d/4GsmGwc1lptab2ajjZP2dxsrwSvwHN90lvfF0164=;
        b=qCXfrzNpvo+qSRcHvmiUGMZm5eZEuMvS+JLC3M4R8qGozKFOhy5gASAI63RsBmlOk/
         iGuG+Z5gzOdbBNBG2SXYWIdxwmq132cRZOQ++VaBx/DFvtbWv8qgFYZ4GUDNOcWlEfNt
         E4PQwWqkRfN8PoIvslprATuD7VnqbtMcz950tgz9yXSrNpFx6zubClDd+pOvL6yuvrCy
         2gmut9Wn0wXycreiRKRP3GNEtlSXLyxy6ysQ92YfCVBBPFWltDioBQJzEeElV5cq8MF7
         gAKMCFxneoWTnHEhiHKgqLU5Z5HZVtLg545Slur1zoz8N0zvi+uF0Nae7uoIf6XoD+kv
         Pg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340160; x=1792944960;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5d/4GsmGwc1lptab2ajjZP2dxsrwSvwHN90lvfF0164=;
        b=cqNVh8Mkh4DFyu4usBzKGu4fsfAP+zOnNPzkaLr4esBaIxrqIAGNmespHyx4UzMeLQ
         7ZzIClqSMwnYob87rbbo4dyISgMy1ALC9L3azkloIzw6dLoyNynP73HFv3ph4zNEtjfD
         XGEcjxNIlvqsBL7Nq7zQ5R1jdeE0trlhRGUYGKut6vRfXhs72T9+5II92/XrHjd8p3PM
         BjhKCiKDlujTleaxIwVoyOWNbNZb6tEPHpWPVuC6aqfg0Fqk2r9/73YPyeEb8ommvdAi
         ZitOvPipDtBYM0sZf31A0I7tUEcAk2y/wfp/kuaQNmuz/rIwFnSZSgdQIKyRc2fKofEv
         jTBw==
X-Gm-Message-State: AFq9FYIgiXi4UXWW1VEFneJkBJz2ge4mH8sp2V7yry8FRLGy84xDQ/XI
	cnLD8Uas8S7GxGsWXA46HLm1USHguq5zv2RS2xCSyj2JEmG2JWOxSqpG
X-Gm-Gg: AYBFou2G243T7b+ci1eNYbjWxFSFYkIGczE1Ux/3IYZI3SXcUg+U+A2Y3ae8lSSK4e8
	F5D8IDV91gPO1t2xfZljPRLpj71H9lmmrWJ3okq+j+89QYb4HsaZzYd0yXQfgGjZKp1+4iv5NHz
	sSng6d3uA79GNF18BDDTeh4wRjDF03+7+00ch/VkK7wrS3qJ1i31pZE81xMmRSQjDMdOs/pP2Zb
	vG7dyytJmgYZsyI2QUgLBoQ5IpVktzIZB7tx7xWQBjZUAfgM5unbK4MeZzGKf/P+Tipsiq3OC4I
	Ad4wJ5Z37o++AF2dtd9N7sGCzSCyML/g9B0J7nvFYQuTYgjAc91ygviqZpwIeYbVqE6TDXTDbpB
	EgdgY9B/q3hY/EOvwUXBcUv/HpWORcmpa0eZiMiKm7rYOj78SjW3g3gD6jc1Q00sgzrTYQaPqIa
	bapo51asg0DfEOjE17UHCfWZMeipJyE25grixYTHmHlcUUg/AytC91XvKS+BGAPb0F/g==
X-Received: by 2002:a05:600c:848d:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1e722a360mr15227195e9.30.1792340159562;
        Sun, 18 Oct 2026 09:15:59 -0700 (PDT)
Received: from ubuntu ([2c0f:f5c0:570:10ef:ebdb:1ad:9af2:42a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm140121375e9.4.2026.10.18.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:15:59 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:15:51 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] comedi: comedi_fops: fix alignment to match open
 parenthesis
Message-ID: <atTwtyiqQbRVAC1v@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the alignment issue in order to adhere to kernel coding style

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
Changes in v2:
- Remove staging from the subject line

 drivers/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..efa6dc6d40a6 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2648,7 +2648,9 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 }
 
 static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
-	void __user *dest, unsigned int src_offset, unsigned int n)
+					    void __user *dest,
+					    unsigned int src_offset,
+					    unsigned int n)
 {
 	struct comedi_buf_map *bm = s->async->buf_map;
 	struct comedi_buf_page *buf_page_list = bm->page_list;
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467886;
	b=KugkkK+EVmrfwUlI1yHnbGDihew7V/wW0t1KahceK1IUdRZ0DFnNmfrK6CgJzV10wnw2
	 xukXyy7uWwKk9o3jITqCf2DKvoLUTYGdz1a7rR4s7P0+5B6IrzYWCTpVTKGt0iTlhL73g
	 wa5UOYbYqDzgeujFA1WlYYcAToyo3x8zim7puN95/ZDCKKWvI7LaeJMLxo81RJqavHFT1
	 +jf8DN4AVjl8Kg/jTAsuc5HQR+wehkQNohGG2o6ukyDUqB4MMVSjvT7Ab2aSaqdK+4idx
	 OnkAAjZkNpvaYIy6h4FUUF2xi46UQ/YJHVdL/37sK++kKAMUdCb7p3IO35YiSmprmkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467886;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+FigdyonTRlPn+o/qs8BQIif8VY4RjjzHtPoyr4345A=;
	b=raHZ4xhd3rCECyvpBek6WSrxiv4QgzRL6XRj9bMZ5teEMyPQvYQethAXKaq+7U1FQ9RD
	 WvrpxJHPnKr4h1L61XbzZ3uoUOE28NSJLJ2avMzp2pWwH+iedXd5RbCmf7NNOG6BAUKfI
	 JksfTyrmWf6+lQFzIoKruPL2uak+WaNWl2VvNMt7ci2xgI+vMd1eeLhcOY02A1rF5LMmb
	 CVV5N0HHg4BWWvEJr9/gXO2L8XO8twvoNCG8iYFlapUi/iDM4WEpmq9ibDpNr8nQ8yp+C
	 2OF5K0+qP6runiZOR7aHM7b/Bl193tUEulVvI55DichjZ9rZ4a/OM2UzXnkN6/RJCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuBCPsgw;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16FB606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16FB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuBCPsgw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RuBCPsgw8BPuqIJ72SUD8kGYquTGKQoXHX+wi4oju1KWYer/zQmhh1HHdr+iuwdrm38Vog/yuyC6Y
	 AJTo+SisKs3VOfaBIKZ/SLzz2W7NUfgPKHA3YnGU/G068XiKqzBdu7KlTDQDGw3Thjl2rTWKayQ/ft
	 LOf9GnIMdFHDwCBw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af568173f7-e4853;
	Thu, 12 Nov 2026 15:17:43 +0800 (CST)
X-RM-TRANSID:2ee96af568173f7-e4853
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af56817c6d-f7189;
	Thu, 12 Nov 2026 15:17:43 +0800 (CST)
X-RM-TRANSID:2ee96af56817c6d-f7189
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: hubcap@omnibond.com
Cc: martin@omnibond.com,
	devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] orangefs: Preserve client debug request errors
Date: Thu, 12 Nov 2026 15:17:42 +0800
Message-ID: <20261112071742.154613-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

orangefs_debug_write() logs a failed service_operation() for a client
debug-mask request, then overwrites the error with the write count.
The caller is told that the request succeeded even though the client
operation failed.

After releasing the operation, return through the buffer cleanup path
on failure instead of updating the debugfs file contents and position.

Fixes: 274dcf55bd4a ("Orangefs: kernel client part 3")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 fs/orangefs/orangefs-debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index fec7c1e864d2..5504066c3080 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -510,6 +510,8 @@ static ssize_t orangefs_debug_write(struct file *file,
 				     rc);
 
 		op_release(new_op);
+		if (rc)
+			goto out;
 	}
 
 	mutex_lock(&orangefs_debug_lock);
-- 
2.51.0




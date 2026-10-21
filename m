Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552702;
	b=P+oa2o0Yo1BLw9Rt2QYjFH6nMBmrlT3EPf0Y0wOAM4BGiUUU5KwPagFn75FkvAfGKDDi
	 p5HSazOJqc36ERr0JW3dLmmqdoEZbC+TSE+0IXIqdWykfIIxWuNT8oipJSA45unRS0/4f
	 7lD8lA6iygfNIw4RsSCun/GwXyxWCtRcEdOoiLTETsXNhaKmKZcAAzMiZGQu3723H6mhq
	 TivhPn9E2Qd3AmSSC8zcAKzvkbUWI3nd5OdUV/Zs1/uQYgDJvmLsKE13avBPdYdJ23E2t
	 PcRMYwHToDcje0fz5hJPzO//4oXQqCZwUN9TUuc2WjVZL93+0uupvpqm1J1raRJzBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552702;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3dUKeUJaBb46mcxQmFWqIVt8obdNVy5Sq3YwSGh8/aA=;
	b=r5PNkgt7Oi1e7T/VLGAVi6Mf4MtZQc52m90fbENgdEEK1S0CcEHD5YVBBGIYMpBcyR/V
	 rrcHQs8cPADDZxKKLWAAyZjcmg5XERuurnFc/Y2zbLcIjpen4v/UGm6EhAFucM006aIpn
	 zlkcneqiyjjgOusYNuonLQZdgC21HOsAIl70kyvYUNds6SgDCpYOQq0hgxZSNj6Si1k0I
	 bDJvTJfEkEeBgQIA/Eh9g2aNwbRMLsypqOG+tpDcPC7g+GZSA+qA7G5PWL8gppiKfCsYd
	 8aVr+/3nz4nDTCBHzcB7B1zO7FHyhtug2qmt/LYgj1UTkECrWOV5fODqFwfa3rkKbJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=N05n60Io;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EBE606A336
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EBE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=N05n60Io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792552696; bh=3dUKeUJaBb46mcxQmFWqIVt8obdNVy5Sq3YwSGh8/aA=;
	h=From:To:Cc:Subject:Date;
	b=N05n60Ioo8MBbJj0RH5DIUEFQr+jYu1myP5x3tdVvkoLWISJsVx6a4OaBwqnQy1MG
	 nSNhI1n7BKUgfcW7KJd4YB8G+6L3imuMYa93D782FJ1eoXh1cnkNnH27DPumQV+3iR
	 NdxHn8iG5J2TGoVKExFdS4m9NLArAFFLaca5iPr4=
Received: from Liujunyuan.. ([218.106.117.235])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4721E4DA; Wed, 21 Oct 2026 11:17:50 +0800
X-QQ-mid: xmsmtpt1792552670th5xmavys
Message-ID: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X1TGriRphkRdqjRfBHIYS51Kq1RtSpLS515hoa0TfK15D8MQt0r
	 /yQP1NO9rf5sABfUosnDZrpe7JWr/6aagRWorAAdYgq9LEln1MV32p96AajwjX31ga8rTIEdAHnx
	 5VBPJkZmF02BRVb6jc64QOpjb1RYaNZxinomX2YNAMdxDy0eGsQ24IbpM8N0WsFsG6Hy7eQ/EpRi
	 eiuT8c564FkvjRp7neG6Qnoom7npv0FicS/ToedpLwYm9VViNTYxbLGpNDkxR6gFXes1WA+5haL4
	 fvtybIMdjPtZXy9G/O8NMYuACE5WgWqPuAm/F8hnGsS8aSoM0H/0ejN3irShQ/Y4iY69v6pOTe2A
	 xU44FEYF1UHWHEshVxdccGQQRGSlBKMvjrMVcqxpfiXWaq07OiW3RygkMqBnPUkSHiNPi7FYmu+9
	 HIc8yLWcVWo/AQq/Jen/3EtZvnYLVshn6LQcxNe9m6Zybm1pbe4hrTJPcKECPUNner+MHmxIQVZv
	 Q1uZL2i9/2MbywdaPvslyMQ6JPYmJpVvGYbVoj8K5frHXJD2bbFql+mwIJzjFkqBzI+0SzQObpno
	 Ilq/Nk5sywvL4af49FpqZ78AJ8pD5+TndbPOBFtwzkHLaf7djJSCiXvyl3n/a8yPHHvOkoQGZ9C+
	 c/IX7xya9MVggIBUxUyyFqNKuvxmiCkGtEqBe6cfBzuTAy1qy+3VTDTiNEouS+/8qLQC8h56XcNE
	 AgvvQzkesj0o+f5++UmD2vg8Wd/f6KYeLMnKd0tydBcbUJUbS8X6A/GCkRAa8fZMzdns8GYV+Yn1
	 YtdZhuvEFqpnjP3jx7zFvjqa87Mx1SicnC0lhBolxTPJJlQqDRmNR0bP2QWrs7M/POwHVow+feFs
	 vcvPTFb8WszrUX3Ce1rFWayAE+ZaUEeeUUMHnyD1/hoGRvKDeCzs85VYUIGQ3wte/SWwFTBLTal9
	 yzxzOKTnYCQn3RBI4AJtu/6/2TstXyvn0fg/Sjtf3o+Ni+apymOwOvgHGFBqgT5nZbt3xLzlZAg4
	 Wzs73xH8gW+bQ/lNeDSWim3GUaA9LYBg0d45DNDVdSTyX548tz8TK5Mn2eGzAlLP3kvtuRH+YQLC
	 wm+55shNa6xwFYWNA=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: LiuJunyuan <2058432396@qq.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	LiuJunyuan <2058432396@qq.com>
Subject: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Date: Wed, 21 Oct 2026 11:13:49 +0800
X-OQ-MSGID: <20261021031349.11825-1-2058432396@qq.com>
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

Replace sprintf() with scnprintf() when formatting the resource name.

Signed-off-by: LiuJunyuan <2058432396@qq.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 9447c00bc013..a0a7c8341995 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -745,8 +745,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 		}
 	}
 
-	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148_bridge->name,
-		image->number);
+	scnprintf(image->bus_resource.name, VMENAMSIZ + 3, "%s.%d",
+		  tsi148_bridge->name, image->number);
 
 	image->bus_resource.start = 0;
 	image->bus_resource.end = (unsigned long)size;
-- 
2.43.0



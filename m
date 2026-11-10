Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292882;
	b=jw+Q8UpwOUEo0lngk3VbyxQDluXPD0njZ3dYD1oVOVe2uTGREdquIvx/jNMtJ+bFTcWO
	 6oa4nhCAiPY/tjfxS60aJp8/c7oINzi1m2semNcU1x1AczHlCIMtfTjCIbTKArruIk6jW
	 y0PytNkLAnKS1ScXD+9ifY4V+Xj7i2RWUjMj6lIR8oqi0tvmLkxD9HHgA5miWJ6emESwJ
	 ZQK0fBljF8aIcwCv/dFbfk/7wGriaxjI5XJnXe94XxTxTmjl3OB1tZQaJOT3GRaKBuFFn
	 m1yGEjycR18r48BolEa1eUWMpI8Z6XhMnKYSKgKmRjeRHLoGrWiq3/YID6tLAshKPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292882;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmd+aIN3oARPQWgf2MNmvOkS4VVvOgqyFA4+vSWFERA=;
	b=iaJeJV9xsecI/GTmFcJGByoZuVvzoG5UU7657bjQ8gx6q4bWK7Yz+mDC4n6EBs3Gtsal
	 UYoz5G3LbawS9GeOXQy/DGFrAp8K4NSiPzPgfsTFCm0H6F8XHiykAXDBfKITNXDiIfIsh
	 TO7/VlzsUzeVJqXaOpinOvWVzZScr0gUYoy3vtGatIGCNf/fwwiVjIg/fcdhLOt3TXTqV
	 g2OMx/uujDAv9B/wSzGZEgEBTMKYn2+eJZeaFpySj9Cnkm2P9ZtSwW8kf5qyMQGmS+qIk
	 BIOn4Tp/q0TeETp0mR2DLaIGbgFzqndfU6lRw+YUR2xO9GO1g/op7FomLxSHFQocSLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BGbMHG8E;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AFC60A3828;
	Tue, 10 Nov 2026 06:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65AFC60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BGbMHG8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BGbMHG8EeU95jW0WHIahcvNkI/AucLP1INo4fKg25gRL0PiqQmbtMwQIlcttRt3jZ3fbUR8uY4g+x
	 biUcVQEQ5RBTMDjx0c1/ciW9gRpJzABWkAmqTbktCgdK5HsmYoc4f593xTSy54ES9lWNUBP8DjseOG
	 b1hMapQAbI3QecEs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2bc8e83b-983da;
	Tue, 10 Nov 2026 14:41:19 +0800 (CST)
X-RM-TRANSID:2ee66af2bc8e83b-983da
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa129;
	Tue, 10 Nov 2026 14:41:19 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa129
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/22] usb: storage: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:41:03 +0000
Message-ID: <20261110064105.20335-21-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index a9358e04ab4b..18d85ee79db8 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -470,7 +470,7 @@ struct ene_ub6250_info {
 	u32		bl_num;
 	int		SrbStatus;
 
-	/*------Power Managerment ---------------*/
+	/*------Power Management ---------------*/
 	bool		Power_IsResum;
 };
 
-- 
2.53.0




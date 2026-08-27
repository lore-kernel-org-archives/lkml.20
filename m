Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC930E85D;
	Thu, 27 Aug 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816544; cv=none; b=QDkBwwsFmLI2pPmZ4UGvq8nD+5HJXW6PmIXXSMEL9192oMuZIO43e8gzKLQ8zPFcpX4WP9hFo2jI+8DB/PG6Dhzm3ntaYzNHfzR+XxDBrUzGVSIBS5ocE2OkqoTGqNJwaQ8tCOcK61Z60h2XFeXOqjP6+lLpnBpy/rD8RoenpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816544; c=relaxed/simple;
	bh=9EUW5mKM95JR4mQEi/3t+GD3Tei+lE4L7tt1jq+h5Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qhTqTuqZmGUa7KjCKRwrDAys/RUasuW7pDazbLTMUPCS84uqR/2qNWxE6z6lzZ/n1LsBH49ATv9fJszyvB9nzelEumdXUn+9rPqBTQ+GfmajBwL+OV8sPskSLA2kJlgiE5h3EL1JlODvquSndWPqc7ha44Mk5kYdpWuV1llZ+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CvTamCQM; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CvTamCQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vf
	1+yOSeM3IpSTMp2g53zNFYIKNGy3sbJqbxsh4ZaF0=; b=CvTamCQMHdvboibzw0
	Iu+R+/vsfwrFjUOIvPiOHoyyl90urQ2J2TqmbNyhBjyyEOMjodEwyV2iONT6ig+W
	jfRV3DxBB8PRsJ4sDItH/x0fOOpHzqbtIH0g/UhoH51Fj2dQDSVR24O2IHn5UHxn
	IadWxnsVfZgiGd1tu685vbfzg=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgC3GB026o9qfX_sOQ--.55294S2;
	Thu, 27 Aug 2026 15:41:44 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org,
	david-b@pacbell.net
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] usb: host: sl811_cs: fix memory leak on probe failure
Date: Thu, 27 Aug 2026 15:41:20 +0800
Message-Id: <20260827074120.49006-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgC3GB026o9qfX_sOQ--.55294S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43uF1xWw18Xw1DWFyDZFb_yoW8JFyrpF
	s8X398JrWrKa43ursrGry3W3WSga4xtFWUCrZrKw4ayrnxAF98XFyI93W5Wr4UZrWDKr15
	trWvq3yUAFZYy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8l1kUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0hhH8mqP6jjqbwAA3N

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

sl811_cs_probe() leaks the local_info_t allocated into link->priv when
sl811_cs_config() fails: the only kfree() lives in the remove callback
sl811_cs_detach(), which the PCMCIA core never calls for a device whose
probe failed.

Free the private data when sl811_cs_config() fails.

Fixes: c6de2b64eb57 ("[PATCH] USB: add sl811_cs support")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 drivers/usb/host/sl811_cs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/sl811_cs.c b/drivers/usb/host/sl811_cs.c
index ada91ca33f65..fd0cd541bf53 100644
--- a/drivers/usb/host/sl811_cs.c
+++ b/drivers/usb/host/sl811_cs.c
@@ -177,6 +177,7 @@ failed:
 static int sl811_cs_probe(struct pcmcia_device *link)
 {
 	local_info_t *local;
+	int ret;
 
 	local = kzalloc_obj(local_info_t);
 	if (!local)
@@ -184,7 +185,11 @@ static int sl811_cs_probe(struct pcmcia_device *link)
 	local->p_dev = link;
 	link->priv = local;
 
-	return sl811_cs_config(link);
+	ret = sl811_cs_config(link);
+	if (ret)
+		kfree(local);
+
+	return ret;
 }
 
 static const struct pcmcia_device_id sl811_ids[] = {
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


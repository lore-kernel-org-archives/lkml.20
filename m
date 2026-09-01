Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CF39B4AE;
	Tue,  1 Sep 2026 02:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228307; cv=none; b=tMHTuNzppJ3OCR8+eyQmxL26IYLAObb+ijf3rNDba3s17xAv1DEpMdi5sSpxZy148eGwatYOmbGML+cG+KFiXl+7dI1XCRhtCCvuQJycgmSSQPBWhGBQRuPnXGZIjzhVgwSYSeY2AR7bMQW8k1QwqfZVPnM+1e53QZiQY9ZWXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228307; c=relaxed/simple;
	bh=GJkv0KF9EJJYzhj5G3y3cOyBlUvjSK7/fTYN1p2HQcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jgi909MTHLXmvVqfDXdW9tgfyQHMwoD8MOilqDSmKxqBdQoQfbx3f+qRjQa7WTC0frjJpmVaozzybOeaUP1z4QwsTTW9Xrk1rsIRt047An+7Hu0hU5e1YwnAu6aIGsokOTUU0K5eQbc2Vqh3C0zXqU5ZHsLg343+MmqvdLaImn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aCPVfzKE; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aCPVfzKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Rk
	I040s/UcDuypkKQtOsqL0mxZcgriN1x2lBhMZKc2E=; b=aCPVfzKEdARONP/5I+
	FGk/N6FsYzuRtlPL+r6SHKbV7luFyDhBv4/NpsveWo5eROEe1QfNbQWA4xKYfH1n
	vOIabQjTPhQrDgUlhY3vM51Egp1qGlwkFbr8z13wmEFVUikWgMwV/7BvjXFhXcHH
	wZxOuPEihT+GJZt27aN7lYxGc=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAHdNGoMpZqYzcpSw--.41204S2;
	Tue, 01 Sep 2026 10:04:25 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: nikolayof23@gmail.com,
	david-b@pacbell.net,
	gregkh@linuxfoundation.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH v2] usb: host: sl811_cs: fix memory leak on probe failure
Date: Tue,  1 Sep 2026 10:03:52 +0800
Message-Id: <20260901020352.20252-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apWWnyGbVFJ8SbiG@archlinux>
References: <apWWnyGbVFJ8SbiG@archlinux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHdNGoMpZqYzcpSw--.41204S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43uF1xWw18WF4kuF47XFb_yoW8XFWxpF
	s8W398ArZ5Ka43uFZrGFyxuw1Sgan7JayUGrZrK3y2vrnxAr98XF92v3WYgr4DZrWDKF15
	tryktrWUAF9ay37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joKZJUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8wn2omqWMqlkNQAA3Y

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

sl811_cs_probe() leaks the local_info_t allocated into link->priv when
sl811_cs_config() fails: the only kfree() lives in the remove callback
sl811_cs_detach(), which the PCMCIA core never calls for a device whose
probe failed.

Free the private data when sl811_cs_config() fails.

Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config() functions")
Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
Changes in v2:
- Fix the Fixes tag to 15b99ac17295, the commit that made
  sl811_cs_config() failures observable as probe failures.
- Add Reviewed-by from Nikolay Kulikov.

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


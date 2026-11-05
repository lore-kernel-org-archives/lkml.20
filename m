Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919822;
	b=LU+dDcjwR8bsuDq3GpyOWF/qIXsnNT4Jdfl+5/scQlBNPHP58x4TUk2IvnCpJ1q7gJ3a
	 /7bAyeZRdJiAg3evi90xqEHIeg112Wts3znjolFAoWoxnmW3qhXu0vRzRfKC4McpJLVJF
	 RqQcJfG65GmPTQ2xoKhI8cCR9nPWansBCYHoGJYj1Gn2jroVgJ31uTUY7iV1qV8eWbpJV
	 BuP1dKGEcSiBofcJa/1MSH3HCEZNDvPt2CKSnchi13mxKoVN6mrphmpAJX6d0ZdM01wjB
	 PkIjjOMcvSDqFMBcX5xL4/qTbsMT8ZhlE3VTYJIzPfDU5FOdzmRxfBeg7RZj0vHUDWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
	b=jRFL9RP36+b4lBads9+yQ+w7HYg2GtFRfnaiWzOtdBOmwGOAZ80a634cTigy+OJtYZpc
	 bHZ2QTzwXSxUhA6k7bk8cSfTl5VvPVggNVXiLsK7Qc6jWSzu27QJ/4r59/KYb5Gdw9YFU
	 7510Dw+Qp3pCx59GGts49daeoSxbJhhDB/FwciyyB8NdwP6Ar0UCzNe13KH7LrgA71RyE
	 ey2Co4p6SWpaPDOvLmfHCPEdDBMUS6ZfIX1dPZvY/rgduMGne73wM+IKO31Voe3lrZQwT
	 3gy3NgYT/ZAmBZvUxaYiJXGDl5urXrslCja/gKVBPAQPHAw7izc7pvpxoiFmNBmkK7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOmKAXpR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB14606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB14606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOmKAXpR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so371855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919820; x=1794524620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
        b=iOmKAXpRoy4hy3zfxLqqdj6L/M3sswXn1cm9vpwWLVSGjH0qGMjdSzwSyDKR5bwuFU
         9a8TQ9gNaSWviVDx1GdOBd3S3XHPp+NLrrnTCTmLtGpq7n0HcSo//SbwA4/qMLmrRni2
         euwxHxHoACliUB2VYhHm8Xu3w70YcLBn0WgfL+r8JN/CsUuFyIlV2Wfd0woXmtMu4ZKI
         qkZRb4Lp5ipjs4iWDdmqxOPtdlyOsZrtzeWlPsZNA1jyTX3A324qPHTVGihY9DEdpaiW
         fxW6se2m4ft/wXJzqrummD6Wkje5qCNcVZaYfKOLPB19CgrifLXZGd3z7oLve8s73PO6
         q+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919820; x=1794524620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
        b=haG0Zc5HSGPt5/ZZ4bydQ5ef/vaCOIv2a1NtGTG9iz+n6w6eH3/1ot2HGMhv6wMFzO
         54IIjtfG6bX7oHzAfzYutPW3v0DDW8thkkLcqaqa/+4QvQ0TvimaClSgZw4o3TFEQwNr
         gKW8KdF6yyBK5rwq5kAc2AATMFvH9mzqZU62DZGjpU3sJ+WMiUAR0B8ceZW8sDWxVXwC
         F4+nrFrT59iXL2ETgJ9OJZHF3hGsJXvBhKCk29hTZQr+JiMjzaLguwOp15wHM+8tBmhs
         bikP7+lV3ALxk0IYxgwNs+Ycjeufr9mA+sQm31RJwmlRXyJbw+KMaAeXkBkuu6AK81O9
         wyFg==
X-Forwarded-Encrypted: i=1; AKwUvByjr6cOUoX67D3g1ROo0MXqaQvqKPjt/cAxnChpXMqaCjucwsBt4f4/eK/r1zK1TNQlAYF9W1fzJSVX+J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ulM3EImg/4qQ5ULlP7/DNY/kANtTiF7ZqhQU+SVWSPKi53J7E
	eyho5FNn7f3Yn38Zz926KqLbOymTqfpfEmrW1RaQC9tfsQi2g4dCKpZw
X-Gm-Gg: AYBFou0RDq3Om6xKN5QNAX5TDI8N5lv6QikA0sC+IpuntHyNoWv9O21wlv3FYK+QuN6
	TjkTT4Aw0TXeK0sYgviMF0hQ9L/p8DPoS3hDaVYTDjquuGaVcee207f6it1SSVfs/xoxLwATq7G
	Yn7ZzttdOA9knQ+niHozoTCZ/Xg2yV1WbcuSe2ZgwjaDFK7O5VZX5Iug3AsC7bnrR0FDoIg67ci
	xceZA7kQ8CPMdFmI/TTRPkNprC+Y3a17Gv+mFW6vunUyk3kQPDQrahEhAHJq92jn2MfCP7ULPzP
	OC9dljgJaLPHcY1gu/Q2Q5NzdQVstJaog3XV3eLxVWr+G9AlafPORO6yii+LbNcrXWVXWIB6Pvp
	BcGa+JN4SVB28h6wR6JYWLr2UeCU4SwJwtzXbkiBvmmP5b8N5j33/Pu6y/51xTMLiruicX5SkC3
	kVu021n9NrL/cwcUi9K/9kZ0UAZUK020KC8WF1AAsn9UoRRYBBBwt/I+ZxX4hisKtcLVGySftaa
	ApQ++tI6lVxiXhLY/TMJvtmzhlUKZhQQR19d+obmMqgu2aXOR3w9NCv/0Y7oLHphkTqIX1+5cFG
	2HQd0i2gp+8COBhj4V4WNDALM8MYuoUKf2Aczhk9yIlN74ftidFlWyV+M1jRSDauy3agGGfN24i
	9bNrXj3S9BkqwF4o=
X-Received: by 2002:a05:600c:34d0:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4b6ddee3291mr8491095e9.10.1793919819682;
        Thu, 05 Nov 2026 15:03:39 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:39 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: i2c: ov9734: Defer probe until the fwnode graph endpoint exists
Date: Thu,  5 Nov 2026 23:03:25 +0000
Message-ID: <20261105230327.10852-3-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

On ACPI platforms with an Intel IPU the endpoint is created by the
ipu-bridge code when the CIO2 driver probes, which can happen after the
sensor driver probes. ov9734_check_hwcfg() then fails with -ENXIO and
the sensor is never bound.

Return -EPROBE_DEFER through dev_err_probe() when the endpoint is
missing, as other sensor drivers used on these platforms do. Return the
error from probe() as it is, so the deferral reason is kept and a
deferred probe does not log an error.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/i2c/ov9734.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad..5f3e277b9 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -837,9 +837,14 @@ static int ov9734_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -ENXIO;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
@@ -893,11 +898,8 @@ static int ov9734_probe(struct i2c_client *client)
 	int ret;
 
 	ret = ov9734_check_hwcfg(&client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	ov9734 = devm_kzalloc(&client->dev, sizeof(*ov9734), GFP_KERNEL);
 	if (!ov9734)
-- 
2.53.0


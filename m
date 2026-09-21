Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F64534A8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980692; cv=none; b=LNyoRZjitGEQ0zQ/3jaLfpG2eGZ+UZjXSWQo3sp9xWSxf5Vyi7ml2rSvMeoXJvxlJh/FHQ9RL6TNjrI/WA2wMfdf4b5BKlkn61JDQikV1lOd8w8Bc+N4wGOj+bPl5b8bEhs25hEm0bnl62+3ZI5jziH1jhIFoG0swU33XXlzT+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980692; c=relaxed/simple;
	bh=orjsntkymHdV3HHrZ7aB0glGaCIs99TYSc2OtuWjMDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eyStlDuk6ceIVj5x56GJhhFgp2og6ibRi5bXtbNtYWUCLYLwvav+F/2llfQT9IfJZjTAg3PgTxLDBgENOHTeLkwWXXRzOiUgMSCVqh5nPPgGt8SxZduvYa/0lvwDYWLj+S+BV+jpGJFMOf67sc+rimjZ3hg+vYIHCaIVXx9+Q2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQGKrGSV; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQGKrGSV"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso2201947a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980689; x=1790585489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=FQGKrGSVM7VsPwrsPYfK17HQgBx6ihQ/rB+Sm09lelgilJ4WmHJRaWj3FjgYYje+w8
         41dq70CW/q+ymkgQLdYEyuA9WJyk8JZvypqp951/nozjk+nqWgnYRLoLkC01hhF4b7At
         cSeJdfYBcJ5GSvs2w/U0vW1P+FVruyyChbuBNVW0rXKz/O5pW6sBE1wIu7eX514A6pFr
         eF31RSNFjFIGgg6Bh3977W3OVuo68uxHt5kLpw8hZn2TD+ptZLot2t8VNJPH2JcdE/rh
         YD8yQ2m/1pthi7LriUryv5lsQngP5ouRfqAJWRClNBBY578vixrCIvfh8riwDzOnzIds
         iGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980689; x=1790585489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=oa2uvhAPYv11PmMoJKFV/C9b1uLK93kyeNTGTvyPH6gJLnGafuEj7eAMPscTSwMfUe
         dwUI2/iox3wuhuRYhqGTYyo/Pzx3wSP3ho+P2ZZqcCRgp2wtFkGb8Z7UaYhPI//5/u/O
         XSYoOdiy7dcnQOnaSP95BrjHSYfhBEryKKZ2MuNSBGIC8gTQ9gGH0TmbJfH1h2MOGBjD
         JDlw1hTrT0JhNxcxPQZplsXkLS+yZ8PH2uvWeHRxj6oaFnFfaH7Nv8E5XadwsFA775jC
         z1GVSk2Rck7mSX76a/0ZuhGba707GDWiN+gUiyI1TaACc/7okCNjcVQReWIvWFML685D
         6RtA==
X-Forwarded-Encrypted: i=1; AKwUvBwAxW5C2KZev9y5j2mMv18Q/KzeFbmQcJjJoxQuXv+DSrkbDz5FhKG5sJ0x9jpHt/D3/YwyPEC2NpR/4LY=@vger.kernel.org
X-Gm-Message-State: AFuF++kj4dkV2yz2N4Ae9kX1ymkRqaTqfmf5HiNWxiA3ZIV3N9i0e8rv
	epxvfbrp47MhJl+HLFYXQUF3OKFECChXniAcBi78vjMoc0cgdZY0VDTC
X-Gm-Gg: AYBFou1p914guhdgr3M+qN0JV6hiPWFb+5+NVIQFsoisctUv+p7UAoBBsi2V1cFSadb
	8ovRMLpCpGmfTOG1KoteiCC21tSbRuCP6KlRvB5zp97xnavOqE5yImYIEZQ8Iiht3vviwKksBzn
	rUx0MOSi8PuWDqt91C3WynaU5KY+z+yGtZnwsVdnqzMcxjgODt/33wA0jtj42D/4+k/U6EEHrTF
	oKhbDaR9SmdKW9aHLkpJ78Z+KBQiYvYCuXJeWkemnDfN7LptjkN85I3SREtds90TzegYbA1SFWQ
	HErx6z6msEH7BpoUZouA8mc+rpL/r24yCIpO0HzZU9w6TOTNrdpLhFRDOaX4y8nga/+xPCLcjVf
	dNcXjbaR0TZHHvTdFoqSP53ikGD+RADIOOiMgAL9qCtUK2iHIZs107b5gWAT+TMMslopF26KwR5
	6r1ZhpTR3eZyKmuFxxLAxiqtUtGoK1p4iO5kcR2ljK80somX+wMCZm7Q==
X-Received: by 2002:a17:90b:1b0c:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e54bbc32fmr15958386a91.9.1789980689350;
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm7853716a91.1.2026.09.21.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yonglong Wu <yonglong.wu@mediatek.com>,
	Min Guo <min.guo@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: fix child device leak
Date: Mon, 21 Sep 2026 16:51:19 +0800
Message-ID: <20260921085119.308981-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_musb_probe() populates child platform devices using
of_platform_populate(), but neither the probe error paths nor the
driver remove path depopulate them.

If any initialization step after of_platform_populate() fails, the
probe returns without unregistering the populated child devices.
Likewise, the children remain registered when the driver is later
unbound.

Use devm_of_platform_populate() so the populated child devices are
automatically depopulated when probe fails or the driver is unbound.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index c6cbe718b1da..3aff0add2faf 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -415,7 +415,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				"failed to create child devices at %p\n", np);
-- 
2.43.0


Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C144F549
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724745; cv=none; b=rMUluuctxfTLEQyWivbYxqpaSgjrCtsVaQJEH9kbvCgu8DHLv417+K1FnCS+UZ5T2us2UPd2f6lNP2xQBtfgz/gscuCh5w3aFk1nzb8ap5uQBBXVAP4OfKYemtVo81kwbdty1ertKNpeKjupjihrDayijmdwgxpqQHKcsW171tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724745; c=relaxed/simple;
	bh=jF1efb+ZrlgHhorgaaDDjAX1MA7rXrB1bO2VMnF5pJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=stWX7dg2gZC6S/2f/eYMOElzlsaLRJpzfc6xtN7+M8vzoWmhnGguNxelg9Thy7WZ3D3NqWHOrGBHjle44OF9YXTTawsox3Tmtk4cMLkA7MP6j6pyMTrjJLIQCWPX9Vp9wemZ2N8321mY1T90gfQTUXg1FvrCe6HxPx0KmJ12+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8wCzL/T; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8wCzL/T"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3a8c118e711so830772a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791724741; x=1792329541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEBEPrTg9k6NVyRZZeBkgKa7OkmMhAqWYWxj4Tiunk0=;
        b=T8wCzL/T/tbkeOKxz7MVuK00OlLlcpn/GAg5WA/ncXYfhyqtCHN/T0cdeQ9ZyaoPxO
         PVa24skpArrZwnUky+0T05s/zuBtPnzcRu6yVo3WdB2eEieI2Qgh3VzF2SzsHfldCP5Z
         Ofy9H0ViDSVWER5hXXO9Hwjxu9SFUMWpCStjYv3qAb0IkUE75oSZ+lnipbwHOGT605EJ
         zLryBm9/LV12MQuWBkSp+XlhuLJzsL4Q+bnI63qIRxuv3Nx1kMJkjZHM1FxOVnVy2wag
         cheNUccZ0psqmq8etTBpyMOLNKuQP40EWCZk9OwTuqkcQK8CzUKa7cOXQBHthqS1ASL2
         faxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724741; x=1792329541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEBEPrTg9k6NVyRZZeBkgKa7OkmMhAqWYWxj4Tiunk0=;
        b=UuXFlY/c3uTRoL47AaZ6MskVEc5c90r8wThMY1uJ5Nhc2vA1YLydPwL7QvCq2BX8t4
         ILwR8QOa7mmT817I16AoUEAwketHhn4X+qT+VD5HKwla/zX3NDRZjst1FC9QaYjYIA7w
         tjHULo5ivrbKK61Mtryhklleli2C0ECMfDpvdfrbbi/6D5KmEdZRgto5JT2f2y+3Ty6L
         46BUl+AHOwS93Swtydjn4V6Q4VvP8PKsHh9WSn9QnxA92eJDBK4OKQDcBxM3Hat1coYL
         KoFSitZae/u3yQWjErmWo7BW9VJ7wgAHrnUtgXpTj74q1Oeek7Lgut+2gjC79Q1qZnly
         MJDw==
X-Gm-Message-State: AFq9FYKHk+rmGkSAb7tgDO8eWJy6NTlCID48RpEbHuEbml2HY/jilYBL
	P94bi+7pgdnIwYYnqaLeC9ZWy86kirPY+qY0p41j4ao1nHZnFy2lS4qQF9K7qHYSQ0ypb2rv
X-Gm-Gg: AYBFou37x/CHz2LVp2zKPYbotQXuDI7kG0S0j3mg2qvv909EJ3uYV/ZodG6xnNieQHZ
	ql07U77IUyfjCpsT1BYNxq+rfi9vNiUHn9Tsxd98uIkncpRgDIuNHQLwJSO0VHBj21aX7nTMwhl
	jbI+UJYBOvYLLogY20Ob9ABJhfa0/st3AECruD0hVpSRq8QuzEJ3TZ8YwpRRiBPgsXC+/HU8ah8
	KJjrbtg9xOX/85uU9vx3bypxqRbcYOoFxNSDGlRM2bV6oW8hxw37oPrMo84UdFh3yZQsnFytR+7
	L6sL834Af9Y/iKiR8sXSD/vDlq247XBV0q0jucPQnXSRnAZE2sDvCkRGNDGGwRrpyfKNbZgmeZr
	1TXUN5CUL9jtWqxmyoII6oRsD361RuWWguCvSDwsufks/qzkigIR1jqtPeC2STSbiUDxvPF5c8y
	LQsnP/8oSjBCM3DMiSX02UTo06IlzbjHIeVuc3Rk8q4myBfysnPq7SImXJDFMbYC1w5575YkjCX
	B0Uz73sJR4iuCmIBkw92Fht9DqhZStKbmKDC1zBNTtNdWsfmk8dnUKYbs4A
X-Received: by 2002:a17:90b:5845:b0:3ab:c80:936c with SMTP id 98e67ed59e1d1-3ab3a98f7ebmr5720767a91.33.1791724741527;
        Sun, 11 Oct 2026 06:19:01 -0700 (PDT)
Received: from localhost (ec2-13-231-150-91.ap-northeast-1.compute.amazonaws.com. [13.231.150.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab338676besm7158093a91.1.2026.10.11.06.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:19:01 -0700 (PDT)
From: jianyungao89@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Jianyun Gao <jianyungao89@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev (open list:DEVICE DIRECT ACCESS (DAX)),
	linux-cxl@vger.kernel.org (open list:DEVICE DIRECT ACCESS (DAX))
Subject: [PATCH] dax: fix mapping_store() returning 0 instead of error code
Date: Sun, 11 Oct 2026 21:18:57 +0800
Message-Id: <20261011131857.30481-1-jianyungao89@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianyun Gao <jianyungao89@gmail.com>

When the region driver is not loaded, mapping_store() returns rc
which is 0 at that point, instead of an error code. Set it to
-ENXIO to match the equivalent check in size_store().

Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
---
 drivers/dax/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index b809e1a264af..262f97b5e7aa 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1192,7 +1192,7 @@ static ssize_t mapping_store(struct device *dev, struct device_attribute *attr,
 		return rc;
 	if (!dax_region->dev->driver) {
 		up_write(&dax_region_rwsem);
-		return rc;
+		return -ENXIO;
 	}
 	rc = down_write_killable(&dax_dev_rwsem);
 	if (rc) {
-- 
2.34.1


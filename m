Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87C4CDA2E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359105; cv=none; b=UGsH0hMWWo5aXPlGE0/Jf2hwKJxfGl9dAI8gab9GCn0jJ1gQDJAvMbmGI28BxSJQImCLK/QjOLofC9a/EEaycfgUUg6oboPAUgWBYvZkpPgh3ZY99IImCWEMOmfTaGitp5H3kLNiiuCCkX9zKiDMZiOr9bVZTtD5Ah35Y74kYYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359105; c=relaxed/simple;
	bh=iOZHQT4IOAIyVGF4UgMZZiMxiLFANObxfB3HkuQmwoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soh9bwZjIHx6jWEqC8IIZ4kbOsJSqoncjUHOat68oEN6+pLJwR+JqQoOkT9ajduZbWqLo6NsM62Ddsgb27skftt57gpnCuDW2LWSY9kgqnU9SUYZeUq5aX4DXUvYpcy13fOK7W1h16Z3tie4NK7G+2zx1JHwqL1PEDuU9O5TjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZWgfEoT; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZWgfEoT"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso678439c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359100; x=1790963900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJ/NQTl1WNpwK1sUwU0K8HlG1PwVQbHpKjHbUF6bYOc=;
        b=QZWgfEoT09Bisc5Fojz1pSZtBoSM4htRvJTQG8kGERI2MyI6EYlL6g0f7PunI+C4Fg
         MvyGgKYHzFegfvBCZxqXLoD12trHzahGYgylpfbHoiWeqwj78G8Uh2ZuISlkIuPUZzvD
         OUcH3X1feRGhGEwZQZ10uU+c2TBfGG77zPN/WS9iR7hCiRsvVkyrXbLB/tkgUSlSzXyS
         faVyYXZpgsVlK5bADQsOb3ezq6fs76Z6XhKiAGVNpSFY3xmNJw44kgXqDtp9scHQFN5p
         cPFTyyNQ120AJrbFf1Rv9aTqXwoUjW822i6kWcHVXzn3wQ3/P3xwqOzb5DGMKxhGv7H7
         E6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359100; x=1790963900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJ/NQTl1WNpwK1sUwU0K8HlG1PwVQbHpKjHbUF6bYOc=;
        b=01ekIBJmS3s3bVcaefmnXTqjby3mgzuYYhnVexOCe+8u0rd6rane1V5xRBAr9zftn0
         zRnHJlo/lyHgLRO2FYpMg5XJEgWINWU0s69pEN9TkXrABTa2EaR46Cjpbh7emzCjXnIX
         uXADvmHbnXPB8mMqNwhgEMIaEBwroPWQXOmXJ201p5sfsnhQ13f0J4PoJxf8BL+5U2Fp
         eD2AE8Od7tKIFukPEcy6X7DUSAGLNbxPfi7LPj0JAkGZRqR/5a/HbMJiLUlGVlk0GBPD
         gqcbQehLhORTBqD2aHI1VottSH56kboOCuKDk7miVkEydfKiBu2fVJvFcqsh9UAfgMmD
         FTUw==
X-Forwarded-Encrypted: i=1; AKwUvBx5qHU+wwuAfHhR4A0o2AScEjVqqqrk96zKHYGL97Xcaj4QOtOytFSQwL7jKuAjgVlexICGtABmlqZ9/Qg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYol0Q80lKCe6e+0960MTRBU+HjJRL0GS8dHfVPl1nGJgsxAtY
	zWbDPiGoSW9i2Y8LvbRl7xFPibSLGhpAOXDn9fYjEHEpb3aq4UZ77nYV
X-Gm-Gg: AYBFou2FgJ+UfnzHokiqVJgFK8FEzP0cGOMfmPai3B/dn0H44VCSyNxPoUAjvIpuVMC
	GxqkWoX1NXZhiO/m5XrlBhWC2v7nnppBkzFMgcKefxBVS5KPQI9VS0HTOCQLtyjxYuazqEGRk4f
	IpzSHhKSogeMHDciPPkildfEISfXSqJiJRSrFfy2tKHnD5cX4T3RzhsF8h3rqZiX7t1hF6+9y0+
	HgAc40u2uohtg3JTzVLcgTAF0O6oh0tNL7LPe54nyFPHIs+IgS/zNmea1DGd0w5KzXsMziX98Sq
	fowr+4bBtbrAOxj33qxxsSaQgg84QILrN3155sJykCJR92nxW+b71tMHNuTlC2PAW2L+xJZhK78
	UwTzBGkbSN9vjbtZ0J9aGMKsnaJ5fza7l4sNOj4czAg25C/h+x4DJL8ZNII26rZgS3JgQrEpwid
	xW3zbvjY1UAGtLeVXRMcyXWzYuLnOSruahxx4WD/PManGqihQu+nGtr7YmEwT2O7g3ftSM0o0p9
	Q==
X-Received: by 2002:a05:7022:2525:b0:144:f096:4dda with SMTP id a92af1059eb24-146d096d302mr1238633c88.43.1790359098946;
        Fri, 25 Sep 2026 10:58:18 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm7005744eec.23.2026.09.25.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:18 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: david@ixit.cz
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] nfc: nxp-nci: fix IRQ use-after-free in i2c remove
Date: Fri, 25 Sep 2026 14:58:00 -0300
Message-ID: <20260925175800.3694044-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nxp_nci_i2c_remove() calls nxp_nci_remove() before free_irq().
nxp_nci_remove() unregisters the NCI device and frees ndev via
nci_free_device().  The IRQ handler nxp_nci_i2c_irq_thread_fn()
dereferences phy->ndev and calls nci_get_drvdata() on it; if the
interrupt fires between the nxp_nci_remove() and free_irq() calls the
handler operates on freed memory.

Swap the order: disable the interrupt first with free_irq(), then tear
down the device.

Fixes: 6be88670fc59 ("NFC: nxp-nci_i2c: Add I2C support to NXP NCI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/nfc/nxp-nci/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
index XXXXXXX..YYYYYYY 100644
--- a/drivers/nfc/nxp-nci/i2c.c
+++ b/drivers/nfc/nxp-nci/i2c.c
@@ -346,8 +346,8 @@ static void nxp_nci_i2c_remove(struct i2c_client *client)
 {
 	struct nxp_nci_i2c_phy *phy = i2c_get_clientdata(client);

-	nxp_nci_remove(phy->ndev);
 	free_irq(client->irq, phy);
+	nxp_nci_remove(phy->ndev);
 }

 static const struct i2c_device_id nxp_nci_i2c_id_table[] = {

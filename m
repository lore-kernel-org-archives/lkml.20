Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4225B09E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814893; cv=none; b=pHE+E8HzE9/dw9MInbkZ5WFmqE83J6PZ7/4ndHvHQ4L5R89jnmxRY8JB0x3lEkYqfJVU+BlF8vjqQM8i479e1zQza6RSsGsvjCNf0yKzBG0hsnGnpURrQa/b8osjNwNR1giGxCw8HsDO1DvqXFpF6331K6aWsxLTsDQjRvx3JRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814893; c=relaxed/simple;
	bh=Cl5YG/mDjfpWhT2HWmxYZoFwquZLjjwBvTfgZj0lUIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBD4WpTzIOfJhVIDIcT+86LkoC5fVDP4qxb8AJ9uD1TC495DoXoXm8Gl3GEZEam+oJ308H8YwHCx/IiSznSv3KCQQ3YtbQUUu3ndb0zeyk0FwtfFKJICjG4n4uSuTcT10A1kMtoe3jTSDpSlYF6X+n+tFGH2TPKD16xpjZGTR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAJ839kq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAJ839kq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85590c5aeabso84261b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787814891; x=1788419691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNt1zgs6qAkEI9XNYbk2SKsA/z50MMsFTX1oHBMliIM=;
        b=gAJ839kqdTlF60SrYl2P2EgyKFLTJV5ZdcqqfibYGCVTN0jPLBNzxBFxhmNiVepiLr
         jPKHQnClDLU368tx0zWCRrYHsX4GQG2n9J405GWc6Jz6de9UHh9YF7Y1nq+TkYekUCqa
         i4i+ObWD89WXhwB4/MYeJWcN+rGFbQgg91lNOGXRE0Bs/e+YYrkjEMPni4WbwWlNEBGu
         H1XOdutNj4EUB/U9CNfNsTVfjT00rWibgpPwvUOVkKk/bz2CmutIlCmWxCTCF/R12d/q
         gt+z3x8VnDfhL2XbcGxkH5GGRqZekPl8pYrVZOa0G8vlyXCF01RRawkGi2uNJsJCMerK
         RfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814891; x=1788419691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNt1zgs6qAkEI9XNYbk2SKsA/z50MMsFTX1oHBMliIM=;
        b=lkE1Ch7CFMDh7xY7bNCavfmZdRXgVWVZ/owNSHygZFh0tP+u+7AFMRQHShgf0F4e7l
         p/CmAaULmhR9sygLKuEWUii3L9EyDLTbeOhnX+HNoOyVakTUMNVn7nUuYc2Ivc6u9ZDg
         0jcOm/0DviBaO/NipRm6i2DMS04vk72VFpWOy6sNHkIzRbKknjdhQHS6+G+XPXdNkxA2
         JZuUeGlVBAgJi3MiiXq76AX5zXrHLe77FzNUHZ9v7ex8ZBKcndEQ3jbYG/HAWpRq4yjq
         go0yhj/f0x+z2w/S7c80NPIcry/MUNAMSvHBQ/3z7l0uCvrf8Hr23LRVYugRC7wmgbLz
         21sA==
X-Forwarded-Encrypted: i=1; AHgh+RpkEhoT9uj+HD5GmNItUh/h4ICF7SVs2fII76Ih3/ivl6xfDVizR6cVEaMj81Yz1z3GLeYDPDw6dkXFqUc=@vger.kernel.org
X-Gm-Message-State: AFuF++n7i+fmRbngQ7JeHUZD0UCzY8opfmdO8pp6vs2PKTQn3fEU06hR
	vDDH7YmgrFW7g9pGXzpIUOOk36H3JRwZtFk+8QSEUNMCpzGjeii7HzZC
X-Gm-Gg: AR+sD10dQ+pREAeBy630B50ik3bz9vSsZBJk0ZjsuX1jbL6ydy/FjRXG9Gx1iZ3jH3H
	xEvtWMYPjQmejWCvDUXX5oi9uYPZmSjP/Z85RE5sa1gMPr/CXgGeH42hkDx2zS7n53734N9AIU1
	Wn0NdgsJBCVpAr0G+X4cE5LkTJTyxVecAudJGps3Mki8IDIbdNUVi4uOjMHuoezm2vh4H1TvMUh
	zN9/QBDWv/sTknS+lWLdDLpsTNrgPf32jcegvyUWihwaqyVxZvSB3Lb2gFELp1SEQ+gSS9vYPl0
	j7tBJ1mSeFUo0nefRj2hUtEhz3/a1+hVSgD5YMVYAtCWP4BYMSwog3aNkNPi1jSqmhC7F3V/gWx
	GA12csOFavmzA5OKnMTXlXDVjPmUiAg1ZyCpp2hsF4pvP2Vb/Mjs7T9tXlbTT22GdWWiq5orpqR
	nqmSmLV8M24IJJLOJy0Nsn5UYMDiimE3zIsCMk/JzOm2PkuOIaTyeDJkDvaiiLlzim/hId3Ih1M
	OlcLNI=
X-Received: by 2002:a05:6a21:6190:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3cf83c17574mr27206586637.11.1787814891560;
        Thu, 27 Aug 2026 00:14:51 -0700 (PDT)
Received: from kernel ([45.251.35.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm25999575eec.31.2026.08.27.00.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:14:51 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com
Cc: noaos@mellanox.com,
	gwshan@linux.vnet.ibm.com,
	ogerlitz@mellanox.com,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] PCI: quirks: Fix out-of-bounds MMIO read in mellanox_check_broken_intx_masking()
Date: Thu, 27 Aug 2026 12:44:38 +0530
Message-ID: <20260827071439.4480-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mellanox_check_broken_intx_masking() function maps 4 bytes of MMIO
memory using ioremap(), but then reads two 32 bit values using
ioread32be(fw_ver) ad ioread32be(fw_ver + 1).

Because fw_ver is a pointer to a 32 bit type, fw_ver + 1 advances the
address by 4 bytes. Reading 4 bytes at offset 4 goes past the mapped 4
byte boundary. This out-of-bounds read can cause a page fault or kernel
panic on architectures that enforce strict MMIO boundaries.

Fix this by increasing the mapping size to 8 bytes to safely cover both
32 bits.

Fixes: 1600f62534b7 ("PCI: Support INTx masking on ConnectX-4 with firmware x.14.1100+")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 drivers/pci/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index de9bbccda21f..b30ca4244f14 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3714,7 +3714,7 @@ static void mellanox_check_broken_intx_masking(struct pci_dev *pdev)
 		return;
 	}
 
-	fw_ver = ioremap(pci_resource_start(pdev, 0), 4);
+	fw_ver = ioremap(pci_resource_start(pdev, 0), 8);
 	if (!fw_ver) {
 		pci_warn(pdev, "Can't map ConnectX-4 initialization segment\n");
 		goto out;
-- 
2.53.0


Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E42F6586
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434015; cv=none; b=LQ0eLHA3VmbMby3nr5btIEDQWYV6xs9YLmf+lWPGr0LDBGhhTcumSmmLHS/kLqaFaSmHbW1E/goBpyeksqjK16wqZ0LkZ7f1h6tm6kx3W0X2Cezwet6nTeta8XX89aFVT9zcn4ASqNpZeynuyG9K5JmiLRq+NN/fGFFQzWLSdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434015; c=relaxed/simple;
	bh=qlgJnVNJnJoSBLr05eULVqVezSxg7LvXVVWvg2QlTUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VFBr8EV9DqV3twJtpKWctUAoCl/wnK33AfxbdbhRbI8ZcmaqETE/wSkhWxVHyUR7irIDI5T+0Czm/KnMh/UkOqyVX9NEdOTQRLRHFnlVzDPsvkm9SkgrGUv0Zha3MvbDkQxb/X76up8U36A0vb+tVYpz6kBFc1YoprZSUmR4bVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0OyTCS7; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0OyTCS7"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5306d609317so38062781cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434012; x=1790038812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4EOq0mriYCuSqS30PzcXKU3cp8OOqJ/M9Nu6QAqqPk=;
        b=L0OyTCS7NDk1kj6yUnmJoymenHLm47W+6l9wPgA1VXh92MWePIsC1LHrc9Da/Eg/F2
         i4puLk2be1yZ/gx1MdFNpt0MZc9ZGpr1BdVDktbe6IdNoHJ4YmqGgFGhPcIdXHSpoHhY
         0yWMnYMMLda4CPruRjYmPQrXSQGaFh1HDf/UyTRGBd662q0AewsCoNrPs7YaGuz4Gw1e
         qEayWL+Stx7KAr4MhpbF4c4+1xhNAgW/8IKQuhf9nmeJv/7AHK9hkQ/fWRH7Y3WFMiY6
         JLafj98smCFmwQTe2buA18mH4t7UXVlfYnU82cmUSjK/tZ+U7bY9ZuxJmieFF9/mbHMh
         dRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434012; x=1790038812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4EOq0mriYCuSqS30PzcXKU3cp8OOqJ/M9Nu6QAqqPk=;
        b=Sm/s1M4UPhZnNMx431xpnLRugtk7L0uDdzqhWnXpTCS5RjZuFT4qiP/Qf/mJ30A+KC
         7GUMGQKKvwX6ej6FOmUKuZbx6EgGoWaUULfSwfffPiYr8rGhkaP13QxoNZdiUL4+NLlu
         9PfVwdscRdemxCYq4kAKT/rXPnWiCYa/knnPjiKxIIqKADARAJDIyNRY9iyS2LmjCeOZ
         c5Om8uyfsbhs4JJVgugws3agVn9sRrygy7FkWXcuf6a6y8rqsMNY4IhQ35Sr03IPFbGg
         eIamIWLd5WR1xZLgfxKL9PCKpE8MXAeG/pMnV3CI6MYVc6bh2Rc5vR+SiAvBqEFThUp/
         1d8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbTi58Sck57FgqmG1iXJebAQHrGUwItxOIMC9sGyXPpBBf3zfsFcBCrmnCw3niOLfkartCAoewPMnd0go=@vger.kernel.org
X-Gm-Message-State: AFuF++m3GACp3O7xZjl28OGU7cRjQ1BRNK6J0Bhkg6gfg9H1YHd4AbiI
	dMfuoX+GIepBK5soCL+yH86coQlEoPA6vANYs5fYmxKiCNEpe1T8bPo=
X-Gm-Gg: AYBFou39kp0mK5VBHmxD4+IizOFeAQ8ylK1ACMuZww7sknFtq8KtuZv64EgO3WROJ/x
	UQaN0e7oRM5EorwLqYsEyXqTtKGF3jDfuaY+pmI6VL2n+Wtz9iIKmyoLp20llxcplnvDoc0KZiS
	oXSXBmTu5OqEaZ49AehoTO9P2THrPQFl5k3eoxsKrN0itM7YQtrtb9VJ7c7WfUyjqYPsWI7VjbO
	uxKDahoXYKbA8dn/03mGDJZ+qluuPIP2iFSk8QcYqBfGkAqyjrjOSKSCy2zVGm5sHiMEFCzcuGF
	QMHaVckon/BB0L/1hZFriEtOYQGGb+B6ZfVrQsHUbXMTgSdTkCYd+CouECnuC59iMMTIMnzgx38
	zkpjUDeRHQVz/K4LxGzDTaZ8VSXMA9wWHgsjed8izL2K466edpHtnpaTcD4lXvX7CbIZsZe1ebR
	vOjQ34ImzLV0pmSHWJsiwDFnJWBmEir+sC1Z0//E1GKNr5zeDjAl6hbBEv7Bt4uXqalU204wxEN
	WnHw+6xbAlTMahYhH6r/iQnX8/XR63Q6fBjijG3J+w0zNP45qKT6OqNUvEde6lQJCja7tcVdoL3
	rNoZE8xOoG7HvkYpRzygNwLSFWRRayCIEKg+v0KBIk04YsUrHOXL+h5mEYOjhMnxqFAo1m1+D7r
	zOzIx
X-Received: by 2002:ac8:7c49:0:b0:51c:6b6:9d0b with SMTP id d75a77b69052e-5310cf168bfmr75785851cf.2.1789434007725;
        Mon, 14 Sep 2026 18:00:07 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53112de74a4sm22931071cf.14.2026.09.14.18.00.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:00:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] serial: icom: Disable the PCI device on final adapter release
Date: Mon, 14 Sep 2026 20:59:59 -0400
Message-ID: <20260915010000.52974-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

icom_probe() enables the PCI device, but the final adapter release
never disables it. Balance the enable after releasing the IRQ, mapping
and PCI regions, while the adapter's PCI device pointer is still valid.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/tty/serial/icom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/icom.c b/drivers/tty/serial/icom.c
--- a/drivers/tty/serial/icom.c
+++ b/drivers/tty/serial/icom.c
@@ -1691,6 +1691,7 @@ static void icom_kref_release(struct kref *kref)
 	free_irq(icom_adapter->pci_dev->irq, (void *) icom_adapter);
 	iounmap(icom_adapter->base_addr);
 	pci_release_regions(icom_adapter->pci_dev);
+	pci_disable_device(icom_adapter->pci_dev);
 	icom_free_adapter(icom_adapter);
 }
 

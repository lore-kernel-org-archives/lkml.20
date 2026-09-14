Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF73EC822
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426395; cv=none; b=Q/d2HvtZpWhHFDvDG2eOoCEZeCYJPZGGOY3iBryt2CCi8d7M+Jb3mP3dQkTCAdNK4+aeE3yU3kSssAYGaAAXuned9ViE2AVUcmbmgZZ0RmLUDZt9tdZvvB2mZMf5s/mDndTwv88FWkq92vDJlQwhsgkMXRQUu3CYQ9IwmXxp+Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426395; c=relaxed/simple;
	bh=v9W246k4i5nC9ZdyWZi1OCDWQVULW5oh4JWWhuxaeuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9D7wYiled6QWJ6+w/2I/b8BtuAZEJ6BCn08vgvH5HGuiU1b0C/R1P0N6mviFDWuRyzsAAkQ1TixH8YPwvZNELvISuXRyDutQhaQGo+iAxBEE2NEaWhTS9OPyDWFqW1boOoLeVWouiTXDSmpFeMQMPsjxYX9DpcfvAwB6R3mKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dohM/q/L; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dohM/q/L"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1665294a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426393; x=1790031193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BN8kNGGOstdu3D+3MzZhZpT0mSPpKY6fG+DlEioFUuE=;
        b=dohM/q/LJrug23wvrlKE9g6q5ylcIts8vsVeDy+4lQjcALywDDRVvFZxop2mzLr6vK
         o6nCS15ea0aMk+8b1ONVpHUFGtT9ef2Pzwr/0te32027H27PXL8j3PERSyY3LJvGgGvJ
         evAzZWdrGBk/Bp2y5zCeS5RO7T0shNFkoH8/0Rwo+W3rMsfXdSknhKIOulHxp7M4p8sG
         xh8hdt58+HON/OTWKwtvsRCwEZ+6M34bDA/XWqUlAyteHMTDTQ0XZ9i1T0Eu+s4cP7t4
         d0/8/a3K8q83fr0qhRpscYfT7XNaQQYY1GwI7Dzxd7Vo54c3mCvD62E4FGitCAU24jfd
         aVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426393; x=1790031193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BN8kNGGOstdu3D+3MzZhZpT0mSPpKY6fG+DlEioFUuE=;
        b=lmqeuqj1dYQ/fJkCAvRULvXUWlNXU7QzVcWsbwAlNzWSLJkRd6fViVB1XPGIXvij0F
         2Ddy+UuAeRRgppSjQoK2QwJ9/ldG5oko3Y+X5lY5nOy4lMWvFOcuYvIGt+KUPSSCyTjU
         hNy9eq/92aCLThliqKeJGNlhasj+I6bBQpm9vf6FIsMd//KMXQMZvvnoSdNuJq6iP7wZ
         xNXGL0WZjZmDp8ePTd1gBBki8NNoF7FUn19rjyGkB4ikUlOrSlJYYX/gGpCNoVAntxMw
         Cr6y0OlIgYZqDJXUuxyqKMmUDCWMOmzJ7XpFAgB+Xp+fHG99CwLx7LNrOB9PLRGR5q+H
         NPpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRF5AIKTRYvM+FirugvS9OKXLfisp0lRqAYA6g34dcbp16jlOPwLHaSXfkfIDBM8TioGai3qL8OhkPuCg=@vger.kernel.org
X-Gm-Message-State: AFuF++lthn0v7m//5J8uDZ8N8Rm6Pt7pZxma+Ygm88uRzKNH1dsM7hnZ
	nP2znh0U4/xak0dx2NyS+VvZiM4SP9NykVddQrFPH8a1Q0/BFRnIGrdW
X-Gm-Gg: AYBFou1Rww+6Ftd2Uups6Euy+SW0zQ5WGJS3oBfNSIsG6tgQRRN2/Z66HxeFZEl5vvS
	7mOj9sKmKi8sdKYKJIG0rzHdLNb68QmOhZwjGaQhKrWSgRzWjxUrtvHd0ZxTUDK6dqtBZkiPah3
	oMxVGJ/Lx9rD+Wkit6Dxq99FpfGvQCL7tnYvNmxT5+aq6EyjlepqLYL6noH8THSfV64ivxeNm8H
	7V8gMhWYBuJOSLHf6KjmNUOKlcVCgkqhR2YO2xYs9gJENducau0AWy/8E3bdWHLvEPglBcai3eA
	QmEsYmWGD4rUjQqHOrBXMWBDSYxeRVbmvnnu/VExAla/lN2sloQmJxjKqYnbGoHcKkbMHCimPQf
	aCUPevuxy9KQePrh3DEBRVxh69WP1+1F0dtQGgMmaRWH013InQCG+IJUYCwhwUzKglVznr34EEC
	FVgW3fzhZDHGwlD4dhQ0B8xMULYavihSEN4SUBY0qtkuHZrRuEreMK4JtBzmL4m5xXupRFqGin0
	2l2t5QQoZmQFFwhPPebETL0i+s3B5WX6t7z0vnjV7BO+zdoRuCo
X-Received: by 2002:a17:90a:1056:b0:39d:ec9a:8f8e with SMTP id 98e67ed59e1d1-39dec9a90b5mr6114824a91.8.1789426393321;
        Mon, 14 Sep 2026 15:53:13 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm14924296eec.27.2026.09.14.15.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 15:53:12 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH 05/10] HID: hid-lenovo-go-s: Add kobject_uevent notify during reset-resume
Date: Mon, 14 Sep 2026 15:52:58 -0700
Message-ID: <20260914225303.868569-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914225303.868569-1-derekjohn.clark@gmail.com>
References: <20260914225303.868569-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds kobject_uevent notification after setting os_mode attribute on resume.

Fixes: 3524900cc571bd922a ("HID: hid-lenovo-go-s: restore OS_TYPE after resume from s2idle")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index b6850cf2c029..712823e22bea 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1467,6 +1467,7 @@ static int hid_gos_cfg_reset_resume(struct hid_device *hdev)
 	if (drvdata.os_mode != os_mode)
 		return -ENODEV;
 
+	kobject_uevent(&drvdata.hdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
 
-- 
2.55.0


Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93D46EF64
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462983; cv=none; b=cE1mT3SWmkFF9VHhcme9SsTBpqe8ZrIQm4c426232OEdM5qhSmK3dSvDohnwpxoAOPufQpEDVmVkLRe44QQHxESdB6eDyVEC1hknGos3Qzv4UhvmjSTVv8hywZs0mhMPD6DkHzxHIs17JVlpBQqIKddr+TKXPRCmRfCcIlkeuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462983; c=relaxed/simple;
	bh=I1E5aCaEBVe8ChMV1fF1cL0PZhqlKxPCI5YYxzTLLHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF0GhuMOkF9Tx34tV4ssDN+OJ/q+HJihFi1nC2YndWMRtY6P1iy+9bYhz8NooyqqmZdgwTCGwTJQwmdrLZ1r0Ql31xzQLrYjbfMNJp3usOjlvpU60JS6IYaRSXUf5hAptm4xzq1pYBxI4/PEBGEpgORPTByPBM5608bQ9D8aW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxs0A2e6; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxs0A2e6"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso6992266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=cxs0A2e6v1ibZcAaQAnCXppZFBX3CV9HA3x50ukFhPhdPtVVjeF7gWgnlBkORvB1pG
         Rj7dGj19s8jvW2jGAeg/0CG0kwqXbtO95nvg3bOxoC4FwZ3+3xnfZlgMcnq0XH9tdv9X
         OldPSR2SUQIW7Hi/AzLb4qkrARZ9867HdusBLTa/3WuuutzumHgA4mQepD0kJsSAIwS0
         Nxi7C1j9qhcKK3ChMeNKRZw00Ww5GknXFmrdFg0GyYJeXfsLMZwpbsFWfVKPbSJo3OgZ
         dc6C7FljpV1Q7TF12I+LHWrerLWMqqTt8nsmbnF3b6rlmGU4kxKavopuxUimNcgDCF8N
         yfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=qEHfwSwWd9S/pTetO2pcCMODiTfI/vKe3KBDl4LBVyjn7NSuiRROSTgulOiTjsVxo4
         l/5Qj9iMWfxut38ypa/zqWLlZaGZvjbTgyAsjm+l+fVFUbjkoIUbKxPxW3zGffe/Jja+
         RhOce85QIEpEM73ji+JPpLzhLyDLl63z/Ib+deZeHrP5qRoOM6PhboQh9QB73PXeChpx
         nyO7SlDSdYPXMBTVN1qRMdAceFJ6MwCyUSdluoamRSVkIS+Fg9pjyGq637DioZm5qKLh
         ZuyFbAcGvCmY4yNJIsirEh5xSzaIqOoL3SgX0ocdzUkgVZLG25LA7jEb0X6dQ7HgLsxB
         YMOg==
X-Forwarded-Encrypted: i=1; AKwUvBwLvSl2SJ8nNlPBZf9JcUJZmtJePOjFlfvou4w+yec3gi+MTSLkMAg+WYZ1vv+NmVvBa/mHCKd+xwdo3m0=@vger.kernel.org
X-Gm-Message-State: AFuF++kWMP0v9Qzhibtxjlx/8lUIQdnVM1vt/rp4EwO7cUHXzx96Ozkj
	zgeYjOdGocqvbz/1+FNeFfitYpBValrB52dneZIdCStwr7gGu9Oe4CqC
X-Gm-Gg: AYBFou3nl0AXj7a5UqW//RdElBO2g4mkLKrvWq7+XMizpnyYknJMyUEFbSsWIUhWEyQ
	XoTnowtZOMScy94lHaUeQXKUgV2c59Hqerr0OodImrs70erBTWapzgUMZpsEkqDUYt5UG9l8z3X
	7iDl5Dfi5kQvzm70EzpD6tY/k4f8iapvDrByxoLVi2qH+5oPAfQAr3xkZdKaSOGZ1VFcEjFacif
	G3TO27VKhJ9l+ChuFqZ9zeM/561HG7dl7aFJ6Nb2mgz7cPlq+C/EbwJuhUCykfBnxnujqKV0ew0
	JyHOdZg1KuQgh4wF78aaFnBIzi236H47Q8lNPzlaiWtNo/CIyp+nsE1gRvZ28xkmD27mCYRD4aD
	NZMUoNycXgUk5FqZbupAZHGetvmNjFQcixGbnZReiKocAG/Y9p3m7D4G6v0IQvVQz8Ba1UeSaGw
	wKxEU+ImKYSplU9gSiQyFkFb/IJxtXE2f7gC0N1PjflK0eiHF2LLTO+IfAXyiGjbv5+kza3vtc7
	K6cY68UJH3cvRISPAioqL7k1Z2H8zQQneOQovz1p91pZxeImSb2pwWoiTQlMMv5toYzBRBO3BdS
	Y8wk9pZZyIByRTpWBZaMHI6YkRtojizNJEqUtYW2AhHetQHwpt/MxSQPwek/m9AIsQTbtNZn0aH
	rjXuWstc+tRrl8u0y9OsSyWensYaXcww+ycgIWM4ie7mT9tIuLYgvMoKy8LeotBalu3oLZIK0Gx
	Oc7tpDuzQC5VUfFr0YvOPJwXknO8NCrbgW2A/sTA9NB9+KG6digBHMac5rQmBSNtEBqjGj4w7pL
	zm7YwUk+LA=
X-Received: by 2002:a17:907:9407:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c29d771747dmr18032566b.4.1789462978527;
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 5/6] usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:22 +0000
Message-ID: <20260915090223.1346-6-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comm_init_err label in mtu3_probe() and mtu3_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Fixes: fa6f59e28c61 ("usb: mtu3: support runtime PM for host mode")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index b4f4c776adb9..ce64c36a98f7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -445,6 +445,7 @@ static int mtu3_probe(struct platform_device *pdev)
 comm_init_err:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	ssusb_debugfs_remove_root(ssusb);
 
 	return ret;
@@ -483,6 +484,7 @@ static void mtu3_remove(struct platform_device *pdev)
 	ssusb_rscs_exit(ssusb);
 	ssusb_debugfs_remove_root(ssusb);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.47.3


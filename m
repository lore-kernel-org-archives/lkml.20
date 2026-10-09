Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7D4E8DEA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560112; cv=none; b=q/EGZn8hcJzCxDRQlPhYykHkkgMUBegw/92XVoeoZYAFR+X0Uffhnwj1VAB3K7FKUByBYv8ERBq4D2i2cw89H4x+ET29TrAeH0mJv3GeaN6Ei1LxCsKSMBuGpwgnLQjjPV0F5fVJxs5k6XyTqqlzIt+wg07yoasoA4IPp0Mc2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560112; c=relaxed/simple;
	bh=6mFCwhjj4lLgVxFOGYyVz0Ywa2oAv29KTcc8q/GGdqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0GZh/j0Ut3QHmaYmQehUHQpubt/HAG19wcn3yosD/Dymw8/Pn9G4+837FLhSebliJtTcnthZJh1Y1P/sh2VMXofIecDhs1NBon/iYppZk/b2BvUkSujTrNMcrTK+5ouvfPeThkVLs91BK2lPsalIqPgD8wAGkAp9c5NprW88MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8qKoNgV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8qKoNgV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso59674015e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560105; x=1792164905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4HQvrELlaRt1QYL+yhHv5Fz7QH7G1n2sAWj2/3Cyao=;
        b=Q8qKoNgVPo9WA2scNwacU/H5u3w6QkKYDkspZo+L6v2sIpgdO7/t8UJNjF5UlE6FS1
         qC8DiVMtP/GH8cotFKunWJE8v2ljmTZPrhx6snQCVdLvKtAhxn7yBkkCQIfJGhAQ9fGh
         KoEDgT1iurll33u1W+poTsxpuhrE3YelYrJAjS89fPQW+h83E9UoxOnlBnP5/zLo5GOQ
         F4NI3tRrrcOBX+SIMmrSb5QUBDU/O3UUpGYFmFPtDbu8xBC3m1HO4iTdvqdnRDzy4SVr
         Xe+AXZfwNstyXdcPbDPcBpnAeri0e0AauuGfPqE+s0Q5k2WRgZ8JRL0AAW8kmWnsM4v6
         eijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560105; x=1792164905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4HQvrELlaRt1QYL+yhHv5Fz7QH7G1n2sAWj2/3Cyao=;
        b=S1PZr8OucLolXNuOnuAl2+cLi5jSAapadVc8OynV+ztfZhgpo3bRdgrkDFHc601TP7
         Segn4aZhT1VVwnTXy0oiUuihGVTXcCk84O6C7XabfoiRQk4zK1mjozWQp1D+Yjt1Dz/Z
         zTGReAlHKQuuSg5w94oDWGFZ3JWzzAN/trvRlrro1TteErRad5hLs4aIdlNXubuXURP2
         US8bN1cp/GU/yuL9crEjxzDSlOIIakCqykjFB7vKBuUWFNQ7o9TCqga38ajUr0rp6+4T
         7w7g4IS3JHhwk5cWqZOeYIsm9nQlDrVBwD3Q+yHgkuA39S7J2uDvXkFrwJrym9XHdSZ4
         pkrg==
X-Forwarded-Encrypted: i=1; AKwUvBysgoNgAd0DYvlil3Oz+YiOcIm/Ob+vjp5wN81A0xo7KTfVmIIatquDw4u93KzYMfYQXcQr8hUrc63YiNA=@vger.kernel.org
X-Gm-Message-State: AFuF++kUFgLiPWA2hBDiyWWzaHBcBFCdMPUFjofge0KqYviYadTjLB/N
	9EhpyozAgYoqCtaGfgGuASJUxKWacAOjW8gC8Vrn8wRtyKJC8WurMDO/
X-Gm-Gg: AYBFou3cd7K8L5/Rdzsojyv7RvO9xR6NdYfzotLKspJ9YARvOiUJ2pPOhzHEtehlLVi
	5TPO87KP0jCPDw1U0We8YoBiOb3itbSC4dC1/KPpkmao3V1zi0/+e4LRZ1dMwB5G2jqCgKDF15z
	YETqEwSi0PUMMe+5B5HEtqSn90T6FvHPqUzNu6kotYu480DTulqcUkuTD12CNAU/1hyy8csl4aA
	S5ajutap9b6FEMkuuJymPuBhKXDzJVlAGb+TbqjP/V7jfuft/n/ml8vMn5r0lDZQgMzqxMcOCCM
	mwlK6vVzWGBgACiLSEpVYPQuNtAfcyjQXXf+vddLQgdul8vHlX9DUrQbMgoL1MIMuoCq1+yWhTG
	RnEtsdhYE5iaIrCdcIJhKkJTTKi49JjIooexiA78Ob1J77O21lVndyESQ7EASMRsWc8oi9D3y69
	Y9s84zHUwiYArjVdjFz5RSOOQBPFH2UKyRTWhd53HSiK8qZBZ10CeEQk5utl4e7ILmFIge2kuzC
	onhQ723MvIPoEa0q1WD7zX5ptx0+XjLVLZy5msOchQKYt8LJU7Ae+G6DJ93EjDKaZT5
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18e4d12e7mr41345105e9.31.1791560104710;
        Fri, 09 Oct 2026 08:35:04 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b800asm4244831f8f.22.2026.10.09.08.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:04 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 3/7] HID: asus: Force hid-input to bind to the Zenbook Duo hotkey interface
Date: Fri,  9 Oct 2026 17:34:30 +0200
Message-ID: <20261009153459.124752-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

The Zenbook Duo USB keyboard reports its hotkeys on a dedicated
interface, separate from the keyboard and consumer control ones, that
only contains ASUS vendor usage collections. hid-input does not
consider those an input application and never binds to the interface,
so the hotkeys are never mapped.

Pass HID_CONNECT_HIDINPUT_FORCE for the interface of Zenbook Duo
keyboards that carries the ASUS vendor collection, which skips that
check, so the vendor usages go through asus_input_mapping() like on
any other ASUS keyboard. The other interfaces either have a proper
input application or nothing worth an input device.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: use HID_CONNECT_HIDINPUT_FORCE on the vendor interface instead
 of injecting a fake keyboard collection into its report descriptor]
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 242e273e4cb3..d69431615c27 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1405,6 +1405,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct asus_drvdata *drvdata;
 	struct hid_report *rep;
 	bool is_vendor = false;
+	unsigned int connect_mask;
 	int ret;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
@@ -1500,7 +1501,18 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	/*
+	 * The Zenbook Duo keyboard reports its hotkeys on a dedicated USB
+	 * interface that only has vendor usage collections, which hid-input
+	 * does not consider an input application. Make it bind to the
+	 * interface carrying the ASUS vendor collection anyway so the
+	 * hotkeys get mapped.
+	 */
+	connect_mask = HID_CONNECT_DEFAULT;
+	if ((drvdata->quirks & QUIRK_ZENBOOK_DUO_KEYBOARD) && is_vendor)
+		connect_mask |= HID_CONNECT_HIDINPUT_FORCE;
+
+	ret = hid_hw_start(hdev, connect_mask);
 	if (ret) {
 		asus_worker_stop(drvdata->worker);
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
-- 
2.43.0


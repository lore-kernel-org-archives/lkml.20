Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8FB357D0E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997303; cv=none; b=W1D6zVnKOzh0PhSXbBW2lE/uAw/XzJzRDjuI9IUPudwZxw7OJvpZHgbjiYG1RY5bFJN8gTdCL3G+WBqTDA7QIhDL8fRMBsX4aLxV8ujD90V6t5QyJllCifRwGCTFOC0sfm1NVWOYF3Icj40X5sTHU4Ej440nhLoQY+nzPle5h94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997303; c=relaxed/simple;
	bh=tGg7OnyL8/9JmC2shM+2pm7rQpu1dy5h3ZLrB4k//cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2VPOgw62FTAjq5Ecs4R2KPu4KEQ8YNWzvIGeKobHC6SJaHBpMDJ4mLY5z/PhBGZc6YIargtxjuwPuI1E5D/jB2Zm7sO8wBXhYwuK+8BDZSediRtG9MDyLQSTuy1FVpj6+Nc4e2YKe/CQ2xv82cBOCRqWw8hGnwtRX/Q6YkaCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTB0P2os; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTB0P2os"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-849f2f32facso100517b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787997301; x=1788602101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+XYc/uhp00twA6hJyfMPfZH8ZjPnbMc9r1vC8WbHMM=;
        b=kTB0P2osEwYH7u+U9W9rnjkE1jsj5xpqGXD7R6EJLXyvjV/gtzAYRTjZ+irtalDgeD
         gM2X+o+6/cLbTPaHr9Ybfleyqge4eTX8tqwAQv7PEMbwAf6zb1dZ+PHk+TEVuFKR9uT6
         AL5YvsdNoqHH+kHXanuZEqeKCoC5FQEOI+gtD1e7UVIzXBW/kLWYamBHVq/F4CTGNLjZ
         qlYXKh+4lpvXUeCPYQpe0NR8nZdiGyl3tOeivAJkXz5gBZVI7RKxX3kNeT618UXtLaWC
         C4eARuRrFyMuhGkqMzcp3U5Ylzt/BQj54CX4bVsmkvbrGa32LAdzVBHLsH4CJrNzVmbu
         VOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997301; x=1788602101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+XYc/uhp00twA6hJyfMPfZH8ZjPnbMc9r1vC8WbHMM=;
        b=Xv8a7UQDoOC6rqq5KNY5uNSvq3xAf1YKc3I0y3GFWoZGo9xqyxHhJxWdV/Tp3KRN9P
         t3se5vU1EsEfIk5Zs7DFCoxZRSLkEPZ4M4xSLHk7Bozo+J9+KWqHT0m3Aq3B2zyb87jm
         pyBPOgzk4UDHLQNbBKmOleMVTN6PzUVwq/tnsH8u7HcyZf/TSi6DP7X6BCXojsi/Rtut
         LsAea/khff4y+sihQDOeWcUCqLPgZ5LRg4U+HMSbsMGg2LybswSUOPnxRUEglXmqgevu
         kzpasdK6r/EY67xkBr56lOfcFI3Pg58axO3fOOxhdkNInefgEx+eDTveLxyvjytmJoz0
         5+tg==
X-Forwarded-Encrypted: i=1; AKwUvBwh23T3gawVOKDXw24ZncJhJHgacDejT9E828g9L9fSvl0kPa388eMOCQTZyxF+VhTqKxbh+p/I8a4XJqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+eX3gJ4tQpHyQQ5a33FI8dDyTQXw/sj5ByW6j0ND/P8ncI+yP
	IsXKKbgxvMgOJa9bOAHkLuXyR+sSYzIdMPvB4jckFq+YBIjk8uDAt/eA
X-Gm-Gg: AYBFou2gtLDL+yUDMzUNRz/ixgm7YBsbjAVYJFO3SjOvQwPMEB8lGeYNaBzfiYgIX/I
	xIPRRpRxY+TvWibIoz/eQKUuOso73OLm1de16jYA+m9zHRqABE3SCSNtyPH1dGy7XCh0DAgw+2z
	Kd0gLq5NKlMF4q7dNW/4zsqcoCn/UpOESOx88ux+W6SFHil2IbK20U+bsVG7KySknHOb8VVja2c
	eN2mUGT6JvpJxwA8emn4yUF4+SKGRbsB4dmakqz3fiNIRw3khf+ImUqekCOXvxC9O6SF3PK2m2k
	omEZtfpJd41Lt1Q6eWh4RwR4uWWLdJeDC7beAWw8/5SzzrKMADwYoikgCqnQWcGX3aefvQelALM
	0R0TmW5YRtHq26a3BwSW2i9QJxsx8oiuhd5kzQQFJgVA5Sq3/iWfjIUVXHorP7tZgn5dlgkv/hz
	7pYLMUtCn+/NO6QLEQx0hQzVUjT1rM/rD9xcP6XS4MAAjIfXAPNiSr5dn8nLTLeuv05V6B7YmNl
	EK1Y4lAqpbb8Smenne7D3hmYauL7ysmlnY=
X-Received: by 2002:a17:903:228a:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d74df53523mr116538065ad.3.1787997301027;
        Sat, 29 Aug 2026 02:55:01 -0700 (PDT)
Received: from cachyos-aura ([2409:40f2:3104:d691:c7eb:3b03:2c8d:127f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f783c37sm15775697eec.6.2026.08.29.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:55:00 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: nika@nikableh.moe,
	emmanuel.grumbach@intel.com,
	helgaas@kernel.org,
	markpearson@lenovo.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH wireless 2/2] wifi: iwlwifi: pcie: request a product reset when the device is gone after resume
Date: Sat, 29 Aug 2026 15:24:37 +0530
Message-ID: <20260829095437.44716-3-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829095437.44716-1-navonjohnlukose@gmail.com>
References: <20260829095437.44716-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On platforms where D3cold removes the WiFi module's power rail, the
device can come back from suspend completely absent from the bus: config
space reads 0xffffffff and the downstream link never trains.
_iwl_pci_resume() currently notices only a subset of this (scratch ==
~0U, and only when the device was enabled), then "hopes for the best" by
re-initialising over PCI, which cannot work - the hardware is not there.
The result is several seconds of handshake timeouts and a bogus
ADVANCED_SYSASSERT dump before giving up, and the device stays gone
until reboot.

Check whether the device answers config cycles at all, and if not ask
for a product reset, which power-cycles the module and re-enumerates it.

The check is deliberately placed before the STATUS_DEVICE_ENABLED block:
that block is skipped entirely when the device was idle or down at
suspend time, which is a common case (e.g. the radio was switched off)
and one where the device is just as dead.

Fixes: 9673c35486d4 ("wifi: iwlwifi: implement product reset for TOP errors")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221695
Cc: stable@vger.kernel.org
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
--- a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
@@ -1232,6 +1232,18 @@
 	if (!trans->op_mode)
 		return 0;
 
+	/* Not answering config cycles: it fell off the bus and will not come
+	 * back from a PCI-level re-init. Deliberately checked before the
+	 * STATUS_DEVICE_ENABLED block below, which is skipped entirely if the
+	 * device was idle or down when we suspended.
+	 */
+	if (!pci_device_is_present(pdev)) {
+		IWL_ERR(trans,
+			"device is not on the bus after resume, requesting product reset\n");
+		iwl_trans_pcie_reset(trans, IWL_RESET_MODE_PROD_RESET);
+		return 0;
+	}
+
 	if (test_bit(STATUS_DEVICE_ENABLED, &trans->status)) {
 		/*
 		 * Scratch value was altered, this means the device was powered

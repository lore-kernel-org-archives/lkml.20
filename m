Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B879C3D348C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339077; cv=none; b=BvqQM8lJQ7Lxw2yBt8Ia5P63Z7/T2RUvaOmrS9lKc+foaHMOzwJ4YdLE2XBDYZL9D23/ydtqhzHYHDyH7Kn+DIR62l/UGvdz/mts4QC7FcTzfF281oqqZfH9POrQuWlD9FmhCX5Zzxbf+6uDHH5V43ti6NQ4QiNx30BZV733aN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339077; c=relaxed/simple;
	bh=J+u0KgMKJB3iK7Bi+salQZRzsKk6olKpGA7HZ0p8BHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9Plfg5S/JKg7gp1AaX/9mCeVyCz/1XlQ1mVPIs06V9Wt2snqo9AzMhKrIXJLNmaEWbcttMi5wrvdE9xYmtO/YMK2H9Z72u5wdUAjHZeJDstk2ROKEMX/+E4MhwAg2KU1Den2edV9HaOqdDB9NwD4D+mAEQJ0Z+2lV1LbOP/Cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVxqtqN1; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVxqtqN1"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so21412436d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339074; x=1789943874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H08np1NCezknf+a6xR3bQgIb7oIFYvO24eBWSQtgT+s=;
        b=SVxqtqN16QiRtTx8N548gFdY2t+7ydubaECab3VCRYarHCtKKqyPDZnyq90OUEt3RM
         bt0XHF7qhmaxkN+VgJh50SzIqAlYJ51YYECaQT9wqiZy3LQWbE/YarJNIFD+9NVy9a+J
         E82hOvDGow9RlF6UFQibitHBSazCcY6T19HPH8TFq+l/o+0rVb+x74P9DIhTgI+7n/ss
         7yEqBa84gZLGXcadWeuqZhRWEWf5LKgbWDLjiBQli/iqiaLVW7IZ3zeOEgQt7u9Kw8BT
         glkPokkC6BdwAxOqhedr25gMIhby/i0Nj9y7RhRjNivvMMl61it5ykXxIXqd5t6hK05h
         6EYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339074; x=1789943874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H08np1NCezknf+a6xR3bQgIb7oIFYvO24eBWSQtgT+s=;
        b=ojDZIxlk9mAbOycj3shaGjsZqcNRffXzC+a/5ai78tbRLkF/muQT/R9xSUWBc3S0W5
         joqbE3WhmyBmqj08IFy5CgCCOCGohUNW7jjJM7dcKAzfJijmRX1tyq7n+eGJb13lFveW
         QPoEsLB2WqI4JkWfWTOT9HypeO/ywrhqisszT4edreXThkljuPfVG1aQjJIec9QD9JAn
         dFnZso4KCszXPgNwrzStnxTfIXk/1aaErlgdrNNJDK08svr0oxJ0EaPtYhMywXISTZYh
         pNHqv84BJpSyM6E9yRkxC9sJ5CCJOik0MaYNxSkqQb9WFS1/AEGXjXy1qLUhyecNNRJn
         cshg==
X-Forwarded-Encrypted: i=1; AKwUvByJYF1IiDscKfcXYwrAvI2zB2ucuhUD9e07H6ErGRtWvN0DBrxaSvS/NKEuKLj3UkCCn3jcs30d0VA8b3w=@vger.kernel.org
X-Gm-Message-State: AFuF++m8iqK94TbAwquwKOywytK07TKEpFGHN2wuAkUP1Al7eaJtvoy0
	DzEdRLqlTpH9yFk/1/suuvnuvhjUkpC8hSEP/0nkAYIPN03b6MfrIzw=
X-Gm-Gg: AYBFou08gMJ4Og/rmdtOY+Sfms9GBoHcJcurCTI8eDHNg/TXmZ+znGiPqfZW01cgKgF
	j/J9/jqAdpBOI6Wc6mRS0yn8ZHJYBu7nWG7laTT4Zh78UHf2uN96vkLnmeSu62Iy3s4I+M+JMh3
	NiaMOlY8r9AnoQLAP8/DxqbVOIJYpvmM2gqcV+/7Z6k99fMtOPU5FdbO3BXRGHz1l/fv+yF8WtD
	pmGjCIij6wqHDTQt6An7I2zKfpZnFPY+bmffv+cRMXR9i5+Lyqn/Cat0kZ+lNXtHXnNDMqWhhoc
	/BRtFW/kDkBqLaUEjwh8YvtHqfVcVtiRXeT9/riCkNHbnYymj2FnhT9bg+j0Of5Td8JT9SQiXSu
	u4tHKwzaHzbKPkxP9rwALW/XyEjFc5mUKRILitk8I0yJJYYGRgSES/GuPwAWyGGodLubp04ZxHG
	vgdYAUKvGuxwWa+IKch1PhnK4w7IuV259LDHeRw13eDj3ortBIK+8ES7I/BDy7Pas9rtcz7eQ8a
	eUL+bWHYDBsE27hbgnwBkp7uhwOrQkyMXVK1t9G4P//IBeDTPhXIOSqeVkfsjbFGXEwvn11lq9u
	toY0rCbgAmsNdUG/VY8BKROZvZkS1nDhJysCw4Bp7VO4
X-Received: by 2002:a05:6214:1304:b0:90e:8a98:f218 with SMTP id 6a1803df08f44-9122e4e35b0mr2677096d6.9.1789339069896;
        Sun, 13 Sep 2026 15:37:49 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: ehci-platform: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:30 -0400
Message-ID: <20260913223732.92882-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On wakeup-capable ACPI controllers, a successful probe-time wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 776c15d0ad0c ("USB: ehci-platform: Add ACPI bindings for the EHCI platform driver.")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ehci-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index f61f095..b749de0 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -420,6 +420,7 @@ static void ehci_platform_remove(struct platform_device *dev)
 		quirk_poll_end(priv);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);

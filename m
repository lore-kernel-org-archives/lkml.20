Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773C145041C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979179; cv=none; b=DcxGiVtCc66d/mFJ667u+cJhT1WISu1RUtthjFmw4gotL+Jvezw1jQ3AEHVf6YdleE/hoKNLM/xkerOjI1MYgxbk3C7kWuLvSn6wbO3iOde/piDMPv3dU2hBBt6I20wFQZ5OpqtI8Rq73++9eB7zp5TD6B0ikmX22MO0GksKr7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979179; c=relaxed/simple;
	bh=+hgLRH0kg/URrpkpVtllXKugJJqqqN1Pj/iK4V01C3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKfk1EN0Ak8BvZ6CvFCSKxlpkMcLSIGH94ZOETzk4UvBJ7jNkjjp/kYn3a/I3zvq1OQQq03Hb+MhynzC7s/1yioYmRzGgdLLvrfnIQjEX8yIGszRCpFGp7HVDumL+zzpew2oWQt2fNTuGQvutODd0VjoyzMGWbEFkJmmxVLrpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPBJn6A6; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPBJn6A6"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34908so2418769b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789979177; x=1790583977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ooL0yu/97MAI2sEUI7eblr213Ntkqb5Ie04YLHmVRm0=;
        b=ZPBJn6A6UuIavQfwfEF3TMzBky5+JxVvdcC4bEd0urtHtwh13IixqcOynkeEyUNcDT
         ZCOmX2U3vNF7m34zpui+btP3BKrLVzd/fUE2sPE2otYGFUWyCuWdz+lQbx5wK6JsLOzH
         7TKt+tRywyt1usVGuEVFkazjoc06ABaT9vBSKZQV1lnIIIiV+3xvy+75aUE5qItfXMe0
         ncvW7r0sLRE9aw3WtvTnQfq+ZMD7Q8n4b25Sfy0IhT/7Y2tb1F6UoTzbh0iy7kB2jYqk
         JwFD1x7sRhS4lFLOy+R70PzYZ8gX+zGAwGErqPVbYKv7if2tYEnh/ktLG5WH9apb6b7O
         R0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979177; x=1790583977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooL0yu/97MAI2sEUI7eblr213Ntkqb5Ie04YLHmVRm0=;
        b=sjplJ+a2S6Q3Y8JtQwkCeM+IoalgOUX9hwJuJlhif9/1CME1/DejS6SybMa/E+qZwA
         Qdc83+I9IOr3sHufllJZDHm8z/e3Sb7NsYrhTmEXk2+2/zugAZ5SqfzR61e/zqoxXeNu
         lHZ6fIjTh98q6TLGvBdNxNMN5N9f6NaQTDp576HoMmWqaIPwXRKuR8JmvvkJlp1RMjpD
         jPDk1jRJTpbRP+rMtKsBGxTf9nSOSQwJ90rbnbs5CST2qqUF7FWM9QEAZ6r475ixxgFf
         PEgfjnPmqvGNdzbcX5DgKPa+Lym37z0j22ucWyPGXvBaxwCKiASwvBC8yvqXZFG/PMFt
         sHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvVXA2Vbh+7+/8Lt746oTYn3sVjTcCzHg4/JjV1m+thcxZje2+exBiHgHtVa9QW6Cd0PO0XdufJC1pnhM=@vger.kernel.org
X-Gm-Message-State: AFuF++nPIgs9i49hKtS1O/v8thIK/E5oc/tTvrrC2BFsSIz7lAMGpHCQ
	42L/fyWy59wys4NjDeYwCvlOIfMixO+0o/O4qEX2+rhkqeIJG0+wFM1z
X-Gm-Gg: AYBFou0JoRPpywOsoweRgimCi9YJKIvBTuhTPCp52d5L5QsVtkpagDktgpZeOdLF1Sg
	L5pYQDzFSFgCA76BlRxeBLs8Z/278FHUSYeb/GcWnROxpXxZI3CQ00gpUnFnt0g1P7chusZ4jTp
	/63U9GV4q+yVhoQQZDGtDferhsfQ/ON1Vauj8cFQArxnuv+uxsPTz1kMSph+W+OPbV41zYC7w+J
	0Z+iHdGGhKupY9uellpnwY9Euw4/mYxIG7Ul0cOuA4+eHGL6/7jbUMe+7xi/PganXAaykeRaWkQ
	GjKJTVQmAXPAwcODcYUnhKBSQnY5HqYUKT61onioS4R1/Q1eOZjzoq2wnH8OqrqqVWf0x36yB7W
	NPFLIE11t915EdS3nsFpunO7DsAXSLyNGfWzBu9mTtor2T8YdwjzlqrvfuspowA9e1GJ4fh0mlB
	zN4DQjlJZd/GL/vE7RsUcBEOvNDA6YRRC4T/uokNwxUfY10SyKvVp7tA==
X-Received: by 2002:a05:6a00:f0b:b0:878:34d7:697c with SMTP id d2e1a72fcca58-87834d76ce7mr6581070b3a.42.1789979177544;
        Mon, 21 Sep 2026 01:26:17 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95f916dsm2872054b3a.31.2026.09.21.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:26:17 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86/amd/hfi: fix platform device leak on init failure
Date: Mon, 21 Sep 2026 16:26:09 +0800
Message-ID: <20260921082609.244774-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amd_hfi_init() registers the HFI platform device before registering
the platform driver. If platform_driver_register() fails, the function
returns the error without unregistering the already registered platform
device.

Since the failed init path does not run amd_hfi_exit(), the platform
device remains registered and its reference is never dropped, preventing
the associated platform object from being released.

Unregister the platform device when platform driver registration fails
to properly unwind the successful device registration.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 5d902ee5609a ("platform/x86: hfi: Introduce AMD Hardware Feedback Interface Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index e0ebcb0c4acd..449aad914ad1 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -530,8 +530,10 @@ static int __init amd_hfi_init(void)
 	}
 
 	ret = platform_driver_register(&amd_hfi_driver);
-	if (ret)
+	if (ret) {
 		pr_err("failed to register HFI driver\n");
+		platform_device_unregister(device);
+	}
 
 	return ret;
 }
-- 
2.43.0


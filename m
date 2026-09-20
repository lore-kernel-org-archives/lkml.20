Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73386234973
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895250; cv=none; b=pJ/QvAOQLe++8vqwjtXnqFEPv0gYD6g0RXC4mLqn06/ZPs1f+phmfPXu7usQql3BIgoGkWiNHXYS2bf5LpW3M1ZsVDUNon8BdHgD344ttazcwgXtmYt/ilmnV4JgVA4R6VaFnnUqipmAyWKiZVUNRGB1/qLIatLhbsZa7sTU9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895250; c=relaxed/simple;
	bh=kweyCHjSRKSsBODDFc3szHop9BuWVtjvhas8CVH1EN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YB6oBHCT4k12kQTTbhunPGpLgR7DWg3XNcu83VHAzHN9g3+Ac6FjkLcNyPWCIWN9fr5ALXFQ7uQKyf7lJhKrY3h9N4dfjlKewJZfF2sCWm+5az+RJJU3NcxBClUY+ibyRBTlBnbu3cH5W+hqx0LxKTuEGRhtqIr0kS9l5jlr6G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naboEf9H; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naboEf9H"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so24744165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789895249; x=1790500049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXCcn+GJ+ZcNcE/i0kBtIoCDO7yf3ooucIgFoFAv2Pc=;
        b=naboEf9HWE9Jl/fuVEMcsmi4Kx1QDY1gA5g/uFYPLEezDGeTm7CL9h7D6Zk6L7RFUW
         xLsk+bEBO4uwR99PN5L+tz1/woh1YUuzymH3dsg5z9Te6yD92WeAeP7P3balv0mAH6tb
         zfl1ZbHCUIjp//An8ElHUlN3yxR1ml107Mbk0j0sTrc2Ce6A+JNaUjyHW++2QzHyMQ1b
         Pj8CAfDoLqeoeIfFWltNmaOIbwH6eeDafNGKWhRFyaK4JtXNrmWuvkE0zzZLbrfXeHh0
         jUI1rmo3JDA5un65Ssuz5DPAfnGKR2qBLXWlfPosZqhmwikpQs1MUt3QsMP9S0blATGD
         cy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895249; x=1790500049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXCcn+GJ+ZcNcE/i0kBtIoCDO7yf3ooucIgFoFAv2Pc=;
        b=khEMET5tBzGzuUsBxgaCY3jHX7x5YiAIOMNffYzqa+K0xRDXpQCnkQdk3EXGGIkBQ2
         oCLUeVRydHzbUF+0A58+bKFJ07/s93EBBnol6SRfth9ygFNpfqtvY4WdZO40ndFXwSsq
         xYrYq7Z7B4BuC/u7l3Cot3sXAvyzULcD0ASAqlCSSlNMeCs9rgdXMZpger6r3qozEfmr
         QoRRkkkgVxIm4bjT+iI/Dhj94YXLeueeexzxVUk6yRNwe2uWWz4hpn+Iw75lMAKfQYFk
         /YjBoW9aFyFWsnQnnPLvL6GvIAufHgJHQ4Qh8jOxN2MpWDk3pjBKEWcHkrPDyTS/e4gs
         BFzA==
X-Forwarded-Encrypted: i=1; AKwUvBzvCIrcyhi2DJW4QWxtkr/iPXmUAF3Usi4cxUYpfxw9fAgUk9tMbFEvqlaR8vE4SGgw+zbRvGjhPJUkiuo=@vger.kernel.org
X-Gm-Message-State: AFuF++kP5MYyus9dodxykgwWoYYsoMGgjxdVQsIRQzmq88qsefpgdgQM
	5KlEtFyvHeoJmpBtjs81sQDZ18jIv+BUYfcADlT6J+WhTw55v6F5tH4Df4p/RCeGI+A=
X-Gm-Gg: AYBFou36lvwninNOpZ4uUH4OT/AMRFlFT+cYlho5Rke2QO3zWMqzz7Biy/BAzZhTJZy
	HF//xxNXs7aP35c4Qs4upbPfoAcc5p86cZr3FAgHuQI7TaBOjFJPH3xnXnC8Ssb1QQm5yVl3xhK
	6NwCse7u/iNU+3rwfeimGe+qZniId0YqdVsjHPH89zvWchmnRGtxAWBnsbILlyE6ynFO/buU8IY
	/V7NUs4ketnWx8NY6OGmp/13Kj8EJLR97QdpN1cikF5BdsNzQQNS7/osZDMTNgPiFr2px9URhCL
	uwLFjCp5SxNUS2tv9BqvSsEYJpXgryoBAPyMwiPFQVNz25ZvLSD/b7WzZjnx2JRLVgj/DPWhUoY
	f+m9OmhEkNXqJmIERSCvHLceCrXoPzQDFteG0R/X3DleNpnXnnvV5vubQZoDrXxqXpSOt2juXau
	My08fXaj7LBuT6b92wihgwdEZ9k58pcfYyp/aZE5pbPzTsyhnNrp0q8Vc+A4zrS0mRnHHmoOIU9
	BfXjRKZSeCqQAR/KxvTt0Q=
X-Received: by 2002:a17:903:3c43:b0:2d1:134:b86e with SMTP id d9443c01a7336-2ddb1acac1dmr134634645ad.2.1789895248670;
        Sun, 20 Sep 2026 02:07:28 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.130.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm18320445ad.64.2026.09.20.02.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:07:28 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+e7aa19176573a6992617@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: acpi: don't dereference a missing ACPI companion
Date: Sun, 20 Sep 2026 14:37:10 +0530
Message-ID: <20260920090711.300-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_acpi_probe() reads adev->dep_unmet before it has established that
the platform device has an ACPI companion at all:

	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
	...
	if (adev->dep_unmet)
		return -EPROBE_DEFER;

ACPI_COMPANION() returns NULL for a platform device that was not
enumerated from an ACPI node. The driver only advertises an
acpi_match_table, so the bus-match path cannot reach the probe with a
NULL companion -- but the probe is also reachable from sysfs, and that
path does not consult a match table. Writing a device name to
/sys/bus/platform/drivers/ucsi_acpi/bind goes straight to
device_driver_attach() -> really_probe(), so any platform device in the
system can be handed to ucsi_acpi_probe(), including the many that have
no ACPI companion:

  Oops: general protection fault, probably for non-canonical address
        0xdffffc00000000fc: 0000 [#1] SMP KASAN PTI
  KASAN: null-ptr-deref in range [0x00000000000007e0-0x00000000000007e7]
  RIP: 0010:ucsi_acpi_probe+0x6c/0x4b0 drivers/usb/typec/ucsi/ucsi_acpi.c:199
  Call Trace:
   platform_probe+0xf9/0x190 drivers/base/platform.c:1507
   really_probe+0x254/0xae0 drivers/base/dd.c:706
   __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
   device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
   bind_store+0x1d3/0x220 drivers/base/bus.c:267
   kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
   vfs_write+0x61e/0xbb0 fs/read_write.c:687

The faulting address is the dep_unmet member read off a NULL
struct acpi_device.

Bail out with -ENODEV when there is no companion. Every other use of
the device in this probe goes through ACPI_HANDLE(), which tolerates a
missing companion and would just have failed later with a less useful
error, so rejecting the bind up front is both the smallest fix and the
honest answer: this driver cannot drive a non-ACPI device.

This is the only unchecked ACPI_COMPANION() in drivers/usb/typec/.

Fixes: 1f3546ff3f0a ("usb: typec: ucsi: acpi: Check the _DEP dependencies")
Reported-by: syzbot+e7aa19176573a6992617@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e7aa19176573a6992617
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 18286d3e9cc5..9fe4ba43afea 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -196,6 +196,9 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	acpi_status status;
 	int ret;
 
+	if (!adev)
+		return -ENODEV;
+
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
-- 
2.55.0.windows.5


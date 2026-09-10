Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD045474F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072652; cv=none; b=Iwpdo/oEZES2iACMf4tecEA3g3g0g28umYhZnkWmZEzdMzYF+COEfgg5rQJhy028ZDnTBoXgr28On6pk4UJRRVd+HN4PI6WJew4HpdXj8bPaIwsHbBO/U4e+MZWS05JtYaHnBXX4ISqkoXQHQ4KSohztq73wVHTm4nJ9eB9mjg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072652; c=relaxed/simple;
	bh=zwGJ3GPA/cKqZXB6RBg3UlMxboJriBQTlXHQ0fTi9LI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epGgcdR6xi2qd6A29kMU9jfYVS2OaN6vZL1WMDLv57cEq6NGdPUuNWjC2W5avk21V69X7c1eKEgiWZhcU8bte5x0Da5rHgAxP+mzxmXv/AHrXTO+AlvXol6yyeP1mFa4eqRsHq+xaHdLafjC3CCo37QYAJwBE7p8Ce4mN28GyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBRsTOHy; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBRsTOHy"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52de50e77ffso2427001cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789072650; x=1789677450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQ//0wLx0ZrUFKEVfJ2KOKRoOutXC31Ghgf5LXlFB7I=;
        b=JBRsTOHyWTYRrPmShFHH+ZSdGZeQ8GuHYfnovnz9UbDTPrdhrVTvExEkxqaHJY4bCR
         L36ymihikorow6QK4la9r7E/dGfD8pGRqJWLSk7AqQgZIZvWBDktEGyxtNqqSuocVkBP
         5mcpxCkqrl5JSBt2SOUg/K301AtGG0vGGP9Yau+m4MkIvLGAGqFbEjXCsyNfpffu3Akv
         6LxbPU+eovnPfxI3E47Q3ojQQTqXvvZvcRzVjfdcZ0e6XxHf56eHQdR0fTseHUgJKFh7
         xkxhU6ixLuMOfoVnFZzmkrN35nPp8gLq9YJ8PhF09lgdyT45s4Q2CSyc0A2LkyRZdZ0r
         qf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072650; x=1789677450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQ//0wLx0ZrUFKEVfJ2KOKRoOutXC31Ghgf5LXlFB7I=;
        b=BnkSt473SP4akDliihHQvIsfW/VM+PMlCo8COnbmkqSjIlJrbpXFcV8ONLlzFkWvLe
         XCmdOTtHYz1uUbY80j2iJhpRs2aWeJXaChn82UCMWm26UIYCdp1CVljDyatbM4GNqKl/
         qDHMCgQxJnXWn4TG9h4TQAooBlPacweh9D2YRXKXOvnfh/WxOnQq6J98jpTuK9FCPOi+
         /Xgw5LWJW7HlNbTshA7DaoMwkN4ro/wKy78Wz94bpGBLtZsFgDRe4ysqv4s90EaT7IyX
         rZXYVXqQ40iek4pWfIh+fWXYyKg4CqFVFL+aHYxuP3rAEaC25gMeTqkN71VNf8vc8aOE
         jSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEYaVB+9CJzs1yi9CkyKy979Co8npxF6gAP5eREyG6fXwq0pxWRjs8JKnCIKD9s6f+OU+/rj6P6WomryM=@vger.kernel.org
X-Gm-Message-State: AFuF++lr3AelTP9Qh0XquhW9ME5lJEzetzfwptmqlY3nM2xpAQiQLhak
	8OHIF/dCZU6QNdu8jBp2bH+Vdn7uL3q6Wpp1qms4YYSJYvYi1NKdDts=
X-Gm-Gg: AYBFou00jYGkmxE/tFB98+7iZT8R1cRPMsgcJmoqdEamW6js7pyQVS+N9nmN6i2wFri
	ud1fhjFvtmoohVhSv6VD5nfNCSGcih1O0BdabW5bjZeSEZWx3KOd1PhFw0KMF2ejnWGoIGZ7JUY
	hwoDmbOg2axTad330njik75ocOHwlWk32B4jaxkt9rGKHtGDSUsV8CpXFeWskXnZaYV9vZdDQfh
	omvXT/hCgzPcVcTBpmxnGbz11nBJyatBmqrZe0irZE4/7TYA+jeBDskxkeY1nqtkJaB5ODIkNct
	n/dUlVX3dYcy7hUKt/cgUzCiEXo7azIU6w7DiJ2iQKTEKrKT12XAzm5V3/DeJtcCC6rC3oCbnCj
	7DSW8iSKXM8z9ki3aRu/itQjyYKkGpFgIz1O7qXg0Bmq18ZqgVXE7woz6HkcCgXHVcTV8R4IqQX
	ELc8JkGnosTNMOhAcUyIxEU+uBvGLxd5SYh0Lu+A+ssp3I91rxWzlB2/6MH+IPlfol1XAqQevfg
	NX5Iz5uUm6WMi+eCKD/ipbQPc4ae9qpdFTvNwSfAPTMoPxJghQf4a3KZaSjFojM4h80i//rdbWP
	CVrFXShOWtnZ1ulhAsDVm2QPUZR1WkNgMg==
X-Received: by 2002:a05:622a:1446:b0:530:178a:9de8 with SMTP id d75a77b69052e-530c859b375mr17874041cf.22.1789072649848;
        Thu, 10 Sep 2026 13:37:29 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca3098easm2538941cf.3.2026.09.10.13.37.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 13:37:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: rafael@kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] PNP: Detach device after resource transition failure
Date: Thu, 10 Sep 2026 16:37:27 -0400
Message-ID: <20260910203727.63489-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pnp_device_probe() attaches the PNP device before it activates or
disables its resources.  The attach changes the status from PNP_READY
to PNP_ATTACHED, but errors from either resource transition return
directly and leave that status behind.  A later bind or manual PNP
configuration attempt then sees a device that is still marked in use.

Route both errors through the existing failure path so it restores the
status to PNP_READY.  Do not disable the device or clean its resources:
pnp_activate_dev() only marks it active after a successful start, while
pnp_disable_dev() preserves the active state and resource table when
stopping fails.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pnp/driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pnp/driver.c b/drivers/pnp/driver.c
index 6d58b1465081..80c2a0f15b80 100644
--- a/drivers/pnp/driver.c
+++ b/drivers/pnp/driver.c
@@ -96,13 +96,13 @@ static int pnp_device_probe(struct device *dev)
 		if (!(pnp_drv->flags & PNP_DRIVER_RES_DO_NOT_CHANGE)) {
 			error = pnp_activate_dev(pnp_dev);
 			if (error < 0)
-				return error;
+				goto fail;
 		}
 	} else if ((pnp_drv->flags & PNP_DRIVER_RES_DISABLE)
 		   == PNP_DRIVER_RES_DISABLE) {
 		error = pnp_disable_dev(pnp_dev);
 		if (error < 0)
-			return error;
+			goto fail;
 	}
 	error = 0;
 	if (pnp_drv->probe) {
-- 
2.50.1

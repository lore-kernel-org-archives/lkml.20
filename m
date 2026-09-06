Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6AC33F5B3;
	Sun,  6 Sep 2026 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734682; cv=none; b=GyB8noqE7jy6gL7u/ltLCNcJjam1oD6MTaOklH6uHhReXyJ5Ac+ieHr5T2A+pc9uASzyUiR/0sEbghoH9DeouNuStbu5kSO9Svc3uAySHQIMEFFgT82IPp2QX7MJUy1x7fSWa1hAOeROoQ3PZZtqwsMbV5YXGP+almOF5daEXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734682; c=relaxed/simple;
	bh=gPPz9XDRB0NEOVciaTNRbH8E17RObmzyKuc2TfXHsjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S74VYR1nvGC6aWp8NE4HetA+UcCeWzRBDjCtesMgX+VufhtPRnR4eEJ95lxEBZgPFqyCR14yTzLTO8JuIgSNTSJHNmIxbVvsiBGeUGQDQB8JAqv764twBK6C/hS9R5bwSRmFN3JEy2pt3Jvov2gm5iNkHf9ORNuroEwDG9814SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=KGTGJHO4; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="KGTGJHO4"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cb5d7509;
	Mon, 7 Sep 2026 06:44:25 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] media: ipu-bridge: Fix use-after-free in IVSC error path
Date: Mon,  7 Sep 2026 06:43:50 +0800
Message-Id: <20260906224350.609185-1-lhfff@tju.edu.cn>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa078e4f3a503a1kunmeef213ceb5856
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHU1LVk4aT0sZTkoaGEseSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=KGTGJHO423VlBNNKGarXfjUGog4x/UUUdFxLAzF9lbdVqdCATfKDE6TCydOhUCIazOH5EFGX7jI2AJiKX48xYhfbdhY35Lcd3Dc/S7S3/+qqiEDStRXBfQZ0JQ7jN9sRQbma6XdJzAejS94fm3uREZnU7cyAJkPvhbUJC7CnWOU=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=2i/zGd8hsiBTxsUIqugKUYdnClcIsV3k1twiw+7J7do=;
	h=date:mime-version:subject:message-id:from;

ipu_bridge_get_ivsc_acpi_dev() returns an ACPI device with a reference
held. If no matching CSI device is found, ipu_bridge_check_ivsc_dev()
drops that reference before passing the device to dev_err(). Concurrent
CSI device and ACPI namespace removal can drop the other references,
making this the final put. dev_err() then reads the freed struct
acpi_device and its kobject name.

This was reproduced without kprobes by racing normal CSI platform-device
unregistration and ACPI configfs table removal against the production
ipu_bridge_init() entry. KASAN reported the final free through
device_release(), followed by invalid reads through _dev_err().

Emit the error message while the lookup reference is still held, then
drop the reference as before.

Source reproducers and vulnerable/fixed serial logs, with only the build
hostname redacted, are available at:
https://github.com/kimaiden1984-boop/linux-ipu-bridge-acpi-uaf-reproducer

The fixed target builds with W=1 on x86-64. This was not tested on
physical IPU hardware. The tests establish runtime reachability but do
not measure occurrence frequency on shipping systems or establish
exploitability.

Fixes: c66821f381ae ("media: pci: intel: Add IVSC support for IPU bridge driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 7e65491..0dd8dd2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -326,8 +326,8 @@ static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
 	if (adev) {
 		csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
 		if (!csi_dev) {
-			acpi_dev_put(adev);
 			dev_err(ADEV_DEV(adev), "Failed to find MEI or CVS CSI dev\n");
+			acpi_dev_put(adev);
 			return -ENODEV;
 		}
 
-- 
2.39.5


Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20663B14A4;
	Sat, 17 Oct 2026 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219424; cv=none; b=RxEg/2mCL3VTCcar8WXhy2GK54n9ml+enr9IWSrQfqdfX2Uz/t+a868PS2CGAtKwv97dcrIgRIzli2c2pNPtcyJqMxzYTSnfosfcxjRg11RHMtujhl5Gl2N6ybabQ+i6bH3O7W6vBfRW/gdQwaqToJUAiy0psNTyhzTrdkwV+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219424; c=relaxed/simple;
	bh=YMyVj7TdUR7PrQ2OETaHDs+KxQfmoFpMeyAO6HanJGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XAq9NozFF1H7b7kD8+lsQcgCUMZV5E6FkVIheDPXlsmbwmaWI4m797ZH2th/WetuPbEQrHJybkNI1iS93olJFDAPLXj7fIQ1GsXMOBRYL7Cknk/dyNmyYaltJET1b3oEldS0iskWr5iVUDDBVDRaD6rKxWu0QEi4p92tByf/Do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iJVVKJT1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iJVVKJT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TS
	JUJ8xvDbcZZeQo1kO6lfiRqprFBUFxgjkhGlmR0es=; b=iJVVKJT1uc638sTe0C
	1JtGsnOpqSlkFWBBzQSYLlZKdnrUIhK52kC5yKxdX8L/5YKkPIFT82kgljycB4gh
	yeOWLFWfo3Pgkoe2MRgQr5nZlowJHt3jU+gPY15TyHDI/VQFIaYbTXW9LrUO0NIo
	ekhSExkYELMYKFdvMfD6LkC+4=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnLS8MGdNqlsVoAQ--.44028S2;
	Sat, 17 Oct 2026 14:43:24 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] usb: typec: ucsi: acpi: Check ACPI companion before use
Date: Sat, 17 Oct 2026 14:43:21 +0800
Message-Id: <20261017064321.3816776-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDnLS8MGdNqlsVoAQ--.44028S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF17AFWkAF1fJFWUCr15Arb_yoW8JrWxpF
	97ta1FyrWUKF43Ww1Dtws5ZF1Y9w4kC3y7KrW7X343uws8KrW7XFyxtF15Cry8JrykCFsF
	vF1UtFyjvF4UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRloGkUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgzYE2rTGQywpgAA3z

Platform drivers can be forced to bind to devices outside their match
tables through driver_override. ucsi_acpi_probe() assumes that every bound
device has an ACPI companion and accesses adev->dep_unmet without checking.

Return -ENODEV when the companion is absent to avoid a NULL pointer
dereference.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5697ccc24ec3..e8e3205cab9b 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -222,14 +222,18 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
 {
-	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 	const struct ucsi_operations *ops = &ucsi_acpi_ops;
 	const struct dmi_system_id *id;
+	struct acpi_device *adev;
 	struct ucsi_acpi *ua;
 	struct resource *res;
 	acpi_status status;
 	int ret;
 
+	adev = ACPI_COMPANION(&pdev->dev);
+	if (!adev)
+		return -ENODEV;
+
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
-- 
2.34.1


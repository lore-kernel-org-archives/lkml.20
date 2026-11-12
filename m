Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449921;
	b=HKrmFikkB0mrAkntDyL5tgCKhljNtg8cBgrtYyOQuTjf58wpUm46LtcJpHt8TUaoLQHb
	 86HIIaSbQ/a6MEwOoCc6OEpBw54DKtYDDyX6wE0XTif2LxEcCSOjXoNDS6RaqZIxCPCKy
	 3yZRNVtKjP5qxQRm24Sr00hcSe1o2F9JVuj5gofQeN55bDQoFnkUoMiVzlnxLDaGA1396
	 XuW9aVgvqLO0sbd3YG26cEsGOBMU9gFhEMfNT9RV9iU+zgplwIogoMyHH1hvjTvONuj6i
	 gAW64MAGO35wB1GncqkgiOFflD9lNZg6k+f8ok4taehyutaupdOAgwyJXvAZZYU6q7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449921;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZv79iT2eXbG/Mcdgarmuyf58eRe5wSuvqyXJmkt4sQ=;
	b=JFDwSyN+X5MhRoyfYBLh6A8Snfz0r/tPKrP7pajPTY6iggvrMok9sDSfCzXzGJdX6lnD
	 uv837hc+BP8qobAcjo4+xiAe4Lf/NnaFg/mXdOTpNAYRXN8bn4GAeir5Wr32slmJc3oPt
	 y/v3E36MAkDVeifxZvENL0jThhA0UUusk08OgFxe/8PMXwoo1ahMS+ezpeCP0wHxd58M+
	 Bd3P3VIgwxcwDdygnWsz2euNy+4A5BHMFu4ZYvv7yP0fkfpPs8rZ1JNi7m7n97G29Hp+z
	 NVY5YTK/o2CQFOuZTNafl8GkDBh5gqrpXvKcpSVlCdC5VgqVm6hFDRuGPnkjckfHbRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vjWvrism;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9639A606A31C;
	Thu, 12 Nov 2026 02:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9639A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vjWvrism
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vjWvrism1syyVWxYROFzz3LX2P9y7jvqdC0wMJxzzLqYtJ9NmsfwSHQIXZu63iReW9dXaZ9RjgQnU
	 c8rBqy29ZWwHQB6y9MAMPXQpxWdV8SAhvE+J/07B/mvDmFeU4d/dpBnLXCG9EZ+7vLDvGGTmQEXVnt
	 YKbIllXgcKNHVsJM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af521fbded-a876c;
	Thu, 12 Nov 2026 10:18:38 +0800 (CST)
X-RM-TRANSID:2ee36af521fbded-a876c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af521fc744-eedce;
	Thu, 12 Nov 2026 10:18:38 +0800 (CST)
X-RM-TRANSID:2ee56af521fc744-eedce
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: bryan.odonoghue@linaro.org
Cc: heikki.krogerus@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after regulator lookup
Date: Thu, 12 Nov 2026 10:18:36 +0800
Message-ID: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmic_typec_port_probe() looks up the "connector" child node with
device_get_named_child_node(), which takes a reference on the
returned fwnode.  The node is only used for the VBUS regulator lookup
from the connector node and the reference is never dropped, so every
probe leaks one fwnode reference.

Release the reference right after the regulator lookup, mirroring
the parent driver which already manages its own reference on the
same node.

Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index d3523435f..084e8e9a8 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -733,6 +733,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
 								   to_of_node(connector),
 								   "vbus");
+	fwnode_handle_put(connector);
+
 	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
 		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
-- 
2.50.1.windows.1




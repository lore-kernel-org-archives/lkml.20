Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF23812D1;
	Sat, 29 Aug 2026 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033856; cv=none; b=S2jP4BIWXcQSBRwtpfIdIVWX9GzqU7T/zLxXtIAK70gx5cxOegm22tCTc05HnmHHGvD5mUbORzxZQmxZZIN0e5ifPiX+wzq6pBzHrsk6XkGt0vt4ovRlZetc2AAGfVXVJjaHW5p9vTBvnJum0fNHHhmQfIOfV2QlQyF24HWgEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033856; c=relaxed/simple;
	bh=CKY7e3bB5GlmgcceIuLJLrwmWVVlfIcFh0TCPWYRpPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6lGKjm5BDoG0yP9kENuGfDoitEnUxV0moa+69OHMnMbZruyVC4jr+1ul6VvGCnU+h1P2cllzGg5tKayrTGDCKZtEV/+xQiNSo80Q0MO/L7uKpyL2upzEs5xag0bdGhidrMfRNMEcyEBtlUytHTPwFwe9aDNWxxRBQgDo2irpik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ1xQW7S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ1xQW7S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8BF8C2BCFB;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788033855;
	bh=CKY7e3bB5GlmgcceIuLJLrwmWVVlfIcFh0TCPWYRpPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rZ1xQW7SrW3rn3PVb2t8rlBSZK5BlDEP65TufvoRA+UjSeA+RCUGGWRIZZPb6QspW
	 KbaOKpv0Hct7WDz2U+WkS7xvqNGo2gxtLWIiWr+0XN8qOvkINmXRu701gsudONzRMy
	 HJpLbhWF2VeEHZ4pr6tAk2qTI1LQKbbZLCh0hmg//VTjrkcMsd0W3MRaBft87Qxbzl
	 p2fqZGrcFwPT491L0XbHHnPVk8Ye/HWoxfaiNw2kvsUbuLnjR37OW0DBdoGTWgmiYh
	 fF9pBlCjhCgnBTgR6Vo8YeK2o9101jZmrfOka9ZjJCSiInc97E8NVqa6ngvfj5S2Oj
	 rk4ayUYoHe8Qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C838AC61DCB;
	Sat, 29 Aug 2026 20:04:15 +0000 (UTC)
From: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>
Date: Sat, 29 Aug 2026 22:04:12 +0200
Subject: [PATCH v2 3/3] usb: dwc3: qcom: set xhci_no_soft_retry for IPQ4019
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-xhci-no-soft-retry-v2-3-0efe22f1c2f8@divinehawk.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Matt Eaton <linux@divinehawk.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788033855; l=3072;
 i=linux@divinehawk.com; s=20260828; h=from:subject:message-id;
 bh=pZdj9EBvPXV7nO9flwfMVrSwQKB9H/3tZS+G/WrrLgA=;
 b=cXcKD/TOysPCU/i/CcnxXTgpuqlAXCyvLvU+XVNC3ebgO4vj85HYdu/8ui3f0jqTTgg+O6gzi
 4+TPh3rVV7NAAB/BBF/9JD0DLvk5w+7U9hAhq6qIPsfNSN7Ta/f8vQf
X-Developer-Key: i=linux@divinehawk.com; a=ed25519;
 pk=UG4KnKXGwxjTNdirUPh/nySblET4aRxWYWSMTQwzlMw=
X-Endpoint-Received: by B4 Relay for linux@divinehawk.com/20260828 with
 auth_id=982
X-Original-From: Matt Eaton <linux@divinehawk.com>
Reply-To: linux@divinehawk.com

From: Matt Eaton <linux@divinehawk.com>

The dwc3 instances on IPQ4019 mishandle xHCI 1.0 Soft Retry. A Stop
Endpoint command that lands on a just-soft-retry-reset endpoint wedges
the command ring, and the stop-endpoint watchdog kills the host five
seconds later:

xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

Reproducible by unplugging a USB-tethered phone mid-transfer. The port
stays dead until the platform device is rebound. The controller itself
is alive throughout, hence the -110 timeout rather than -ENODEV.
Qualcomm's 4.4 vendor kernel predates Soft Retry entirely, so it has
never been able to hit this.

This is a property of the IP rather than of any board, so it is carried
as match data on the SoC compatible.

Both dwc3 nodes on this SoC share the compatible, so both get the quirk.
Measured on the usb2 instance, which drives the external port; the usb3
instance on the board under test hosts a soldered Bluetooth radio that
is never unplugged, so it cannot reach the trigger in normal use.

Suggested-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Matt Eaton <linux@divinehawk.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..1edf75696e45 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -607,8 +607,19 @@ static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
 
+/*
+ * The dwc3 instances on IPQ4019 mishandle xHCI Soft Retry: a Stop
+ * Endpoint command landing on a just-soft-retry-reset endpoint wedges the
+ * command ring and the host is killed by the stop-endpoint watchdog.
+ */
+static const struct dwc3_properties dwc3_qcom_ipq4019_properties = {
+	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,
+	.xhci_no_soft_retry = 1,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
+	const struct dwc3_properties *properties;
 	struct dwc3_probe_data	probe_data = {};
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
@@ -704,7 +715,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.dwc = &qcom->dwc;
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
-	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	properties = of_device_get_match_data(dev);
+	probe_data.properties = properties ? *properties : DWC3_DEFAULT_PROPERTIES;
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
@@ -839,6 +853,7 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
+	{ .compatible = "qcom,ipq4019-dwc3", .data = &dwc3_qcom_ipq4019_properties },
 	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };

-- 
2.43.0



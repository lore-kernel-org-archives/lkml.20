Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20927233944
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272645; cv=none; b=qkUFauRpuZ0hubt0GNAB5C/zmMafI7do/l7PApj8SSYdZz0Nzuh64T+R6ifbxbzB00Wt3Q8t0UhCpZqH+vbWwRhnZfkV15keJA2AktXHDm5cTGVaaSMU8/or2miytfqSKzXs6C9iS0OKp3SKgdoyq9eI8nwL9Gv9SKxxkcdvLAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272645; c=relaxed/simple;
	bh=q70lBCJF9U8Wv9pSNev+Rilr/PYDCEDGEVWmQL9R7qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsY6slFcY4wj4aA3ZzU/ow5pFPoDdNNHOfnZ+A7vS+5G5/tQlgbLPFZWxyBJWGKVPX5H3QkOCq455XZkQjBK9GoDbjeN1qD8ec2T/tJ8zvmERrSa57pzbXVvPpgbBC3vRUtngZNGTr4oncPKFdKPSaa/uta2mpHCwLKtbOzGvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA/YgI/L; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA/YgI/L"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso14335776d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272642; x=1789877442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=BA/YgI/LX8qY2e/HXaOWFxUY8/TQCfPDJXudwkboXgVFDCbP6vkykCYAJyz2VUKd+e
         nQwruyyxF7x6OK2uNNvFSaXXNYXKM1tykIJlhlyguyoSvcHpCo1oPewNEmtyA4E9aFCb
         Hh0f+7U6MKLq8Xn8bQAH6JtIBE2Zd1iSDOFjDD20lzC7ydYCXUdNcPilScTKocTt3Cy0
         I2M7rfj008J2ZsbtrFSJblzVlWNzEGQlFgBxIPCvmMOxaarDMBRrQgRBMatDC/XuH15y
         303IZKs+Fo6rS3gClNgspR6EacP3GXrWtD8VVgyKSYVUo2BsyYwl/+MKxhqr+Oa+H3TL
         LB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272642; x=1789877442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=Qkh0CvquPtDEXzTw4fx257pBjS1noxD6EB/kQqeqENedLwwctrdqoQ9Rglp3bzl17V
         S7DrmGh/0XOd0PPrzfmuIyXpMF7iYagDG1uXdcgyB92dmS65lWOTgzQIxss9qeER4SU7
         xY49/YmyWwVj821nV5xxr/UUcOtk/G2VzdTnXunq17XY0pXlEYDStYI+ZdNvup6Pz8VI
         olLkWo7gP8C6mIDHhx4cEiIrjg6saobfaOGlq1gLljMoAJMlZBTsm+PcDIw9v0vFZ6nN
         tALNiryDzNsNMkxNx1uNW+UtXlN45vJ/Wopgu9xXo0vi2zlqvRcNpM8PpvJtSEvCp3tI
         eaUg==
X-Forwarded-Encrypted: i=1; AKwUvBz0FFCcCCXIYt+dTkrq6yiU3CfPOxezzQpUSsdc7fVoBQchY0SwraG2vVDzZH1cNBARVemwIR55ve315AU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3MvsDjx1nBWAkQMeUDe0ik8FE55KLf3OxLTzJtXAjabxEEM8c
	FHodMHmxbXZLwV8YmYrwT/1nR+PP8cNADAn/QUY9HwSAe8YByU7AeYk=
X-Gm-Gg: AYBFou1LW4t5dZCSXdMQQMOy+ipNPLV6OkFCoIjxrc3g975WmR+Vn7e3mYDwjUaHxzK
	eJHGMdce9wJk9IoMAGVA/uNXUZuYjMFvIp7DV4EgabExr0vqCu/8WZYpR/xe4YNZzDVob2Tdewr
	JBe9/xFpVJTy6SUjOatWfSvKXzkSb/9+JJtV8feIyB+otGUTQPfrDftFitilHzjiEDOTg2v4A/Q
	jNeiFXeGOZnM0U4GbnukJJ82QldGfIF6gEBRudR6MIR/NsovFoqXl+b+lFUvBR6oY/8tDQ0RRnn
	fD/js4hgNiQIT1BjS2jq/jtJT0tMyHiNbMiRN1TAol21PL4d7x6UfE+fbYW8Mb5QPnnPU81HbCD
	heFwMHswq9w5CgOkWHdtqdkwzMSd8XWy7sY+untEreVADouXYKhJkC79kpP7r3al7ucPOtwkYGB
	bpysAcMluer4ZcpTv32ijUTbO0yFlXr2h9wq9GG2Tw93j5RMn7vGz5C9gkCn1xFCQ0MLhXbHVff
	AZWI8e53Wr5n5Mg7G3IPd1NoVLC5QCIC5OrncDDVUqIg/19CWJFDb0zvnSmjsGwT+ecgG4kcXF6
	sNPi5Ztpli7ac8t3Y6SzW644z1WttCOsVg==
X-Received: by 2002:a05:6214:2a47:b0:910:706b:6a73 with SMTP id 6a1803df08f44-9121206f50cmr172281656d6.5.1789272642083;
        Sat, 12 Sep 2026 21:10:42 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a780sm61544396d6.10.2026.09.12.21.10.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:10:40 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: chipidea: tegra: disable runtime PM on resume failure
Date: Sun, 13 Sep 2026 00:10:33 -0400
Message-ID: <20260913041033.25144-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_usb_probe() enables runtime PM before resuming the device. If
pm_runtime_resume_and_get() fails, probe returns without disabling runtime
PM. The later error paths reach pm_runtime_force_suspend(), but this early
return bypasses that cleanup.

Disable runtime PM before returning the resume error. Do not use the
fail_power_off path: the failed resume did not retain a usage reference,
so its pm_runtime_put_sync_suspend() would be unbalanced.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 8b85e11c1a7a ("usb: chipidea: tegra: Add runtime PM and OPP support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f..26225b034 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -306,8 +306,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 	err = pm_runtime_resume_and_get(&pdev->dev);
-	if (err)
+	if (err) {
+		pm_runtime_disable(&pdev->dev);
 		return err;
+	}
 
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;

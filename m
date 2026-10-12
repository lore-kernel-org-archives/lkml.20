Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841E4AB1DD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821610; cv=none; b=ANC9MCtwMiU4dR7vRi2OnKDJuK1buZuPMNad73Hh9VEGekWqOAxom9WRwEVTzGJ88ZVAWGjPC6+Wzp5Yd55l96zVOyYV77FICxvl+aAw3t2E/0nDVmiu7wSrR3QOSPzio9kj1q/BJfwPor+/nr4zudhZkUesivOoCsxsT1Bzpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821610; c=relaxed/simple;
	bh=RgV6tR5jcQa2cdmmaHtcrqW8KUs0QaaUYSr/3iY5+5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sIN+Zr0kq5jaFq65vtS4HzOpJ6tlf+xVHw3Xcmz4/xhjFDjUL8nG06YG193tjC1S3OKvzdjdiU30WH2NMnIjfEwSvi3NODkUoIwIn8mnEoEKZQojdJTcxlK+l9cB0B/nFb74sw4QWLKCPyyr1f/t84xV1ZeAvIfrzIdCoaHb26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XF8gVgI+; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XF8gVgI+"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so3797500b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791821608; x=1792426408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5arXL8FFSiMk7enaPI4H1eACN8f2tsnY0z06uFeb7M=;
        b=XF8gVgI+QEDKWvu3uaQmM/0jmutY2CQOwmcCoo8Y34D/enk2if9SVN1TcjsgGMH3c7
         YtR+J3EtjsZkxBwfQLdpT6I6sNvzGpjNHlQDNYkUKEi73hpKzDPwSPoGtOq/NK5+jO/U
         ZsjbfxScRhwodWUfC7tpnpzBoffLw6taRpNH2mPwmQ4ymItguA7Yz/vaf92z/MlGkKxa
         ln6I5pzKHPFkLQvqCLP1oIOGNcwlhFcoULgvRXd3ml1ebE2F4XbxIOBCEw9i4CXSpFIx
         1kyK8MnaTcfXeLGfds5nZvTUnUoxvZNLsUMqP4EYAniZL+ru5BmfEpW9nilCXfnaVfi7
         i2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821608; x=1792426408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5arXL8FFSiMk7enaPI4H1eACN8f2tsnY0z06uFeb7M=;
        b=wcv1iW+sUqfzZlM8VPB79CZENmGLh9l/mkRrqiZHTcmaJKLLJCrWskCvNR/Morl1XK
         lFqk0srHv2pi5dI0wC6lDNNuF7Mc9exO8Ca0n1ffZWQ9OSkj+WGjiUfIrpKQ+05UWssW
         6ddMMa5bZHlfuiwyp+i+iesPFMFPeLAwQY3HHSxS/uCuyN8PzWpLYW75wfQq4myp2NpV
         neIthLS9hJjPR1BT6sJvUUDVP9ByweFTnCOnbdHxhPudTMeTkuEKQvs1dIfmMjs91dpe
         Kct4w9KqykeVrIkUWXZXkg8lZ+G+/IWPlqmpFb0Cz3GXECoOOMsUb3PTRYMEh0zOrMpg
         qJGg==
X-Forwarded-Encrypted: i=1; AKwUvBxaEAhz9REjlvEtiaqxTWLlqtGnYx/R6OQ+oofrGgfQGmNg9J6fja9F9zM60kGWkQCwS6OqjrlM5ikf4XM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8viLP9vrJ1UkJCY62W7XCw+Zu8T/veDKB0g1iCQ80wu7ZSt5g
	N/fP+PzZlqRfv2/HHJCFwXWBy0tsL0rb+x+l8hb/qMomhfg3AzRtxpDUyG+1RXbU253UpDtDHvV
	Vlh5zTdwq4z3KxGsoNKt01LI9f9I4fmwWZA==
X-Received: from jaac27-n1.prod.google.com ([2002:a05:6638:c75b:10b0:60b:13bf:fe78])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f0a:b0:4ec:7639:2ad with SMTP id 5614622812f47-50c52471170mr8154333b6e.13.1791821607672;
 Mon, 12 Oct 2026 09:13:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:21 +0000
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012161322.930099-2-johnsingleton@google.com>
Subject: [PATCH 2/3] staging: media: atomisp: Remove extraneous dev_dbg
From: John Singleton <johnsingleton@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, John Singleton <johnsingleton@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove dev_dbg calls that (per checkpatch) are duplicative
wrt ftrace.

Signed-off-by: John Singleton <johnsingleton@google.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 2 --
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..a7c28c261320 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -262,8 +262,6 @@ int atomisp_reset(struct atomisp_device *isp)
 	/* Reset ISP by power-cycling it */
 	int ret = 0;
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d83c967fd125 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -345,8 +345,6 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_read_config_word(pdev, PCI_COMMAND, &isp->saved_regs.pcicmdsts);
 	/* isp->saved_regs.ispmmadr is set from the atomisp_pci_probe() */
 	pci_read_config_dword(pdev, PCI_MSI_CAPID, &isp->saved_regs.msicap);
@@ -400,8 +398,6 @@ static int atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_write_config_word(pdev, PCI_COMMAND, isp->saved_regs.pcicmdsts);
 	pci_write_config_dword(pdev, PCI_BASE_ADDRESS_0, isp->saved_regs.ispmmadr);
 	pci_write_config_dword(pdev, PCI_MSI_CAPID, isp->saved_regs.msicap);
-- 
2.56.0.385.gd3acb90ef8-goog


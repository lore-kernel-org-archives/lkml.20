Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413E2EEE67
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655236; cv=none; b=lRRJkOQ2hyBmovL3aL+ePGfWjCKktfpyMZbCKqieBzqLP10PIh8/ZQbOIGsBKobiLo/Ab9Nb/1Gs57L/9cUaGpSL+J8GY3hAtVK7MbigmjSQEqel5obH40Vj5zgkjdFYGsL3EaNNIy6xFjYiPFCgCCTsvDw6hFT01izyAYFtGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655236; c=relaxed/simple;
	bh=nq2M5xW2fxIZLcvXpCROZkWVmTxCmiexhtFVPMX+4E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eE5Cqtgfo/iwOVCDOEAhFBoZbc5ttHxwqM0zAf+9s4UD8ZiKgLGSyXLRRXiKHYCAduTys9MK3/lKAnne3NlgEMOAXwV4ocN/XLhx4cBrXBR9ZrhLVVJUts5tnlPpGkp5oOpjoc5Fash92GR8n9PDf6+f8Rv9eJJmfQ53snFLwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net; spf=pass smtp.mailfrom=voidship.net; dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b=YpXlvaBC; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=voidship.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidship.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=voidship-net.20251104.gappssmtp.com header.i=@voidship-net.20251104.gappssmtp.com header.b="YpXlvaBC"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917a97b39e8so13656246d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=voidship-net.20251104.gappssmtp.com; s=20251104; t=1791655234; x=1792260034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC4wjVkYj33ouDrpIw20yvXN7Xm00WRsU6XHf7agKPU=;
        b=YpXlvaBC1A5EKqmYm0q/OIPNzdVvbAMR+XAou8fr0GKQ0C4puZKgyltoIuMwg18ZKB
         nb4O5PjrJsm/8jLycysEoXaFEY5xKjTJBMGS/n/P01gXUrxvucQHWDJ/wudDTpAT5uC4
         0x6PQY9ZIvIdfYUOcry9QAfzrzxp0pca4UoimtKLqeb8kiBChYNwKoef0oIp4o1WUpI/
         2DmpUZwYlY+gRpzU9vrUkK7YiPOkzRSFGs4StOLuQlX1EJkjmpX6C7blKmusgUQJ/KRC
         Ifj9j0xLcxJIl4rajrYtV9Jh7SeDW5h6bNp/oqaEb9HTYgpPn1vWV4wSeYWry2T4slvD
         XtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655234; x=1792260034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NC4wjVkYj33ouDrpIw20yvXN7Xm00WRsU6XHf7agKPU=;
        b=dG+w20VFMSMcMrtBDkJXIn4QsB24EtUczvwAtYHFnd+LoPNrX099mr6oP/mQabMmvv
         aithl3QmmeFqOXe6Nu02T8z7EW6CBU5k+f0zu4wnUQe6e2WphzKmQGlL6TpDTo/JnQYc
         /zADqJzd/5LH2/0QC2kvX3tsmi3tNDvONBg7FACKGLic4+XcgTxoJiS0z1ykUxuaDQuN
         etzWpQjWjMZ3YivHeCFBCExV6ZSV5p3zBT6mM3F0tlUgjLN8gxjN+cRYQkRbcsNsNUS2
         ZKeinVXx/NvM7W3ZgMmTNV/uXQ/kg9BGkxPuAL6SkMm6fKN3aj9a7NdqRRNDMlBN6UgB
         syPA==
X-Forwarded-Encrypted: i=1; AKwUvByrnT3S7IWM2JcxCn6aIAPHlXS/kSAEggVZpYpGCR9fW0/GrN3kFgZLwcm6z9GP5owjIdR3HW6u3SQmLtA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgIBdjHv4DRsf/TQ4HCUlZwEsVqyOlrrPBxaOGZFkmfIPu7sid
	oCoMcim+glmaQYr0/iZjpb+SnatOY5rlhAxYDiYOUOuiazCaJGsZNQgJiDW+nvrZhcg=
X-Gm-Gg: AYBFou0ZhSqZdfvidM3d4VzKJqatBGx1MYstWp5r3GDm0ZuOVqtRPOV/ZBltmd6Kr+N
	4gkVc6Y1JURTRXlzRsTwNWUXbuzVYr/s+YsslW31HRIQTdjLpjx2di8jM7OZwR0SKUz1UAfKTJx
	wTCVCXMz7oiZxTqENcRI6GKfZlNnhdOIKQcPEoWT76Ip5p3zUbQ39+7g6BZtxKso6QU0szvdEGJ
	kyiEbB56CIVQqvWtPqPez3aykqMVBj55o0Aw18jhXs5SNbfCHIvjJcCWhIFQAx2nst5rnuFIv7V
	JwfWx9M6vHEhtpEQtW3zv6iFEnFsY0o9yzgnyVNuiU/qMIC6BSiRVG8+Uahoggz/gbvSTFIqQV4
	to6ykKkFljIPp1eDlBin0aeTC8lQ56ALRIw4X6igfhHVaEFc9sbNlsmP1a9X8LKTHvtYlW96jhd
	7AvRVIkf42LTWZ3dUb37rIbNdh3ul4CjJ+8WcKjpzRdvx7gNSumDu8y/8bs1iIxNaC+weVHWqR2
	3sxo/fpZLVHr8FeO9BtLJOCX1CP1WEaaf76gjBD
X-Received: by 2002:ad4:5c69:0:b0:919:8358:a18d with SMTP id 6a1803df08f44-91b554c3186mr100818906d6.13.1791655234205;
        Sat, 10 Oct 2026 11:00:34 -0700 (PDT)
Received: from boomzilla (dynamic-acs-24-101-237-49.zoominternet.net. [24.101.237.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550175e3sm50339326d6.11.2026.10.10.11.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:00:33 -0700 (PDT)
From: Karlos Abel <kabel@voidship.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: discard pre-registration events before attaching handlers
Date: Sat, 10 Oct 2026 14:00:30 -0400
Message-ID: <20261010180031.7-2-kabel@voidship.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010180031.7-1-kabel@voidship.net>
References: <20261010180031.7-1-kabel@voidship.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

input_event() permits drivers to seed switch and absolute-axis state
before registration without delivering those events to input handlers.
After event-buffer allocation moved to input_allocate_device(), such
initialization events can remain queued across input_register_device()
when the buffer does not need resizing.

A later injected LED event followed by SYN_REPORT then delivers the old
switch event to newly attached handlers. This was observed with the
initial SW_RFKILL_ALL event from thinkpad_acpi on a ThinkPad T14 Gen 6:
an LED update replayed the initial radio-switch event after registration.
Registration can also leave a pre-registration timestamp attached to the
first real event packet, including when the event buffer is resized.

Clear the pending event count and monotonic timestamp under event_lock
before attaching handlers. Keep the switch and absolute-axis state that
was seeded by those events. Resetting the monotonic timestamp follows the
existing flush path and lets the next packet obtain a fresh timestamp.

Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karlos Abel <kabel@voidship.net>
---
 drivers/input/input.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 01c91fec9..d59d62caa 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2445,6 +2445,12 @@ int input_register_device(struct input_dev *dev)
 
 	error = -EINTR;
 	scoped_cond_guard(mutex_intr, goto err_device_del, &input_mutex) {
+		/* Keep seeded state, but do not replay pre-registration events. */
+		scoped_guard(spinlock_irq, &dev->event_lock) {
+			dev->num_vals = 0;
+			dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
+		}
+
 		list_add_tail(&dev->node, &input_dev_list);
 
 		list_for_each_entry(handler, &input_handler_list, node)

Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378533A7198
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764226; cv=none; b=mbE8hqKgW7s09vyG7LI06s92phn98+gabkjZn91b3DUUJZDM4t9urIWSFXSGkc2LMiNSAOCAmJKHGrkv7VG4AmPLst4YpTBdgbvzicqoN4tSO2IoSToI8Jm/DzRDBd1UhZfE+D6BN66VjMX0gqCMDXv7h/zYJZuSTn5l+c0GqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764226; c=relaxed/simple;
	bh=QYrM5bombtdqdUiPNNu3n9bu+emhLEXcJ7OMkYD/ksw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OmvdDiT0itXe8X2eSvWUu8vFqVcK2d4Y/maCkt18XwJYnTnY8AatyfJbSI2UZearJNk1Whws2/WZR3r7q+B5++j0NS9eZBc1mNxounWFztAx49yXUUp7LXEf1p4KWIxiKL8KJhZxA2uGxoh36IWbIEigTO2gnVDawlS0WgfzU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAaLhmAX; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAaLhmAX"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc328b43a56so2620173a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764224; x=1789369024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAPU1CX8Iq66BEpNVJ2vafgQDXa83ebRjQ938YJsxwo=;
        b=DAaLhmAXPXt3OTdc6vQmnWhKi2hncMmWCaUhfZMeUloinzENm2xBTUNDLElkU5aF73
         Cb7R+Lw9psfdpuoUizFnehVYYxp7mzIooa7SjBAVl4R8BCct9arLZl10n4JBfpgnAkjS
         cYSLf2C757z6ZX4iZ17Wk24ECd6cp2s4wlMasyf41SVGq3A5hIepTtWVjKEkY6VmNU9M
         caWfO/bRJMPlIC0hd0S1EtUcKAbOj1HrGWGZiSDqSepQ5ENGdGoxQ6FMUYaPwNaPj+NJ
         nHKGOxU5Nh+2sVWT9e7Z01BnFLofE4LhTk97Jc+m8SrtvB4MlA7VaiDZtFbbwExAipro
         BMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764224; x=1789369024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAPU1CX8Iq66BEpNVJ2vafgQDXa83ebRjQ938YJsxwo=;
        b=b01sjSetdkASnjWFSIMR0I28D2nW7xcir4Hb+l26YqsiwurHewhiG8ed//6RreZKrM
         3zZOYhwmitk0MzXVcqkqy47cCZFpKuWHCGHcS8pHpbSF8HH7vYBWQclxMqMF/3Jwbp5B
         RwfFl9x/XydF086Y3UFr5wvIikbCh0dajo2GNfnCHyG2h9sZE8JwEUpyHDE2jXhBQCS1
         KBT/3P4NdLsw6OCKCOQW2V/5qBlNRRXV0fQNP2dzNMM3ux41xuz4uM54wg4ZxsdRkHIR
         8Cpq9KKh3zQsdi5ZsDgEnbFdSDSHj1D4kecRyk+5L+69U+jmYvfTsrG5p9VwMOHoHUpA
         ThRA==
X-Gm-Message-State: AFuF++nh//Ddqgwgk/ov/kbufL8mMAzalPWZDfzxfNPTVJVUKYUzHA7k
	cPZPKRIjUyifHN60a91k/+GwoNKzfL3bJrC5GiSH2IJl0nVBEOwYcg38
X-Gm-Gg: AYBFou1+WjX+Mwnr14+ErE3VznRPD4xl9VZNkcgG5sLayI3t3grwFLRE7Tz4Ifv/qes
	LWK09nbXku9DQl0yi48NQl/AP/dsgkATfnw7i11RtjcY0TXFim/b/M01Yz1M1Igqm3+76MvcNQJ
	tfD/k+HXOQ8k8IlDYFvtjviPA+oKO8Ml+jhtwqWoSxCZtxcaIYa2/gccUokQYl6zsohn9mliqP8
	JMUQUW6Bc+hfOy0z5+n1ukvBltXml+v9f0AZTz96P10jvt0S5+DlV6YtAZG33Zu3Nc4KCMj1BTB
	XrKi9iPDKGvWCHKzCUMXPNuS+aAWmFDtjAV8oNqu2bdwsw8h2D0amJ7Ta0btU33zMz41zD7OX6k
	GHzW+FCih+aMLpX45Bhbn+tvDcCQzfk2q+aunDtVCbhlRaSK1wHFyoeZ0nMoOIXMy1o4vgAzozm
	kmCVwQdKWGKQfy/htFNoCYYdgzbEzocxEADiK6ts8aCs5EVBXGsAVrE3XZfsWcQmuGc2xfSu4cy
	NrkBZLgAmF8EQ==
X-Received: by 2002:a05:6a21:487:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3da39b44dc9mr32709277637.2.1788764224500;
        Sun, 06 Sep 2026 23:57:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm28777832c88.5.2026.09.06.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:57:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Talel Shenhar <talel@amazon.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/14] irqchip: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:26:59 +0530
Message-ID: <20260907065659.12034-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-al-fic.c | 2 +-
 drivers/irqchip/irq-gic-v3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..760317db9dba 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuration is
  * to be determined based on connected hardware to this fic.
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..69ca208eeee6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >= 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;

Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926731D366
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978108; cv=none; b=qgquAeMablXju42WG+VhdVMTVcyHPDZwSMn8gAI9m9KsVDkcJpToKSPPPJ3IdYv1S/u8Qqgc4nu8Y1RreEYTO5Cl3ZU4WoheLDOmPUjMflb5fWwNqfvTqCxf6P+RQ6VHSuefDGlS3LyrAykfU1ikNowdwWn49BM4UTnYpmwJKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978108; c=relaxed/simple;
	bh=EhqcVucYSakqM14c2cM72pxGNwF8rHEoxZY5/G9rgTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSkZokgPqUGHMd5Ey1NvFPVqCPFraCLP59KsR2ZFNsZUeSll17qrHLIgX3kiuSUPd0Uf8oMYohAb1Sz2rYXmQ85e1tapPQBJlzLziaxGPYkCogRzZMHlsDF/oBiD2sCGRTmJLwFwTknvYpawI3frb136Rib8RM14za7QTMgaMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSrekQ3K; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSrekQ3K"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so171165ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978106; x=1791582906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwlbxNoSoLRMmJKLl4CKJFzcuVtF8rGKpkUB89vx4iQ=;
        b=QSrekQ3KSP90ReN5/lR1HWMhenlnpgaWUtts+UgcwaBH8bLNKXdBY4lM+4TjhzDQeO
         BrOnsCFHBM6hAZADoThwu5wULC7BdtHS6PMXuM0D9s5KGm6kXu4BNXMda1npK6ak2qti
         Hqm7xX90kPANwcJyZmrR0b7vsaJIgPtv0IOs77JcI9uqakuzI2Ivf8YXjfVwLc3gOIgN
         y2k2k5MZS+fZE30hhkko8+822lAR8IsCxUsrkSLPyCYkJs68fLP7cntk6/z/D6gsNv/D
         I8aGfFyUVh2lQe5SlSzKlt+UXubbuNFNyEfl79kV11TSJ5QEL6DZu8Ulrs4TWs1l+Pwx
         7tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978106; x=1791582906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwlbxNoSoLRMmJKLl4CKJFzcuVtF8rGKpkUB89vx4iQ=;
        b=i2ewyvvbhqnwUnGdmS5b4b5FHKiL5Xjws4DmhUIunjzBxSuGjDcqFD5wy7L/P5ebm3
         icouTgIcMH4PvwW2y+agduaFVKB61AVyaBk3sYLEcibt6oWlyrH7Ac+VSbg6sfyXUF9k
         8jBTQe2yT4kR1c2MkS6QO8QD85pom7/pKwr2rRsAt1tcm0Gm0mrvhD3sOJTBhwAyu+NA
         4ra6G0ry1aoSNhkhTAGR49EcIjvjb7Y5cYZMTjyn15SR5bFFYhWlIzKw/2LqMj8mJxfB
         lCCjvIvkqiECuI3lthmoJYCD174hl0FXT6Ri6Y/0a4CupRZlp5Al0KV7Lx3pI5J/dyqd
         kt7g==
X-Forwarded-Encrypted: i=1; AKwUvBxk5WwCkMyqnGnUnexrAURrgFpwIQKHl1AUFVhAj/G0XLT0IEtHuZNyiKrYmp74M2xKhAM5E4vPAk+S+Ss=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVrdo0WyMrciOppN6CzEHSDIB5Gh2VMcAgGs4a6zfJld+/iBNZ
	xzjoIsO0LMLyurtWx1fxalfw1C+KQqirNdkandDq8gqQoH+LpHN2VALN
X-Gm-Gg: AYBFou1nlrkZoSOZLTSFjbeOkg6yN3VPm/H0sHgb8XqwIN11eOQcH3urZEeQa4UBR5Z
	FhnhpYkgIJnwRQdpjKXtaAQuIM8bgWEjHWiBr1mH13svG0iBVmjeEjkQj1GbMBkODfhZVPNz833
	w8KQMvLkEhZkjgZyi+qnREnnI/43W8i1wJrJNMGXM42w7WEFj4oKqCxcInejCJBGgi1YcIO8F0D
	gqOMEFp3STPiuNfSMOII383j660KkIv4z+xb4Y/ZQW/F8vgl3RhjhDpheK7LVhOXod46SzFHaYg
	SYDSm/eb4t+A4soshxU8bYiRJin8xjdbphCF+BZ5v0G1TSSwc7nGtK0lOGU9IEweXPJ2wn+7JiS
	T4iNUoYQSfd0VDgzvRGuYptoiJe9hZsY/S7NZiP+otsRLzTX7KITjdaRZUMsTrk7C1PiDDmX6O2
	NeI6BI5z02gG2LQkUQLAK3wHDAc6oKP2FuSm1GiLFEVd9siUTu7jH5DsFO7eRquAVzt+UhLxyNo
	ZdrbNnaOtD9W3OYj4ICQT+NC+El/4Gxi9nJZxa+NJaUfwpUZkqf6H9CKds5nerSTK54OTh6qk2o
	uKkVlD1jISUcBeUOzuSM/iWVuDaBaeGVN4/YmxawQROvhdQ=
X-Received: by 2002:a17:90b:28ce:b0:3a0:b40d:827 with SMTP id 98e67ed59e1d1-3a6f321f4b9mr1342400a91.0.1790978106232;
        Fri, 02 Oct 2026 14:55:06 -0700 (PDT)
Received: from 0xiviel.ip (122-63-128-121.mobile.spark.co.nz. [122.63.128.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4a1bfesm185515a91.12.2026.10.02.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:55:05 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Lizhi Hou <lizhi.hou@amd.com>,
	Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Max Zhen <max.zhen@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: [PATCH] accel/amdxdna: document trusted mailbox ring geometry and drop the power-of-two check
Date: Sat,  3 Oct 2026 09:58:14 +1300
Message-ID: <20261002205814.178031-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com>
References: <67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mailbox ring buffer geometry comes from AMD signed firmware, through
the management or mailbox information block, or through the CREATE_CONTEXT
response, and the driver trusts it by design.

The power-of-two test on rb_size was a firmware debugging aid. Nothing in
the driver derives a mask, a shift or a modulo from rb_size, so no code
depends on the property it tested. The ring index wrap is handled by the
explicit comparisons in mailbox_send_msg() and mailbox_get_msg().

Replace the test with a comment that records the design, so that
automated review does not flag the absence of a bound here again.

Suggested-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://lore.kernel.org/all/67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com/
Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
The pkg_size check in xdna_mailbox_send_msg() is left in place on
purpose: it bounds a driver-supplied size, and with Max Zhen's pool
patch (20261002161122.1350075-1-max.zhen@amd.com) it is the only bound
on the write into a pre-allocated message slot.

 drivers/accel/amdxdna/amdxdna_mailbox.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 05c3786de135..c4a36858668f 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -513,11 +513,13 @@ xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
 {
 	int ret;
 
-	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
-		pr_err("Ring buf size must be power of 2\n");
-		return -EINVAL;
-	}
-
+	/*
+	 * The ring buffer geometry, rb_start_addr and rb_size for both the
+	 * x2i and the i2x channel, comes from AMD signed firmware, through
+	 * the management or mailbox information block, or through the
+	 * CREATE_CONTEXT response. The driver trusts those values by design
+	 * and does not bound them against the mapped region.
+	 */
 	mb_chann->msix_irq = mb_irq;
 	mb_chann->iohub_int_addr = iohub_int_addr;
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));

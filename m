Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B524E36C6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556536; cv=none; b=RKzB9mAoJViO9y4BbR0Sd7eD5GsGM/rNbvxzPnkmBUtcTldA70fkBt07Y00SiDWaRMXHf6pnyInOBN7KYLRWcLI9ZFMUipkFCvpR66k88C7sgC+XEi56HwLKbC794IYSMvzWfi0xefkqrtAS28gWXXWCekq2xQ98VrTla6fEXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556536; c=relaxed/simple;
	bh=J2f0V/EClIlA2WPD8b6oppOrlSzeIDKH7aeM7FWVeOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIFomIcSNJkhiK9BAwKdP1Q+sav6rh2/MXxPxvpN1b0Efmcu9vXIoJd/5CAOKVmKvChL8rslCnWbe61TvaRyWuxzC4xYXdb/q5cszmfMiIy2ROljXXfqvq4Oq/K7wNBnVmbJXSz3SOdozCf1/0LnGQkWGHBVn0pbrSlO/665pe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=IN/6/uqB; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="IN/6/uqB"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5352a876d5aso48359621cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791556533; x=1792161333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGO0sAofaphg39YrktW71GdT2lnvXlH+hJNivXpF8AA=;
        b=IN/6/uqBDZ21rPSNcC0Ix2/4Lm+ee94Y2m/BSeeZnGiAi3YptWzJyrRPuROpBMaMkm
         QED1KBe+I9I1ub6foKtxtr3XHXM9NqBfQfulfsxXNUX2x8qw90bo9s9YfW81JVMPHwvd
         joI0PTAwdA2O9KZ0hgCY1bDSm5Tl2hLEajuP6p0lswavgjJwfqSvs9jbCuOvZYSVBTfe
         YgL5eg4STzYmZvCCj3BEg520VI+qlFTaMYsRSBC8eVSjk7o0Xsj1rqQGjTud+dmLUFk4
         KOJvAnc5Cl2dYPP7XzSMUU1kjj6LU5HGRalLTtpFpzBa+Dpaao5+4tOkcagL1da9KOrb
         5u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556533; x=1792161333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGO0sAofaphg39YrktW71GdT2lnvXlH+hJNivXpF8AA=;
        b=RVeF+F7I/2N/oy7hJfVVmbPNlhHGvNqP2sNceHAT37Qtyoa6A2/Qn2xFwUIf+ayu4G
         hHX0thEGmzq+oHL/k9swPyrn3IjBt+kBfavp/GBJjafQK26tRE6CWyjM4TkuHOUTxiNG
         IKI2PW6Di8tq/grxPLcFXhqWThN3qy7qD6jZlOZno1idvMfu03zae2nE2/yi31li37XF
         xu8b+CcilRDQXDkidFg6KGN5mNKwl1HR+IMCktqMH0vXgfLoKygrPXFpxiYh2/6Hlt8k
         eog4+iOHFMoSuU6krnjYVmkSxT6vFyr2zNK9lgxbzA6IbQJkQdkWV6+qYzgX8s6QmMAs
         6G+A==
X-Forwarded-Encrypted: i=1; AKwUvBwvJAn0C597X2uu1WzN+OfR4vvPVyui46BPwI7BlRZm06HCUbukxDPnve8goiXZ4soFggjhOe07xPynZtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhCzTWr4s8jWJY1mq9bpKJhHsKz8jjDpYJKUAV1F/4ChfMPxCo
	8OJ1TwOrgS7jT0aLMw/ZIWEEgryOVL/OXsIRwe4mhmApfe7sJfcHvRmZ2uvDQT/SGA==
X-Gm-Gg: AYBFou16DIT9m2MZ/zVE5fVmDzY6/+wp9BBaDaT0QfFVFHS/ckfevZF1GxqZL+o6cIO
	WMOSiQ9aHtybs+7SsBASIW3o1fINrN4wo1l/xAXy9dkGPsb2bOfxPBZ8EwtKrUN5x/ecWUFgYhS
	ivj/yI9tfE/IVO1CTicS08vTBKk5pKMokmP5LujNXT87W54XEJhyhGkrnQZSRoV0uqEBOc67g7K
	ut9tlGkPUbro5kD0Ea6RmaPutUNG5OrTHn7wJe5/6J+CBi0+RdDLgoXT8SQbQDf/Zg6DHMJjhfE
	n8DHIaOQt0MVtxfaH8yJ1bJTcJfw8uowBldixYPIj/onCOoOuP925XdD51iCgU4p5whW65Lh1rf
	pfSKJ8dGi+7UqXxSIdVX3KTrqiY4ql80nWs038rozTKaPDKd6k3Du9ifstbWdRmoon5yfQZCmPC
	Tk29EOJ6mPQuKh3R9n7cZzrVz168QYhr9U+inTCQlV4dkGuy7JNr26mHGk8tPL
X-Received: by 2002:ac8:5f85:0:b0:535:80b:9900 with SMTP id d75a77b69052e-5359fb8687emr27949971cf.44.1791556532778;
        Fri, 09 Oct 2026 07:35:32 -0700 (PDT)
Received: from cantal.lan ([58.136.72.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501751dsm19769456d6.17.2026.10.09.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:35:32 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/5] ptp: add functions to adjust system timestamps
Date: Fri,  9 Oct 2026 21:35:04 +0700
Message-ID: <20261009143506.2507607-4-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009143506.2507607-1-jjc@jclark.com>
References: <20261009143506.2507607-1-jjc@jclark.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ptp_adjust_system_prets() and ptp_adjust_system_postts(), which
shift the pre or post system timestamp by a given duration.

An MDIO bus driver can take system timestamps around the command that
starts a write, and knows how long after that command the write
completes, so it can shift the timestamps to bound the completion of
the write.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
The time of the selected clock is moved by the CLOCK_MONOTONIC_RAW
duration without scaling it for that clock's frequency correction,
because timekeeping has no interface for that. While the clock is
synchronized the error is negligible: under 2 ns for a 50 ppm
correction over the 30 us MDIO write time in this series. It is larger
only while the clock is being slewed. An interface along these lines
would allow it to be done properly:

	/* Scale a CLOCK_MONOTONIC_RAW duration to the rate of @clock_id */
	u64 ktime_scale_raw_ns(clockid_t clock_id, u64 ns);

 include/linux/ptp_clock_kernel.h | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a91059..b4ac64228f1 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -520,4 +520,52 @@ static inline void ptp_read_system_postts(struct ptp_system_timestamp *sts)
 		ktime_get_snapshot_id(sts->clockid, &sts->post_sts);
 }
 
+static inline void __ptp_adjust_snapshot(struct system_time_snapshot *snap,
+					 s64 ns)
+{
+	if (!snap->valid)
+		return;
+	snap->systime = ktime_add_ns(snap->systime, ns);
+	snap->monoraw = ktime_add_ns(snap->monoraw, ns);
+	/* No counter value corresponds to the adjusted times. */
+	snap->cycles = 0;
+	snap->cs_id = CSID_GENERIC;
+	snap->hw_cycles = 0;
+	snap->hw_csid = CSID_GENERIC;
+}
+
+/**
+ * ptp_adjust_system_prets - Shift the lower system timestamp bound
+ * @sts: system timestamps, or NULL
+ * @ns: CLOCK_MONOTONIC_RAW nanoseconds to add
+ *
+ * Add @ns to the selected clock's time and to the CLOCK_MONOTONIC_RAW
+ * time of the lower bound, and clear its clocksource counter values.
+ * @ns is not scaled for the selected clock's frequency correction, so
+ * the bound is off by @ns times that correction.
+ */
+static inline void ptp_adjust_system_prets(struct ptp_system_timestamp *sts,
+					   s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(&sts->pre_sts, ns);
+}
+
+/**
+ * ptp_adjust_system_postts - Shift the upper system timestamp bound
+ * @sts: system timestamps, or NULL
+ * @ns: CLOCK_MONOTONIC_RAW nanoseconds to add
+ *
+ * Add @ns to the selected clock's time and to the CLOCK_MONOTONIC_RAW
+ * time of the upper bound, and clear its clocksource counter values.
+ * @ns is not scaled for the selected clock's frequency correction, so
+ * the bound is off by @ns times that correction.
+ */
+static inline void ptp_adjust_system_postts(struct ptp_system_timestamp *sts,
+					    s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(&sts->post_sts, ns);
+}
+
 #endif
-- 
2.56.0


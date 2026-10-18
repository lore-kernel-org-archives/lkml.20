Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107803D4126
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792317807; cv=none; b=Hzakh6Dg1qoH0QRVmaKKPrZnFrAbUal0YfC96pqsLh7gDWXnkTdIBKZ6Tt1MKTiHlBKPHgMZ8te43YJ9N/aBvH4f4ufIfqdChpxVit+DhUoZ/PQ+Jv/mHmeot6os3kUPyVfd9YoVBbFYPY87UhFmEx3B+gzpTTLoaOOKpGf3iNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792317807; c=relaxed/simple;
	bh=NpdYtSBrRJxrOREsBRDNV5JvfePm0Q2kMSPpbu8ITaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pO1YTUrKQZc5+dJq1Hdrt+nR5lEqMqSqi1ukjo3QbzumId1B6fh0lpDDa1jnWBGx5zNjGPnzjEqxTJjX9/n5lWcdzzoToPUtjiN+WIPkManBhE8dv58kuMkPxNkiyHV8T7vc4h25WdcVeIh2l53cmtOPEFm2zX6wX2Op+Ze829k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=gDHttvCh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="gDHttvCh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a706146559so980433a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1792317805; x=1792922605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7cL8YMNwHTuC43AXTeWAqhgAVGbuenzSLvMBvnCuF4=;
        b=gDHttvChDVxh0mLn+YZQNbi7nRaU/IWd2vFSEcjXMl34DeztJu1lKsZ+mGXKvK1VAQ
         17SL5W/OGmX4ixY5Mxr5gB8vqikPveW92lpQjsKyXVMArBgRvuCxx53EtTZeERA08Fk3
         oo0bIdo4NJtTROHxqkrVntPDI78/sONotJecGJ7kQCtRuwA7RBhrtfYXd68Gw+LIAK/Y
         93XHXj3fqT5cAzXGWGB8PzizTMF0wAKcSeyhxYe4/PpwhyJaRN4nXOJLcimy/TeAyVDP
         6kA9DeWiJdVuwfMFeH6aVRdmiLx6kG0o9nNA43pWb94I9fWZsQisp4yqe09qQ8QAVeVx
         qw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792317805; x=1792922605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7cL8YMNwHTuC43AXTeWAqhgAVGbuenzSLvMBvnCuF4=;
        b=Lq54OYFiyIdosyXK0kg7b4RFd6+Qk2Jkl3FMAJRmopBveW/V/6xAo/MR0QVE86gPh+
         Ek8fzgU2E2KUTi+GWAAetSDlS0odNhVTvTO5/hFUFdb6a68Fky8hA0G1bnTFrKpBIe3g
         ET8jqACkfIcG4WzC3oJPJnrZQXpvZdQrXQkUyiK6j+OR6JMLiaUatOA4vDxtllpmvz45
         ZMvOf3Zn7tZ0/PyCMX04NcXBPvXTOKFUS/ZL7uJpnngYrcV1bzdCCISbb6f0RYMU73c0
         9GpCJgTFv+WPWHmHe0xz2dUqpDawJ5WfgrbCWTcj1JB9nd281yK1XcNmM8JFM/lsDIEj
         VjLw==
X-Forwarded-Encrypted: i=1; AKwUvBwNXj2HJydh8/aJ7so4B2GfvcnuaAyZ7mg6J1OVayfkmVPgBY/LlaOIQJ59WdBHwkLR+eczEET9Id+3Lpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYISkJvw6QMIqb+N6/o+Cc59AJGF3FxTipEcTyBWHQ6o9eHNbx7v
	IQX+WYQdmiJML2otUum6wQoX4nVe/rNtnsVTfJipP7qJfhWRhLTh9lT4KDTzSQRszQ==
X-Gm-Gg: AYBFou23EiCVuHcPV0KWFBrdrDb2sKKEM4hk8LmHhYM4PROH9CGwwpNCM/lgjvqulGa
	z4Q3IjFEYZaoTtXp7c//f5Ed7ieCkiDWqBSUkdP9cwQ3kd8p+y6rCWYK9Fn3/FaR1XkIYiKJe8q
	Jb4JUG9xq34mUs/+mz39Z/NnTLXB+G3KTd0jAX4T+wp0Cxm+cBBfZzNq+L+eFSszVM1dYt76goB
	pNI4oqsVAEJlZGtgHkK3MTiQBASokBtf5hd7atkSV8DfLkNmz4CYNdEt0laaOG/T3XL65zV2b3g
	qz8riKR2mLNXwltDWGZ2IM79IyTFv0KmfFyCBjLzAFOcJIBACLBZC1XAW588CWCNBTJwetO501z
	4Few4BBEy/u1YCmHTlu7bkF7oF5c4GBloOrn16SgiS9+7bjlvjy3tKSGiO1N5uG57K2Fw62lqPN
	jrcnmcOgCxfNHaGdJVP8WXk0PvtI7o9poppc913Gv3OkwXkP4peDw57nSrB1iJWTto0wU67wN5r
	bszWasEYWs2suifwY3bphsJ7Dha/0CGzdiQt5Tbd7H2tcsnwsPTooOqceeKPLY=
X-Received: by 2002:a17:90b:3c04:b0:3ac:acf5:6daf with SMTP id 98e67ed59e1d1-3acef667156mr4086665a91.66.1792317805260;
        Sun, 18 Oct 2026 03:03:25 -0700 (PDT)
Received: from cantal.lan ([58.136.73.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm16101210a91.0.2026.10.18.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:03:22 -0700 (PDT)
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
Cc: Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Hubert Feurstein <h.feurstein@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/6] ptp: add functions to adjust system timestamps
Date: Sun, 18 Oct 2026 17:02:53 +0700
Message-ID: <20261018100257.566267-3-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018100257.566267-1-jjc@jclark.com>
References: <20261018100257.566267-1-jjc@jclark.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ptp_adjust_system_prets() and ptp_adjust_system_postts(), which
shift the pre or post system timestamp by a given CLOCK_MONOTONIC_RAW
duration. The selected clock's time is shifted by the duration scaled by
that clock's current frequency relative to CLOCK_MONOTONIC_RAW, with
ktime_scale_raw_ns().

An MDIO bus driver can take system timestamps around the command that
starts a write, and knows how long after that command the write
completes, so it can shift the timestamps to bound the completion of
the write.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
Changes in v2:
- Scale the shift of the selected clock's time by that clock's current
  frequency relative to CLOCK_MONOTONIC_RAW with ktime_scale_raw_ns(),
  in place of adding the CLOCK_MONOTONIC_RAW duration unscaled
- Move before the mdio core patch (was 3/5), which now uses these
  helpers

 include/linux/ptp_clock_kernel.h | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a91059..b952744ff69 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -520,4 +520,59 @@ static inline void ptp_read_system_postts(struct ptp_system_timestamp *sts)
 		ktime_get_snapshot_id(sts->clockid, &sts->post_sts);
 }
 
+static inline void __ptp_adjust_snapshot(clockid_t clockid,
+					 struct system_time_snapshot *snap,
+					 s64 ns)
+{
+	s64 sys_ns;
+
+	if (!snap->valid)
+		return;
+	if (ns < 0)
+		sys_ns = -(s64)ktime_scale_raw_ns(clockid, -ns);
+	else
+		sys_ns = ktime_scale_raw_ns(clockid, ns);
+	snap->systime = ktime_add_ns(snap->systime, sys_ns);
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
+ * Add @ns to the CLOCK_MONOTONIC_RAW time of the lower bound, and @ns
+ * scaled by the selected clock's current frequency relative to
+ * CLOCK_MONOTONIC_RAW to its time, and clear its clocksource counter
+ * values.
+ */
+static inline void ptp_adjust_system_prets(struct ptp_system_timestamp *sts,
+					   s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(sts->clockid, &sts->pre_sts, ns);
+}
+
+/**
+ * ptp_adjust_system_postts - Shift the upper system timestamp bound
+ * @sts: system timestamps, or NULL
+ * @ns: CLOCK_MONOTONIC_RAW nanoseconds to add
+ *
+ * Add @ns to the CLOCK_MONOTONIC_RAW time of the upper bound, and @ns
+ * scaled by the selected clock's current frequency relative to
+ * CLOCK_MONOTONIC_RAW to its time, and clear its clocksource counter
+ * values.
+ */
+static inline void ptp_adjust_system_postts(struct ptp_system_timestamp *sts,
+					    s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(sts->clockid, &sts->post_sts, ns);
+}
+
 #endif
-- 
2.56.0


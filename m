Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCD54EECA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087320; cv=none; b=GNI1/NX26r+RsnrmCXWJEJhMQwl7Zw3OxsGHQHPq3UBytIWGL7k5oTU1OGB5+t3PvRInC23oxj/AdlNoatU3GUL+zgFpAEihUCXLMKXhzNgBnp4JGb4lR99gQFS9cgtEdwa4KJt2uIIOAjxv/BZX9tkWxGHCOthMRTXM+J/P+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087320; c=relaxed/simple;
	bh=L+4quM8DIZHcLp0rpytZsLw6+jjB2bs2Afpu5C94VdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csY3/vDIP746GQczSJavnBxq7LYj5U1pUO7vVOXP9gG7b4Fb6tnwBpRcbZNQenhBwC+pcO83ZtEDX90qkYpDqaMIp7teYQFBOjiPDjf+Xl0jElATMDkp3C7UoKiyYwvOd7ENs2j3TzpfrRBcNJlnaNft7xLPI5gdcPzHVORV1CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFcpiyz0; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFcpiyz0"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d7263f0cso264596e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087316; x=1790692116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2Bt2pbnVu/ApigQk0zS6acL2EWAE6Kw3ktFWRmRY+Q=;
        b=kFcpiyz0iNrUZNjoH0gTE2Q6n5rOgKW+9hgvkU17NQk15+hIoDafBOpyogzbFZ8mss
         FzmDJyEDkRuMdI28APMKao5qQx9idrar8jOaCsf7bWFVSxPsuEzVXlqMNLn1WGF/GQ3O
         O5kcvzmrRvUUromuSbl2xmnxqFKpiHbE8gaeBU3oiCFoE3Pb+DXtde1L7ibo8e6rrDaP
         LFKdwuKswVdJ3n1uki61zMjjHKDISgC89autGFMpv+zH9n/xoLpqo+jxZ4HKzJsuRtUs
         Rs/6Qzf72/ZUFA4UubQ1Dbr8vLcd12EvT5p28hXGQBG/4hwndrdWBq/qG5bBrNJtDijR
         eaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087316; x=1790692116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2Bt2pbnVu/ApigQk0zS6acL2EWAE6Kw3ktFWRmRY+Q=;
        b=DBhHifmR8ORegviFDO8qFqTdDI8cJ3tfVTYNoMbpURJDEN/yUcbq1pS01n/6benzwB
         IT0t4MmTtzSVSvf695MXMa9nfq4MX3kEfjrmp9ZT54PON01qEAJ8beoLHtAJfTZMyihU
         Z4IE1piNFE02K02K1KG1OGVNhonoqpsy+acSwVGRuIoy7DzMr12lvRz9d/lnXsfHLOHS
         aAFqyCEJoqb8WrjVgf5wksE5VDMyiRLMI+gPukI6yaf70yqwJ/U0RIdorSLtqTh4+WN0
         eZTwzdc/CK52MUNDKSJm3ttzuSOnI8u348Ze8xB+EqPLL7MTKiNhcZr8HCXSQIWO4zXI
         xCsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5cB0K5u7c3uilk889zn6EG/m3ylij0UtxJeZLyH+ZE0yu7aoYRqjFbwEDJwJ+1jX9n8GJVEnh7vooiVY=@vger.kernel.org
X-Gm-Message-State: AFuF++nhfaBCAm2+GwbXt/dhhFoFiUz68sE/+8SQ/FUknamEq357eBIY
	PXz5OTkWFXpJ77BQKbBoWcmnCy6B7hss0N23i/eUpHalljp1lz+tHEWh
X-Gm-Gg: AYBFou1EteLfQKUHAd2dLw/PtrfvBQS2GUHRd6SIPs0EkT2OWDMJoxEAI0F9v/BPriI
	CGJBd4arI2m3IYn4/mz1p67LxVnI/PDxgOtlCfzTVkZF9z1yEU96T7gxujHHmTYU/DoIWEnHRmD
	4HEVYGWXcobwxTyWNEJ5xJ+KCW/GmPqw/tIfIAS8/ACTUGCHMT5WMI9aNwDuLMTUR5Tr0jHXKED
	tsCeG39vYppkWyx5yPvBZC/TZ7jq6ACQYzL69/SkL6B17euBT7C0r+o7W7cpTodewC3w8y0dM2+
	9AjLj2t5yTEv6V++vTwBrXpEGwKoak0aKNLxpRYWyZ5cS5L9cazsGZ0VT/6PX/rjyeVb/YpRtsw
	4Mu/v6gDPvvKBJVjIh8iyfY0jm2a1Y8LIVM3rCTJq7+LJniWZDIVcYZeFFamt1QKmdZHV2FcaQa
	ge6sebLN1AAGFAWj83qwuV29xEfezK7+zzDq1p51Q1q2orbeSrFSEqSQSL2YVNyvyZGum25xNaN
	B9FJNRoFQxTAnjiG1X8Wmq8OzIVyl800FEkLlP5DA==
X-Received: by 2002:ac2:5681:0:b0:5b6:1a7c:30 with SMTP id 2adb3069b0e04-5b8c1859720mr5678732e87.51.1790087316034;
        Tue, 22 Sep 2026 07:28:36 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:35 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 1/9] ptp: ocp: move the CPLD identification read off the sync worker
Date: Tue, 22 Sep 2026 17:28:21 +0300
Message-ID: <20260922142829.57740-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ptp_ocp_sync_work() samples the in-sync bit once a second and emits the
dpll change notification.  Since the TAP CPLD support it also resolves the
i2c adapter and performs the one-shot CPLD identification read, and that
read can block for seconds: adva_x1_bus_claim() waits for the MicroBlaze
to grant the TMC segment for up to MBLAZE_RETRIES * MBLAZE_RETRY_US, and
the hand-back polls for the grant to drop for as long again.

While that runs the in-sync sampling and the dpll notification are delayed
by the same amount, and because ptp_ocp_remove() - which is also the
.shutdown handler - begins with cancel_delayed_work_sync(&bp->sync_work),
unbind and reboot block for it too.

Give the identification its own delayed work, queued from probe only on
boards that have the part and rescheduled only until the one-shot read is
settled, so a claim that has to wait no longer holds up anything else.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 2802989e8494..4a58bcc14648 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -402,6 +402,8 @@ struct ptp_ocp {
 	bool			sync;
 	time64_t		gnss_lost;
 	struct delayed_work	sync_work;
+	/* CPLD identification, off the 1 Hz sync poller */
+	struct delayed_work	cpld_work;
 	int			id;
 	int			n_irqs;
 	struct ptp_ocp_serial_port	port[__PORT_COUNT];
@@ -5935,18 +5937,32 @@ ptp_ocp_sync_work(struct work_struct *work)
 
 	bp->sync = sync;
 
-	/* Resolve the adapter here rather than once in probe, where it can
-	 * race the adapter's own registration, and read the ID as soon as it
-	 * turns up.  A claim can fail transiently - the firmware may not
-	 * grant the segment straight after power-up - so adva_x1_cpld_read_id()
-	 * retries a bounded number of times before giving up.
-	 */
+	queue_delayed_work(system_power_efficient_wq, &bp->sync_work, HZ);
+}
+
+/*
+ * Resolve the i2c adapter and read the CPLD identification.
+ *
+ * Kept off ptp_ocp_sync_work(): a claim can block for seconds - the
+ * MicroBlaze handshake polls for up to MBLAZE_RETRIES * MBLAZE_RETRY_US and
+ * the hand-back does the same - which would delay the in-sync sampling and
+ * the dpll change notification, and stall the cancel_delayed_work_sync() on
+ * the unbind and shutdown paths for as long.
+ *
+ * Reschedules only while there is something left to do, so a board without
+ * the part, or one whose identification is settled, costs nothing.
+ */
+static void ptp_ocp_cpld_work(struct work_struct *work)
+{
+	struct ptp_ocp *bp = container_of(work, struct ptp_ocp, cpld_work.work);
+
 	adva_x1_cache_i2c_adap(bp);
-	if (bp->has_cpld && !READ_ONCE(bp->cpld_id_tried) &&
-	    READ_ONCE(bp->cpld_i2c_adap_nr) >= 0)
+	if (READ_ONCE(bp->cpld_i2c_adap_nr) >= 0)
 		adva_x1_cpld_read_id(bp);
 
-	queue_delayed_work(system_power_efficient_wq, &bp->sync_work, HZ);
+	if (!READ_ONCE(bp->cpld_id_tried))
+		queue_delayed_work(system_power_efficient_wq, &bp->cpld_work,
+				   HZ);
 }
 
 static int
@@ -5984,6 +6000,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	bp->cpld_i2c_adap_nr = -1;
 
 	INIT_DELAYED_WORK(&bp->sync_work, ptp_ocp_sync_work);
+	INIT_DELAYED_WORK(&bp->cpld_work, ptp_ocp_cpld_work);
 
 	/* compat mode.
 	 * Older FPGA firmware only returns 2 irq's.
@@ -6046,6 +6063,9 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		}
 	}
 	queue_delayed_work(system_power_efficient_wq, &bp->sync_work, HZ);
+	if (bp->has_cpld)
+		queue_delayed_work(system_power_efficient_wq, &bp->cpld_work,
+				   HZ);
 
 	return 0;
 out_dpll:
@@ -6080,6 +6100,7 @@ ptp_ocp_remove(struct pci_dev *pdev)
 	int i;
 
 	cancel_delayed_work_sync(&bp->sync_work);
+	cancel_delayed_work_sync(&bp->cpld_work);
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		if (bp->sma[i].dpll_pin) {
 			dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
-- 
2.47.0


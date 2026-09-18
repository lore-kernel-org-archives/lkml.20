Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E63E5A19
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700528; cv=none; b=YtGR1bj+0ZqB9anmdhh1AKdsSJlCIHzPORXfr95VKFsl6DAPK3CYleiCnQVQvStVCzV7pjQHLWcjBuQeUM6QOvOWN08iHGOwbnHxkigMJWFNex8PjX5SUY32drFyrdLoFNDzbSM+qC2ASSp4s4IRC2Sw6TTVe9qvZCNemaGB7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700528; c=relaxed/simple;
	bh=5AdYSZFlM9mpA/HI3S7NB0TkV6f4XovkiyBzqzde/oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9xC3OVUYcmBOF8n+1vfJ08OfXVNhgYsWVabN9qIyLMeNZ2A2bUJPipf1ofgfOTjFETk+IxodryhErMIBwHygerAeW46RYVSHQY8IIQ/kdRUEqm+nvW0eBAf/jCM2qnTGpk3BgM4iHo1rTI9WovFVf96rwjTT/jCYvpFwcqhB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=E/SOupZA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="E/SOupZA"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so108584a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1789700520; x=1790305320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6X1MKF9iM/+JNuGTPcTXOfmgyWPwSTXzdW5BB/5bwY=;
        b=E/SOupZAQPei8zbJZP2BcCPFdlKjOj8FI9vbUjsCCnHwSzcfPN3QnEiXM/5Yrhzsaw
         1iR/ZmjPqzf02BVEQ59+jy25xZK0MoIAkfkgLzlifgEOV/2RVLGsAPRAda53rQ4Ag4xX
         ZAPzjfgP6yi7Jy3FKsgqTtQnOwd0iMPon0q40SARiIZKOZG1r3jMak/TCdkUvLisGBkN
         QWbsthF3mqb1MJCqjhd3NPcPa1541ftXsU/XJNQ0k0yLgtMojlWZVWL+lTHlUwWSet6t
         4P5NTnaOabgK5TciYUfdj9gQsbo1UMme+v4hNeLRnJjhkNHcxzZboIrMMU+eeTPO7W2s
         RC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700520; x=1790305320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6X1MKF9iM/+JNuGTPcTXOfmgyWPwSTXzdW5BB/5bwY=;
        b=Od0SIb9ma3GKCcpwDNLoeX2oCLu8O1RCTyR+FgYwxPWKHEcidtySxwhnyK9mTgmi2H
         kkSCEPlwPFVA0fUYvl4vCYTEPHRT9xddX6eQ5OiX4lLk3tboxudzKxNey7oF+wf6Zl8o
         xDMlViIelZ2O8zQPDWI7yORnMGTFIlkYAb+v1mT1hNLEVzzyficMtJJ8GgdD696VI/IQ
         KanMsJ1WWmrv5MyrWNBcNrX+dO6JKiMg4AqQN1KCOfPkMmcBDx3etgsGjC217D6McjE7
         sldMOAi2lhdg6qYFWb+sgbocaPvmZCbBtfQSmLacFDZAGwAu15LNXZenS1bH+8ypwNgN
         2aoA==
X-Forwarded-Encrypted: i=1; AKwUvBxkKMDl848PFI4w/U4wYLF5UkBRJ/6RQ03c6O6+eVEljZsq56bWameEeQGgdKEptubvItFZXcnDrDxqB3I=@vger.kernel.org
X-Gm-Message-State: AFuF++lksFup8U/x7R2XWv1gmhYm64BGyWqsVZueCWqI53Jw73SM5uJd
	R06ZvhuYK5HkKIzXSfqhnnN1hUk49D9G/P3dblfA5I+QPVLmq1Chkh4gMmyVy7SoNw==
X-Gm-Gg: AYBFou2nlh5xXnpTMet7jkcjpF31Z5CUYT4SOS/nCe3l0gSOX79aa8b8+3XBPRc9IXV
	GmyYeSS2Q2lUqQCMIi6IzYIai/+peMaF8oS4vtPTQfMiTEs6c4JEEYdwiIMrduI8mF1lrMUOqMU
	0Y0PUKR99DitJ3QrYD7Yv54P6JsupgDTYVKAjYpL4yVMtg8tyVGveejFphlM5X8Sycx8Z5tG6PK
	mwL7TA7ze2ehi0UrCc1GtJ0/f7rFZEztc7cSMkLJz3gofn1imIAgUauRRgr+WVgB6lU49gnhLMQ
	rgvPuvL0WiXpgI5MHvrHOA90k52m8KG8eWHIEX1IUEuJxhZqdx4JJ1A30dx2GD0egSggxHTICuQ
	UPHpEo4LSyk8mwsqPbSjDKx1+uFlZ6g5OJl5lyLGakeClnZ5oB0jbN0G1oa+Dpg9kosg1aWVIIh
	ls2FDZUOBIktZ6uGMxA9gP6HCiBvFDUpEIYtYnXFmtJf0r/O64CSktdqdc8C3fq3fdKjpEx7aNF
	2vC6yzr
X-Received: by 2002:a17:90b:3fcc:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-39e54d36eabmr2302207a91.4.1789700519688;
        Thu, 17 Sep 2026 20:01:59 -0700 (PDT)
Received: from mimolette.lan ([58.136.228.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a3e3dbcsm618906a91.5.2026.09.17.20.01.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:01:59 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH net] net: bcmgenet: add hwtstamp callbacks to restore PHY timestamping
Date: Fri, 18 Sep 2026 10:01:44 +0700
Message-ID: <20260918030149.80398-1-jjc@jclark.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware timestamp configuration fails with EOPNOTSUPP on BCMGENET
interfaces connected to a timestamp-capable PHY. On a Raspberry Pi
CM4, "hwstamp_ctl -i eth0 -t 1 -r 12" fails with "SIOCSHWTSTAMP failed:
Operation not supported", preventing ptp4l from using hardware
timestamping.

Commit 5062245a5a7f ("net: remove legacy way to get/set HW timestamp
config") removed the legacy ioctl fallback, assuming that all MAC
drivers supporting hardware timestamping implement ndo_hwtstamp_get()
and ndo_hwtstamp_set(), even when timestamping is provided only by
an attached PHY. BCMGENET does not implement these callbacks, so the
core rejects timestamp configuration requests before they reach
the PHY.

Add ndo_hwtstamp_get() and ndo_hwtstamp_set() callbacks so the core
can dispatch timestamp configuration requests through its phylib
helpers. Both callbacks return -EOPNOTSUPP because the MAC itself
does not support hardware timestamping; requests for the PHY are
handled by the core without invoking these callbacks.

Fixes: 5062245a5a7f ("net: remove legacy way to get/set HW timestamp config")
Assisted-by: LLM
Signed-off-by: James Clark <jjc@jclark.com>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index a2305e642..8ead37ff9 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -3712,6 +3712,19 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
 	return 0;
 }
 
+static int bcmgenet_hwtstamp_get(struct net_device *dev,
+				 struct kernel_hwtstamp_config *cfg)
+{
+	return -EOPNOTSUPP;
+}
+
+static int bcmgenet_hwtstamp_set(struct net_device *dev,
+				 struct kernel_hwtstamp_config *cfg,
+				 struct netlink_ext_ack *extack)
+{
+	return -EOPNOTSUPP;
+}
+
 static const struct net_device_ops bcmgenet_netdev_ops = {
 	.ndo_open		= bcmgenet_open,
 	.ndo_stop		= bcmgenet_close,
@@ -3723,6 +3736,8 @@ static const struct net_device_ops bcmgenet_netdev_ops = {
 	.ndo_set_features	= bcmgenet_set_features,
 	.ndo_get_stats64	= bcmgenet_get_stats64,
 	.ndo_change_carrier	= bcmgenet_change_carrier,
+	.ndo_hwtstamp_get	= bcmgenet_hwtstamp_get,
+	.ndo_hwtstamp_set	= bcmgenet_hwtstamp_set,
 };
 
 /* GENET hardware parameters/characteristics */
-- 
2.55.0


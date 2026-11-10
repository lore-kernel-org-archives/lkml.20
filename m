Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297521;
	b=muGGkobQ5IRDeRbWBXjE5If0szBun3FFKGfnP2aGm6d5dsDDCS7vl3HWrTlJuOrcVFAd
	 EmD/FybTpXy8ZlggD1tT9ngFSxongwjcRYHrKA/lNJPW8eGp6YlLRZfBft9Vk4NaSJjdw
	 r3vdAQMZzRawE4fjUk74OIetQ/ZPOwIulVaisShsA5w63I1boCxEhjIjePmm6AQUg1VTA
	 f8LuyWB1YP+70h2OVpb4E8ygiboMxl8w1KCn6X6e9NfSAozwbEwxUsEramIP4Bj6962fg
	 mnfGRAqb2I098gnoSYQmx2IhJe4a2F9leAwGqSRszx/3D3HLy3iqni9G5P7x26nzKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297521;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xXxoNAlKa/PBpV5ol5S8Xdd6kzfXK1Yx10K2yYA4fw0=;
	b=BeeKTeWxZ7RBBWbMAlh/gdK70WPtOnMeI0K2uQT6QofAvGzNFiIkcIrVVw1peYNiH4Hf
	 LFxOHNt0rNifadvOttLx8gQJNCEg36BWI7Sec1lHpPTKHtacECUuLqTUduqMz4UezRIWi
	 WDs6E1MsasUakUg+08gIvUXUDFaISDHRwrVSo96fsrXyNAHL3FRuvzTymP/QQiEl2Q+aY
	 TneGMgCHjkd0N6+H8DuIHZCJwvjxiY1rqmOoHxZmzZ/WH+4rRbt1JkZT9a/E93EQSFiAb
	 uekJVexfx1jKeuize4wc8xix4Qoj+QTtqETnv4i/+GulSX10mBbT2Oj0YIkUGiqwCPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="N4Xo6Z/S";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A406077D4E;
	Tue, 10 Nov 2026 07:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A406077D4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=N4Xo6Z/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=N4Xo6Z/S/55J+hunyQ6nJNQ5nKptG/8QbtR5cxpjCQDR0jL5iX3TsqprHCi293U29p1OTEnxiPaxD
	 EFjuNmUnauB7hkQMpMkAtz77UwkZI0FjdOXQoMCzrfBAIUsl2i1fZexctw/D/cRpzzJuOoJhzmmci9
	 dAHxe4ENookoH0Eo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2ceae5ca-6c6c2;
	Tue, 10 Nov 2026 15:58:39 +0800 (CST)
X-RM-TRANSID:2ee86af2ceae5ca-6c6c2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdef;
	Tue, 10 Nov 2026 15:58:39 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdef
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/22] usb: typec: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:24 +0000
Message-ID: <20261110075825.24946-22-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/typec/class.c            | 2 +-
 drivers/usb/typec/tcpm/tcpm.c        | 6 +++---
 drivers/usb/typec/tipd/core.c        | 2 +-
 drivers/usb/typec/ucsi/displayport.c | 2 +-
 drivers/usb/typec/ucsi/psy.c         | 2 +-
 drivers/usb/typec/ucsi/ucsi.h        | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..ea2564b9eff6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -564,7 +564,7 @@ static const struct attribute_group *typec_altmode_groups[] = {
  * @adev: Handle to the alternate mode
  * @ops: Ops for the alternate mode
  *
- * After setting ops, attribute visiblity needs to be refreshed if the alternate
+ * After setting ops, attribute visibility needs to be refreshed if the alternate
  * mode can be activated.
  */
 void typec_altmode_set_ops(struct typec_altmode *adev,
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..dabb91319e8a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2520,7 +2520,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			/*
 			 * PD2.0 Spec 6.10.3: respond with NAK as DFP (data host)
 			 * PD3.1 Spec 6.4.4.2.5.1: respond with NAK if "invalid field" or
-			 * "wrong configuation" or "Unrecognized"
+			 * "wrong configuration" or "Unrecognized"
 			 */
 			if ((port->data_role == TYPEC_DEVICE || svdm_version >= SVDM_VER_2_0) &&
 			    port->nr_snk_vdo) {
@@ -4461,7 +4461,7 @@ static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
 
 	/*
 	 * Select the source PDO providing the most power which has a
-	 * matchig sink cap.
+	 * matching sink cap.
 	 */
 	for (i = 0; i < port->nr_source_caps; i++) {
 		u32 pdo = port->source_caps[i];
@@ -5960,7 +5960,7 @@ static void run_state_machine(struct tcpm_port *port)
 			}
 			/*
 			 * Although tAvsSrcTransSmall is expected to be used
-			 * for voltage transistions smaller than 1V, using
+			 * for voltage transitions smaller than 1V, using
 			 * tAvsSrcTransLarge to be resilient against chargers
 			 * which strictly cannot honor tAvsSrcTransSmall to
 			 * improve interoperability.
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 02539378ffed..67471c363a68 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -950,7 +950,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
-	/* Can be called uncondtionally since it will check for any changes itself */
+	/* Can be called unconditionally since it will check for any changes itself */
 	cd321x_connect(tps, status);
 
 err_unlock:
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 572da7bbd29c..56cf7deb2312 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -165,7 +165,7 @@ static int ucsi_displayport_status_update(struct ucsi_dp *dp)
 	dp->data.status = DP_STATUS_ENABLED;
 
 	/*
-	 * If pin assignement D is supported, claiming always
+	 * If pin assignment D is supported, claiming always
 	 * that Multi-function is preferred.
 	 */
 	if (DP_CAP_CAPABILITY(cap) & DP_CAP_UFP_D) {
diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index c8ebab8ba7e7..8eb1ed42fbbd 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -255,7 +255,7 @@ static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supp
 		return 0;
 	}
 
-	/* The Battery Charging Cabability Status field is only valid in sink role. */
+	/* The Battery Charging Capability Status field is only valid in sink role. */
 	if (UCSI_CONSTAT(con, PWR_DIR) != TYPEC_SINK) {
 		val->intval = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
 		return 0;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 1996f04ed5e6..d363e9a64763 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -509,7 +509,7 @@ struct ucsi {
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
 #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
 
-/* USB4 connection can imply that USB communcation is supported */
+/* USB4 connection can imply that USB communication is supported */
 #define UCSI_USB4_IMPLIES_USB	BIT(2)
 };
 
-- 
2.53.0




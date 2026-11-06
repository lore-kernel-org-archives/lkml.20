Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967075;
	b=U1LBlQ2LuCTHklwB1pqXnuyaYmcsJ+IDfZwoWpMaT/hbBWhWyJG/fdTIp/QFNL05DpP1
	 bLBKYtM6nPnNlmCANIMxrO7p4JNkcl6y2v/vliUxTSCBpPYS/2m2hDf+QSFS8GhvpZnoI
	 xJxMmzBdnUxT/jMnY26z2nPfPj3ryMZlfduUU/xyjTRyCDHYrirPLngQP4eQ5lE1JCcZU
	 NjEx1sTBSY9ozM7MqxwrVYd8j0LElfcVg3KwkL3AYMj2cKTz2y58m2DTcIDVXhLoVrD8Y
	 wb7o1rKur6kQ0ziL3lxsQjNWWxGIcyPJz8S0BX0kTp675xp2SMdgpfpXTGtTzhL6trQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967075;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=CqzvkiWtRdQoyPnwLGmA6uklwfqUTxrXWbNrA55o22M=;
	b=vskNMHc3idmJwiJQBF2PiZAcyOLHJaVDUt8eVd0WRliTJaz9O2bTFQPbQmC1kalPW7V5
	 axTPAx1hp32oIlIf6q/ZWWKCnEYJ1e8nsHrUhDuApkF8V89h8Xb42PuE9UfQfdSg2GiYf
	 xBHo+/VESzR5eVkCgPMp6NyVZdmt1/jvV3B3Y4MNRfewcX+CRT0GYvaWCBpdEYlAYwEQ+
	 3/rrZd9T7CNHJyUx5XsiPMvF95kO2RJe5NCTPDmoM3YMYynCke2fjQrBcBWBtJTTtIPaX
	 4oUoggsTU9d4Ss3PCkxo8GVAUjU/dupbr7hxrqhBj64RkNDTq/cQf28OU7r9Ro4tLrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BEKBp98l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF94606EE9C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF94606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BEKBp98l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793967073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqzvkiWtRdQoyPnwLGmA6uklwfqUTxrXWbNrA55o22M=;
	b=BEKBp98lnb2fVQHkMDMRZgZUHwJl4zNFM8JRPDc8CYkyhkUON3Z3CrVsV8XFbl31FIzFoQ
	P44ysxZZgERdEbAiW2541T17tTGBwZm68rGBodHdQfO+tljAyvrGT8YQ9k4X7eMSB+7pUo
	ifkUBSdB9aT9VgYBL0vl8IkjIBJRoXA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-TkqlzppsO5ah20ZZgY_oIw-1; Fri,
 06 Nov 2026 07:11:08 -0500
X-MC-Unique: TkqlzppsO5ah20ZZgY_oIw-1
X-Mimecast-MFC-AGG-ID: TkqlzppsO5ah20ZZgY_oIw_1793967065
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4360519560B8;
	Fri,  6 Nov 2026 12:11:05 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 623A3187C368;
	Fri,  6 Nov 2026 12:10:59 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Min Li <min.li@microchip.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next 08/10] dpll: zl3073x: update locking comments
Date: Fri,  6 Nov 2026 13:10:03 +0100
Message-ID: <20261106121005.1327603-9-ivecera@redhat.com>
In-Reply-To: <20261106121005.1327603-1-ivecera@redhat.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Callbacks are serialized by the DPLL core domain lock instead of dpll_lock.
All channels of a chip belong to one domain, so what the comments rely on
still holds.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/dpll.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
index 1cdadb8e46fb2d..6e5e2bb41f55d6 100644
--- a/drivers/dpll/zl3073x/dpll.c
+++ b/drivers/dpll/zl3073x/dpll.c
@@ -349,9 +349,10 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
 	if (rc)
 		goto unlock;
 
-	/* All code paths accessing per-channel reference priorities are
-	 * serialized by the subsystem dpll_lock, so it is safe to release
-	 * our lock here before iterating over the other channels.
+	/* All callbacks accessing per-channel reference priorities are
+	 * serialized by the DPLL core domain lock shared by all channels of
+	 * the chip, so it is safe to release our lock here before iterating
+	 * over the other channels.
 	 */
 	mutex_unlock(&zldpll->lock);
 
@@ -2401,7 +2402,7 @@ zl3073x_dpll_changes_check(struct zl3073x_dpll *zldpll)
 	mutex_unlock(&zldpll->lock);
 
 	/* Send notifications outside the lock to avoid ABBA deadlock
-	 * with dpll_lock taken by notification functions.
+	 * with the DPLL core domain lock taken by notification functions.
 	 */
 	if (dev_changed)
 		dpll_device_change_ntf(zldpll->dpll_dev);
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415280;
	b=IlnXBhbmV/vHupJUwnuPq5kCY1JLQt5t2mwvEiJxqwqcv+noSTLfOvdIrl88FRWSuh8l
	 k14GzL7zKG0oCpSbyhpzxJmhSUk75l257YZ4TKYDZIAXS0dAe3qM7gdqA6Vwq7Cyb4i3K
	 geTNBrWZ7mpfOiqXiGvV1ADaZ1RTJ01k1i6/W/MGfOZmF5M5aJ9QVoPqANsyDqQz6XjDH
	 FjhhOqWQPAgV+KAsoB60010POSdnz3NGEBU18Ub9xMTR7CAkZl0xv1AWEu/2dl9f4kq8w
	 wvDmOVWTw5nNc2B5/BjEvGyN7amcOVN+FQN1KyMgbe9gA/avD53om/MutyzyiBMEi/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415280;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=jOxpAWZEDjh6YuLzUFmhUB+/S4//KD7ZYS5impIWXLs=;
	b=U7EKnqwqdLG86zOuOBziJVQQZ8AyULNNgheXk6JTjmGLlOQU4Z0lUJw1dxGXz6Cqg1SC
	 Opn6KtDog6JxUDenEL9LxTiiYg/+BNYIEY7g757SBw7F0woRjsPhFs/CfmlOIdrDtZIaN
	 wZytragizChc16XnDb5cdj7MX3Vp+gbL9HHTIHk+VAqJnf2CPWSONOaA3qSFDxM8qzhok
	 unfiMa61I6UEVOtidGlgjTOPKbCPnMYJe4KKOMiyles8QdO3TfnbZg25SAC38O5YI3tXg
	 SROf/G/wixwaBDN5a4uspXbmMhTI/fR4ymPJdphlr4+Kqcdlouf/pZ4J3gS4rdm3H9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eE7GAG+a;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40760A5BC1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D40760A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eE7GAG+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794415279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jOxpAWZEDjh6YuLzUFmhUB+/S4//KD7ZYS5impIWXLs=;
	b=eE7GAG+aogJ2GKHh7u3B0AsNTkXKAS+Plg2IGWYo1lyxNU/cJiY7pYE6fEnO1hXBLMC3mU
	FMVOC2R58LZD0vz6TOBJoH+4RpYG9reCs68aDTgnkoHQow8bEGRspSvur+NCOKZt5RR8K0
	xzV/YkSWFfJzMc57UApHBpTx2CmFb5A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-jlDh60aTO8q3L_Wbnk2pqg-1; Wed,
 11 Nov 2026 11:41:14 -0500
X-MC-Unique: jlDh60aTO8q3L_Wbnk2pqg-1
X-Mimecast-MFC-AGG-ID: jlDh60aTO8q3L_Wbnk2pqg_1794415272
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAA7A1955DC5;
	Wed, 11 Nov 2026 16:41:11 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61D1D410;
	Wed, 11 Nov 2026 16:41:06 +0000 (UTC)
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
Subject: [PATCH net-next v2 7/9] dpll: zl3073x: update locking comments
Date: Wed, 11 Nov 2026 17:40:18 +0100
Message-ID: <20261111164021.273409-8-ivecera@redhat.com>
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Callbacks are serialized by the DPLL core domain lock instead of dpll_lock.
All channels of a chip belong to one domain, so what the comments rely on
still holds.

Reviewed-by: Petr Oros <poros@redhat.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
No changes since v1
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


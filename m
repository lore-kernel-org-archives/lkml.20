Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF211C5D72
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144312; cv=none; b=TRqJuXB+tUKEZ9z8G2lGI9kPJDxj5ZN8Qb20rNXrPBc5DaA/bOuRtXsByglOEwmU6f3Po6qh4ePbZ/dKUuZxsGtCD2GJsIMxvF8PWeW5mZwanuyCl4F3/X4OmvGej2HFywOTcueqyQKFKUNTNjd/yJ3BLQ1kiB9VwpQo+AtDi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144312; c=relaxed/simple;
	bh=qnXYeslCPar2VO8ngSaPLHXGAO+GqsH9d/hHzaFJaC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r51iRPf/D6TCCfNVVkaoWcgyibh+c69f+4stlsxYA9pIiGISDRF2i9KkxQmEeRpsr9UHuvZD+GFFBwvRHsw1KQRtneIskh6P/XOOhdFVMhnaoeS4LgDbSg+obmU99faL7y5yXNfO5YrVTJJVubxaZoIMVFcqs2OqadSqANsk2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXVWw6De; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXVWw6De"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so338631f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144308; x=1790749108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSYOj4Uqp3IuPS9LxFeZr5+KsmeDJy4D+uK1RvwJG2o=;
        b=MXVWw6Dev7s4kzYkzrHt61aqmz8S63UYCGn/R/PYAtzCCxQDTBOyMPip9z/pL1XFIp
         ANvu56hllJdMR60t/R6sPS0scPIEYXqVjIFPJ+4OH/nCQv8Eu+5CSSgs6KGVFmHaWVai
         wbtDBLg7SrEstDok/U7sDbtVmjfUOiFYLtwmISvLYF5o0FoEG+UHdAtUckZSillTxKA4
         fnhR+cnxtTgfJMnkGBvLGAvqvA2wbKcH4WP/zRBO3V3Cv9X35vjGJTg39Doogo26vMsq
         xtdM431IUqKS63+1FIgMhRrPwi1BR0kKVmrxeUlcQYExRxaFa5DV055PXPUpVnbrItcM
         f11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144308; x=1790749108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSYOj4Uqp3IuPS9LxFeZr5+KsmeDJy4D+uK1RvwJG2o=;
        b=ujuR1U7ihl9pn2JDx+JHr8jd8aIN3mDkLs+bV5wc+SQrEnokdPuvHU653daFtVcqOi
         By18VTjmQz6ncsVyRVm8cLhhQ++Bu0zWIKTXYG4N4OLwuG0IHCG8YMHCnIvm0N+cVAgn
         SfUdIAB0c/avHXYQ/+DRLtFIDflJ2zswQmIehuvoTZH5isMrFUQisYY+ZwKMgeo6C19U
         FbH61D5TyPkiY8G4KWLwzxhHiHlkn7/Qx3y1+5IXsD1gJgMiuzbJIcck5G6dc1R6uev6
         sY/shN9bU8Q37X+9ClizrteaxS6reR613FLxo0k6aN49IBVWs/1N0z/2+GSYZoP49aGU
         lZsw==
X-Forwarded-Encrypted: i=1; AKwUvBxQvFJwcCtYKr1nwUEO7rrgis2l1X1/+Y1dRUc+qPHNOpcFpINQ4WXfJxQ/LV1ifdIonnEukvzIuiGOXVU=@vger.kernel.org
X-Gm-Message-State: AFuF++lcWFVu7jedGzsdYjDpyem842XX3DsBW2dEvk7DsuatTt+cuCLz
	ep4V7qvjXg3K2OAqfkFwqKksBJDpL9pxVoTXzmauPMPFiNhd1rFPTRfz0NLK4W2Y
X-Gm-Gg: AYBFou28l3tMkenncMCyy/oSKTMeg2SVDuJ5WSER36QxpDkCpxgDEt0lMUoeS+BAiqY
	LdjXzs/NmTZg0OOjqV77c7h/OM2u+YhYkxaY0WUp42mbReoWncZOnMfTfEbfP1StoniR7m5K1Z3
	tkmExGYbmg+31omYQz5U1BmEdZhOoQvvwO/Gx2G/jXorm/PqYdqECjCMlrwhYDtkxB/cg49i5vG
	myJaO2/xjgFVFBKShBCXWboSvOHR+ywsEBS/baR7zAx/jtsfEShWkI15rCHP8m2NnYkliodvld5
	k6dmJdXbi+btJIJEnzGCPqBQbUUWtAA9kHt9LtkYnBVK/yaOkPB2mOXQnikUvVSescJy92mkVRW
	pMmd9qIcZVgpDlPB4U4/MdzrekJnv9DtNFQ2GhPW2VnPQif72oUFOaiUWqLeEJiVJNiE0g4o85A
	M8XSHRyoUQZ3sa2oxidOD6L73OSNt5JKN6nVMpzkmDoIceShnW9rJgBNW9nxbe7ZGoitUWwbJTN
	gvoBbFFRUgE+oCnDGwftHMA5gSm+rNTyVlJ0Um9EP5Pj7bXzTAubsE9kNtwB72W+Ae59XV8ylWf
	oR+KDmPA+Wdlk5QNhcd9PwweXnPM9gNoxEs/Ag==
X-Received: by 2002:a05:6000:2901:b0:487:2806:2476 with SMTP id ffacd0b85a97d-488670b6b66mr2377289f8f.42.1790144308158;
        Tue, 22 Sep 2026 23:18:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-182-160.95.114.pool.telefonica.de. [95.114.182.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886848646dsm3859755f8f.10.2026.09.22.23.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 23:18:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH v2 1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
Date: Wed, 23 Sep 2026 08:16:57 +0200
Message-Id: <20260923061658.20140-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ring accelerator header labels k3_ring_cfg as an enum, uses
propname instead of property, and gives the DMA reset helper the
ordinary reset helper's name. The DMA reset comment also omits occ,
including the convention that zero requests a hardware occupancy read.

The proxy flag is parsed as a separate parameter, and the pop helpers
describe pushing elements. Proxy access is supported in Message mode;
the listed Credentials and Queue modes are not implemented. The phandle
lookup returns encoded error pointers rather than integer error values.

Match the declarations and document these argument and operation roles.

Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes (ti-ringacc-v2):
    Changes in v2:
    - Only patch 2 changed: describe num_rings as the total number of
      available rings, as pointed out by Udit Kumar.
    
    v1: https://lore.kernel.org/r/20260919163721.89044-1-kmehltretter@gmail.com/

 include/linux/soc/ti/k3-ringacc.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..2de6031b9424 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -57,13 +57,13 @@ struct k3_ringacc;
 struct k3_ring;
 
 /**
- * enum k3_ring_cfg - RA ring configuration structure
+ * struct k3_ring_cfg - RA ring configuration structure
  *
  * @size: Ring size, number of elements
  * @elm_size: Ring element size
  * @mode: Ring operational mode
  * @flags: Ring configuration flags. Possible values:
- *	 @K3_RINGACC_RING_SHARED: when set allows to request the same ring
+ *	 %K3_RINGACC_RING_SHARED: when set allows to request the same ring
  *	 few times. It's usable when the same ring is used as Free Host PD ring
  *	 for different flows, for example.
  *	 Note: Locking should be done by consumer if required
@@ -88,11 +88,10 @@ struct k3_ring_cfg {
 /**
  * of_k3_ringacc_get_by_phandle - find a RA by phandle property
  * @np: device node
- * @propname: property name containing phandle on RA node
+ * @property: property name containing phandle on RA node
  *
- * Returns pointer on the RA - struct k3_ringacc
- * or -ENODEV if not found,
- * or -EPROBE_DEFER if not yet registered
+ * Return: Pointer to the RA, or ERR_PTR(-ENODEV) if the phandle cannot
+ * be resolved, or ERR_PTR(-EPROBE_DEFER) if the RA is not yet registered.
  */
 struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
 						const char *property);
@@ -103,10 +102,8 @@ struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
  * k3_ringacc_request_ring - request ring from ringacc
  * @ringacc: pointer on ringacc
  * @id: ring id or K3_RINGACC_RING_ID_ANY for any general purpose ring
- * @flags:
- *	@K3_RINGACC_RING_USE_PROXY: if set - proxy will be allocated and
- *		used to access ring memory. Sopported only for rings in
- *		Message/Credentials/Queue mode.
+ * @flags: Set %K3_RINGACC_RING_USE_PROXY to allocate a proxy for
+ *	accessing ring memory in Message mode.
  *
  * Returns pointer on the Ring - struct k3_ring
  * or NULL in case of failure.
@@ -126,8 +123,9 @@ int k3_ringacc_request_rings_pair(struct k3_ringacc *ringacc,
  */
 void k3_ringacc_ring_reset(struct k3_ring *ring);
 /**
- * k3_ringacc_ring_reset - ring reset for DMA rings
+ * k3_ringacc_ring_reset_dma - ring reset for DMA rings
  * @ring: pointer on Ring
+ * @occ: occupancy used by the DMA reset quirk, or zero to read it from hardware
  *
  * Resets ring internal state ((hw)occ, (hw)idx). Should be used for rings
  * which are read by K3 UDMA, like TX or Free Host PD rings.
@@ -217,8 +215,8 @@ int k3_ringacc_ring_push(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring head. Size of the ring element is
- * determined by ring configuration &struct k3_ring_cfg elm_size..
+ * Pop one ring element from the ring head. Size of the ring element is
+ * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.
  */
@@ -242,7 +240,7 @@ int k3_ringacc_ring_push_head(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring tail. Size of the ring element is
+ * Pop one ring element from the ring tail. Size of the ring element is
  * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)



Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB14D487F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671801; cv=none; b=PhyEpc+azmKgUUmeivtQGEMzHMoDxyQGduTlkyPS+olo1NcL6uJ76m1hK1JLOuc8lcLcaJXOX8nsw8vKdtgBcH6EVIo7VbCgHOloePzXJi7j/EpumrYsTOmSnC09KWyjBI8TIHMLlnwe770MkY2EBVCldabx3Gr77RdSGmRvGIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671801; c=relaxed/simple;
	bh=SWP+IV1fMGdfLy7tC2KweUFw6pKdEpbaTGT+nRZ1yto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ap5nexOga/pFBoBklnAC4IaH6sJprmRzO00gNEpa8UXbVFIIRuFQCv0dC3vqLzKXag6OckiMcL19Y1DjYJJso6arfb5TKnVpxRIVPMt4PvlKAiDjXfoGzRnkqBBHQdFUIyFZ+HYh3uKwnrR5S76BReQLud0eITJWrHUfjS9nnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fh1muanH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fh1muanH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789671798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EB1T0pXKzjvsuv215L9ed3awL8vEMvUzqiYASmBEWw=;
	b=Fh1muanHJ4S1Z3ymtAbN5KR+paKbr90mETSwdHZ7NkdGnObVdzS9+CR1KTbzGicUPmi5hG
	VtIUcS3wtq/7vfwwtEH4yd6mNn98IUSbAXxx3K7SmKOKXHLSlRU6hCpDr68DboqL0c9jy5
	+Y9Ay6//h4H7jVTTAhSghYhGPTvlEVw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-iatIkS3sOwWgx1D4V012qQ-1; Thu,
 17 Sep 2026 15:03:15 -0400
X-MC-Unique: iatIkS3sOwWgx1D4V012qQ-1
X-Mimecast-MFC-AGG-ID: iatIkS3sOwWgx1D4V012qQ_1789671793
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B47861912C6A;
	Thu, 17 Sep 2026 19:03:12 +0000 (UTC)
Received: from ShadowPeak.redhat.com (unknown [10.44.49.1])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CEC719AC047;
	Thu, 17 Sep 2026 19:03:08 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH iwl-net 2/2] ice: skip the SW pin description on boards with generic DPLL pins
Date: Thu, 17 Sep 2026 21:02:58 +0200
Message-ID: <20260917190258.3239282-3-poros@redhat.com>
In-Reply-To: <20260917190258.3239282-1-poros@redhat.com>
References: <20260917190258.3239282-1-poros@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

ice_dpll_init_info_sw_pins() describes the SMA and U.FL wrappers by
pointing them at fixed positions of the input and output arrays, inputs
4 and 5 and outputs 0 and 1 on an E810-C SFP, and reads the ref-sync
partner of the input it picked. The arrays are sized by the pin counts
firmware reports. On a board that does not match the Intel reference
layout the driver has already fallen back to generic pins, and when
such a board reports fewer pins than the reference the reads run past
the end of the arrays.

The wrappers are never registered on a generic board, but
ice_dpll_init_pins() still calls ice_dpll_pin_ref_sync_register() on
them, so a stray nonzero partner from the out of bounds read would pair
NULL pins.

Describe the wrappers only when the static pin table is in use and keep
their ref-sync registration under the same condition. The default
programming of the PCA9575 clock mux stays on the generic path, a board
that has the mux still needs its SMA connectors switched to inputs.

Fixes: 2dd5d03c77e2 ("ice: redesign dpll sma/u.fl pins control")
Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_dpll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
index e0362b6bf332e5..81bb32d2b23012 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -4124,15 +4124,15 @@ static int ice_dpll_init_pins(struct ice_pf *pf, bool cgu)
 			if (ret)
 				goto deinit_sma;
 			count += ICE_DPLL_PIN_SW_NUM;
+			ret = ice_dpll_pin_ref_sync_register(pf->dplls.sma,
+							     ICE_DPLL_PIN_SW_NUM);
+			if (ret)
+				goto deinit_ufl;
 		}
 		ret = ice_dpll_pin_ref_sync_register(pf->dplls.inputs,
 						     pf->dplls.num_inputs);
 		if (ret)
 			goto deinit_ufl;
-		ret = ice_dpll_pin_ref_sync_register(pf->dplls.sma,
-						     ICE_DPLL_PIN_SW_NUM);
-		if (ret)
-			goto deinit_ufl;
 	} else {
 		count += pf->dplls.num_outputs + 2 * ICE_DPLL_PIN_SW_NUM;
 	}
@@ -4501,6 +4501,8 @@ static int ice_dpll_init_info_sw_pins(struct ice_pf *pf)
 	int i, ret;
 	u8 data;
 
+	if (d->generic)
+		goto init_sma_ctrl;
 	if (pf->hw.device_id == ICE_DEV_ID_E810C_QSFP)
 		input_idx_offset = ICE_E810_RCLK_PINS_NUM;
 	phase_adj_max = max(d->input_phase_adj_max, d->output_phase_adj_max);
@@ -4566,6 +4568,7 @@ static int ice_dpll_init_info_sw_pins(struct ice_pf *pf)
 		ice_dpll_phase_range_set(&pin->prop.phase_range, phase_adj_max);
 	}
 
+init_sma_ctrl:
 	if (!ice_is_feature_supported(pf, ICE_F_SMA_CTRL))
 		return 0;
 
@@ -4584,7 +4587,7 @@ static int ice_dpll_init_info_sw_pins(struct ice_pf *pf)
 	if (ret)
 		return ret;
 
-	ret = ice_dpll_pin_state_update(pf, pin, ICE_DPLL_PIN_TYPE_SOFTWARE,
+	ret = ice_dpll_pin_state_update(pf, d->sma, ICE_DPLL_PIN_TYPE_SOFTWARE,
 					NULL);
 	if (ret)
 		return ret;
-- 
2.55.0


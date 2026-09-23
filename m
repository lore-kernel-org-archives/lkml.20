Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BB3803DB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146231; cv=none; b=YAKZyGQ3yYOUwV8ZdFyG9WgcUNnD5hXLGJQCm9QVvn8XeoGrpm8QaOIJauNiPwJB5xQG5rLjcF5Qn1idTsY3+8S3ZYErLR3MWhaBMkHYHbvx3QSSc2jkRhq+wy/j7PC5POwH/MDyk41yEMalfbg3JXrcMaEtoxXaFGmbQS0Q2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146231; c=relaxed/simple;
	bh=/G5yDBNeg5z3c3JkQn6y7fB5XutNM0+jQyJ4HLTck+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=no/1ERrbhZ36G0QpOZiQ1OEOVPoiV7PX3B8ggiAXSNZ/BntUvs1k67hKm+zO6EnENtGA0znMnT1gJMoFOLVXO8aUcV3rKSiudWtpPddEyuFos0b1RHXaMsonjRfZ0PHR1ICn+h8tpEdVrbYAv6OtHF3unYIjKF7Azb98JVcSMmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2bzKGS9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2bzKGS9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so2961945e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790146225; x=1790751025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p89oVBps4S+T5LODrobO031ycfpG6AMkiYxzsZO2208=;
        b=s2bzKGS9gK2wT0K6YYnOPdeNdetk17ZycZw8BHOqcMs4PYc8fZgHxzu6ta7itYWRiI
         jffWQwYY7MJW39GBFY9adQWhps4sbipVS4uKvo2D12YEKDGrfZ5OIlUFVyrQOOctj9Ss
         2DVXWArrpyl/Tx0F32+3hxnYnjf+TYHyKEAG2UD9bx+ALzNxFJLVZE8Dqu/ht9RJFR7W
         zR2Y+FAr24Ra+LCW/7SqoxZnNItX3WvL9MiiKsIkISKElqMg4A6oaZ26KB/A4A6LOVVW
         LKziwAYDsQMsQnHqWuoiEmlwBKeBkx9Ii52xqTqQSriaZsiSa2szs4DKwxU3/auD6OvY
         03nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146225; x=1790751025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p89oVBps4S+T5LODrobO031ycfpG6AMkiYxzsZO2208=;
        b=i2bXBQdT1lmfnuf02x0bY7ZcqkkIs/sIxEsrkoAah3i50OWj00JB+jlIeGwqU+mLC7
         sw3LfCQT2BJ6/0QdlCupKiTInLhlptXrO8XAWcwcKkpoL7LL6BJyIuBJVACf27mm5nHW
         9TMaB8jP5kzHe/2+qYg/Vox6nVwzqm/sLKAn95J3oVcx1onvx8sgbLryGCH8OeNGVgB7
         3jfVgkvaS8eDLiOyFCYUqIQfUpPkckag/EqFuznOBMvPmmCyPCH4nK8K40wEy3aGVpeT
         Q+jYwvKz1CusrTg4UXNNpV3n8vHP/POBDXi22kvkcDsJOHRKdMZg0rYYVDM25SgTFzNW
         yfdA==
X-Forwarded-Encrypted: i=1; AKwUvBxY7i+8+FawH4NQPohADyWCuhMZ2lMbkxEQHcZt9wW+86qx/aoNQybPzdztddOUOiWkRdNOQYCCHMyd6vc=@vger.kernel.org
X-Gm-Message-State: AFuF++mffumwuDYET8D4Vk83F6dssTk7xXw3rbyJw+7iBmij1Cf3V8ad
	+ReM1D7E9wqmPrKNLLTbmP27oEckdMIE8iy0+h/S+0xhTAPTQx90i7UT
X-Gm-Gg: AYBFou2yQfzjWIrG0ZlqDsESgKIpQGhIlm3zeCe3UE1dIeSNlJ+N4wClWUpu81bc/bG
	C2O83ATz1ag1QUzoewGIOrYqMsK4L3BCRpSDw24HZrHefyAO24LQlF4qIB3dx23myPSq7Hp6yFn
	VNjoOxGXk9UIbZ3I4pwqWWtYExHmnJnufuAzcqjtwQ1TEWx33W9mFEnjFrA5hWsjkhVV/BswjwH
	iZGIwkYpRduF+k/0sXgdxKAvxsdjeimsE9+q7FzyUPNpVzalnOnJ7IwztS/C+f0IgKPmX5lgLWq
	6dnKvOSDr5W7JPLHHrjEn52QtMIN+CnUAW25QDxMx2SaTO16OIBumfCL3bleE3BOnzmUI0WvWTl
	YLIyJmYSjJXwj2sEiFwWhOY8EBxdlSIpgFzuVg6R7Q90boN5VavaGAMXu4O/xEnLpupzy7I1wH+
	eX3jkBBRl/gdUND9c165SIS9k8FyL1d9J8N7tTe+eqB1YlHqkBjxkKmugBCiTIDDGgy++zALzCU
	2NIsqD0ct9FeRUC5vsH8aU/CUwxCxj+Kkk6jMC839F72T/+MhALNzGhjTdOEp7sUYvr1T4wGw==
X-Received: by 2002:a05:600c:c48e:b0:49f:ce78:356a with SMTP id 5b1f17b1804b1-49fdeffdc94mr17172215e9.27.1790146224743;
        Tue, 22 Sep 2026 23:50:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde1e975asm57882535e9.14.2026.09.22.23.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:50:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brown Huang <brown.huang@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [RFC PATCH net v5] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Wed, 23 Sep 2026 08:50:14 +0200
Message-ID: <20260923065015.5999-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brown Huang <brown.huang@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

It's enough to try a second time for the TRTCM config to be actually
applied to make sure we are not in the middle of bucket handling as it does
operate on fixed time slot internally.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Brown Huang <brown.huang@airoha.com>
[ improve commit description, drop memory block, apply better loop logic]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v5:
- Drop memory block (not needed)
- Loop only 2 times
- Improve description
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memobry block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 21ac80bdd084..b164a78ddac9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3120,14 +3120,34 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	/*
+	 * HW might be in the middle of bucket handling and might
+	 * require an additional try to actually apply the new TRTCM
+	 * config.
+	 */
+	for (i = 0; i < TRTCM_CONFIG_RETRY_MAX; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 286f73e2e1e0..d270729e22ff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -184,6 +184,8 @@ enum trtcm_param {
 #define TRTCM_TOKEN_RATE_MASK			GENMASK(23, 6)
 #define TRTCM_TOKEN_RATE_FRACTION_MASK		GENMASK(5, 0)
 
+#define TRTCM_CONFIG_RETRY_MAX			2
+
 enum airoha_dma_map_type {
 	AIROHA_DMA_UNMAPPED,
 	AIROHA_DMA_MAP_SINGLE,
-- 
2.55.0


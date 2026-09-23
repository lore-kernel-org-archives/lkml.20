Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A000D53A390
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189478; cv=none; b=m+aXd6lIwtGkdGe6ufX90za3xxCpzurxhLiAuZGxzBy7rbz1pv4zC7v5ZSEx6BWdkmdPJG96xID+auXkC8hPZnwMSnvSIPJtCj2wKUDKhRqyDtMKiLEoKXxjVJswrRRN3Q6bOnNRAOlk2P6XM0+yqEwFXnAXzzCp0ob7Q2vlSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189478; c=relaxed/simple;
	bh=Klb6dIIWDbivq7Nwzx0pLrjmulwzyzTJfh2mCwsjH78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NODf/89SFVscGYOlu8OnsRUzcCzTEkeTC7SqAMXY/XcqJmXM4oc/uI40Ss9jn7Tcn57DtwqOhFu4KtFcP6WWHOeQdYejbxLLt1eZEVeSW6QqHrTI/lxdFXDsidrpP55nNg8YrloKbLHH5rmpaMO6lq3vp8Mp+Hn4h5OQWpOJOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjRNo8Zy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjRNo8Zy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba92so960716a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189462; x=1790794262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2RyWeLbmlvlzy0g98C/45Akp7E/hTZac2wRMvl2ThY=;
        b=sjRNo8Zy++N4nwIiZXjpCtjR8XSxxx9C74RhypZVb+O/4qfq1ZIcN3N2Q5ZHhhKVhY
         ybV86yugoUrYyVPY84uqDCkSfxJTaoZSgDLLRla6E5HZAKuP0yekmNIHM5x/KezMbQEH
         C1+wLRTjLRWfSf20meUA2b6C6KlSLuL02FEIjRpsMoRjzDORdb1MgdYcXbl7ATgdp2ml
         esvCFGN5M9evMPLWUVAWXRjsIeGfzsuTEWXPUIcJTEU8gi4p5X9SxZGaWIWnbHvOvKJE
         s6Q0PePrUvHyOFJURD/w/qSI6TQlXGuqIbSG25AVBC+nB9PBAU0BilxpA3zgWmPScaDT
         yBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189462; x=1790794262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2RyWeLbmlvlzy0g98C/45Akp7E/hTZac2wRMvl2ThY=;
        b=AMCj1nTBN+wxBp5KsJFszZxGorNZgyKs/YCuC4lM8wto3jpMvAPTl1p1/hw6HGGUAb
         9a8lVaW3wn9o82S4gg6EaLqsPf0BCoti4CltN6M1N+2sUq2XSqDKPmOas6NreFluqi5l
         YxlNTdE5nZNVtkPh3aVF71FJMpBelCLmT00pGO44/kL2ksm93TSsmLGB9cHcuY3nXb8A
         WCwlJBUtA1p/9W0FacJnAiA1uN54J52VFo7lGXajBzp0DZ3rFXgXGgZFfr0JMRrj+mAj
         v437k/CA9BPhtjmBmkGrojImAeqKzYSkSppfNRy7zLR3YyrDzKYtbiInOVKhXdW419Iz
         UpwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRakFp5RIvStuCO4bX3FlLhHpD8lbn9tlElERUvKMG56J0ieXMkkzG2LIRwetk6wx+vOTgu2CmdkSU1DA=@vger.kernel.org
X-Gm-Message-State: AFuF++knF0+j4psyN3RMV3Dw6u6X+UQfzDY8kM9I7SmO2UkPVcPQStGU
	J6dJtgTX7rQf5tcvoUb+IVbdn4l3KxUhf9vNTi/hdy4r1Pkv8E0ug/zk
X-Gm-Gg: AYBFou1grsFtoT71yjH2j4niGqZ4I2Xg5pQGDZqgBvfl6nL1j1gdYVpjaKO6IHIxz55
	vNUIXklNsByygZMP5E+WBnnqM2aiuXQVj7t8rfZYI6dA6iLA6gZIBByz+SPbt0rAr9BvgErgD4T
	2RAuAHn9MHhglEhr/pOyo1rZmSTgT5r+DEMCBBQc5aruZUqw1gz5NN762CN7jSpojAZXR4+oWfP
	wk+M09T0B+izOwiTgYbyujjiYZ6YS8keelE1iFHkijBUxSBv/pwLrtQATVy0GzsH6Icnae1oZFq
	ceeu0cRIwTJ+AaGjFX9qwlAM7AXwE8mEQyO31viq5X2Y89+eNzNfs3d1oLxMSyETM38iHcArHeu
	K6tU1c9vGj3xUTaDeMgFEWelzOXITLR9R+0OmnjdKNVqfpdrthv82vRRL2jteYD85e5iSDqVjKg
	JB59caPf+VGT11Qe226rBtm3mLWwh62iMgVhoKfFyWXP8qobc/Evpkf1hgwaiO9nralWyAECFPC
	WIylPezflODu5vLOJCcWyNOdzoqKCx8tGP62TfUqljq6U2no/UnZhmPNz/Nw3I8hup+ra7oacGK
	Ub/wj5msJqsf+YP6jIWlziIXNE3qhOVvEu2wxewb77rznIfj2Q==
X-Received: by 2002:a17:90a:d88e:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-3a0985b8f62mr75751a91.15.1790189461897;
        Wed, 23 Sep 2026 11:51:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a081274d7fsm2148797a91.2.2026.09.23.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:51:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] interconnect: qcom: fix endian annotations of BCM aux data
Date: Wed, 23 Sep 2026 11:50:59 -0700
Message-ID: <20260923185059.25196-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct qcom_icc_bcm::aux_data keeps a copy of the struct bcm_db read
from the command db, whose unit and width fields are annotated as
__le32/__le16 to describe the little-endian on-disk format. Using
those restricted types directly in bandwidth calculations makes sparse
complain about endianness.

Keep aux_data typed as struct bcm_db, copied verbatim from the command
db buffer, and convert the fields with le32_to_cpu()/le16_to_cpu() at
the places where unit and width are used. No functional change.

Fixes: c96fc14322ce ("interconnect: qcom: add COMPILE_TEST")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609221350.3Y8MOce9-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: don't use a separate struct
 drivers/interconnect/qcom/bcm-voter.c |  8 ++++----
 drivers/interconnect/qcom/icc-rpmh.c  | 13 +++++--------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 6c7e9a7c17e2..0880a287b0c0 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -88,20 +88,20 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 	for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
 		for (i = 0; i < bcm->num_nodes; i++) {
 			node = bcm->nodes[i];
-			temp = qcom_bw_div(node->sum_avg[bucket] * bcm->aux_data.width,
+			temp = qcom_bw_div(node->sum_avg[bucket] * le16_to_cpu(bcm->aux_data.width),
 					   node->buswidth * node->channels);
 			agg_avg[bucket] = max(agg_avg[bucket], temp);
 
-			temp = qcom_bw_div(node->max_peak[bucket] * bcm->aux_data.width,
+			temp = qcom_bw_div(node->max_peak[bucket] * le16_to_cpu(bcm->aux_data.width),
 					   node->buswidth);
 			agg_peak[bucket] = max(agg_peak[bucket], temp);
 		}
 
 		temp = agg_avg[bucket] * bcm->vote_scale;
-		bcm->vote_x[bucket] = qcom_bw_div(temp, bcm->aux_data.unit);
+		bcm->vote_x[bucket] = qcom_bw_div(temp, le32_to_cpu(bcm->aux_data.unit));
 
 		temp = agg_peak[bucket] * bcm->vote_scale;
-		bcm->vote_y[bucket] = qcom_bw_div(temp, bcm->aux_data.unit);
+		bcm->vote_y[bucket] = qcom_bw_div(temp, le32_to_cpu(bcm->aux_data.unit));
 	}
 
 	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 7f2b5673629b..45662d1a2060 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -166,19 +166,19 @@ static int qcom_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
 				peak_max = INT_MAX;
 		} else {
 			if (x) {
-				x *= bcm->aux_data.unit;
+				x *= le32_to_cpu(bcm->aux_data.unit);
 				do_div(x, bcm->vote_scale);
 				x *= qn->buswidth * qn->channels;
-				do_div(x, bcm->aux_data.width);
+				do_div(x, le16_to_cpu(bcm->aux_data.width));
 
 				avg_max = max(avg_max, x);
 			}
 
 			if (y) {
-				y *= bcm->aux_data.unit;
+				y *= le32_to_cpu(bcm->aux_data.unit);
 				do_div(y, bcm->vote_scale);
 				y *= qn->buswidth;
-				do_div(y, bcm->aux_data.width);
+				do_div(y, le16_to_cpu(bcm->aux_data.width));
 
 				peak_max = max(peak_max, y);
 			}
@@ -228,10 +228,7 @@ int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
 		return -EINVAL;
 	}
 
-	bcm->aux_data.unit = le32_to_cpu(data->unit);
-	bcm->aux_data.width = le16_to_cpu(data->width);
-	bcm->aux_data.vcd = data->vcd;
-	bcm->aux_data.reserved = data->reserved;
+	bcm->aux_data = *data;
 	INIT_LIST_HEAD(&bcm->list);
 	INIT_LIST_HEAD(&bcm->ws_list);
 
-- 
2.55.0


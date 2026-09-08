Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCBF3B058F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854961; cv=none; b=QljjPpxzCBjTH6wzrlpsGrFqTDgD3A8dzkWtpqottx+9ib57+MT5lq5yTcGGbXVLWDru/zXQwjN92EhRazcn509QIYQXa5TV7MEUeyXtDte87Z/EPBW4KqdyJW4RpH1gICj1gnVYeq1dxOu+o7cBLQ94NSjuVc27gbXnhfrP24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854961; c=relaxed/simple;
	bh=jZb9VWJNn//9UIfodFEP6WLVk3CPMdRNJNrNhBck1Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N55Byknv7e8UvjLbtFQb2DTJpGHpkd72krvgLagNWDKZHCMggCkGHeEuA3A1R1iOS2HV9v+t9iRgj0JUtARh7PzEbDIS+KkLHErD/3Kf+l/BvrhRsCWjFddwd+KpTWrdXHhvIZrWoOyNQHa/cNm53WS2nD6Ov6glMkkKKyPWBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwLWY19U; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwLWY19U"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so41908245e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788854957; x=1789459757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FrMPA2gnzNAOST949OYokgJZDYzOdtAOrWkmN+04YvM=;
        b=PwLWY19UjoVYyzrYJoYrYSSoK4ilGu5k/wRS/A8NXEPDZC57msuWKy2SYy3JqjZWQQ
         yKnkn2KytgG1icUJWPkx41ZmMkFIXPQBjUgOfv+Qj/8NPLpgAxn78k+ox3DaVvbIoLJL
         cN6l1WyVqFW/5PkFhZOGqJpXihl/0E8k19BkpyRfL8uDHdhUVw4+MtDRK8osSVTYCdGR
         85l6t4LNooUfsxHb/BY1UVOGUO5P+5vwTDZM8tKBG5AOB35ivCB0TNwTLglhowYwMOdN
         r3Ud/PP5RtAA56+dolP/EoByUTScHOs/ksbSaAptnRvkqDqV826TkqLDE2xreQGVFJcM
         WKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788854957; x=1789459757;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FrMPA2gnzNAOST949OYokgJZDYzOdtAOrWkmN+04YvM=;
        b=KbNZKHcNVT2BVCbqToxmmoBroqygkpHG42Kfu5W58tLCZL+G7+lVqwBGDEB4esXKyR
         zkWO2VuNsXqRjgDuG1lNVTijtJ7k6xPFbzcZ3G8iriqaxifcHAGY0rve3WuM6YXjpe/e
         Cyu6NKUdGpkFl08htVbcsI2BfFB56kUDKhe7FqMZ6wm/9mWE9TemXBurAiLhkVmP/TEl
         yIHHE7WpRtiYchnAq2JSIgg9mOE9QDtYgsZTyn1C6/QfH3VcjUrR/h05wIHnyEAT1ZDa
         REuF6yy6NFc1dmyQedg4YQOK4NLu0WxMYrQt4hxinyuZMIpPqObKf6AT7sIQR6ICHNby
         XzYw==
X-Forwarded-Encrypted: i=1; AKwUvBwPOW6pP4G2kWgAFKW0uX+D05ZH3LKcj+gXifXIbb0dG/cBZCPTEkFf+dT15k5YAF0sUMlUhleqW8j/msU=@vger.kernel.org
X-Gm-Message-State: AFuF++l0v1Evfs4nr9NftkfW6/uwn5TBERGtjBOT1rWEDP+jbvqmPymj
	bi07cAq/h7uq+q8Vy5CulhdzSFUbAEnJkajURNiEsriwb0xk2v0Un+nYDZCNEAmJre0=
X-Gm-Gg: AYBFou3xBX5GYpddn+ncSL3xiccDSvYUgf5DGHaH0E4IR+t7rbJwOG2XRMl0rXGhuym
	42OKuctvVMnnNI32IMrsnm/2vZKjGmw1f/dguMekVIY6tURStE8z9U4hxRY1jjVjS+o83X7X8ih
	cC6v/ZS7iX/Yb0MTuiw7Xzl2VuS5Rlk8P9zqe+pQVhfjIpULIfnTYvNZeqzfKko769TjNOZfkhE
	26IrBIwO3g9dzPdfs9QJJHqu/mM4MD6HEwxnubTYrgjaPc/em7Hunuu3IsWJ7WhXuhyMXu2PDY/
	56+Au/SnpLAn1t6pQlhc/Cs1b2MvBLpSSA4WiIwYl8zZy46l+ttgkFrDxwcTmZzDQ/ifZoDmJPc
	km6jFfqGYPlGEXRwztdEwUGfiEpdR0+GcdPkPaGhIP3VD9P9e3BzLym/UbQi3KB2y5KTieOmhn7
	Ki/3xS15aqlqvFwLxCMo+5rafQI4RXqF7d/eC8SGVFJ9Hy1IzgYmV8/lzy+GRO3HxAiWpUMMBqv
	zjI6X6+PRYsHCpCOX8=
X-Received: by 2002:a05:600c:3507:b0:499:a5c8:c6f3 with SMTP id 5b1f17b1804b1-49cf7fe6900mr509106715e9.3.1788854957231;
        Tue, 08 Sep 2026 01:09:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm441847955e9.7.2026.09.08.01.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:09:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 08 Sep 2026 10:09:15 +0200
Subject: [PATCH v2] interconnect: qcom: implement get_bw with rpmh_read
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKrCn2oC/43NQQ6CMBCF4auQWTumrRSMK+9hWIxlgEmUkikhG
 MLdrZzA5fcW/9sgsQonuBUbKC+SJI4Z7lRAGGjsGaXNBmect9ZUOMdJAqb3dfUGJQRUphZ1eg/
 ITyorS6V3XEMOTMqdrEf80WQPkuaon+Nrsb/1r+xi0WJrLuTYB/JdfX/JSBrPUXto9n3/AvsdJ
 EPFAAAA
X-Change-ID: 20251106-topic-sm8x50-icc-read-rpmh-eba461a452e7
To: Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5677;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jZb9VWJNn//9UIfodFEP6WLVk3CPMdRNJNrNhBck1Wc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqn8Ksz1kMm9xb8PHeWR1wLddduvjg2l+f7eAh8u3c
 DKXmp7iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCap/CrAAKCRB33NvayMhJ0XMTD/
 91K0ue88uHmTaeWrOynq8j9LBjh95zKukeZmm4kmiCSawdwjnhYsQwd+Flr5NoQaBFCoYNWNeQEMmv
 EdUHzsyTDHdDeCWA6LTfo+68pRXFx7Bm4eljjSL4iiWEjeHNe0OmSaWb2Bs5jS3X/p9VoQ0xtIQlxC
 bQe9DyAqwKLuKQNAZf6fnTLNSJpfEEtw5OMhLU/2GJKFFpko4MwhhlnTfsQcuw4iF1SfSjENhawUBb
 tF0geqZxpAqvrkQt9D6D+43FMFeH2L5+JAmqa4a5saUy3wMRNgZ1No/G8FBxV5RlU39C61w9rMaXWU
 /rQDFFEhK+15QDBgZe+U3hNjOJVbGOrxysWhKrLTddx1DWl6aGomzyMfR21FaHzkeDfmgq5cmGmO2d
 b1EdVIJusxe4mzChwS1eDoiFc7FulzplyhUzgx9XNU5mp5KdXRoLAkXYxwiw7v5ZNiNOrN1hNDvbI/
 Bmv9M6dUhUtjyNh8bZzsKRD7PUJPMTu+Xi3WTg+xIhjbf8CwXI7fcSP8vJW/qES6cGZzLskT8O5fyl
 dYuObc/SFlYiNpAj/fHtgLqlZPqxY7hnFqesxWgKjFSq6lcBk9EaQuHlpD5SK7KGEtfclFp9DFcWna
 0h17RZaAAVQurKjJxJQI8iVX8L39PRTo8O8FissVmBsoPtRE7SmsuS986oyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Since we can actually read back the APPS rpmh interconnect
BCM votes we can actually implement the get_bw() callback
and provide a coherent average and peak bandwidth at probe time.

The benefits of that are:
- keep disabled BCMs disabled
- avoid voting unused BCMs to INT_MAX

If the interconnects are correctly described for a platform,
all the required BCMs would be voted to the maximum bandwidth
until sync_state is reached.

Since we only get the BCM vote, we need to redistribute
the vote values to the associated nodes. The initial BCM
votes are read back at probe time in order to be ready when
the get_bw() is called when a node is added.

Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added tested-by
- Rebased on v7.3-rc1 now the rpmh_read() is merged
- Link to v1: https://patch.msgid.link/20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org
---
 drivers/interconnect/qcom/bcm-voter.c | 36 +++++++++++++++++++++
 drivers/interconnect/qcom/bcm-voter.h |  1 +
 drivers/interconnect/qcom/icc-rpmh.c  | 60 ++++++++++++++++++++++++++++++++++-
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index a2d437a05a11..9014bf20adad 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -261,6 +261,42 @@ void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_add);
 
+/**
+ * qcom_icc_bcm_get_bw - get current bcm vote
+ * @voter: voter used to query bcm
+ * @bcm: bcm to get current vote from
+ */
+void qcom_icc_bcm_get_bw(struct bcm_voter *voter,
+			 struct qcom_icc_bcm *bcm)
+{
+	struct tcs_cmd cmd = { .addr = bcm->addr };
+	int ret, i;
+	u64 x, y;
+
+	mutex_lock(&voter->lock);
+
+	rpmh_invalidate(voter->dev);
+
+	ret = rpmh_read(voter->dev, &cmd);
+	if (ret) {
+		pr_err("Error sending AMC RPMH requests (%d)\n", ret);
+		goto out;
+	}
+
+	x = FIELD_GET(BCM_TCS_CMD_VOTE_X_MASK, cmd.data);
+	y = FIELD_GET(BCM_TCS_CMD_VOTE_Y_MASK, cmd.data);
+
+	/* For boot-up, fill the AMC vote in all buckets */
+	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+		bcm->vote_x[i] = x;
+		bcm->vote_y[i] = y;
+	}
+
+out:
+	mutex_unlock(&voter->lock);
+}
+EXPORT_SYMBOL_GPL(qcom_icc_bcm_get_bw);
+
 /**
  * qcom_icc_bcm_voter_commit - generates and commits tcs cmds based on bcms
  * @voter: voter that needs flushing
diff --git a/drivers/interconnect/qcom/bcm-voter.h b/drivers/interconnect/qcom/bcm-voter.h
index b4d36e349f3c..fc75d457dcc7 100644
--- a/drivers/interconnect/qcom/bcm-voter.h
+++ b/drivers/interconnect/qcom/bcm-voter.h
@@ -13,6 +13,7 @@
 #include "icc-rpmh.h"
 
 struct bcm_voter *of_bcm_voter_get(struct device *dev, const char *name);
+void qcom_icc_bcm_get_bw(struct bcm_voter *voter, struct qcom_icc_bcm *bcm);
 void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm);
 int qcom_icc_bcm_voter_commit(struct bcm_voter *voter);
 
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3b445acefece..7f2b5673629b 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -136,6 +136,61 @@ int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 }
 EXPORT_SYMBOL_GPL(qcom_icc_set);
 
+static int qcom_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	struct qcom_icc_node *qn = node->data;
+	u32 avg_max = 0;
+	u32 peak_max = 0;
+	u64 x, y;
+	int i;
+
+	if (!qn->num_bcms) {
+		*avg = INT_MAX;
+		*peak = INT_MAX;
+
+		return 0;
+	}
+
+	for (i = 0; i < qn->num_bcms; ++i) {
+		struct qcom_icc_bcm *bcm = qn->bcms[i];
+
+		/* Use AMC vote for boot-up */
+		x = bcm->vote_x[QCOM_ICC_BUCKET_AMC];
+		y = bcm->vote_y[QCOM_ICC_BUCKET_AMC];
+
+		/* Consider enable mask and convert to INT_MAX */
+		if (bcm->enable_mask) {
+			if (x & bcm->enable_mask)
+				avg_max = INT_MAX;
+			if (y & bcm->enable_mask)
+				peak_max = INT_MAX;
+		} else {
+			if (x) {
+				x *= bcm->aux_data.unit;
+				do_div(x, bcm->vote_scale);
+				x *= qn->buswidth * qn->channels;
+				do_div(x, bcm->aux_data.width);
+
+				avg_max = max(avg_max, x);
+			}
+
+			if (y) {
+				y *= bcm->aux_data.unit;
+				do_div(y, bcm->vote_scale);
+				y *= qn->buswidth;
+				do_div(y, bcm->aux_data.width);
+
+				peak_max = max(peak_max, y);
+			}
+		}
+	}
+
+	*avg = avg_max;
+	*peak = peak_max;
+
+	return 0;
+}
+
 /**
  * qcom_icc_bcm_init - populates bcm aux data and connect qnodes
  * @bcm: bcm to be initialized
@@ -255,6 +310,7 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 	provider = &qp->provider;
 	provider->dev = dev;
 	provider->set = qcom_icc_set;
+	provider->get_bw = qcom_icc_get_bw;
 	provider->pre_aggregate = qcom_icc_pre_aggregate;
 	provider->aggregate = qcom_icc_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
@@ -272,8 +328,10 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 	if (IS_ERR(qp->voter))
 		return PTR_ERR(qp->voter);
 
-	for (i = 0; i < qp->num_bcms; i++)
+	for (i = 0; i < qp->num_bcms; i++) {
 		qcom_icc_bcm_init(qp->bcms[i], dev);
+		qcom_icc_bcm_get_bw(qp->voter, qp->bcms[i]);
+	}
 
 	for (i = 0; i < num_nodes; i++) {
 		qn = qnodes[i];

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20251106-topic-sm8x50-icc-read-rpmh-eba461a452e7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


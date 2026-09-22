Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9635D3F6C3B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101637; cv=none; b=HUzw4VgPVADte9XkR+YINmz+Xfr10YcHtyJzNV2hRJev1bXhfLbB1AF8ROvdr5H3GWuTHI+rgv4/hmBUZSdyXHg2bsQBBsqW54ih6ePSlG7sqiDKUo+4tsJkQbthnmLCc88iLQy2OP9yCFOUAIQvf4TznJTlle+V0/Q0H3+vKR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101637; c=relaxed/simple;
	bh=V88NOLkF/IJ670wq75ooUkU1C+dvWqwkp/u6sy43TNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRdgPMCjaeopJjk0L7DjMgoZYnzr8XiSmc4wutVjhHTbx3dGhL6nHEE0j3Gor73gXGRne9ONdEoi4xKQlxSXd0nSQBlEYa/+h5SZWJ9GURVwi/yI+8o7MN6mmZm6b+6QigMgaGqF9dPJthZadPz3SZyoIhjhceXXLKMyX9dLdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsY8SA/4; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsY8SA/4"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76bcb1eso1607451cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101634; x=1790706434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVeL+7vTFvXkSE5mBaWcD6vVnIFM7Y6q6/+RTD7RliM=;
        b=lsY8SA/4lwFuGz+r3SoS00ijtDNWKhbMpl6Isc2c/YIgBZVQsQUFTy/+CqFUjQhVRl
         Rt4DgRG/2TmT3+6BII4QebnwT9uAv2Z9uP12dLAJbK0UTeDQC6BFWNEuDf0pUrLcbv02
         27XhCWi+tu9dlpxYGFfS4xwbiDccT/mgMn21oer+qi6Rm+jHBONhh8ZtWAaZG9rZC3Pk
         c0FqgJVcPAxYT7LkIFTTQJYrTgmLHlagJNCm+DJi0x6qYkE/20maXubHzJ+B9gHNNnfR
         LOl5AjmcfW+Gc+/6YRPjKgdKYKXGgVCyuuXnJRRDrWbIF5PvmX68XHQlwCPFw+g1znBN
         hoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101634; x=1790706434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVeL+7vTFvXkSE5mBaWcD6vVnIFM7Y6q6/+RTD7RliM=;
        b=lLXO1UJtxWvEJj62JfzTjn0PnZAIn7N8vhY0YdSP447+0M2iKjATKNDP+YaxjcLTvY
         zC8M55TLpbIBPbuS0ptjtKAvXju2pK/q/K+Voq0gcYMwxYE1EOjPgQ3CGH+/F8eflqFs
         DV2vmArdTQgyFr4DqhB2WxM+pyn/42gfzuDzh1yVVG5gXcqPdDmIfgVRCeqFX0Pjgok6
         iUVChc5uwZrdzQHYRLrVQnBhEc/0nQVxvfE52M+HB24y3MtlcFmX/ebM1/AoUIHSSg+4
         lrp8ob8RO5zanMg66fK+1OrRpSwskYvigVxX/mSLQV/dWudCfhlRNzL1P1jBIouYjWVI
         0WZA==
X-Forwarded-Encrypted: i=1; AKwUvBx6biXrj2spZsWnuCMoOZKblaVCsksmsJaBN+PdJn42ZsKHYQI3YDZzKspSVJZM3NdAaoT5Xi0Gha9tsE0=@vger.kernel.org
X-Gm-Message-State: AFuF++k0FUuCyBuKf+fv4JR1RxrUI6VZmjAMsEfU6cfdmNS26raRD3Dh
	A/Gcz+kb704LEgHAdGenrHtI7MgVYpx/QHwWWqSOZcPENsfIzahlb/Ia
X-Gm-Gg: AYBFou0RR4ie2mmzdnB6kysY0Pn4JV4FEmLWv80SV8ONJzlkeV3w3yZFUKLNF2blgrG
	SN9fqifi3nCZpIU4N6jHv0/UdfClgCfZrgzAgDkxh9JNDUnJ/+CKvc8/ubSC+uutZLh7g45gLHS
	I5cFutcN6KmRIVA2gkmx8hciTypfoL32MGEwVa4pO3oqvAIeFJSXQunCqOCFeieuJsoax6mxHr8
	YeTSbh9pEDJiElz8xl8UuJeAPV4DiUU/IlkDc5NAnuTmx/t22gPYPINELH4/VZtu9fk3HqqQZMJ
	QgStryG8yM66wvxttIWZ07jFgZ8mOHr1t32vYl3TRvmUTiJblrbzzNqcqrNwo1uFcOYITLmKeV9
	iEigaJft0EQWC9FmoQCjwXJCpHMYZzdFQNvTnUD7FVbUhJh+kGD5IWcf7j/xqSuABxmO1cS9Ibk
	SSI9YQaZYXxCEwaQyM2c1+gqRhvOJ4DPgcYlA5nZBYwwo7fRazt9mAigJ1wFIwcMBcl8opvTV7A
	ZN4HnxArbkvHFK5KPtIwt3CC+ahEcNWlTXHalFM0Jv2Llf6RIGY8TFv5B+fkmRKH+tAVL/qU+Uv
	4ynJmuNRhI88kDLG9/IpX+efM+1KuUVXjbRSe3Mg+T2p5IqZQVoUL62OVUOISRHKgG7lEQ==
X-Received: by 2002:a05:622a:248c:b0:530:e0e4:b1ec with SMTP id d75a77b69052e-532eac93283mr6057871cf.9.1790101634364;
        Tue, 22 Sep 2026 11:27:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eaec2751sm3064991cf.1.2026.09.22.11.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:27:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Georgi Djakov <djakov@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] interconnect: qcom: fix endian annotations of BCM aux data
Date: Tue, 22 Sep 2026 11:27:11 -0700
Message-ID: <20260922182711.25176-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct qcom_icc_bcm::aux_data stores the values parsed from the command
db, converted to native byte order, but is typed as the raw little-endian
struct bcm_db. Sparse therefore complains when the converted values are
assigned to the __le32/__le16 fields and when those restricted fields
are used in bandwidth calculations.

Give aux_data its own native-endian struct type so the parsed values are
stored with matching annotations, keeping struct bcm_db as the on-disk
format returned by cmd_db_read_aux_data(). No functional change.

Fixes: c96fc14322ce ("interconnect: qcom: add COMPILE_TEST")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609221350.3Y8MOce9-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/interconnect/qcom/icc-rpmh.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
index 09d8791402dc..30ec31eafcfb 100644
--- a/drivers/interconnect/qcom/icc-rpmh.h
+++ b/drivers/interconnect/qcom/icc-rpmh.h
@@ -45,6 +45,9 @@ struct qcom_icc_provider {
  * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
  * @vcd: virtual clock domain that this bcm belongs to
  * @reserved: reserved field
+ *
+ * This is the little-endian on-disk format returned by
+ * cmd_db_read_aux_data().
  */
 struct bcm_db {
 	__le32 unit;
@@ -53,6 +56,20 @@ struct bcm_db {
 	u8 reserved;
 };
 
+/**
+ * struct bcm_aux_data - Auxiliary data of a BCM in native byte order
+ * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
+ * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
+ * @vcd: virtual clock domain that this bcm belongs to
+ * @reserved: reserved field
+ */
+struct bcm_aux_data {
+	u32 unit;
+	u16 width;
+	u8 vcd;
+	u8 reserved;
+};
+
 #define MAX_PORTS		4
 
 /**
@@ -135,7 +152,7 @@ struct qcom_icc_bcm {
 	u32 enable_mask;
 	bool dirty;
 	bool keepalive;
-	struct bcm_db aux_data;
+	struct bcm_aux_data aux_data;
 	struct list_head list;
 	struct list_head ws_list;
 	size_t num_nodes;
-- 
2.55.0


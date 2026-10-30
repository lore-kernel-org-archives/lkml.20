Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384147;
	b=VMvg55LsjuN/Be5wAAxUcLxzoywAP0oWGsyNrpU9EJ0uMN3esmdFrKK9weXr+uNHMCY2
	 Pntot/2U7dm9agUzfEnNrJmaePJDstItmOts95MUJrmcWPz+E12ikAag6T7qtq3jC1gbJ
	 zcTrKMNkxrejRgBOrlJEENQ8qn5QpR6AgZD93mZ2U4H5Gv0T9Vq2fCZO3wTfq9Oq1kg8c
	 jp2/CpK/FOdhZh6QbpMWqo8+/82O1rFHwMPBgEypYmtnLSHI1+mB+w+Q3YVykx/sk0/5I
	 B20e/Hx2bRDCqjz5taDbooyIdTWMtceBrWRS07hYgnMalA/cMdqDx3cPGxTW9jOUMAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nF9bQw3tAQtyXn+Lf9VhF9hLMi4KceB22RjvEpSde1s=;
	b=QZOr6e8C67VQ0AO8dKXWD1sj4yFXYUKlBJnJxK0OALoB9vv+xxgEUC9tpgF4JTW69xKv
	 1bydJqcV1GGRnM79bsfHT0HrXUaAArvZ2YRZgdVl+ehbJwKVLwfqEPdlmDCfUjXrpEIPj
	 wYipmAsjAw8Bd85flZt8R+3dGAU4axJ1QutgveHskh/zzh2BgGxrFSbmgmQzxe/9NCnkd
	 xZ+b2PGrExlsd+yla6xeNbNfvdrwar77dvvbPrZnZcK1JU93GXaNgo5AAzX51yMKjaQkw
	 NT2943KWnGaPLz1gHxuwzD3RD+OJA9OtvHSFdcogomakAOwDVrDomQSNH+h2i4SJg3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=cPgDCuw4;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98824606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98824606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=cPgDCuw4
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso272509241.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793384145; x=1793988945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nF9bQw3tAQtyXn+Lf9VhF9hLMi4KceB22RjvEpSde1s=;
        b=cPgDCuw4S+88w1a4e65HGxEcO8nMD9xNx+iaSGqqULGZS5exzi9ys4cTfuAPe8Y4gt
         S+InFiyCsYfwNYl2ctScgl4SBj7W9+OntGbXVub4jYaM7ojQEWlIbR4n/mJbOkL08uu0
         FwurcLcJNVH2CZcu01ukpCEj82GuFyTI+p1d3O2lceWt3yVKicF4BgudeSVDpLeLTmtk
         365hC8CiPWkgA+7luSEzpPd+6wdCbwUhJBCN5Tp2Z3GDvl3zzrCOGAOZFpr8bp6xn+kg
         hVibNb7MZwX498XPv37cU2QO+tb70fmE4BL2tuJOxPQKCEfIZJyct42pds9ZjSSqtE1X
         mZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384145; x=1793988945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nF9bQw3tAQtyXn+Lf9VhF9hLMi4KceB22RjvEpSde1s=;
        b=MMFjc9h7IkKd7yMeQvFsFi7JpajhNEREQ3lBOT/+5XaCiIvGDVNM3oGY7RAyfGUwZT
         eXuISyOBasCjjEavkOvxKr0u984HkBXe8PCSOyrxlzw0DntBowYKFQQKOVmR2Rdus13M
         rmUAPAVGUN/190UDXxVN0Oe+Q4iDIpVVpfJhvM54Lv9C1FXfKVEAcfLPL04Kg0ALZ3xZ
         0hmKowV0x3rBekIbLDoBK4Ccpv3stUZfxqdyO+/GaUsv0JALJ/iHR9rVOPZXu8a4yUQv
         Wnh6ra9t6Da4wKwXMnMSjYBxxhu/4icYcU33Hoi/MNASNHlefFVRhBzlR2e2TwcmX+i3
         157w==
X-Forwarded-Encrypted: i=1; AKwUvBwQq9Lval2m2VyRzLrmMq+25U2jTh0w1zscudOBr4mCaGfMhz/jbrdvaOQXMHbFZeXoLh8OKQX+2gGcS7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+LwpPbd+RCn2/ckvuFFXW1dbfKgQFUp7gjnkuW68mWgosVh1Z
	eLNnsUwTUMwi58lq0SEPjV18nH30Df4NMu0M/JAXSaTxn69JG7wiVHseIgZkoIwJOVbF
X-Gm-Gg: AYBFou0i+ApMpiLQisLffBkzZuznqPwHgNLF+ZakxKFs709MZJ1PGLOQ3TSMsFeIcTG
	/c9ksrt77nv+Mz4RK6HPugGVAFe+luUU4sRqWTMathh31TjAgzqnZsXb0ewqi26rrTXrtVwOl3O
	zf8w2WOvg4kVV2kYwxuOmxqhFsstJAAqEo8U00hs67SvMlMgfs+5I8p2jsAvXntRy7nNwFupzCi
	cESCuujX/doqadtmqQ48hNyRYDsx9Fy0BNZ5yrKs/aYX1LXneNybQ+3OrsD8OsR5tusfM7jzv6w
	CL04v7hFDjyE4AMv1yiDwxwNTO1X5FuCvmNhsBlXtdIg/UJGJqBQ89oz25rl4+yLK7TYuBgo/qp
	HmcLWMFza7yuzqIGkBaJOG9ULCpHt2nT71+AM/2V/wwu8bcsWYmhuWF1w6UkdzcmpImln/oZx9S
	OXGBw98XhnUUi7aHXZMxfY9BZ+fbSTBUPj3JfWbhSYoJ4YTH1YtEh5Qker77SfYXFX+zWb/0tXV
	4pkSaAEkYBoLF10prSGn0Ap7zLBdZPSGPcusej/Lun1ZRYvUPJ+L5gTESexdZZ9XpWAArrCePO/
	X5/vr3AcVfoxLZma8sEAGB+tRsTY6KYTHKEss/3LLFrp9GlK8rapiKHBj9r2q9bmfE1ldXrdmXH
	9KKXw5Dc71yenJl5ZFGzdCON4YNVEqStc6Ck66Ao594Y=
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr1462792137.24.1793384145522;
        Fri, 30 Oct 2026 11:15:45 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm3077931137.3.2026.10.30.11.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:15:45 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Moroni <jmoroni@google.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v4 1/6] RDMA/irdma: Plumb uverbs_attr_bundle for QP, SRQ
Date: Fri, 30 Oct 2026 18:15:07 +0000
Message-ID: <20261030181512.2056056-2-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261030181512.2056056-1-dhu@x6u.co>
References: <20261030181512.2056056-1-dhu@x6u.co>
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

From: David Hu <xuehaohu@google.com>

In preparation to support modern UVERBS ioctl attributes (such
as UVERBS_ATTR_UMEM for CoCo DMA bounce buffers), we pass down
`uverbs_attr_bundle` for inner QP, SRQ routines. Since standard
uAPIs provide `ib_udata`, we derive it via the helper macro,
`rdma_udata_to_uverbs_attr_bundle`. `irdma_create_cq()` supports
`uverbs_attr_bundle` already, therefore, this patch fills the gap for QP
and SRQ.

QP, SRQ uAPI will now have `ib_udata`, and CQ uAPI has `uverbs_attr_bundle`
as a top level input. However, we think it is a future project to unify
them.

Signed-off-by: David Hu <xuehaohu@google.com>
---
 drivers/infiniband/hw/irdma/verbs.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/hw/irdma/verbs.c
index c91c55917de9..811b1d532599 100644
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@ -637,13 +637,15 @@ static void irdma_setup_virt_qp(struct irdma_device *iwdev,
  * @iwqp: qp ptr (user or kernel)
  * @info: initialize info to return
  * @init_attr: Initial QP create attributes
+ * @attrs: uverbs attribute bundle
  */
 static int irdma_setup_umode_qp(struct irdma_ucontext *ucontext,
 				struct irdma_create_qp_req *req,
 				struct irdma_device *iwdev,
 				struct irdma_qp *iwqp,
 				struct irdma_qp_init_info *info,
-				struct ib_qp_init_attr *init_attr)
+				struct ib_qp_init_attr *init_attr,
+				struct uverbs_attr_bundle *attrs)
 {
 	struct irdma_qp_uk_init_info *ukinfo = &info->qp_uk_init_info;
 	unsigned long flags;
@@ -981,10 +983,14 @@ static int irdma_create_qp(struct ib_qp *ibqp,
 	struct irdma_qp_init_info init_info = {};
 	struct irdma_qp_host_ctx_info *ctx_info;
 	struct irdma_create_qp_req ureq = {};
+	struct uverbs_attr_bundle *attrs = NULL;
 	struct irdma_srq *iwsrq;
 	bool srq_valid = false;
 	u32 srq_id = 0;
 
+	if (udata)
+		attrs = rdma_udata_to_uverbs_attr_bundle(udata);
+
 	if (init_attr->srq) {
 		iwsrq = to_iwsrq(init_attr->srq);
 		srq_valid = true;
@@ -1071,7 +1077,7 @@ static int irdma_create_qp(struct ib_qp *ibqp,
 
 		init_info.qp_uk_init_info.abi_ver = iwpd->sc_pd.abi_ver;
 		err_code = irdma_setup_umode_qp(ucontext, &ureq, iwdev, iwqp,
-						&init_info, init_attr);
+						&init_info, init_attr, attrs);
 	} else {
 		INIT_DELAYED_WORK(&iwqp->dwork_flush, irdma_flush_worker);
 		init_info.qp_uk_init_info.abi_ver = IRDMA_ABI_VER;
@@ -2337,7 +2343,8 @@ static int irdma_modify_srq(struct ib_srq *ibsrq, struct ib_srq_attr *attr,
 static int irdma_setup_umode_srq(struct irdma_device *iwdev,
 				 struct irdma_srq *iwsrq,
 				 struct irdma_srq_init_info *info,
-				 struct ib_udata *udata)
+				 struct ib_udata *udata,
+				 struct uverbs_attr_bundle *attrs)
 {
 	struct irdma_create_srq_req req = {};
 	struct irdma_ucontext *ucontext;
@@ -2420,6 +2427,7 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	struct ib_srq_attr *attr = &initattrs->attr;
 	struct irdma_pd *iwpd = to_iwpd(ibsrq->pd);
 	struct irdma_srq *iwsrq = to_iwsrq(ibsrq);
+	struct uverbs_attr_bundle *attrs = NULL;
 	struct irdma_srq_uk_init_info *ukinfo;
 	struct irdma_cqp_request *cqp_request;
 	struct irdma_srq_init_info info = {};
@@ -2430,6 +2438,9 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	u32 depth;
 	u8 shift;
 
+	if (udata)
+		attrs = rdma_udata_to_uverbs_attr_bundle(udata);
+
 	uk_attrs = &rf->sc_dev.hw_attrs.uk_attrs;
 	ukinfo = &info.srq_uk_init_info;
 
@@ -2470,7 +2481,7 @@ static int irdma_create_srq(struct ib_srq *ibsrq,
 	attr->max_wr = iwsrq->max_wr;
 
 	if (udata)
-		err_code = irdma_setup_umode_srq(iwdev, iwsrq, &info, udata);
+		err_code = irdma_setup_umode_srq(iwdev, iwsrq, &info, udata, attrs);
 	else
 		err_code = irdma_setup_kmode_srq(iwdev, iwsrq, &info, depth,
 						 shift);
-- 
2.56.0.317.g454f8302e1-goog


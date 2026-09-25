Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9448423C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329956; cv=none; b=jExP1KMzrER63iS/z+tYK5afMMAMOH9CsTlgt6+a2AHwuB1kbsDJqYpjqaFlnBiC5jFhRdTH7ondCvp/yc0DVfiE9ZSdU3vk+ZG9GlHX7uxoy1g6Wo3b/NNAx8bLvCYYB4bWwpCVZsltOr+f79OjI9FxfSB6ztAPywS1mB3siT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329956; c=relaxed/simple;
	bh=vd129JXxstyyLLXo+yLc/lqQTH4ulYrTiulcSGsQgkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZe1eIRZKHcmC72guBmiZNQBP3Z2zALlJa0HaKhOhD4r9dT+HUU5E0GJKucExjId7JGlpHrEHAJhHBbovpUo+AMekUWhOMqqx5QtFPpBeLd0fEqMueVSsqi/zxZp+r2hAadNmhOWg76Esef9e6HqV00tgYRQsKZgxYER7yHJsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1eHtvvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyr8lm9U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1eHtvvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyr8lm9U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J3Xi756774
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAoEZk1fZDAdmdVll2W8+LrBtf/dPScgRLhUH7IyTrE=; b=l1eHtvvv47iIeeba
	NM3OrNpKgEYq5ivO4Nt2DJ/ZcysysQ7Mj2CihYTcYpJHpevK+GK9CE1IZrZxN25D
	T4O/fCXs5138WSotO0aBwooUH1/os7KbiBtScHIKbn368eps5goQ5rZSjQpoJHC4
	kFBuwTg2MAdIDItRzzKmWeR8VP9gAb+yomY/+79QmuTO2aBnkjdDGwYoqUF75eTy
	xzeGk915rG6GSphRCT1HUWqY6S+bPfnHoncyzl2Cdjc+y/goMEFe5IbJcT/fHWOn
	3GeQQYIVwDjBdfBe4zCWgf7wxszzmTQzBDAvfVPMYcbbrSedTgpMhLYlgIusbinC
	TyZZGA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08trp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9143947f839so4065716d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329951; x=1790934751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAoEZk1fZDAdmdVll2W8+LrBtf/dPScgRLhUH7IyTrE=;
        b=Dyr8lm9UGvvGz+mPcBMq1bGRoBZ51eAN450o3jDjIUFZdRCIbmcDeON6zoj8X99jv4
         SxyDCONzrTdaqM5S64qT6HSCcrJU22AH2sTeEL5x/vVJXHZPgaRttcPw8A8+aBecswJq
         qKEWKeT/WwCs0f4KvPD9cShwpb8TXkjS+/Kbx9DkdaNZHtSEBUuBbH6yMFNRsOtFtu5L
         FST3sbwZ7LD4tpU1CaRvSB+86INr7IcL2soxzT5UXG9LfpIUCH/4GPy6DI2sxfuv5+Nb
         jcNkjkc/F8PWpibBPtaXBUWyFlv2XU/JYTvvpqwFczCMwppBLe/4Zjew+Gzq/0foWSW/
         tuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329951; x=1790934751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAoEZk1fZDAdmdVll2W8+LrBtf/dPScgRLhUH7IyTrE=;
        b=W/g0YABdoKMbPXxAQFNkhlkWl/aRvWdpJg67itp/IhCZmN3pKDIIFJxQ5h2E1NRXmW
         3xBCiP9h55f3xBpWhmMKlJGW3OsyQ6eV1AQvh1P8a3sPyL5ptc/+vNppdtGPge5JqJQw
         oUZqsVFCUeAez1x9wdDeqORJF9nupIruuCUtCpOGFLod82EwXkx4mINBlWTdrJNhW0Ay
         PsYQ5WBJxE53Ex5wnu5XUDIJWz0pPcGHGhLshQ6zEISJwI8MUXjAV+loGt2Q24DbO6gH
         tdmTnsGgoOUvx8n5hdUOnG6XXghg6mQWZAlgIX/sOn/CjTQXTJi1JAoWuO+MH3m/E++4
         bSnQ==
X-Gm-Message-State: AFuF++kwpoJVDKsixstFMFvNYmtxboUtEySdKp8ZA9+FMj4qNORpQ/gk
	pLCxIn2Q5Ae/cEPeQAmh7UwX2KvK8spskEgl3Q+S9rLtSJgkQjROvP7kcojTEw2Kgp40Aa+jJqi
	A2qmtuUp+BBRYZ51N88FtOmgdfjN7LVEAq5D3EbR9gUXj4xJmCUGR04R5hZtQTUjdx4I=
X-Gm-Gg: AYBFou0vrsD5pjzNYw0XXdD09UCn2hFB5F923UTqKeMRXTawpQTiK/sXfIJ39qHpksB
	ovME31RVb/t0k1vQLAm/7V3D8Kwe8vjhZMZmIeRsWo/urRj/+Cjf9tgt/LqB9A7k0KeGNOwgjev
	Eru+YNGazi/TxEkwU8G11cdLX17BCjVC+NraJA2PgOLnaIITOTV1dEKXtaCpnU664lWn8+4KGZ+
	4r6re6bcFpU9IZJNVN/9pshDlIJuxtUhmInoCbv3UQN3zAH//WFKN9jZJAMsZviEwqO3j8dpW3r
	yyu/+MLadann8OR+8CenjXYPPWcttbp+GqXSrw1mKrr3mOCVPyK4wmx93OLwpLpAQW1rA0hQcOK
	/XPwr88C6JqoYktfxxlrDML1Lhqg1
X-Received: by 2002:a05:620a:46aa:b0:939:bd4e:b2fd with SMTP id af79cd13be357-93c43cd83ddmr320282685a.43.1790329950894;
        Fri, 25 Sep 2026 02:52:30 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:939:bd4e:b2fd with SMTP id af79cd13be357-93c43cd83ddmr320280885a.43.1790329950391;
        Fri, 25 Sep 2026 02:52:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm47282535e9.11.2026.09.25.02.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:52:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:52:16 +0200
Subject: [PATCH v6 1/2] nvmem: remove duplicated reference counting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-nvmem-unbind-v6-1-9e3d02cf8964@oss.qualcomm.com>
References: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
In-Reply-To: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5618;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vd129JXxstyyLLXo+yLc/lqQTH4ulYrTiulcSGsQgkA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtkRYjT4DKnF72uvj19MeaCSEla8I0GMgqqFW+
 SG2XMVJumCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarZEWAAKCRAFnS7L/zaE
 w9pwEACazNG2Y7nEDqlkAY3Ikb1v/HYWQ62Nz6qKH2HtZcYZKWZDXLuHZ8XzbcTbcHly5qj9cpq
 Ta/aPbIAlZRPKBeNYZwyLX2mS2Z0IRHcRAG+i7a/DfRrjtRL0Dim/4EnN3MYCQTw4/txJQWhQhs
 JShLm0q9wIAy621IBg8Url1slswQyKO6QhAYhuYvvjRj8EyOFDgBLlLDbJiwB+wgHbrnOxUrY4j
 yAak6Q9jHpYt/SGXM8ojUK9qPgdqDax93lDqkk02EJVPWRAaPbitHzdpacn/R9IWcno8drF1BLQ
 TMskLJs/R0FVRbxHW5FzZ/vTioESQDPyN7KtqoJFIs0nkGxweJLHDQ9g4iZrvkL08MZl+/JOvTt
 ZMJFZ4+KZjvd78LaMLohWpWa6iW3os5TsTIUPc7zAiSusEBoLg5nxOiHFYhQloc92X8iozaglt3
 xGyfMSbeAk518WMVcevldr9ik2r5BU6cNE6UyxmffDsHYzqROeI5a+3ySlwLG2ziNZfTKLO9Zxg
 AZJmWTfskv404tfQWshUeiVlaMuVaW+VTRyCTNgVSJxtPGQs4MrTh+Khe0VYXDP3Sy0HWLRm/aB
 9z+q1qzcEoFJ80VY1zPQ2Ce9UN6ulYgznI9K1eebFayRlN80etb7a2FYU1hPcgkLdGwIHf+Pau/
 c/nUYaZF0qwsvgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX5Z017K7pvJHv
 YYBCgbGWnz2No+l03TFPaezstNyOKsyX2ZBEMm37OlVJKSxLXc0E5Wo7SIkb6moA1pFbkcoba7A
 ziI5xwQR5hC3TZ2UvzbEkVv9lpyNGFY=
X-Proofpoint-GUID: jO8ZpHZ3RBdIoYPGa-6bW3olPJC16ASN
X-Proofpoint-ORIG-GUID: jO8ZpHZ3RBdIoYPGa-6bW3olPJC16ASN
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6445f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IOj402APi-VxR199s-4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXwo4vv26EhvNU
 d6B/N4uuugWuoRNhGmXZXc77Kcp1Yr4cL65ym60U/aDLtkSJlG3wUaU0ZJtRRoNbWij+Rcf/U4p
 F4IXkoTAqtGA84nnHRIZhZDRWLNz5/z96r7lrL1xKORQ9NQdtA97OwPkXPJ7hcAxsqcEmaaLzRB
 OnH05Yx7jW7phqkF5lyySItpvuOOb6UGCF+Si7/MLg1LOrlBw3a+qDs1Bm1UW3AVKK+e95J+vVA
 WIsJw4uEOMl3F5hrpuNMkVyEMYu2RJT3jkmMC0ndLZPYGtB5wG+SHRmbuT7WKFDj0djgz6s6xs1
 0mUOLb9ObMzKYPTFu/pnGqtWFePbyqiQqgtoZ/s1mFIYDf4k21lXM+FGDWUDD90IUE45F3pGznc
 MOJrgDhumYccR7QAENti5nReXI4jiv5g3HcdQMCGrJEJCxR4glxiqC5NNOwiMuOlLiNiOjnDXPj
 IddLyqGgiV8PJRFPz5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

Commit c1de7f43bd84 ("nvmem: use kref") introduced reference counting
with kref to an already reference counted nvmem_device structure. We
only need one refcount so use the one provded by device's kobject and
drop the kref field from struct nvmem_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c      | 80 ++++++++++++++++++++---------------------------
 drivers/nvmem/internals.h |  1 -
 2 files changed, 34 insertions(+), 47 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f3024e5a5c5ffae08d34c1155f7e2e31fa8a6fdb..2398d33bdd12eb7d6cac185a49fa6a79da13b1c5 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -535,24 +535,6 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_release(struct device *dev)
-{
-	struct nvmem_device *nvmem = to_nvmem_device(dev);
-
-	ida_free(&nvmem_ida, nvmem->id);
-	gpiod_put(nvmem->wp_gpio);
-	kfree(nvmem->ops);
-	kfree(nvmem);
-}
-
-static const struct device_type nvmem_provider_type = {
-	.release	= nvmem_release,
-};
-
-static const struct bus_type nvmem_bus_type = {
-	.name		= "nvmem",
-};
-
 static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
 {
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
@@ -571,6 +553,25 @@ static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 		nvmem_cell_entry_drop(cell);
 }
 
+static void nvmem_release(struct device *dev)
+{
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	gpiod_put(nvmem->wp_gpio);
+	nvmem_device_remove_all_cells(nvmem);
+	ida_free(&nvmem_ida, nvmem->id);
+	kfree(nvmem->ops);
+	kfree(nvmem);
+}
+
+static const struct device_type nvmem_provider_type = {
+	.release	= nvmem_release,
+};
+
+static const struct bus_type nvmem_bus_type = {
+	.name		= "nvmem",
+};
+
 static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 {
 	scoped_guard(mutex, &nvmem_mutex)
@@ -918,6 +919,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.type = &nvmem_provider_type;
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
+	INIT_LIST_HEAD(&nvmem->cells);
 	nvmem->ops = ops;
 
 	device_initialize(&nvmem->dev);
@@ -931,8 +933,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 	}
 
-	kref_init(&nvmem->refcnt);
-	INIT_LIST_HEAD(&nvmem->cells);
 	nvmem->fixup_dt_cell_info = config->fixup_dt_cell_info;
 
 	ops->reg_read = config->reg_read;
@@ -993,20 +993,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (config->cells) {
 		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
 		if (rval)
-			goto err_remove_cells;
+			goto err_remove_compat;
 	}
 
 	if (config->add_legacy_fixed_of_cells) {
 		rval = nvmem_add_cells_from_legacy_of(nvmem);
 		if (rval)
-			goto err_remove_cells;
+			goto err_remove_compat;
 	}
 
 	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
 
 	rval = device_add(&nvmem->dev);
 	if (rval)
-		goto err_remove_cells;
+		goto err_remove_compat;
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
@@ -1032,8 +1032,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #endif
 err_remove_dev:
 	device_del(&nvmem->dev);
-err_remove_cells:
-	nvmem_device_remove_all_cells(nvmem);
+err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
 	put_device(&nvmem->dev);
@@ -1042,21 +1041,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 }
 EXPORT_SYMBOL_GPL(nvmem_register);
 
-static void nvmem_device_release(struct kref *kref)
-{
-	struct nvmem_device *nvmem;
-
-	nvmem = container_of(kref, struct nvmem_device, refcnt);
-
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
-
-	nvmem_sysfs_remove_compat(nvmem);
-
-	nvmem_device_remove_all_cells(nvmem);
-	nvmem_destroy_layout(nvmem);
-	device_unregister(&nvmem->dev);
-}
-
 /**
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
@@ -1064,8 +1048,15 @@ static void nvmem_device_release(struct kref *kref)
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	if (nvmem)
-		kref_put(&nvmem->refcnt, nvmem_device_release);
+	if (!nvmem)
+		return;
+
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+
+	nvmem_sysfs_remove_compat(nvmem);
+	nvmem_destroy_layout(nvmem);
+
+	device_unregister(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
@@ -1126,8 +1117,6 @@ static struct nvmem_device *nvmem_device_match(void *data,
 		return ERR_PTR(-EINVAL);
 	}
 
-	kref_get(&nvmem->refcnt);
-
 	return nvmem;
 }
 
@@ -1243,9 +1232,8 @@ EXPORT_SYMBOL_GPL(devm_nvmem_device_put);
  */
 void nvmem_device_put(struct nvmem_device *nvmem)
 {
-	put_device(&nvmem->dev);
 	module_put(nvmem->owner);
-	kref_put(&nvmem->refcnt, nvmem_device_release);
+	put_device(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_device_put);
 
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b3ca41404d52b893b1d27b962e985..2c3645a2727270298139dd7b49b81fa0bda58ad5 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -19,7 +19,6 @@ struct nvmem_device {
 	int			stride;
 	int			word_size;
 	int			id;
-	struct kref		refcnt;
 	size_t			size;
 	bool			read_only;
 	bool			root_only;

-- 
2.47.3


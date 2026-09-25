Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C148A8B7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329958; cv=none; b=c2mZV0334khRaaA1apckq6H6EKYj+9YurIpe268pmA1ERsQy3XP6pSwi9RTmaunRDjja+c8ffuKZ7noZCnWKDg+cnFAUsa2C9Ash7R+JIcDEhnqhISqisyWUJha57ddNjjYn7gteaoXwktaWRpSY84ss0oN0fCYIymDbdhkLyXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329958; c=relaxed/simple;
	bh=OBWbX5q8G4ftRvCUoBiGFmo1UWikfGvQ+drEAi+3d3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UexoeAfvMGL8HYtV/WXurdmeijjcgUXCHnno6YP2B3DIJPM8aqtNd/G9f+NWDsqJIsqrZaykzlJAOOBl2zreArrcDh1SgtzyMo0bIJ+goItEUjGUGKDbOS4rDo1dm7HwyRmFFIgevUNIMtxp7Y2EAUuIVUTZ4BqssH7lIyjY1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy/zpnvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awPG17iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy/zpnvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awPG17iz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ydlp2911789
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXE+LviryEgD4iVhgqQqrZYQU0oosFjjqD/wlupAlEI=; b=Qy/zpnvYeQ/YQHdk
	bUSKgqK8PtgbuPwbTtJ4VqchOsWHZAoWVZbysJ5/nv5lSoMaWqmOa5ahSU1CcWsB
	0AxjY+TQed3Y3T2Z3qvG7mtzCqstcc1bTsm9PpsEJ4YHB3pBZr91TGBY7uJ6olYp
	SbkEz7HRhflwiYrLV3f81dsFU8EkPGZOIXGiWcUMC4Qmbbt6UcD3EaHlLKZbseiH
	4PurZcSSQpspp+DVtbucYvARr+CRMRKEWnFX1a7eImVD33si2bRD1i1nQGqtfJYZ
	+68kUQXa8H8R2zQYYtRnYfto4ej9MAwCe1eYKBhrRmhjfgplNbJFkfAAETr9cHFt
	6kE6eA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51147-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:52:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so72533385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329953; x=1790934753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXE+LviryEgD4iVhgqQqrZYQU0oosFjjqD/wlupAlEI=;
        b=awPG17iztLhmfG+OigZq0tJg3djX85b9HlqvgT+Afv7tGEhtl3BaZgsgzsYSs/sIfZ
         6rq9p1Svwrb43DfwmmNi6p+q+nlP7Z3oIHLtaH8Zr4qCh4j0FhJeATlweDKRFTmVkR8r
         PrrVH22VCfK/n7vnQZfE4IDRnG6p2OSPEgmqX03GMy6Qs30YQDZROCzd0/AwGFx3VaXN
         V94G81f/ui38ngDsFuuajDzKvKdxJDElylD+MTXxq6OIy3IY24mWIkEQfqju6tmDfQm3
         /cP4B6TXgKFMxlgul4KuxM8kPUrecEHbuLyf+j6Hasm/C8buIQmgZrBWZUBs+pE6jBHQ
         zm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329953; x=1790934753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXE+LviryEgD4iVhgqQqrZYQU0oosFjjqD/wlupAlEI=;
        b=s//jiYmLrNCAHInbamzQy0qKSuCgaYIA7hL/fId6b6WUGMWbUoI1e5LJ8UcJssrb9j
         PiNnor3TnOKml5Q9qIN1PSWPixgaO7lRb6ty/g0PHvLjXcC88jDQl5OVq0gELQpz6JxZ
         ckmlddrl84QuxRnG0AfI+SJ3fw/k7MFXvcateuZLjJVFd//RJwUaCDMULKpjxUD0r4x8
         0X89VGEj14nVe0qLI+H/WRQXTVuTaqENMri1x3PUEGx22IEfGb93vJBE0xbg2iwhr+nm
         o1/ZIosV1ugkVuC987hO5xrYGqyCMRfOEvGolEVXGyieAhlkX0C8z0N5vwvLCvZj5RTB
         fr+g==
X-Gm-Message-State: AFuF++khu02xv7caL2yYIVJyKcJaRiL3bqK40pFF4U9K2x9gPy26SnXv
	TLnLdXLRNpVTZ3fxSmatc4ckc4FNDnczkwtf4aiSA7Wze7qiFVPGgP6I5LwvCKZKR404kX5N2q/
	MVVMmE0A5OqdRVjnPDIZmOMjMkaGqbNJjEz/rihGka9rOqasco/yEz7rT1OhCpIa5f4jbSLLdZc
	0=
X-Gm-Gg: AYBFou2W08H5d3CDqZIwjTWXwsH0c2Kw/0UwyDYPbtK1LMXtWN3ne2EJyI1Y5AHXbP3
	jOINvb4/l+zVONhDCQoSvlmkvWx0RjG5NelOhK1mGabLBUukQHQtTlZmiaMMbUyAAoS35d9xTuq
	glxpHEt0ihXjxPFsMu9GODKW3FMdUy/OAZt+1qhxOCOrps1GOA4/i+0EvNz0ZO7rk+OrDHbkEje
	Ru3mMlQaRUjkN3TigYjGriE4sljSoUwukfoTMAFqZL+z9dRDAX/gCPuZZhSvjuzXHHfOC3xznOg
	8vZus6NUYGAP4oONR1lcH/Q1vZWPIU0Z8XoWhtQnjNy5FCmnLcWnfWlqI2w5NApAAJndK8laBuA
	PqSdQU6oUe/RfdsFHrtcAUgc6UT9q
X-Received: by 2002:a05:620a:700f:b0:939:15e:1a5 with SMTP id af79cd13be357-93c43cb66d2mr356161485a.35.1790329952933;
        Fri, 25 Sep 2026 02:52:32 -0700 (PDT)
X-Received: by 2002:a05:620a:700f:b0:939:15e:1a5 with SMTP id af79cd13be357-93c43cb66d2mr356158085a.35.1790329952364;
        Fri, 25 Sep 2026 02:52:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm47282535e9.11.2026.09.25.02.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:52:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:52:17 +0200
Subject: [PATCH v6 2/2] nvmem: protect nvmem_device::ops with SRCU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-nvmem-unbind-v6-2-9e3d02cf8964@oss.qualcomm.com>
References: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
In-Reply-To: <20260925-nvmem-unbind-v6-0-9e3d02cf8964@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OBWbX5q8G4ftRvCUoBiGFmo1UWikfGvQ+drEAi+3d3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtkRZJrPvYmRlQLP/+mG9rCHBNA3soWl3xa0jx
 BzG1fFN9eWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarZEWQAKCRAFnS7L/zaE
 wy6ID/9jkFbHlnFuJYlFybOeKpQS3ELJi6k3+SF62YgxGubFQ/9GNpiHSflhq0GaU7qNWQVSKeD
 5Ko69zbSJZLnLIkSrEwfzZiC5I7OB8EvH44FNwoUeW2uC0QE0gJ6UMwsYTzU44L0xxaCgP8fl36
 ytbJVZBdTnQZiykP8f4ZgbwQ2Jo0xn9YI01Pj3L1EP+wFTHCtAbTwqHmq7sepa5N17Z1rVDRUen
 tMcrU/Nu51CZF6xlT9evWXxgYieB0A1wckVqVw1bEda9AaiMn2Cu0c3Y6f0JIbOUZ7koHx+9HgG
 EjhixEX+UQpsH7H8vt0F307thlmrny7Wq7ksP8IYduW1J1KKQ55SZkwr3w+FvNNHjp8TnKtHJNC
 2ImIpmwd2RPW7eV8TyuBSTIxXOEsWxAMMquCC+H7zx+jzMQs+vb8JGLnLzdyb8f8iwqOjdl4ysO
 XoiGRs94GtpKqBdpLxT9DLRQau3yTWUwRRLEzHQQYfXZIKDhbHRtmvglagj1kVUAv5hju/KwqW4
 8JTeUrTcW1uiFRm0S6voctitKAbRzGdPkrEXdi9blQAnhVwfKm6f0SpOBraw6qUzpr4tfUp4NM0
 DlX/S7j6Lblx8MYXR5KmHYdUYvd7vdvMH5ts+B22zOsjMD0xnqe7XvMdCerYGB04VcWsdaub3Ia
 0Z46zJZWl1r+Vfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vyygIw_RbWUrfjK1XPoYO01zxKdRlED5
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab64462 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ydBWjX_Uc0Q5hLJtmLYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX1uTy5oPC5C8B
 Mq9E2VmvZa/K2R5hezTW6ZvvVm+JP0NQvScc/Sf8MY1HhUfUnCxXLx3xSik8Ng8u5e9NMp9YIE7
 FVSLsBtXyWZTDrlqsan/ac1q/rICYrZmBm+8eCwzFw8rT78i3UIaeCQWFBx6b/F17MzZNCtrz8d
 nEz+K9IuXWO0ZFc4u6zi/tHfPeof0Rg+420unBDqHrsQ3gDQwuiXC1LtoGxDkBtHKfbRrrVJ/ga
 FhtMbeHX+jN/8mf7lDL6DKaSKmRQJupcaQ004k336MdO5dnCxK6ZdWW6DM6oYotPYX1uXbLtUiX
 uPEf5TV5diFRPzIhWpLjMUs3qk15ZV2Lz4qfEc6+aPLgb8ncOitJa04vgfJqySXagbjV9sWUNbk
 U13DV7W2dt7iCHbEbFbcx+UrekUKEYIOwCEI9HJH3tHxmqN2p8rN3jJ3ugZjeZfYz/BsuGh+YS3
 VOm+Y862AFIJWp7DYvA==
X-Proofpoint-ORIG-GUID: vyygIw_RbWUrfjK1XPoYO01zxKdRlED5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX11igMx3OJ34+
 AKWMGaQKhXC4u39K+2lgrVO9CjEx38zzetVStpWSJnIGlZ5Vdl3/1sCXvaagsM2gqvFaTM4UcAy
 b/CnzU1JhLsvKJNk3BHaRLfQYSr77uw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

With the provider-owned data split out into a separate 'ops' structure,
we can now protect it with SRCU.

Protect all dereferences of nvmem->ops with an SRCU read lock.
Synchronize SRCU in nvmem_unregister() after setting the implementation
pointer to NULL. This has the effect of numbing down the device after
nvmem_unregister() returns - it will no longer accept any consumer calls
and return -ENODEV. The actual device will live on for as long as there
are references to it but we will no longer reach into the consumer's
memory which may be gone by this time.

Nvmem cell entries are destroyed in .release() now as they may be still
dereferenced via the nvmem_cell handles after nvmem_release(). The
actual calls will still go through SRCU and fail with -ENODEV if the
provider is gone.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c      | 44 ++++++++++++++++++++++++++++++++++++++------
 drivers/nvmem/internals.h |  4 +++-
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2398d33bdd12eb7d6cac185a49fa6a79da13b1c5..7d4cce8e27424a032fff59a1189847adb1898168 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -57,7 +57,12 @@ static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			    void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
 	if (!ops->reg_read)
 		return -EOPNOTSUPP;
@@ -68,9 +73,14 @@ static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			     void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops;
 	int ret, wr_ok;
 
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
+
 	if (!ops->reg_write)
 		return -EOPNOTSUPP;
 
@@ -289,7 +299,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
 
 	umode_t mode = 0400;
 
@@ -333,7 +343,7 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = nvmem->ops;
+	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -560,7 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
-	kfree(nvmem->ops);
+	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
 
@@ -920,7 +930,20 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
 	INIT_LIST_HEAD(&nvmem->cells);
-	nvmem->ops = ops;
+
+	/*
+	 * Must happen before we assign the release() callback in
+	 * device_initialize().
+	 */
+	rval = init_srcu_struct(&nvmem->srcu);
+	if (rval) {
+		ida_free(&nvmem_ida, nvmem->id);
+		kfree(ops);
+		kfree(nvmem);
+		return ERR_PTR(rval);
+	}
+
+	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
 
@@ -1035,7 +1058,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
+	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
+	synchronize_srcu(&nvmem->srcu);
 	put_device(&nvmem->dev);
+	kfree(ops);
 
 	return ERR_PTR(rval);
 }
@@ -1048,13 +1074,19 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
+	struct nvmem_operations *ops;
+
 	if (!nvmem)
 		return;
 
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
+	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
+	synchronize_srcu(&nvmem->srcu);
+
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
+	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 2c3645a2727270298139dd7b49b81fa0bda58ad5..bc7a99f5aefbffced60d275bec888ac867fd9032 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
+#include <linux/srcu.h>
 
 /* Hold pointers to callbacks owned by the nvmem provider module. */
 struct nvmem_operations {
@@ -16,6 +17,7 @@ struct nvmem_operations {
 struct nvmem_device {
 	struct module		*owner;
 	struct device		dev;
+	struct srcu_struct	srcu;
 	int			stride;
 	int			word_size;
 	int			id;
@@ -33,7 +35,7 @@ struct nvmem_device {
 	unsigned int		nkeepout;
 	struct gpio_desc	*wp_gpio;
 	struct nvmem_layout	*layout;
-	struct nvmem_operations	*ops;
+	struct nvmem_operations __rcu *ops;
 	void *priv;
 	bool			sysfs_cells_populated;
 };

-- 
2.47.3


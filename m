Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D147D949
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464501; cv=none; b=t25NI4JM00UbGtwETj/bexSyCmlPKJ4GrDGjINEV3zzlsf5YSwTLyZwPr062qwx7GNvDezTPLiGdsAgqpKhQFPNaPqmJmH2Fvl6O7f2zUdzPlR6oorQhRRPkS2CJvaTr3vN7n8kE/VEPh++lR9NQJv70DdulGS40dXeGb1W5aKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464501; c=relaxed/simple;
	bh=a/E+GFuEyBojJjqli8EcWUYHUw5NvaWdxGvcEkYtpmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUVELHN9jIbQm2UalqD7aZ8flZg3ALq5ght6reyJArMMbKOZX8JUVbKwdlAaw9OrFpVBiN6Eo7AvnYg0OoxkrbllEgcpb44VWEkrTatb4IZRQzaGyPhfJKXSXRtRaELZ2Yx0XZo3e0jMtBloW2LtX8UUmI46T3ZzKxeskSj50Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jleppPbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sfs8pkgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jleppPbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sfs8pkgh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z3sb3486817
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hiyQ4P+7WwRfDmLuLdvleudas7ax3CqEMt1Rx6IvKE=; b=jleppPbPRFIh3Q3q
	57WL5c4/32TNG3MX00IFv9Xfq3E/rP7py7zHTibAbSMjafCGI/KfwTYD6xoYajKH
	+QvgLwAaWtyRs/lY7n/iyMBLuUA8DbUzIhqlU7z3HZXpZle7h8aFCOOKeihU9yPL
	PTwJbS/YURgZ+mJGSOzUMF5GiRcy3+x+HXosr/h54T57WN9+zGVnly0zGNoCTCOT
	JQSrooTtv173G7nuGq45UPDYcrdbeLbMyqJTa3DhP9xlJunWY3ANyCty3YMf/qBa
	TXpfgJSmm5He5aDC6skcWrwHy9x84py50w61uHBqM2PGCNTNEI814bioV0TuGB1f
	bJmWzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jert2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f1847fb9so496297585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464496; x=1790069296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hiyQ4P+7WwRfDmLuLdvleudas7ax3CqEMt1Rx6IvKE=;
        b=Sfs8pkghJl+trTeJdJjPCxgxlX8D2/D+gZKX3TqdcNNkjN4mYEVKm/X2UrU5Wqx0fm
         CDEqmjr8TmRQ0a+6vYn7roqcMZt5N5fmHNARvFxSukJrECsC++JJNCUCi6BKDMA1uEPn
         Kbes+QMNuiMO/8YskfEWqiGdZWI+KaTrGmWLLB88OOrKo4smL83zCbWOeonaP/hd+b54
         Kj0wWmcHHOqjFeUxVT/LK6H6UBpbYa8Sx1quctooNOqy5/Yemh8Gvv7PO32emXuugbxb
         oFoGmkAO81vHh9cL6LgM+ZEtifRYyRPuFA70MDZ9lxL4q6iGjosVdnypIfxJsCsRxspn
         lgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464496; x=1790069296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hiyQ4P+7WwRfDmLuLdvleudas7ax3CqEMt1Rx6IvKE=;
        b=utTOKZ7+8OSH3dXF69nP+73jfr8/0njGmnWH8kvmnrTAj7bRMhzS674jyQpGpc256L
         Tm6tu63CcbauTWzGRUoeXOp6p9rQOJH9KmazXzPtGcnxtEqIDH0YPMTLSL3gUsDt2E1Y
         u9K4gzwlIC3pCEGwWz0l2zX6FOv1ihZ9y3yfsZsRzHd7ijEO/DAkSIn2eCv2LHsn9P5N
         aeaEuqC+MUvrXxJM8xELJzCZg8XOrFljwx9G5bv27bpQRnw++lajBntEpCgf/cB8eTt2
         4qZoijTE0kfVMIcrOtKhXkbRPbSKSYsFc7hq6NBy6LQ73Rm3jeCzURs10xVMJcTyNl+X
         eayw==
X-Forwarded-Encrypted: i=1; AKwUvBznGGjnQJ5guyi6VOv6EY8UrbaV4hkXd71A2TaxJPxzHzIMh/vWjQKPOuhwrcqRNQ7yPZ+XqzIaNySQQW4=@vger.kernel.org
X-Gm-Message-State: AFuF++myzesGA/67SvrjNg5xqQh9TxpTkvxOkgJ4bb594+qW/LBp2tBK
	hfnMFu1iEsx5Y1kDArViu+bmsXar7BbPIi7Zh0ruzBRNvqGe6+B4HgwgQN4GMM4epCM5inQ38A+
	rOh1qUjqmEUMbgR7emqjhz1QGLuXcAuVv7/z/yYESBsTBbpwEVDGo1qfwkme7EiGDlbQ=
X-Gm-Gg: AYBFou36d3e7DDxltDnRFQHq94hkUoQwWLpZUhZ41JasevTtcEna4XuRnzQSAKPQLFk
	/Kfhr1G+i3mRed8CRI6DsaXukwqeFrg0oxhAzdLwPWIV06cZe9PPJt3h4RlVV8W59BCE+oAXz10
	yFUW2h7P00c5xU97zOB7A+dL4mswTb+h7VQjqqzXCc4VTrXEVkIQrMmY5h/WwuNGArgR0U2eypo
	rp0eiX400MxSGLpuPNoUMlahMHxCZ/i555XnkyaVQuvx/IU0tO9OXEI1lT7Kq6jEXm0X+aoJ0+R
	hjLqNi4Rt1lMbZOtJ2VJet2mPqzXLZo6ZoUc+bXfanfXbziANunZlr+zFs6AZmZgWKMPP5HMMQB
	oE1PsJlcG05sPOGuoXMyG9hsAKp/dOtPs5FXTmsP7IXDN1lWlUdhPKrD11kkSFwo=
X-Received: by 2002:a05:620a:4384:b0:939:ef88:4af4 with SMTP id af79cd13be357-93a296fe008mr946229785a.10.1789464496267;
        Tue, 15 Sep 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:939:ef88:4af4 with SMTP id af79cd13be357-93a296fe008mr946225985a.10.1789464495891;
        Tue, 15 Sep 2026 02:28:15 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:28:15 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:27:49 +0800
Subject: [PATCH v2 2/3] drm/msm/dpu: Attach INT2 power domain alongside
 MMCX on Kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msm_gdsc2-v2-2-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=2660;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=a/E+GFuEyBojJjqli8EcWUYHUw5NvaWdxGvcEkYtpmk=;
 b=rIBAVjyUmU4tm2T/6JX609jxHAuF7gTOziWHFTv6j9t57tjNdwhapK77O/RzFfdXcWuzJQJEm
 GM4es91488XBgEQRxbBmzeOdmazqy1hLbSTnRKp2NIkQI1zL52d4uLq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX5RGD62N8jLI6
 Or0c8p0hnmGVvvuOadUkZ5r+2r9CLx6z4iQM7R8whnLAUr6Zddmz3f69SVy1d1rxKo+IVPbirPO
 O35PSe99x5NoctoWQqVRZsAs42Mv+1g=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa90fb0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5k62Q2yMXhvS8CAj0VB39WBkx7XqRuF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX5OZPwKR20Sah
 fbVb9f/z1BJmyr9AObI91yBp7NXUKel1pciDhSbtV97LBTJeF3hr5ub2q0j8bm0Y64zsyYK05zI
 VZ3sg+KSv8CxqSQJ3WjcUxwMW2jylyCX4tTpAP61jKpiGHnigYYOkmjV/dnNe1stAvzCq8GTium
 driiCmHuO0dzaGoGZAV0tYeiYE5to8yULZv7BtoY5hjnbWFTgHJzg5012PzNiBJCi4GOnykmO7f
 V0m5SiNQC8X7+XhKju27EruNzXF3OqAh0259fEUqg8g7B0XNIz5TJcm/rZuYenX1Jgt9lwbThB3
 sQhys6PYGg6mydf4CuLemIQn37/uPKygzE8d9e6enU6MwOBaScU7XtfaH887zhDRkL5Lp/adIPn
 oHzJWE4U0TAQePhUvrGdm6uD4E6fadD5NujOwEgeYHmYlwZRfvXtgS74hHHSlLS/25Wm2cTaf0V
 k2I35YXNBEymMrRpIxA==
X-Proofpoint-ORIG-GUID: 5k62Q2yMXhvS8CAj0VB39WBkx7XqRuF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150135

Kaanapali's DPU node lists two power domains when its DT provides
both MMCX and INT2 GDSC. The power-domain core only auto-attaches a
single power domain; with two phandles it leaves the device
unattached to either, so attach both explicitly.

MMCX keeps PD_FLAG_REQUIRED_OPP, preserving its existing OPP-based
performance-state voting. INT2 has no OPP of its own and is attached
as a plain runtime-PM supplier, via the device link the attach API
creates automatically, so it needs no manual pm_runtime get/put in
the enable/disable paths.

Platforms with a single power domain are unaffected and continue to
rely on the core's existing single-domain auto-attach.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..d9c2c8d680fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -12,6 +12,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
@@ -1376,6 +1377,33 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static int dpu_kms_attach_power_domains(struct device *dev)
+{
+	static const char * const mmcx_names[] = { "mmcx" };
+	static const char * const int2_names[] = { "int2" };
+	const struct dev_pm_domain_attach_data mmcx_pd = {
+		.pd_names = mmcx_names,
+		.num_pd_names = ARRAY_SIZE(mmcx_names),
+		.pd_flags = PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data int2_pd = {
+		.pd_names = int2_names,
+		.num_pd_names = ARRAY_SIZE(int2_names),
+	};
+	struct dev_pm_domain_list *mmcx_list, *int2_list;
+	int ret;
+
+	if (of_count_phandle_with_args(dev->of_node, "power-domains",
+				       "#power-domain-cells") <= 1)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &mmcx_pd, &mmcx_list);
+	if (ret < 0)
+		return ret;
+
+	return devm_pm_domain_attach_list(dev, &int2_pd, &int2_list);
+}
+
 static int dpu_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1392,6 +1420,10 @@ static int dpu_dev_probe(struct platform_device *pdev)
 
 	dpu_kms->pdev = pdev;
 
+	ret = dpu_kms_attach_power_domains(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to attach power domains\n");
+
 	ret = devm_pm_opp_set_clkname(dev, "core");
 	if (ret)
 		return ret;

-- 
2.43.0


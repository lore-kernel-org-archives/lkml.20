Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743228;
	b=mVlGChMg2Dw5w5mS5xYI/0DEeTlO1Jt1VAzColw1brRgQ80K5xdeLs0PX0QuyOwmHZhz
	 WlUBdd3i2ALu0CxmGdan5wOFzkAYoW9EAe/zaIIyWAoV7MBlI3E69+pqebCe7Bl5V0PJT
	 ne/99yHOxK5rA4n22V1DlFE4GXLlQ9hPxn1e5JOjbSe+1AfgF7NLwcguMX9JTdDtaPRyp
	 5jUCFUNvcQFEtwIU0P5oclMyLxkjjjcoo+Xn9fqMIhLbwxa6beFvfJLSM8x2jEYfueBa8
	 kdy74kd2XVJ9O6jyEz08kTH6uyfGfnChFQ675hiDUtwpaFeElyuy3jaw7/OE61zZZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
	b=oqthwL+DIbjsLelKZA3/yxyY4tbt1OJ6n0sn0k02+k8kEhQtw06mvoD77JdGmIYSDrJ8
	 cWPoeOdOzhf5CsslbW/lWZMglhKYRjtkYtO5KRmhFWD/C5aYKSuWFmDgju2YTUDYTvR0T
	 ML+n3kYo5t5UefAnh9iAfZeDvr20x0mjyjJFuXmLwHOWfTelk8t2O0CyXKHrz6kFzpRww
	 Cz1ZiKZTn7DMUzbZf7CNmQMaJsmG5aDvLsksUKnbZksdSr5G4jgQnTVF+T2rf+4nS/6X7
	 NwwivXerpQwOECEtcNmpCI2O/oODsijCb3d0ujv7/bTKftwVPXlZSt7hkqdpZeUZWcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iioMTg4o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVZRVUoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAA606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CAA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iioMTg4o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVZRVUoU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FW4b588310
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=; b=iioMTg4o88vJrWcv
	qokRQnEyIhyuU44Boa7MPEdCF3bSrIJ6ki/z3lSpw33Tx/hPvDe1xupsKvo6fDuL
	A3M4Zlb0NusESGvdEFRg6gS+PeaF1iVcRVQmV+P5aovWt2GLa8oVBAUu+3Tia+xR
	fz1XiUpXeiWQGFsfFcpZMI0hhZ01C4m2v6gNuQu1RZatkkH3sXd2F8hn0JEZUoZt
	K4JUTSx1Ig4MOgpm6JXu/4+M1bIOfs0B5O8AILTdz5+8sDSCIpl72Og3jXo6zzH8
	el7ZEsBJrAwHMxfmrrHhULrC3lxDdtZ2WopG2ivo+vTOSTovZr7IOKmq74Vu6muF
	9YjbQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmat554-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:13:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caa0ce0cdso76140985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743226; x=1793348026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=BVZRVUoU99CYL8GUihSOINAJKWKlaIuFQjEDA+6iYCO3hsln1kTQ4sebYZV2+zXEPF
         zPMcRgK/YhzFriwDGWOHTJiCetYn8lavpn49+lUseabBHH39PYPgVTldqlbHywKWsI/p
         +AFtUxQBrf6yGPkxv5QkNLuEd5jbsftm3PZkqwJDLv8zQsSKtVUHsz0fWJP89AoK/3SV
         M1qTBU7wd/8jAZqBoKVOEjV6N2sTB5HzXBnN6XAvCJr0POYLI2WgqVyixuUeeHukJpyb
         SmO+Kz2iK0/7soVhuCc1kKdSMidCoJODPFjoscQyhVDvKu5GpDKt4duakzeFqNueFEvv
         QGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743226; x=1793348026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpN/KgqdSMvY2ICnYT0rgl6h6TLIkL58FaqsS5Ocbow=;
        b=mlREXxs+lm45lXvmiQJ8CEA97/Hcm1jJaed0id9k4rcSphR91hrWvwO6X+4LFzN6+G
         FlWXsbGxKMwSqjMOsvP804I4TPr3MMi7wHZbFrfibI3mIBnQglIRXhxAV2rZ/kiR2OB2
         V20hPIsNLo//wl2ONcnVaeniHA+h8TvRng7prTR/AoSN5v+va4dvHmAlL5xm3FYu6rzp
         Q3goIDlVHCYfjzCcspqWXk4L0K3M5GvfFwfTFKqNUDXXpCcm7gb8G1O5HjqJ8XLCW49o
         vPtYfQAjfeodEeZ4UFVMiF01xjyQzFiST2QVXbS7NRNn93/rq7wg634XJAuVGrT+eOBI
         9Khg==
X-Forwarded-Encrypted: i=1; AKwUvByH54e76SNP6nc/7+yQxyBNKgYAZGX1Djp8FW3CDum8Smo63kPoE+jwsPIDTp9pnC2z/00sdAxYIYcIjdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+11cz2CTDsR7oEE2qbE0d55D/3VOaFMJlPY9RfzcFaVsJdi66
	kZwLkOej9fib/ayFm4rwE5u+cwIPf3XfEp5HOq68AAyDkn0EwZBHDtKUXgEw/QkJ201G1lAp7q4
	6BhCi6oSvAcQcpYfyKcwc8oW2K82UhWFityWmYOnlZGvj2H0B/ZTjxU6ow7lEEWMk7Sg=
X-Gm-Gg: AYBFou2phU19kj/JWT2VEVembS6KesSIPIkRJXWcdx5gsXpj11nzJA5LaEKN+++psi+
	PT4C6eOvkwVfhfrJ/2Zb8f62YbnyS0SoFO6VYfy3ARkq+1Xj2dH2Eyh1qgRpkfP2hvlhQoQQQFu
	yWVCSRSdT+RxoUJO66qk3fWCi5bJfIwNcpUhYzzgrRu/rjc8igHKoTmB3WC5zYHqTdT3yFJoUZS
	oBZ5ksZKiw4Ih0lCOgTT8lCB3jYXA3vDeVI1k/9VqcdKR74ZEzPRjZlaEOM7TQZx4plINq0IJoy
	IjC0tU440sUvRZvPP8pDQZ7t02CAQH4gGFaQ85F5bAPqW2KO4chPseLvzUHhgJr3OQY8Uvx7ydc
	Ef//mgDBOgNTM60AE2NiZjuBUYr2/xoE4t11WW54/DsLDofa3xY6Xt+a4btZnfA==
X-Received: by 2002:a05:620a:2b81:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f6f79e874mr277236985a.2.1792743226110;
        Fri, 23 Oct 2026 01:13:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:93c:6fd4:467a with SMTP id af79cd13be357-93f6f79e874mr277235085a.2.1792743225628;
        Fri, 23 Oct 2026 01:13:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:13:12 +0800
Subject: [PATCH v4 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
 Kaanapali
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-msm_gdsc2-v4-2-40b6a71d4e3f@oss.qualcomm.com>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
In-Reply-To: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=2645;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=6TSsqvMj9lDcUSrMsfgqAH+EDW5aP3WVFlch5mtFZ+A=;
 b=YxqUVnVMz0zHTCQ4ym+KlaNtNhpZ0/b3mrjirt1Shk0s/UWoPnLbG91jqQKbAk50s7p8IBIwq
 92yj4vz7rhsAN8tMn/GOkmbj/StNIrEJA8iYLXZlWH/cF0gO2gHnkIB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb173b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX0ag6fUQ1PN/2
 ew9+MU2SVpByuZimTjEjJ5Kt1W8+AiztayDi/NWDsVGtaa1A5i1sVVqc/GQMipaJDxuz8nwJ8JQ
 yyOTA7K4Q9cUDCnoaURl1dzVYniaCxM=
X-Proofpoint-GUID: rdd-vgKK_vgvuVz0qDrw5JVH4YvQEiH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7Z1/4Zt8+prt
 8ubJiNfKe3mMSe1bf1LS7Tq5dPBOnbCMuZcX2qEfnT5PMiK0v27VzOxoWUagh1RNSviCWr+ARNy
 GmOFMt85bPpLdYmBTXDCIWWVFlL7zk35zzQ4xY7Wf4eJWhcRzlFFUztLCvA657FDKXsczj3ZRoN
 ce7WTZ47FnS0RLtOZUjnEExfcunFs6D16x5LoSmEPL20BbEq5h8FQ2UC6Iwq+uVueOkPUbvmJYB
 /89HhRUchAL6arU3CagFKlyduljLS2O3y4FNXNVTkt+PSLyvJXKrwkFRcBMznOGVRk+aptc9fq2
 h/xr4EAa/DRTsP5AgZB9fjx7hBkv87aNGFsvalxkmkA1Wigy9tW897UBJfjOiMIxo8mcos8dyED
 c/6Yl32a0HXnpknKqD1VIlOZNv0knU+UziwrCcb0QbZOP0Yl8IqBPWqwgjyFKdDWDMsD8KPucD5
 SBMUNLSf7bOtADBKK2w==
X-Proofpoint-ORIG-GUID: rdd-vgKK_vgvuVz0qDrw5JVH4YvQEiH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

Kaanapali's DPU is supplied by both CORE and INT2 GDSCs. The
power-domain core only auto-attaches a single domain; with multiple
domains the device is left unattached, so both domains must be attached
explicitly.

The DPU OPP table also needs to continue controlling the MMCX
performance state. Mark CORE as the required OPP domain so its vote is
propagated through the genpd hierarchy to MMCX. INT2 has no OPP of its
own and is attached as a regular runtime-PM supplier.

Platforms with a single power domain remain unaffected and continue to
use the existing automatic attachment.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..502e50ea5aca 100644
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
+	static const char * const core_names[] = { "core" };
+	static const char * const int2_names[] = { "int2" };
+	const struct dev_pm_domain_attach_data core_pd = {
+		.pd_names = core_names,
+		.num_pd_names = ARRAY_SIZE(core_names),
+		.pd_flags = PD_FLAG_REQUIRED_OPP,
+	};
+	const struct dev_pm_domain_attach_data int2_pd = {
+		.pd_names = int2_names,
+		.num_pd_names = ARRAY_SIZE(int2_names),
+	};
+	struct dev_pm_domain_list *core_list, *int2_list;
+	int ret;
+
+	if (of_count_phandle_with_args(dev->of_node, "power-domains",
+				       "#power-domain-cells") <= 1)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(dev, &core_pd, &core_list);
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


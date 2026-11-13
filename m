Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558561;
	b=dyeJKHDHC42sz+wBDDrtBta8/CYMaoroaLIFRHkP0eh/tHcXW1eSmU6CTmn21JzKQEop
	 C/Gtfc5Vf2Uz46Iz6X0gZDy5rUAAdGlZTOdNf9bUkf6cgicaD/0CFkb50L2WdWpZesUpM
	 HGFylcWk4B6OdSIvIkyUvtyZBNq7MuGVgNUFZP19MASq3AkTr7PJ+BFC67qb0CYufnCIz
	 VbIu8TaRRFF17BTvvQLGQn/kARyIAZr0kWv5wK393pwz+5x88nal06RsT/dbkCddHO7xN
	 ScilXwRsiuer/YGLbETQIQcWBCIqKio3YaCTV3eBTcTbNH2dzRvfuFu3KnyUqztFkxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558561;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7cK0ZBgqXGKQz57bcv4YJRSGS3cGEHifmH2X+pL/NY=;
	b=b/AxL47K9Tml3K0qTV/gjEq+ls6nWRK5qxxrloSZ7IXWGHdDk2Na8NTRwNBzUzRR4uMY
	 MK9ljkQACly2VA9EpXxQ9NCO852Zo6rBbpAJUpIJqMA/AUTZ20c7It3QqEB6tyUERN9p0
	 Ei55VUkPURUAPlPLCo0xZjGb7VeHAdHITPcEpua9+3vOBIryrOfGaCLeE3axSJStDH6Im
	 miSbUaPCVz32QFut4jtSrl98sZFcKonXzwXgWsXGXZgk9L/F6/g2sAluD5Y8bmbYnaQC0
	 +gF3Y+4+w4x/G1cvJN4kOwcoedYIijCzNT3Dz82hzwK4v9tZrEH9d1LyCUiot2454Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIbPYjf5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB6KUWpY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1D606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A1D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIbPYjf5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CB6KUWpY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5tov91756632
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7cK0ZBgqXGKQz57bcv4YJRSGS3cGEHifmH2X+pL/NY=; b=WIbPYjf5j1Iu33J2
	duxfRNQsNY81YwiWRjtDeg1WmrvcI/8QN9HlBsgx9NZQXSR78tsFuksat1nwK+q6
	8hOzezkg3uX10jOXCI7pUhf6yAxYnQG18XD5yfvcljBMjouqlEcERvWQA+BFvEJn
	eAOrp/xg8E4y+rsLxGieFoMn6P71VPEkgiY7v48hhKiJEEw92nRwCwE2XQ7TgVdl
	yuGWVDBXN15EBOWk3emfax2PgK8BOZPH06LrMbXKDzRe9WVdfEWO37ix1sY0iwfw
	AJY4TjklzwzTVR5fdDPm90Bj8X8g9VKagSp7uE6506L5jZ4x9Hd7Bqf4/mTmqqje
	rGcVOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rgqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:29:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54af6c38073so17454151cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558559; x=1795163359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7cK0ZBgqXGKQz57bcv4YJRSGS3cGEHifmH2X+pL/NY=;
        b=CB6KUWpYt/rM/Bd2tEmVTXE6i8eWpkUtU8JZr/Sd1vG+n3jpwvS2AXzdgnBZr1tSk1
         WIznAiCXX68PfaD8t19NwmjwYV/+BedvxIGwodOXOC5oc49F2frXBJS1Klhbs552HAgc
         SEqNDiwIQqcCjkS5yBfhVCYuEadmLir1pMUVXwHOIUjx7dF6K31rxl8i0drFdMx/Osqa
         4N4Aszzu2GR0BR1TbSXOcuRM6Y+ITdURbyCTcHlolxSAT5ZyEPcO1NiQ9KT/Nf9n2Amg
         Rk1y1/wBSIfooDTRGdlhFFPIb0UOMlSv07LFRbllqLYMI2qr3g1mL2s2d/PkMlDxUJqa
         A2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558559; x=1795163359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7cK0ZBgqXGKQz57bcv4YJRSGS3cGEHifmH2X+pL/NY=;
        b=TMMXr8/AyqpTNMTGwPElSAR186vvIsBuXGKXHTRd0HHGbbexKMCWmei19xeh2UrzVO
         5sAwiXBi+Rxpc+br6OSEgeijkuga+pNYYRwfN0Ff7tKRQUBcM/NEpVXyG0CNpcapV6YU
         udxhIqyudgqFMjOj+XSlsnihjuqDBZuTHyw+0q3Rlj6oeRYqUWHVmFWGkf2MRs0d+DR1
         LR//OKl++NCk7vjV1FyhIW8WO5e5lTAnOyiaaREDDpnPEH1DJliKDTHLaNwhWh+e5Qt9
         hjWQJ4xnUKhCAr652ySWmGhV4cAeM9yLDNDbj2w4YLQ21H33davYJZTs+E5LJ/4n5UP4
         ScpA==
X-Forwarded-Encrypted: i=1; AL+hErEONs6FG5GteTtt4AHqQztjycUd8Jq1e3Z9dTDUodBHttqLx1E3UExdyAFp19Uz/jU5kYKb/onZuC5d4Y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ReSNYXG8n1cqsFLNAnwyA9oTVTgOkJIHbX1fyyE2d61JZNK2u
	kc838YHF+sIV4SxD/w9j9qgJYTz3RrZIU0kjwkHNOpegtlRX7xl2SgMn82VyzJXKkTBYxPymNgO
	B/HCCEKaNPgnu17/+egw0rzjf+44YgGSWb574HaVi3Kpg9H1UZUsRkXvrL3cgsSXKDQk=
X-Gm-Gg: AYBFou0+QNHg5DDTjrtrlw/zgdxAamWZskF+rlDFVM9OGy8iJ8uVN5r6lkLm0GA/WjR
	/ifnQHMh08d71sJfqHDp7V93M6wGg4OWk/gGUTjHcEesntcebMzHT5Vdma7fgPAmFzXXirGfo8Z
	bvVAuhqm8h59jj6+E4k4A4MfimUwSzUgmLjD6rXbVTwBGiDbgoHM9qSEvFuyfUoELpeq2YRwwhE
	BnlLpRX8Ja2vodJvDf6oWUy7TStZZ+OTTYhOYUxbTY49mnGFcly7eA73/VnhSKv1j/WUdF6YYlO
	uDQ+/HI5MSxvK/IURWQ1cRrBxdlBSAveyRHsLLqF+AKY1weAHgNCzGWeV5AWPoEp6Nfw9XBEU3O
	WBVbx3Ajj8oe2k1H2sHA3Do9R4DpqZZr+fVUMdxAFCGBtZxIbXsD3ZkCpiOAXRCD/SEpx596i3/
	JnXruXUbUhdR0gg/F+OdrkVY8mAyxpFtosFVIN
X-Received: by 2002:a05:622a:5ca:b0:536:6013:be95 with SMTP id d75a77b69052e-5595644e72amr84314011cf.16.1794558559141;
        Fri, 13 Nov 2026 00:29:19 -0800 (PST)
X-Received: by 2002:a05:622a:5ca:b0:536:6013:be95 with SMTP id d75a77b69052e-5595644e72amr84313661cf.16.1794558558503;
        Fri, 13 Nov 2026 00:29:18 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm13524491cf.29.2026.11.13.00.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:29:18 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:28:52 +0800
Subject: [PATCH v6 2/3] drm/msm/dpu: Attach CORE and INT2 power domains on
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
Message-Id: <20261113-msm_gdsc2-v6-2-17adbce47220@oss.qualcomm.com>
References: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
In-Reply-To: <20261113-msm_gdsc2-v6-0-17adbce47220@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Danila Tikhonov <danila@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558532; l=2645;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=VB9FmrjQ44Q9qoohUmrOvqxRlHApd+R+blJvgNZ34tc=;
 b=46Av5g6VzcUfFjfsoz5zTzkfm4h+tFp2LHO1XA2cbXDpVJFeB5TVUPBKq2eyRMkKMS/ty2StM
 BzXUlmiaElYAVWkfcUNhpvYe8JzFN9lo8wc4zd3xmPKnAWUtRBqbHYL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXz1N8cl9+22ur
 NIHtjsqygT2+0R6FsXmQIxUJ7iRymZu/+zCorT3yY5lwwBITyPccOoSWSHuYOcRxm8SyQT66LuE
 Wy4MRqJg5LovUjsnM5QA9DlBSY77IEPxAUBgRdLup4X4fO7Xh8tFahL9CQjEkHkWgZi0i34/RWn
 jRo/lA8m1G176f6TOQZXSqGBqZPu4Fu17l7ZRplUB63ImsqWtzFS7A8cTlJdrYdzwo8bB3bi2Q2
 8RPO1+Al6gfH+hWfOcC/uBGjGiksGMIKksGv+hrBrVPmridcP5kbb6RhlZGT3louBIPb7peA/lN
 IjYZJY/RcGWqnaQDrt4xfPdtiY7epATixIMvY0fMXsA71e89l7AfO+59gud0KsDgk2q8FqwhQyH
 QLjfwCWABPjHy/HytFKHgFimzkLmSA5fq5aJMjLlUF5QWON0Qp0org7OTGH2szZGOKvPaJ4eu+p
 7D+1oezwmg4wR/AcJIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX19V4igGcbUwc
 p4hLtBvDRxl//7QWRnhpdGBoEBG5cVskUtSUUq5/li60fv2ljd40fnG4an8gIqRJxJbOzbvEIl6
 mXmNStTx/z/Z3z2woW9x6uC1UYvtfJk=
X-Proofpoint-GUID: Fw34bVuFznOBneYm35GgNaJhWtvnUUFy
X-Proofpoint-ORIG-GUID: Fw34bVuFznOBneYm35GgNaJhWtvnUUFy
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6ca5f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hNyr2f_ZztDnRCZExOcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

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
index 1b6286dccfc0..4efcfb559d53 100644
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


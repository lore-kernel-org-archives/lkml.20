Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B94A2E15
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853635; cv=none; b=kObpsgOat/uLOzMFmIJyoZLrzJGfYAvYbDgswV5OaeNubHeoejSFCSLf6gFwAEvMjE3INFZn059bGLoakhGF217U8CBFyk4+CrLk+cZHgGoMN8foPbBMil7tWqI8F92OTkMTVuEpoeXcYnna8XkYueB8uDhnvxvgU3gz26YoK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853635; c=relaxed/simple;
	bh=w5pv/KNIEdlnHDT3uJaPurHB9sUygy6lp1p1Tpumn1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlUju0CK9f/76KiBwN8AXN5pPsTzHQH8ciRoRopwmAWOB+ysnFy16HxMPdgS2KIczZffeH7CmCfbUvKh2EFe5qYjD1ajoNolfCp0363HSv+/otegTOAbFafsywHZr2+sPXY18JlTskgn1DipZEpl3T4EYJ4Vrs4vsCJSZfd8PNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C88KNkNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmSqK/nv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C88KNkNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmSqK/nv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXbsk419724
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98+ip0Wb3BBuztCCDHQ2Rp/wdTyxXqiBl8ycdGuMnbI=; b=C88KNkNMelO7r2sf
	yDI+hrbFKEWqA5Um2t1rGa1czu7xI43Yx9W7hJ87lOrl6gWht7X4Pcg2g+OWfqc9
	6/UQx/ZcQMIXaB4Uazh5RHUHB8BTSg7O72btawORm/z/dEQmfEsWiVqrHheUSQ5M
	DstzmUbvRXn/C5fuymm4IFcC+OF0jYhrIfBnemsXiEDSFGpuXGEybJocxPkbg6VJ
	c+BFiyizWQ2fxW3W8Q/lBbU2Hy+BKdoo/i49oDmEsNHbc/qqG+r5OBenGbYlWTot
	vYhILlD2tlOTEjzj7D58he9l717qb1NsjoYv0FVnFbTjbFWHpjh9kyClQZ/7Q13p
	oaLY5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjftptm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:00:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso381984a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853626; x=1788458426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98+ip0Wb3BBuztCCDHQ2Rp/wdTyxXqiBl8ycdGuMnbI=;
        b=hmSqK/nvQJHbdeD2+46WfT38qmd+BvFa+YmP6noFKzZqaclH25pgqjOld9zp9ULfrd
         31xtJEvKLsuWFyzVWIik200qj3n2EyfgxttGRx6MpNqZedA/1373fsnO+ct1axytRWHB
         x1h5Gwn1ZFJusnmgBONO0o6Bwv1zTO2lVsT6rNfXJJpd3JGpaqPYmQBYNY3PFRkVTW64
         P1x9r4jB3G7iIMj0CS4IMIVpTlzfTFNzd0ff/hVVQnKwOvJHgBhwUV5+a9ly2geF9M2b
         Gqqc+gaLSLW2PJZBdj5ohpPfJ5fAy65ea0CzssBGZYnX8ambwcXv5GPGqncPHSWFsfIB
         v+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853626; x=1788458426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98+ip0Wb3BBuztCCDHQ2Rp/wdTyxXqiBl8ycdGuMnbI=;
        b=EMjxxd2xSyqO9c2fcHiKGJluqZRTbm31vy2+PxY0iXjmrLjD7CpRCB0juDWLBhPpnZ
         fdbciVGgGbBe0t3mTOJZZlKW1uZWeQdW0o7bvL+QHdrd9ByyrE6G+GtaULpt3gWo+JP5
         V/KBjsshQFTL5HxPlr44ak1hfc274KeoCM9KkL4hmkPLV3hMT/l3MU5i5StsJOzGfZfm
         NN2Dpg7h8Y+elNIgQulJ2UOFbDUajpEOk4ijWvTEtaXOxoPfeWtiIjpbP+7OvnNoTpDD
         kFYeEMfuwYZNbKDn5t1ZrMm6iwTP6//CnaCx3bxfyF1XzG3A5rRhugUEaqRtS+Vhe85i
         zkbw==
X-Forwarded-Encrypted: i=1; AHgh+Rraatp+UrDRfjfeNKEiux794wyUWwxnhNJ0qqrI+fDGi5uB0/501NKT0Js82OjvM3C01uFThPkPUiHn7nE=@vger.kernel.org
X-Gm-Message-State: AFuF++m9QlHfmS+Iybj6VNmztOr2U1bsnOHvv9gMxzKzUeIS6Mr1xbkt
	v3X0sT/n0onxpKqnIu3OdTQSm6dVgPqaOxU77CWrQ3Fhsa3YkQE7tSM2TBRJGR3kp6jhWa67M7A
	3PhAYfQWxY0OovZSuSSkyvaBTXMpcYFI5/ULzGwcij3P8SvBaXdfdPxOO8hwjKnWzmVs=
X-Gm-Gg: AR+sD108B/E11obIh2sGtTAKptbKVOx6ZocAVl3JZFrWr0VBLxTulIJqga9eZOBwpOz
	Zpr4yoJpaCUBh11rL4YZy9jEAtCJ5pkVKn61KqWKHpvTuXjFVT1/1QCtEwqmOy6A7eDvTVi0RBx
	8TPuei/koOVXBAUvvf87JLdcSNEp+EEodu0ji1/8VRrhdMqI91bxRLJi/UDYbIF2itoxFQSWNlp
	rxtqY2ziF/RJ72waYkMfNr2qj71y/4G2dLRbuGq7+GKFQDe425r/jhtP0LhP6de+r9x4lu7rmml
	ZsiQSTXZbTmyaHfACeCXTWmZN6EzlSFnniAZo9Y4IOwW1Ea1VvU9uT3pv69sP/DLZlknHeOiPgY
	Y+UiFZ5VLJ5zfcwRsZajfErHyNumj/C6N2A==
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-396d0e306e0mr1998430a91.3.1787853626484;
        Thu, 27 Aug 2026 11:00:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-396d0e306e0mr1998281a91.3.1787853625847;
        Thu, 27 Aug 2026 11:00:25 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.11.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:00:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:25 +0530
Subject: [PATCH v2 8/9] i2c: qcom-geni: Use common GENI resource
 initialization helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-8-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3130;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=w5pv/KNIEdlnHDT3uJaPurHB9sUygy6lp1p1Tpumn1I=;
 b=RpUaUAw4SKyeq/cMnDINFjUHMhU8BrCF7nO0MIN9bUEOAtoiVOMD/WJLDNub+JvNeH6he/jUe
 5Mfv+iUwybdB1Cy0ZdXhE2WefHG4NrCHaa3XdNT4+Q6x/TuYvwULgFI
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: yzSDv5-gf3hIjqHr5PoE8Jp_nBaP4gXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX25nHAh5ew5Sk
 6JMtb1iLb0Dw/NHn7TMFYgyMcBbB6eWtsLdiMkgG80R4JJpM60wVqVBbRk5Cfd+oySCofDcaoHp
 2FbtTpxik+cwNV1GM1Q6dLPrmQ0p6K0E1B34A1kp4Nx2emyYhKXAqhyPUKZNehZKMY2Qn8JoHxb
 tqojStOUVpFzBK6l5FTnx+dyXK3yojfPHm8xKdGRFvoLb1tCQ5GWYnTVL02bfJzXi3K2gTOPoWV
 zCYeViXmFzCe5ujAnKW8Hbk7CBQhqLrNWrWzxOm6sR5Cbenh4Ct8InaqRHyvn5WXswnlFuNZjL+
 02ARL7WQ5oT0qjJtC2BjhlfLdJPOzP8xxW/okj2MCrhDyQeEuyOGsgIz13mSVmsQb5VoYnpA/DI
 7Gvp4bWxtlNayCn11tqaZiQzBUgiIkI8iMGE0iacEZR88yUaOG57JusWnIR25scPqTLHTWrso3a
 WImIjDegh8AyfN5OlUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX1j5FlQQrkogV
 2GGXocM8lBSG1/fyesy/ovMKmUKfRwo3EnlwjXdbLWjJtmkEGifU4yqVfZcOefesgWs05H6dGdA
 Dvjd1eBd4uytUQepA7MyXmnllfbhRZ0=
X-Proofpoint-GUID: yzSDv5-gf3hIjqHr5PoE8Jp_nBaP4gXv
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a907b3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2yxW5TxCEIWXvfGmYYcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

The driver implements a custom resources_init() callback for clock
frequency validation and bandwidth vote programming. Neither operation is
required for resource initialization itself.

Move clock frequency validation to probe and program the ICC bandwidth vote
from qcom_geni_i2c_conf(), where the bus frequency is configured. This
allows the driver to use geni_se_resources_init() directly and removes the
I2C-specific resource initialization wrapper.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a3b7609e3cf9..0b178701e1d1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -242,7 +242,9 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
 				 itr->clk_div, itr->t_high_cnt,
 				 itr->t_low_cnt, itr->t_cycle_cnt);
-	return 0;
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -1111,24 +1113,6 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_se *se)
-{
-	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
-	int ret;
-
-	ret = geni_se_resources_init(&gi2c->se);
-	if (ret)
-		return ret;
-
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
-				     gi2c->clk_freq_out);
-
-	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
-				  Bps_to_icc(gi2c->clk_freq_out));
-}
-
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
@@ -1199,6 +1183,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret)
 		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
@@ -1300,7 +1289,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 };
 
 static const struct geni_i2c_desc geni_i2c = {
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
@@ -1309,7 +1298,7 @@ static const struct geni_i2c_desc geni_i2c = {
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E39F3F6C59
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515805; cv=none; b=fMHZXj+ZDXpipCUiggVdmgHRuuMvrRHX5Mb6AsD9lz2WWAp+PWez5FW2SVUj+C/Mvr8KIEiyNDtvSj4gOLhFBNP+GBg1J9+ze0P+RZKMMtUg0xcTW8ML+PpJB756LBcX7oOTggXxjp3ulZxM9qfEEMWtArX8Tivi6TVQStB7OKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515805; c=relaxed/simple;
	bh=EcYqHQhWBLVrPH5lWQCaNhqi2mIGTjKR1YgvXUUL9OA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMelcOX6io5JnbdD7fSV4RTrGZEv7fmDUsAJXOxi6wwIgCaeSY4Vn05gYmW4OusQwenBrATofM3SVk0Rpgo6YVT0lDvWYnuG4J+ldwFIfS4CnlzVEGEOjgtgSuWJRHWOH4dQVJtXN7QccqJrDQ3asBGoJCIa1EU3Q5fG70VGmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIdIB+DF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHiFfzW7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIdIB+DF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHiFfzW7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH0WYX247015
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWcvuKnDqdyhAyMihoeLtDe/fuSBhNJ/UjMOuxZTSuA=; b=nIdIB+DFJw1KjqJh
	/NZdakFiNWHGpZNu469Q0R6gmJg6o0s3R01RGM+6vKn8H4b1FQ0Orv2Q6AwcNUTV
	fLRoSSYsPJfdKv10wHtge+y2bFd5w96wwHthAaTOECdzaeJ31UoEt2AHk7XuX1Em
	LgxICF4/jlA4OMgW5sTTZVPoosj6bVtOZCr94oxSc21KDVS+NwCbPTyx34qZ94mM
	XhhdTR7y0oILPhDNX4iOWR9gR5TjbXVnFD9H4WNrdgfkSYVLqiMY2iOiCxDzuygV
	n/PMdru8LRud+saEcNziIo88K96v6ycTkYuEmxb53iAUDY4FQqFbtaVdK4qqxHGk
	/YWh+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp3aq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:30:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so405940085a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790515801; x=1791120601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWcvuKnDqdyhAyMihoeLtDe/fuSBhNJ/UjMOuxZTSuA=;
        b=iHiFfzW7ocqYnd8/KSSKvrC7HjAQXupzwGqu+c77+9T8GYShhl3aOTANDGfhlRTJ3O
         JygN9NsCxCrD3q3E7ARr+Xgo7XNbgL/G0vDb/A7JKGA2MtSRUwaXqBXO5zoG/quJ6qak
         y2tvrYUMyVh//2SpTxtRl6sDfxOU89j4J6eoh6ef0xLNFRv9dwU9OHJRWBhbOZPhPH1a
         nybpwCGV+CE3m5IjaPEOoR8BUdHqgs3nMlD8w9nnxSpjIpy5BlyoWJ3uDvLuMHJsA6Lk
         35dIZEJhtN/LR3/lKLWfHcf2OZyL5W5Nq7bvngLCDFHnwpGMBDPLhC4/HAi/DKUraEzg
         zWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515801; x=1791120601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWcvuKnDqdyhAyMihoeLtDe/fuSBhNJ/UjMOuxZTSuA=;
        b=qPuz5SYucU3ChBhD3du5vZpESNPbJgXpCtSv9waw/Phtg3KhdjFGGy6fICTkiACwYH
         dl001Fwh6n0XgCt7teqnewgoonu757TYjQ07ShHcVbvjoPN5+Ie3rp2R5JYRdE60z5mK
         tdJBJ/rVFvlsSf4SQPX82FtPGhVvN6H+8R9AJXhZgGAtBKjxU4hKn/hIhuruY5kLm0Q9
         AVSehXNs/WR5d4tTtOakZI3fQcNYXCLhyVmqQG8myyG2zo0vjByeZx+TLo1tDm5uhmhK
         EPiBwtoDul84L9LlTofEHZRJy/ST0ud2C3QnkUJlYBo8gJtGfQ7H1LgFKyAFvMLmdTpL
         kE7Q==
X-Forwarded-Encrypted: i=1; AKwUvBycQGlyE+7c8fi7bKH/99iX/WPFdGy5BJ1uCcnFE2/KU2ju7QFJib+rjyUxb/DXwTcCXQA5lFEEKiWaY2o=@vger.kernel.org
X-Gm-Message-State: AFuF++nkk8ngXXfT74/ZJDt8MtsOVHCoV79ueMRiGgfQkQCtnSHut1Z2
	EsjLVm/kfPhW2GmNSwvPSDnsZBqjMJCMWOHrY2cJ3hueKDWKv8dVvuo0NqpY66NcgFwIjMhz0b0
	r7fZGtH+ukw4ipDgxkBwMcFJQW21YRIF7c6KdTdW1IA8VH3suQF8KBW0TtPRko1P+fsE=
X-Gm-Gg: AYBFou3M62H5S+zQVtgWU3wOrDdOhOHhYKPoJ9ojHylXaejWnkUnqoyir4uAFt4C8d/
	a3oKuUt/8VYZYjJFCETblE0n+JwzscwSBkd/sKdRRq4Ri2pDN8/eKSPmYvGrEXbPXqfXaZ9s1nR
	b8wPdPAzzZ0kOu6WiRDin6LHmWjXz8j66EpQ369U+G9txk/oNDa1Lgqmtb34+RIaFjkFLA9wApq
	gy18boFI8UcTaHq/A3NKOrwBpmHysY+52Nvi7oLwkOcZ1/7XyFvZxDRV6lnxlX+SPV8HNO0GG3l
	ulPfD76tV8LJeCn1bsgRaNyy85lu+xobsUbs5/cNfbRGz3Qb4f1614YvCRK4MFJy67t0r2bRNt0
	rsDKTElZWgzCbKI/4FsyERYq43jFFkRHy3O689cCP0uX2DOGr1GQWCnyHw94PHAo8yz7XRdweMa
	vGElsVaXcqWaOZEvXZXspsIVPARJuaR1mMefHt7MLJL+ktdKGoiKc=
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1440517885a.7.1790515801321;
        Sun, 27 Sep 2026 06:30:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:93a:3d71:c9ec with SMTP id af79cd13be357-93c43b7ee3dmr1440513285a.7.1790515800839;
        Sun, 27 Sep 2026 06:30:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm94636745e9.15.2026.09.27.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:30:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 15:29:54 +0200
Subject: [PATCH v5 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-cci-clk-fix-v5-5-4cd498559ae5@oss.qualcomm.com>
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
In-Reply-To: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfX7aQSD43uFi3Y
 D96ws9FcUwaZGh/7SXTh4hEeJ84le1/KDOmJGqZ9M767U/nJVEbloKAqXW7UCdGFiUv4tNhrEDq
 9pclE2fB1o4zQBzshQBIX+HsH6wxg/n0aDjioR5A4TyxvmaTD+xe1RjH2dFxDa4xgFznlvppzkm
 8ybHj3v1irP7RSkFfDGAYMvJjRYYV22X9iRfJiYcrTsRKJC2xpTflgl/H4KI6Wkc8eN7hpHES+/
 0rhT+3h4lDotUVU6yJyoBYsmvKlzBLy73yhQRvi/SmPLDU35U/iSeRsy+HpcsfuFSd74iXmb2ay
 LtB9PrNpkw95BGUjDdNp89Yx3GlHw0hQlMO2xFTWodHwDIszj8XknTdBd17hzoDi/Ndk0E8YsPi
 TUmsafxqxxU7J53yfCNmFrG+05KHJA7gZmsTPu54V7n7X5LgS6qnQucKYOpstKLpLrXV1eiuvZh
 OyvjY4dyQyAKGJ9Q/1Q==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab91a5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=vhKaAwP2Rx2hMH-_sOQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: o3ubfAlKbOTfP3MD_6G0xFdjzKS92ePM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1MyBTYWx0ZWRfXxM8La46eqZXa
 bWK+1eSAwoPXEpkj6vgRe0S+9dtEKhv2XQm9+MPGM8Btr7JAfJMZ8EyXDBiS+8IqtEmB2KoAWtO
 3xGxHqAQOfc+mTNDq/iM0hNDH5ltJos=
X-Proofpoint-ORIG-GUID: o3ubfAlKbOTfP3MD_6G0xFdjzKS92ePM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270053

The CCI hw_params timing values are only valid at the specific clock
rate they were calibrated for. A previous change made the driver select
the timing set matching the currently running clock rate, but the rate
itself was still left to the DT (assigned-clock-rates) or the bootloader,
which is fragile: if no rate is enforced the timings may not match and
violate the I2C specification.

Actively drive the CCI clock to the rate required by the configured
modes. The single CCI clock is shared by all masters, which may run in
different modes, so cci_get_required_rate() picks the lowest rate that
has a valid timing set for every active master's mode. This avoids
clocking the bus faster than necessary while still satisfying every
master (e.g. a Fast+ master forces 37.5 MHz).

Apply the rate through the OPP framework so that boards describing an
opp table also get the required power-domain/regulator votes for that rate.
Boards without an OPP table simply fall back to plain clk_set_rate()
behavior, so existing DTs keep working.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 76 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d7b89508311ffc6cbe1ccd302a6e84dfa83bf6fe..14eb7e802bc86a06b7ec0688580886880026cb0e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1050,6 +1050,7 @@ config I2C_PXA_SLAVE
 config I2C_QCOM_CCI
 	tristate "Qualcomm Camera Control Interface"
 	depends on ARCH_QCOM || COMPILE_TEST
+	select PM_OPP
 	help
 	  If you say yes to this option, support will be included for the
 	  built-in camera control interface on the Qualcomm SoCs.
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 21695c744502f7fb5d333f1272f3771e4d9d5508..353d841ae02a99910eaf4a0f25ab72400fe28414 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -11,6 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_opp.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_RESET_CMD				0x004
@@ -318,7 +319,7 @@ static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
 	unsigned long rate = clk_get_rate(cci->cci_clk);
 	int ri = cci_clk_rate_idx(rate);
 
-	if (ri >= 0 && mode <= cci->data->max_mode && cci_hw_params[ri][mode].thigh)
+	if (ri >= 0 && mode <= cci->data->max_mode)
 		return &cci_hw_params[ri][mode];
 
 	return NULL;
@@ -575,6 +576,66 @@ static void cci_disable_clocks(struct cci *cci)
 	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
 }
 
+/*
+ * The single CCI clock is shared by all masters, which may run in different
+ * modes. Pick the lowest rate that has a valid timing set for every active
+ * master's mode.
+ */
+static int cci_get_required_rate(struct cci *cci, unsigned long *rate)
+{
+	for (int ri = 0; ri < NUM_CCI_CLK_RATES; ri++) {
+		bool supported = true;
+
+		for (int i = 0; i < cci->data->num_masters; i++) {
+			int mode = cci->master[i].mode;
+
+			if (!cci->master[i].cci)
+				continue;
+
+			if (mode > cci->data->max_mode ||
+			    !cci_hw_params[ri][mode].thigh) {
+				supported = false;
+				break;
+			}
+		}
+
+		if (supported) {
+			*rate = cci_clk_rates[ri];
+			return 0;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int cci_set_core_rate(struct cci *cci)
+{
+	struct device *dev = cci->dev;
+	unsigned long rate;
+	int ret;
+
+	ret = cci_get_required_rate(cci, &rate);
+	if (ret) {
+		dev_err(dev, "no CCI clock rate satisfies all masters\n");
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_rate(dev, rate);
+	if (ret) {
+		dev_warn(dev, "CCI clock could not be set to %lu Hz\n", rate);
+		return ret;
+	}
+
+	/*
+	 * Sanity: The hw_params timings are only valid at the exact
+	 * expected rate, verify what landed on the hardware.
+	 */
+	if (clk_get_rate(cci->cci_clk) != rate)
+		dev_warn(dev, "CCI clock is not at expected %lu Hz\n", rate);
+
+	return 0;
+}
+
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
@@ -678,6 +739,19 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
 				     "failed to get CCI clock\n");
 
+	ret = devm_pm_opp_set_clkname(dev, "cci");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set CCI OPP clk\n");
+
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to add OPP table\n");
+
+	ret = cci_set_core_rate(cci);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set CCI clock rate\n");
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;

-- 
2.34.1


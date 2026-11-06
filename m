Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975369;
	b=IrBw9VpCdhymr8hT79kYYY0IsEpYOUEbOQ6OEFz81HkjpPtm7ttcnfRaa0HJGrArI5jg
	 vaXzFSFQzKI22gNfC6S1I9p2N+gNxy5m8XQRnSTqKF0rJXthHrmA4F2519DFpIZn8WhMg
	 HoujoGvRAAB4abhYR2natpfaZkIHPGoyMs7HmwYnF/anX1PSgE1jay+ydxoiNE0d1h9oB
	 2SSXSbSLPeRAnvqL9yIQnltj2+s9/uivqlineDnsYDSdO4BqaEp1hT0K+sRbRcfYadhrf
	 VAYZtNXrK9zsmHN+ZcyNtsu4buWe/BbaOthYLj6pNu78L26N3BLUUhUDuPvFszzLTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
	b=MOIcwZubf8ToWr7Coo6LT4j6TK06Bv7n+2BudEZIJwUCnJ5qZQPvwY60aVZ7bbVlYv7Y
	 HbKN3244SLpdXMaPowgNu0y/X+MtwhsvRR86Pe7ZhDdduEPJE+m44v6QEH1pPG8gPWEFv
	 bpLFKHZ5msiNwY33e9Fni4tbX1AqUcORjtMYmqafh/lINPtthOgCgbTmeUC+YNs2zxof5
	 dSGRbaBEZJ1JA0wG94lbR+iMcoCS62eh5DgaJWMlwJZZCPUFu5KK0X78nxpEGwDebOK6f
	 xrodZt4YjIOKecUh+Zit+W7zBhxIuxeDC9rLbYZzDAcStLrnQ4EYAObEVz6tw4yBnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEDpkHpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTxI33Zy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22F606D814
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D22F606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEDpkHpT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTxI33Zy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ8Jf3647784
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 14:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=; b=eEDpkHpT49QTAIFi
	IHpOeC6yO7P0M2r/iExGAYcj7vzw13WUBwmH2Soc+w2rTLJpR5pWxlHmiJjqnCkb
	/n7jcp3R/7+efyrUoyXdluIvKEhUZg1U07+VaRitJJ99NSB0Osj2ZQXrm2OuuD7+
	rOpAQL/1krZGyVRxq5NZIVgW7gIClQXMGLI4YOhWq5UiGogCh+B2zS1iIn+fj3YP
	dIn+9KSVbr1ZVUJQV1Ghr8uezy2Xgv5j/g4BW7xioDmei4E8TRUrLTW9dFk8fXsU
	XiLszCtJbJk9fvpovu6KbhjgTbHVxI/EpC9wCaGReNBtlPBJbYhHfScVrk1cijmu
	+NarqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k3hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:29:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso775646b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975368; x=1794580168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
        b=MTxI33ZyUj2miqSjkwnriAQj2iDcDQ3yptODCLwtM7gZT4yIlIF40w6+qgPLwAFK+R
         s+E/UNEA/F5kewvc5wk6lh4UzsPGJzGDarC4GgBA/Tg7QpmL+0jACwotO/zCTvO0I0Q3
         NEAe+ha57AlokWrSptgH/yYwBEnPFaJ0NfS7MvFHfwWo5Qatn4s0ndonhxEWuIufL2qh
         cQI1JaNr9pyWcNTtW7RWkpjB6WxJZ+e/URe2W2MhVmAvJhZNT78/qzte1teswWeyIiUg
         FtuWckgX3ehDVjHGjkk/aFulmNd8u5opDzyscNdYgrdPRWiycmAirBDF6XCk2gEslFb2
         5aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975368; x=1794580168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vmHHHIhGLLZArBpIpsBA+MrbOxXbqqJ8LMqN1WNGoQ=;
        b=TI3GxgMbAgQn1MyVH5vDpj4joOTAZ9IJEkHSDZQ0LQm05WM0PDOrsEbC6kiIsjcM40
         yM/8UrPXl0sRqEmBzik1juSGC1waLc6BxTx79D6lOUFzhDqNt2lM6Nfp/w29VMnC5foz
         vPztKp5yc9BQzUAV699HDIvAIwA4zLxsRF+kuGOFw+jmq/2F1q/zVn9cof1FUOUwFce1
         X0IfNclxZpyBSew1Vz3cdqr/z2/GJeZsb/Bclikda6IiVjpvU3J89eqvOFs0a4tILoM6
         1nCS9iF6znbmFFfKYQrvdiUX5duifG2CTx2uIHxPjprC3vAgudN9I/JOFyy73974TpnM
         3zug==
X-Forwarded-Encrypted: i=1; AKwUvBycDM71HgrQ3lEwWGFVNKv5cBtQ+DqAFvwEhxqG0oLmZV43nqowxxmue70/4D+dcXHbTcFg3uVVdroNnWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eCQcq6tSWpKRpELhMh2/QWJMxN2NA9Bpc45+IXOwxyw2gJy7b
	CWltGtUupPiEHnd7qKsXeXvvLmvtW2vpjgBxUwqPcGaH4B72KfMlMW7EaZvbRXNDialXw9Lm1D8
	MmY7gxJuItgjbL8GZGJMy4ess6c3QduZJX5LC3A8qXloiBjt/4A555XF9JtB6H1Vax3A=
X-Gm-Gg: AYBFou33ReoPbO+JmnH1Sxj2XyxxE4KwnjVEx7WmZ5Ea77T76C6e2qy4nX/6d/oLFyz
	PX55gJw2Rvz8h7Or1ri+y9GeVTpoN6C4Dfcdbt5UNU6VOAsWJpoBnZSD7nKwYlbupG/PNTjJPiq
	h/Be7oMu3J7gkxlTEPdcOkx9HtEzuc6NrHhHEHAkkLJpOhg6N60gJPnY59xALgAd5wtWyGTsMHB
	QuHMnRFMc0x3oxsP3l4Sc4iU5n9xC3GN/apSya638jaZMdA/VqmZ9Sj8juETD6CZRSsxJkohI3j
	el6Mvh0W3BmnVsykrCFhCBoXpDflDQ+dlYFZLXEkK6jJUITW+3OsvD5cESttoyEgo3/aoUGjya6
	Xi+ZqcA8q/vLgKaZZdUO7SrW5mgMbRC0sjlp98Xzpr+zXdvjkaM0FgDobHvmm0hzgVNouLMEAgR
	dp5Zzs8A==
X-Received: by 2002:a05:6a00:a226:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8b37ac9e896mr1857684b3a.8.1793975367677;
        Fri, 06 Nov 2026 06:29:27 -0800 (PST)
X-Received: by 2002:a05:6a00:a226:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8b37ac9e896mr1857668b3a.8.1793975367052;
        Fri, 06 Nov 2026 06:29:27 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0161sm690244b3a.26.2026.11.06.06.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:29:26 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 19:59:16 +0530
Subject: [PATCH v2 1/2] i2c: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
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
Message-Id: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-1-d3011344fee8@oss.qualcomm.com>
References: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
In-Reply-To: <20261106-add-shutdown-and-panic-notifier-for-i2c-v2-0-d3011344fee8@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793975360; l=3516;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=hRy4QXtTf2tMCZvfoq+ui5IjC6XD/IxzXIrA2TDPPZY=;
 b=Sl0GfULmLBGOhXk/jGilqw1s4SmGQJyqlOiznx84U8i/gtsWmM4C6+ZIexx8EgxkygSg5hr81
 9GgwxnuX8+sDshWQwUCEvlUOWHY3H7SVE8mTxxTTiU1CN++oo+FJRtk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: nvFtYyViF29naQWjNOpZ6ZOLLWRZ5bHl
X-Proofpoint-GUID: nvFtYyViF29naQWjNOpZ6ZOLLWRZ5bHl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX9tP3m9LzQu5R
 xrYKUAy+GPFR1XVCYFT0nY9/6HaQTiqb1PdyvbGkablrbrUgS8E3eUpQGinzTbCYX0GGKe41F5l
 2vDnR5UGnCzHlzKhsS9KZvDo3amAQwY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aede448 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jy3MxQloX0jDNi3JzIsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX9x5d/t8/TumM
 CcMu+MFgxcWf9SXKVYlF71p92Obiqu9zmWOEUBD4NyN6mRVpvzDQ4SB2X8y9jJiFaGgQAMMOaW2
 Y3ot0FNm7cgy9QQKiI3LvsJBYU22UMI3YdWo2yc0PaMjd3rpNpjT+E04yw4U9NTo6aY15IttX5B
 DKJVnOtlkqlEPJ9ozj9dAcX6ZrEYNRTRAwjUuxwyd2rmLx2NI4+j3Y1YSfQukmuhspbPVgHMyfT
 sFKplI6tvduHo19TtvVNzbkaVmI/oOmJc2BouISA7VjyolrqXGY4h7niCgDZs+E4Cn2v3eioamg
 StmzXGhdFtN/dacnPKZsNvNCmgxZAbxSpZHe8X1TvxAJir4dNPukNhO9GSZpUf1hbNDSEaVCc8v
 fyqqLPQXCz1pAKrSxpV8+FcZJJWeXyCg6ey/g3/Q8EjsR7uEAyvc+mSO23j87P1ar16KQzBDElJ
 Q3surYaSQKcarrhLdHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060057

During system reboot, an active I2C transfer can leave the GENI Serial
Engine in an indeterminate state. On VM-based platforms, if a DMA
transfer is in progress when the VM is shut down, the SMMU can raise
context faults as the DMA engine continues to access IOVAs that have
already been invalidated during VM teardown.

Add a geni_i2c_quiesce() helper that cancels/aborts any in-progress
GENI or GPI DMA transfer and resets the TX/RX FSMs, and call it from a
new shutdown callback before the system resets. This prevents both
hardware state corruption on reboot and SMMU faults during VM
shutdown. dmaengine_terminate_async() is used unconditionally so the
helper is also safe to call from atomic contexts such as a panic
notifier.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..79707095bbbd 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1034,6 +1035,58 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
+static void geni_i2c_quiesce(struct geni_i2c_dev *gi2c)
+{
+	void __iomem *base = gi2c->se.base;
+	u32 val;
+	int ret;
+
+	/* Make client i2c transfers start failing */
+	i2c_mark_adapter_suspended(&gi2c->adap);
+
+	if (!pm_runtime_active(gi2c->se.dev))
+		return;
+
+	if (gi2c->gpi_mode) {
+		dmaengine_terminate_async(gi2c->tx_c);
+		dmaengine_terminate_async(gi2c->rx_c);
+		return;
+	}
+
+	if (!(readl_relaxed(base + SE_GENI_STATUS) & M_GENI_CMD_ACTIVE))
+		return;
+
+	geni_se_cancel_m_cmd(&gi2c->se);
+
+	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_CANCEL_EN, 10, 200000)) {
+		writel_relaxed(M_CMD_CANCEL_EN, base + SE_GENI_M_IRQ_CLEAR);
+		return;
+	}
+
+	geni_se_abort_m_cmd(&gi2c->se);
+
+	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
+				       val & M_CMD_ABORT_EN, 10, 200000))
+		writel_relaxed(M_CMD_ABORT_EN, base + SE_GENI_M_IRQ_CLEAR);
+
+	if (readl_relaxed(base + SE_GENI_DMA_MODE_EN)) {
+		writel_relaxed(1, base + SE_DMA_TX_FSM_RST);
+		ret = readl_poll_timeout_atomic(base + SE_DMA_TX_IRQ_STAT, val,
+						val & TX_RESET_DONE, 10, 50000);
+		if (ret)
+			dev_err(gi2c->se.dev, "Timeout resetting TX DMA FSM\n");
+		writel_relaxed(val, base + SE_DMA_TX_IRQ_CLR);
+
+		writel_relaxed(1, base + SE_DMA_RX_FSM_RST);
+		ret = readl_poll_timeout_atomic(base + SE_DMA_RX_IRQ_STAT, val,
+						val & RX_RESET_DONE, 10, 50000);
+		if (ret)
+			dev_err(gi2c->se.dev, "Timeout resetting RX DMA FSM\n");
+		writel_relaxed(val, base + SE_DMA_RX_IRQ_CLR);
+	}
+}
+
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
 	u32 proto, tx_depth;
@@ -1209,8 +1262,7 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
-	/* Make client i2c transfers start failing */
-	i2c_mark_adapter_suspended(&gi2c->adap);
+	geni_i2c_quiesce(gi2c);
 }
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)

-- 
2.34.1


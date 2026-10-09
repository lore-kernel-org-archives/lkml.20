Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21084D795D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551628; cv=none; b=mJsb7qKJ+0g44bDvGHNUfwT0gAV6rVo5YBLtgHQlTIPPWnXwXGeioCKnPLLrndbRJ9/dNBHq8hJuXhkOJS6pYsF+CC9X+rBMB/BamilD6khoJPBPLdp2yFHznnzG6nFJ9uFg3D1+dL0lcS62cHQRnvXvoCq02ffFdgTBF9ddXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551628; c=relaxed/simple;
	bh=reFfoCBR/VrD5yuSi22N/tRmVThkLJt4HyWePh09vXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJvYpi4GNu97jqieMR1vX7ZA1Aq5lDFDX/u32KKxlyzF4UZyqiquIX8YEVe2E7RZut9FFprWZKeT9vgRxq5U9BVB56iVnpGqR6iGJ8Ljz1KizFsl2ZNypYnuRyUpayRaXSEXF0BmBTivzhcDFl9a0JFB3qeXOdb+SkmVJkXB2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmpuwR4y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ids8k0Ga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmpuwR4y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ids8k0Ga"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4fRR1336279
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqxzVZmYXbjEutY3WymctZzw1+CsDd0iqWWocHjt1XU=; b=XmpuwR4y/0xJqFTh
	C1sjwNuxSNBXWXO7Nq07SKSc7yeRy5E1iDr9H/hgH3nf71lBY7kzmD1o+Enmg7DU
	q0Iesj/ErDb5G8C0C6xf8aSgdFU2hYPGEWUkSp8Lpm+9vIDXl99jyQVUJBY5bGyK
	5AhNAo7Tf54vC+lbumc+gO3HDw8CEwcyak/+Gf+tKW0pRfb5q9ow798am/dGozGZ
	cFGb38JaW2ukXgXCXyLftUhNAiYnfeWYP5Tdrj6CQRYYSHJ65ArEp76fW4jUqCe1
	dn9pNpvhKwkk7xVSsbnHt6hpSqkTpkV/Z04HprywFn1Qv+grPqhxK+CqgTxSc4id
	qLCl6A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgkvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:13:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88732460a55so5700586b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551625; x=1792156425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqxzVZmYXbjEutY3WymctZzw1+CsDd0iqWWocHjt1XU=;
        b=Ids8k0GacpaHa0TqRfD5IKf/kMr15dkg4z2VFKAyMKE2xTb8hJH9JIedFPnHtFNpmf
         aBc36+IcdWxf5jFDn2cPaFHNaoFIDPaIkDq+tNimnicGvysPRy4JOkOHwIcZTi9ShkdH
         zO9hJSkYZ/g5lALBr1+Kqw2AqzwnNGYWj8p7FhNz4zpY5E6ft3c1l47flO2Jd0n6Mu8X
         tBxJvMgAXbcIwoNy8IPxbZ1NkiT6OC1T1qZAkQNJ3ujpEqL6e+6wxQgDDBaWUYrf5gQa
         ny3yE36b8sMcdegBANaDbDI3lZg/co2OUsL9vIAdXCbkZ9SjC7fADnaejDb5Rm6OmtK6
         hv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551625; x=1792156425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqxzVZmYXbjEutY3WymctZzw1+CsDd0iqWWocHjt1XU=;
        b=e4p/OlSnLe29aa5clus5D3OnEpMmCY3pyjwiIpCBiSbENPBEKWvtcZdcQnyLjLYGZB
         DMxCr+/0VlAZj5oCItgjO/vQ3JbCTBoWydMqBKyE1qbsuD37T7+TxRA53B1rAISshQuS
         kUwI7lKigyuZFDoaek4d7gB2gnMOm6yfF+KHBTx+CtdnXuuzx73G8Be39l36yV5EXALe
         Uy+1+lubezso5YiPyhq+PPdZP+kOII4iPrMXFvt9I+kiUXVHMGN087o8FxiCxk8Vdw7/
         r35TSzTCAYs+eYIhcwnRkmxTzcF3j27KdNeNtnTJkLZQbragri7gnGPoQanjrE9BuXWH
         TR/w==
X-Forwarded-Encrypted: i=1; AKwUvBz7CqXYhk4fdnDEdfLaMl6gISYHRVD7SDC+Leb9xza8d3i0GFWEeQZOjUkkQbehrrZH4/S/6I954wAFRek=@vger.kernel.org
X-Gm-Message-State: AFuF++maY3ZKu4vAoJTJQmJcg1/hWoBIBnScdxXH6J9RhmtA37SgP4mT
	Zhj8n1f5/mxIsgu8V/T9WOawgensQqACax5+YOOtDdSkOoFfHmrMIxhTB7mmBH6XPYo/3VQk9od
	QtWMW9uGUBspG36gVZfot6CgOhJN6d4kCbVtiDorNkYsfXwNjBgHqQThf6/efHoxjITc=
X-Gm-Gg: AYBFou2fvljNctuqCVszYYcfpk/HqmFase/vnqUCtCoaWmWXZ5F6+kAUEQR/i8BtfGv
	CnzewttogcptCYxhEdEv8uDo3kOSxmraA4EQzpWdjOqvisIVrV4iq1DKl5Fn3kCXqcz8hwmKwq1
	jRRJZBsynxeu1Frgwj1wxoJTg7Uds9bKqyZvguLP7WxEKKGNY80qqsJDGJCkHQRN0TzPOq9mTaR
	v4iG60iMDik+v9wC59AsEOkBDELfyxOzj9mGheMNbZxSSj1ONjNa/zY+YSlzvOZ9fOKTTvGC08S
	NJY3ABBnU2DfCqEMzxeG6EKbrztSfH+D/eAHxHGlbFbT3Jc0Z/qme1EsUuf3gZ8KatHLMrMukH4
	ewTdruzCHpHQ+b6k6gQdzAg+tQMQYwncmt06N
X-Received: by 2002:a05:6a00:4c08:b0:883:371:88e5 with SMTP id d2e1a72fcca58-897c6d1f49cmr1620159b3a.38.1791551624871;
        Fri, 09 Oct 2026 06:13:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c08:b0:883:371:88e5 with SMTP id d2e1a72fcca58-897c6d1f49cmr1620137b3a.38.1791551624410;
        Fri, 09 Oct 2026 06:13:44 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:43 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:51 +0530
Subject: [PATCH v3 5/7] ASoC: codec: pcm1681: Enable the PCM1681 supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-5-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=2026;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=L1AhXScTy3PdkpyoWxAr5TJPIqBGUi2gGiNmkvw1lc0=;
 b=Bo3vOuglMAQbtMAuiGSkts7J71gHkN1EAKPlb63cg2xzlSlwsUOkdC2zeuSDvhOAy5S72GOp7
 WccpMonuBM7D3eJn/qsEJgt0l+/1ofFBtPthtTSrtTjtH1UuhH0nA6w
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX9Ls7Qpj5uZB4
 w9EcFfuMFQ/FdGR2wqC//Ji9qPFHCzCWh3HTWCGpFTHcdIR3WH5ZvG/OAQlCuB4NkvdOcPh5hsS
 zdqJIda/LRe8Mxy1ODt2m3YahfVVuNI=
X-Proofpoint-ORIG-GUID: kZ2oe-rcW98SUy3-Dd8ycg3QGoosXWve
X-Proofpoint-GUID: kZ2oe-rcW98SUy3-Dd8ycg3QGoosXWve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXw8MlnXonfobG
 jWvfwEqu5mFmG4jiPlgQHU0nY5LIUh95T6ILlz7DaZojBB55GK6wUMKYM52L2nqC+zVkx15OPBW
 HWg68H8e0T5Wbkj/Laz7SHHKu2MpuAtmP387AyEtcIIx9EZlgC5rEctNRy18Rp92WaD9E7cbRbI
 dFxioyQeV+FswQCjC+UnhTNHiuXvOyDtsDDpqUX+qSszU5PXCJFNmOiXLPWzR3JMzLPFVztXsKe
 9rGVcvp0HzyfsHWpK+tOvGI/RU+Y82dk21U3acNJRuqDxNIpkGYiB5Iixh4WHdW5K/WZU/ybBG2
 a1fqFne7g2/boGkkiP5z2dmJixHgn6UrdOcoJ3mmMqsItXitznLMbkQQQiGuriKb6FWDzZe6w91
 LFk//ptK7U1TcmbG4tzrl9jPS136kbI7CnG8BYz88qeBxgAvqlH/AYamJCICz5/IQHgpK/NIT5A
 HyeZF7wwNBVLZGjbN8A==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8e889 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-SrEOJ3PUwGxy6hRkRIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

The driver assumes that the analog and digital supplies of the DAC are
already up by the time it probes. That only holds when the rails are
hardwired or left on by the bootloader. Boards which gate them, like
the Qualcomm Nord RRD and Ride, have no way to get them enabled, and
the first register access then fails.

Enable the VCC1, VCC2 and VDD supplies before touching the clock or the
regmap, so that the DAC is powered whenever the driver is bound. The
supplies are optional as far as the regulator core is concerned, so
boards which do not describe them keep working through the dummy
regulator.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 3675b2236..6002da3a5 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -337,6 +338,10 @@ static const struct i2c_device_id pcm1681_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pcm1681_i2c_id);
 
+static const char * const pcm1681_supply_names[] = {
+	"VCC1", "VCC2", "VDD",
+};
+
 static int pcm1681_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -347,6 +352,13 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 	if (!priv)
 		return -ENOMEM;
 
+	ret = devm_regulator_bulk_get_enable(dev,
+					     ARRAY_SIZE(pcm1681_supply_names),
+					     pcm1681_supply_names);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable supplies\n");
+
 	priv->sck = devm_clk_get_optional(dev, "sck");
 	if (IS_ERR(priv->sck))
 		return dev_err_probe(dev, PTR_ERR(priv->sck),

-- 
2.34.1


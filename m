Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B420331EAB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125734; cv=none; b=f4jAgwVtZjNGflVzDZTbaCve3MlSJr9ItdVIsqjxIyXRhlK/RChISQhL9M6dYB9sNORozCgH1TJ7GVmx4PgtQxue/Oe5c8FoiPuRQSJD9wT3sT9UPJd8e1DV2AGbDxJ9PNRkzjZAbfSPUHQsCjJOhxZSse/M472IGPZpUXZI2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125734; c=relaxed/simple;
	bh=6L0tBYyplIQ6seGPWW4VFRe9yuGstOvOQquYgeMV1tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhTDjZ6wsjk9FMShnOITbjweE/p7aj6A0OLg8pNU4hpV/g+/B+0qnq3vL44H0UWOaEFc/+QzY/Srexo0ktgw9QoTmqoTqtiZMGb7w8zc+z8tn6tpzrGcGHk10apf+yyb3kc33qNB6dXLrDSZL43eDb6xriEjzhDAfxs3rA+/WQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBE+kOSK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5e1JbqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBE+kOSK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5e1JbqV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74Cp1509175
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=; b=GBE+kOSK/CqNAn+o
	9BjNRHLqUPyaS9JsxcDhjZWVYqYJAdisIGuTVTfe8PUgeYWg7tFfBp/+xJnseghN
	wUUcYOCb1b+Iu8goskOlo0NoP/JqjnDQ/G4trRGeMlG+yt58Z7SushnAChxq3lOx
	2pG9iDsSShi1o94GOE/pLkm9hLq9edFJpsKxlSQDKV+zPoutoq/qrEodfxT4P4ht
	hK9keksXyJVwAHD4ISEV12QPlrtukFOGvdQ8OHzotsnnUcn2wKXqvgric4LYdrbH
	Vfvtj79m+tJ2LpHeZcfwXZTrIlaiV9kbwn1hXedhQjW/Fs9AopcGhrUx85t+nD2j
	iKhnoA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xsu7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so928032c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125731; x=1790730531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=e5e1JbqVnmMOCC+I3+RlNoed2MfmJSaPoyDZ+ghhFlpmu0yojdrFCoDxx9U419Heqd
         uvLojRnIfyPRT0S1tVK3GHlxrdyEK4gRjTiYqeyuUSiLVZtYTWwgYMrDaTB8AURp9pvO
         WOqDXZl9V9kjACetyvz0Ced4/4PUgh17zuTFdQ4SJeU5MCBN/1XhPGz2m4TIlvQ9cPao
         yJh/Oz8zx6Ig5Gf1rypjC3MdYik3v1lcA4EORfQMHGgG7LcpLRe59pkKqE2HTZUedcVG
         +ZrfI9p7S2Bij1ndHgDIAKfJ2jFWYMbOdU7RAod6T5s5ctGul1tWNzrS9czm+G0mKRiO
         WydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125731; x=1790730531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=ToSVgxWVdeDsHkf7aRKrbs/l+poTiLk1LksXz20wNeJ/IlqvF6FMHEY83jYRljo/Tv
         XHs2n+mWkxgiwFMtkSCHdgrIN/8F7Yi5BJN51yqmZE8Edbfd6GhWKOEX9vAMkA3VOELb
         QTdvk+CT6V+cIm2ZYv8Alf4rD6qpLvGUEJjA4tqyfWr4ei6vp3+iBcWpS4xuIi1t6fN0
         CYIzhFLJjncO0RPrxxVGbVBGrU4X18yd5bsolBdNM/QwLRJauUnohpSGz7nf53yZQ5f2
         eDl0T5r3tf4hxJqZDai+1l+UJAnsKdarOxkhy5BNpSGh2PQa69Ja7jAoq0YnXqQ2ksCk
         2KcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUf0tEsdcIrOZP6o6OMTKzD7I6mmCbD4i4zfKHVmZkTa6TZuArAcnq5nkjET88eBx9dm/mFpB5Zpr4JSE=@vger.kernel.org
X-Gm-Message-State: AFuF++lBAP4J1KR2sinV113SO5Si9l/Ta4Rx5Z+Md0BljWmvsc9vay/Q
	rvC9y8LBCzMtAi1ZGGWv+7p8IreUMa0X5KWG/TBgl6P1dHmiAcxv7cqTs6/zV4oNzHgR2YJFO31
	5Kqs4XsR46KfUJ1BIR8ItiOErn2ZRvy/J7v2R1F/Gt2j8n/HpNsKUElOk9pTHxkpa0CQ=
X-Gm-Gg: AYBFou3EDCBiO25cYpBdoBPPv3nidhMUvjpX9Ndvv37uDCqWvcDWdAt1OHRneu/o2cS
	fJ5xs4KyPtsO1rxdc9q26cMYH5zf+CA6lO82WKGfoX7qzCEdYWAGvVyOR4TnnNB+RTmu9PjDw1I
	KphjYBAOq2uMGzHzZsFEP7/9+gg9dWd+ZXAFK3C1E2WioBw7qxuOmejvMt3eQg11KUeAJYD/ii3
	IYLd6bT5PPA7M1Y4n5H1WwwJH0+sYWbcUL/R/xPdDdbzhN/e2/8RDeFgqpoutYCsRFoUsWj+ZmF
	3Qv0ST8ajXQAIgKzhtMHiTxutmh+63MPUD0SiFmrJcwO57Wj/KsBudEegN0AoMC0DS5bYsgzqvQ
	rFDICwBcYQCJXX88+b/hPkJwwkxL5
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248792c88.14.1790125730723;
        Tue, 22 Sep 2026 18:08:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248735c88.14.1790125729855;
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:31 +0530
Subject: [PATCH RFC net-next 5/9] net: pcs: xpcs: initialize runtime PM as
 suspended
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1703;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6L0tBYyplIQ6seGPWW4VFRe9yuGstOvOQquYgeMV1tk=;
 b=z3cMy7Tu8YHBAgVXBHBIIhABLigrMPxhWRGWgadww+VwRWN+w7Titd/SaYgoc53VgWiAjo5Ar
 wlhZvZF5Eb2C7XVC7uM3dKyoY9gjV2ZuDMXUWq4G02oNKHRWgzghSxL
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: odRcGLUve45YoAevuObO9A8GUclTjann
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX5X4RgqCnH8lV
 05dzmwRonZKjuTIYzXe0yEN+khmzoRIYEtOdQn7PhsgQOLsZlgoBdpxcCbIGmhHZD4uWNKc9gwJ
 gmGWgfa646uStV9M7ESrJEeZ/xhi29w0n7kTLcw8vUcNSyUYLFGqVcyfS572pIJcjx3Xlr4i/lK
 Y87m+if5Qbn3UljynGmw+ZELFGKwIQQ5Ytw+ewvVZl2gZByOvTJ7RxROrjUysZkaXChbyMToyRp
 E1bsbFlzhWeNkIZ7xbbUYgXRFR8/azN1kXXfLyo/xSRG4MMmCPaBlGpFY8VGXTkq8URCM3QIASL
 u5vNu5oNB9AUmvn0sdeAo0DBfIV9LbNvgAc+oSaB3Vp7YfJp26ETiK4LAjOoI3TqqsFKN/z+Ppx
 sEUCChVgxNN1gC9Qq/2a1eVa54qoBPumhsBMZrmJF5ePiQTAji5GCrsWgAuqyq0CmFmhOaHRDJC
 Zo2wpS1kl4YRM9lAm6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX3xSHlqSa9E4g
 m3hiX8Sv/MQE3mQJ9ylMHUuMzBwMyQx5MqlICpZkp05FDy2YqfYUxoZupBlrAFsPll0LS/g8RAb
 szBe0Zr3glJThxcI0hmZlpFwZ7Gw4XY=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab326a4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_2kQZa-5yrNbEit3ZwwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: odRcGLUve45YoAevuObO9A8GUclTjann
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

xpcs_plat_init_clk() acquires the optional CSR clock but does not
prepare or enable it. Marking the device runtime-active at that point
makes the PM core assume that the hardware is already powered.

On Nord, once the XPCS CSR clock was described, the first
pm_runtime_resume_and_get() accessed XPCS registers without invoking
runtime_resume() to enable the clock. The matching runtime put then
invoked runtime_suspend() and attempted to disable a clock which was
never enabled, producing an already-disabled clock warning.

Initialize the runtime-PM state as suspended instead. The first
register access now runs the resume callback and enables the CSR clock,
while the subsequent suspend callback performs the matching disable.
Check and propagate the state-transition error as part of probe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e013a5253a22651220e62352d03faabc3a3c3658..328c50940d46eb8e7bea06ecd1a20214e3cde61c 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -322,7 +322,11 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
 				     "Failed to get CSR clock\n");
 
-	pm_runtime_set_active(dev);
+	ret = pm_runtime_set_suspended(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set runtime-PM suspended state\n");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret) {
 		dev_err(dev, "Failed to enable runtime-PM\n");

-- 
2.34.1


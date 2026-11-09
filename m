Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234123;
	b=UV7cVZol0dpn5HfNeLYmuwgu48xS4Gb3HhYnJdI2uo6fXMb6FMkgeNYsTSN8YFzNPAfS
	 OMAjyGtbSIcd8F8vcnUx3In6unGS8MLJybaGD3ga6xOPr5699OrXtlWZaFevUjIFzdEYq
	 kDg2b1w2MDOValwLJmK+azEpk+ntc2XxeFPvAXCG+DukaTx9LSY4qZXE8hxnx7CXDDwWz
	 K1dyUyBhwcEOJHQcODT1Q6NbczctCz0gsttjGMB5+7Aw4isUgTE8LUuGVhbQPUlQxamtm
	 v9JJo5wG0eFKDcaeE4NcUV7wJcniec9klKGsHcD+IPhWWAyfoQwjqNvFravlQvkEQWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=h07o+kcvVT4wGy0OJDT1JsadxnZpNUVQKDgAHPGkZI2jmWdManCNKlOHUP8QEM+gkAjp
	 K7+IlbBGeeoFFkcTQ0ZMxMIQpJXoSvFNalJhPLtHUxPdH2Ifck0KpaeyiclAHpZvliltf
	 8UTVdQx9hwf6zJKG64PVyNobu4kDieCm74tdZ+OnDkX4vmMUG7mw+hqFd8t5FFpq1CDP+
	 ++ZNNUhhQPmWvew4Zij0TL6FUixuDj23uLshOk1Yxn+J4PheYScSzra44nfVpP9nCRt6/
	 p4DgosKlq2bPEmHziUCj+bSSmErfaA9KuD+OdKHdVUzmtjsmQE1gCSyQCXlnITyzBsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VP3JndJq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnKGvONC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25954606D801
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25954606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VP3JndJq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnKGvONC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEvSk309696
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=VP3JndJqajd6DkZWuN71vb8csiA
	50Z/rE72BeJq721SdbBfWSAJfwadEbcyQm2eKZ4CM80wyJ1VoTrcgOC+GXgfnHqc
	uBJnZztTTTzsgxAB+YL+MlXWGUSAkO8jNvij4peWkpBbk6WpJeX9r2O5eYXDHvxE
	6DqetY5diSoiftEiyaocqI8+wqPrOBvAAc/W72I/yCDNTtqKwnC11y0dKtdM1SiF
	szI2klbpgkrspXGF3eG3WTl/cq0aTOp13jqNoyzF2QPt53uVx38M5c88TYyxGoBj
	arXqg87vfG1PMTo2+/nYlE8Zrmpvi/MmlfNm81O8Y9ua1KIgJH5u3+ZhvCQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8s85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:22:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so498213a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234121; x=1794838921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=TnKGvONCXuNZCt+zLjV6w1xpNwRWitSMPol0FdrNK4PrvyEMQsG2Wh5Wm7txN7anWV
         YFp98LhVdn2vS6KAxu55ItfJxwkgGu6NGZ6d5xaFyz7aVirMD6VzHjci/eNPSmR6rU63
         Wt7yi8+SC1X5SGesjvPKEYXHr3c4N808u5wOziqk78JPNmSpHyw7IGHK5MNrEY6igB2k
         BgZySWb0HpzYDXKObNcY+qspLFebyAcAFiVaH+uK1/9rLw/btqg2P2DX7Pe5jKhxTuov
         mecLd7zgfGBcygIhzGCd7PN+pEmR/M+ETdMO3jSfCo9xplvPP3ISPiRcxXl+rXEq3R9p
         OPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234121; x=1794838921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=K+mvhlNdOORAWfTDD9kYwwy66fBed4dNf0lr3/5jaTBVihZPpqOKAkzT6O710sy2Ww
         sJ761uLfmQ5+AsNF/5WYxbkhjCvSG8/irALN24sduZRI9WeeyipGm/7WSf8mdFwLieqZ
         59GbbsuxodJgQmNhenIA3EgFo82I+CiByIllMtkpUnLmhLVgx1o5WEoqxDXYoLZorvxx
         byADwGQppdn8Nkul9VQI/9RklT6fG1ZOfM6rQc1o30YIHaxJBl+bzXeChNP/fE6F5pj1
         wlUhyVX9fBVjeSjjzms1NVn1kRU0y+jBPPi3C32j7g3tOfTwXdtrOw+4ZHvnmRrpGdo0
         80Gw==
X-Forwarded-Encrypted: i=1; AL+hErELWQRnVBG9X0CMJZVzeoa457c5nwRhQDElVgpc1ELUsOmwwj5ZYioWe20zeC5NtHkN4wLM+TlfFy6Vu5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2w1dU0LcyZ2HkqvIQE0p0DWwQ0F88ZcHQfM3UeaE8xD9NL05q
	X3Ubl1zwINXIv2cry92jkdKUs7g9Yya/+aw4M767bVHuX7TVed3ARuSWU5yFUCejDNoiry59p3X
	necLqr7aUJsGwKs+BSpfuQwlq9OfK2c+MGmGGVJTrQWbkHKjTU1s+12daHPAxnKGMVqs=
X-Gm-Gg: AYBFou3Dh2gZu4TqCM2Awh1Zm3Q48m9YZuTBn4ax24gdSduhI+/7kOk3lx7uoStroNS
	pBzN44jU2ngAGG46GxACn38nTfFEs0QZuGwGTFKFVFW93BZUlcxrSXXwJBW05Yc8pKbbHs1EXWs
	pkAgj2fU+uhJJlp4cQomStF7dkj7HWSZ8/RB/dZH28IwVlXHJD0cWQneYI+Jlw0r6WZoQr/LnZe
	faMjw4Cr8TRdrgDtXxR1akhO+4AIoHzpn+XdCP2zG4ID+2hkjjt/QDBKpX8j0K9d5ny8STRZhyU
	I8W4R2Kw1wddHOQKIHJUbkhc/ZZkNLSIf9Ij/coZf1TU8UYeivqCrMWQr1DZyEeIFvs3a41hib8
	AQZG4vjfnuDNBOVh1+cLbkNdKw3HxBEJraAiTp5qBmqdVFuDh6U5/G0o+cTySFHxLGiKrCA/vFP
	zACt9aCpHZ9DbOTk/nSpJZxgmaIgBOGmXWAcPuyfd/avI56dzfIAq2Bt2xaK78sQ==
X-Received: by 2002:a05:6a20:7f82:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3eed4ac586amr4406572637.60.1794234120715;
        Mon, 09 Nov 2026 06:22:00 -0800 (PST)
X-Received: by 2002:a05:6a20:7f82:b0:3eb:a638:7c6e with SMTP id adf61e73a8af0-3eed4ac586amr4406541637.60.1794234120184;
        Mon, 09 Nov 2026 06:22:00 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54747sm1400381b3a.11.2026.11.09.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:59 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Mon,  9 Nov 2026 06:19:59 -0800
Message-ID: <20261109142111.256630-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX1V97Hd3Ars69
 sladnn9a/n7o37OgPkt6WDCi4zr2dwdSYllCKFUL+isRx5xi5tOWsSDQmv8cLjaHmbaK26XU3RC
 08yVEAz2NCTqzlmuQRHMyZ4Ks22We5xOPiUXT/SRX7zXRX1AIvDxgWSAuocfpHcni2nTZMaJtL4
 rRnqG0oItgaRXCBQbr2qSmZHrEQ+q6sIa9xIZgGNV0LaqWeZouRsww7Ms8n9WXl6pNt3FTTbudb
 I4ZOLnO/6T+MUney7T6e9MFFefoFdnnXDn0/7iGsvuz6XsL5oZJUPoPXhKyMXPRvxSWTGFmUrP3
 1HkkTMCQxrlxBx0ZgVYBYUbD+b5PrxK4KBrOEQ5rvrY6CPPjBm+KgB3UhFsEnj42A0KcK5ALYHx
 qeiTcG65JAz7tf1nUsN6uJKp/wJkzfx1mmr0bIZVJz0Oq1xa3zeHE9Ian7uGvuyDDyK+YZkggwd
 k+hHDiu9di4S/ljqyqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXw8llv9d6MeTI
 zboASQNNSZpf8t12vtDd+m46KYv7Q8YUQeMyRw31Ir9zNzyqhFx8WczZyqQr/aS1MOGCDhG6yhB
 s3U/+KsjeMEYFKCU3TzTNrcT/SPIuQ4=
X-Proofpoint-ORIG-GUID: FEyma45u9yj6kaJhi9unmpB22iKXSs_Z
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1d709 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FEyma45u9yj6kaJhi9unmpB22iKXSs_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0


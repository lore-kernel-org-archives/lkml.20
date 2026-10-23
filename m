Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775623;
	b=QcxRDU/YMa2Z0stbwl9ypLMrR1WbmBd/ymkHKwHRRvgcqjvO6m6gNDy5AZpMjU/5gB9K
	 oELccnh4oK+OvT1kmXmqkxxAN8sfw7KFDtiAQ+QaVMBzD3GYn1bRsnuBvAlGJrpjCEBDq
	 A0ukzOaURANoy1c0hCgFzUxtOi66n1h8+xI3iHUUzQLBSOTsEu3Qr3CwDUcF4G81M4h1W
	 YC3w7W1tlh/ZxTZh+EAN6EbvzgUZEo4a/CVmxHQYlxiJbehkRh0TVBglInhLBfjLMsZTN
	 UZoijfTDqh1JI9AF/PvEBMDxup7ym3bzcStRSHPqE5Nvk9uW/YwWoJE+8Bg4kUhQFFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
	b=isds9aUr/nsfs1DfRx6IMMQJf3aKqEtwpdc06yuk+tTm1UhecmzRY68daBV4jEiiGKyR
	 vD5T/W8mUjja5gM5sl2S7WTHgWdRmLWGulaR1AyFd/OdJgw05JIdvfFDevlr1tDqyGNg5
	 E5CzcSBM9IfdXmplbeh6VgdfIhN3aQhWTnUhcEOB2rAzV1KkCvN5Mf/kBvZIKNJVbS+Qe
	 C3K8XTddzMlinDfwdkXH11KC5NJ+zos7ypBe5r4CR/Krchw+zjGhmofh44i2WiDy9C/CE
	 lj3lMtFglR0r47k5tV9TK2U0wP/qi02HKY2v8j97FNarihgW1A6KhhGedUMF3AuLDMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE254606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE254606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PQy3lzNN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WdhkaLIb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wAa2109184
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CUrQmn/iwVm
	B5LtqJVz7lG2XrRhl26j7ewBang1CM10=; b=PQy3lzNNYhVdY1PYLfvnG7ooPAz
	CQqsiVkuSvXDBLsI7btGce8Lo+Fvys02bFRioBMXzZ1GaMe/Gd/32L9AAKyC6e4g
	Z1Zl1srJd7iNdCK17MF70h0u3XFsJNu9uOgLQ7D+/kTZHfi5LZsmNPk/Yf8KEb0e
	7Sd2YwUbueX5d+6Jh8QtUczhyDCUwzkKAjQWrVAZ9arigq7Er7bOhhbwDwAVGZQx
	K2wGtyrh15gN3ryXeTbBF/ddU4BsBCTEPBVZEVy6qF6eOqIu5XBTjGJWFKTTwfHb
	T6WM6JOFN4Ot+f84SA7XQQQ7zuZfk9tU3Ez1Hfb2fWzwG2++hgs6+zoaBvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso242549985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775621; x=1793380421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=WdhkaLIb3JiTSpgrhVaOA6zM6k3Pm2bVairPnuYOoMPJb0V+jl0EbFX0c9TO6FSmsf
         n7V62zx9comt+aqf66Jq5ncuKyElhOlXP2sdl/ey+Q0dh/w4jKhn0fNquZvOzGlqgX6U
         QTh6Xp14BahzCz9O2SozLbZmyN9Q2HnkLDV1VzTI6JhbB/+LC28G2TWBCBSi0Y3+qQSa
         GKabtKsgixczIYjnf36uxAAwbUeFfm4w9G4vfMoE6Od0/dPALqrUtXqRAauPS24nmPrr
         dd+at30UbyexZhQ8Cp+E8hK4OG0Ivvd6E3CGBuBG5gWkfZAvwf6pw0hkWGp7hPkcVVHL
         nCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775621; x=1793380421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUrQmn/iwVmB5LtqJVz7lG2XrRhl26j7ewBang1CM10=;
        b=sjdOgClPo8riB+gRxC1/3j2wn22QzveVrd6cwJBrtfTlOiQB/0pK6sIR94CRroUoX9
         2yAvmSFmw8ZNlVVHegiNTZJUiGz1rahsQ8kCmBOGdxU6QfH6h+kIBgzaj4bfyFeOLMH9
         gcpBXHl2L/uK/1aKpz4YmoL47p0Xy0ifoFn037hap1ftEu85UPHsE/04mUZ8TGy3ny3x
         Wk0c4H+49WwZyH+fRWyr1YfUxtJHiLsMWilDk3NeYSySQqJNjqHea07EPdh0pSOhXU8v
         fhMoNnAChpk6AG4G2FWjQdrDtbQn/+sYGUvSS3V5gTkB5JGtXU4uiKpDaXbzeBdjhpT1
         J3sg==
X-Forwarded-Encrypted: i=1; AKwUvBxAmrM338ZmRkAzvaZfXV0JVRd+WMlyy8Z/bI59Gsncfxe1UK7bsIgaOsaqEBRoUl489ZZ6qZ+BQE9wssU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvS+JnkeQ3JmHDxPmoNsbTNCn7yvASTkA6sVwWC04q5BGUHaBb
	mymZ58n3G7bEqtbb0Xhvmgiz3ziKGY2jncL7REmhzV7siKroUNpmxOekMltgY1ggK/oZvKPbSl0
	n9EcA5AddbrfgNIMCI7CS4IWYTXnqV0AdADx2emiCzeF2+1yheeCjgVJcSab56DEFeC254v3A8P
	U=
X-Gm-Gg: AYBFou1v14shjlFfhH8WaUfNg0uK6X6LZ4gnWBNNOnCJWonVLb5PgRAhPDmxWTfFWzC
	NQ2Wy7367Ug4q67LR3cojJgXIq6pZQnSAAFf2P9FlC/benHN44BCNAGeuo8QkLc6g7hqRKYpihK
	hKw+vO3xEe4IL4bbdDqKzvw2+g2TTjZUH1a4yUoZRxFL+TPT7MvcSgSTzYTrsvU3xclJcDAqk7E
	Ij4n9hVy+Ao3s2BAElkvLyiR8W6cGsyAU/6tFhJhcBWdVc94B3X52r3VlywZywaCUwLy9g+X7zV
	8XQK/yaX9Ojf3ilQHr14HeWqeWE5E6Vqggolht+7qBKaXjNFbZilRwgXdrairQFw4hv7BGCfZ+X
	nf9/fTRv9SqIx
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507963985a.43.1792775621039;
        Fri, 23 Oct 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f6f7d372emr507959285a.43.1792775620577;
        Fri, 23 Oct 2026 10:13:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] ASoC: codecs: wsa883x: disable runtime PM on unbind
Date: Fri, 23 Oct 2026 18:13:14 +0100
Message-ID: <20261023171316.819857-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7hIhilT+WQt7
 KXxTq3QK/m9662UJ0ptOmRGuKTrbjZL8BoGf2+l3Nlbr3sUMq6Kxx7W18Dzjrnu9MvclHgEfxgX
 UlJZg2XXRzfCE7U5jgDc3hf3LAJrC5hk7/8Edf23lBLU7iY46Qunt2kVhoT7k1zcDG8kMUwTCZp
 DUV742u/AbaZafsK2EQk9bejn8TKaMy+DET8PgtYKG9h2ofcjVT8H482R4paA7XaC1Ep9aitiTm
 LkllsojUFj0hPLBG3YmhdCxj78gt4ARNvtY81hIIN6o4oiX7WwZn5tGsQaWc3MfDd3Mhw0MOLH2
 C1LXE5ug/nwIOMRLwI2yjI2i1jQFwDJhcty7tRNmNlSIjIrbQMkqBJZqdVSR7z2+HEqROxKCPD/
 43eZscQoiqE+m2FK1uz4PwwnPW8hxBYbPubzpBj89jqyIWQtoKHpyMQmSPOYEXDBoNRCaiLyPOC
 iwPKaUBnkfqJjiGNNsg==
X-Proofpoint-GUID: xdFsPaF-hKZ9FKud9erIRrQeHb8VSY-q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8g8+lAKmbmuF
 jFM3CrjkWLocd4WuAnxjhfI9tkeNSxc+qsaBD4hAsoSzMTuUR9P2uHgj0QUunS3ieCrTP6OimX+
 68Awh7D9KMzvjHPmgQbP8PiAxVT+RBU=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb95c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=MSACiHdZT0qMT5F2yRoA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xdFsPaF-hKZ9FKud9erIRrQeHb8VSY-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Probe enables runtime PM but nothing disables it on unbind, or when
registering the component fails. A pending autosuspend can then run
wsa883x_runtime_suspend() after the devm-managed regmap is freed, and
dereference NULL, as seen on wsa884x.

Use devm_pm_runtime_enable() so runtime PM is disabled before the regmap
is freed.

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ccd4404c1644..b09ee3db7ed5 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1669,7 +1669,9 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err;
 
 	ret = devm_snd_soc_register_component(dev,
 					      &wsa883x_component_drv,
-- 
2.47.3


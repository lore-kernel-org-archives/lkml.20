Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717816;
	b=OAXgC2quPtOLZ2KF+f6dc063WVXTxweD0G1977GY1GAysKtWpqtEczBq26UvjdgzxkZx
	 6wAUw8hx8+etjObWxFVo/02kYKt//QTFAJOzLxYqD/XTwy7xf1OC+Nlj20v1ntlcsyRyA
	 CqIlG8CSiKnSVJs1RVbSu1AqhMowEwevt5+IkWL1g4cx+ihgSGoSHLfkEwoi6uImMizaX
	 nPULh3zDqJRJrLo8Hhp6BDY9OPHSNTLtZBDDqbMh0wBfAL1migBQc4h3BuJOsJDyzYGB/
	 kMeeHl+7uzAgwbmOH7UxW8v3pb1GvjT+oRiFZF6E7Fu4c2DTjDsD3BY1+ltIWGY5O3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
	b=VG0wAflzA56ld0NtuyerZI1WWH4BauNnb12bWNRy1CeIhdR5ZqcByXQ1NHnlMXasxV2a
	 2KID2q05ohDV3x9YOa9u8AGBehIu2FkFDMXvRag5L+YMEg1yAppl6ywhIfL9RmRunAJ3n
	 9GKkzxVdLOOKtI5Ef5wGMzT2VRxF6hWvOM9DvcgT3QlHFxtVyXpuHPJtveaG6VeD+oDCm
	 nMwXE23TlE13K8mh1RcLOMf6HDvBIFT1tCYNtxSe9Zdf+KsxlOUxHVUlsEifusouKZIS4
	 YB6PrH86hJHHQz0+P2390uVHCMABJ2rLljmUCrIUP2hFZ69oXc2qaqDIMJkqRqBKfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKaPi8Wz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440BA606BA05
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440BA606BA05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cvtsa2e7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKaPi8Wz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA3xJ3657791
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cdBo9mVe0Ue
	Y3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=; b=Cvtsa2e7SLPYu3QBTjbc3HQbPxV
	dYvVAErcU7W2buw05fHOtgtWEecIWH8GwPOQGWzUTNWvvltLrK9QLRtRdyP0G8Ts
	CyZnuFDNFLlc1KbQAx5HPY1QbTolKdRPxFIPwbTgmVK1ImmDKMTqLjhJXQwenpyi
	1RWrsBzQAyAQWWYGFzGTpgSXs2HEG1BoBtNF6ak/Q50lHa64fLmCuWBrZaUo8s2O
	igZeV8DVrR8aeJbVZ5xOMdo5Tm3umrEX3X4tnOZWKQung921HcefeKqyGRJDvq6x
	S++JkPjnNIOTJF+C2QgJRk8dRul9+brpox+9++m2MaHzMF29ufoY3VP1NDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ct965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:56:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso934575585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717814; x=1794322614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=EKaPi8WzLpIlM4OEr/ApLJmw+99MRg9lK/uxlAiuTvrAiC5/PNmsCGjpTvSRvsLKnJ
         NhE0uvTyQTIRZ5v0eCpHLESskhMKQqTJ1WpOE+BoT1mwhabo1DB+hrcYZ/dlrJ0jSC86
         jQfKvRb3Yr59qOrBrChQB8p+N43kdJ6I1MnKBp7Fy4caxirrAwZBWX8Zf9mnVtj7yBJo
         zpNZ/obd7NBQzfLrODHNJnOE7kCIZ0oMi1wXMDdXrVMTH+8Me5m8uB1J4d/B5CtNQQzz
         zIiTXDMnN6P8wtq5MLhelCy6C9MTeEtOlm0dco21+yIRiCC8ic3JPh3vV0U8iee3vOls
         +Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717814; x=1794322614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdBo9mVe0UeY3t/BczjJXPDQTXUl1mfOL/99tQu6pQQ=;
        b=wHfS7dCcMuCMOaIzLwwlb9noqwDO72NsiO6CQrvEcyJJpzdQCVoApmJR/St23fuxtx
         mft+iNdJ+AznnzsRyFQmYlMkqNgT2t7wLUGB9TAM2qjx/Dl+mZJvK8vvwjH7SS0NkoCH
         92Ev0xB3mNERBzP0A++uDwQXLB++bLM5OfZ0PaSRdK41AwyEVFzWXmmaEo/4GCzS0P/s
         uiQPZIXrJUpFbVhRlz0L/3BOcfoMruDcX5ZqB60tvI+YI3w3asQ2yrmCRpEac52v9uCE
         Yn+9Rk4Ee0dbKZao7XwBOZXgBFTqQOyZgN9lL2o0ySdz6+XUI0wAsDabcwjfSd1dNbAX
         SQQw==
X-Forwarded-Encrypted: i=1; AKwUvBwrNGN1KuKE00FXeyW8YXMxVEYfp5XLWVh/sS2NiF+u50a+Xpv9FMy2LTvHupKTGutURIIJ1OMFu52Nyn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kQ0H8YLaACXJU6E9J6wHpNiHLJtcYcFx+/W8c8UPvFI9hR1rj
	QnNEXmOC9UYzV3ceacj32NNmHrwuekHjazZuABXpCaQSk0nKKEzW10tD++CTNkVeEl1Z1xztXzH
	UgUdZ5JFllSZuj1ABolO9NanLTvanPWZ3Q5ksra0CbLyMXTD0nvstWNWpCJEh1XoJPNk=
X-Gm-Gg: AYBFou2jXKhX26XhpUHyFI2in4kM5RQSe9XUvGbkqeLH1EswJkswhBwnGc4KljRaFct
	dLcS4zPMWCPl7DXRKrUa/0WJCdekwZMHn5XXMlyOk41Jewd4YoKFGBh2zM86hGENgwR7AR2b9oJ
	9pIdBYxy9rvjVLLVUxkjGOIuGUxeLvldZDitCaqO4EnX6/2lyLrjKI9/wcHdUccCjSZjw2QCBLq
	pK7lTQiRqUvc5Vw9ZOH9I3ayPiuRDbSHTXr0ipKMMeqx8cIb23tu6q4h1LnUwvPZp+1JzCF8Bo5
	dcOaKDuaw2MjZZM//iQO9kdIBcvleK6eXzp68ih4CCSrgZO1N9tnb+sz0La2V8xCG4jzil2gQJF
	KEjkcU+EjCgs6NGDCbYekCkj9kcSTM6n67Koln/mr0hoAD4TWExpPZIYBwSst0g==
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032088485a.59.1793717814487;
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:93b:d7a2:83cc with SMTP id af79cd13be357-944217b273emr2032085485a.59.1793717813763;
        Tue, 03 Nov 2026 06:56:53 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of GPR port on concurrent RX callback
Date: Tue,  3 Nov 2026 15:56:37 +0100
Message-ID: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yYdJk4Nh9bjDwkQjTd65xJ0ln1AEvLle7aeRhOxiKVw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYk5xDs2v2v0S9Vc3AsS28hCTTJTKLOCbDOv
 UvAu8QeIc2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JAAKCRDBN2bmhouD
 1yLBD/9KqSkTnbvxsy41ZgeFzvUE7qXMix8YA+sVroMx3uU3IxnwPb8FCR09jU5/VpIzpM00Ieb
 R3l5BbF1ZMbypg6Xnbto0676ToHptuwYwsEKO0qgWC5wWWMEt+yCiFqBdqgbyuobMjw8KAGHysl
 WIbi2tggZ5+D2trvF1GvkROhSakpDDFb6vfwdGm3Uwk22ksH1oi8ebcw0rdHSfd26badi5xUl2r
 vSNBCBHQcZOGlTLuh0GIsLkv3RzfSgtJg7XePs3tyyA1uEpOIgjYD99UJIPUHpYDg2qVGec9q9T
 oM8lP/a6wmPYihu0dEMEaek32JEaIySPhKI1l+qoD3xb+vH2/rJIaKPX2jg2w6aj/UoNis7Eq9M
 UeohLPQOEMR21IJsE8AmLwcuMcO4rRbzN711mFLMy5JOeB8QXd8/i8KWsqYZGni14jOL/nNqmZE
 GKRrMnSdf6+9o4Q7s1lcZwq1A0e3QYLQKNLXnvNX0SLUXMWUApZNcTINfRzb4Z092YPwa199jAk
 tpUQCZBVv93Bqtjs+kO5nFkljDHkgGKzFI5uKaUN7IgcEFu9BD1Am+Jh8Coxz2vo0a1Myg0K9aT
 hQf3eh+AK2/IuYkbPli1ErCeoqtjcrTiLZph1grcVNOYEwQ3gbZDEu9fKnoJNKjzNaNE09m/O/A 1ZY4o1IfB02zcCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9f637 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bqjVDHCIK6rrShMHOGoA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: rEXRkrfuXwWh6-HliM6n4t00VntLRIvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXyGFRbOYSTmEJ
 NVnG4ToO3wb1jOjcUeKvwSHXRHLEKH1udCLM2bjzpzxega0WaRb6NjQNTgj671eiQg2ayRwsreZ
 y+as4LB5TxX2En8d7zQA4BpYszdQJgMsv9PC+lqCMnZSrUORE3K3xAJfKw7dCy7PvRGPtnNju5Q
 kYvJAIWAX32FZxXk1HpI7x5txSyll8Gm89KHBtK8ommbywUdclGT73dTfqPqbb44d8zh3ZYRwUI
 q/Qoymzb4x8A9cno35LIWSWWgKbP3feHsQDAQIDj+29l8TwlGmXkUhLR+qv4ieBRUKf4+8zfXdN
 bPFMjsSNp0ePZoGBIU52ght87BWeBGR/Uwu0lIzGimNEUcA48372i3l5TNpyJYoXeuHArheDHPB
 KkwZYJPxaWANk+OiROCZuuZ8laBWte+IzhEIUNAtDvtzA+3Ll7LK2AXp3FYG2e5w1/3SN4SqW52
 e8xnNbIG4gqCqELEMAw==
X-Proofpoint-GUID: rEXRkrfuXwWh6-HliM6n4t00VntLRIvX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXzfU/f38T0jR9
 3PTCVOgcgpH6U/fHxlmk2MPFfuPgAnC4HVmxkbqIjAeEjqNhb8uBtVW4HvGhJHBrqHIARtVI6yl
 HSgBUqrgcQPEdK8gYDqYXGveCQwioxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030059

gpr_do_rx_callback(), executed from the RX workqueue, looks up the
destination port in the IDR under svcs_lock, but then drops the lock to
call port's callback.

Concurrently closing a graph calls gpr_free_port(), which frees the port
after removing it from IDR, thus a theoretical scenario (not reproduced)
is possible:

  CPU0 (RX worker)                  CPU1 (teardown)
  ----------------                  ---------------
  gpr_do_rx_callback()
    lock(svcs_lock)
    svc = idr_find()
    unlock(svcs_lock)
                                    q6apm_graph_close()
                                      gpr_free_port()
                                        idr_remove()
                                        kfree(port)
                                      kfree(graph)
    svc->callback(..., svc->priv)   <- use-after-free

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index e303562526d4..80056bd0686b 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -83,6 +83,13 @@ void gpr_free_port(gpr_port_t *port)
 	idr_remove(&gpr->svcs_idr, port->id);
 	spin_unlock_irqrestore(&gpr->svcs_lock, flags);
 
+	/*
+	 * The port is no longer discoverable, but RX worker might have already
+	 * looked it up and be calling its callback, so wait for
+	 * gpr_do_rx_callback() to finish.
+	 */
+	flush_workqueue(gpr->rxwq);
+
 	kfree(port);
 }
 EXPORT_SYMBOL_GPL(gpr_free_port);
-- 
2.53.0


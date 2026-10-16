Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00437FF43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162182; cv=none; b=hkSx/noJIwY77xolBp4XMb+a2PIz+uGjsePV/IXjGIGkEBTNCCX6gqiP6HMcvbaDQNijGhSU3RdAotLKrfqXVnOfMdUq5YqKXJniwfrLUKWQ51sfb/qWoBOJrWTgtM67Wo9PYyu3b+qguxD3SjiIf0j1OXKu82oAS3cUdnvV440=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162182; c=relaxed/simple;
	bh=/6F/aLJSv5Q7HhM5eYJG9nxGTi2Lx3k7CUsBksszwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwzR3UqsOKd77deOcbosaqsG4Xu3ZfAwDQ5ZDnqUGQ3xQwddPWGru78lKCY/ByJCXklFwk153xWn4oLEOwuyWr9jl0LSEoOU692h09PoINJ3uSKpu5fE2jbbZcnHxU7XcLCgKZQgV7YJ3DHwTUBgYcWhvhFSC6t9RStdsr6cfLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4lI+KUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbjYr/yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4lI+KUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbjYr/yY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5ieY1910949
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEJSdsCp3bn
	OA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=; b=M4lI+KUwpgQfLo/H+78fdSrgUOu
	7T6xsJKkZ9ZRb91LQ0U+IyeVGDRK4y/YmkqYH3bJaGsYlX34qY+tET7fG9iDpY8z
	Yh4pb6qoqgUDxxQYckg9QLWFNzyCIzhYbuPWQqewSzkHppXujEq+q39vPmfY/Goa
	T3jaSGsidZYVNKNUxHASkK4J9LpZNhOXyoEB/sBYdPXK5eQddlzMHl2zJSVsGg5q
	KK3OYeQYL1niJx6Nd4AelX+7ZleA6Ki2OkX3+hKG20TwtKM9VVTVZkGVLryr9Bn/
	Hn+IfoDr8B74C5jecByxHzZCZJp3rLBEXoJEMLPinv8cZWVxKc9sc5WvZCw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8u5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143826c4a13so4023850c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162179; x=1792766979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=YbjYr/yYZ1ZQnLU395QLT8LWLo9U/Q9QIl8KQIQou+QKn7mrnzHG0WhstnPO3neDKO
         WtN2uBhRSjF6X3yvS/dp04xcqQkq9lPKir8QM2Qxbpc93BgxFvlawBYYviD64gk2mxSa
         Wa74aLNTBcb9AZbq2PCalxvdaop0wldhCUZwAqrpCpYWUezVIog9O3dpDjak+A9CSfJk
         AC/c+5aCnFH9FJe1Y422Z8kpEpFdkb2uUvIuNStGpAQ0OkIHWbAiHgiLRFi4tSxaaUhr
         YBUZ/4TAN5jiZphqrETBLY4eJ8vto2TwXU7sARjf+vZX0R7dnZ+e3DN1UiICIokqhNUZ
         S06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162179; x=1792766979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEJSdsCp3bnOA3Rmz28fYbHxbHs4bqwNwIhoTb11yWk=;
        b=yCaiOr6Y0PQmA+fZGx40pyTCV/XRMeH8jbDiRsaKQEKANGcTi4mYTEtHdgL01LtWFM
         XbTCqxWVZ0wHy8lMrXtSRkiJArUqUxEijjETwBAL3EeA69i5VxrYRcRYX+bozZnrjXsP
         hYwzOsHAv5mtmZGsrRDJM5TB8HsaXY1NM6efAJmSURJtAi/TZNMM3/aLYaKW/57tPxl/
         vkzKpykwdxu1LEODuPALPY9GftoQgeV8Iuj2NEuF0ZjQqebBD4HfPMGZ42HQGMIb2p2z
         GJ2foOv1gUedKpPKg/zFFgTq1zGI902oJVmQFjSEW7OdGkkA5fHUVOqfgdNhdwmf9f++
         0X5A==
X-Forwarded-Encrypted: i=1; AKwUvBxkml5jpXcMozIUUHbZYxlkzFelo4EreyVw7S80z0PPGMh6ZyABWFNxPOXfIYNsQTX2o5Du/3LgkRiFGlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMTaI148I+H/SWvaex9UGIGPeA69kgeHclRtJWxRlZWhtUVC2o
	fwzMFzocF+jyFLVMiMlmTvR1W2jgpKWEpni5C+2BjKA4cCtGam+yBOyiVXnlNOvfQkRLoTa6BsI
	Mp6G47/NuHikKi4/zTWtN9Tf6PtVBRi2WtvOH9pnqRgpLVWccx8Qd6Xg77Wge9L8zbuE=
X-Gm-Gg: AYBFou0WUfqzE5CsdUa95YeD9f8A99JPm7zsrLDfDG3Tgegf2WBUzf7c/yOfCevwvp2
	I7Ej2ZxodPFsP4G29LB9Q/zPeqKeGlD7ITuoQJjyGHwzkCGEKsk3tJxH/SGXOBBNo2GC0JE4icQ
	ODvLcdGuFg8Z1TYIkxj20ogwQb68f0iTUWPoSYAOtSGn2WUrqeyuGtnJovneP5LTfQFI4d8psPp
	4OtTrBs+9aos5NUy+le8w5im6lpy4y4WfWxVUWfk8F6/1l9BpSAyLTgiv3pvQy4GfQ+bADBYHHo
	JOxKJFUkHB2D+y5IVfram08QCvacAXZFnwdho9JWHWnX3ic526D4C8ESyb86vlxB+CgqoMe5VAm
	MbkMZAUWRH5UOWcHA/hKXDDrN/JR0CT9y2n+DtgOgD14NRgazyCnGZ/u1O78=
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147567c88.21.1792162179353;
        Fri, 16 Oct 2026 07:49:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2304:b0:182:9553:287d with SMTP id a92af1059eb24-1851238aecbmr147526c88.21.1792162178573;
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm7765337c88.0.2026.10.16.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] gpio: shared-proxy: Drop the vote of a released proxy on write failure
Date: Fri, 16 Oct 2026 22:49:19 +0800
Message-ID: <20261016144919.1362846-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PbQxmhRmgMXQZvDpZI67B3YsWSct4UjH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX6JcfJswwpzP4
 qSomLRmLQT+6rAhwUIa+683ZpvzXSvafqFPPFA9QgwxrUQmgM37dxBh3wqkUQREy2oZNaV7V8cn
 Ey8RVUV28IhGsYbd3TSUxBkbcdDfYE0=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad23984 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Vq87VKjZgZ7Zzh4gvRcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: PbQxmhRmgMXQZvDpZI67B3YsWSct4UjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX7lcfdvpJBiEJ
 s8POGFc/ADzDsnQ72DDLkNUlemQufLIdOTlyQy/JPADBlU/eWrqyaxcF/nIsUulcJnKaWqcmTyH
 X+ft6yJrpQNfNJt5aozKOrdlFSw+uFQiFqyE7XgnvB3ds2/erglZ/pZubxKzvPP5mrAaZb31gRq
 xCKCEG6P3wc8lcvB+KHFkE00ll9/i/jCiuWa2a26w80/DxCuKVIkTxB0I4WyZu6bxLE5Sathdup
 II8tUUFB3OhWS/Edj1JX4UoZ8GV25FQUxIwVcfMYejrVO4DeN1tDYliOSZiyh+CQt6lpO/ATzBI
 /kksRDCKJ+1YK2dJMrN/QRhk4afYw98kBEnwzqyxKcpwJteMcc2POUaXNeo2hCv0XrsCNPxQnn7
 gEwz0dzx8Ath/Kx7yMhUzTaU68lO8dXmA/u4NoP0JdJhmg0AhwAfcDYih8WFtj/cVY6snwpAhFd
 D5yyTZtXaTJkI4yJF2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

When a proxy that voted for a value change frees the line, it calls
gpio_shared_proxy_set_unlocked() to withdraw its vote. If it is the
last voter and restoring the default value fails, that function
returns early, leaving votecnt incremented and voted_change set.

The consumer is gone, but its vote is not. The line is held at the
non-default value for all remaining users, since votecnt can never
drop to zero again. And the proxy data outlives the request, so
voted_change is still set when the line is requested again. If
another user has reinitialized the line in between, resetting
votecnt to 0, the stale proxy's next vote for the default value
decrements votecnt from 0 and underflows it.

Drop the vote unconditionally on release, after reporting the
failure, since the consumer is going away regardless.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 0d1d724a6a37..24241c981df1 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -134,9 +134,13 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	if (proxy->voted_change) {
 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
-		if (ret)
+		if (ret) {
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
+			/* The consumer is going away regardless, drop its vote */
+			shared_desc->votecnt--;
+			proxy->voted_change = false;
+		}
 	}
 
 	proxy->shared_desc->usecnt--;
-- 
2.43.0


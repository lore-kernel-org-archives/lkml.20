Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990625;
	b=i5Wmi7DYqDatms/UlpXiQ4k263eIBvMMA1Ef0ED5hgESZEZ+Q5G6e73v5+TeXBPkdfqD
	 KFhKp8uUy5+CuBF/FCU1OMlqF3PEHqJdpBf8P7vIA/u8e5YDNLyo0Br2kNuIrm3Rnryma
	 pPUv6n85q3w2Zh/m7Saj04UoQ3D0ObhrcxiVgH2gXKBH8vOf2K+2AERd8JnMpCmwWrOvN
	 CwKK5JSltG36/RrkLOHnfgyvvQZnOPS4uW77GMizw6HlYrf/hLsd0s7E0lsoSjQotyFfN
	 YY+G8Vhs6mbctYj3g0+uxSfKgS9jRLjirG2BXvaWoEvbBzY6mSrAijhSY8Myxrnk54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
	b=WVwC2cmXxTck0+jaKeKUuyI84FZJAMz+mkkGdqA0I0hl3HIt0p732CBpVQqC9ugF6K9B
	 de8RmumdkKS5umQ4Y0m6FVyAK2JlyFazi7aNtNqAjYcfKkExepTziAp1MpCM0Cgfi+o0b
	 0C3yv4UZliXZsw8qrXZ6Dy4CAJZorC0AgM7AjkuRlMJ51ld2ECyhWnwz9ab1ijKlnjms9
	 tJkfH8a5BJ6zf5tPYIQ3aySxiD/k5+uB6q5rze7hcZ2dHAiYgJWEshKvOnLDkKxry2VXU
	 OQgkqxDhQj8OcrdZdK5DBE1/piQgGOXErGYKQg+4vgZwx9Am79euEJiHSkq0Af7QNKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325D606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7325D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nHkTQfou
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1225300eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990624; x=1794595424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=nHkTQfouN0pMR0HzTsq3ECgLIEOgW4xZdy0/pm3K1NbeenoJMembQbTxOIUb9TBjR7
         qip0r3zi2Mwgx9CXiVYKhRPt1lmAroA5RQIx5tN3sXr3uWtH00n51KLxJPKLX/AFJ9nZ
         e8AGnWxWrmFijQf7Ttt+CRvJBUpKb6Q8PSS7G6OHAQrJ1j+5XlPBS43DvBkGpRK5obh+
         RcckWG+JFdcUlQUgVtN0GtLBrhcaJ7XG/7XGKiDCEKBu0xb9VQ3kQzlQ9bK9RyoLCRE5
         NX0//eXIAGMr87MTEz8NgrcCltGZvDOvscKiZdHITOaRBRz7HW+BdFMzBoeO8ZIPaPH2
         mCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990624; x=1794595424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbbVNlV0Ddm0y0fksEH13++wT1yMdo/rDKxFHAfvtG4=;
        b=Q9ueBMdmx4HCvbKYz98YcrrII82s6wPMDya6Mvj7G50+lcZ9rMMw9zd+FE2RqI+cSg
         kYdL7AXis0gP/C+M1ZDkBtADeWV49pVBSDFBWYRqQiLSsE1s2laZvC3ky/D4M+Al05ot
         Nl2i9T2VpokbDMXP2JGxDcyI688NAKj7DmjkodPwudiYas1Q4OjAWEodrLtNF6t6IHJ1
         UQQXIktBUFmm3t3N7nJm2IGrSrE8E7NAIOSlyoB4cOVgquMkPCTZ5YWPjfRrxUgZFdKj
         wNxTJYQ+kQIbZZJ32cWEYfWJB4Jt82vphJHA17vUDHHh0WaA9NG6jBgA1DLEBjmQGJ4O
         K4rg==
X-Forwarded-Encrypted: i=1; AL+hErG3WALAuoSRv/8KdzGDl+PkNbHI/AZ2999sv3o6PL69ycQwY0nWT0la3Y/VmElD/9kfYZ3BM+PuXOTozjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99jszXSw+t0X2mkSXmxqe/KuGG8HPz5QLccBRoi0I84LuCAy6m
	iRr0Dqrln0754zgNFmAi4kMNc2GAxprkBVGg01uGDynzPaJRNaUt22HP
X-Gm-Gg: AYBFou0mRLyJEgPKtO68LXaqP6aGoOX1RVoYhDg8WKlfn9j+rrbpW4DuC9WZNCcIPxS
	cv2Wxbv6jjPAmraq/XdpZBYXobRvbDsW0xnJKsySF1StworzsDlMraC8YFqpiw2zLqB7x042EDp
	aY0LUvrhM+DxBM3l6OspGzgMMQarc21OqKzPBl1A2X404XhLbCCCLuLhRCPLfFN2dcUanaWHMir
	K9KGHK5EDYbyMzt0Y01sP6N9wERBTouolPFbV/wVy50PemjSpXCM1dsJIJVMReQo0/RfI7qlXQP
	V03M1wDEINlNbZszeQ38N3+6WI30U2nZ2nEBCSD9sPs7QiOpJfVipQNWJbtVkDHCSzBIx9rMhQO
	6SXPYP8L7nF+B3eTlNZenFCzw/tjweI7GB+iM4PtfnnwtrEKY+BxtLMK2Llx4vmdGKMYhtYaYMz
	w/QoEKO+o4HKGllvoQ/vJFpnB9QPEfSUaqKxF9IXQbwFeyfFYb40GooeT+3OBBqkLBJysyzuvcK
	hVEI18qXjbLOLG+C+6Qd8sOd7n5D/rNN9ihtNK32VH2fe3sqMPyQIhicCY702+41nCheLOxXqg2
	JUMHTofK+3sVASd8+nOQpuA7ebLWYA==
X-Received: by 2002:a05:7301:921:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36f72cc1d9fmr4534575eec.3.1793990624382;
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:44 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] remoteproc: qcom: Fix bounds check in q6v5_wcss_da_to_va()
Date: Sat,  7 Nov 2026 00:13:10 +0530
Message-ID: <20261106184312.100-4-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - wcss->mem_reloc and stored in a
32 bit signed int, while da and wcss->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
wcss->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < wcss->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > wcss->mem_size - offset) so no
intermediate sum can wrap.

Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b391724cfd08..e67dc3ff8a07 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -740,10 +740,12 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < wcss->mem_reloc)
+		return NULL;
 	offset = da - wcss->mem_reloc;
-	if (offset < 0 || offset + len > wcss->mem_size)
+	if (offset > wcss->mem_size || len > wcss->mem_size - offset)
 		return NULL;
 
 	return wcss->mem_region + offset;
-- 
2.43.0


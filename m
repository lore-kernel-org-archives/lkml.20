Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990619;
	b=e+jtd2rOut68d+Y109cNNf3lp3dW7TVJY3NdBx2DmnSK0N/7pUo88k8glQqEV9XqHlkZ
	 a9R8Bhw2FPDVQRu6qRl25fJDl3TvKGaYRkG4RcM7KmGGcPeHaxUQNgg4bjPGQzYWc98CD
	 gyqmXKVmoBOMBItDpXpyaXr8+PQsKKKe1y1h+RCpG8+N3prmX5RktHQ1h8l5wN4PoI1Ev
	 hSkdlqOJ4js1408gBhZVb7On8pufjtw1YpWvhDIwNwip/bk7iP8f5VwSwXoOxFUfHF4UZ
	 aUbCuCfFGANQVnML6HBqmLNK7BULkWkC2XvZHYz5qyMP5vFaYeKkdky4/YxTwGow+nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
	b=nrVdxST7rZ3ugipwSZzPHXB9bxi6VlbsqjNZm+IaHF5Xmfp2UewnnBSEtfW3zh4cQ9G6
	 dsgyOUU1psr0S6j9aOrbjhzFZWOQ5OpIvDIRZj9uArtZORvXImt3tBHIhbV88GkBU2EyH
	 jpysRpFT0RGagGa1KJ5rWdoaCXpzmIYg0b36+J2hZUCRPrdTPjmi7wPzrxzliO8XoQlBa
	 vlA0rJssHINofHgMJIBXtXb9FIiLKWYz88c7gdB3iX6fuMyaD5a44HZXCVkR9f/1om/aM
	 aYsNcq8txkP1VxdhbNdfed1yNrMyCEEfoN1cAELpbUgZjgNm2cCESerHigM2tYxfDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ie83F/uF";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC9E606D809
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC9E606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie83F/uF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so1981177eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990618; x=1794595418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
        b=Ie83F/uFyrVvA0/rLV0W04tYhHf6e6Cpe7Y6MzfUmnHvUN6DPHPiDadmgPBq7S1vw9
         Ti/H6+8h1/yQczrluJ9FOmwKR1ZBvkWm+5kfCom6MegrpnwGxpgq/qvkkZ5Y9Hmra3z9
         mdnMi3gWUsLNOvEIK5EgSgWOmF7029ojTahMe3ehiyokJ+zXDGPVefiDLNVfk+bqesOD
         SXKwO8WgR78UJaDk5lPBD8xr25XyztL/eiuNh5V9nxbsPr2KssLVh+B8ZBC6PosPkkSQ
         3fWOPFm96SjEfX5z84DDedWKEy9vab53DsAFfn6roHaJMPhGT0hyOuM5GPj6kn7jX4Om
         +adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990618; x=1794595418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
        b=X/2eHkvfx6gy/oZQXWm3djz69+XZ+VeaQQfBLxzh6pp4Gkewo96Y1n1EpSA37at3gK
         uBQDYf5vCm5GriS/LmMtNxhK9cggzmIwbRYPaqCkJ25k4oChpXKps+FU3UMG4e5gLzaR
         ldEOSJFLUJxnLAcVaOkNeSWX43gmdFuiX2zHyrLy5ys2uWzuun0cjrGNfY0N6FaNNU9F
         XJM3ePHNnZAYNpBTWNIhOxLh2JXL8XmgZb9/e9mv3xzGZ/VGHQ6ACPxENKd6VgMKoYCz
         yczPxrXEGj/lZwM4QjtSKua9tve8w9UG1+nglsMjCK5LdkW3uGln1G5jF5MLxgmnX0yd
         5+6g==
X-Forwarded-Encrypted: i=1; AL+hErFXHVMTBfS7UcXKYcTHoG5pyRdPmvPLsRrzUHH9gcSPY8e/jAMLKaiec2pPgGsB/tsnJh+0YNLboDZOeDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f+ZZdoij37KRL94NzdSRWx0yLiwFYOAkZPs/DiPDO07Z3KIJO
	UBOb808ewWHbbtwqnMtiTAK2PDG+cnqth3jDPHaJXRS7s9KZmyAdfWjO
X-Gm-Gg: AYBFou3Qdufo1HHnum3T7RNe5AnbTSWOuYlJOgOBYHQJa8YgvdmEv2f0z0yE0VrY6ms
	9Ctl8G/Wkv6pz8JCc6BCl2OU2L2vaTz6A8jFQOeEMwHmIzeEDWcZ90kR1i2iNpmwXTfU7k9hlGm
	N2oAGhTpzpa54IZxoaT2OyNkttkq0nciT9IXVuxxhufJ178wEs3FCgHQvViMhODhHpsAzTShooK
	W3nzA1i9q2s/pJG8YeAWPBcesgNowaVTbVQfoukC137qzn1cY12PIuR2S5LhAMhx1qyxk7USgJ5
	OslPGNjzkQDHXt83XrU9i8pRjwgOXkycGV/CnASwp1Td+Nyw+wvDk4aAa+tI5b48cdllGhiP6Bm
	p/p+FK5K2Upn5Jaj+xsxX/w/7DAqdlP5IzJYxXKMYJR5aakEGMy6lG2LU03Q5z/esL/TazepbKs
	FrFnGxAd/yZolCU4FaknL1XnMHEEfAuhgnbzRsA0o+wmQ247mPlooaqQJL3bwMKtvbXXHA/mWuX
	Dk8vVO7zJI4NSn2qTOz1dnyVsBjaqYUREI19+H4nT2NL456g5hJlYC3CG7eno8lfphet8bdEC7Q
	n1IV67pwFPE4FbE5IrBoDNjGzDRM
X-Received: by 2002:a05:7300:b196:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-36f7611ec7bmr4202731eec.24.1793990617663;
        Fri, 06 Nov 2026 10:43:37 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:37 -0800 (PST)
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
Subject: [PATCH 2/4] remoteproc: qcom: Fix bounds check in qcom_pas_da_to_va()
Date: Sat,  7 Nov 2026 00:13:09 +0530
Message-ID: <20261106184312.100-3-atul.akella@gmail.com>
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

offset is calculated as da - pas->mem_reloc and stored in a
32 bit signed int, while da and pas->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
pas->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < pas->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > pas->mem_size - offset) so no
intermediate sum can wrap.

Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f37b77ae187e..8cade27a6495 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -473,10 +473,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < pas->mem_reloc)
+		return NULL;
 	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (offset > pas->mem_size || len > pas->mem_size - offset)
 		return NULL;
 
 	if (is_iomem)
-- 
2.43.0


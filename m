Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990613;
	b=o2RtRvLrJsMAVfZeLbUPc34mLGad5+otcdqyZDxMmlqJwZLaBXdixvjtqzkAhWuxqquQ
	 bX4lLihZMM+Ugdt+p6AKHC3CavkukcsgcgMWSNQ49oL3sqKdeZXtQRZZJt9kb62yFXlqd
	 lp1sBl4h9E/Kf1pBnJDptC0x86yl58224s+VWJDytPnBqemNyHgogesAHz0rxLhil9Jac
	 lZGB8Lz624H4J1TtOYs0c8U0DN9UWJkTDp1bBkDghjF2uGxFNZ/GYxecZRzNQllBGUvJp
	 LyGYEHXlFfh3IMhb0gc27l7vG91jcBhsRODM9rryMeFq7FMMXmId1SNq4rt+aODw8gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
	b=wq0v3kykBnFu/7daxumSNiYKi+XjvN9cdwByRRU95RfuXB9dKVlIBEdQOLkvTZ1SJCWQ
	 UNUUERypAt5VzTB5wD7m2/SSBKFZDF0rL2Z/W5yLI6XdrBBBkbNOsZ8/IqNNXhxgudeK0
	 Fh45RARIUmZWxuE0watZAJhsiZeOSH0uiyD/7Ic/jdGyUVVyvP+CIpYcMxvUhitZe+SIU
	 7kTK9dRoV6jbdOfuk0exhzmf7k2F5fXJg3qfCK9WVOy6cdrTJf3t0OqHmnDhs7I3wEApu
	 OYIO44Pb0Ukl511IFgOaBBotR0UhqmY0tmzJM3bFEUlEHnfVEOsc8X7HAlQ+oVXwBdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5360606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5360606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BMWL8YiI
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37000e7234bso548072eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990612; x=1794595412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=BMWL8YiI++mvB2+iBIl7SxpDY70MvHgOpCS3VUgI8aa3d4A19vIjQ9kG4X36UKlpIL
         PvPbBpBn6lQN+f1BWsYsMt26DLPA6BydGxvfCR4ilo5BkyPF9Z0iDXCuq+dteIBtWI+k
         O79B8sl/Cr8D/C+BxicSkv4d7j/j1yn4H/HeBW9xXu5XihcfbQISkMEEwUe3P3nZg4sm
         bA/qlesPeqFwbhnunxXRb4ozrQSqAA/oJ2MDMu8c4ydu7BhNutywIXGQdmRk0ON21+U2
         e+q18qTOVblBKlyKvbDof31/hQykNmbNB4sOgA1fgTBx1a1wZDlg2pM+JemOJsruILh1
         SPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990612; x=1794595412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsmSmsWKQODtDVmAU1jLzUrhG4gQLD90xJrz79Q20oc=;
        b=08JKICyH3K4wtihsjG0DFJBDfMW1k7PTORFoQj/oxoeldS/9k2Ow8jY8/LLk+tMo72
         voOKlq/aYeW45j6RHEhZidM4GELEhtKnAJXICrGelP5xK5Ai+u1UXke+jcAO2DUFdizS
         IRertJ6L3FUppmFZoUCP2uxDVkZoviVh7HxlvW5kSFEhPliBEGRTm3/0MiUOVIpTOZC5
         vRAJ8Y7fjN4zOv6xCjgczLE2bt//TnWiEM+RZT7jhUEIcvSn553HiylybVjD37fLoeRb
         rTC8Dxq5LXJxXMgsGyP4DIyhtOcyKxakbOoKrGlmIDozjxTuiZg+JU958J1mzWWJ8S9q
         XKBg==
X-Forwarded-Encrypted: i=1; AL+hErHAsu9FLUwDXroSDUfDlw9czrMbpfDOEewkdde40jiw4DTXyAPgilyHnbmxstEO8FCe5J5NyQzEyUwxobs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IAzy7PrscFuxtqtfnNDT+q9torORNT2rDL2DOcIHEp89aqjlE
	xc59m7jMGJQutMOAdN2pDws4+S8ciwOVburvJ/3/sXZ8feuXNg6sgABe
X-Gm-Gg: AYBFou3Cg2Xwx+YkXyb64rWrT6IttMpEU+mjWezZl3LDZ6AvAePx2HN3FahGHK21qEK
	Sx5YI+ZMVBw0AEp9e0yWWr6HRj11quiweqP92yeujrXSQ7ZKH3O3tww+KU5ymZoe4trXXrKRI3X
	NKMQmvg2PdN5x1HqWzVj0RvoqBOGJIQ+4L3vMDjDFSWVp9PfidYNHadSCJW/zZI/DS2Zj9b0T4K
	GNtoWz+Dpxp+Brgil0KRqq4eGmqGlljhM29Xx8tZnGY5PXnhlXuIMf7v3opFBxKgFlvQFaAD4GB
	k+/OrQVvNJTHPu2QvmpFMKWh28i/BNDZH7zGMt95oH1gmTEJImhW14F0DzMLlRDAKSRcKf93QHv
	pN/ZH0YCC5C6X+tjRW9sCHyZ3Ei5bCHy4k5loZ8N5Hsd6A/nRVLwAiiTF7p0NTsBetOexRmgzkd
	PLVLgzH5SCwVafKgXrl80mwq62mNSoRBGpzBW5CF1W6i32FDXeUY1cHWwAdyZilbwr26dYzUJgG
	L7m/5y6F+FxMC3ekDZA0mmdnRPUY3vqL2Boo+dGp9723yc2VnJ5NtUf8MRlPt+S1gR/3Kds0pZr
	UQ1Hczjxaswe82Yvv9Xlav+nfF84
X-Received: by 2002:a05:693c:2808:b0:36a:13df:749d with SMTP id 5a478bee46e88-36f76a1cc4bmr3692769eec.24.1793990611603;
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:31 -0800 (PST)
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
Subject: [PATCH 1/4] remoteproc: qcom: Fix bounds check in adsp_da_to_va()
Date: Sat,  7 Nov 2026 00:13:08 +0530
Message-ID: <20261106184312.100-2-atul.akella@gmail.com>
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

offset is calculated as da - adsp->mem_reloc and stored in a
32 bit signed int, while da and adsp->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
adsp->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < adsp->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > adsp->mem_size - offset) so no
intermediate sum can wrap.

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..1bf87cd0e9dd 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,12 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < adsp->mem_reloc)
+		return NULL;
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;
-- 
2.43.0


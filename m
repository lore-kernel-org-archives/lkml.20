Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576173;
	b=G7OrmFZ22sb8jy03GN9o8zFbur3L8qgFmyoLJiYM0KP9trqT1wml9eYGTiDVVKQF6L5s
	 i6grs70EvgO74GCHJjYXxwHypedKWiWnMgpbLPA+ZfUQfv05cr8uHVXe6Wn0uZyoqc4ow
	 CN5TUCyZ1zoqD+7rFxGu4srHxd+ocugA0GxHggahVZ0Fd0AK2n8BSx2S3xMl7BSifzq6g
	 NyMCAHou7BFFkbOQXUn8zTDndvx4uLwAHisQVwBi1KS8jILX6fE3WUMivKdDChTEaDcya
	 vIaUCrkllEqtVQRX/TtTAliKyRxzBr2OZKomaonYH1E/OXvK4lC+me/4Y42QayMieTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQ8+sqq1Xi1ve9mdblMlJkMRVEsyvQ5nDwDvZeW41Gs=;
	b=Ol/3Ma94XEdQ7nciaS4TLKAfKTAZbJamHIao4aBZnBNFI00OhIDzTUR8MD7jdgKkcgaA
	 naLtf1lPfu+HSRCXFs3vTcD6S/bVNzGKTOjCRw5ij0yepwx9W+anjXlyewdKMa5K/qkQz
	 CFztGssEM692iIuMF3XS5w2b0XmGw6dG4RmuvPap47Vtj9wkUrPvySS1Ey6vpmHV80k8d
	 hpyxEXAJ4CGdEZwfGpbvtlu5Pu6q5SxD/f7od4XeyuEj+6487hDRbK5EWmoaPoT7s884k
	 RoU2KvACEWHtqZdMZRo99Cp1brF4tYJ0u+c4r4SBztE8n0V7+5ewY5FdMTsg4OOeYhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMTuOfDt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3snR9op;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5B606B57F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C5B606B57F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMTuOfDt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3snR9op
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJccG058873
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JQ8+sqq1Xi1ve9mdblMlJk
	MRVEsyvQ5nDwDvZeW41Gs=; b=oMTuOfDtLwIhCAMMQrqJDvu1g8VvXfY/A7INZm
	jEnf5qOM3O1fguSHZZ/V0zfCkxa3IW4+wRD8vaY+ORKs8g7mdHkdsbSF7t5pOoMb
	Yn5JEz6i0RNgSQh1Ge+rp8qy8V+QYE/wXeJlhMLcDhNLIX6dZ4rCCYqFbkGfHWY0
	UKcS2Hnau0QLyyG7tDgAIVC7tiwk7pLBH2As8bPzuB/jlqoWPIymFaFYWzfNwAmJ
	e2E5Y5AnWnoz9cskvXKZr7KgM/AEH3CDzPAOI1mxaUVvZ0Q1sbl+ktkoH05eKJx3
	m6+K5bl+WjT4rSHo0gxiiIY+1LN3BHnw80aSP/InAkpFFSNw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwb5rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:22:52 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b37869f851so15140757b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576172; x=1795180972; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JQ8+sqq1Xi1ve9mdblMlJkMRVEsyvQ5nDwDvZeW41Gs=;
        b=X3snR9op4L+6iI2QKl++zvHE0u5M7Tv3MAeaKCIB/z3YXxQXuSryDPXI1bexqSpJ/t
         dl6qNVdHAp1tjLjEpZsd6IhK1I8kAiQTKD8aykF7NlQRF5L3mElr87tJJfUMMuDS5IUn
         Lq7iM+xJCLpSST7Ao/XiAoetnQfxsv7cFOwMSFumXrg64EaA4uXQcLJ51W7Kr1YZmt4k
         j1JLb/qdB9SngEax8X52LQv/nK7ScPm7ghaiEqUHC1zOG2n5mpnicd9ivajTIlyiSnBS
         q6YLyIwrjrNwgKafLSc08efAs/R8tMPINjO+YbOc3FYB7U66/EIrhHgKE+YmRLTpjOSq
         DkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576172; x=1795180972;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JQ8+sqq1Xi1ve9mdblMlJkMRVEsyvQ5nDwDvZeW41Gs=;
        b=RO8X4gYRMtdTtLH7Ob3upVpoOsVC5vynC1Y1hYxFALFt984M6ZUJEW5W97WoC3itmR
         kTTOSPzIvF0/03JqPPDtX1kKvA2gRBNAMMSMFAOR0EXkED+P0BQ2ARlUIMPec0U5GKA0
         yczAnEcro/mXlHyXkLEbdkMh88ACSlPq4fEbXuLxDCR0tA5KYoBXwWSnt2tp9qiJxdnR
         bk1LaJmv0FAWmhUdctKodUUmgXWp5edmgOpFoCMHl2GB8cB7bGk/NRFlZxnk5p02PyHn
         vYdlinVxyUtULMEQbx3RYeFL4KwnJlNav03LDwpsv00iwKwKmcRLQyGEN2JThlkw7KBL
         2ujA==
X-Forwarded-Encrypted: i=1; AL+hErFOuJAvfLgGYOMGoGmW8VdZjGjyZ2vGwvncSLQb7J5Q9U09MhwKPlug//IzXPn9snyks2ZWEFntfgalA9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wvw/dIFzGT5VOjRPYCRtJQuYjHnqZFDYyqC0zXcY1lbKlhirJ
	pwVj7Wag3MeY9wM5smOyotDqDIHMghNhpaApPcd5QWNFNyJsq3/K8w/w3JZm1xV9Fc1O45LsjTt
	Xki3Apg60aR5uEHgui2GN182CMIKfNUjDJfx3CFuukrBl8LgCdqyNZg1D2Nnf1wPZylg=
X-Gm-Gg: AYBFou0CBBKelNBrGi3Zui3IrCM2V66AReRWML6oXxiXFtdOWidgRVhBama7mXZJP//
	UwqKK+IgoRqKGDRDoprE1xRGUQioRYdE+AMNN5QpUVsYaSlVjSLo8zM25edJkjvdSJwyIKI7Jg5
	1i1ToG/vToTBm4kyx4P5hNlq9ab/TBcWlpoc0NRWy8VoeejCTZgGlhdkJNwGAtARrUn6/pW/rw9
	5M5WPApYM7cbeCva1DmdFTxc6v8cZ/RCV50mLbBZRAwXyMoYTBPLNAhitPjWUs6Wtedv67bhhPg
	VrXY2e4MWj5tIzrf5CeLldUZoYYmdO2OOEllp8BJl8maY7QxuMxEqn96PAleE5bvP6vKZEU6Z9H
	CB9oAjlUyNS3Y/wLb3hJ7hDcaK2+g2HJD+3UeMCnMhwIpVxCQuOU=
X-Received: by 2002:a05:690c:6983:b0:8b0:8ec8:d4df with SMTP id 00721157ae682-8b4aa2e6c2fmr14709017b3.53.1794576171503;
        Fri, 13 Nov 2026 05:22:51 -0800 (PST)
X-Received: by 2002:a05:690c:6983:b0:8b0:8ec8:d4df with SMTP id 00721157ae682-8b4aa2e6c2fmr14708887b3.53.1794576170997;
        Fri, 13 Nov 2026 05:22:50 -0800 (PST)
Received: from x2e.localdomain ([108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa957df4sm19614737b3.20.2026.11.13.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:22:50 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 08:22:46 -0500
Subject: [PATCH] tee: shm: sync DMA memory for the device before it is lent
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
Message-Id: <20261113-tee-shm-dma-sync-v1-1-19d4efdfb4cd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACUP92oC/yXMSwqDQBBF0a1IjVOQaj9IthIy0PapFbATulQM4
 t7TJsMzuHcnQ1QY3bKdIlY1fYUEuWTkxyYMYO2SyV1dJSI5zwDbOHE3NWyf4FlcX9ZFXra1gFL
 2juh1+y3vj79taZ/w8/mh4/gCf1QRWXQAAAA=
X-Change-ID: 20261113-tee-shm-dma-sync-12f58435b81e
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af70f2c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6jbKIeu7AAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=of0t6A3Ksg6zxwdynqYA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=-0VUF4iAjVmhXKmeMUOz:22
X-Proofpoint-ORIG-GUID: 8QogbtiZbt2SAbu6W25baMbH-H4CwmQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX7HTfPggUzdW1
 qkd2B82y4D8ClG7FikUeadDDbJEQK3s1XR1Z6yKmpaFWJ2aPcxSlOtzCxKBIFsTd8mpKzDsV6n+
 1S58tqDRv413jLMKYiTc5r5Vcy1QpkvDN/5TGom0iM2Gt9hCtizVxwVSjuTAz3ltE/hN71ohnGv
 wTTP7z9tx1dXBouYAEkOAZx1nBvSV6182EAZExZ7dpldKtLyUwzaZOuVonHBUdbmtk48RGenZJ2
 d1tCmdClNV6JHCi+tY87jrIcKcUS7eC0K4l9fNoz05R1YmGitA7M6Ql+axY0JhIhEAhZEMWeQKs
 iOTwtJVhWY+1s6gKmhCxMy6DBu893jgcUFsmeRutO22AVGj0Sk8Nx80FdSmEsMcSldGPj6igNsK
 DttCAD3gaEp0Qc+JClZxxyLXTz+T+RPfF0TLN+UD+wWB7HYTFtaHghI89i7J/IXt0qPaOD/3jLL
 uM+xobVwVT8qqSijN2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX7zO7l9CdxvqL
 Saifwk8XpUTOmr7X/qPDLc8WUtEX5LcvSBvoUpwSsnqehKNw59t4WC+6ZB0HMFOM/9MoNf8HFnH
 ATnHFaoHxksswauZEIGrwKXh0gZTJ38=
X-Proofpoint-GUID: 8QogbtiZbt2SAbu6W25baMbH-H4CwmQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130053

tee_shm_alloc_dma_mem() returns dma_alloc_pages() memory without the
dma_sync_single_for_device() that the DMA API requires before a device
uses it. dma_alloc_pages() zeroes the pages through the cacheable
linear map, so the zeroes can still be dirty in the cache when the
optee protected memory pool lends the pages and a Secure Data Path TA
writes them through its secure mapping. A later eviction of those
lines overwrites the TA's data.

On an Eliza EVK with OP-TEE as the FF-A SPMC, a TA decrypts into a
protected buffer, a read of all RAM through /proc/kcore evicts the
lines, and the TA's digest of the buffer no longer matches:

  frame 0: 0e534d8c..., reference d98ddba1...

Sync the allocation for the device before returning it.

Fixes: ab09dd6d9201 ("tee: add tee_shm_alloc_dma_mem()")
Cc: stable@vger.kernel.org
Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
Vincent's direct-map series [1] cleans the range in
dma_zap_direct_map() before the lend, which also covers this when it
can unmap. It returns -ENODEV without any cache maintenance when there
is no lendable pool and the direct map cannot change (arm64 with
rodata=noalias or rodata=off), and it is not a stable candidate.

On a dma-coherent TEE device the sync does nothing. teedev->dev is not
configured from firmware, so it is not coherent today.

Without the fix the TA's data is lost:
  https://lava.infra.foundries.io/scheduler/job/554467#L2262
With it, the data is intact after the scan and 50 lend rounds:
  https://lava.infra.foundries.io/scheduler/job/563840#L1979
  https://lava.infra.foundries.io/scheduler/job/563840#L2008

[1] https://lore.kernel.org/all/20261111110738.872947-1-vdonnefort@google.com/
---
 drivers/tee/tee_shm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 5c47a36916c45..70a273a425f88 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -297,6 +297,9 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 	if (!page)
 		goto err_put_teedev;
 
+	dma_sync_single_for_device(&teedev->dev, dma_addr,
+				   page_count * PAGE_SIZE, DMA_BIDIRECTIONAL);
+
 	dma_mem = kzalloc_obj(*dma_mem);
 	if (!dma_mem)
 		goto err_free_pages;

---
base-commit: e21989d08e0d6abacfff71387d0cb36dd96a4079
change-id: 20261113-tee-shm-dma-sync-12f58435b81e

Best regards,
--  
Tyler Baker <tyler.baker@oss.qualcomm.com>


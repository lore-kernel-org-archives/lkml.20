Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197631;
	b=eRhO6iWBwnhQgTS1ajbgA0O9eyNpktM+zc11qjynNYxWDUlcQ3nQc1OEvQf3o0GF1trN
	 dtFqunBozi7DUwZzpABuPLovKaYeoBRwVmRMPrgRcW9NoNHS5hDZ5l3eeWcA4dmdpUZkD
	 hH1p8VIfmIm2T0PqLDsa90L4KoCnNg0x3N3Mt4qRGjFfyb18z56f7lQVzcF9TCn50AKZe
	 /zZwwEVr/8Wfbtq9SU3PdBTWXwtK3/bAnUcugNra/3VcqfYZFGrjIwBjUBEQz8by/Fdk0
	 u8c4uWx2ohr6rWrjzjYug5Kk+mVlS1rAyx9yd7ifhjbPfHXNIlYodSGNjfCIrAq1FgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=;
	b=ul6Nl8EmLYVqrACKT1Zq1J0WVtrW9ejVahfBwvZqlDMUGOdgzGaLKwDpPqO0WbY4ZPni
	 lYrErhwOctzvtx1cHUMgfgqTWJNSc/WRRPyASx4phs6QkhF/mF4yQHx+ocHHMd20uxcFa
	 /9cN48OX6z26Ui0XjpVs6K3hbu7Hus9Ufc0ueSqgAGWd99Yzzz4Fk9pun/8nRH9jbcwCy
	 TpL91l7dnnPjmLcKnJRiRClN1lYKGSK5Uz6U9wOTSlGOoeN6xGE9Q7YAXt9b+I7cG3pjJ
	 wErY2nIbhEHzXbRhW1+vfD55kLbCgnUNVLawDK1G/cBZZTuuXE/QuHlHNAsVH/lJvnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WVX8OiC/";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB9606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WVX8OiC/
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso191746a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197630; x=1794802430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=;
        b=WVX8OiC/8Q+3mppsRGQvGf+ceWlsafcvtNhR33H8uS3a5p/lO8gQh1BTpErf8jgVQ3
         x38ZDlyeIsQ5DwgELRoscUUK2N7twMJQq4tnwGNHHO1jM47mrTqkDN0gp9vlqzrB+s4g
         TEjeeZih7eqSfTpCMgYYZZwu2OFY13krwSXczTewoqMgSBN6rBnoY1JAMZZWsTTzFhrq
         fEJXN8t34H8cmQ2OERX48KKCz45FZVOlkIZa/zM2GUAMlV2+yBzEW8GjgWTwOm/sX9xk
         nI2p2CLSxv/38bsSF+/JhxhlZfzyvfLsp4a//A5LZOswitMP3G8n50coZvp7uadDpOal
         JVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197630; x=1794802430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0l8d811xXE3dnZmwNLfCrP+2Be29E3U8oZ38NJ2ems=;
        b=TLc48xTiWnzsSw8ZO+4siJOd9BkqbAFcfY0hMsCgnHbQBOoUX8YRsKZuMzfIaiefEY
         rRjrsPQmnXtvlbFq6lcDZz9NG62GArtWh+f9BHM0zJGxSZxF76xco83OcQaLFwXifYrQ
         uByvw802X7uzRqBpE4TKyqEG4paiRH/4hwlIK2DX+VwZcHdDB6TNN67uOYm2ADoWLpfW
         PBGQrcemwjnb923d0zwRXbdiP3De3WBW6OPdKDn36sV7vtkrPgTWclLjKRDNuLlF1NYV
         8TVKGPd6xg9rSP0lWgdnSLILHtp41x2cwhzk9DLM0bL7BLiU02OsPhsEVbAWAm2oeSTp
         Q2Tw==
X-Forwarded-Encrypted: i=1; AL+hErGb5jmzBhdniKrGcIn4WdzaHc/KYpBRA/qoc+ar8KQUHmUJ1/fbyVdMuonzwjkcuy2qV3nicUl4GHg9uTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zwn5b31cMAZ0Fc6vxr6iyQR2i772xOpG/bSIXwp914MVbBDMd
	3Nv5xdrA6rQ5Mg5S0D7YJgdWtMQOLsdYFk3AQHCcbThD7hXPjVsNxgTa
X-Gm-Gg: AYBFou0zxU54qPMaKkzWsSLnO6wibdKXT2Ng2savIxUujoRvQHkMyVRBGSUPnrBYHmE
	QngO8HKeZ43l1yKlv3YdMDF3/SIRdcDrSbcYU5Cadt1a2Sxc86fLb9CC5Wr0ftfZoiopcnsFDUW
	xzebE3KMLKSIhSkDOZ75Pphq2tKtsrxRqb2rVwQIXzOHx5zYwTxMrpHtxDOk3xuaoA/XATvOxCI
	ohOJdmTRuJXqP86FIZH1+nFosVQEoKzB7gJNX8qN799XstDRWE9v2v6uUqHs5hOSVsYXUxRhKS2
	EMq7ie/XKBaQVR5jDLOHQAdYng0M8uRPvKYPMqMnw2kqvC1YZF+3Tdb+r6IEi05PEX4OzSbFA5j
	6mwTxE6+1AjkobAnAUxEtrSCWINwzI+HkIzKC94Vhv/+1gC86Go+CEU/ZwbJAbS1iEh8c4eWBig
	vpQgHwMZpquYQELMehZLTHvwwDJUADopZh+F4O48GH8KfAf2G56GDb/nedQqEPowrki9IY5o+eF
	GTcoqQ0/kgnWuCCt1j1iKWXvZLoKJyDC37X/p5ST1dKWWL91WtMvCKMrv8MtfyU2u/NX9VVP45T
	lRVNIpBYv0/txz6qY088hKQobNGFqjz9xpxHT+fQ54M+FK4HB2rfJgYfD0l0xdw=
X-Received: by 2002:a17:90b:2649:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b12d3e7150mr2343254a91.20.1794197630034;
        Sun, 08 Nov 2026 20:13:50 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1305bf886sm3998200a91.7.2026.11.08.20.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:13:49 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	catalin.marinas@arm.com,
	graf@amazon.com,
	leitao@debian.org,
	mark.rutland@arm.com,
	mpilaniy@redhat.com,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	will@kernel.org,
	yeoreum.yun@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v9] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
Date: Mon,  9 Nov 2026 12:13:24 +0800
Message-ID: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

image_load() adds text_offset to kernel_segment->mem and subtracts it
from kernel_segment->memsz.  For CMA backed segments this breaks the
load path: the payload is copied to page_address(cma), which is the CMA
base, while image->start is set to the adjusted address, so kexec jumps
into the middle of the kernel.  kimage_map_segment() has the same
mismatch when a segment has been moved.

The adjusted memsz also breaks the release path: the CMA pages are
freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
allocated, leaking the tail of the allocation.

Both problems are specific to CMA segments, which are accessed through
page_address(cma) and ignore segment->mem.  The normal load path uses
segment->mem, so the text_offset adjustment stays consistent there.
Keep honoring text_offset, but load such images from regular memory by
setting image->no_cma: they lose the CMA contiguous allocation, but
keep working.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/au4JOjnQlx2aSpiE@arm.com/
---
v8 -> v9:
- Fix with no_cma as Catalin suggested.
- Link to v8: https://lore.kernel.org/all/20261105125442.2282987-1-ruanjinjie@huawei.com/
v7 -> v8:
- Split out from the patch set.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/arm64/kernel/kexec_image.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 78b1f956d8d7..f4ad22447259 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -81,6 +81,13 @@ static void *image_load(struct kimage *image,
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = le64_to_cpu(h->image_size);
 	text_offset = le64_to_cpu(h->text_offset);
+	/*
+	 * A CMA segment is loaded and mapped through page_address(cma), which
+	 * is the CMA base and cannot represent the text_offset adjustment
+	 * below.  Load images with a non-zero text_offset from normal memory.
+	 */
+	if (text_offset)
+		image->no_cma = true;
 	kbuf.buf_align = MIN_KIMG_ALIGN;
 
 	/* Adjust kernel segment with TEXT_OFFSET */
-- 
2.43.0


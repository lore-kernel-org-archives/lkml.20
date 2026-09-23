Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A57F443A91
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149400; cv=none; b=r3vbINtjPbdgJdEQO/QUzli5mZC/JvbnPOwQpyH2UudHTGhvzoZUGlqoyaEhd7mDBCxI2mn/Ag0iWuLGHb+cgo7ijF+1UfK3Qc+PQ5qU8zaEn2BFkrd//YgRLU8r+nrnjIOQB6nkxd876ShdcgmP9bX4ELNi7yNOUyzgUChmF8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149400; c=relaxed/simple;
	bh=bRn8wL+CCBZ/kEqmxJu5dtRyylJpKptEMTVfqYig3FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rdVc+LkdMtwx/Y6QPsUWdnr5uHffa9PuIJ4SbmUfZ+J5+/8ndzhMLSf9zfBNDTt7J+106bjh8PoNg83agvx1ZW/1OYgHxu+iL38DHZpE59Stch/TTpd/0I1lBWmrPsS7HLWzTCHbSAovFOJZTLA4Zi/FMij2K+0TzVAjypO2YFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZHi11sz; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZHi11sz"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2d6ff2b8503so190225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149397; x=1790754197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTfLJperzfUzEeNbOZUt7XXLJ7Q/DdPcSG6fXcqgoAo=;
        b=gZHi11szns4Q03fYQTEfus7aXi8m2dD8n9e9InAJ8StCqbIx5L0NV3TP8Pbai015E1
         6AozKi1wnF9Ps6gMqKQ1j1MozIJei6FilhXXkRvjGJ84D/HI2zlWcA4nv8ZGOxtmGMaT
         FZqFse444N2mbXwpzZHjuwpXwYOllRouL8fSZrqlxQFx4ne8TiD6q0GNU7zSsNK2nx+q
         Fdnufjo+kjHbajYGLqJKI0UFBfzpMxPrI/5XlV5mlNp2zcXflrNeS2edg6iIlfnA3Ubw
         PcGgdQYXyTUZgXC44cC7rSSnsDtfbBhGULWTgOI7EclkW4rdb/DN/Z1IaoAvxfAxJBec
         hDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149397; x=1790754197;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTfLJperzfUzEeNbOZUt7XXLJ7Q/DdPcSG6fXcqgoAo=;
        b=fVSymSZvSfHWg9PZzIhH9DsJjZJjuCinwILcDFbNlEcrUVcl/QiI+iNM+sYefPoXfM
         yLWMde9FKZElYrXa5rjY8yUOTAMHq8LcR7h1lMRlBS2ElrEeROb0W58E+Le93xSq5q10
         Yd1LuJXCgH1IByedyGT//IyRtebQoPnMsd7M5sDZsKlpzNcVe0P4pDKZgmBN80DA4YHG
         7/RaojHrCaQf5gf7+2AYVwNxcYf5om3W7dmA8Sk2O9qXVjgRSpo670guBPrBV2spG77f
         mYdLtn7fH+0noD66iQiF5KOQbHhOazZ2KnJkoJhwHmsgGjuQZWVD0I4S63tZVB4Ag/2g
         0BsA==
X-Forwarded-Encrypted: i=1; AKwUvBwYDt8Objt1QtA8jqB+0xqiH/3tBCyCOUliiaGWhh5c6TRy8sa5qYZLKlyz4XzfWixBZgHHuFc03KPPIJg=@vger.kernel.org
X-Gm-Message-State: AFuF++l08y0+Fv7h8xVDi8lWabGAd1LI8RXhlw68fpHytyxXgIj4U18a
	/FjaGDeTrLVPXh0YsGQTLQ+hh0smzA1151DcUi8dEl2AtqfUJP3228do
X-Gm-Gg: AYBFou2v3xO/7OP4ZvyKZkuEJ5taJOVBDPdQTIlC9hEJ5cQdlI/JqkZYnASAMQvd64F
	hOFajZO7hR/d2HKy2jqF4mlH+LdTLUvA+LWTPnNwEbaGeX2Pl99ZKpxNkI83HzVEPl4omZlBptf
	HY5c4jedR9MKEV646lrjm3sc51s+vBiU2u2/rIdve1b+s692pLLcI+rIdFLWPxGj9XuwvL9hqFn
	4spLQv6Tpo/nTRvqRNOclUBdeN3LnpjjbFUL1mOeLLtcRFfMmGc6P8w2kJEQ/6fd6PbMbxJh5HC
	ZfocOCXifMfdpXYkomEg5HMMoUFv60vh40NzfhpSE4vwjtk8Aldnp/X6mgK7MGPmCZI58IyiUb3
	YYwQjr6HZ1lR1/n3MDOO/GbdJP3PmzAa3BIQxF4C89CPOhB8PgCGW/qWJfmYJXR3jiDi7AYeKud
	aotr2IUOh2cxPfYARrC5GwlHL+zfNLq0HtW4GPnCYmnBPNm8ucfNiHKtDDnYqDxG0HbXHidGsyy
	2DweiM+E5ow3Q==
X-Received: by 2002:a17:902:ec90:b0:2db:2e9e:11a4 with SMTP id d9443c01a7336-2df69d1922dmr27273785ad.1.1790149397278;
        Wed, 23 Sep 2026 00:43:17 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d9273sm6406785ad.50.2026.09.23.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:43:16 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [RFC PATCH v1 0/2] Fix the v7.3-rc4 DMABUF_DEBUG regression breaking drm/msm hardware video decode
Date: Wed, 23 Sep 2026 15:42:21 +0800
Message-ID: <20260923074256.9357-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hardware video decode in clapper and chromium (V4L2 decoder output
buffers imported into drm/msm for rendering and scanout) breaks on
v7.3-rc4 with arm-smmu translation faults:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

v7.3-rc3 works fine. Bisecting between the two points at
143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels"), which fixed a dangling reference in the
DMABUF_DEBUG default and thereby silently enabled the option - and
with it the page-stripping sg_table wrapper that
dma_buf_map_attachment() hands to importers - on every kernel with
DEBUG_KERNEL=y, i.e. virtually every distro kernel.

drm/msm is affected in two places. It fills the page array of
imported GEM objects through the deprecated
drm_prime_sg_to_page_array(), and it maps the attachment sg_table
into the GPU's own pagetables with iommu_map_sgtable(). Both need
the struct page of the sg_table, which the debug wrapper removes
(and it zeroes sg->length, so the page iterator yields nothing while
the uninitialized page array is kept, with the helper still
returning success).

When such an import is used for rendering, the VM_BIND map job then
fails asynchronously after userspace has already enqueued GPU work
referencing the mapping, which surfaces as the UCHE translation
fault above instead of a clean error.

Patch 1 restores the DMABUF_DEBUG default to n until msm can be
converted to build its GPU mappings from the attachment's DMA
addresses. Patch 2 replaces the deprecated helper in msm with an
explicit loop that rejects page-less sg_tables at import time, so
userspace gets a clean -EINVAL and can fall back instead of
crashing the GPU.

Tested on a Snapdragon laptop with an Adreno GPU and arm-smmu
(v7.3-rc4):

- DMABUF_DEBUG off: hardware video decode works as on v7.3-rc3
- DMABUF_DEBUG on, without patch 2: GPU faults as above
- DMABUF_DEBUG on, with patch 2: imports are rejected cleanly
  ("import of dmabuf from 'videobuf2_dma_contig' rejected: sg_table
  has no/misaligned struct page info"), no GPU faults. clapper falls
  back to a working display path; chromium shows a black window as
  it has no fallback for a failed zero-copy import.

A full fix for DMABUF_DEBUG=y requires msm to map imported buffers
from their DMA addresses rather than struct pages; that conversion
is left as future work.

Comments welcome.


Jianfeng Liu (2):
  dma-buf: keep DMABUF_DEBUG off by default
  drm/msm: reject dma-buf imports without struct page info

 drivers/dma-buf/Kconfig       |  9 ++++++++-
 drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++++++---
 2 files changed, 36 insertions(+), 4 deletions(-)

---
base-commit: 93f51579e7df248780214094418f205253383cc5
branch: fix/dmabuf-debug-msm-import

-- 
2.47.3


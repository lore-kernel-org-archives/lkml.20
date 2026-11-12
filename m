Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479944;
	b=ODineVlYZ4TxPaKNv9uyWsm2N3aFlnwRdfshCpbNcCu6mytshaybwIL8nZGJR6G0XaIF
	 K5oT5Vjl8Z3dq9CzjB+9q7C/rzC53PVCRIsTIsjs5/v+JxY+VC3bpwCvR1ndkm4GPUhYr
	 xyi3oq2bjtlPmsYKADqkJJ3MMgY23kL/JJT7Y+2QPsDIo9gan252116dhXxVzLMfdM48W
	 fq0Bq9fMp9Js9QIts8E7R6dlxSBBoXgYukn6IXaN1EsARosjE5tjLu+XEtAibRWsQmcq5
	 NbG3xUyZoz/SI78IFQAEYgtngOmHlhOvp6SbX4YoKkRNk1Ea+vi5fFEousP5EOTdsLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479944;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=oTUZWvCTLZ0AEWIKU42P0/UyH3jve/9SVlOYQoSE1jA=;
	b=pRWgQ8NnZ1O4ONO5zWZ0eFXs0KHTHt6plvwbXN7aU0W/ansLyOQW/aHimB1K4e4kszLQ
	 tFgL1vOsA47eeBsXUMXfFC6xgbEw7aWfJ0nskjGA+v4ohF+cuz4JXM9BkcIgRICoqhGw1
	 GnjXRqy8dS3kPdEyPRnS32eVqP86EUqZScqxvvTb9oBiF7UcgMD0T6NIABm/3ZLk0+yfh
	 EiqYPCJB083gB1F/UX4QUqp3vSFnx1Qa609iFpLvzvxEdJmr0X4I8SS01hRnMbaYW7U/S
	 Orz2BuYiuGPGxN1k8kPpSNUpjek/qPxRk/ZquD8TM/9yNhaCJiRJDKflp/9+a2VQsCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RUCJ/Hji";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22CF606A31C;
	Thu, 12 Nov 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUCJ/Hji
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2DA1F00A05;
	Thu, 12 Nov 2026 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479943;
	bh=oTUZWvCTLZ0AEWIKU42P0/UyH3jve/9SVlOYQoSE1jA=;
	h=From:Subject:Date:To:Cc;
	b=RUCJ/Hji6vJbi9GeyfPR/yScaM67RJyJ07c4TUAVyvtrt157ri2exqt7V6+EpyBGm
	 YU6yajCa1XYY1SVCLwHTnTFhR8d6f40hLZptj1bimg8BWaMH0AVK4JO/8vERHtPPwl
	 cwdvYENODncQKxL5+xSw8Srk5YhxX5kNoO/2QEp3JKINk0mOc7D6ps84RBtRjDhwz/
	 MTUReUGmjGn2BUh1muigy0WSxMy0MwVS4aCCIO9Bpz+auqEJAQd0vgrh75IYkxaow+
	 0hXzLguDFgM+3DqRUU+WVo4qFXX+MwHn9A95thaTcg8gdaKIrwMyYSPplI43YZq2Gn
	 cBva28lqN3/tQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v3 0/5] kho: fix bootmem sizing
Date: Thu, 12 Nov 2026 12:38:52 +0200
Message-Id: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OSY7CMBAF0KsgrzF4gqR7xT0Qi3JSSQqIjcohY
 lDuTkxvuqUWy1/D03+KhEyYxPfiKRhHShTDHOxyIaoOQouS6jkLo8xWa2XlqYvSxzj02MtEDwq
 t3NRbwNoVYJwV8+OFsaHbG90ffnK6+iNWQ5byhYeE0jOEqsujyNRSWPeQBuS87ygNke/vVqPOz
 scCo5ZKug1A4dRX2Vi3OyEHPK8ityI3GM1vw/1rmNnwqtZQWleUqvljTNP0AjBX9RkrAQAA
X-Change-ID: 20261103-kho-bootmem-sizing-5d6aed47a243
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
 Mukesh Pilaniya <mpilaniy@redhat.com>
X-Mailer: b4 0.16.1-dev

There were several reports about issues with KHO bootmem sizing.

The bootmem areas are sized from overlapping views of the memory reserved
in memblock, so on NUMA systems memory allocated on a node is accounted
twice and with CONFIG_NUMA=n the lowmem and the global areas are accounted
once again in the area of node 0. Besides, the lowmem and the global areas
are reserved even when they are empty.

The first patch rejects kho_bootmem=0% that leaves KHO enabled without
usable bootmem.

The second patch makes kexec walk the bootmem areas in address order.
Otherwise kexec on arm64 may fail if a small area at the top of the memory
is the first in the list, and with smaller bootmem areas this becomes more
likely.

The third patch skips empty bootmem areas, the fourth one makes the
lowmem, per-node and global areas cover separate parts of the reserved
memory and the last one updates the documentation.

---
Changes in v3:
- add a patch that rejects kho_bootmem=0%
- set exact_nid in kho_reserve_bootmem_area() only for a valid node
  (Mukesh)
- free bootmem areas in forward order on error
- add braces around multi-line for_each_node_state() body (Pasha)
- add a patch that updates the bootmem documentation (Mukesh)
- Link to v2: https://patch.msgid.link/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org

Changes in v2:
- add a patch that walks bootmem areas in address order
- update kho_bootmem_cnt directly in kho_reserve_bootmem_area() (Pratyush)
- don't reserve the lowmem area if ARCH_LOW_ADDRESS_LIMIT covers all
  memory (Pratyush)
- extend the comment above bootmem_size_update() (Pratyush)
- Link to v1: https://patch.msgid.link/20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org

---
Mike Rapoport (Microsoft) (5):
      kho: reject zero bootmem scale
      kho: walk bootmem areas in address order
      kho: skip zero-sized lowmem and global bootmem areas
      kho: fix bootmem sizing
      kho: docs: update description of bootmem regions

 Documentation/core-api/kho/index.rst |  31 +++--
 kernel/liveupdate/kexec_handover.c   | 225 +++++++++++++++++++++--------------
 2 files changed, 158 insertions(+), 98 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kho-bootmem-sizing-5d6aed47a243

--
Sincerely yours,
Mike.


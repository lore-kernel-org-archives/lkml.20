Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706596;
	b=eGh1PN4wtthkqcifj08v8ccCa93xlTzBQb30jrjCjfF/hM1IOhApBqAXX9Lt99xU3i9H
	 eq1Bxrtpb0WkjXTYVwe4ewacAYjVTzw8JwkWN1vYZUXRlJigU/DfCvbuzHmmME7D8ilqG
	 rlqBhTABZB3cYj/sXnhqLI+Loys2/XGwFa17UGAeKCQKMdt3z+CXCeer2G567P950SMr/
	 ZfxEYOoHDn5+o5GB0OZ/upBTdwYF1q0V/CAQdHzXDMbZxwcTofw4hsW3EqumHf3w923Y5
	 5iu89Elhx+mwhDmotERtA5kg5HGZlMScPCegCYtpGOr/MDGGgyJzkg380IOq4LoWabg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706596;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=twt8xyp/PjuLOlMXlHAivsnx0jkVr0LdLW19Gs2AtO0=;
	b=0oV0pUjNhxYiX5vsuVxgb6MAibIjl2iEZjD0YGvr4Npni67I76bDjkas4IEm8wXnrfDI
	 usSD54MG6g3kUUNYCbEPX0j0pHUDhGvp9A32QrsZvMlBkAmCERvkT7Q6IBP+4om16woAv
	 5p7a031/mO1TntP88IXn+L4ca97FCFYS2XSGMhJdhPG8qkjMVdAOAKcytxhwRZX7SESWQ
	 Zljn+XqGnuDUGgV0WfC/4Vs29aONlAOBaAOVxfy9Yc7BTuBsBmiuFWeRCKzxk7PF9GcNf
	 9n+yAKMd85oGdwsZWI9Es4XEAekCW34P8ETP0kMPtl7Xrhdpefj1AQa2JTqqYThgw3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyzLButy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F7D606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyzLButy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A851F00919;
	Tue,  3 Nov 2026 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706595;
	bh=twt8xyp/PjuLOlMXlHAivsnx0jkVr0LdLW19Gs2AtO0=;
	h=From:Subject:Date:To:Cc;
	b=PyzLButyVIP9s2N73x/7CD4RsthvVm0yhg9NB9mJIJEVW3AC9qYF3D/4UL63y2P5n
	 SqKTUVJkDulKszJ1WG+cseu48umKgXQlidqY/+KJJGYHbD/d2D1jvVzDpm1Cer33CB
	 zKqRyxEaYi1x/V8LAj5hMl0pnkvdIMaZF3nZZQLBUFsUYmsOlJYZJ0R53/gLx7AgM2
	 V77gJB6YkslcOQtrjBZ/ow2B6qUGcS9QSgD3NAAX8KWREIOfVh+7GoiwHFF3WJUB0z
	 yo3Jb0IJjP7nD4PF0LXi6OdCzoRjj1y3losd2DhClyZlw237SXIIcxRR5vy+bz/ZfM
	 w1TZmK2lIDKKQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/2] kho: fix bootmem sizing
Date: Tue, 03 Nov 2026 13:49:48 +0200
Message-Id: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw7CIBBFf6WZtcRCa038FeOCxwijAQyDxtj03
 wVdnpt7zgqMhZDhNKxQ8EVMOTWQuwFs0MmjINcY1KgWKcdJ3EMWJucaMQqmDyUvDm7R6OajVvM
 ETXwUvNL7Fz1f/sxPc0Nbe6k/jGYUpuhkQ59yIU9pHzVXLLBtXzJtQn6WAAAA
X-Change-ID: 20261103-kho-bootmem-sizing-5d6aed47a243
To: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

There were several reports about issues with KHO bootmem sizing.

The bootmem areas are sized from overlapping views of the memory reserved
in memblock, so on NUMA systems memory allocated on a node is accounted
twice and with CONFIG_NUMA=n the lowmem and the global areas are accounted
once again in the area of node 0. Besides, the lowmem and the global areas
are reserved even when they are empty.

The first patch skips empty bootmem areas and the second one makes the
lowmem, per-node and global areas cover separate parts of the reserved
memory.

---
Mike Rapoport (Microsoft) (2):
      kho: skip zero-sized lowmem and global bootmem areas
      kho: fix bootmem sizing

 kernel/liveupdate/kexec_handover.c | 142 +++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 70 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kho-bootmem-sizing-5d6aed47a243

--
Sincerely yours,
Mike.


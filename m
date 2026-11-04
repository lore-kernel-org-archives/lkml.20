Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808606;
	b=je/ZLkSWlDE3eVRiAAmCyzahpI/l/DwymW/PE59aLf4Ott6XIiTwwV1XGa39aN01jJQt
	 TcVrdbrOYLiytW7eN0fTSCMyEkQeWOCGGDyf1tEyvDbvoHukftWp2n9ffLayLHw21+c+T
	 9JDZI2NxfgZBbD3cAL39D3Zs+zigLwy10WPa2efH92pJSvfGftowrhAQzlCtugweWIP6K
	 zXseL0f5o04vsKpRfLPU2hLM0pHuztw2Nivh227ul2mwFOPuAmHanETFrSZjwTsPjGdAf
	 uL87Vg1uLUumiaetmlM/19yydAzsk6ysDdKk8cuRIv0a0MJC8WKWVwRk7f6t1BRkhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808606;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RtmPL253ch29gIpiVq0xncUfpACHZ/Al//0T+QvAtTE=;
	b=krSOdrQC3jyD0miAd1M48U+CK0PSIAOmhqBwPjn3AwHsT3kMEXzLkFx5efncX42r9lD+
	 bMCsR7nEHH1WOV6fALm/aQl5NxSwfPQAgoAL0kMQ4yxMpgQPk6U1Xu27d78wFNFhc+6+L
	 4t+l/T//brvbpD3ti9GgQ4j1CKA9xOHiMPXfWNYT39KerOkAbv5KDOjTKtIHBKqmvDkvX
	 u+8ZJLPfMFbgPBpWqPCJJaK2cKyssn2719zyXfu/dayx5Gfi8grpoXVuLo3mLjWEG8kZB
	 3E/tvSNjqUDaTevDITZdk5ntnXrwUCmMaJY+XCgBrM8oAQ/9J12xN7NIWy7pSTWd1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RNeqyRn/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC91606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RNeqyRn/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E891F000C1;
	Wed,  4 Nov 2026 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808606;
	bh=RtmPL253ch29gIpiVq0xncUfpACHZ/Al//0T+QvAtTE=;
	h=From:To:Cc:Subject:Date;
	b=RNeqyRn/+CAKNyHK1ZSpb5UjExecLIqj3fBVcdwXtDgwP3GD3K2oWn9O+BeR5f6iD
	 gGZm0g+KRIh1bAYuxnGOY7dka/dJSJwhjHuLo9AtAgtUQMB8+JzJC/vXfdcOgOXuV+
	 x8rM7hwQAAPtS3Uv3aDUO9tJqeRowSRCB3FUkfNs0xD75nb4gGYpepZQNYn0zO3/d6
	 cYqZOLjDi+J678FAqiQvZBY4gsD3kJYIPF3KVVYyO47J/cnVNVnWubmTePH9VfHsSA
	 COZG0AyNSJPa2/0DqmiVIPjBAKoInx1W+CZp2A9+plaaoM0ihnyQFKVr+eqDitlc2/
	 CzBSbSvni9abg==
From: Thorsten Blum <blum@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Thorsten Blum <blum@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kho: Remove redundant 0x prefixes
Date: Wed,  4 Nov 2026 17:09:33 +0100
Message-ID: <20261104160931.137174-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=blum@kernel.org; h=from:subject; bh=oE3Ypxncsp4Y/KarKJNB8OKsSEs9/QmS2hxHg/unzIs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvI3Zv1fppN+UXC/sW4+cuEwVuZ0kEFzycNW2lWOsqu 0Pbsz/d7ShlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJ9Lcw/GJerqB35l+QfSSr Wdwh7sD/8+cff3DT9HjaTcHL/yb9XnCckWHGcjeJtu83zJ+v0VZM1luzUJ5/3gkGga5Y+xarnes ZRHkA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The %pa format specifier already includes the 0x prefix. Remove the
redundant prefixes to avoid printing 0x0x.

Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 kernel/liveupdate/kexec_handover.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..5f828eb44f75 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -2015,11 +2015,11 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 		memblock_add(area->addr, size);
 		err = memblock_mark_kho_noprsrv(area->addr, size);
 		if (err) {
-			pr_warn("failed to mark the bootmem region 0x%pa+0x%pa: %pe",
+			pr_warn("failed to mark the bootmem region %pa+%pa: %pe",
 				&area->addr, &size, ERR_PTR(err));
 			goto unmap_bootmem;
 		}
-		pr_debug("Marked 0x%pa+0x%pa as bootmem", &area->addr, &size);
+		pr_debug("Marked %pa+%pa as bootmem", &area->addr, &size);
 	}
 
 	memblock_reserve(bootmem_phys, bootmem_len);

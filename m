Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809472;
	b=ALWkQPY8xdCuqF8FSEbcU4qsj6o1oDAJsKgZ0e/8RqY7G0vxeY/Je3jHIGNOO+dSpSry
	 e9qwl1/kPnpRottqozxy+ur1AHW7mVqz1+WoV8OzMe1FrdCv4cVUlXEFnXoL1DNCCiuDh
	 nA3YFClGLc9dnv3h3P+Ea4hARzHp5nGqedshf7T1H5iAQHBs1Vo1mmE5/k/LLh+ILSVyn
	 zyzF5v9CYMRcE6pGai9FRpgp72aHLydvrjjJrogLCTv23wEZOYjbjzIvOHTm1avzfHCpe
	 QCcNfNyU1av8a9kuUab+surFmkre4kYnmxDiBhw1MB0VQbOGCY+LgUm51SJo/lz/kkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809472;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=JRqUizjEpje7QENpLEZU+9mQGGXBD071wudl9Jtl/K4=;
	b=j9A/RKQSKtCB2bZ0x1FzJ+22yrauxf53UvSqxj1Kqt3MbTA3AeZz6YHNTiV4RKg0cW1/
	 Yx2tJLAXB5pdxMSDww8OskzylrzP97wH79D6uU6aSmCJCNthhI8hCHl50SvEh3oX8dgVV
	 B9eJbOaDI0fSeyquXJUFF/ZL9wWdY76HSAS/qXzyKx/ICmpgeg8tEaoHJn1k5ZilWz+Yh
	 2KU+Oug0goj2cWk4goRk8yC2yc4xEErRGKeEDaxiQ38N6kVo/46iHm6OMaPMIyiRYys9B
	 TEXGdHthX4CwbvhUutvzLK/ajNrAPuE+OIS+iGK5VUgT8sqJHc7/JUjyvZaItO0zQyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n//9uE/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549C606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n//9uE/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4F21F00919;
	Wed,  4 Nov 2026 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809472;
	bh=JRqUizjEpje7QENpLEZU+9mQGGXBD071wudl9Jtl/K4=;
	h=From:To:Cc:Subject:Date;
	b=n//9uE/LLh/XK+fni480r6cjyWYb7TawE+lJ+nlMCdKpTyZVWsyzuyi9q4dJ3a0f+
	 FSaZK19iz7N2ZTdqnnALa3Tq8GzwmpV9o+woIneY+hEQsVTMmNuMl2XbnDVunPV/mu
	 QIX7XP6AKzt6uxXGaZ0+ScBNIRv6Hifni0Ty4DM3oCbzUAmipAMNoVnQ3BzgxP6YdT
	 58oBYpOvPGVfbMePIccUJSrQ0EiCN/HAsLCtbieDkI2qhKGDq6x/j3CXxjGD+ctDCI
	 LRMjNyXSzBceNF2jnZ5+4dPhi9kfcNpslVLBo6S9ls7wJ78JiXfzKUTZc+j/6wsKnU
	 IIGuOjvE9TVDQ==
From: Thorsten Blum <blum@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Thorsten Blum <blum@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kho: Remove redundant 0x prefixes
Date: Wed,  4 Nov 2026 17:23:53 +0100
Message-ID: <20261104162352.140836-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480; i=blum@kernel.org; h=from:subject; bh=Qk9hkzySWCprpSeEAqGuirPu9rol4ZAWn2j8lvg6CwU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvYyQeFTc565/p2DvLqztdPTfhf6XmBhsuwXN+6qsWT VPLiGXsKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgImYBTH8jykpKDcz62y7q3BS Wj1pjn5WxF+GH+VRpktiF+lWsH5rYfhf/K0qlZVxe+qeGbw7fOc++HkzOmnZlg6NvitTV4ooXd/ LDQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The %pa format specifier already includes the 0x prefix. Remove the
redundant prefixes to avoid printing 0x0x.

Use phys_addr_t for size to match the expected type.

Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Changes in v2:
- Use phys_addr_t for size as suggested by Arnd (thanks!)
- v1: https://lore.kernel.org/r/20261104160931.137174-3-blum@kernel.org/

 kernel/liveupdate/kexec_handover.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..6a7600a0a7d5 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -2010,16 +2010,16 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	 */
 	for (int i = 0; i < bootmem_cnt; i++) {
 		struct kho_bootmem *area = &bootmem[i];
-		u64 size = area->size;
+		phys_addr_t size = area->size;
 
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

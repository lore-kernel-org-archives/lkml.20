Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823403;
	b=47ajW4HFmmXpn4LAbgLIpKDGWWpwQvrn9phRPbaFjU6SVJK27rpIH4KMEC3Dh8LUliCV
	 uOWOghuhGDYyJGpLd53CHpYazJ3GQCYHh6pNcGs+i3TOH8L3EKh8jvYo3sI1yopSmElmF
	 7dVVDT/NwvnI/5IATUlvQAa5gxRZXue9xQj4eLg/38QZWjXhv/a+rCzjxwDH8bGP8h4YO
	 5a7p0cudvsPNhkjJRJs7bGv7FwmF3d10/TyUdz0CgzblIDLMuaLuYYg/YQ6Z0t5hP3qg0
	 knEcyZ9K+kmFfJ14PJ172pUT1crsLkGlEtSyRgKZtZkLp+TxGj2fvyQWRbg8Lb4GxTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823403;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=PYPoi41el1uI/dYZz2FDXEE4WkUru7YxfskVQie/JRk=;
	b=AbInYAzTU1VJWgrkktuXIJ8PSzrln+fixJ0do20zYFbmC1vChHzfJ9pZVnrenJ9nddXu
	 +PBax2P2B0sDMzfMUimza0MxYKasZqx5K55M+DhwpH5Ph+SVFf90MOIOT6QNTykvsAMja
	 f5MVZ9n8MxaxT3t/UgJzA7Jq+qxz/IqxZYJHjcvhk1oiZMRSWXnnEm9JNuBHCqe2FLi8s
	 3bSqcojuc0GId2Eg45NJexfeRtyztT9Ky5avSQnEwV5CFSPJni06iFe1/Jjv2e/b8h8bQ
	 UyNws9jicT2KrDQNF+9+lJiH/+hhK60iBWilJBqqltnFYq38qgcpbNbpav//1IjTzoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFpk9qqE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFpk9qqE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB911F000C4;
	Mon, 16 Nov 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823403;
	bh=PYPoi41el1uI/dYZz2FDXEE4WkUru7YxfskVQie/JRk=;
	h=From:To:Cc:Subject:Date;
	b=GFpk9qqEzKi7yBOL2lKm+CPGD1mzOHdd+SIlR1ZsHqpiritOykyMwLNM5WawYRatq
	 Wo+rQHXNydsRpbLQekV5603TCEGorstGlMHxEfmlKifEIICT8E6ble0XWzRCNuc0Dm
	 qJlYk8lc1K9UgIAgO6+O1YFipXdH62oKSoLx99P94O0s9nGOqHP2CVAuSiWKq89JIn
	 d/d6zPCBCusz6FN4P+7sftJQSMgGFVXgQ/HB7qVnwFsK1KyeUyvzG55BjvX3OqbryT
	 LlucFrfkID+m9uHVoZgCxvtZu9FCIiyIVSBqJSs5440oRuIKNJbIMT5ntwcKUHu7p5
	 7NVD7MTjaoQ/Q==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <blum@kernel.org>,
	Yinghai Lu <yinghai@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] x86/setup: Report the page-aligned size in relocate_initrd()
Date: Mon, 16 Nov 2026 11:02:30 +0100
Message-ID: <20261116100230.160085-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4287; i=blum@kernel.org; h=from:subject; bh=a7fgjgWNrjyFUfBehUuF4wuWVorC06K/NfDUq6qkoE4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFm/rmxjyWl/qqnss63X/Rx3sUbv2bQlKYfWcPOmeM26w JBlu25xRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwk5zcjw4PrQte9eTV89j5y ur621YWZ90vJEmHLRX7nV81Z9Pdm/0RGhg3/3xlsf1Bn+Pn/Mk/bunMpv9If2z0w9HIwlnGLsnB iYwYA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since commit c967da6a0ba8 ("x86: Make sure free_init_pages() frees
pages on page boundary"), relocate_initrd() allocates area_size bytes,
i.e., ramdisk_size rounded up to a page boundary.

However, the allocation message and the panic message still use the
unaligned ramdisk_size, so the reported range or size can be too small.
Use area_size there instead, matching the page-aligned ramdisk_end
reported by reserve_initrd().

The exact ramdisk_size is still required for initrd_end, the copy
length, and the copy message, as those describe the image itself and
must not include the padding.

While at it, pass ramdisk_image and ramdisk_size from reserve_initrd()
to relocate_initrd() instead of re-reading them, use pr_info() and %llu
for the u64 allocation size, clarify the reservation and copy messages,
and drop ret by checking copy_from_early_mem() directly.

Fixes: c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages on page boundary")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Tested with QEMU using a 4097-byte initrd:

  Reserved RAMDISK: [mem 0x1ffde000-0x1ffdffff]
  Allocated new RAMDISK: [mem 0x0fffe000-0x0fffffff]
  Copied RAMDISK from [mem 0x1ffde000-0x1ffdf000] to [mem 0x0fffe000-0x0ffff000]

Changes in v2:
- Make it a single patch with a new title
- Make range and size reporting consistent
- Use area_size in the allocation panic message with %llu
- Clarify the reservation and copy messages
- Pass ramdisk_image and ramdisk_size to relocate_initrd()
- Update the commit message to explain allocation and image sizes
- v1: https://lore.kernel.org/r/20261111165608.78688-4-blum@kernel.org/

 arch/x86/kernel/setup.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 19fc8e1714e6..6694ebc2dd11 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -316,32 +316,26 @@ static u64 __init get_ramdisk_size(void)
 	return ramdisk_size;
 }
 
-static void __init relocate_initrd(void)
+static void __init relocate_initrd(u64 ramdisk_image, u64 ramdisk_size)
 {
 	/* Assume only end is not page aligned */
-	u64 ramdisk_image = get_ramdisk_image();
-	u64 ramdisk_size  = get_ramdisk_size();
-	u64 area_size     = PAGE_ALIGN(ramdisk_size);
-	int ret = 0;
+	u64 area_size = PAGE_ALIGN(ramdisk_size);
 
 	/* We need to move the initrd down into directly mapped mem */
 	u64 relocated_ramdisk = memblock_phys_alloc_range(area_size, PAGE_SIZE, 0,
 						      PFN_PHYS(max_pfn_mapped));
 	if (!relocated_ramdisk)
-		panic("Cannot find place for new RAMDISK of size %lld\n",
-		      ramdisk_size);
+		panic("Cannot allocate %llu bytes for new RAMDISK\n", area_size);
 
 	initrd_start = relocated_ramdisk + PAGE_OFFSET;
 	initrd_end   = initrd_start + ramdisk_size;
-	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
-	       relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
+	pr_info("Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
+		relocated_ramdisk, relocated_ramdisk + area_size - 1);
 
-	ret = copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size);
-	if (ret)
-		panic("Copy RAMDISK failed\n");
+	if (copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size))
+		panic("Copying RAMDISK failed\n");
 
-	printk(KERN_INFO "Move RAMDISK from [mem %#010llx-%#010llx] to"
-		" [mem %#010llx-%#010llx]\n",
+	pr_info("Copied RAMDISK from [mem %#010llx-%#010llx] to [mem %#010llx-%#010llx]\n",
 		ramdisk_image, ramdisk_image + ramdisk_size - 1,
 		relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
 }
@@ -373,8 +367,7 @@ static void __init reserve_initrd(void)
 
 	initrd_start = 0;
 
-	printk(KERN_INFO "RAMDISK: [mem %#010llx-%#010llx]\n", ramdisk_image,
-			ramdisk_end - 1);
+	pr_info("Reserved RAMDISK: [mem %#010llx-%#010llx]\n", ramdisk_image, ramdisk_end - 1);
 
 	if (pfn_range_is_mapped(PFN_DOWN(ramdisk_image),
 				PFN_DOWN(ramdisk_end))) {
@@ -384,7 +377,7 @@ static void __init reserve_initrd(void)
 		return;
 	}
 
-	relocate_initrd();
+	relocate_initrd(ramdisk_image, ramdisk_size);
 
 	memblock_phys_free(ramdisk_image, ramdisk_end - ramdisk_image);
 }

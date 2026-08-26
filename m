Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496CD47141C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767920; cv=none; b=c5Hzl4rWxYePIYyRqLtUub5fWC0/H9QELWI1oHqqOtg8ws5/CfeaHbZQu/l2xfF3a+l8RVpBCv0Wc3pQa/QvQs/u156FqZv/3aE1UZgDkwEJAIeE5yBkT5oI3LTLkRJ4XHEqLMYblVJWqk+PFf4yZ5TZsxWgvkhfAwRF+Ycu318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767920; c=relaxed/simple;
	bh=CrjmtN/OtEBVEe/yXWexe6q2FvdZzKGVyHc6IMwDZFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpVXgNtoYjunCO4NmaOWtm0JIKXoNu/ru4uBqLNULvRB9P/1GA8UwzgM9MUVZXIJOwxbOYczt36HRPh7eF4JlYrqKWUQchje+6wOYNlKj1EMpMT4L2rBrVVScSlUK/I3K03hfHjV3+vILt1ocfnadGviUbtPCA0o+LlNnyixekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afc+dgCp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afc+dgCp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71EB1F00A3A;
	Wed, 26 Aug 2026 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767909;
	bh=pLLjXyNEyFtKRC6+G8hM1aftCtlCubqloI+1g7sHGBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afc+dgCpu9Acywk5gI3CEGeDm5xwt6mwOEBybOqA1y+ilSZv6lW6KdgwNygPjrKhe
	 cBtArdDlQ3/c24HCKpl0DB6ixeEmsS8bX35O0qNXGdBX9oPLoYmRdAPsxf8m7NG+HW
	 vFL53EHQeUf+dFSxA001TXY2jRv7ObNwLNRDiYPsUEEIk+j+dan/jCyO1+Pf9m7OzS
	 Q2E71jfxzSNsef+0qVFqj9Q7nIEuJrCvzWb5DaCaAT5PLsmILcrEEFsvfFn+lC2PtV
	 hTwbCnUUDSYBwK9tJAMA/i3uZYTbKn6ehSng+ZwDm7nCa2nXYqfwY8Wv7tBdhS/sYk
	 35GcM3u18j7Bg==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] x86/setup: Simplify copy error handling in relocate_initrd()
Date: Wed, 26 Aug 2026 20:10:01 +0200
Message-ID: <20260826181002.12316-5-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826181002.12316-4-blum@kernel.org>
References: <20260826181002.12316-4-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=blum@kernel.org; h=from:subject; bh=CrjmtN/OtEBVEe/yXWexe6q2FvdZzKGVyHc6IMwDZFk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn9OtoB++77KkxZtuRA4pTdW+4J33y+1sz2iIcE88ncf 7O/q7492VHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATqfrHyHC9aULApJClX4um ze0MXXgmqPxM79u8qR3X7B2uctQcztBh+Gce4cwyw4bjWZ2VboH/HL9Pe27kzKyZO8v5yUqXiXH li7gA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Check the result of copy_from_early_mem() directly and drop the
now-obsolete local ret variable.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1fede9834835..fa1a7c29285e 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -322,7 +322,6 @@ static void __init relocate_initrd(void)
 	u64 ramdisk_image = get_ramdisk_image();
 	u64 ramdisk_size  = get_ramdisk_size();
 	u64 area_size     = PAGE_ALIGN(ramdisk_size);
-	int ret = 0;
 
 	/* We need to move the initrd down into directly mapped mem */
 	u64 relocated_ramdisk = memblock_phys_alloc_range(area_size, PAGE_SIZE, 0,
@@ -336,8 +335,7 @@ static void __init relocate_initrd(void)
 	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
 	       relocated_ramdisk, relocated_ramdisk + area_size - 1);
 
-	ret = copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size);
-	if (ret)
+	if (copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size))
 		panic("Copy RAMDISK failed\n");
 
 	printk(KERN_INFO "Move RAMDISK from [mem %#010llx-%#010llx] to"

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416196;
	b=BCUZYWtAyrXrl0MAF0OLGSpX0RW2POxJa+9H5VNsK8Ph+n1uZ+On4s9FqFyi82eNmGqJ
	 +MjbiVb66+BjzYSX+UXqC5mcEBlT51T89k8Ljuzj7/kNu+0qnmwSgFYa8SK/huFVe5HR4
	 jrWoVyuwOkRsVeRMlePKEhM4gee8suqx8IzqSiy6/N4+rO8ZPSh6NgzIvA6IK+F3TNWhd
	 PiJX4YQRUkpFiWa8f+G3vM2LU8Vyc7Izw0YqrXW7iZ0om7cNlo+QoH1LZDOmoY8jbF0ag
	 zP+6UkVJHrj0B2rBvAFhzcQB/GTMFizu8IAPH4ZGua08Fhuoi7i6grwU8Y3g/RRvUSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416196;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=CnTzvu8AcUJ2DYdwVX9DYr3Lazzwiub/CKb4VxPf5lQ=;
	b=l/JfQB/X+/yIa7jBzCXh0XFLLYSXyGHmY9r3NyG6IgVY4dTZquI+BZ01mjW6NhCUc1oG
	 ONc3lzu+myniVHmWPAR+W3ogQDqBQRG++95CJT2VqOdMVWEEos4CLC8uBZXBARL6Kzqoc
	 QBo7U+72FIEwuA/1TqAGcmFhai9ad8ZWZHwhSfz2Hn1hxPHr/yv5FmsdjK+2tVMfCaJsl
	 Hvrjs5LDNx4qS4rW8gPwOW+IVkvGbeVUXapR9aQjb5yDiE9SrAM39BKai5suc6kQX/eht
	 MG1HoV2IMxXdc5SM4z1gGJaU+jT5YQmHAzfMB0c4Ol++0zV5EuQ3aCaZZDCL5dxBe5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKa6D1eJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB037606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKa6D1eJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EF41F00A05;
	Wed, 11 Nov 2026 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416196;
	bh=CnTzvu8AcUJ2DYdwVX9DYr3Lazzwiub/CKb4VxPf5lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UKa6D1eJxW0vw72G7pS2O82p+qcL6rqph2S54acoM23nNhzGBAVDiDeFDD6z5UP3f
	 45en2w0e1nwRU55TLlJlXw42WRjgWaDZKVEXU+S0ZflvcLRrJxzZ6krJ6axXYXdDhI
	 VXxtIJTic88bnX4T7ZGpaTyn6EfusScxB7R22m49608M0h0+JsXbkkvcadg/WrTtgm
	 BSjL+4CvKW+pHMbWIj7ZEPEKLj9Ik4+qTi+qA5qajIF5tEcg+bTkW8OEBYdUaz34Mn
	 u1SXnnqHOXZ1bFkrtO3Qs+C6NzHL3FoWDZj1E9v8pudFnF7COTnpZm6a/R7SL5vure
	 d7Yw8iAssOgrA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <blum@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/3] x86/setup: Simplify copy error handling in relocate_initrd()
Date: Wed, 11 Nov 2026 17:56:09 +0100
Message-ID: <20261111165608.78688-5-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111165608.78688-4-blum@kernel.org>
References: <20261111165608.78688-4-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=blum@kernel.org; h=from:subject; bh=IhOpYPqD6P+okvuJ4c+5xvi+hxtopDXHBMTEDcfomtM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlf5mn943vw/sOjy5+OnFe+lDF77kMOzwjB88fvdt3dd VQzqjviQ0cpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMpOwbI8OEE+x8vyW+Pp2y OSRKdNHan8ZTlnWwFrZaJHH+FXZdn9fD8FcqZqaOoWhpv5BnYvj2Tc9SZv+eYnZissSGqTtnlPw 518cOAA==
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
index 4a6c54110e75..8f34bd61512e 100644
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

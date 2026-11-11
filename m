Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416191;
	b=Y9XB+CNKYV2sWPR72eAU1R7upTsapZuLmRJ5PXRtALYFM4iLqz19CjKOKgEWB39gyow1
	 FzGKAilvjkCmBwVsXfNNftLWtYB5MhTn6QhV2dju3MgzMXy/J0LpoFiGAVX5AriMu6/Mn
	 LwHOC4wSCdP1MFUD7CLXHjHpynyzWWKdkmnyJySElXH/OHHgOqDonSnCnRaQR/dseXidM
	 sruPdLIw0fOHoWagtvSX94GEf0W57izTBUJE5pUHOVGBkAsMHw85gMtiaZ8B9h1CEwCWF
	 2msCZ1kK9ZOg4BSZ9QrJy7CnYiS//FlvA4B2oT1WgvDYB2IROUnhXoK4bCUzbH1pWNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416191;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=xVY7vfRN/R/PS20TBiImFp0vXqYr+MHwIvsfiHLX4lE=;
	b=NVG+ucv6uvYzZDtMtP/AvxGBiy7sOkNRLGskh/B8Usk77JbRygh2wGXvDLgc68Ox4srg
	 rzj4U6xwF3nRXryV7r/nVXDNMUgAokP3bgjZmjaw3iOMxEwciN1jN3bjqg67NdWAMDrGj
	 PqZuKIdgWAeeO3XdiquOASQ+fIo/zvTVHRbRAKvm+zKtLZkYNq8kyAYSr31UjNDxkDTA7
	 j1Rf0H6C6Ts+kRv/INCVwXmtK2Zmo+biRAWEjJvQuBQ2r4hhn3shk5BjE2aY/AW0bJbew
	 fTjswaP+/cCmnfosoiEqLEoxx4tmht8HgbJo/6BXUO7PRBV2VeAgX2F9tc7NsCm0eMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENmMUbKz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50306606A882
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENmMUbKz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB131F00A05;
	Wed, 11 Nov 2026 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416191;
	bh=xVY7vfRN/R/PS20TBiImFp0vXqYr+MHwIvsfiHLX4lE=;
	h=From:To:Cc:Subject:Date;
	b=ENmMUbKzJpK0q6reDtpGnFnFiFufiMlx2RaZBY4yMdtH7cOHiUJ6FrphKKSd26/Bc
	 GGbVqyZKoLwlOmgk+RoWpUzaXVcLWQhGozjMGdLwI1+GTum4fQfHTfttVhilFXIcGp
	 06izbdKCuSUkh8CTYBpZ6VRTGoVz+YwP4w3aPSQVCyBZOZ0O9I4TigcdRR6l0NdFV4
	 jfzNv99de6ximAfcTQqFCod+hGgnOiqpL+ESluo6x30Cpk1dM1rZm5gALVX+QYDdh1
	 2YHZZnWXp34PHeMrdaD/XZeHJsMH1JWov95PvcsdcI8AOh+OWupf+sNpmcsA7kfJMe
	 ppIEGKSJCyjKA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <blum@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yinghai Lu <yinghai@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/3] x86/setup: Fix logged allocation range in relocate_initrd()
Date: Wed, 11 Nov 2026 17:56:08 +0100
Message-ID: <20261111165608.78688-4-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=blum@kernel.org; h=from:subject; bh=PSUNjiF4pBiurOJjoYMVpWSeFL3GSiyX4WpJCrANKoI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlf5mn0bjm8sb2/9V7iaYMJfXcnSpQIs77evbIl9b6Jq HzHYY+WjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjI7WBGhsn1G66fs/WO8Zis v/VZ8vwZy457tz/8EmGcfPrY1jSGt7sZ/gceibrZLyHjefzl7LYZqnM3prRLCHduesCyqPDM2gd xThwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since commit c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages
on page boundary"), relocate_initrd() allocates area_size bytes, which
is ramdisk_size rounded up to a page boundary. However, the log still
uses the potentially smaller ramdisk_size to calculate the end of the
allocated range and can report it as too short.

Use area_size instead.

Fixes: c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages on page boundary")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 19fc8e1714e6..4a6c54110e75 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -334,7 +334,7 @@ static void __init relocate_initrd(void)
 	initrd_start = relocated_ramdisk + PAGE_OFFSET;
 	initrd_end   = initrd_start + ramdisk_size;
 	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
-	       relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
+	       relocated_ramdisk, relocated_ramdisk + area_size - 1);
 
 	ret = copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size);
 	if (ret)

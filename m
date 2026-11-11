Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416202;
	b=Kzob/6YEBb5eYQRozu2bNTshor+fnWKHZlMxzhosAIyoZ0WoaQJJ5rugK2znyQrQzo9P
	 e5CNhoURWINmYQbKn2oqxBUCgwGIMNSf7IHwdyhea1vXfHQ1oYIsBFnkCoH+raHUmscdt
	 EeSJvhrZfv6M67ruv0bh60J83Ub5JOAHoqbhaaQ6yo0zRcYCYrIIKCXbtrsR58LUyKVa3
	 ddfkq2v9xOTlF2VrSAk74RqHcHANI4UU6GYhXk6z+vUvcCLiqYORoZzQFa4H4Fhsn2GQb
	 WchXaoITcVpMOikNygcPSqj2/Z5LfxEpD3Ub8p0WZCJJ9QoyRVcg8Qy71DHasOAGkUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416202;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=XcUgMCK/dKDdxJd/k/XmNcnLORu1ikaNoqprmvqOtRI=;
	b=kTwPT9cjHmPQij6zlADVAXt6HWD7GM3H21PWRmKvVf9r6raCSSgLSjcblNA/SRFY8R7+
	 TZKRqtBaiJdW51EuqgpCPv7d8cVWaSm8A+Swjfoy2bHCen4xvx1d++oMS4lhKzDh3U55H
	 bwQDEyCbG2ju8G5k829SvEsmAdjZIe5qNVrFLWhvNWHJBlkvudbUqKmvUm0sNIj/9l+Sh
	 F5TDmmE2AgrX3efoQK0U1vJPmsDkXgNBolmzY5QZhCg4jGRuPNtt2lqCY0XSBwvEnWW8e
	 4jaIoMUBQzte0YVeauECLcNwHqnfYJezH8RtC7rS8vJhwKklBlmxgwIj9lXyJWiIiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUfzJWZH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D2606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TUfzJWZH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EAA1F00A07;
	Wed, 11 Nov 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416202;
	bh=XcUgMCK/dKDdxJd/k/XmNcnLORu1ikaNoqprmvqOtRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TUfzJWZH0lKrZnywYbd+q/4D/+ZPI7IsenzHCs616oHGw4hejvyy/vg85QON+Nl6v
	 3dhrSSEM8uGrUAPMKFDytI4pMSAaSwR8ttqkGyRlYQXWVPnIO/wbT1ONBzw4ZSyejk
	 uI5a5T9Lx/YyvdAvwOvLi13/rHjFlF8tf+Zsaqwa+epsDu2flWpM4m2ZChgDo3nDH9
	 pfnqMUi7uVtuufUrkkVPKypsnmaK7ed63aCJwgDkR7DCOycCSbT0jMMHkhZ4aNMkcd
	 9S4UA4jbnLgRbnGaGbT2fJPv2114CGfZRqpgK+MNBNhnie/XavLEq7C1gTeU9duDyR
	 tnzYa3NGHAZZA==
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
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <blum@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/3] x86/setup: Use pr_info() in relocate_initrd()
Date: Wed, 11 Nov 2026 17:56:10 +0100
Message-ID: <20261111165608.78688-6-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=blum@kernel.org; h=from:subject; bh=gM9lxZ8NDrqab/gTNey6A3nG/HuhDw2zkZa/daSwNAE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlf5umwWNyetNi56ZVAwbkLEnkv5xoIvWtje1UkvdjzT +Ripv3VHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRqjJGhqmrD7a/jy//4Rm/ s0FyWeuvOyI83n4RPxLcb8xbGc/Gr8XIsCnpRUacYz+38nwRObuYr/2p+VFOZ8Qv3BP8sEvjmuQ GfgA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use pr_info() instead of printk(KERN_INFO) as suggested by checkpatch.

Also change "Move" to "Moved" to match the past tense of "Allocated".

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 8f34bd61512e..91acec0ff252 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -332,14 +332,13 @@ static void __init relocate_initrd(void)
 
 	initrd_start = relocated_ramdisk + PAGE_OFFSET;
 	initrd_end   = initrd_start + ramdisk_size;
-	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
-	       relocated_ramdisk, relocated_ramdisk + area_size - 1);
+	pr_info("Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
+		relocated_ramdisk, relocated_ramdisk + area_size - 1);
 
 	if (copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size))
 		panic("Copy RAMDISK failed\n");
 
-	printk(KERN_INFO "Move RAMDISK from [mem %#010llx-%#010llx] to"
-		" [mem %#010llx-%#010llx]\n",
+	pr_info("Moved RAMDISK from [mem %#010llx-%#010llx] to [mem %#010llx-%#010llx]\n",
 		ramdisk_image, ramdisk_image + ramdisk_size - 1,
 		relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
 }

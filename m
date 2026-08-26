Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BA371067
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767942; cv=none; b=aNoieCHIAh2Il0HIe0BdidGNHNbpvXyUA2TJL6xz1SL23xgBAzTGLTp0uR+LMHMudde2tdab13fzJNa6hTtBDLQiiPsk8f55qxSlMlz8SBHCXc4mAqzsQPgxJ1UZ4Ml74qwbZRjOJbx5T4/3yKeMqTugs4JvhSYlyDhFAj4OU3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767942; c=relaxed/simple;
	bh=Y+CzIEPveVqxmS/HUSdPJC+8aBV8XbIiCTZIUmDJIuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCvadLPGI24pgYc2BRFq+iUzeLCIavMA/diivX4OvKsmFcKGiBZnYM5qqwmeo/r1TkHDEi3xPDI56BQBSnmLAgplIIEXCtbkpPfkG3o3FTptqKXRWOG6zYgX8oDEDoBKNrNQEEW/HKfrgesIxXyN/iyzmfajgF6LIyHMzxujbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZB7TqvM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZB7TqvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570C61F00A3D;
	Wed, 26 Aug 2026 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787767916;
	bh=Grbp3NyYej0As3lMFEO6XGZiBg7oeDljZ55s/ymYcqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JZB7TqvMt7BOwkWrr05zuXj6I16llIcebehJuZQ5h3mVpe8KDxFd2gZIcxuFzsW7v
	 j/2JksMZb4rqH3XFzf+en1haSJ8qjRjEd5/qpZOGk9xAzOvR/1hOoSQnwjOTsSSNrG
	 LATUb6Z270zJ09L6Om2Lk/3dsAWzqT4e9VepW0UW9HmI11+ZGk23+8n+6uB3Le59Oi
	 kD1OBmHGF5BiCxiNPFKWu4wDmR0g2kXVDu6nNsN/oVUjZ+mpoxwe++581faVe+bk0I
	 CUplp0ZJpuqvu3P6cnJNEhI1EoGqM98ytqlc8vIISCsDmJNCEvKq4Ip5NYFy+e1q9e
	 LGihBnrdb8/cg==
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
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Breno Leitao <leitao@debian.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] x86/setup: Use pr_info() in relocate_initrd()
Date: Wed, 26 Aug 2026 20:10:02 +0200
Message-ID: <20260826181002.12316-6-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826181002.12316-4-blum@kernel.org>
References: <20260826181002.12316-4-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=blum@kernel.org; h=from:subject; bh=Y+CzIEPveVqxmS/HUSdPJC+8aBV8XbIiCTZIUmDJIuM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFn9OrrxWs7n47L2m+5KMw+8JHpBm/kyk86eoJ1ytUGxR 2O3XX7dUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABNx7GRkuFATGlZx/PDqjecm Z8snvNtw5ffhI30nt16Ydd9Ewt/smw3Df4+ozyuY+zPUN6y9Yf/rvdJl0//mCul3Z9ZeEV65ccF sdg4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use pr_info() instead of printk(KERN_INFO) as suggested by checkpatch.

Also change "Move" to "Moved" to match the past tense of "Allocated".

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index fa1a7c29285e..d78fef974f56 100644
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

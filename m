Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030963A0B24
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741674; cv=none; b=SjhScVWyugLkKkf+1bNbUBGo42RTsjPORIaq7RG6b0FDEH+YY0KPcZUAZ+Nfpjg2n+DAGZdLDHImk7rcYG6pIbvamyuXUwXs+TmoRczYzF+MG6hBzxnCm0Sat9YS3+ehJOQjiPb5VKej7nIUStCB7rq6uv/mGfCjh8EaW7oP10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741674; c=relaxed/simple;
	bh=X2z9VxWmE+hVom4bbLgSuviHhtfixFVVicUyJs9E0GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYqLaEkcLbj79QZObpiesp2S37oQWWVeqMuOxPbppsflPoejPL9fWmwGXkX1E0U7iGWy0BPmir6aYp6AeTPTI3dMQ49Yil3ZrobhHSKJ7tG4VtK86LyZ8ffdxEYS3jQ+oJ/koXWFw71WoYTWOdl+HyNendOZi856yDznVWCEHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCXD52Iw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCXD52Iw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2935D1F000FF;
	Fri, 18 Sep 2026 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741672;
	bh=QojWL5JBzbtNUpkaDGTjTHfCR4jDkyNZwFsYnsvsQzc=;
	h=From:To:Cc:Subject:Date;
	b=SCXD52IwPFrraf5mqCkwzXGekO+Vwy3Sm8KVHw2xF0yQ9KKOkBucMzgWzbipPuw2q
	 Aj/BCvGkyAFcPtoxh9OmLC783NwzyWuddlmO2C00vHSw+3iksSB66J5jLFZJXoBY8F
	 /SnIV4LzyaKA1woPnY0yUbor0L35DreqntF1OuOmfQyEVdT78Ynl6snzwNXcbdUlaB
	 bhJ5Ig9PRlCGH8M5F1Q8mp7/zomJH7TXdtdCwAfkyx94FthXUTv5j5rxLbpy2HKksC
	 5ZJQJUWa+6R++wYU3dvt++qso3ZcxirySpdt1Zj7r74sPCkLvAIVU7UrfUGNfNkARo
	 xr1Yo4U9TYf3w==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] x86/boot: Fix off-by-one error in sme_clear_pgd()
Date: Fri, 18 Sep 2026 16:27:13 +0200
Message-ID: <20260918142714.242711-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=blum@kernel.org; h=from:subject; bh=X2z9VxWmE+hVom4bbLgSuviHhtfixFVVicUyJs9E0GI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlrvZzkU6tPfArdV5/45oHY5mzmGwlr9It163rKDZV0w +etZrnUUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABNJXc7wv86D80/snB/vCnhK GJSXhyZfqrPmyWH+MrOkx1rlV9XVfYwMa+ZvFN2iIq55sPOsbWBunc+0lWIKM9c9j/+fKvFfdQE fKwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The mapping helpers __sme_map_range_pmd() and __sme_map_range_pte(), and
therefore sme_encrypt_kernel(), use exclusive end addresses and stop
before vaddr reaches vaddr_end.

However, sme_clear_pgd() treats vaddr_end as inclusive when calculating
the last PGD entry to clear. If vaddr_end is PGD-aligned, the first PGD
entry outside the range is cleared too.

Use vaddr_end - 1 to calculate the last PGD entry within the range.

Fixes: 6ebcb060713f ("x86/mm: Add support to encrypt the kernel in-place")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/startup/sme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index c07a2c381ed1..2d5cb3f7eee6 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -99,7 +99,7 @@ static void __init sme_clear_pgd(struct sme_populate_pgd_data *ppd)
 	pgd_t *pgd_p;
 
 	pgd_start = ppd->vaddr & PGDIR_MASK;
-	pgd_end = ppd->vaddr_end & PGDIR_MASK;
+	pgd_end = (ppd->vaddr_end - 1) & PGDIR_MASK;
 
 	pgd_size = (((pgd_end - pgd_start) / PGDIR_SIZE) + 1) * sizeof(pgd_t);
 

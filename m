Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B834EEEE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048451; cv=none; b=dGwqzup/1Pxi1L94D3z3X+Ldj6ZJJBtQrJrE8plISus61li8xb6Fz7B3pZrNcnqhFmd7FSlfexUbYM84LVYcyDTRyALY763CvSXefuyZrV2Ig4cmuL/i2vGB2cBzgeYh8d9tD2NQYTnhNTnKwdBk8GPHZj/trFY9C/lQp22VGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048451; c=relaxed/simple;
	bh=Pc7559Ay0oPivlYgMSEO05noCpMOYyrNO5XdB54ryyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hcmRDeARpp3kB8h6zOatlmTwYj2i3Vd2qXfzCjwZZmEKmI9Ld9ee5IdS1sH4xTlIXvIGav4bjqQtAPNZCiZjbyXLkCs5j+dOwCNeb1+uIdQ0ijnS5dWmUuDiPI7el37ZM0/tHkm+n4uE/DTUllsujF86yoTUmibp5D7pPT/Gysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=aoWVN1ds; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="aoWVN1ds"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=FS/FALPUjabMB7pEZn3N2o0m3+yBNogJAw0/WPnz1HE=; b=aoWVN1dsMBN1eM9ZuHzrKvA8px
	BHA4v6j6ntywHm8B+gFZ4SkNTGaq4iaBjmX9OfA0R6NbbP32NQEfX+zxcY/P2GeCRI92lIH8REJal
	RY6fSBZKtFog5CTy9PpVlw15htkzpDmwKhztqYBlmoGkwmuwbVTJHfnnotJ4UzBowuyyk68WQrlRr
	Bpvft/dCFhCSQB38sYS2hSx4+t0uUSceE+r1HhSzNNMBrw8zZtZ0PeSsS9I2uq3RcsH6cf4qItVVC
	gIf4AlLLGRX7irpEps9s2f3ouA3AqgeejqMJuZnrhXSQ3yEoG2Z89+NWvqTzR7t7Fa5kWHCe/UNOd
	kWUxCbXg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4fDy-000YaT-2o;
	Thu, 10 Sep 2026 13:53:59 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 06:53:27 -0700
Subject: [PATCH] arm64: hibernate: clone only the linear map that exists at
 runtime
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
X-B4-Tracking: v=1; b=H4sIAFa2omoC/x3MQQ6CMBAF0KtM/ppJ2loRexXCospUZmExU0JMC
 Hc38R3gHWhiKg2JDpjs2nStSOQ7wnPJ9SWsMxIhuNC7u3ec7d1HXvQhVvMmvOdr4HK7DDJL8DE
 WdISPSdHvvx2n8/wBXMtu7GYAAAA=
X-Change-ID: 20260910-arm64-hibernate-va52-f738ede2144f
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=leitao@debian.org;
 h=from:subject:message-id; bh=Pc7559Ay0oPivlYgMSEO05noCpMOYyrNO5XdB54ryyQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorZzIH+ECtYHS/zmVZm8rjGbjNEHlz7+gpTLf
 fmWcGEH5JSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK2cwAKCRA1o5Of/Hh3
 bUzDD/4ginBBzwJ5sRDi8kVuONdKL6KTOEF8XDDWEGRok3npdYvd7Yk7BJmitEKfrGQ74OF9V8J
 lJDD5VVC3ROcaEO4EjBAWDw6C9e021qVtayxbAQ0uPRz+ir5kEDF0stnNMGXk18xrdi+F4x2OYU
 bvUlCNyJ5AupBwNVXHuUT6+nLYLWy8Q3xyG9zDR8E6Sx2JjKAEBlEHuSZSfxRJSl7TejdpAixG2
 opDvyAGf7sn8aj5z86o4slJGXAjmCUZnK5lLioNI54GvnPe46KIqkUg1/51VqeFWn4g2A+R8f57
 Jg4hhkQDc+Kb8ElQjmXWDm/zKR5DsHLOSy6jnyyF/c9QVmVxmmofEXMxUYvjnypKKplqebv/5xN
 SP1q2v4aSHjkzPtVBfdE/rCgNNQoK4nzxbT28lhdqa1JZE22/ys2j961+NErEDx9kvUVz+M7t+8
 E2VtI+Q/Z39VokD57SF117IrKiXweWqIvI7FuNvqRbzcGrMOjM340G3fEPBaTea0IAaykwcI8XF
 l3H434B/oSrGiKVpapn650cW7qbvcEqlpuAIszJfxqMp1UK2lUSXGY5lV2hYdDfnTgOj8qTnz5m
 shJxcvmiIz//FYcMgh2c6wQ/jwXTnlJa90zIfWrnxWqARM4f2exQhcPbssdh6jRchZiB/GyICV8
 SMk8BQE4LSevfbg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
the linear map that exists at runtime"), but in a different place.

swsusp_arch_resume() clones the kernel linear map with
trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
level is folded -- hands the walk a 3.9PB window while its linear map
only spans the top 128TB.

On a VA_BITS_52 4k kernel with CONFIG_KASAN_GENERIC in a 4GB VM, I see:

  swapper/0: page allocation failure: order:0, mode:0x920(GFP_ATOMIC|__GFP_ZERO)
   hibernate_page_alloc+0x10/0x1c
   swsusp_arch_resume+0x70/0x320
   hibernation_restore+0xa4/0x138
   software_resume+0x15c/0x270
  PM: hibernation: Failed to load image, recovering.
  PM: hibernation: resume failed (-12)

Fix it by copying the linear map that is the actual one, not the
compiled one.

Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/hibernate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf1174277772e..424291c547f02a 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -423,8 +423,8 @@ int __nocfi swsusp_arch_resume(void)
 	 * Create a second copy of just the linear map, and use this when
 	 * restoring.
 	 */
-	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir, PAGE_OFFSET,
-				   PAGE_END);
+	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir,
+				   _PAGE_OFFSET(vabits_actual), PAGE_END);
 	if (rc)
 		return rc;
 

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-arm64-hibernate-va52-f738ede2144f

Best regards,
--  
Breno Leitao <leitao@debian.org>


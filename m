Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501107;
	b=AGQlUuxmPC2oBit/wBBvS8urbGgqZ6/AIsL2QWpeNZr3qyzSqwWLHsLbiapQbG00oY8N
	 EWGgOx/o1sJPJSgWkE73A+YSkoE9kCPcjldsTDnk1Ejg+tHCViK1ngou9ABQ/d9PMas+l
	 2DKZ9f7E3ijrTq8Fr8R235ug88DUJpcOCpRogpZt9RylDAw69aQrFPsiTE5j5M/XdWGQQ
	 EXb9ptkK5PKM6q+a1C/mm3dJz1mZ/AUo4ZVpfHEC6VH8qdWeC7RzsPlsMAj9oRxi3orOf
	 p680MgiBmuho7YRfKImnWpitwzhol8AA32ZsCgkjfuYuE7U3UUZ1wf13dQplo/rhxvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501107;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=V4Q7NirvgytFZQoGTBg+9sIZVXOQJKp8+0tYRNVNq0g=;
	b=TErW9gRG9y1V6YFbhSiURnZjQqIdiDE9kGFCMiLUwxE57g2vFXLFpjUXezdjhyHC6q3D
	 N0C/dsavRyf2yfCECOlPafqFeLtktGJe30yKa9GVBuvm29wgfKoNkVmTda0uGz8gbRb85
	 bdUC5s/umFZ0oFHZzfibDO/jFZwRwdrJX0yyE4lzJiJTiROpMhxxs9aAK93Ll8GiNZWiH
	 lqgzXARHWLV7jLeucxhDefmrspOzW0X1Ikcc68z4oMzNPDfBpIUvscE5vl2nkQeTCNJp5
	 VR9bOmkUTukLdZz90l87ZZoBFTNXwahlhvFtRBIN8lKX9iTt64ZU+Y+r5gU9h6ixmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5xy3ySi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D23606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5xy3ySi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A001F000C9;
	Thu, 12 Nov 2026 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501107;
	bh=V4Q7NirvgytFZQoGTBg+9sIZVXOQJKp8+0tYRNVNq0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P5xy3ySieOoYw6H5P59/xflg+Gx7hDYsE3FVwouyO2pgFMxoCHqNf0bWIhyg57vuz
	 hUZEKsAu5A07jU6XpTbaH28rArqHXeas4t20ZQAbJkwD7Bg/qOzw0ezoecl4xtZrxT
	 C03/PvZjVuRX7/wZncK/tZ/FcUmAPqAAxE6pJpj0Mtwl5fprRwgAzhaAJz0NVPK6jq
	 bAMzDdLhxTavuG5VCShM+EBiG4010n8CQVBe9Cv3nNTji24AuRoHjWAx4E6wblUjH2
	 faY6mSqM0yAuKXXuBs2GDuWGAxOlBa93pq58FDpc1J5ai5p29WBgKDOahxfg0pH7Nd
	 wggpVLqhox/Hg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 18:31:14 +0200
Subject: [PATCH 9/9] x86/mm/pat: use cpa_flush() on CPA errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-fixes-x86-v1-9-791adb8d6670@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 x86@kernel.org
Cc: Mike Rapoport <rppt@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev

When __change_page_attr_set_clr() fails, change_page_attr_set_clr()
calls cpa_flush_all() instead of cpa_flush(). The flush depends on the
error code rather than on what CPA changed.

Force a flush of the entire TLB on error and always call cpa_flush().

The TLB flush stays the same. When cache attributes change and the CPU
supports CLFLUSH, the requested range is flushed with clflush instead
of wbinvd on all CPUs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 80b5a2faefd7c..2ff37ff1cecdc 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2152,13 +2152,14 @@ static int change_page_attr_set_clr(unsigned long addr, int numpages,
 	/*
 	 * On error; flush everything to be sure.
 	 */
-	if (ret) {
-		cpa_flush_all(cache);
-		goto out;
-	}
+	if (ret)
+		cpa.force_flush_all = 1;
 
 	cpa_flush(&cpa, cache);
 
+	if (ret)
+		goto out;
+
 	if (!(cpa.flags & CPA_COLLAPSE))
 		goto out;
 

-- 
2.53.0


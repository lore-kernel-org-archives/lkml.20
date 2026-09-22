Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B7367281
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040977; cv=none; b=YkTjlPQtOLIHdg9a1elZy6DU5cX2NBI9UryIRuGYUYH2DysodYvqzFqrrV8QIx8KENYsuq77hVNh353u3wOjNuHVY8eneARKK+4mHljNsml5ew6CZ6l/SYCuSm2DNOWG4lW9iADZIr/WKSM/FP2LmUn9eWRUFSnM4zlxvCinLYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040977; c=relaxed/simple;
	bh=3pQhyUHhZ5ongcsuf1OXS70a+7ZXbEBB0BXBVEfBvZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OggBV52jQQhg9hSkfkU4YwIdeBG0ZlGyyjhRwQmkKxeEXUj3MxRczMCD0l5Rjc38ZgFPt+ZvAstl5y1cyqflqR1yFXsOdBZkENsl78+ihd8wBBJXMUUYtzttR46nkfoTGXuT4xy31wGaSu4A9pTD/LYyc4bivD2RXYfojCmc9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CrVUaQ0+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CrVUaQ0+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=wN61/NMUXl8+9R6hcjMozN8cH7kE8ssen0RwmNOyhaw=; b=CrVUaQ0+B87GdmscCHTnNP8VEF
	+qdlqxIhIySV9oSq9UbjJGCumPJ4KKHHlB77hnREOlp4czDEjNMYy24Y8eXEYPYbFVWGU6Bhe0r0O
	eXI8EUm+awT/31kIviX4jw87FCtRKUq778TW4GMw0jRNAZLCOHqn0gTxh+XpWo4tJSrA+Slu7zKmC
	InK+jrO8tkCBmcldBgv2KVpZ+FZVjbX9sOjWOzQMMBxPVV2inqpbQkrbofSozJ02mGnD81wWTKoKP
	KXESrL2cNTaAqNgrS5nzkqoKQAjJX+CM0yU2BvoMvGPj+OQAM6lwOFbYgPnb/Frw8FROzTo2IhQIH
	nvRatv2w==;
Received: from 186-249-150-130.shared.desktop.com.br ([186.249.150.130] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8pQV-005NkF-4j; Tue, 22 Sep 2026 03:36:07 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 21 Sep 2026 22:36:32 -0300
Subject: [PATCH v10 1/4] x86/boot: comment out and document redundant "cc"
 clobber in memcmp()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-pvh-kasan-inline-v10-1-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

The "cc" clobber remains recognized for source compatibility, but it has
no meaning anymore; it is automatically generated without condition-code
constraints (explanation in [1]; related code in gcc [2] and clang [3]).

Comment out the redundant "cc" clobber for documentation purposes.

Reported-by: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/all/5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com/
Link: https://lore.kernel.org/all/57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de/ [1]
Link: https://github.com/gcc-mirror/gcc/blob/78d4ac73dd391005b895a6148cd9831e28e1208b/gcc/config/i386/i386.cc#L25355-L25363 [2]
Link: https://github.com/llvm/llvm-project/blob/6dfe1677ab8dffbc6ec13d53a1e0215d75147689/clang/lib/Basic/Targets/X86.h#L299-L301 [3]
Fixes: a8c171c107c0 ("x86/boot: Add volatile, clobbers and zero-length test in memcmp()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 arch/x86/boot/string.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index 1632d40e1f545ae0665597069b568ea6b6c263e5..e10260ed58b69fc734a4e63f15785a643f414441 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -36,11 +36,15 @@ int memcmp(const void *s1, const void *s2, size_t len)
 	/*
 	 * Make sure ZF is properly set in the len==0 case because in it,
 	 * RCX==0 and the REPE; CMPSB won't get executed.
+	 *
+	 * The "cc" clobber has no meaning anymore, just source compatibility.
+	 * On x86 the flag status bits are automatically added to the clobber
+	 * set when there are no =@ccXY constraints. Keep it as documentation.
 	 */
 	asm volatile("test %3, %3\n\t"
 		     "repe cmpsb"
 		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : "cc", "memory");
+		     : : /* "cc", */ "memory");
 	return diff;
 }
 

-- 
2.47.3


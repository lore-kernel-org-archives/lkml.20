Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7C37C0EC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265413; cv=none; b=DVEacxgK4fRS5T9fbr0FLn3ChspdChoegqKfkB53OwdxN6E17x53fvCMNkJs6u+g2abXDdBkGYU+DyNBasbLS6XV8YF2fNtSueW4ZkHT+suIISJQT2f/9Q4oDWZbdseRlaqi86OSRPXZ22aJsbN4SByH0lYtiaeGIF/xHJoH/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265413; c=relaxed/simple;
	bh=4P7rUUuIR7xsSQEmQNddgzMeQSvUB6RPQnnAfBU9ibY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=l1NOOFVtXVw6kWqChRZfaK0JykJtdLpyCNehSu+VDtBp2Z0Wna1ErDj/ZDnxgA9N02EFS2P0wtT2rM6F8Vdjmuayf+uOayFhYe0JT1vA1kkmeXlBmwfs57zboGhbql18DS/c5G8twbd5TGM09D4QnY6vqKANCwTgEo6w9w/Anak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vGcYlV2b; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vGcYlV2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791265405; bh=RhT+Xn+tDPpU6FbPwCjwNTRHH7v+/Y9iSfR/+4+YTkc=;
	h=From:To:Cc:Subject:Date;
	b=vGcYlV2bfSbzCUZ57U0BztGD+fiNCeZmwpxmtb+0BjTdETUdmpAtV9pxiIo8JFMSh
	 TCuikQHJs/K8IkfXSuxx3wBLR+kp9HTj6ayjENcGpkNeQaTAaqtIJ9DVzyChefD4y/
	 EO7IuQlLQ9zwC3b4AKiTEmDCRtB6t41ROPOG+q1Q=
Received: from localhost.localdomain ([124.90.15.213])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A6583A84; Tue, 06 Oct 2026 13:41:37 +0800
X-QQ-mid: xmsmtpt1791265297t4f7qfc91
Message-ID: <tencent_FFB850BF5E1E8DE5006C89BE938093D4BB0A@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQlw4QwrlSJamyNGR8U2+7KKHN6yK2944bpDGHVXDD1wbV4XoyJou
	 OLVyxWoB402PEMxD1AKZrZ+4pYXbWRVKo+JCm+szgewEs6m2k1HLIlQ71xBswfzWktwT1roocABZ
	 qgj0XO19QrJdp90JiG4LQAi0Y0nq+O4oWCERPmrvol1q3VLkF7tK7wkyDr2mnia6Y8MTzZTWY1RO
	 Cdkp0mi2fdZuchWR3ANW4vdD7KBrlwUqWPFC2M71yxLs7y6ImpH1/WUXFM6u7b78tBf7E08nSrqe
	 dsMSVK01YooGA4tlsL86x/XWilypaNiOT3NgcgEKBJR7sunYlZ0KhAtuIAyfS5YKOr2YkeM23lhG
	 1vfPbHY0a7dM/9/lFgNdeQoxFqW8DGW8dEi6gu2hIt9YkEcEXDz9Ks+QdTjEtTW8l79KLqCb3Khs
	 DAdDHJbQPUSoVHBS6QCdQsP6UT2blni93Y+yZXqHYKBvy7bfkBcyOZE5TBcpusKiI8eWvbsFHzol
	 zkhrGG88CaF2+54mP1KtDzreFUKt2oowf4sHWo/na6CrjugjR/ICwdQAK8frXkRb1dPLp7PRvsLE
	 lOAYFZdrlk5MsToMaZ3TaSPU5TlBFIT3BnnZAwktgT2m5kZYkvPgZyF9JEtRVmyapN9Rn3QONQbg
	 FJVQvxW0Pwb+/RhZxWRCP1D66/R9n+FliuApyi4ud2pJB0l3plbK7cueVnzpv5eb7MQdFbnXSq6Z
	 7t3G79CzJjO+R5a+qFXh6RygFsmMqtcdQHi5LBNwtGxf7REi930Gx9C0eR54VbrSY6vnC+EddwfJ
	 DkVgctGbvscvdm6uN1rD9E0K/rlqTBYq1laMLI9gK8WP4h8/wIzX0VPqVhcP8MbUT2EDnXEWNTh8
	 wf5E3+rlGELSQfClilJcbwimO77hSg+LSLLfpkFIXa23WWbSRKwFHXGfD/osuXRew4azB94nPJhX
	 eC/dP2mSGk8XQvHJPpAfGOOOuZOD1BTaurijvGhzBicz0+ibgcxo3ZgYBw4Wjt+/EyzZDMx5WaIk
	 zzZMqpDslIttTZkTE2xrxDzU7C8t/296yvSeO+uA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Hui Wei <2935553232@qq.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Hui Wei <2935553232@qq.com>
Subject: [PATCH] x86/mm: Fix typo in pud_free_pmd_page() comment
Date: Tue,  6 Oct 2026 13:41:13 +0800
X-OQ-MSGID: <20261006054113.39522-1-2935553232@qq.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"poitner" should be "pointer".

Assisted-by: LLM
Signed-off-by: Hui Wei <2935553232@qq.com>
---
 arch/x86/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 4a105f283..f134e9e06 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -706,7 +706,7 @@ int pmd_clear_huge(pmd_t *pmd)
 
 #ifdef CONFIG_X86_64
 /*
- * Given a PUD poitner, detach and free the pointed-to
+ * Given a PUD pointer, detach and free the pointed-to
  * PMD page and any PTE page children. The entire range
  * under the PUD must not have any valid translations
  * and the TLB must have already been flushed.
-- 
2.50.1 (Apple Git-155)


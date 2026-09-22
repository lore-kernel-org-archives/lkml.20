Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2C539780;
	Tue, 22 Sep 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075496; cv=none; b=ANIPLqlyu3UQAL677NYrUbre1amdCeaQ7epX0tZWXPH4P3aSJyPYO/aOAawDPPg8sd13eRHOE990HLUWzGw1TvLIavb5g7SKrd2gIVJ5/MIOWcagTm8QO5S6otb4G5YNOoMWjCQ6s8r4eZ3iHoTpEsY/WcNxD6gUUxLkAZCzpmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075496; c=relaxed/simple;
	bh=5S6MUznLH75Jss5kdf0PUS+wJu4hxhEgCLybtSZMQwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qk4YSelkF6FlGCupxPthYQxdeajRXM7g/sFgn8VTWW0s4wz9JwYlbRG+7a3NJmAaKPUZGOa4bGcR/qN1eiTMKwO6NvVQAC3+ST/1rPVQ0a3nt6TYtXbMHuxqrhHb4opqgtDhbUjfDfSvFaUnTA39jVGVMUEHIN4JIct5E7WaXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=TRIwI8Cc; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="TRIwI8Cc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=qA7dfiffc1SQrgx0PMDdq80QiWLJs4sQqoBp176OMyQ=; b=TRIwI8CcUYcHPG/ITbh8DLM1z7
	ccvTVaSKARlBscj61y2mRdUNiAO6bau7a5MJQ2bB+JB0yI+Pb41yb2+vhVeajZWaVb9LTsed7Zl6n
	j4CUKtAQiTgpg13B3ixpgEhnfAHzu77Akq3VhSEcngWNp99tIMcpc9E2Hrb99NVAuoqwhquBw3yRs
	hWbSsM1GKdhLpEORHUlqKNzNE/lt5jHcbG6H75mytvXANn10Eeg7MMa3gqhV+lHLhw5rSDyoctGqF
	6ewm8slKEC3SnJtf9BSTwLA6TqD20MMX0p3G0uDU3EixGvdz1W0mXQtPkWsyXjv6jYPBPZiqrI7hZ
	yuxI8phQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8yPL-002wIp-1V;
	Tue, 22 Sep 2026 11:11:31 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 22 Sep 2026 04:11:08 -0700
Subject: [PATCH 1/2] x86/mce: Spell the long long conversions in
 __print_mce() as %llx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-mce-print-v1-1-500205689e54@debian.org>
References: <20260922-b4-mce-print-v1-0-500205689e54@debian.org>
In-Reply-To: <20260922-b4-mce-print-v1-0-500205689e54@debian.org>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557; i=leitao@debian.org;
 h=from:subject:message-id; bh=5S6MUznLH75Jss5kdf0PUS+wJu4hxhEgCLybtSZMQwc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsmJb34TybzhSalKZ+SoKULGkbWQGT0cvSiR+P
 2Xw9Xn+yDaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarJiWwAKCRA1o5Of/Hh3
 bQLqD/95Dd3UTR8IToNKFUbcZwwiLMN3sMtZEyN0YepQqAMIzkFnFJYzx/xnB5ExGk2JzP5/7oA
 1kcN3F+P/T5Tse2jBsnVdn+hUq08zoHFor/HoMkUYkibSpvjOeKR+L1oaDx0fRAaZ1PfI8y4Jcv
 8V9TUNZHUcy28TpEmo7Mg+37DgujiWC9WdYIz1YTd5NojfcTlojOBEeSE/+gAtX197U7BctyAzJ
 PfxKIJSKdSkF9PlKpRlZuUOmglE+nYm79EwXvUCnjePx8Ebom8T5DKY+iYHeDUThP6bMRnDqL5O
 aEOcVWnls8N8ES/sOfVJYOspIqU3nhnfpuraYszzBgZlZKJoofPUP0GdjiqkA0mHGSgbptdFQsG
 rQscAaBXr/lLzfoBC+24zZ6HxCiC3nm0sLesgV6vsAhY6HbRw6/ehjdDJpR1iiFq4X1DnC1ZoKY
 wOlD3MH/xu2bSNAXtOD2NFvrj+PyA5/J5G9YSVqaQt/lq/xhRlLVEW9MWwPxAPT8TwKisw74zqF
 ZPkTpVgBxLTt7Sf7zS18sq5mroVS9djfHBQYr4FMrQn0phgEs8uliwTQ28VUkCKWSb9ANzBWbMr
 ZxGDIFtxgVAGLQxtbfMpbIrCIDswemaKVu7u+HMJJrEQLMjYfCL+zsnXMnmm4x87p60OefRXosh
 hkWsyysNikrqbJQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

__print_mce() mixes %Lx and %llx for the same u64 fields. Kernel
vsnprintf() treats the two identically, format_decode() maps both to
sizeof(long long):

	['l'] = { 0, sizeof(long), sizeof(long long) },
	['L'] = { 0, sizeof(long long) },

but checkpatch flags %Lx, and the rest of the function already uses
%llx. Use %llx throughout, and while touching the RIP call, align its
continuation lines with the open parenthesis.

No change to the printed output.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/kernel/cpu/mce/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 9bba1e2f03af7..4b457c6bed8f5 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -177,15 +177,15 @@ static void __print_mce(struct mce_hw_err *err)
 {
 	struct mce *m = &err->m;
 
-	pr_emerg(HW_ERR "CPU %d: Machine Check%s: %Lx Bank %d: %016Lx\n",
+	pr_emerg(HW_ERR "CPU %d: Machine Check%s: %llx Bank %d: %016llx\n",
 		 m->extcpu,
 		 (m->mcgstatus & MCG_STATUS_MCIP ? " Exception" : ""),
 		 m->mcgstatus, m->bank, m->status);
 
 	if (m->ip) {
-		pr_emerg(HW_ERR "RIP%s %02x:<%016Lx> ",
-			!(m->mcgstatus & MCG_STATUS_EIPV) ? " !INEXACT!" : "",
-			m->cs, m->ip);
+		pr_emerg(HW_ERR "RIP%s %02x:<%016llx> ",
+			 !(m->mcgstatus & MCG_STATUS_EIPV) ? " !INEXACT!" : "",
+			 m->cs, m->ip);
 
 		if (m->cs == __KERNEL_CS)
 			pr_cont("{%pS}", (void *)(unsigned long)m->ip);

-- 
2.53.0-Meta


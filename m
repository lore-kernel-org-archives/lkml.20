Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2283AFB0E;
	Mon, 12 Oct 2026 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799167; cv=none; b=cV1l67mh8+eNXH9VKtjdvU+XAE8+86hZeONQmT4vw3O4tcgl48anvpKiHI/E91kpKIb5/YB+r1qGenqmUPBztWOq5xIeX6NrPjFBf4mnbHtUJOoDNM8k/7b2kbI06CybqBOAVYM+KJA6GbecP8DggSKbVW+OdtSKXbKuR5fWth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799167; c=relaxed/simple;
	bh=kHDGld3bbZBO4st/bhhCFDvv5IGQqdeXbSvEKFNE5KM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jxaKTvtTVsJL6UETMTtmDVmb+ju6jpXHC2KR6/HOjwCWdz9PnOg64uAnZNDZzKIBufmv/cO2i/8Rq1wWyEZPBBcgXYYPyiaXYeYDYqAI6sQ3Et+e9d4a8s9KQKgeJZ762bhh2n/JtwGjPPMSoYHK68QsuiVShd/m+dypmmMiq7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pcUJqZC+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+ZmR3NYt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pcUJqZC+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+ZmR3NYt"
Date: Mon, 12 Oct 2026 09:59:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791799163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMejagSKBSd6hkt3qg/sVmB4y+UAVB2JM0xvekxW4B8=;
	b=pcUJqZC+s61SrZnxI1LszILGXCBjczg9xn1azk6Wzu4r6WlvTSDt+fJaaSYP9B7oqFs8wM
	IV6YFVnoE906vxG38cN+9CFhwQCwRmJPI9RCpfJJZBH8kMihWu1UgdtX73e66VXt8h1iYd
	imbWYdSgR0BBqyueWlNJEZYO9eTRQqa2YN8sXi+O9fquSJiEH87Ma23MLa2FLX0jD2DVwU
	IggXk+pFU/WFrPEDMPSTODJlBcs1vGSKjWRAacXYULkYaiDY2U/LXfV/0R9MEkWmVUn5vG
	Qo5pQ+5ADNxICuWyNdcH4dFHdiDXNFthK0No2C89e3Gu8wSXK+TQh1d12cRxAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791799163;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMejagSKBSd6hkt3qg/sVmB4y+UAVB2JM0xvekxW4B8=;
	b=+ZmR3NYtg/Gy1kLVjZwLcJtLWEMaTbxqz0epj7QL3Pbzp6zBtWnNV6R/V664SET20USRty
	mMCXQYQ5+VCbwQAg==
From: "tip-bot2 for Kees Cook" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/core] x86/kcfi: Emit the FineIBT paranoid "cs" prefix as a byte
Cc: Kees Cook <kees@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012090436.1676525-2-kees@kernel.org>
References: <20261012090436.1676525-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179179916185.1914040.13195659522512299324.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/core branch of tip:

Commit-ID:     41d1119e2f8577b4bd01d31321c6761af9140ce7
Gitweb:        https://git.kernel.org/tip/41d1119e2f8577b4bd01d31321c6761af91=
40ce7
Author:        Kees Cook <kees@kernel.org>
AuthorDate:    Mon, 12 Oct 2026 02:04:25 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 12 Oct 2026 11:47:35 +02:00

x86/kcfi: Emit the FineIBT paranoid "cs" prefix as a byte

The "cs" prefix on the LEA in the FineIBT paranoid caller template is
padding: it places the LEA's 0xf0 immediate byte where it doubles as the
LOCK prefix that makes the failing Jcc raise #UD. GNU as warns about it
in every CONFIG_FINEIBT=3Dy build:

  Warning: segment override on `lea' is ineffectual

Clang's integrated assembler does not warn, and both assemble the same
bytes. Emit the prefix with ".byte 0x2e" to silence GNU as.

Build tested ARCH=3Dx86_64 defconfig with CONFIG_CFI=3Dy, with GCC 17.0.0
(experimental, with the kCFI series) and GNU as 2.47, and with Clang
24.0.0git: GNU as no longer warns, and the template assembles to the
same bytes as before with both. Under QEMU with cfi=3Dfineibt,paranoid,
the paranoid caller check catches LKDTM's CFI_FORWARD_PROTO with both.

Assisted-by: LLM
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261012090436.1676525-2-kees@kernel.org
---
 arch/x86/kernel/alternative.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 582c6d8..efbc11f 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1455,7 +1455,8 @@ asm(	".pushsection .rodata				\n"
 	"fineibt_paranoid_start:			\n"
 	"	mov	$0x12345678, %eax		\n"
 	"	cmpl	-11(%r11), %eax			\n"
-	"	cs lea	-0x10(%r11), %r11		\n"
+	"	.byte	0x2e				\n"
+	"	lea	-0x10(%r11), %r11		\n"
 	"#fineibt_caller_size:                          \n"
 	"	jne	fineibt_paranoid_start+0xd	\n"
 	"fineibt_paranoid_ind:				\n"

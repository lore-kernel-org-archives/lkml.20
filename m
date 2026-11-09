Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185806;
	b=tuATAZQhsR4qBqI2rzGx3VjDKVGsT2jUSGistTw0mLssxdDI3GPldRHTrMZxIbMTixOH
	 3qbaP5GYKf36DKV3jo9p7QRZPmYnHp+JWCNJb+9FcvOxd0A6vCCNoYlivb+g36Lx6vPSg
	 GgGSQ2SiZHjmCRI7ami6/PS5c9V0ID7EZkg4F48VnWkRQKObLO3KYZiGeqXvExurfwb6B
	 CTf9crCsIfTbGT4+wan8naYN5SxRXagngHCJgNOnkQIIyBOIOkdHlQkNiQqV4oNvDWef0
	 99jbkMWQcmiJ5tSuYXaxluh/nJ2vYG2JdTa+tziviUEA5aZVMgvbO0npo2IOMejInQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185806;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=HWfE+ig5mI3kE1hdmY/4UN40vjdYohWKcMG6BTMhavo=;
	b=yqK91drB0l8+8EDjrUd4sre6YCXDN3LQMKsw46ngp0ZuXGi0DMfl55f9/fd8DEz1zLkY
	 bp46aL5FOr9kLV8w+dtmKpkCI5+hiQl7qeQt/V3KYBBjQmoH2JSPy2ey0NvS2g2pwn3Qi
	 XUocNp/LAirlDp7tMmHuX4hzlTh2l21LbYqH6mIj6D6upXH7xszO1iiNYeURxoOg+Nunk
	 F6HDsjRSjol7w65HG+EzNZOa6RfKBpfegYKdQOLozgoJ73wdmpPC9gxwqgGX77EpwGY/S
	 tGZvoyw+8gQXDUjnHsepMYTx4wVvi+T+togbEjbuqsABrNCHT6eroIulzl3EqDwqICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxJSkr5p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DF606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxJSkr5p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72FD1F008A3;
	Mon,  9 Nov 2026 00:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185806;
	bh=HWfE+ig5mI3kE1hdmY/4UN40vjdYohWKcMG6BTMhavo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bxJSkr5ptEKEcpbjpL5qz14bIWEgsk8Pl8BsbiZqnyyB9C0W99BpeamA3Y2SNGx0l
	 G3enUzfOgSDAfGWAxFJU6Y2E8F8W7AfzX2HosxHsq9S9TNs3QJ8PVAGmkt7FInAjDz
	 Xp8+AV43ZCQ0KuJwBfvLkjtORRp7sRNlFJIEzHJGoAGNQ7qd6kTCn1JuSwN5QhymNY
	 qk39eWsB/d2NWCvyY5BoGhzkph2td+Myapm9bLhHwpw7E5TgST3rbLcMY5GHQeLBuU
	 aEtvszs+GziM6UZaelM07UsDuQurB/wF5pOAo3PXjJN14IA+9MCqTDS2HKpq7p+IUT
	 /zTMnx+oTlItQ==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Stancek <jstancek@redhat.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v3 4/4] x86/boot/compressed: Enable -Wunused
Date: Mon,  9 Nov 2026 01:55:32 +0100
Message-ID: <20261109005528.3477-10-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109005528.3477-6-blum@kernel.org>
References: <20261109005528.3477-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=blum@kernel.org; h=from:subject; bh=HWfE+ig5mI3kE1hdmY/4UN40vjdYohWKcMG6BTMhavo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfpQQe6ql9lLwuP6/22NNew2xHkZkv1UKuXrmd1TePa /t5vyS1jlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZgIwxWG/x7qH9ImCQlW8ZbN 3VJWIxaufoPfJ5X93wdRO4tltR9DfRkZ+lNfLJ3895Jmw6IOsTc6q3YFOym8Zpt2cdfCZZ+j/V/ XsgMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

arch/x86/boot/compressed/Makefile resets KBUILD_CFLAGS for this
directory, but does not re-enable -Wunused. Therefore, unused variables
and static functions in arch/x86/boot/compressed/ currently do not emit
warnings.

Add -Wunused to warn about these, and -Wno-unused-but-set-variable as
well as -Wno-unused-const-variable to match the W=0 kernel defaults.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 680ad803cba7..3ff75bc2239b 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -29,6 +29,9 @@ KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -fno-jump-tables
 KBUILD_CFLAGS += -Wundef
+KBUILD_CFLAGS += -Wunused
+KBUILD_CFLAGS += -Wno-unused-but-set-variable
+KBUILD_CFLAGS += -Wno-unused-const-variable
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 cflags-$(CONFIG_X86_32) := -march=i386
 cflags-$(CONFIG_X86_64) := -mcmodel=small -mno-red-zone

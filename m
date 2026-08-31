Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA23DDB1F;
	Mon, 31 Aug 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171483; cv=none; b=lrcsBAVsQQkcOGA3V5jm5BhwjiSGRNsHwl5iD2qP7DMW5NfUVDSo5nj97KwL+2H1jbrCGW8LYqRrHMBQDjq4JREto64f/NOgCI93yGE3fTYXheX+imoPTJcmFHApciFXChktWvE/mXsnHYF23SE5/UP5TBYLlpccz8UG0wN4BbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171483; c=relaxed/simple;
	bh=yPVMwCLgnyNe/t3eNvupdQki5tgzzLQWgNOEymae3F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJwrcT8v189Epg74hJ55EW+eYIw1ncAmEOFyccPlKtNjSqx5FHSuYvRYaXiufdpAuOcBuLbC+y00Fe+9LQA0aeyOhKQBEKy2hi8SDX3NPvnqBFHjS+Oy0EWJIXSuTzrEosSBL0p6RDAC9I6BZi3AMLRB3oVvhn0jGbYi5BCXaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbxxkUUh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbxxkUUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A15C1F000E9;
	Mon, 31 Aug 2026 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171481;
	bh=FHVGlNEvFJn/BK7H+YlbY2UWGmJPbcmZFwEi8OkY3qI=;
	h=From:To:Cc:Subject:Date;
	b=TbxxkUUhJBbSVmaYfUYErXLMzqX4gZiWOAuApox7vn7roxbq02+X9e8PKpdYuDaqy
	 xe2kKA3+nvGlB7GZWfxrDGqHLzbf9819Y+iZH9xC//m/q1L7brV5+CNwz6F8eehsTC
	 ATsrTSlONdhvvWtDQS9RAI5V0UR/e8tXNbr4WJVZxMAhxMprOO9LsdMjmpbMTP3p4Q
	 XOXswv28uubZaRBFHLN0FfjB3ZJYLRzQhTRuxOeoIoGpyrLtuvO37yK2BN3LOECWTu
	 Y5V8rFIM6h9e4tp2UbOR7Pnlq26awgFNpiK1m3oEw0meTa+gYBO7FXgFS48gLTiW/A
	 MQlmUNkWdCZ2A==
From: Thorsten Blum <blum@kernel.org>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Jeff Layton <jlayton@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot parameter validation
Date: Mon, 31 Aug 2026 12:16:58 +0200
Message-ID: <20260831101657.2947-5-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=blum@kernel.org; h=from:subject; bh=yPVMwCLgnyNe/t3eNvupdQki5tgzzLQWgNOEymae3F0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlTQ2a+y9efsfTulorN599eM67YP2mp2nRPs6jFF+9EF C82LJDb1lHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATsVViZHhutznNvCEktLpV aaXnX9UT27a/FTk3efMUh8g4w8eXf9gyMpwW+F3x3aS+SVSzXVTonYFGSuMF4VUJCoLHSsPrLZd 94AEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated simple_strtoul() [1] with kstrtouint() when
parsing the vDSO boot parameters. This provides strict input validation,
rejects partial input, and warns when disabling vDSO for invalid values.

Adjust both warnings for consistency and update the documentation.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Thorsten Blum (3):
  x86/vdso: Use kstrtouint() to validate vdso= boot parameter
  x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
  Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note

 Documentation/admin-guide/kernel-parameters.txt |  5 +----
 arch/x86/entry/vdso/vdso32-setup.c              | 10 ++++------
 arch/x86/entry/vdso/vma.c                       |  6 +++++-
 3 files changed, 10 insertions(+), 11 deletions(-)


base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d

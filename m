Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228533;
	b=WE4lX3nROguqoCqpBoMM7seCBpFoeTku7sKStQ35jkIJGtsGKCNgYVDH+aShB35QSvbL
	 /KP2j1Ka1EZRooGwWYLZd6bDBGAxPdi+1tnP1xU9obcL4cXYoVA73P6u1VIgmVI0JXQ+e
	 fpExxRxkIIfQJZbm1rqXlBdaVOWe2d9osFSuXuR5gdOzUP9e10oiTIUkip3fjjxqy54r9
	 4HQJcq5WjsTTXcBT8n0C1vM30A1VUQV6LmSniZga6TWy4qgmNDKINd2v8Qxc8Po7OHaRp
	 SKpE6usIxDs/qbSZEFi8ccBJ/DNZPwaPQPj7CEt+gSmeDipMFr91fVC35IwzBFRRLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228533;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=nZMF3N50ur/GRiqgfnOwgyVXjgdypMZ6MJnhQEab5sQ=;
	b=CvGnN43Z1SXzkJ5oWGG3GmNCqopBfe9KMFawC/LGFSoVoecYzVdFk5v6UyKyhOpnss8x
	 U6HGRDWL7UGHaBA/UfKBtKUmR00AKCAnfzeGRsHeTy+Xmrl873axOM8s+MW8oGUu/Fa2f
	 iDbwr2os1Zn4Lzz6L6Jxc7v8LLlJvFBmfywBOEAgXwwBHRj3k5oxVDFTugpScjbRaeMh7
	 BuomEOCMdFd4NuVuV4NhrvIQXxxg7uMzgyuOefQ+UBvFDV9qKqck67bvn5O+9qqzBir4I
	 7ApMPpB8C7LewsRv4JNUl+oiGvO1t6XxewYVha/De7SIJ1EfybJr+CL5Mw7dpRxeNog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8m72HPy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A825606D830
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8m72HPy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7A31F008A1;
	Mon,  9 Nov 2026 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228533;
	bh=nZMF3N50ur/GRiqgfnOwgyVXjgdypMZ6MJnhQEab5sQ=;
	h=From:To:Cc:Subject:Date;
	b=O8m72HPy/TF1TSwEeqIzTFY2xQ2WH9P3thGWDaKPtf22Wr6ePjRP/5KxXL0aE9+cb
	 IilH9GiVb7H4wgYZiocbgiM+2pyo8vk70dSNu+ELWRDLN96dhL3nCqWJv6geWKtweE
	 ntho3XeCwrwtBZ9O9wozmzMHI4H1lSzaDDJqY7g2rTnxB/0zfNp4oos28wMTfkW+/y
	 Bndr10NVilxzHFfdAgmrvYAGvIqWb2GqMO9xDAM10TOxL4KTXW8N3/6/GAs0cH2Nwb
	 RCqJArZigj+KUeSnlnklsDURFv/sMCCciNB5NjBwKRgOIjinS/MQjijQGXm9fWcZbB
	 Bz+5HJuYq5FHQ==
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
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v4 0/4] x86/boot/compressed: Enable -Wunused and remove unused variables
Date: Mon,  9 Nov 2026 13:48:17 +0100
Message-ID: <20261109124816.61438-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964; i=blum@kernel.org; h=from:subject; bh=rElI/a7Z1x6cmSJbjS57jvhHR3gdAwUo4QJOOt0AF78=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfDwpwtIadmVXMWLzqoX3MH6HqPtfTEXXZsy5NzFv83 GrPGXuujlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiI0iRGhs8G8qGvF0ycaz/1 yrxNMrqSHavbPqS+upM5+/WW2LI5XJ0Mf+WL71vv8AizUMiOy304xWoyi/pUzn1nJb5uZjeRtb5 8nQEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

This series marks potentially unused variables and functions as
__maybe_unused and removes truly unused ones. Patch 4 enables -Wunused,
matching the W=0 kernel defaults. With WERROR=y, the warnings failed as
follows:

  arch/x86/boot/compressed/acpi.c:25:1: error: '__efi_get_rsdp_addr' defined but not used
  arch/x86/boot/compressed/acpi.c:29:6: error: unused variable 'ret'
  arch/x86/boot/compressed/acpi.c:57:15: error: unused variable 'nr_tables'
  arch/x86/boot/compressed/efi.c:64:16: error: unused variable 'et'
  arch/x86/boot/compressed/efi.c:136:6: error: unused variable 'ret'
  arch/x86/boot/compressed/kaslr.c:600:13: error: unused variable 'i'

Patch 2 also drops a redundant efi_get_system_table() call and uses the
existing efi_get_conf_table() error path.

Changes in v4:
- Add a newline to the log message in efi_get_system_table() (Jan)
- Make efi_get_system_table() static and update misc.h (Jan)
- v3: https://lore.kernel.org/r/20261109005528.3477-6-blum@kernel.org/

Changes in v3:
- Rebase patch 4/4
- v2: https://lore.kernel.org/r/20260624120300.590233-6-thorsten.blum@linux.dev/

Changes in v2:
- Fix a kernel test robot issue by marking __efi_get_rsdp_addr() as
  __maybe_unused: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@intel.com/
- v1: https://lore.kernel.org/r/20260621144116.224010-6-thorsten.blum@linux.dev/

Thorsten Blum (4):
  x86/boot/compressed: Remove unused variables in EFI helpers
  x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
  x86/boot/compressed: Mark process_mem_region() index __maybe_unused
  x86/boot/compressed: Enable -Wunused

 arch/x86/boot/compressed/Makefile |  3 +++
 arch/x86/boot/compressed/acpi.c   | 18 ++++--------------
 arch/x86/boot/compressed/efi.c    | 21 +++++++--------------
 arch/x86/boot/compressed/kaslr.c  |  3 ++-
 arch/x86/boot/compressed/misc.h   |  6 ------
 5 files changed, 16 insertions(+), 35 deletions(-)
